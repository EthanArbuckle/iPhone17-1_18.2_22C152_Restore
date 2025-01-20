@interface PPInternalContactNameRecord
- (PPInternalContactNameRecord)initWithIdentifier:(id)a3 score:(double)a4 source:(unsigned __int8)a5 sourceIdentifier:(id)a6 changeType:(unsigned __int8)a7 firstName:(id)a8 phoneticFirstName:(id)a9 middleName:(id)a10 phoneticMiddleName:(id)a11 lastName:(id)a12 phoneticLastName:(id)a13 organizationName:(id)a14 jobTitle:(id)a15 nickname:(id)a16 relatedNames:(id)a17 streetNames:(id)a18 cityNames:(id)a19;
- (PPInternalContactNameRecord)initWithPBContactNameRecord:(id)a3;
- (double)score;
- (id)cityNames;
- (id)clientCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstName;
- (id)identifier;
- (id)jobTitle;
- (id)lastName;
- (id)localizedFullName;
- (id)middleName;
- (id)nickname;
- (id)organizationName;
- (id)pbRecord;
- (id)phoneticFirstName;
- (id)phoneticLastName;
- (id)phoneticMiddleName;
- (id)relatedNames;
- (id)sourceIdentifier;
- (id)streetNames;
- (unsigned)changeType;
- (unsigned)source;
- (void)setScore:(double)a3;
@end

@implementation PPInternalContactNameRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedFullName, 0);
  objc_storeStrong((id *)&self->_pbRecord, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PPInternalContactNameRecord alloc];
  v5 = (void *)[(PPPBContactNameRecord *)self->_pbRecord copy];
  v6 = [(PPInternalContactNameRecord *)v4 initWithPBContactNameRecord:v5];

  return v6;
}

- (id)localizedFullName
{
  localizedFullName = self->_localizedFullName;
  if (!localizedFullName)
  {
    v4 = objc_opt_new();
    v5 = [(PPPBContactNameRecord *)self->_pbRecord firstName];
    v6 = [(PPPBContactNameRecord *)self->_pbRecord middleName];
    v7 = [(PPPBContactNameRecord *)self->_pbRecord lastName];
    v8 = [(PPPBContactNameRecord *)self->_pbRecord nickname];
    if (v5) {
      [v4 setGivenName:v5];
    }
    if (v6) {
      [v4 setMiddleName:v6];
    }
    if (v7) {
      [v4 setFamilyName:v7];
    }
    if (v8) {
      [v4 setNickname:v8];
    }
    [v4 setContactType:0];
    v9 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
    v10 = self->_localizedFullName;
    self->_localizedFullName = v9;

    localizedFullName = self->_localizedFullName;
  }
  return localizedFullName;
}

- (id)pbRecord
{
  return self->_pbRecord;
}

- (id)cityNames
{
  return [(PPPBContactNameRecord *)self->_pbRecord cityNames];
}

- (id)streetNames
{
  return [(PPPBContactNameRecord *)self->_pbRecord streetNames];
}

