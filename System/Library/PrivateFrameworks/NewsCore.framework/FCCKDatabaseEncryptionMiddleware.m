@interface FCCKDatabaseEncryptionMiddleware
- (id)_clientZoneIDFromServerZoneID:(void *)a3 error:;
- (id)_decryptedRecordIDWithOriginalRecordID:(void *)a3 withEncryptionKey:(void *)a4 mapping:(void *)a5 error:;
- (id)_encryptedRecordIDWithOriginalRecordID:(void *)a3 withEncryptionKey:(void *)a4 mapping:(void *)a5 error:;
- (id)_encryptionKeyForClientRecordID:(void *)a3 inDatabase:;
- (id)_serverZoneIDFromClientZoneID:(uint64_t)a3 database:(void *)a4 error:;
- (id)clientToServerRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)clientToServerRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)clientToServerRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6;
- (id)clientToServerRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)clientToServerRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)initWithEncryptionSchema:(void *)a3 recordNameCipher:;
- (id)serverToClientRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)serverToClientRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)serverToClientRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6;
- (id)serverToClientRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (id)serverToClientRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5;
- (void)_encryptionKeyForServerRecordID:(void *)a3 inDatabase:;
@end

@implementation FCCKDatabaseEncryptionMiddleware

- (id)initWithEncryptionSchema:(void *)a3 recordNameCipher:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)FCCKDatabaseEncryptionMiddleware;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      if (!v7) {
        -[FCCKPrivateDatabaseSchema enumerateZoneSchemasWithBlock:]((uint64_t)v6, &__block_literal_global_87);
      }
    }
  }

  return a1;
}

void __78__FCCKDatabaseEncryptionMiddleware_initWithEncryptionSchema_recordNameCipher___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2 && *(unsigned char *)(a2 + 8) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"a record name cipher is required for a schema with record name encryption"];
    int v3 = 136315906;
    v4 = "-[FCCKDatabaseEncryptionMiddleware initWithEncryptionSchema:recordNameCipher:]_block_invoke";
    __int16 v5 = 2080;
    id v6 = "FCCKDatabaseEncryptionMiddleware.m";
    __int16 v7 = 1024;
    int v8 = 60;
    __int16 v9 = 2114;
    objc_super v10 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);
  }
}

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  __int16 v7 = (uint64_t *)a3;
  id v8 = a4;
  __int16 v9 = v8;
  if (!v7
    || !*((unsigned char *)v7 + 10)
    || v7[5] > 0
    || (v7[1] & 1) == 0
    || (-[CKDatabaseOperation fc_canBypassEncryptionRequirement](v8) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fc_encryptionRequiredError");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v10 = 1;
  }

  return v10;
}

- (id)clientToServerRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return -[FCCKDatabaseEncryptionMiddleware _serverZoneIDFromClientZoneID:database:error:]((uint64_t)self, a3, (uint64_t)a4, a5);
}

- (id)_serverZoneIDFromClientZoneID:(uint64_t)a3 database:(void *)a4 error:
{
  id v7 = a2;
  id v8 = v7;
  if (a1)
  {
    id v9 = v7;
    int64_t v10 = (FCCKRecordZoneIDMapping *)*(id *)(a1 + 8);
    uint64_t v11 = v10;
    if (a3) {
      uint64_t v12 = *(void *)(a3 + 40);
    }
    else {
      uint64_t v12 = 0;
    }
    v13 = -[FCCKPrivateDatabaseSchema mappingFromRecordZoneID:toVersion:](v10, v9, v12);

    if ([v13 hasChanges])
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1A320]);
      uint64_t v15 = [v13 toZoneSchema];
      v16 = (void *)v15;
      if (v15) {
        v17 = *(void **)(v15 + 16);
      }
      else {
        v17 = 0;
      }
      id v18 = v17;
      v19 = [v9 ownerName];
      uint64_t v20 = [v14 initWithZoneName:v18 ownerName:v19];

      id v9 = (id)v20;
    }
    if (a4) {
      *a4 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)serverToClientRecordZoneID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  return -[FCCKDatabaseEncryptionMiddleware _clientZoneIDFromServerZoneID:error:]((uint64_t)self, a3, a5);
}

