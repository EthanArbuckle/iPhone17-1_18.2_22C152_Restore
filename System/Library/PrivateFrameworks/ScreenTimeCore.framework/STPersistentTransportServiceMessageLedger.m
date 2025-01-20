@interface STPersistentTransportServiceMessageLedger
- (STCachingCodableStore)keyValueStore;
- (STPersistentTransportServiceMessageLedger)initWithKeyValueStore:(id)a3;
- (id)addressesFromItem:(id)a3 inState:(int64_t)a4;
- (id)fetchItemWithMessageIdentifier:(id)a3;
- (void)_enumerateItemsWithState:(id)a3 usingBlock:(id)a4;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)enumerateItemsWithState:(int64_t)a3 usingBlock:(id)a4;
- (void)removeItemWithMessageIdentifier:(id)a3;
- (void)setItem:(id)a3 forMessageIdentifier:(id)a4;
@end

@implementation STPersistentTransportServiceMessageLedger

- (STPersistentTransportServiceMessageLedger)initWithKeyValueStore:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STPersistentTransportServiceMessageLedger;
  id v3 = a3;
  v4 = [(STPersistentTransportServiceMessageLedger *)&v9 init];
  v5 = [STCachingCodableStore alloc];
  v6 = -[STCachingCodableStore initWithKeyValueStore:cacheSize:valueClass:](v5, "initWithKeyValueStore:cacheSize:valueClass:", v3, 0, objc_opt_class(), v9.receiver, v9.super_class);

  keyValueStore = v4->_keyValueStore;
  v4->_keyValueStore = v6;

  return v4;
}

- (void)setItem:(id)a3 forMessageIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(STPersistentTransportServiceMessageLedger *)self keyValueStore];
  v8 = [v6 UUIDString];

  [v9 persistValue:v7 forKey:v8];
}

- (void)removeItemWithMessageIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = [(STPersistentTransportServiceMessageLedger *)self keyValueStore];
  v5 = [v4 UUIDString];

  [v6 removeValueForKey:v5];
}

- (id)fetchItemWithMessageIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(STPersistentTransportServiceMessageLedger *)self keyValueStore];
  id v6 = [v4 UUIDString];

  id v7 = [v5 readValueForKey:v6];

  return v7;
}

- (void)enumerateItemsWithState:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:a3];
  [(STPersistentTransportServiceMessageLedger *)self _enumerateItemsWithState:v7 usingBlock:v6];
}

- (void)enumerateItemsUsingBlock:(id)a3
{
}

- (void)_enumerateItemsWithState:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STPersistentTransportServiceMessageLedger *)self keyValueStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100053BF0;
  v11[3] = &unk_1002FD118;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateKeysAndValuesUsingBlock:v11];
}

- (id)addressesFromItem:(id)a3 inState:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = [v5 statusesByAddress];

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100053DA4;
  v14 = &unk_1002FD140;
  id v15 = v6;
  int64_t v16 = a4;
  id v8 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:&v11];

  id v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);
  return v9;
}

- (STCachingCodableStore)keyValueStore
{
  return (STCachingCodableStore *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end