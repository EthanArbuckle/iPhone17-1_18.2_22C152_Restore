@interface SXTextComponentBlueprint
- (NSDictionary)exclusionPaths;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addExclusionPath:(id)a3 forIdentifier:(id)a4;
- (void)invalidateSize;
@end

@implementation SXTextComponentBlueprint

- (void)addExclusionPath:(id)a3 forIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = (void *)[(NSDictionary *)self->_exclusionPaths mutableCopy];
  if (!v7)
  {
    v7 = [MEMORY[0x263EFF9A0] dictionary];
  }
  [v7 setObject:v10 forKey:v6];
  v8 = (NSDictionary *)[v7 copy];
  exclusionPaths = self->_exclusionPaths;
  self->_exclusionPaths = v8;
}

- (void)invalidateSize
{
  v4.receiver = self;
  v4.super_class = (Class)SXTextComponentBlueprint;
  [(SXComponentBlueprint *)&v4 invalidateSize];
  exclusionPaths = self->_exclusionPaths;
  self->_exclusionPaths = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SXTextComponentBlueprint;
  objc_super v4 = [(SXComponentBlueprint *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SXTextComponentBlueprint *)self exclusionPaths];
  id v6 = (void *)v4[48];
  v4[48] = v5;

  return v4;
}

- (NSDictionary)exclusionPaths
{
  return self->_exclusionPaths;
}

- (void).cxx_destruct
{
}

@end