- (id)_clientZoneIDFromServerZoneID:(void *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    id v7 = v5;
    id v8 = -[FCCKPrivateDatabaseSchema mappingFromRecordZoneID:toVersion:](*(FCCKRecordZoneIDMapping **)(a1 + 8), v7, 0);
    if ([v8 hasChanges])
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1A320]);
      uint64_t v10 = [v8 toZoneSchema];
      uint64_t v11 = (void *)v10;
      if (v10) {
        uint64_t v12 = *(void **)(v10 + 16);
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;
      id v14 = [v7 ownerName];
      uint64_t v15 = [v9 initWithZoneName:v13 ownerName:v14];

      id v7 = (id)v15;
    }
    if (a3) {
      *a3 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)clientToServerRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = -[FCCKDatabaseEncryptionMiddleware _encryptionKeyForClientRecordID:inDatabase:]((uint64_t)self, v9, v8);
  if (self) {
    encryptionSchema = self->_encryptionSchema;
  }
  else {
    encryptionSchema = 0;
  }
  uint64_t v12 = encryptionSchema;
  if (v8) {
    uint64_t v13 = v8[5];
  }
  else {
    uint64_t v13 = 0;
  }

  id v14 = -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)v12, v9, v13);

  id v19 = 0;
  uint64_t v15 = -[FCCKDatabaseEncryptionMiddleware _encryptedRecordIDWithOriginalRecordID:withEncryptionKey:mapping:error:]((uint64_t)self, v9, v10, v14, &v19);

  id v16 = v19;
  if (v15) {
    id v17 = v15;
  }
  if (a5) {
    *a5 = v16;
  }

  return v15;
}

- (id)_encryptionKeyForClientRecordID:(void *)a3 inDatabase:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = *(id *)(a1 + 8);
    id v7 = a2;
    if (v5) {
      uint64_t v8 = v5[5];
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)v6, v7, v8);

    uint64_t v10 = [v9 toZoneSchema];
    uint64_t v12 = (void *)v10;
    if (v10 && *(unsigned char *)(v10 + 10))
    {
      if (v5)
      {
        ptrdiff_t v13 = 56;
LABEL_10:
        id Property = objc_getProperty(v5, v11, v13, 1);
LABEL_11:
        id v15 = Property;

        goto LABEL_12;
      }
    }
    else if (v5)
    {
      ptrdiff_t v13 = 48;
      goto LABEL_10;
    }
    id Property = 0;
    goto LABEL_11;
  }
  id v15 = 0;
LABEL_12:

  return v15;
}

- (id)_encryptedRecordIDWithOriginalRecordID:(void *)a3 withEncryptionKey:(void *)a4 mapping:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = v11;
  if (!a1)
  {
    v44 = 0;
    goto LABEL_27;
  }
  ptrdiff_t v13 = [v11 toRecordName];
  id v14 = [v12 fromRecordName];
  char v15 = [v13 isEqualToString:v14];

  if (v15)
  {
    id v16 = [v12 toZoneSchema];
    id v17 = [v12 toRecordName];
    if (!v16 || ([v16[4] containsObject:v17] & 1) == 0)
    {
      id v18 = [v12 toZoneSchema];
      id v19 = v18;
      if (v18 && v18[8])
      {
        uint64_t v20 = [v12 fromZoneSchema];
        if (!v20)
        {

          goto LABEL_9;
        }
        int v21 = v20[8];

        if (!v21)
        {
LABEL_9:
          id v22 = *(id *)(a1 + 16);
          v23 = [v9 recordName];
          v24 = [v22 encryptRecordName:v23 withKey:v10];

          if (v24)
          {
            id v47 = 0;
            int v25 = [MEMORY[0x1E4F1A2F8] isValidRecordName:v24 outError:&v47];
            id v26 = v47;
            id v46 = 0;
            if (v25) {
              id v46 = v24;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "fc_encryptionErrorWithCode:descriptionFormat:", 2, @"Cipher failed to encrypt record name: %@", 0);
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            id v46 = 0;
          }

          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
LABEL_17:
    id v46 = [v9 recordName];
    id v26 = 0;
    goto LABEL_18;
  }
  v27 = (void *)MEMORY[0x1E4F1A2F8];
  v28 = [v12 toRecordName];
  id v48 = 0;
  int v29 = [v27 isValidRecordName:v28 outError:&v48];
  id v26 = v48;

  if (v29)
  {
    id v46 = [v12 toRecordName];
  }
  else
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    v31 = [v12 toRecordName];
    uint64_t v32 = objc_msgSend(v30, "fc_encryptionErrorWithCode:descriptionFormat:", 4, @"Record name is invalid: %@", v31);

    id v46 = 0;
    id v26 = (id)v32;
  }
LABEL_18:
  id v33 = objc_alloc(MEMORY[0x1E4F1A320]);
  v34 = v12;
  uint64_t v35 = [v12 toZoneSchema];
  v36 = (void *)v35;
  id v37 = v10;
  if (v35) {
    v38 = *(void **)(v35 + 16);
  }
  else {
    v38 = 0;
  }
  id v39 = v38;
  id v40 = v9;
  v41 = [v9 zoneID];
  v42 = [v41 ownerName];
  v43 = (void *)[v33 initWithZoneName:v39 ownerName:v42];

  if (a5) {
    *a5 = v26;
  }
  v44 = 0;
  id v10 = v37;
  if (v46)
  {
    id v9 = v40;
    uint64_t v12 = v34;
    if (v43) {
      v44 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v46 zoneID:v43];
    }
  }
  else
  {
    id v9 = v40;
    uint64_t v12 = v34;
  }

LABEL_27:
  return v44;
}

