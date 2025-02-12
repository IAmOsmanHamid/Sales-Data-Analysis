#!/usr/bin/env python
# coding: utf-8

# # Project Name: Hospital Data Cleaning using Python
# ## Performed by: Osman Hamid
# ## Last Updated: 12 Feb 2025
# ### Dependencies: Python, MySQL, Pandas, Matplotlib, MySQL_Connector, SQLAlchemy, Jupyter notebook

# In[ ]:


# inctall dependencies
get_ipython().system('pip install pandas matplotlib mysql-connector-python SQLAlchemy mysqlclient')


# In[2]:


# import dependencies
import pandas as pd
import matplotlib.pyplot as plt
    


# In[3]:


from sqlalchemy import create_engine,text

engine = create_engine('mysql://root:hakuna#%404MATATA@localhost/hospital_analysis')

with engine.connect() as cur:
    result = cur.execute(text("show tables"))

    tables = result.fetchall()
    for i in tables:
        print(i)


# In[4]:


# create doctors dataframe    
doctorquery = "select * from doctors where 1"
doctor_df = pd.read_sql(doctorquery,engine)

print(doctor_df)


# In[6]:


# create patients dataframe    
patientsquery = "select * from patients where 1"
patients_df = pd.read_sql(patientsquery,engine)

print(patients_df)


# In[56]:


# create medical_records dataframe    
mrquery = "select * from medical_records where 1"
mr_df = pd.read_sql(mrquery,engine)

print(mr_df)


# # Dataframe info

# In[57]:


print(doctor_df.info())
print('---------')
print(patients_df.info())
print('---------')
print(mr_df.info())


# # check null values

# In[19]:


print(doctor_df.isnull().sum())
print("Total Nulls: ",doctor_df.isnull().sum().sum())


# In[18]:


print(patients_df.isnull().sum())
print("Total Nulls: ",patients_df.isnull().sum().sum())


# In[58]:


print(mr_df.isnull().sum())
print("Total Nulls: ",mr_df.isnull().sum().sum())


# # Total reocrds in each data frame

# In[24]:


print("doctor Dataframe total length:",len(doctor_df))
print("Record Dataframe total length:",len(mr_df))
print("Patient Dataframe total length:",len(patients_df))


# # total percentage of null values in each dataframe

# In[27]:


print('-----------Doctors DF-------------')
print((doctor_df.isnull().sum() / len(doctor_df))*100)
print('-----------Records DF-------------')
print((mr_df.isnull().sum() / len(mr_df))*100)
print('-----------Patients DF-------------')
print((patients_df.isnull().sum() / len(patients_df))*100)


# # Get stats for numerical cols using describe()

# In[30]:


print(doctor_df.describe())
print(mr_df.describe())
print(patients_df.describe())


# # Check Records with Null Values

# In[32]:


mr_df[mr_df.isnull().any(axis=1)]


# In[33]:


doctor_df[doctor_df.isnull().any(axis=1)]


# In[34]:


patients_df[patients_df.isnull().any(axis=1)]


# In[37]:


# updating empty email with demo emails
doctor_df = doctor_df.fillna({'email':'test@mail.com'})


# In[45]:


# updating empty columsn in patients_df
patients_df = patients_df.fillna({'date_of_birth':'1947-01-01'})
patients_df = patients_df.fillna({'emergency_contact':'9876543210'})
patients_df = patients_df.fillna({'address':'India'})
patients_df


# In[64]:


# updating empty columsn in medical record df
mr_df = mr_df.fillna({'blood_pressure':'120/80'})

mr_df['weight'] = mr_df['weight'].fillna(mr_df['weight'].mean())
mr_df = mr_df.fillna({'follow_up_date':'2025-1-1'})
mr_df = mr_df.fillna({'prescribed_medicines':'Paracetamol 650mg'})


# In[65]:


mr_df


# In[67]:


mr_df['prescribed_medicines'].isna().sum()


# In[68]:


doctor_df


# # Correcting non numeric values in contact_number column for doctor_df

# In[89]:


# find total non numbers in dataframe
doctor_df['contact_number'] = doctor_df['contact_number'].replace(to_replace=r'\D+',value=0,regex=True)


# In[90]:


# checkong updated values
doctor_df['contact_number']


# In[71]:


patients_df


# In[92]:


patients_df['contact_number'] = patients_df['contact_number'].replace(to_replace=r'\D+',value=0,regex=True)


# In[93]:


# checking updated contact_number column
patients_df['contact_number']


# In[96]:


# transforming text to upper case for gender and blood_group columns
patients_df['gender'] = patients_df['gender'].str.upper()
patients_df['blood_group'] = patients_df['blood_group'].str.upper()


# In[97]:


# checking updated data
patients_df


# In[72]:


mr_df


# In[106]:


# convert invalid blood_pressure reading to 0 using regex
mr_df['blood_pressure'] = mr_df['blood_pressure'].replace(to_replace=r'^(?!\d{3}/\d{2})',value=0,regex=True)

'''
r'^(?!\d{3}/\d{2})'

this regex pattern matches anything that doesn't match the pattern of 3 digits / 2 digits

- \d{3} matches 3 adjecent digits like 123 or 150
- \d{2} matches 2 adjecent digits
- / matches the / special character
- (?!...) is a negation of follwed regex code
'''


# In[107]:


mr_df


# In[117]:


# converting negative value to positive
mr_df['temperature'] = mr_df['temperature'].abs()
mr_df['weight'] = mr_df['weight'].abs()


# In[118]:


mr_df


# In[122]:


mr_df['weight'] = mr_df['weight'].round(3)


# In[123]:


mr_df


# # Converting date columns to datetime datatype

# In[125]:


# mr_df['visit_date']
mr_df['follow_up_date']


# In[127]:


mr_df['follow_up_date'] = pd.to_datetime(mr_df['follow_up_date'])
mr_df['follow_up_date']


# In[129]:


patients_df['date_of_birth'] = pd.to_datetime(patients_df['date_of_birth'])
patients_df['date_of_birth']


# In[131]:


doctor_df['joining_date'] = pd.to_datetime(doctor_df['joining_date'])
doctor_df['joining_date']


# # Data is cleaned and ready for analysis

# In[133]:


import matplotlib.pyplot as plt


# In[152]:


# checking gender count in patients
# p_gen = patients_df['gender'].values.tolist()
# p_gen = patients_df['gender'].value_counts()
# print(p_gen)

patients_df['gender'].value_counts().plot(kind='bar',color='#af50ff')
plt.title('Gender Count in Patients')
plt.xlabel('Gender')
plt.ylabel('Total Count')
plt.show()


# In[164]:


# Blood Group Grouping in Patients
patients_df['blood_group'].value_counts().plot(kind='barh',color='#50afff')
plt.title('Blood Group Count in Patients')
plt.ylabel('blood_group')
plt.xlabel('Total Count')
plt.show()


# In[168]:


# Average Doctor Fee

doctor_df['consultation_fee'].mean().round(3)


# In[169]:


# average years  of experience

doctor_df['years_experience'].mean().round(3)


# In[173]:


# Average weight in medical record
mr_df['weight'].mean().round(3)


# In[174]:


# Average Body Temprature
mr_df['temperature'].mean().round(3)


# In[178]:


# Average Bill amount
mr_df['bill_amount'].mean().round(2)


# In[182]:


# payment status graph
mr_df['payment_status'].value_counts().plot(kind='barh', color='g')
plt.title('payment status graph')
plt.ylabel('Payment status')
plt.xlabel('Total Count')
plt.plot()


# In[185]:


# mr_df
# patients_df
doctor_df


# In[ ]:





# In[ ]:




