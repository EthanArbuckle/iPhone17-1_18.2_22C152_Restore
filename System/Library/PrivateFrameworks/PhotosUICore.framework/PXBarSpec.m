@interface PXBarSpec
- (PXBarSpec)init;
- (PXBarSpec)initWithExtendedTraitCollection:(id)a3;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sortedBarItemsByPlacement:(id)a3;
@end

@implementation PXBarSpec

- (void).cxx_destruct
{
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

- (id)sortedBarItemsByPlacement:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXBarSpec.m", 71, @"Method %s is a responsibility of subclass %@", "-[PXBarSpec sortedBarItemsByPlacement:]", v8 object file lineNumber description];

  abort();
}

- (PXBarSpec)initWithExtendedTraitCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXBarSpec;
  v6 = [(PXBarSpec *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_extendedTraitCollection, a3);
  }

  return v7;
}

- (PXBarSpec)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"PXBarSpec.m", 59, @"%@ not supported", v5 object file lineNumber description];

  abort();
}

@end