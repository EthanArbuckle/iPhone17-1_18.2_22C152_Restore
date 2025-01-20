@interface CollationMap
+ (BOOL)lookupEntryForUser:(unsigned int)a3 withBundleID:(const char *)a4 minVersion:(_cryptex_version *)a5;
+ (id)getMap;
+ (int)addEntryForUser:(unsigned int)a3 fromQuire:(id)a4;
+ (int)removeEntryForUser:(unsigned int)a3 withValue:(char *)a4;
+ (void)createCollationForUser:(unsigned int)a3;
- (CollationMap)init;
- (NSMutableDictionary)coll_map;
- (OS_dispatch_queue)dq;
- (OS_os_log)log;
- (void)setColl_map:(id)a3;
- (void)setDq:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation CollationMap

- (CollationMap)init
{
  v9.receiver = self;
  v9.super_class = (Class)CollationMap;
  v2 = [(CollationMap *)&v9 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.libcryptex", "collations");
    [(CollationMap *)v2 setLog:v3];

    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [(CollationMap *)v2 setColl_map:v4];

    v5 = [(CollationMap *)v2 coll_map];

    if (!v5) {
      sub_100042CFC(&v8, v10);
    }
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.security.cryptexd.CollationMap", 0);
    [(CollationMap *)v2 setDq:v6];
  }
  return v2;
}

+ (id)getMap
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002093C;
  block[3] = &unk_10005A2B0;
  block[4] = a1;
  if (qword_10005E848 != -1) {
    dispatch_once(&qword_10005E848, block);
  }
  v2 = (void *)qword_10005E850;

  return v2;
}

+ (void)createCollationForUser:(unsigned int)a3
{
  id v4 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  v5 = +[CollationMap getMap];
  dispatch_queue_t v6 = v5[3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020A94;
  block[3] = &unk_10005A300;
  id v10 = v5;
  id v11 = v4;
  unsigned int v12 = a3;
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_sync(v6, block);
}

+ (int)addEntryForUser:(unsigned int)a3 fromQuire:(id)a4
{
  id v5 = a4;
  dispatch_queue_t v6 = +[CollationMap getMap];
  id v7 = v6[3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020CB4;
  block[3] = &unk_10005A300;
  unsigned int v14 = a3;
  id v12 = v5;
  id v13 = v6;
  uint64_t v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, block);

  return 0;
}

+ (int)removeEntryForUser:(unsigned int)a3 withValue:(char *)a4
{
  dispatch_queue_t v6 = +[CollationMap getMap];
  id v7 = v6[3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021114;
  block[3] = &unk_10005A328;
  unsigned int v13 = a3;
  id v11 = v6;
  id v12 = a4;
  uint64_t v8 = v6;
  dispatch_sync(v7, block);

  return 0;
}

+ (BOOL)lookupEntryForUser:(unsigned int)a3 withBundleID:(const char *)a4 minVersion:(_cryptex_version *)a5
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v8 = +[CollationMap getMap];
  id v9 = v8[3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021378;
  block[3] = &unk_10005A378;
  unsigned int v17 = a3;
  id v13 = v8;
  unsigned int v14 = &v18;
  v15 = a4;
  v16 = a5;
  id v10 = v8;
  dispatch_sync(v9, block);
  LOBYTE(a4) = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)a4;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableDictionary)coll_map
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setColl_map:(id)a3
{
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_coll_map, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end