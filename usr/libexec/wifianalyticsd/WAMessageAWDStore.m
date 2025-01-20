@interface WAMessageAWDStore
+ (BOOL)supportsSecureCoding;
- (BOOL)_removeMessageWithUUID:(id)a3;
- (NSMutableArray)sortedByLastAccess;
- (NSMutableDictionary)uuidToMessageMap;
- (OS_dispatch_queue)storeQueue;
- (WAMessageAWDStore)init;
- (WAMessageAWDStore)initWithCoder:(id)a3;
- (id)messageForUUID:(id)a3;
- (unint64_t)storeSize;
- (void)_insertInOrder:(id)a3;
- (void)_purgeIfNecessary;
- (void)clearMessageStore;
- (void)encodeWithCoder:(id)a3;
- (void)messsageWasSubmittedWithUUID:(id)a3;
- (void)setSortedByLastAccess:(id)a3;
- (void)setStoreQueue:(id)a3;
- (void)setStoreSize:(unint64_t)a3;
- (void)setUuidToMessageMap:(id)a3;
- (void)updateMessage:(id)a3;
@end

@implementation WAMessageAWDStore

- (WAMessageAWDStore)init
{
  v11.receiver = self;
  v11.super_class = (Class)WAMessageAWDStore;
  v2 = [(WAMessageAWDStore *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    uuidToMessageMap = v2->_uuidToMessageMap;
    v2->_uuidToMessageMap = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifi.analytic.messagestoreQ", v5);
    storeQueue = v2->_storeQueue;
    v2->_storeQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[NSMutableArray array];
    p_super = &v2->_sortedByLastAccess->super.super;
    v2->_sortedByLastAccess = (NSMutableArray *)v8;
  }
  else
  {
    p_super = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[WAMessageAWDStore init]";
      __int16 v14 = 1024;
      int v15 = 49;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%{public}s::%d:FAILED to initialize!", buf, 0x12u);
    }
  }

  return v2;
}

- (void)updateMessage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(WAMessageAWDStore *)self storeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004D30;
  block[3] = &unk_1000D0BF0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)messageForUUID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100005378;
  v22 = sub_100005388;
  id v23 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(WAMessageAWDStore *)self storeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005390;
  block[3] = &unk_1000D0C18;
  objc_copyWeak(&v17, &location);
  id v7 = v4;
  id v14 = v7;
  v16 = &v18;
  id v8 = v5;
  int v15 = v8;
  dispatch_async(v6, block);

  objc_destroyWeak(&v17);
  dispatch_time_t v9 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[WAMessageAWDStore messageForUUID:]";
      __int16 v27 = 1024;
      int v28 = 91;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: gave up waiting to retrieve message. Bailing to avoid a hang", buf, 0x12u);
    }
  }
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);

  return v11;
}

- (void)_insertInOrder:(id)a3
{
  id v4 = a3;
  id v5 = [(WAMessageAWDStore *)self sortedByLastAccess];
  [v5 removeObject:v4];
  [v5 insertObject:v4 atIndex:[v5 indexOfObject:v4 inSortedRange:[v5 count] options:1024 usingComparator:&stru_1000D0C58]];
}

- (void)_purgeIfNecessary
{
  if ([(WAMessageAWDStore *)self storeSize] < 0x7A121)
  {
    id v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "-[WAMessageAWDStore _purgeIfNecessary]";
      __int16 v22 = 1024;
      int v23 = 117;
      __int16 v24 = 2048;
      unint64_t v25 = [(WAMessageAWDStore *)self storeSize];
      __int16 v26 = 1024;
      LODWORD(v27) = 500000;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Won't purge message store, store total size (%lu) <= limit: %d", buf, 0x22u);
    }
LABEL_13:

    return;
  }
  if ([(WAMessageAWDStore *)self storeSize] > 0x7A120)
  {
    *(void *)&long long v3 = 136447746;
    long long v19 = v3;
    while (1)
    {
      id v4 = [(WAMessageAWDStore *)self sortedByLastAccess];
      id v5 = [v4 lastObject];

      id v6 = WALogCategoryDefaultHandle();
      id v7 = v6;
      if (!v5) {
        break;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [v5 message];
        dispatch_time_t v9 = [v8 uuid];
        v10 = [v5 message];
        id v11 = [v10 key];
        v12 = [v5 message];
        v13 = [v12 originalClassName];
        id v14 = +[NSDate dateWithTimeIntervalSince1970:(double)((unint64_t)[v5 lastModifiedTimeInMillisecondEpoch]/ 0x3E8)];
        unint64_t v15 = [(WAMessageAWDStore *)self storeSize];
        *(_DWORD *)buf = v19;
        v21 = "-[WAMessageAWDStore _purgeIfNecessary]";
        __int16 v22 = 1024;
        int v23 = 122;
        __int16 v24 = 2112;
        unint64_t v25 = (unint64_t)v9;
        __int16 v26 = 2112;
        __int16 v27 = v11;
        __int16 v28 = 2112;
        v29 = v13;
        __int16 v30 = 2112;
        v31 = v14;
        __int16 v32 = 2048;
        unint64_t v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Removing message with UUID:%@ key: %@ and original class name: %@ (that was last modified at %@) as the message store is too big (%lu). If this message was intended for submission, data loss has occurred.", buf, 0x44u);
      }
      v16 = [v5 message];
      id v17 = [v16 uuid];
      unsigned int v18 = [(WAMessageAWDStore *)self _removeMessageWithUUID:v17];

      if (!v18) {
        goto LABEL_13;
      }

      if ([(WAMessageAWDStore *)self storeSize] <= 0x7A120) {
        return;
      }
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[WAMessageAWDStore _purgeIfNecessary]";
      __int16 v22 = 1024;
      int v23 = 121;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Trying to purge with an empty store! This is a serious issue.", buf, 0x12u);
    }

    id v5 = 0;
    goto LABEL_13;
  }
}