- (id)serverToClientRecordID:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = -[FCCKDatabaseEncryptionMiddleware _encryptionKeyForServerRecordID:inDatabase:](self, v8, a4);
  if (self) {
    encryptionSchema = self->_encryptionSchema;
  }
  else {
    encryptionSchema = 0;
  }
  id v11 = -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)encryptionSchema, v8, 0);
  id v16 = 0;
  uint64_t v12 = -[FCCKDatabaseEncryptionMiddleware _decryptedRecordIDWithOriginalRecordID:withEncryptionKey:mapping:error:]((uint64_t)self, v8, v9, v11, &v16);

  id v13 = v16;
  if (v12) {
    id v14 = v12;
  }
  if (a5) {
    *a5 = v13;
  }

  return v12;
}

- (void)_encryptionKeyForServerRecordID:(void *)a3 inDatabase:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = -[FCCKPrivateDatabaseSchema schemaForZoneContainingRecordID:](a1[1], a2);
    id v8 = (void *)v6;
    if (v6 && *(unsigned char *)(v6 + 10))
    {
      if (v5)
      {
        ptrdiff_t v9 = 56;
LABEL_8:
        id Property = objc_getProperty(v5, v7, v9, 1);
LABEL_9:
        a1 = (void **)Property;

        goto LABEL_10;
      }
    }
    else if (v5)
    {
      ptrdiff_t v9 = 48;
      goto LABEL_8;
    }
    id Property = 0;
    goto LABEL_9;
  }
LABEL_10:

  return a1;
}

- (id)_decryptedRecordIDWithOriginalRecordID:(void *)a3 withEncryptionKey:(void *)a4 mapping:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = v11;
  if (!a1)
  {
    v44 = 0;
    goto LABEL_27;
  }
  id v13 = [v11 toRecordName];
  id v14 = [v12 fromRecordName];
  char v15 = [v13 isEqualToString:v14];

  if (v15)
  {
    id v16 = [v12 fromZoneSchema];
    id v17 = [v12 fromRecordName];
    if (!v16 || ([v16[4] containsObject:v17] & 1) == 0)
    {
      id v18 = [v12 fromZoneSchema];
      id v19 = v18;
      if (v18 && v18[8])
      {
        uint64_t v20 = [v12 toZoneSchema];
        if (!v20)
        {

          goto LABEL_9;
        }
        int v21 = v20[8];

        if (!v21)
        {
LABEL_9:
          id v22 = *(id *)(a1 + 16);
          v23 = [v9 recordName];
          v24 = [v22 decryptRecordName:v23 withKey:v10];

          if (v24)
          {
            id v47 = 0;
            int v25 = [MEMORY[0x1E4F1A2F8] isValidRecordName:v24 outError:&v47];
            id v26 = v47;
            id v46 = 0;
            if (v25) {
              id v46 = v24;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "fc_encryptionErrorWithCode:descriptionFormat:", 2, @"Cipher failed to decrypt record name: %@", 0);
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            id v46 = 0;
          }

          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
LABEL_17:
    id v46 = [v9 recordName];
    id v26 = 0;
    goto LABEL_18;
  }
  v27 = (void *)MEMORY[0x1E4F1A2F8];
  v28 = [v12 toRecordName];
  id v48 = 0;
  int v29 = [v27 isValidRecordName:v28 outError:&v48];
  id v26 = v48;

  if (v29)
  {
    id v46 = [v12 toRecordName];
  }
  else
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    v31 = [v12 toRecordName];
    uint64_t v32 = objc_msgSend(v30, "fc_encryptionErrorWithCode:descriptionFormat:", 4, @"Record name is invalid: %@", v31);

    id v46 = 0;
    id v26 = (id)v32;
  }
LABEL_18:
  id v33 = objc_alloc(MEMORY[0x1E4F1A320]);
  v34 = v12;
  uint64_t v35 = [v12 toZoneSchema];
  v36 = (void *)v35;
  id v37 = v10;
  if (v35) {
    v38 = *(void **)(v35 + 16);
  }
  else {
    v38 = 0;
  }
  id v39 = v38;
  id v40 = v9;
  v41 = [v9 zoneID];
  v42 = [v41 ownerName];
  v43 = (void *)[v33 initWithZoneName:v39 ownerName:v42];

  if (a5) {
    *a5 = v26;
  }
  v44 = 0;
  id v10 = v37;
  if (v46)
  {
    id v9 = v40;
    uint64_t v12 = v34;
    if (v43) {
      v44 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v46 zoneID:v43];
    }
  }
  else
  {
    id v9 = v40;
    uint64_t v12 = v34;
  }

LABEL_27:
  return v44;
}

