@interface STPersistentIDSMessageTransportMessageAddressMap
+ (id)_buildPrimitiveDestinationsByMessageAddressFromMessageAddressesByPrimitiveDestination:(id)a3;
+ (id)_loadMessageAddressesByPrimitiveDestinationFromKeyValueStore:(id)a3;
+ (id)_primitiveDestinationFromMessageAddress:(id)a3 primitiveDestinationsByMessageAddress:(id)a4 primitives:(id)a5 userAliasResolver:(id)a6;
- (NSMutableDictionary)messageAddressesByPrimitiveDestination;
- (NSMutableDictionary)primitiveDestinationsByMessageAddress;
- (STIDSTransportPrimitives)primitives;
- (STKeyValueStore)keyValueStore;
- (STPersistentIDSMessageTransportMessageAddressMap)initWithPrimitives:(id)a3 userAliasResolver:(id)a4 keyValueStore:(id)a5;
- (STUserAliasResolver)userAliasResolver;
- (id)_messageAddressFromPrimitiveDestination:(id)a3;
- (id)messageAddressesForPrimitiveDestinations:(id)a3;
- (id)primitiveDestinationsForMessageAddresses:(id)a3;
- (void)insertPrimitiveDestination:(id)a3 forMessageAddress:(id)a4;
- (void)removePrimitiveDestination:(id)a3;
- (void)save;
@end

@implementation STPersistentIDSMessageTransportMessageAddressMap

- (STPersistentIDSMessageTransportMessageAddressMap)initWithPrimitives:(id)a3 userAliasResolver:(id)a4 keyValueStore:(id)a5
{
  v8 = (STIDSTransportPrimitives *)a3;
  v9 = (STUserAliasResolver *)a4;
  v10 = (STKeyValueStore *)a5;
  v23.receiver = self;
  v23.super_class = (Class)STPersistentIDSMessageTransportMessageAddressMap;
  v11 = [(STPersistentIDSMessageTransportMessageAddressMap *)&v23 init];
  primitives = v11->_primitives;
  v11->_primitives = v8;
  v13 = v8;

  userAliasResolver = v11->_userAliasResolver;
  v11->_userAliasResolver = v9;
  v15 = v9;

  keyValueStore = v11->_keyValueStore;
  v11->_keyValueStore = v10;
  v17 = v10;

  uint64_t v18 = +[STPersistentIDSMessageTransportMessageAddressMap _loadMessageAddressesByPrimitiveDestinationFromKeyValueStore:v17];
  messageAddressesByPrimitiveDestination = v11->_messageAddressesByPrimitiveDestination;
  v11->_messageAddressesByPrimitiveDestination = (NSMutableDictionary *)v18;

  uint64_t v20 = +[STPersistentIDSMessageTransportMessageAddressMap _buildPrimitiveDestinationsByMessageAddressFromMessageAddressesByPrimitiveDestination:v11->_messageAddressesByPrimitiveDestination];
  primitiveDestinationsByMessageAddress = v11->_primitiveDestinationsByMessageAddress;
  v11->_primitiveDestinationsByMessageAddress = (NSMutableDictionary *)v20;

  return v11;
}

- (void)save
{
  v3 = objc_opt_new();
  v4 = [(STPersistentIDSMessageTransportMessageAddressMap *)self messageAddressesByPrimitiveDestination];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100051D88;
  v9[3] = &unk_1002FD070;
  id v10 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  uint64_t v8 = 0;
  v6 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:&v8];
  v7 = [(STPersistentIDSMessageTransportMessageAddressMap *)self keyValueStore];
  [v7 persistValue:v6 forKey:@"messageAddressesByPrimitiveDestination"];
}

