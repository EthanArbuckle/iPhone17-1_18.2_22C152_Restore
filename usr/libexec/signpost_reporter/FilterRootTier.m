@interface FilterRootTier
- (FilterRootTier)init;
- (id)keyForChildren:(id)a3;
- (id)newChildInstance;
@end

@implementation FilterRootTier

- (FilterRootTier)init
{
  v5.receiver = self;
  v5.super_class = (Class)FilterRootTier;
  v2 = [(FilterRootTier *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableDictionary dictionary];
    [(FilterTier *)v2 setChildTiers:v3];
  }
  return v2;
}

- (id)keyForChildren:(id)a3
{
  return [a3 subsystem];
}

- (id)newChildInstance
{
  return objc_alloc_init(FilterSubsystemTier);
}

@end