- (id)clientToServerRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (self) {
    encryptionSchema = self->_encryptionSchema;
  }
  else {
    encryptionSchema = 0;
  }
  uint64_t v12 = encryptionSchema;
  id v13 = v12;
  if (v9) {
    uint64_t v14 = v9[5];
  }
  else {
    uint64_t v14 = 0;
  }
  char v15 = -[FCCKPrivateDatabaseSchema mappingFromRecord:toVersion:](v12, v10, v14);

  if ([v15 hasChanges])
  {
    id v16 = (void *)[v10 copy];
    id v17 = [v10 recordID];
    id v18 = -[FCCKDatabaseEncryptionMiddleware _encryptionKeyForClientRecordID:inDatabase:]((uint64_t)self, v17, v9);

    id v96 = v16;
    id v19 = v18;
    id v20 = v15;
    v95 = v20;
    if (self)
    {
      v89 = self;
      v90 = v15;
      v94 = v19;
      int v21 = v20;
      if (!v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v88 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "mapping");
        *(_DWORD *)v112 = 136315906;
        v113 = "-[FCCKDatabaseEncryptionMiddleware _encryptRecord:withEncryptionKey:mapping:error:]";
        __int16 v114 = 2080;
        v115 = "FCCKDatabaseEncryptionMiddleware.m";
        __int16 v116 = 1024;
        int v117 = 339;
        __int16 v118 = 2114;
        v119 = v88;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v112, 0x26u);
      }
      v91 = a5;
      id v92 = v10;
      v93 = v9;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v22 = v96;
      v23 = [v96 allKeys];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v101 objects:v112 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        id v26 = 0;
        uint64_t v27 = *(void *)v102;
        v97 = v23;
        uint64_t v98 = *(void *)v102;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v102 != v27) {
              objc_enumerationMutation(v23);
            }
            int v29 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            v30 = [v21 toRecordSchema];
            BOOL v31 = -[FCCKRecordSchema isFieldKnown:]((uint64_t)v30, (uint64_t)v29);

            if (v31)
            {
              uint64_t v32 = [v21 toRecordSchema];
              BOOL v33 = -[FCCKRecordSchema isFieldEncrypted:]((uint64_t)v32, (uint64_t)v29);

              if (v33)
              {
                id v34 = v29;
                id v35 = v22;
                v36 = v35;
                v100 = v26;
                if (v34)
                {
                  id v37 = [v35 valueStore];
                  v38 = [v37 changedKeysSet];
                  int v39 = [v38 containsObject:v34];

                  if (v39)
                  {
                    id v40 = [v36 valueStore];
                    v41 = [v40 changedKeysSet];
                    [v41 removeObject:v34];

                    v42 = [v36 encryptedValueStore];
                    v43 = [v42 changedKeysSet];
                    [v43 addObject:v34];
                  }
                  v44 = [v36 valueStore];
                  v45 = [v44 values];
                  id v46 = [v45 objectForKey:v34];

                  if (v46)
                  {
                    id v47 = (void *)[objc_alloc(MEMORY[0x1E4F19FA0]) initWithValue:v46];
                    if (v47)
                    {
                      id v48 = [v36 valueStore];
                      v49 = [v48 values];
                      [v49 removeObjectForKey:v34];

                      v50 = [v36 encryptedValueStore];
                      v51 = [v50 values];
                      [v51 setObject:v47 forKey:v34];

                      v52 = 0;
                      int v53 = 1;
                    }
                    else
                    {
                      v58 = (void *)MEMORY[0x1E4F28C58];
                      v50 = [v36 recordType];
                      v52 = objc_msgSend(v58, "fc_encryptionErrorWithCode:descriptionFormat:", 3, @"CKRecord failed to serialize value {%@.%@, %@}", v50, v34, v46);
                      int v53 = 0;
                    }
                    int v99 = v53;

                    v23 = v97;
                  }
                  else
                  {
                    v52 = 0;
                    int v99 = 1;
                  }
                  v59 = [v36 valueStore];
                  v60 = [v59 originalValues];
                  v61 = [v60 objectForKey:v34];

                  if (v61)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v62 = [v36 valueStore];
                      v63 = [v62 originalValues];
                      [v63 removeObjectForKey:v34];

                      v64 = [v36 encryptedValueStore];
                      v65 = [v64 originalValues];
                      [v65 setObject:v61 forKey:v34];
                    }
                    else
                    {
                      v64 = (void *)[objc_alloc(MEMORY[0x1E4F19FA0]) initWithValue:v61];
                      if (v64)
                      {
                        v66 = [v36 valueStore];
                        v67 = [v66 originalValues];
                        [v67 removeObjectForKey:v34];

                        v65 = [v36 encryptedValueStore];
                        v68 = [v65 originalValues];
                        [v68 setObject:v64 forKey:v34];
                      }
                      else
                      {
                        v69 = (void *)MEMORY[0x1E4F28C58];
                        v65 = [v36 recordType];
                        objc_msgSend(v69, "fc_encryptionErrorWithCode:descriptionFormat:", 3, @"CKRecord failed to serialize original value {%@.%@, %@}", v65, v34, v46);
                        int v99 = 0;
                        v52 = v68 = v52;
                      }
                    }
                    id v22 = v96;
                    v23 = v97;
                  }
                  else
                  {
                    id v22 = v96;
                  }

                  BOOL v57 = v99 != 0;
                  int v21 = v95;
                }
                else
                {
                  v52 = 0;
                  BOOL v57 = 1;
                }
                id v70 = v52;

                id v71 = v70;
                if (!v57)
                {
                  int v74 = 0;
                  id v10 = v92;
                  id v9 = v93;
                  char v15 = v90;
                  a5 = v91;
                  id v19 = v94;
                  goto LABEL_53;
                }
                id v26 = v71;
                uint64_t v27 = v98;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              id v54 = [NSString alloc];
              v55 = [v22 recordType];
              v56 = (void *)[v54 initWithFormat:@"Client record field is missing from the schema: %@.%@", v55, v29];
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "-[FCCKDatabaseEncryptionMiddleware _encryptRecord:withEncryptionKey:mapping:error:]";
              __int16 v106 = 2080;
              v107 = "FCCKDatabaseEncryptionMiddleware.m";
              __int16 v108 = 1024;
              int v109 = 359;
              __int16 v110 = 2114;
              v111 = v56;
              _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: UnknownRecordField) : %s %s:%d %{public}@", buf, 0x26u);
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v101 objects:v112 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v26 = 0;
      }

      v75 = [v22 recordID];
      v76 = [v21 recordIDMapping];
      *(void *)buf = v26;
      v77 = v26;
      id v19 = v94;
      uint64_t v78 = -[FCCKDatabaseEncryptionMiddleware _encryptedRecordIDWithOriginalRecordID:withEncryptionKey:mapping:error:]((uint64_t)v89, v75, v94, v76, buf);
      id v71 = *(id *)buf;

      if (v78)
      {
        v97 = (void *)v78;
        [v22 setRecordID:v78];
        uint64_t v79 = [v21 toRecordSchema];
        v80 = (void *)v79;
        a5 = v91;
        id v10 = v92;
        char v15 = v90;
        if (v79) {
          v81 = *(void **)(v79 + 16);
        }
        else {
          v81 = 0;
        }
        id v82 = v81;
        [v22 setRecordType:v82];

        int v74 = 1;
        id v9 = v93;
      }
      else
      {
        v97 = 0;
        int v74 = 1;
        id v10 = v92;
        id v9 = v93;
        char v15 = v90;
        a5 = v91;
      }
