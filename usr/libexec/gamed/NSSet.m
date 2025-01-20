@interface NSSet
+ (id)_gkSetOfResourcesWithIDs:(id)a3;
- (BOOL)_gkContainsExpiredResource;
- (BOOL)_gkContainsInvalidOrExpiredResource;
- (BOOL)_gkContainsInvalidResource;
- (BOOL)_gkContainsObjectPassingPredicate:(id)a3;
- (id)_gkAllRepresentedItems;
- (id)_gkAllResourceIDs;
- (id)_gkExpiredResources;
- (id)_gkInvalidOrExpiredResources;
- (id)_gkInvalidResources;
- (id)_gkResourceWithID:(id)a3;
- (id)_gkResourcesWithIDs:(id)a3;
- (id)_gkValidAndNonExpiredResources;
@end

@implementation NSSet

+ (id)_gkSetOfResourcesWithIDs:(id)a3
{
  v3 = [a3 _gkMapWithBlock:&stru_1002D98D0];
  v4 = [(id)objc_opt_class() setWithArray:v3];

  return v4;
}

- (id)_gkResourcesWithIDs:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[NSSet _gkResourceWithID:](self, "_gkResourceWithID:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_gkResourceWithID:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DC5F8;
  block[3] = &unk_1002D40E0;
  id v9 = a3;
  uint64_t v4 = qword_100329750;
  id v5 = v9;
  if (v4 != -1) {
    dispatch_once(&qword_100329750, block);
  }
  [(id)qword_100329748 setResourceID:v5];
  id v6 = [(NSSet *)self member:qword_100329748];

  return v6;
}

- (BOOL)_gkContainsObjectPassingPredicate:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DC734;
  v6[3] = &unk_1002D98F8;
  id v4 = a3;
  id v7 = v4;
  id v8 = &v9;
  [(NSSet *)self enumerateObjectsUsingBlock:v6];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (id)_gkExpiredResources
{
  return [(NSSet *)self objectsPassingTest:&stru_1002D9938];
}

- (id)_gkInvalidResources
{
  return [(NSSet *)self objectsPassingTest:&stru_1002D9958];
}

- (id)_gkValidAndNonExpiredResources
{
  return [(NSSet *)self objectsPassingTest:&stru_1002D9978];
}

- (id)_gkInvalidOrExpiredResources
{
  return [(NSSet *)self objectsPassingTest:&stru_1002D9998];
}

- (id)_gkAllRepresentedItems
{
  return [(NSSet *)self _gkDistinctValuesForKeyPath:@"representedItem"];
}

- (id)_gkAllResourceIDs
{
  return [(NSSet *)self _gkDistinctValuesForKeyPath:@"resourceID"];
}

- (BOOL)_gkContainsInvalidOrExpiredResource
{
  return [(NSSet *)self _gkContainsObjectPassingPredicate:&stru_1002D99D8];
}

- (BOOL)_gkContainsExpiredResource
{
  return [(NSSet *)self _gkContainsObjectPassingPredicate:&stru_1002D99F8];
}

- (BOOL)_gkContainsInvalidResource
{
  return [(NSSet *)self _gkContainsObjectPassingPredicate:&stru_1002D9A18];
}

@end