- (void)clearMessageStore
{
  objc_initWeak(&location, self);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(WAMessageAWDStore *)self storeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005A88;
  block[3] = &unk_1000D0BF0;
  objc_copyWeak(&v10, &location);
  id v5 = v3;
  dispatch_time_t v9 = v5;
  dispatch_async(v4, block);

  objc_destroyWeak(&v10);
  dispatch_time_t v6 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    id v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[WAMessageAWDStore clearMessageStore]";
      __int16 v14 = 1024;
      int v15 = 146;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: gave up waiting to clear message store. Bailing to avoid a hang", buf, 0x12u);
    }
  }
  objc_destroyWeak(&location);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uuidToMessageMap = self->_uuidToMessageMap;
  id v5 = a3;
  [v5 encodeObject:uuidToMessageMap forKey:@"_uuidToMessageMap"];
  [v5 encodeInteger:self->_storeSize forKey:@"_storeSize"];
  [v5 encodeObject:self->_sortedByLastAccess forKey:@"_sortedByLastAccess"];
}

- (WAMessageAWDStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WAMessageAWDStore;
  id v5 = [(WAMessageAWDStore *)&v18 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    dispatch_time_t v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_uuidToMessageMap"];
    uuidToMessageMap = v5->_uuidToMessageMap;
    v5->_uuidToMessageMap = (NSMutableDictionary *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.wifi.analytic.messagestoreQ", v12);
    storeQueue = v5->_storeQueue;
    v5->_storeQueue = (OS_dispatch_queue *)v13;

    v5->_storeSize = (unint64_t)[v4 decodeIntegerForKey:@"_storeSize"];
    uint64_t v15 = [v4 decodeObjectForKey:@"_sortedByLastAccess"];
    sortedByLastAccess = v5->_sortedByLastAccess;
    v5->_sortedByLastAccess = (NSMutableArray *)v15;
  }
  return v5;
}

- (BOOL)_removeMessageWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(WAMessageAWDStore *)self uuidToMessageMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [(WAMessageAWDStore *)self uuidToMessageMap];
    [v7 removeObjectForKey:v4];

    uint64_t v8 = [(WAMessageAWDStore *)self sortedByLastAccess];
    [v8 removeObject:v6];

    -[WAMessageAWDStore setStoreSize:](self, "setStoreSize:", (unsigned char *)-[WAMessageAWDStore storeSize](self, "storeSize") - (unsigned char *)[v6 size]);
  }

  return v6 != 0;
}

- (void)messsageWasSubmittedWithUUID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(WAMessageAWDStore *)self storeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005EB8;
  block[3] = &unk_1000D0BF0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSMutableDictionary)uuidToMessageMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuidToMessageMap:(id)a3
{
}

- (NSMutableArray)sortedByLastAccess
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSortedByLastAccess:(id)a3
{
}

- (OS_dispatch_queue)storeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStoreQueue:(id)a3
{
}

- (unint64_t)storeSize
{
  return self->_storeSize;
}

- (void)setStoreSize:(unint64_t)a3
{
  self->_storeSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_sortedByLastAccess, 0);

  objc_storeStrong((id *)&self->_uuidToMessageMap, 0);
}

@end