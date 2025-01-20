@interface REDuetContextQuery
- (NSSet)devices;
- (NSSet)keyPaths;
- (NSString)name;
- (NSString)registrationID;
- (NSUUID)uuid;
- (REDuetContextQuery)initWithPredicate:(id)a3 remotePredicate:(id)a4 name:(id)a5 evaluationBlock:(id)a6;
- (_CDContextualPredicate)predicate;
- (_CDMDCSContextualPredicate)remotePredicate;
- (id)_keyPathsForDevice:(id)a3;
- (id)_localKeyPaths;
- (id)_localRegistrationWithCallback:(id)a3;
- (id)_remoteRegistrationForDevice:(id)a3 callback:(id)a4;
- (id)_sortedKeyPaths:(id)a3;
- (id)createRegistrationsWithCallback:(id)a3;
- (id)valueFromUserContext:(id)a3;
- (void)setDevices:(id)a3;
@end

@implementation REDuetContextQuery

- (REDuetContextQuery)initWithPredicate:(id)a3 remotePredicate:(id)a4 name:(id)a5 evaluationBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)REDuetContextQuery;
  v15 = [(REDuetContextQuery *)&v25 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_predicate, a3);
    objc_storeStrong((id *)&v16->_remotePredicate, a4);
    uint64_t v17 = [MEMORY[0x263F08C38] UUID];
    uuid = v16->_uuid;
    v16->_uuid = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_name, a5);
    v19 = (void *)MEMORY[0x263EFFA08];
    v20 = +[REDuetContextDevice localDevice];
    v21 = [v19 setWithObject:v20];
    [(REDuetContextQuery *)v16 setDevices:v21];

    uint64_t v22 = MEMORY[0x223C31700](v14);
    id evalBlock = v16->_evalBlock;
    v16->_id evalBlock = (id)v22;
  }
  return v16;
}

- (NSString)registrationID
{
  return (NSString *)[NSString stringWithFormat:@"com.apple.RelevanceEngine.%@", self->_name];
}

- (NSSet)keyPaths
{
  v2 = [(_CDContextualPredicate *)self->_predicate keyPaths];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFFA08] set];
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (id)_localRegistrationWithCallback:(id)a3
{
  id v4 = a3;
  if (v4 && self->_predicate)
  {
    id v5 = get_CDContextualChangeRegistrationClass();
    v6 = [(REDuetContextQuery *)self registrationID];
    predicate = self->_predicate;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__REDuetContextQuery__localRegistrationWithCallback___block_invoke;
    v10[3] = &unk_2644BD8B0;
    id v11 = v4;
    v8 = [v5 localNonWakingRegistrationWithIdentifier:v6 contextualPredicate:predicate callback:v10];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __53__REDuetContextQuery__localRegistrationWithCallback___block_invoke(uint64_t a1)
{
  return 1;
}

- (id)_remoteRegistrationForDevice:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && self->_remotePredicate)
  {
    id v8 = get_CDContextualChangeRegistrationClass();
    v9 = [(REDuetContextQuery *)self registrationID];
    v10 = [v6 identifier];
    id v11 = [v9 stringByAppendingFormat:@".%@", v10];
    remotePredicate = self->_remotePredicate;
    uint64_t v13 = [v6 deviceType];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__REDuetContextQuery__remoteRegistrationForDevice_callback___block_invoke;
    v16[3] = &unk_2644BD8D8;
    id v17 = v7;
    id v14 = [v8 registrationWithIdentifier:v11 contextualPredicate:remotePredicate deviceTypes:v13 clientIdentifier:@"com.apple.RelevanceEngine" mustWake:0 callback:v16];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

uint64_t __60__REDuetContextQuery__remoteRegistrationForDevice_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createRegistrationsWithCallback:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CoreDuetContextLibraryCore();
  id v6 = (void *)MEMORY[0x263EFFA68];
  if (v4 && v5)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(REDuetContextQuery *)self devices];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = [v12 identifier];

          if (v13) {
            [(REDuetContextQuery *)self _remoteRegistrationForDevice:v12 callback:v4];
          }
          else {
          id v14 = [(REDuetContextQuery *)self _localRegistrationWithCallback:v4];
          }
          if (v14) {
            [v6 addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (id)_keyPathsForDevice:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(REDuetContextQuery *)self keyPaths];
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v24 = 0;
        objc_super v25 = &v24;
        uint64_t v26 = 0x2050000000;
        id v11 = (void *)get_CDContextualKeyPathClass_softClass;
        uint64_t v27 = get_CDContextualKeyPathClass_softClass;
        if (!get_CDContextualKeyPathClass_softClass)
        {
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __get_CDContextualKeyPathClass_block_invoke;
          v23[3] = &unk_2644BC768;
          v23[4] = &v24;
          __get_CDContextualKeyPathClass_block_invoke((uint64_t)v23);
          id v11 = (void *)v25[3];
        }
        id v12 = v11;
        _Block_object_dispose(&v24, 8);
        uint64_t v13 = [v4 identifier];
        id v14 = [v13 UUIDString];
        v15 = [v12 remoteKeyPathForKeyPath:v10 forDeviceID:v14];
        [v6 addObject:v15];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v7);
  }

  long long v16 = [(REDuetContextQuery *)self _sortedKeyPaths:v6];

  return v16;
}

