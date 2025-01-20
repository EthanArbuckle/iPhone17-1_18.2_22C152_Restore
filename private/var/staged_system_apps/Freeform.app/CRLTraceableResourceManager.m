@interface CRLTraceableResourceManager
+ (id)sharedManager;
- (CRLTraceableResourceManager)init;
- (id)description;
- (id)knownTraceableResources;
- (id)serializationDescription;
- (void)logSerializationAsError;
- (void)registerTraceableResource:(id)a3;
@end

@implementation CRLTraceableResourceManager

+ (id)sharedManager
{
  if (qword_1016A9AA8 != -1) {
    dispatch_once(&qword_1016A9AA8, &stru_1014F8920);
  }
  v2 = (void *)qword_1016A9AA0;

  return v2;
}

- (CRLTraceableResourceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)CRLTraceableResourceManager;
  v2 = [(CRLTraceableResourceManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("CRLTraceableResourceManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:0];
    knownTraceableResources = v2->_knownTraceableResources;
    v2->_knownTraceableResources = v6;
  }
  return v2;
}

- (void)registerTraceableResource:(id)a3
{
  objc_initWeak(&location, a3);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10041F070;
  block[3] = &unk_1014F8948;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)knownTraceableResources
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  objc_super v9 = sub_10041D834;
  v10 = sub_10041D844;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10041F1C0;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)logSerializationAsError
{
  v2 = [(CRLTraceableResourceManager *)self knownTraceableResources];
  id v3 = [v2 count];
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014F8968);
  }
  dispatch_queue_t v4 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
    sub_1010B116C((uint64_t)v3, v4);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) logSerializationAsErrorWithPrefix:@"  " v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014F8988);
  }
  v10 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
    sub_1010B10F4((uint64_t)v3, v10);
  }
}

- (id)serializationDescription
{
  v2 = [(CRLTraceableResourceManager *)self knownTraceableResources];
  id v3 = objc_opt_new();
  [v3 appendFormat:@"%tu traceable resource(s)\n", [v2 count]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"\n[%tu] %@\n", (char *)i + v7, *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      v7 += (uint64_t)i;
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(CRLTraceableResourceManager *)self serializationDescription];
  id v6 = +[NSString stringWithFormat:@"<%@: %p>\n%@", v4, self, v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownTraceableResources, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end