@interface SBHImmutableIconGridSizeClassSizeMap
- (SBHImmutableIconGridSizeClassSizeMap)initWithGridSizeClassSizes:(id)a3;
- (id)_sizes;
@end

@implementation SBHImmutableIconGridSizeClassSizeMap

- (id)_sizes
{
  return self->_sizes;
}

- (SBHImmutableIconGridSizeClassSizeMap)initWithGridSizeClassSizes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHImmutableIconGridSizeClassSizeMap;
  v5 = [(SBHIconGridSizeClassSizeMap *)&v9 initWithGridSizeClassSizes:v4];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sizes = v5->_sizes;
    v5->_sizes = (NSDictionary *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end