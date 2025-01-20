@interface FilterSubsystemTier
- (FilterSubsystemTier)init;
- (id)keyForChildren:(id)a3;
- (id)newChildInstance;
@end

@implementation FilterSubsystemTier

- (FilterSubsystemTier)init
{
  v5.receiver = self;
  v5.super_class = (Class)FilterSubsystemTier;
  v2 = [(FilterSubsystemTier *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableDictionary dictionary];
    [(FilterTier *)v2 setChildTiers:v3];
  }
  return v2;
}

- (id)keyForChildren:(id)a3
{
  return [a3 category];
}

- (id)newChildInstance
{
  return objc_alloc_init(FilterCategoryTier);
}

@end