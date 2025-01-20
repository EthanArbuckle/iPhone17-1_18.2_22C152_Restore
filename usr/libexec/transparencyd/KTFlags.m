@interface KTFlags
- (BOOL)_onqueueContains:(id)a3;
- (KTFlags)initWithQueue:(id)a3 flags:(id)a4;
- (NSMutableDictionary)flagConditions;
- (NSMutableSet)flags;
- (NSSet)allowableFlags;
- (OS_dispatch_queue)queue;
- (id)conditionForFlag:(id)a3;
- (id)contentsAsString;
- (id)description;
- (id)dumpFlags;
- (void)_onqueueRemoveFlag:(id)a3;
- (void)_onqueueSetFlag:(id)a3;
- (void)setFlag:(id)a3;
- (void)setFlagConditions:(id)a3;
- (void)setFlags:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation KTFlags

- (KTFlags)initWithQueue:(id)a3 flags:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)KTFlags;
  v9 = [(KTFlags *)&v29 init];
  v10 = v9;
  if (v9)
  {
    id v24 = v7;
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = +[NSMutableSet set];
    flags = v10->_flags;
    v10->_flags = (NSMutableSet *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    flagConditions = v10->_flagConditions;
    v10->_flagConditions = v13;

    objc_storeStrong((id *)&v10->_allowableFlags, a4);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v8;
    id v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v19);
          v21 = objc_alloc_init(KTCondition);
          v22 = [(KTFlags *)v10 flagConditions];
          [v22 setObject:v21 forKeyedSubscript:v20];

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    id v7 = v24;
  }

  return v10;
}

- (id)description
{
  v2 = [(KTFlags *)self contentsAsString];
  v3 = +[NSString stringWithFormat:@"<KTFlags: %@>", v2];

  return v3;
}

- (id)contentsAsString
{
  v3 = [(KTFlags *)self flags];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(KTFlags *)self flags];
    v6 = [v5 allObjects];
    id v7 = [v6 componentsJoinedByString:@","];
  }
  else
  {
    id v7 = @"none";
  }

  return v7;
}

- (id)dumpFlags
{
  v2 = [(KTFlags *)self flags];
  v3 = [v2 allObjects];

  return v3;
}

- (BOOL)_onqueueContains:(id)a3
{
  id v4 = a3;
  v5 = [(KTFlags *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(KTFlags *)self flags];
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (void)_onqueueSetFlag:(id)a3
{
  id v4 = a3;
  v5 = [(KTFlags *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(KTFlags *)self flags];
  [v6 addObject:v4];
}

- (id)conditionForFlag:(id)a3
{
  id v4 = a3;
  v5 = [(KTFlags *)self flagConditions];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setFlag:(id)a3
{
  id v4 = a3;
  v5 = [(KTFlags *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017EF68;
  v7[3] = &unk_1002B7D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_onqueueRemoveFlag:(id)a3
{
  id v14 = a3;
  v5 = [(KTFlags *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(KTFlags *)self allowableFlags];
  unsigned __int8 v7 = [v6 containsObject:v14];

  if ((v7 & 1) == 0)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"KTFlags.m", 72, @"state machine tried to handle unknown flag %@", v14 object file lineNumber description];
  }
  id v8 = [(KTFlags *)self flags];
  [v8 removeObject:v14];

  v9 = [(KTFlags *)self flagConditions];
  v10 = [v9 objectForKeyedSubscript:v14];
  [v10 fulfill];

  uint64_t v11 = objc_alloc_init(KTCondition);
  v12 = [(KTFlags *)self flagConditions];
  [v12 setObject:v11 forKeyedSubscript:v14];
}

- (NSMutableDictionary)flagConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFlagConditions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)flags
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlags:(id)a3
{
}

- (NSSet)allowableFlags
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowableFlags, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_flagConditions, 0);
}

@end