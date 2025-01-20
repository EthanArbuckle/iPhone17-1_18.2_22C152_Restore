@interface CKKSPowerCollection
+ (void)CKKSPowerEvent:(id)a3 count:(unint64_t)a4;
+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4;
+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4 count:(unint64_t)a5;
+ (void)OTPowerEvent:(id)a3;
- (CKKSPowerCollection)init;
- (NSMutableDictionary)delete;
- (NSMutableDictionary)store;
- (void)addToStatsDictionary:(id)a3 key:(id)a4;
- (void)commit;
- (void)deletedOQE:(id)a3;
- (void)setDelete:(id)a3;
- (void)setStore:(id)a3;
- (void)storedOQE:(id)a3;
- (void)summary:(id)a3 stats:(id)a4;
@end

@implementation CKKSPowerCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delete, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

- (void)setDelete:(id)a3
{
}

- (NSMutableDictionary)delete
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStore:(id)a3
{
}

- (NSMutableDictionary)store
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)commit
{
  [(CKKSPowerCollection *)self summary:@"store" stats:self->_store];
  delete = self->_delete;

  [(CKKSPowerCollection *)self summary:@"delete" stats:delete];
}

- (void)summary:(id)a3 stats:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        v18[0] = @"operation";
        v18[1] = @"accessgroup";
        v19[0] = v5;
        v19[1] = v11;
        v18[2] = @"items";
        v12 = [v6 objectForKeyedSubscript:];
        v19[2] = v12;
        v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
        sub_100029560(@"CKKSSyncing", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)deletedOQE:(id)a3
{
  delete = self->_delete;
  id v5 = [a3 accessgroup];
  [(CKKSPowerCollection *)self addToStatsDictionary:delete key:v5];
}

- (void)storedOQE:(id)a3
{
  store = self->_store;
  id v5 = [a3 accessgroup];
  [(CKKSPowerCollection *)self addToStatsDictionary:store key:v5];
}

- (void)addToStatsDictionary:(id)a3 key:(id)a4
{
  CFStringRef v5 = (const __CFString *)a4;
  if (!v5) {
    CFStringRef v5 = @"access-group-missing";
  }
  uint64_t v9 = (__CFString *)v5;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:v9];
  id v8 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v7 longValue] + 1);
  [v6 setObject:v8 forKeyedSubscript:v9];
}

- (CKKSPowerCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKKSPowerCollection;
  v2 = [(CKKSPowerCollection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    store = v2->_store;
    v2->_store = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    delete = v2->_delete;
    v2->_delete = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (void)OTPowerEvent:(id)a3
{
  CFStringRef v5 = @"operation";
  id v6 = a3;
  id v3 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  sub_100029560(@"OctagonTrust", v4);
}

+ (void)CKKSPowerEvent:(id)a3 count:(unint64_t)a4
{
  v8[0] = @"operation";
  v8[1] = @"count";
  v9[0] = a3;
  id v5 = a3;
  id v6 = +[NSNumber numberWithUnsignedInteger:a4];
  v9[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  sub_100029560(@"CKKSSyncing", v7);
}

+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4 count:(unint64_t)a5
{
  v11[0] = @"operation";
  v11[1] = @"zone";
  v12[0] = a3;
  v12[1] = a4;
  v11[2] = @"count";
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[NSNumber numberWithUnsignedInteger:a5];
  v12[2] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  sub_100029560(@"CKKSSyncing", v10);
}

+ (void)CKKSPowerEvent:(id)a3 zone:(id)a4
{
  v8[0] = @"operation";
  v8[1] = @"zone";
  v9[0] = a3;
  v9[1] = a4;
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  sub_100029560(@"CKKSSyncing", v7);
}

@end