@interface PXGFocusGuideViewConfiguration
- (BOOL)isEqual:(id)a3;
- (NSArray)preferredFocusEnvironments;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setPreferredFocusEnvironments:(id)a3;
@end

@implementation PXGFocusGuideViewConfiguration

- (void).cxx_destruct
{
}

- (void)setPreferredFocusEnvironments:(id)a3
{
}

- (NSArray)preferredFocusEnvironments
{
  return self->_preferredFocusEnvironments;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGFocusGuideViewConfiguration *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(PXGFocusGuideViewConfiguration *)v4 preferredFocusEnvironments];
      v6 = [(PXGFocusGuideViewConfiguration *)self preferredFocusEnvironments];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PXGFocusGuideViewConfiguration *)self preferredFocusEnvironments];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PXGFocusGuideViewConfiguration *)self preferredFocusEnvironments];
  uint64_t v6 = [v5 copy];
  char v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

@end