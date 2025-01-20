@interface MCProfileEventsManager
- (MCProfileEventsDataProvider)dataProvider;
- (MCProfileEventsManager)init;
- (MCProfileEventsManager)initWithDataProvider:(id)a3;
- (id)_profileEvents;
- (id)_profileEventsOnDisk;
- (id)_timestampFromEvent:(id)a3;
- (id)earlistProfileEventExpiry;
- (void)_removeAllProfileEvents;
- (void)_saveProfileEvents:(id)a3;
- (void)addEventForProfile:(id)a3 operation:(id)a4 source:(id)a5;
- (void)removeExpiredProfileEvents;
- (void)setDataProvider:(id)a3;
@end

@implementation MCProfileEventsManager

- (MCProfileEventsManager)init
{
  v3 = objc_opt_new();
  v4 = [(MCProfileEventsManager *)self initWithDataProvider:v3];

  return v4;
}

- (MCProfileEventsManager)initWithDataProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCProfileEventsManager;
  v6 = [(MCProfileEventsManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataProvider, a3);
  }

  return v7;
}

- (id)earlistProfileEventExpiry
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(MCProfileEventsManager *)self _profileEvents];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_super v9 = [(MCProfileEventsManager *)self _timestampFromEvent:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        v10 = v9;
        if (v9)
        {
          if (v6)
          {
            v11 = [v9 earlierDate:v6];

            if (v11 == v10)
            {
              id v12 = v10;

              id v6 = v12;
            }
          }
          else
          {
            id v6 = v9;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  v13 = [v6 dateByAddingTimeInterval:([MCFeatureOverrides profileEventsExpirationInterval](MCFeatureOverrides, "profileEventsExpirationInterval"))];

  return v13;
}

- (void)addEventForProfile:(id)a3 operation:(id)a4 source:(id)a5
{
  id v8 = a4;
  objc_super v9 = (__CFString *)a5;
  id v10 = a3;
  v11 = [(MCProfileEventsManager *)self _profileEvents];
  if (v11)
  {
    uint64_t v12 = +[NSMutableArray arrayWithArray:v11];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v14 = [v10 loggingID];

  CFStringRef v15 = @"Unknown";
  v23 = v14;
  if (v9) {
    CFStringRef v15 = v9;
  }
  v21[0] = @"Process";
  v21[1] = @"Operation";
  v22[0] = v15;
  v22[1] = v8;
  v21[2] = @"Timestamp";
  long long v16 = [(MCProfileEventsManager *)self dataProvider];
  long long v17 = [v16 currentTime];
  v22[2] = v17;
  long long v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24 = v18;
  v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  [v13 insertObject:v19 atIndex:0];
  v20 = +[MCFeatureOverrides profileEventsMaxLength];
  if ([v13 count] > v20) {
    [v13 removeObjectsInRange:v20, (unsigned char *)[v13 count] - v20];
  }
  [(MCProfileEventsManager *)self _saveProfileEvents:v13];
}

- (void)removeExpiredProfileEvents
{
  v3 = [(MCProfileEventsManager *)self _profileEvents];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    long long v17 = objc_opt_new();
    id v5 = [(MCProfileEventsManager *)self dataProvider];
    id v6 = [v5 currentTime];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = v4;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v13 = -[MCProfileEventsManager _timestampFromEvent:](self, "_timestampFromEvent:", v12, v16);
          if (v13)
          {
            v14 = [v13 dateByAddingTimeInterval:([MCFeatureOverrides profileEventsExpirationInterval] + (double)(int))];
            CFStringRef v15 = [v6 earlierDate:v14];

            if (v15 == v6) {
              [v17 addObject:v12];
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [(MCProfileEventsManager *)self _saveProfileEvents:v17];
    id v4 = v16;
  }
}

- (id)_profileEventsOnDisk
{
  v2 = [(MCProfileEventsManager *)self dataProvider];
  v3 = [v2 profileEventsFilePath];
  id v4 = +[NSData MCDataFromFile:v3];

  if (v4)
  {
    id v5 = +[NSPropertyListSerialization MCSafePropertyListWithData:v4 options:0 format:0 error:0];
  }
  else
  {
    id v5 = 0;
  }
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &__NSDictionary0__struct;
  }
  id v7 = v6;

  return v7;
}

- (id)_profileEvents
{
  v2 = [(MCProfileEventsManager *)self _profileEventsOnDisk];
  v3 = [v2 objectForKeyedSubscript:@"ProfileEvents"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_timestampFromEvent:(id)a3
{
  v3 = [a3 allValues];
  id v4 = [v3 firstObject];

  id v5 = [v4 objectForKeyedSubscript:@"Timestamp"];

  return v5;
}

- (void)_saveProfileEvents:(id)a3
{
  CFStringRef v8 = @"ProfileEvents";
  id v9 = a3;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  id v6 = [(MCProfileEventsManager *)self dataProvider];
  id v7 = [v6 profileEventsFilePath];
  [v5 MCWriteToBinaryFile:v7];
}

- (void)_removeAllProfileEvents
{
}

- (MCProfileEventsDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end