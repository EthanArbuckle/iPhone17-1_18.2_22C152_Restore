@interface SUUILocalizedStringDictionary
- (NSString)localeName;
- (SUUILocalizedStringDictionary)initWithLocaleName:(id)a3 bundles:(id)a4;
- (id)_stringTableForBundle:(id)a3 tableName:(id)a4;
- (id)localizedStringForKey:(id)a3;
- (id)localizedStringForKey:(id)a3 inTable:(id)a4;
@end

@implementation SUUILocalizedStringDictionary

- (SUUILocalizedStringDictionary)initWithLocaleName:(id)a3 bundles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SUUILocalizedStringDictionary;
  v8 = [(SUUILocalizedStringDictionary *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    bundles = v8->_bundles;
    v8->_bundles = (NSArray *)v9;

    uint64_t v11 = [v6 copy];
    localeName = v8->_localeName;
    v8->_localeName = (NSString *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    stringTables = v8->_stringTables;
    v8->_stringTables = v13;
  }
  return v8;
}

- (id)localizedStringForKey:(id)a3 inTable:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = @"Localizable";
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v9 = self->_bundles;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
LABEL_6:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v30 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = [(SUUILocalizedStringDictionary *)self _stringTableForBundle:*(void *)(*((void *)&v29 + 1) + 8 * v13) tableName:v8];
      v15 = [v14 localizedStringForKey:v6];

      if (v15) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v11) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = self->_bundles;
    uint64_t v16 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
LABEL_14:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v19), "localizedStringForKey:value:table:", v6, &stru_2704F8130, v8, (void)v25);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v15 = v20;
        if (v20 && v20 != v6) {
          break;
        }

        if (v17 == ++v19)
        {
          uint64_t v17 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v17) {
            goto LABEL_14;
          }
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      v15 = 0;
    }
  }

  if (v15) {
    v22 = v15;
  }
  else {
    v22 = v6;
  }
  id v23 = v22;

  return v23;
}

- (id)_stringTableForBundle:(id)a3 tableName:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = self->_stringTables;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      objc_msgSend(v13, "bundle", (void)v19);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v6)
      {
        v15 = [v13 tableName];
        char v16 = [v15 isEqualToString:v7];

        if (v16)
        {
          uint64_t v17 = v13;

          if (v17) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
      }
      else
      {
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

LABEL_13:
  uint64_t v17 = [[SUUILocalizedStringTable alloc] initWithBundle:v6 localeName:self->_localeName tableName:v7];
  [(NSMutableArray *)self->_stringTables addObject:v17];
LABEL_14:

  return v17;
}

- (id)localizedStringForKey:(id)a3
{
  return [(SUUILocalizedStringDictionary *)self localizedStringForKey:a3 inTable:0];
}

- (NSString)localeName
{
  return self->_localeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeName, 0);
  objc_storeStrong((id *)&self->_stringTables, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

@end