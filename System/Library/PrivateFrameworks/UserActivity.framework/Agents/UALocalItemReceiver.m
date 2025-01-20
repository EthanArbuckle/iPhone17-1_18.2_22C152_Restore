@interface UALocalItemReceiver
- (BOOL)receiving;
- (UALocalItemReceiver)initWithManager:(id)a3 controller:(id)a4;
- (UAUserActivityClientProcessesController)controller;
- (id)receivedItems;
- (id)statusString;
@end

@implementation UALocalItemReceiver

- (UALocalItemReceiver)initWithManager:(id)a3 controller:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UALocalItemReceiver;
  v8 = [(UAReceiver *)&v11 initWithManager:a3 name:@"LocalReceiver"];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_controller, a4);
  }

  return v9;
}

- (BOOL)receiving
{
  v2 = [(UALocalItemReceiver *)self receivedItems];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)receivedItems
{
  BOOL v3 = +[NSMutableArray array];
  v4 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v5 = [v4 debugCrossoverAllActivities];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v20 = self;
  v6 = [(UALocalItemReceiver *)self controller];
  id v7 = [v6 items];

  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unsigned int v13 = [v12 eligibleForHandoff];
        if (v12) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          if (v5
            && ([(UALocalItemReceiver *)v20 controller],
                v15 = objc_claimAutoreleasedReturnValue(),
                [v12 client],
                v16 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v17 = [v15 clientIsActive:v16],
                v16,
                v15,
                (v17 & 1) != 0)
            || !sub_10000AA28((uint64_t)[v12 type]))
          {
            [v3 addObject:v12];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  id v18 = [v3 copy];

  return v18;
}

- (id)statusString
{
  if ([(UALocalItemReceiver *)self receiving])
  {
    BOOL v3 = [(UALocalItemReceiver *)self receivedItems];
    v4 = [v3 firstObject];
    unsigned int v5 = [v4 logString];
    v6 = +[NSString stringWithFormat:@"LocalItems:%@", v5];
  }
  else
  {
    v6 = +[NSString stringWithFormat:@"LocalItems:%@", @"-"];
  }

  return v6;
}

- (UAUserActivityClientProcessesController)controller
{
  return (UAUserActivityClientProcessesController *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
}

@end