LABEL_53:

      id v83 = v71;
    }
    else
    {
      id v83 = 0;
      int v74 = 0;
    }

    id v72 = v83;
    id v73 = v10;
    if (v74)
    {
      id v73 = v96;
    }
    if (a5)
    {
      if (v72 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        id v85 = [NSString alloc];
        v86 = [v10 recordType];
        v87 = (void *)[v85 initWithFormat:@"Failed to encrypt record of type %@ with error: %@", v86, v72];
        *(_DWORD *)v112 = 136315906;
        v113 = "-[FCCKDatabaseEncryptionMiddleware clientToServerRecord:inDatabase:error:]";
        __int16 v114 = 2080;
        v115 = "FCCKDatabaseEncryptionMiddleware.m";
        __int16 v116 = 1024;
        int v117 = 216;
        __int16 v118 = 2114;
        v119 = v87;
        _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: RecordEncryptionFailure) : %s %s:%d %{public}@", v112, 0x26u);
      }
      goto LABEL_60;
    }
  }
  else
  {
    id v72 = 0;
    id v73 = v10;
    if (a5)
    {
LABEL_60:
      id v72 = v72;
      *a5 = v72;
    }
  }

  return v73;
}

- (id)serverToClientRecord:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (self) {
    encryptionSchema = self->_encryptionSchema;
  }
  else {
    encryptionSchema = 0;
  }
  uint64_t v12 = -[FCCKPrivateDatabaseSchema mappingFromRecord:toVersion:]((FCCKRecordZoneIDMapping *)encryptionSchema, v10, 0);
  if ([v12 hasChanges])
  {
    id v13 = (void *)[v10 copy];
    uint64_t v14 = [v10 recordID];
    char v15 = -[FCCKDatabaseEncryptionMiddleware _encryptionKeyForServerRecordID:inDatabase:](self, v14, v9);

    id v16 = v13;
    id v17 = v15;
    id v18 = v12;
    v91 = v16;
    id v85 = self;
    if (self)
    {
      id v89 = v9;
      v90 = v17;
      v86 = v12;
      v87 = a5;
      id v88 = v10;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v19 = [v16 allKeys];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v98 objects:v109 count:16];
      int v21 = v16;
      if (v20)
      {
        uint64_t v22 = v20;
        v23 = 0;
        uint64_t v24 = *(void *)v99;
        id v92 = v19;
        uint64_t v93 = *(void *)v99;
        while (2)
        {
          uint64_t v25 = 0;
          uint64_t v94 = v22;
          do
          {
            if (*(void *)v99 != v24) {
              objc_enumerationMutation(v19);
            }
            id v26 = *(void **)(*((void *)&v98 + 1) + 8 * v25);
            uint64_t v27 = [v18 fromRecordSchema];
            BOOL v28 = -[FCCKRecordSchema isFieldKnown:]((uint64_t)v27, (uint64_t)v26);

            if (v28)
            {
              int v29 = [v18 fromRecordSchema];
              BOOL v30 = -[FCCKRecordSchema isFieldEncrypted:]((uint64_t)v29, (uint64_t)v26);

              if (v30)
              {
                id v31 = v26;
                id v32 = v21;
                BOOL v33 = v32;
                if (v31)
                {
                  id v34 = [v32 encryptedValueStore];
                  id v35 = [v34 changedKeysSet];
                  int v36 = [v35 containsObject:v31];

                  if (v36)
                  {
                    id v37 = [v33 encryptedValueStore];
                    v38 = [v37 changedKeysSet];
                    [v38 removeObject:v31];

                    int v39 = [v33 valueStore];
                    id v40 = [v39 changedKeysSet];
                    [v40 addObject:v31];
                  }
                  v41 = [v33 encryptedValueStore];
                  v42 = [v41 values];
                  v43 = [v42 objectForKey:v31];

                  v95 = v43;
                  id v96 = v23;
                  if (v43)
                  {
                    v44 = [v43 value];
                    if (v44)
                    {
                      v45 = [v33 encryptedValueStore];
                      id v46 = [v45 values];
                      [v46 removeObjectForKey:v31];

                      id v47 = [v33 valueStore];
                      id v48 = [v47 values];
                      [v48 setObject:v44 forKey:v31];

                      v49 = 0;
                      int v97 = 1;
                    }
                    else
                    {
                      id v54 = (void *)MEMORY[0x1E4F28C58];
                      id v47 = [v33 recordType];
                      v49 = objc_msgSend(v54, "fc_encryptionErrorWithCode:descriptionFormat:", 3, @"CKRecord failed to deserialize value {%@.%@}", v47, v31);
                      int v97 = 0;
                    }
                  }
                  else
                  {
                    v49 = 0;
                    int v97 = 1;
                  }
                  v55 = [v33 encryptedValueStore];
                  v56 = [v55 originalValues];
                  BOOL v57 = [v56 objectForKey:v31];

                  if (v57)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v58 = [v33 encryptedValueStore];
                      v59 = [v58 originalValues];
                      [v59 removeObjectForKey:v31];

                      v60 = [v33 valueStore];
                      v61 = [v60 originalValues];
                      [v61 setObject:v57 forKey:v31];
                    }
                    else
                    {
                      v62 = (objc_class *)objc_opt_class();
                      v60 = FCCheckedDynamicCast(v62, (uint64_t)v57);
                      v61 = [v60 value];
                      if (v61)
                      {
                        v63 = [v33 encryptedValueStore];
                        v64 = [v63 originalValues];
                        [v64 removeObjectForKey:v31];

                        v65 = [v33 valueStore];
                        v66 = [v65 originalValues];
                        [v66 setObject:v61 forKey:v31];
                      }
                      else
                      {
                        v67 = (void *)MEMORY[0x1E4F28C58];
                        v65 = [v33 recordType];
                        objc_msgSend(v67, "fc_encryptionErrorWithCode:descriptionFormat:", 3, @"CKRecord failed to deserialize original value {%@.%@}", v65, v31);
                        int v97 = 0;
                        v49 = v66 = v49;
                      }

                      int v21 = v91;
                    }
                  }
                  BOOL v53 = v97 != 0;
                  id v19 = v92;
                  v23 = v96;
                }
                else
                {
                  v49 = 0;
                  BOOL v53 = 1;
                }
                id v68 = v49;

                id v69 = v68;
                if (!v53)
                {
                  int v72 = 0;
                  id v10 = v88;
                  id v9 = v89;
                  uint64_t v12 = v86;
                  a5 = v87;
                  id v17 = v90;
                  goto LABEL_48;
                }
                v23 = v69;
                uint64_t v24 = v93;
                uint64_t v22 = v94;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              id v50 = [NSString alloc];
              v51 = [v21 recordType];
              v52 = (void *)[v50 initWithFormat:@"Server record field is missing from the schema: %@.%@", v51, v26, v85];
              *(_DWORD *)buf = 136315906;
              *(void *)&buf[4] = "-[FCCKDatabaseEncryptionMiddleware _decryptRecord:withEncryptionKey:mapping:error:]";
              __int16 v103 = 2080;
              long long v104 = "FCCKDatabaseEncryptionMiddleware.m";
              __int16 v105 = 1024;
              int v106 = 574;
              __int16 v107 = 2114;
              __int16 v108 = v52;
              _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: UnknownRecordField) : %s %s:%d %{public}@", buf, 0x26u);
            }
            ++v25;
          }
          while (v22 != v25);
          uint64_t v22 = [v19 countByEnumeratingWithState:&v98 objects:v109 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
      else
      {
        v23 = 0;
      }

      id v73 = [v21 recordID];
      int v74 = [v18 recordIDMapping];
      *(void *)buf = v23;
      id v17 = v90;
      uint64_t v75 = -[FCCKDatabaseEncryptionMiddleware _decryptedRecordIDWithOriginalRecordID:withEncryptionKey:mapping:error:]((uint64_t)v85, v73, v90, v74, buf);
      id v69 = *(id *)buf;

      if (v75)
      {
        id v92 = (void *)v75;
        [v21 setRecordID:v75];
        uint64_t v76 = [v18 toRecordSchema];
        v77 = (void *)v76;
        a5 = v87;
        id v10 = v88;
        if (v76) {
          uint64_t v78 = *(void **)(v76 + 16);
        }
        else {
          uint64_t v78 = 0;
        }
        id v79 = v78;
        [v21 setRecordType:v79];

        int v72 = 1;
        id v9 = v89;
      }
      else
      {
        id v92 = 0;
        int v72 = 1;
        id v10 = v88;
        id v9 = v89;
        a5 = v87;
      }
      uint64_t v12 = v86;
LABEL_48:

      id v80 = v69;
    }
    else
    {
      id v80 = 0;
      int v72 = 0;
    }

    id v70 = v80;
    id v71 = v10;
    if (v72)
    {
      id v71 = v91;
    }
    if (a5)
    {
      if (v70 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        id v82 = [NSString alloc];
        id v83 = [v10 recordType];
        v84 = (void *)[v82 initWithFormat:@"Failed to decrypt record of type %@ with error: %@", v83, v70];
        *(_DWORD *)int v109 = 136315906;
        __int16 v110 = "-[FCCKDatabaseEncryptionMiddleware serverToClientRecord:inDatabase:error:]";
        __int16 v111 = 2080;
        v112 = "FCCKDatabaseEncryptionMiddleware.m";
        __int16 v113 = 1024;
        int v114 = 245;
        __int16 v115 = 2114;
        __int16 v116 = v84;
        _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: RecordDecryptionFailure) : %s %s:%d %{public}@", v109, 0x26u);
      }
      goto LABEL_55;
    }
  }
  else
  {
    id v70 = 0;
    id v71 = v10;
    if (a5)
    {
LABEL_55:
      id v70 = v70;
      *a5 = v70;
    }
  }

  return v71;
}