+ (id)_loadMessageAddressesByPrimitiveDestinationFromKeyValueStore:(id)a3
{
  v3 = [a3 readValueForKey:@"messageAddressesByPrimitiveDestination"];
  if (v3)
  {
    id v14 = 0;
    v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:&v14];
    id v5 = v14;
    if (v5)
    {
      v6 = +[STLog idsTransportMessageAddressMap];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100262660();
      }

      v7 = +[STLog idsTransportMessageAddressMap];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "+[STPersistentIDSMessageTransportMessageAddressMap _loadMessageAddressesByPrimitiveDestinationFromKeyValueStore:]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[v2] %{public}s: \nCreating an empty map.", buf, 0xCu);
      }

      id v8 = (id)objc_opt_new();
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000520D4;
      v12[3] = &unk_1002FD098;
      id v8 = (id)objc_opt_new();
      id v13 = v8;
      [v4 enumerateKeysAndObjectsUsingBlock:v12];
    }
  }
  else
  {
    v9 = +[STLog idsTransportMessageAddressMap];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1002625DC(v9);
    }

    id v10 = +[STLog idsTransportMessageAddressMap];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v16 = "+[STPersistentIDSMessageTransportMessageAddressMap _loadMessageAddressesByPrimitiveDestinationFromKeyValueStore:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[v2] %{public}s: \nCreating an empty map.", buf, 0xCu);
    }

    id v8 = (id)objc_opt_new();
  }

  return v8;
}

+ (id)_buildPrimitiveDestinationsByMessageAddressFromMessageAddressesByPrimitiveDestination:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100052278;
  v6[3] = &unk_1002FD070;
  id v4 = (id)objc_opt_new();
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (void)insertPrimitiveDestination:(id)a3 forMessageAddress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 copy];
  v9 = [(STPersistentIDSMessageTransportMessageAddressMap *)self primitiveDestinationsByMessageAddress];
  [v9 setObject:v8 forKeyedSubscript:v6];

  id v10 = [v6 copy];
  v11 = [(STPersistentIDSMessageTransportMessageAddressMap *)self messageAddressesByPrimitiveDestination];
  [v11 setObject:v10 forKeyedSubscript:v7];

  [(STPersistentIDSMessageTransportMessageAddressMap *)self save];
}

- (void)removePrimitiveDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(STPersistentIDSMessageTransportMessageAddressMap *)self messageAddressesByPrimitiveDestination];
  id v8 = [v5 objectForKeyedSubscript:v4];

  id v6 = [(STPersistentIDSMessageTransportMessageAddressMap *)self messageAddressesByPrimitiveDestination];
  [v6 removeObjectForKey:v4];

  id v7 = [(STPersistentIDSMessageTransportMessageAddressMap *)self primitiveDestinationsByMessageAddress];
  [v7 removeObjectForKey:v8];

  [(STPersistentIDSMessageTransportMessageAddressMap *)self save];
}

- (id)primitiveDestinationsForMessageAddresses:(id)a3
{
  id v4 = a3;
  v17 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [(STPersistentIDSMessageTransportMessageAddressMap *)self primitiveDestinationsByMessageAddress];
        v11 = [(STPersistentIDSMessageTransportMessageAddressMap *)self primitives];
        v12 = [(STPersistentIDSMessageTransportMessageAddressMap *)self userAliasResolver];
        id v13 = +[STPersistentIDSMessageTransportMessageAddressMap _primitiveDestinationFromMessageAddress:v9 primitiveDestinationsByMessageAddress:v10 primitives:v11 userAliasResolver:v12];

        if (v13) {
          [v17 addObject:v13];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v14 = [v17 copy];
  return v14;
}

+ (id)_primitiveDestinationFromMessageAddress:(id)a3 primitiveDestinationsByMessageAddress:(id)a4 primitives:(id)a5 userAliasResolver:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 objectForKeyedSubscript:v9];
  if (v13)
  {
    id v14 = (void *)v13;
    v15 = (void *)IDSCopyRawAddressForDestination();
    if ([v15 _appearsToBeEmail])
    {
      id v16 = (id)IDSCopyIDForEmailAddress();
LABEL_9:
      long long v19 = v16;
      goto LABEL_16;
    }
    if ([v15 _appearsToBePhoneNumber])
    {
      id v16 = (id)IDSCopyIDForPhoneNumber();
      goto LABEL_9;
    }
  }
  else
  {
    v17 = [v9 userDSID];
    v15 = [v12 appleIDForUserDSID:v17];

    if (v15)
    {
      uint64_t v18 = [v11 primitiveDestinationFromRawAddress:v15];
      if (v18)
      {
        id v14 = (void *)v18;
        [v10 setObject:v18 forKeyedSubscript:v9];
        id v16 = [v14 copy];
        goto LABEL_9;
      }
      long long v20 = +[STLog idsTransportMessageAddressMap];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1002627E8();
      }
    }
    else
    {
      long long v20 = +[STLog idsTransportMessageAddressMap];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100262748(v9, v20);
      }
    }

    id v14 = 0;
  }
  long long v19 = 0;
