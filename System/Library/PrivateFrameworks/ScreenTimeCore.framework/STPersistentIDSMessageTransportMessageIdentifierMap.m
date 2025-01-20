@interface STPersistentIDSMessageTransportMessageIdentifierMap
+ (id)_loadMessageIdentifiersByPrimitiveIdentifierFromKeyValueStore:(id)a3;
- (NSMutableDictionary)messageIdentifiersByPrimitiveIdentifier;
- (NSMutableDictionary)primitiveIdentifiersByMessageIdentifier;
- (NSNumber)numberOfEntries;
- (STKeyValueStore)keyValueStore;
- (STPersistentIDSMessageTransportMessageIdentifierMap)initWithKeyValueStore:(id)a3;
- (id)messageIdentifierForPrimitiveMessageIdentifier:(id)a3;
- (void)insertMessageIdentifier:(id)a3 forPrimitiveMessageIdentifier:(id)a4;
- (void)removeMessageIdentifier:(id)a3;
- (void)removePrimitiveMessageIdentifier:(id)a3;
- (void)save;
@end

@implementation STPersistentIDSMessageTransportMessageIdentifierMap

- (STPersistentIDSMessageTransportMessageIdentifierMap)initWithKeyValueStore:(id)a3
{
  v4 = (STKeyValueStore *)a3;
  v17.receiver = self;
  v17.super_class = (Class)STPersistentIDSMessageTransportMessageIdentifierMap;
  v5 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)&v17 init];
  uint64_t v6 = +[STPersistentIDSMessageTransportMessageIdentifierMap _loadMessageIdentifiersByPrimitiveIdentifierFromKeyValueStore:v4];
  messageIdentifiersByPrimitiveIdentifier = v5->_messageIdentifiersByPrimitiveIdentifier;
  v5->_messageIdentifiersByPrimitiveIdentifier = (NSMutableDictionary *)v6;

  uint64_t v8 = +[NSMutableDictionary dictionaryWithCapacity:[(NSMutableDictionary *)v5->_messageIdentifiersByPrimitiveIdentifier count]];
  primitiveIdentifiersByMessageIdentifier = v5->_primitiveIdentifiersByMessageIdentifier;
  v5->_primitiveIdentifiersByMessageIdentifier = (NSMutableDictionary *)v8;

  v10 = v5->_messageIdentifiersByPrimitiveIdentifier;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100052D84;
  v15[3] = &unk_1002FD0C8;
  v11 = v5;
  v16 = v11;
  [(NSMutableDictionary *)v10 enumerateKeysAndObjectsUsingBlock:v15];
  keyValueStore = v11->_keyValueStore;
  v11->_keyValueStore = v4;
  v13 = v4;

  return v11;
}

- (NSNumber)numberOfEntries
{
  v2 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self messageIdentifiersByPrimitiveIdentifier];
  v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 count]);

  return (NSNumber *)v3;
}

- (void)save
{
  v3 = objc_opt_new();
  v4 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self messageIdentifiersByPrimitiveIdentifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100052F4C;
  v10[3] = &unk_1002FD0C8;
  id v5 = v3;
  id v11 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  id v9 = 0;
  uint64_t v6 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:&v9];
  id v7 = v9;
  if (v6)
  {
    uint64_t v8 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self keyValueStore];
    [v8 persistValue:v6 forKey:@"messageIdentifiersByPrimitiveIdentifier"];
  }
  else
  {
    uint64_t v8 = +[STLog idsTransportMessageIdentifierMap];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002629B8();
    }
  }
}

