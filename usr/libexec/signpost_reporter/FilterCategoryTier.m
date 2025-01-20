@interface FilterCategoryTier
- (FilterCategoryTier)init;
- (id)keyForChildren:(id)a3;
- (id)newChildInstance;
@end

@implementation FilterCategoryTier

- (FilterCategoryTier)init
{
  v5.receiver = self;
  v5.super_class = (Class)FilterCategoryTier;
  v2 = [(FilterCategoryTier *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableDictionary dictionary];
    [(FilterTier *)v2 setChildTiers:v3];
  }
  return v2;
}

- (id)keyForChildren:(id)a3
{
  return [a3 name];
}

- (id)newChildInstance
{
  return objc_alloc_init(FilterNameTier);
}

@end