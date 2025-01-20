@interface PPContactNameRecordChangeHistoryAccumulator
- (PPInternalContactNameRecord)_nameRecordWithContactIdentifier:(unsigned int)a3 changeType:;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation PPContactNameRecordChangeHistoryAccumulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)visitDeleteContactEvent:(id)a3
{
  if (!self->_truncated)
  {
    v4 = [a3 contactIdentifier];
    -[PPContactNameRecordChangeHistoryAccumulator _nameRecordWithContactIdentifier:changeType:]((uint64_t)self, v4, 3u);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      [(NSMutableArray *)self->_records addObject:v6];
      v5 = v6;
    }
  }
}

- (PPInternalContactNameRecord)_nameRecordWithContactIdentifier:(unsigned int)a3 changeType:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  if (a1)
  {
    if (a3 == 3)
    {
      unsigned int v27 = 3;
      v5 = 0;
      id v26 = 0;
    }
    else
    {
      id v6 = *(void **)(a1 + 8);
      uint64_t v7 = *(void *)(a1 + 16);
      id v31 = 0;
      v5 = [v6 unifiedContactWithIdentifier:v30 keysToFetch:v7 error:&v31];
      id v8 = v31;
      v9 = v8;
      if (!v5)
      {
        v16 = pp_contacts_log_handle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v33 = v30;
          __int16 v34 = 2112;
          v35 = v9;
          _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "unifiedContactWithIdentifier failed for id: %@ error: %@", buf, 0x16u);
        }
        v28 = 0;
        v5 = 0;
        goto LABEL_7;
      }
      unsigned int v27 = a3;
      id v26 = v8;
    }
    v24 = [PPInternalContactNameRecord alloc];
    v25 = [MEMORY[0x1E4F29128] UUID];
    v23 = [v25 UUIDString];
    v22 = [v5 givenName];
    v21 = [v5 phoneticGivenName];
    v29 = [v5 middleName];
    v20 = [v5 phoneticMiddleName];
    v19 = [v5 familyName];
    v10 = [v5 phoneticFamilyName];
    v11 = [v5 organizationName];
    v18 = [v5 jobTitle];
    v12 = [v5 nickname];
    v13 = PPRelatedNamesForContact(v5);
    v14 = PPStreetNamesForContact(v5);
    v15 = PPCityNamesForContact(v5);
    v28 = -[PPInternalContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:](v24, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v23, 1, v30, v27, v22, v21, 0.0, v29, v20, v19, v10, v11, v18, v12, v13, v14,
            v15);

    v16 = v25;
    v9 = v26;
LABEL_7:

    goto LABEL_8;
  }
  v28 = 0;
LABEL_8:

  return v28;
}

- (void)visitUpdateContactEvent:(id)a3
{
  if (!self->_truncated)
  {
    v4 = [a3 contact];
    v5 = [v4 identifier];
    -[PPContactNameRecordChangeHistoryAccumulator _nameRecordWithContactIdentifier:changeType:]((uint64_t)self, v5, 2u);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = v7;
    if (v7)
    {
      [(NSMutableArray *)self->_records addObject:v7];
      id v6 = v7;
    }
  }
}

- (void)visitAddContactEvent:(id)a3
{
  if (!self->_truncated)
  {
    v4 = [a3 contact];
    v5 = [v4 identifier];
    -[PPContactNameRecordChangeHistoryAccumulator _nameRecordWithContactIdentifier:changeType:]((uint64_t)self, v5, 1u);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = v7;
    if (v7)
    {
      [(NSMutableArray *)self->_records addObject:v7];
      id v6 = v7;
    }
  }
}

- (void)visitDropEverythingEvent:(id)a3
{
  self->_truncated = 1;
}

@end