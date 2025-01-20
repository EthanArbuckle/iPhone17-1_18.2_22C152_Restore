@interface _NTKDComplicationCollectionManifest
+ (id)emptyManifest;
- (BOOL)addKey:(id)a3 supportForSampleTemplateForFamily:(int64_t)a4;
- (BOOL)removeSampleTemplatesForKey:(id)a3;
- (_NTKDComplicationCollectionManifest)init;
- (_NTKDComplicationCollectionManifest)initWithContentsOfFile:(id)a3;
- (id)clientIds;
- (id)complicationDescriptorIdentifiersForClientIdentifier:(id)a3;
- (id)familiesWithSampleTemplateForKey:(id)a3;
- (void)setClientId:(id)a3 supportForComplicationDescriptorIdentifiers:(id)a4;
- (void)writeToFile:(id)a3 atomically:(BOOL)a4;
@end

@implementation _NTKDComplicationCollectionManifest

+ (id)emptyManifest
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (_NTKDComplicationCollectionManifest)init
{
  v10.receiver = self;
  v10.super_class = (Class)_NTKDComplicationCollectionManifest;
  id v2 = [(_NTKDComplicationCollectionManifest *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    clients = v2->_clients;
    v2->_clients = (NSMutableSet *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    clientToSampleTemplateFamilies = v2->_clientToSampleTemplateFamilies;
    v2->_clientToSampleTemplateFamilies = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    clientToComplicationDescriptorIdentifiers = v2->_clientToComplicationDescriptorIdentifiers;
    v2->_clientToComplicationDescriptorIdentifiers = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (id)clientIds
{
  return [(NSMutableSet *)self->_clients allObjects];
}

- (id)familiesWithSampleTemplateForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_clientToSampleTemplateFamilies objectForKey:a3];
}

- (id)complicationDescriptorIdentifiersForClientIdentifier:(id)a3
{
  return [(NSMutableDictionary *)self->_clientToComplicationDescriptorIdentifiers objectForKey:a3];
}

- (BOOL)addKey:(id)a3 supportForSampleTemplateForFamily:(int64_t)a4
{
  id v6 = a3;
  clients = self->_clients;
  v8 = [v6 clientIdentifier];
  [(NSMutableSet *)clients addObject:v8];

  v9 = [(NSMutableDictionary *)self->_clientToSampleTemplateFamilies objectForKey:v6];
  if (!v9)
  {
    v9 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->_clientToSampleTemplateFamilies setObject:v9 forKey:v6];
  }
  objc_super v10 = +[NSNumber numberWithInteger:a4];
  unsigned __int8 v11 = [v9 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    v12 = +[NSNumber numberWithInteger:a4];
    [v9 addObject:v12];
  }
  return v11 ^ 1;
}

- (void)setClientId:(id)a3 supportForComplicationDescriptorIdentifiers:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(NSMutableSet *)self->_clients addObject:v9];
  clientToComplicationDescriptorIdentifiers = self->_clientToComplicationDescriptorIdentifiers;
  if (v6)
  {
    id v8 = [v6 copy];
    [(NSMutableDictionary *)clientToComplicationDescriptorIdentifiers setObject:v8 forKey:v9];
  }
  else
  {
    [(NSMutableDictionary *)clientToComplicationDescriptorIdentifiers removeObjectForKey:v9];
  }
}

- (BOOL)removeSampleTemplatesForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_clientToSampleTemplateFamilies objectForKey:v4];

  if (v5)
  {
    id v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 clientIdentifier];
      id v8 = [v4 complicationIdentifier];
      int v10 = 138412546;
      unsigned __int8 v11 = v7;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_NTKDComplicationCollectionManifest, removing sample data for %@, %@", (uint8_t *)&v10, 0x16u);
    }
    [(NSMutableDictionary *)self->_clientToSampleTemplateFamilies removeObjectForKey:v4];
  }

  return v5 != 0;
}