+ (id)_loadMessageIdentifiersByPrimitiveIdentifierFromKeyValueStore:(id)a3
{
  id v3 = a3;
  v4 = [v3 readValueForKey:@"messageIdentifiersByPrimitiveIdentifier"];
  if (v4)
  {
    id v5 = objc_opt_new();
    if ((unint64_t)[v4 length] >> 11 > 4)
    {
      v14 = +[STLog idsTransportMessageIdentifierMap];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100262BC0(v14);
      }

      [v3 removeValueForKey:@"messageIdentifiersByPrimitiveIdentifier"];
      uint64_t v6 = +[NSUserDefaults standardUserDefaults];
      if ([v6 BOOLForKey:@"DidPurgeOversizedIdentifierMap"])
      {
        v15 = +[STLog idsTransportMessageIdentifierMap];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          sub_100262B3C(v15);
        }
      }
      [v6 setBool:1 forKey:@"DidPurgeOversizedIdentifierMap"];
    }
    else
    {
      id v19 = 0;
      uint64_t v6 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v19];
      id v7 = v19;
      if (v7)
      {
        uint64_t v8 = v7;
        id v9 = +[STLog idsTransportMessageIdentifierMap];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100262ABC();
        }

        v10 = +[STLog idsTransportMessageIdentifierMap];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446210;
          v21 = "+[STPersistentIDSMessageTransportMessageIdentifierMap _loadMessageIdentifiersByPrimitiveIdentifierFromKeyValueStore:]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[v2] %{public}s: \nCreating an empty map.", buf, 0xCu);
        }

        id v11 = (id)objc_opt_new();
        goto LABEL_23;
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100053320;
      v17[3] = &unk_1002FD0F0;
      id v18 = v5;
      [v6 enumerateKeysAndObjectsUsingBlock:v17];
    }
    id v11 = v5;
LABEL_23:

    goto LABEL_24;
  }
  v12 = +[STLog idsTransportMessageIdentifierMap];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100262A38(v12);
  }

  v13 = +[STLog idsTransportMessageIdentifierMap];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v21 = "+[STPersistentIDSMessageTransportMessageIdentifierMap _loadMessageIdentifiersByPrimitiveIdentifierFromKeyValueStore:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[v2] %{public}s: \nCreating an empty map.", buf, 0xCu);
  }

  id v11 = (id)objc_opt_new();
LABEL_24:

  return v11;
}

- (void)insertMessageIdentifier:(id)a3 forPrimitiveMessageIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 copy];
  id v9 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self messageIdentifiersByPrimitiveIdentifier];
  [v9 setObject:v8 forKeyedSubscript:v6];

  id v10 = [v6 copy];
  id v11 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self primitiveIdentifiersByMessageIdentifier];
  [v11 setObject:v10 forKeyedSubscript:v7];

  [(STPersistentIDSMessageTransportMessageIdentifierMap *)self save];
}

- (void)removePrimitiveMessageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self messageIdentifiersByPrimitiveIdentifier];
  id v8 = [v5 objectForKeyedSubscript:v4];

  id v6 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self messageIdentifiersByPrimitiveIdentifier];
  [v6 removeObjectForKey:v4];

  if (v8)
  {
    id v7 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self primitiveIdentifiersByMessageIdentifier];
    [v7 removeObjectForKey:v8];
  }
  [(STPersistentIDSMessageTransportMessageIdentifierMap *)self save];
}

- (void)removeMessageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self primitiveIdentifiersByMessageIdentifier];
  id v8 = [v5 objectForKeyedSubscript:v4];

  id v6 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self primitiveIdentifiersByMessageIdentifier];
  [v6 removeObjectForKey:v4];

  if (v8)
  {
    id v7 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self messageIdentifiersByPrimitiveIdentifier];
    [v7 removeObjectForKey:v8];
  }
  [(STPersistentIDSMessageTransportMessageIdentifierMap *)self save];
}

- (id)messageIdentifierForPrimitiveMessageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(STPersistentIDSMessageTransportMessageIdentifierMap *)self messageIdentifiersByPrimitiveIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [v6 copy];
  return v7;
}

- (NSMutableDictionary)messageIdentifiersByPrimitiveIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)primitiveIdentifiersByMessageIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (STKeyValueStore)keyValueStore
{
  return (STKeyValueStore *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_primitiveIdentifiersByMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_messageIdentifiersByPrimitiveIdentifier, 0);
}

@end