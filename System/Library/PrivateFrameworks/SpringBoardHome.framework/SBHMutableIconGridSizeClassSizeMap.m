@interface SBHMutableIconGridSizeClassSizeMap
- (SBHMutableIconGridSizeClassSizeMap)initWithGridSizeClassSizes:(id)a3;
- (id)_sizes;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setGridSize:(SBHIconGridSize)a3 forGridSizeClass:(id)a4;
@end

@implementation SBHMutableIconGridSizeClassSizeMap

- (SBHMutableIconGridSizeClassSizeMap)initWithGridSizeClassSizes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHMutableIconGridSizeClassSizeMap;
  v5 = [(SBHIconGridSizeClassSizeMap *)&v9 initWithGridSizeClassSizes:v4];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    sizes = v5->_sizes;
    v5->_sizes = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)setGridSize:(SBHIconGridSize)a3 forGridSizeClass:(id)a4
{
  SBHIconGridSize v9 = a3;
  id v5 = a4;
  if (!self->_sizes)
  {
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sizes = self->_sizes;
    self->_sizes = v6;
  }
  v8 = [MEMORY[0x1E4F29238] valueWithBytes:&v9 objCType:"{SBHIconGridSize=SS}"];
  [(NSMutableDictionary *)self->_sizes setObject:v8 forKey:v5];
}

- (id)_sizes
{
  return self->_sizes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SBHIconGridSizeClassSizeMap allocWithZone:a3];
  return [(SBHIconGridSizeClassSizeMap *)v4 initWithIconGridSizeClassSizeMap:self];
}

- (void).cxx_destruct
{
}

@end