- (id)clientToServerRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (uint64_t)a4;
  id v10 = [v8 zoneID];
  id v11 = -[FCCKDatabaseEncryptionMiddleware _serverZoneIDFromClientZoneID:database:error:]((uint64_t)self, v10, v9, a5);

  uint64_t v12 = [v8 zoneID];
  LOBYTE(v9) = [v11 isEqual:v12];

  id v13 = v8;
  if ((v9 & 1) == 0)
  {
    id v13 = (void *)[v8 copy];

    [v13 setZoneID:v11];
  }
  if (a5) {
    *a5 = 0;
  }

  return v13;
}

- (id)serverToClientRecordZone:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [v7 zoneID];
  id v15 = 0;
  uint64_t v9 = -[FCCKDatabaseEncryptionMiddleware _clientZoneIDFromServerZoneID:error:]((uint64_t)self, v8, &v15);
  id v10 = v15;

  id v11 = [v7 zoneID];
  char v12 = [v9 isEqual:v11];

  id v13 = v7;
  if ((v12 & 1) == 0)
  {
    id v13 = (void *)[v7 copy];

    [v13 setZoneID:v9];
  }
  if (a5) {
    *a5 = v10;
  }

  return v13;
}

- (id)clientToServerRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  id v10 = a3;
  if (self) {
    encryptionSchema = self->_encryptionSchema;
  }
  else {
    encryptionSchema = 0;
  }
  char v12 = encryptionSchema;
  id v13 = a5;
  uint64_t v14 = [a4 zoneID];
  if (v13) {
    uint64_t v15 = v13[5];
  }
  else {
    uint64_t v15 = 0;
  }

  id v16 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneID:toVersion:](v12, v10, v14, v15);

  id v17 = v10;
  if ([v16 hasChanges])
  {
    uint64_t v18 = [v16 toRecordSchema];
    id v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = *(void **)(v18 + 16);
    }
    else {
      uint64_t v20 = 0;
    }
    id v17 = v20;
  }
  if (a6) {
    *a6 = 0;
  }

  return v17;
}

- (id)serverToClientRecordType:(id)a3 withRecordID:(id)a4 inDatabase:(id)a5 error:(id *)a6
{
  id v9 = a3;
  if (self) {
    encryptionSchema = self->_encryptionSchema;
  }
  else {
    encryptionSchema = 0;
  }
  id v11 = encryptionSchema;
  char v12 = [a4 zoneID];
  id v13 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneID:toVersion:](v11, v9, v12, 0);

  id v14 = v9;
  if ([v13 hasChanges])
  {
    uint64_t v15 = [v13 toRecordSchema];
    id v16 = (void *)v15;
    if (v15) {
      id v17 = *(void **)(v15 + 16);
    }
    else {
      id v17 = 0;
    }
    id v14 = v17;
  }
  if (a6) {
    *a6 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordNameCipher, 0);
  objc_storeStrong((id *)&self->_encryptionSchema, 0);
}

@end