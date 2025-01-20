@interface TYUsagePairs
- (NSMutableArray)_usagePages;
- (NSMutableArray)_usages;
- (TYUsagePairs)init;
- (id)usagePages;
- (id)usages;
- (void)set_usagePages:(id)a3;
- (void)set_usages:(id)a3;
@end

@implementation TYUsagePairs

- (TYUsagePairs)init
{
  v6.receiver = self;
  v6.super_class = (Class)TYUsagePairs;
  v2 = [(TYUsagePairs *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(TYUsagePairs *)v2 set_usages:v3];

    v4 = objc_opt_new();
    [(TYUsagePairs *)v2 set_usagePages:v4];
  }
  return v2;
}

- (id)usagePages
{
  v2 = [(TYUsagePairs *)self _usagePages];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)usages
{
  v2 = [(TYUsagePairs *)self _usages];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSMutableArray)_usagePages
{
  return self->__usagePages;
}

- (void)set_usagePages:(id)a3
{
}

- (NSMutableArray)_usages
{
  return self->__usages;
}

- (void)set_usages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__usages, 0);
  objc_storeStrong((id *)&self->__usagePages, 0);
}

@end