- (_NTKDComplicationCollectionManifest)initWithContentsOfFile:(id)a3
{
  id v26 = a3;
  id v4 = [(_NTKDComplicationCollectionManifest *)self init];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v26];
    if (v5)
    {
      id v6 = v5;
      objc_opt_class();
      objc_opt_class();
      NTKValidateDictionary();
      id v25 = v6;
      v30 = [v6 objectForKey:@"ClientToComplicationDescriptorIdentifiers"];
      if (v30)
      {
        objc_opt_class();
        objc_opt_class();
        NTKValidateDictionary();
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v7 = [v30 allKeys];
        id v8 = [v7 countByEnumeratingWithState:&v37 objects:v44 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v38;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v38 != v9) {
                objc_enumerationMutation(v7);
              }
              uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              [(NSMutableSet *)v4->_clients addObject:v11];
              __int16 v12 = +[NSMutableArray array];
              [(NSMutableDictionary *)v4->_clientToComplicationDescriptorIdentifiers setObject:v12 forKey:v11];
              v13 = [v30 objectForKey:v11];
              objc_opt_class();
              NTKValidateArray();
              [v12 addObjectsFromArray:v13];
            }
            id v8 = [v7 countByEnumeratingWithState:&v37 objects:v44 count:16];
          }
          while (v8);
        }

        v29 = [v25 objectForKey:@"ClientToSampleTemplate"];
        objc_opt_class();
        objc_opt_class();
        NTKValidateDictionary();
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000303EC;
        v35[3] = &unk_1000620C0;
        v36 = v4;
        [v29 enumerateKeysAndObjectsUsingBlock:v35];
        v14 = v36;
      }
      else
      {
        v29 = [v6 objectForKey:@"ClientToSampleTemplate"];
        objc_opt_class();
        objc_opt_class();
        NTKValidateDictionary();
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v14 = [v29 allKeys];
        id v15 = [v14 countByEnumeratingWithState:&v31 objects:v43 count:16];
        if (v15)
        {
          uint64_t v28 = *(void *)v32;
          id obj = v14;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v32 != v28) {
                objc_enumerationMutation(obj);
              }
              uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
              [(NSMutableSet *)v4->_clients addObject:v17];
              v18 = +[NSMutableArray array];
              v19 = [v29 objectForKey:v17];
              objc_opt_class();
              NTKValidateArray();
              [v18 addObjectsFromArray:v19];
              id v20 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v17 complicationIdentifier:CLKDefaultComplicationIdentifier];
              [(NSMutableDictionary *)v4->_clientToSampleTemplateFamilies setObject:v18 forKey:v20];
              v21 = +[NSMutableArray arrayWithObject:CLKDefaultComplicationIdentifier];
              [(NSMutableDictionary *)v4->_clientToComplicationDescriptorIdentifiers setObject:v21 forKey:v17];
            }
            v14 = obj;
            id v15 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
          }
          while (v15);
        }
      }

      id v5 = v25;
    }
  }
  v22 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    clientToComplicationDescriptorIdentifiers = v4->_clientToComplicationDescriptorIdentifiers;
    *(_DWORD *)buf = 138412290;
    v42 = clientToComplicationDescriptorIdentifiers;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Read manifest with descriptors %@", buf, 0xCu);
  }

  return v4;
}

- (void)writeToFile:(id)a3 atomically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[NSMutableDictionary dictionary];
  id v8 = +[NSMutableDictionary dictionary];
  clientToSampleTemplateFamilies = self->_clientToSampleTemplateFamilies;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100030878;
  v19[3] = &unk_1000620E8;
  id v10 = v8;
  id v20 = v10;
  [(NSMutableDictionary *)clientToSampleTemplateFamilies enumerateKeysAndObjectsUsingBlock:v19];
  [v7 setObject:v10 forKey:@"ClientToSampleTemplate"];
  [v7 setObject:self->_clientToComplicationDescriptorIdentifiers forKey:@"ClientToComplicationDescriptorIdentifiers"];
  LODWORD(self) = [v7 writeToFile:v6 atomically:v4];

  uint64_t v11 = CLKLoggingObjectForDomain();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (self)
  {
    if (v12)
    {
      v13 = [v7 objectForKeyedSubscript:@"ClientToComplicationDescriptorIdentifiers"];
      v14 = [v13 allKeys];
      id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 count]);
      v16 = [v7 objectForKeyedSubscript:@"ClientToComplicationDescriptorIdentifiers"];
      uint64_t v17 = [v16 allKeys];
      *(_DWORD *)buf = 138412546;
      v22 = v15;
      __int16 v23 = 2112;
      v24 = v17;
      v18 = "Successfully wrote manifest with descriptors %@ %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
    }
  }
  else if (v12)
  {
    v13 = [v7 objectForKeyedSubscript:@"ClientToComplicationDescriptorIdentifiers"];
    v14 = [v13 allKeys];
    id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 count]);
    v16 = [v7 objectForKeyedSubscript:@"ClientToComplicationDescriptorIdentifiers"];
    uint64_t v17 = [v16 allKeys];
    *(_DWORD *)buf = 138412546;
    v22 = v15;
    __int16 v23 = 2112;
    v24 = v17;
    v18 = "Failed to write manifest with descriptors %@ %@";
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientToComplicationDescriptorIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientToSampleTemplateFamilies, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end