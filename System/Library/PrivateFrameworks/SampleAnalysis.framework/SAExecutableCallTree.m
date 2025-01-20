@interface SAExecutableCallTree
- (NSArray)tasks;
- (void)initWithTasks:(uint64_t)a3 rootObjects:;
@end

@implementation SAExecutableCallTree

- (void)initWithTasks:(uint64_t)a3 rootObjects:
{
  id v5 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SAExecutableCallTree;
    v6 = objc_msgSendSuper2(&v10, sel_initWithRootObjects_, a3);
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      v8 = (void *)v6[2];
      v6[2] = v7;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)tasks
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end