LABEL_16:

  return v19;
}

- (id)messageAddressesForPrimitiveDestinations:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[STPersistentIDSMessageTransportMessageAddressMap _messageAddressFromPrimitiveDestination:](self, "_messageAddressFromPrimitiveDestination:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];
  return v12;
}

- (id)_messageAddressFromPrimitiveDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(STPersistentIDSMessageTransportMessageAddressMap *)self messageAddressesByPrimitiveDestination];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = (STMessageTransportMessageAddress *)[(STMessageTransportMessageAddress *)v6 copy];
    goto LABEL_22;
  }
  id v8 = +[STLog idsTransportMessageAddressMap];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136446467;
    long long v20 = "-[STPersistentIDSMessageTransportMessageAddressMap _messageAddressFromPrimitiveDestination:]";
    __int16 v21 = 2113;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nUnable to find corresponding message address for primitive destination: %{private}@. Attempting to create a partial one.", (uint8_t *)&v19, 0x16u);
  }

  uint64_t v9 = [(STPersistentIDSMessageTransportMessageAddressMap *)self primitives];
  id v10 = [v9 addressDestinationFromPrimitiveDestination:v4];

  if (!v10)
  {
    id v12 = +[STLog idsTransportMessageAddressMap];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10026285C();
    }
    id v6 = 0;
    goto LABEL_21;
  }
  id v11 = [(STPersistentIDSMessageTransportMessageAddressMap *)self primitives];
  id v12 = [v11 rawAddressFromPrimitiveDestination:v4];

  if (v12)
  {
    uint64_t v13 = [(STPersistentIDSMessageTransportMessageAddressMap *)self userAliasResolver];
    long long v14 = [v13 userDSIDForAppleID:v12];

    if (v14)
    {
      long long v15 = [[STMessageTransportMessageAddress alloc] initWithUserDSID:v14];
      [(STPersistentIDSMessageTransportMessageAddressMap *)self insertPrimitiveDestination:v10 forMessageAddress:v15];
      long long v16 = +[STLog idsTransportMessageAddressMap];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136446467;
        long long v20 = "-[STPersistentIDSMessageTransportMessageAddressMap _messageAddressFromPrimitiveDestination:]";
        __int16 v21 = 2113;
        id v22 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[v2] %{public}s: \nCreated partial message address from primitive destination: %{private}@", (uint8_t *)&v19, 0x16u);
      }

      id v6 = v15;
      goto LABEL_20;
    }
    long long v17 = +[STLog idsTransportMessageAddressMap];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100262944();
    }
  }
  else
  {
    long long v14 = +[STLog idsTransportMessageAddressMap];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1002628D0();
    }
  }
  id v6 = 0;
LABEL_20:

LABEL_21:
  id v7 = v6;
LABEL_22:

  return v7;
}

- (STIDSTransportPrimitives)primitives
{
  return (STIDSTransportPrimitives *)objc_getProperty(self, a2, 8, 1);
}

- (STUserAliasResolver)userAliasResolver
{
  return (STUserAliasResolver *)objc_getProperty(self, a2, 16, 1);
}

- (STKeyValueStore)keyValueStore
{
  return (STKeyValueStore *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)messageAddressesByPrimitiveDestination
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)primitiveDestinationsByMessageAddress
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitiveDestinationsByMessageAddress, 0);
  objc_storeStrong((id *)&self->_messageAddressesByPrimitiveDestination, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_userAliasResolver, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
}

@end