- (id)relatedNames
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v4 = [(PPPBContactNameRecord *)self->_pbRecord relatedNames];
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(PPPBContactNameRecord *)self->_pbRecord relatedNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 key];
        if (v12)
        {
          v13 = (void *)v12;
          v14 = [v11 value];

          if (v14)
          {
            v15 = [v11 value];
            v16 = [v11 key];
            [v5 setObject:v15 forKeyedSubscript:v16];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)nickname
{
  return [(PPPBContactNameRecord *)self->_pbRecord nickname];
}

- (id)jobTitle
{
  return [(PPPBContactNameRecord *)self->_pbRecord jobTitle];
}

- (id)organizationName
{
  return [(PPPBContactNameRecord *)self->_pbRecord organizationName];
}

- (id)phoneticLastName
{
  return [(PPPBContactNameRecord *)self->_pbRecord phoneticLastName];
}

- (id)lastName
{
  return [(PPPBContactNameRecord *)self->_pbRecord lastName];
}

- (id)phoneticMiddleName
{
  return [(PPPBContactNameRecord *)self->_pbRecord phoneticMiddleName];
}

- (id)middleName
{
  return [(PPPBContactNameRecord *)self->_pbRecord middleName];
}

- (id)phoneticFirstName
{
  return [(PPPBContactNameRecord *)self->_pbRecord phoneticFirstName];
}

- (id)firstName
{
  return [(PPPBContactNameRecord *)self->_pbRecord firstName];
}

- (id)sourceIdentifier
{
  return [(PPPBContactNameRecord *)self->_pbRecord sourceIdentifier];
}

- (unsigned)changeType
{
  return [(PPPBContactNameRecord *)self->_pbRecord changeType];
}

- (unsigned)source
{
  return [(PPPBContactNameRecord *)self->_pbRecord source];
}

- (void)setScore:(double)a3
{
}

- (double)score
{
  [(PPPBContactNameRecord *)self->_pbRecord score];
  return result;
}

- (id)identifier
{
  return [(PPPBContactNameRecord *)self->_pbRecord identifier];
}

- (id)clientCopy
{
  id v21 = objc_alloc(MEMORY[0x1E4F89DD8]);
  uint64_t v23 = [(PPInternalContactNameRecord *)self identifier];
  [(PPInternalContactNameRecord *)self score];
  double v4 = v3;
  unsigned int v20 = [(PPInternalContactNameRecord *)self source];
  long long v19 = [(PPInternalContactNameRecord *)self sourceIdentifier];
  unsigned int v18 = [(PPInternalContactNameRecord *)self changeType];
  v17 = [(PPInternalContactNameRecord *)self firstName];
  v16 = [(PPInternalContactNameRecord *)self phoneticFirstName];
  v15 = [(PPInternalContactNameRecord *)self middleName];
  v14 = [(PPInternalContactNameRecord *)self phoneticMiddleName];
  v13 = [(PPInternalContactNameRecord *)self lastName];
  v5 = [(PPInternalContactNameRecord *)self phoneticLastName];
  v6 = [(PPInternalContactNameRecord *)self organizationName];
  uint64_t v7 = [(PPInternalContactNameRecord *)self jobTitle];
  uint64_t v8 = [(PPInternalContactNameRecord *)self nickname];
  uint64_t v9 = [(PPInternalContactNameRecord *)self relatedNames];
  v10 = [(PPInternalContactNameRecord *)self streetNames];
  v11 = [(PPInternalContactNameRecord *)self cityNames];
  v22 = objc_msgSend(v21, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v23, v20, v19, v18, v17, v16, v4, v15, v14, v13, v5, v6, v7, v8, v9, v10,
                  v11);

  return v22;
}

- (PPInternalContactNameRecord)initWithPBContactNameRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPInternalContactNameRecord;
  v6 = [(PPContactNameRecord *)&v9 init_];
  uint64_t v7 = (PPInternalContactNameRecord *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

- (PPInternalContactNameRecord)initWithIdentifier:(id)a3 score:(double)a4 source:(unsigned __int8)a5 sourceIdentifier:(id)a6 changeType:(unsigned __int8)a7 firstName:(id)a8 phoneticFirstName:(id)a9 middleName:(id)a10 phoneticMiddleName:(id)a11 lastName:(id)a12 phoneticLastName:(id)a13 organizationName:(id)a14 jobTitle:(id)a15 nickname:(id)a16 relatedNames:(id)a17 streetNames:(id)a18 cityNames:(id)a19
{
  unsigned int v52 = a7;
  unsigned int v50 = a5;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v24 = a6;
  id v25 = a8;
  id v26 = a9;
  id v63 = a10;
  id v27 = a11;
  id v62 = a12;
  id v61 = a13;
  v28 = v23;
  id v60 = a14;
  id v29 = a15;
  id v30 = a16;
  id v31 = a17;
  id v59 = a18;
  id v32 = a19;
  v68.receiver = self;
  v68.super_class = (Class)PPInternalContactNameRecord;
  v33 = [(PPContactNameRecord *)&v68 init_];
  if (v33)
  {
    uint64_t v34 = objc_opt_new();
    id v58 = v27;
    pbRecord = v33->_pbRecord;
    v33->_pbRecord = (PPPBContactNameRecord *)v34;

    [(PPPBContactNameRecord *)v33->_pbRecord setIdentifier:v28];
    [(PPPBContactNameRecord *)v33->_pbRecord setScore:a4];
    [(PPPBContactNameRecord *)v33->_pbRecord setSource:v50];
    id v54 = v24;
    [(PPPBContactNameRecord *)v33->_pbRecord setSourceIdentifier:v24];
    [(PPPBContactNameRecord *)v33->_pbRecord setChangeType:v52];
    [(PPPBContactNameRecord *)v33->_pbRecord setFirstName:v25];
    id v56 = v26;
    [(PPPBContactNameRecord *)v33->_pbRecord setPhoneticFirstName:v26];
    [(PPPBContactNameRecord *)v33->_pbRecord setMiddleName:v63];
    [(PPPBContactNameRecord *)v33->_pbRecord setPhoneticMiddleName:v27];
    [(PPPBContactNameRecord *)v33->_pbRecord setLastName:v62];
    [(PPPBContactNameRecord *)v33->_pbRecord setPhoneticLastName:v61];
    [(PPPBContactNameRecord *)v33->_pbRecord setOrganizationName:v60];
    id v55 = v29;
    [(PPPBContactNameRecord *)v33->_pbRecord setJobTitle:v29];
    [(PPPBContactNameRecord *)v33->_pbRecord setNickname:v30];
    id v51 = v31;
    id v53 = v30;
    id v36 = v24;
    if ([v31 count])
    {
      v49 = v28;
      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v31, "count"));
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v38 = v31;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v65 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            v44 = objc_opt_new();
            [v44 setKey:v43];
            v45 = [v38 objectForKeyedSubscript:v43];
            [v44 setValue:v45];

            [v37 addObject:v44];
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v64 objects:v69 count:16];
        }
        while (v40);
      }

      [(PPPBContactNameRecord *)v33->_pbRecord setRelatedNames:v37];
      v28 = v49;
      id v36 = v54;
    }
    id v24 = v36;
    if (objc_msgSend(v59, "count", v49))
    {
      v46 = (void *)[v59 mutableCopy];
      [(PPPBContactNameRecord *)v33->_pbRecord setStreetNames:v46];
    }
    else
    {
      [(PPPBContactNameRecord *)v33->_pbRecord setStreetNames:0];
    }
    id v27 = v58;
    if ([v32 count])
    {
      v47 = (void *)[v32 mutableCopy];
      [(PPPBContactNameRecord *)v33->_pbRecord setCityNames:v47];
    }
    else
    {
      [(PPPBContactNameRecord *)v33->_pbRecord setCityNames:0];
    }
    id v26 = v56;
    id v29 = v55;
    id v31 = v51;
    id v30 = v53;
  }

  return v33;
}

@end