@interface CLWifiAssociatedApCentroidKVStore
- (BOOL)deleteAllRecords;
- (BOOL)deleteRecordsOlderThan:(double)a3;
- (BOOL)isEmpty;
- (BOOL)purgeOlderRecords;
- (CLWifiAssociatedApCentroidKVStoreDictionary)getKVStoreDictionary;
- (NSUbiquitousKeyValueStore)kvStore;
- (basic_string<char,)getBasicInfo;
- (id)fetchRecord:(id)a3;
- (id)getSampleMacs:(int)a3;
- (id)initKVStore;
- (int)count;
- (void)addRecord:(id)a3;
- (void)deleteRecordsByMac:(id)a3;
@end

@implementation CLWifiAssociatedApCentroidKVStore

- (id)initKVStore
{
  v7.receiver = self;
  v7.super_class = (Class)CLWifiAssociatedApCentroidKVStore;
  v2 = [(CLWifiAssociatedApCentroidKVStore *)&v7 init];
  if (v2)
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10230AC58);
    }
    v3 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WifiAssociatedApCentroidStore, init", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_10230AC58);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidKVStore initKVStore]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    v4 = (NSUbiquitousKeyValueStore *)[objc_alloc((Class)NSUbiquitousKeyValueStore) initWithStoreIdentifier:@"com.apple.locationd.clx" type:2];
    v2->_kvStore = v4;
    [(NSUbiquitousKeyValueStore *)v4 synchronize];
    *(void *)buf = [(CLWifiAssociatedApCentroidKVStore *)v2 getKVStoreDictionary];
    sub_100DE6A24((id *)buf);
  }
  return v2;
}

- (CLWifiAssociatedApCentroidKVStoreDictionary)getKVStoreDictionary
{
  sub_1002918E0(&v3, (uint64_t)[(NSUbiquitousKeyValueStore *)self->_kvStore dictionaryRepresentation]);
  return v3;
}

- (void)addRecord:(id)a3
{
  kvStore = self->_kvStore;
  id v5 = [a3 toNSDictionary];
  id v6 = [a3 mac];

  [(NSUbiquitousKeyValueStore *)kvStore setObject:v5 forKey:v6];
}

- (BOOL)deleteAllRecords
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  CLWifiAssociatedApCentroidKVStoreDictionary v3 = [(NSDictionary *)[(NSUbiquitousKeyValueStore *)[(CLWifiAssociatedApCentroidKVStore *)self kvStore] dictionaryRepresentation] allKeys];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSUbiquitousKeyValueStore *)self->_kvStore removeObjectForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7)];
        objc_super v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return 1;
}

- (void)deleteRecordsByMac:(id)a3
{
  if ([(NSDictionary *)[(NSUbiquitousKeyValueStore *)[(CLWifiAssociatedApCentroidKVStore *)self kvStore] dictionaryRepresentation] objectForKey:a3])
  {
    kvStore = self->_kvStore;
    [(NSUbiquitousKeyValueStore *)kvStore removeObjectForKey:a3];
  }
}

- (BOOL)deleteRecordsOlderThan:(double)a3
{
  double v12 = a3;
  *(void *)buf = [(CLWifiAssociatedApCentroidKVStore *)self getKVStoreDictionary];
  sub_100DE61CC((id *)buf, &v12, (void **)&v10);
  id v4 = v10;
  id v5 = v11;
  if (v10 != v11)
  {
    do
    {
      uint64_t v6 = *v4;
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_10230AC58);
      }
      objc_super v7 = qword_1024193A8;
      if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        *(void *)&buf[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WifiAssociatedApCentroidStore, deleting %{private}@ from key-value store", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193A0 != -1) {
          dispatch_once(&qword_1024193A0, &stru_10230AC58);
        }
        int v13 = 138477827;
        uint64_t v14 = v6;
        v8 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidKVStore deleteRecordsOlderThan:]", "%s\n", v8);
        if (v8 != buf) {
          free(v8);
        }
      }
      [(NSUbiquitousKeyValueStore *)self->_kvStore removeObjectForKey:v6];
      ++v4;
    }
    while (v4 != v5);
    id v4 = v10;
  }
  if (v4)
  {
    long long v11 = v4;
    operator delete(v4);
  }
  return 1;
}

- (BOOL)purgeOlderRecords
{
  *(void *)buf = [(CLWifiAssociatedApCentroidKVStore *)self getKVStoreDictionary];
  double v3 = sub_100DE65EC((id *)buf);
  id v4 = sub_1014122A8();
  double v5 = sub_101412DFC(v4);
  if (v3 < v5) {
    return 1;
  }
  double v7 = v5;
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_10230AC58);
  }
  v8 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283777;
    *(double *)&buf[4] = v7;
    __int16 v11 = 2049;
    double v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WifiAssociatedApCentroidStore, purging records older than %{private}.1f, oldest age, %{private}.1f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10230AC58);
    }
    long long v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWifiAssociatedApCentroidKVStore purgeOlderRecords]", "%s\n", v9);
    if (v9 != buf) {
      free(v9);
    }
  }
  return [(CLWifiAssociatedApCentroidKVStore *)self deleteRecordsOlderThan:v7];
}

- (id)fetchRecord:(id)a3
{
  v7.var0 = (id)[(CLWifiAssociatedApCentroidKVStore *)self getKVStoreDictionary];
  sub_100DE63FC(&v7.var0, (uint64_t)a3, (uint64_t)v8);
  if (v9)
  {
    id v4 = [CLWifiAssociatedApCentroidDO alloc];
    double v5 = [(CLWifiAssociatedApCentroidDO *)v4 initWithNSDictionary:v8[0]];
  }
  else
  {
    double v5 = 0;
  }
  sub_100DE6E84((uint64_t)v8);
  return v5;
}

- (int)count
{
  v3.var0 = (id)[(CLWifiAssociatedApCentroidKVStore *)self getKVStoreDictionary];
  return sub_100DE61B0(&v3.var0);
}

- (BOOL)isEmpty
{
  return [(CLWifiAssociatedApCentroidKVStore *)self count] == 0;
}

- (id)getSampleMacs:(int)a3
{
  v5.var0 = (id)[(CLWifiAssociatedApCentroidKVStore *)self getKVStoreDictionary];
  return (id)sub_100DE65AC(&v5.var0, a3);
}

- (basic_string<char,)getBasicInfo
{
  id v3 = [v1 getKVStoreDictionary];
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_100DE672C(&v3);
}

- (NSUbiquitousKeyValueStore)kvStore
{
  return self->_kvStore;
}

@end