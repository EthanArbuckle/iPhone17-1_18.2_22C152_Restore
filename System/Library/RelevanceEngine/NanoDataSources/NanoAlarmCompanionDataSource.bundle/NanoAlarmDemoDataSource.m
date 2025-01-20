@interface NanoAlarmDemoDataSource
+ (id)_demoElementsFromElements:(id)a3;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation NanoAlarmDemoDataSource

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6064;
  v9[3] = &unk_8328;
  id v10 = a3;
  id v11 = a4;
  v8.receiver = self;
  v8.super_class = (Class)NanoAlarmDemoDataSource;
  id v6 = v11;
  id v7 = v10;
  [(NanoAlarmDataSource *)&v8 getElementsInSection:v7 withHandler:v9];
}

+ (id)_demoElementsFromElements:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = sub_627C((uint64_t)v6, *(void **)(*((void *)&v13 + 1) + 8 * (void)v9));
        if (v10) {
          objc_msgSend(v4, "addObject:", v10, (void)v13);
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v7 = v6;
    }
    while (v6);
  }

  id v11 = [v4 copy];

  return v11;
}

@end