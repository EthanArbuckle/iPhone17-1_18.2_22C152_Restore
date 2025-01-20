@interface PXGColorLookupCube
- (BOOL)shouldCache;
- (NSData)textureData;
- (id)createTextureWithContext:(id)a3;
- (int64_t)edgeSize;
- (void)center;
- (void)setEdgeSize:(int64_t)a3;
@end

@implementation PXGColorLookupCube

- (void)setEdgeSize:(int64_t)a3
{
  self->_edgeSize = a3;
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (int64_t)edgeSize
{
  return self->_edgeSize;
}

- (void)center
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PXGColorLookupCube.m", 36, @"Method %s is a responsibility of subclass %@", "-[PXGColorLookupCube center]", v6 object file lineNumber description];

  abort();
}

- (NSData)textureData
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGColorLookupCube.m", 32, @"Method %s is a responsibility of subclass %@", "-[PXGColorLookupCube textureData]", v6 object file lineNumber description];

  abort();
}

- (id)createTextureWithContext:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F08690] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXGColorLookupCube.m", 28, @"Method %s is a responsibility of subclass %@", "-[PXGColorLookupCube createTextureWithContext:]", v8 object file lineNumber description];

  abort();
}

@end