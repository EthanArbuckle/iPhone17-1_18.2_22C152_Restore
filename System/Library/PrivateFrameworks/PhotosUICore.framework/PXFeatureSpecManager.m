@interface PXFeatureSpecManager
- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4;
- (Class)specClass;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXFeatureSpec)spec;
- (PXFeatureSpecManager)init;
- (PXFeatureSpecManager)initWithExtendedTraitCollection:(id)a3;
- (PXFeatureSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (id)createSpec;
- (unint64_t)defaultChangesToUpdateFor;
- (unint64_t)options;
- (void)_setSpec:(id)a3;
- (void)_updateSpec;
- (void)invalidateSpec;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXFeatureSpecManager

- (PXFeatureSpec)spec
{
  spec = self->_spec;
  if (!spec)
  {
    v4 = [(PXFeatureSpecManager *)self createSpec];
    v5 = self->_spec;
    self->_spec = v4;

    spec = self->_spec;
  }
  return spec;
}

void __35__PXFeatureSpecManager__updateSpec__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) createSpec];
  [*(id *)(a1 + 32) _setSpec:v2];
}

- (void)_setSpec:(id)a3
{
  v7 = (PXFeatureSpec *)a3;
  v5 = self->_spec;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXFeatureSpec *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      [(PXFeatureSpecManager *)self signalChange:1];
    }
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v12 = a3;
  if ((void *)PXExtendedTraitCollectionObservationContext_200568 != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXFeatureSpecManager.m" lineNumber:103 description:@"unexpectd context"];

    abort();
  }
  v9 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  BOOL v10 = [(PXFeatureSpecManager *)self shouldUpdateSpecForExtendedTraitCollection:v9 change:a4];

  if (v10) {
    [(PXFeatureSpecManager *)self _updateSpec];
  }
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)_updateSpec
{
  kdebug_trace();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__PXFeatureSpecManager__updateSpec__block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  v3[4] = self;
  [(PXFeatureSpecManager *)self performChanges:v3];
  kdebug_trace();
}

- (void)invalidateSpec
{
  if (self->_spec) {
    [(PXFeatureSpecManager *)self _updateSpec];
  }
}

- (PXFeatureSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXFeatureSpecManager;
  v8 = [(PXFeatureSpecManager *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_options = a4;
    objc_storeStrong((id *)&v8->_extendedTraitCollection, a3);
    [(PXExtendedTraitCollection *)v9->_extendedTraitCollection registerChangeObserver:v9 context:PXExtendedTraitCollectionObservationContext_200568];
  }

  return v9;
}

- (PXFeatureSpecManager)initWithExtendedTraitCollection:(id)a3
{
  return [(PXFeatureSpecManager *)self initWithExtendedTraitCollection:a3 options:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (id)createSpec
{
  v3 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  v4 = objc_msgSend(objc_alloc(-[PXFeatureSpecManager specClass](self, "specClass")), "initWithExtendedTraitCollection:options:", v3, -[PXFeatureSpecManager options](self, "options"));

  return v4;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4
{
  return ([(PXFeatureSpecManager *)self defaultChangesToUpdateFor] & a4) != 0;
}

- (unint64_t)defaultChangesToUpdateFor
{
  return 863;
}

- (PXFeatureSpecManager)init
{
  return [(PXFeatureSpecManager *)self initWithExtendedTraitCollection:0];
}

@end