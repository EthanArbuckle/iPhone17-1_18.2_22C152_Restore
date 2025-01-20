@interface OctagonFlags
- (BOOL)_onqueueContains:(id)a3;
- (NSMutableDictionary)flagConditions;
- (NSMutableSet)flags;
- (NSSet)allowableFlags;
- (OS_dispatch_queue)queue;
- (OctagonFlags)initWithQueue:(id)a3 flags:(id)a4;
- (id)conditionForFlag:(id)a3;
- (id)conditionForFlagIfPresent:(id)a3;
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

@implementation OctagonFlags

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowableFlags, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_flagConditions, 0);
}

- (NSSet)allowableFlags
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFlags:(id)a3
{
}

- (NSMutableSet)flags
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFlagConditions:(id)a3
{
}

- (NSMutableDictionary)flagConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)_onqueueRemoveFlag:(id)a3
{
  id v14 = a3;
  v5 = [(OctagonFlags *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(OctagonFlags *)self allowableFlags];
  unsigned __int8 v7 = [v6 containsObject:v14];

  if ((v7 & 1) == 0)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"OctagonFlags.m", 85, @"state machine tried to handle unknown flag %@", v14 object file lineNumber description];
  }
  v8 = [(OctagonFlags *)self flags];
  [v8 removeObject:v14];

  v9 = [(OctagonFlags *)self flagConditions];
  v10 = [v9 objectForKeyedSubscript:v14];
  [v10 fulfill];

  v11 = objc_alloc_init(CKKSCondition);
  v12 = [(OctagonFlags *)self flagConditions];
  [v12 setObject:v11 forKeyedSubscript:v14];
}

- (void)setFlag:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonFlags *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A8960;
  v7[3] = &unk_100305930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)conditionForFlagIfPresent:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000A8AB0;
  v16 = sub_1000A8AC0;
  id v17 = 0;
  v5 = [(OctagonFlags *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A8AC8;
  block[3] = &unk_100306E50;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)conditionForFlag:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonFlags *)self flagConditions];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_onqueueSetFlag:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonFlags *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(OctagonFlags *)self flags];
  [v6 addObject:v4];
}

- (BOOL)_onqueueContains:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonFlags *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(OctagonFlags *)self flags];
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (id)dumpFlags
{
  v2 = [(OctagonFlags *)self flags];
  v3 = [v2 allObjects];

  return v3;
}

- (id)contentsAsString
{
  v3 = [(OctagonFlags *)self flags];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(OctagonFlags *)self flags];
    id v6 = [v5 allObjects];
    id v7 = [v6 componentsJoinedByString:@","];
  }
  else
  {
    id v7 = @"none";
  }

  return v7;
}

- (id)description
{
  v2 = [(OctagonFlags *)self contentsAsString];
  v3 = +[NSString stringWithFormat:@"<OctagonFlags: %@>", v2];

  return v3;
}

- (OctagonFlags)initWithQueue:(id)a3 flags:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)OctagonFlags;
  v9 = [(OctagonFlags *)&v29 init];
  id v10 = v9;
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
          v21 = objc_alloc_init(CKKSCondition);
          v22 = [(OctagonFlags *)v10 flagConditions];
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

@end