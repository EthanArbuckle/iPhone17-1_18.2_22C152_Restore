@interface PPClientContactNameRecord
- (PPClientContactNameRecord)initWithIdentifier:(id)a3 score:(double)a4 source:(unsigned __int8)a5 sourceIdentifier:(id)a6 changeType:(unsigned __int8)a7 firstName:(id)a8 phoneticFirstName:(id)a9 middleName:(id)a10 phoneticMiddleName:(id)a11 lastName:(id)a12 phoneticLastName:(id)a13 organizationName:(id)a14 jobTitle:(id)a15 nickname:(id)a16 relatedNames:(id)a17 streetNames:(id)a18 cityNames:(id)a19;
- (double)score;
- (id)cityNames;
- (id)firstName;
- (id)identifier;
- (id)jobTitle;
- (id)lastName;
- (id)middleName;
- (id)nickname;
- (id)organizationName;
- (id)phoneticFirstName;
- (id)phoneticLastName;
- (id)phoneticMiddleName;
- (id)relatedNames;
- (id)sourceIdentifier;
- (id)streetNames;
- (unsigned)changeType;
- (unsigned)source;
@end

@implementation PPClientContactNameRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNames, 0);
  objc_storeStrong((id *)&self->_streetNames, 0);
  objc_storeStrong((id *)&self->_relatedNames, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)cityNames
{
  return self->_cityNames;
}

- (id)streetNames
{
  return self->_streetNames;
}

- (id)relatedNames
{
  return self->_relatedNames;
}

- (id)nickname
{
  return self->_nickname;
}

- (id)jobTitle
{
  return self->_jobTitle;
}

- (id)organizationName
{
  return self->_organizationName;
}

- (id)phoneticLastName
{
  return self->_phoneticLastName;
}

- (id)lastName
{
  return self->_lastName;
}

- (id)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (id)middleName
{
  return self->_middleName;
}

- (id)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (id)firstName
{
  return self->_firstName;
}

- (id)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (unsigned)source
{
  return self->_source;
}

- (double)score
{
  return self->_score;
}

- (id)identifier
{
  return self->_identifier;
}

- (PPClientContactNameRecord)initWithIdentifier:(id)a3 score:(double)a4 source:(unsigned __int8)a5 sourceIdentifier:(id)a6 changeType:(unsigned __int8)a7 firstName:(id)a8 phoneticFirstName:(id)a9 middleName:(id)a10 phoneticMiddleName:(id)a11 lastName:(id)a12 phoneticLastName:(id)a13 organizationName:(id)a14 jobTitle:(id)a15 nickname:(id)a16 relatedNames:(id)a17 streetNames:(id)a18 cityNames:(id)a19
{
  id v44 = a3;
  id v43 = a6;
  id v34 = a8;
  id v42 = a8;
  id v41 = a9;
  id v40 = a10;
  id v39 = a11;
  id v38 = a12;
  id v37 = a13;
  id v36 = a14;
  id v23 = a15;
  id v24 = a16;
  id v25 = a17;
  id v26 = a18;
  id v27 = a19;
  v45.receiver = self;
  v45.super_class = (Class)PPClientContactNameRecord;
  v28 = [(PPContactNameRecord *)&v45 init_];
  v29 = (PPClientContactNameRecord *)v28;
  if (v28)
  {
    objc_storeStrong(v28 + 1, a3);
    v29->_score = a4;
    v29->_source = a5;
    objc_storeStrong((id *)&v29->_sourceIdentifier, a6);
    v29->_changeType = a7;
    objc_storeStrong((id *)&v29->_firstName, v34);
    objc_storeStrong((id *)&v29->_phoneticFirstName, a9);
    objc_storeStrong((id *)&v29->_middleName, a10);
    objc_storeStrong((id *)&v29->_phoneticMiddleName, a11);
    objc_storeStrong((id *)&v29->_lastName, a12);
    objc_storeStrong((id *)&v29->_phoneticLastName, a13);
    objc_storeStrong((id *)&v29->_organizationName, a14);
    objc_storeStrong((id *)&v29->_jobTitle, a15);
    objc_storeStrong((id *)&v29->_nickname, a16);
    objc_storeStrong((id *)&v29->_relatedNames, a17);
    objc_storeStrong((id *)&v29->_streetNames, a18);
    objc_storeStrong((id *)&v29->_cityNames, a19);
  }

  return v29;
}

@end