- (id)_localKeyPaths
{
  v3 = [(REDuetContextQuery *)self keyPaths];
  id v4 = [v3 allObjects];
  uint64_t v5 = [(REDuetContextQuery *)self _sortedKeyPaths:v4];

  return v5;
}

- (id)_sortedKeyPaths:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_60];
}

uint64_t __38__REDuetContextQuery__sortedKeyPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 key];
  id v6 = [v4 key];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)setDevices:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (NSSet *)a3;
  uint64_t v5 = self->_devices;
  if (v5 == v4)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(NSSet *)v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = (NSSet *)[(NSSet *)v4 copy];
      devices = self->_devices;
      self->_devices = v8;

      uint64_t v10 = [MEMORY[0x263EFF980] array];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = self->_devices;
      uint64_t v12 = [(NSSet *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            long long v17 = objc_msgSend(v16, "identifier", (void)v21);

            if (v17)
            {
              long long v18 = [(REDuetContextQuery *)self _keyPathsForDevice:v16];
              [v10 addObject:v18];
            }
            else
            {
              long long v18 = [(REDuetContextQuery *)self _localKeyPaths];
              [v10 insertObject:v18 atIndex:0];
            }
          }
          uint64_t v13 = [(NSSet *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v13);
      }

      long long v19 = (NSArray *)[v10 copy];
      searchKeyPaths = self->_searchKeyPaths;
      self->_searchKeyPaths = v19;
    }
  }
}

- (id)valueFromUserContext:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_evalBlock)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v6 = [(REDuetContextQuery *)self keyPaths];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v12 = [v11 key];
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v8);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = self->_searchKeyPaths;
    uint64_t v31 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v31)
    {
      v28 = self;
      uint64_t v30 = *(void *)v38;
      while (1)
      {
        uint64_t v13 = 0;
LABEL_12:
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v13;
        uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8 * v13);
        v15 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v16 = v14;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (!v17) {
          break;
        }
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
LABEL_16:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v34 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v33 + 1) + 8 * v20);
          uint64_t v22 = [v4 objectForContextualKeyPath:v21];
          if (!v22) {
            break;
          }
          long long v23 = (void *)v22;
          long long v24 = [v21 key];
          objc_super v25 = [v5 objectForKeyedSubscript:v24];

          if (v25) {
            [v15 setObject:v23 forKeyedSubscript:v25];
          }

          if (v18 == ++v20)
          {
            uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
            if (v18) {
              goto LABEL_16;
            }
            goto LABEL_28;
          }
        }

        uint64_t v13 = v32 + 1;
        if (v32 + 1 != v31) {
          goto LABEL_12;
        }
        uint64_t v26 = 0;
        uint64_t v31 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (!v31) {
          goto LABEL_31;
        }
      }
LABEL_28:

      uint64_t v26 = (*((void (**)(void))v28->_evalBlock + 2))();
    }
    else
    {
      uint64_t v26 = 0;
    }
LABEL_31:
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

- (NSSet)devices
{
  return self->_devices;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)name
{
  return self->_name;
}

- (_CDContextualPredicate)predicate
{
  return self->_predicate;
}

- (_CDMDCSContextualPredicate)remotePredicate
{
  return self->_remotePredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePredicate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong(&self->_evalBlock, 0);
  objc_storeStrong((id *)&self->_searchKeyPaths, 0);
}

@end