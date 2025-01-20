@interface PXGadgetSpecManager
- (Class)gadgetSpecClass;
- (NSHashTable)updatedGadgets;
- (PXExtendedTraitCollection)traitCollection;
- (PXGadgetSpec)currentGadgetSpec;
- (PXGadgetSpecManager)initWithGadgetSpecClass:(Class)a3 scrollAxis:(int64_t)a4 traitCollection:(id)a5;
- (int64_t)scrollAxis;
- (void)_extendedTraitCollection:(id)a3 didChange:(unint64_t)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setCurrentGadgetSpec:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)setUpdatedGadgets:(id)a3;
- (void)updateGadgetDataSourceToSpecIfNeeded:(id)a3;
@end

@implementation PXGadgetSpecManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedGadgets, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_gadgetSpecClass, 0);
  objc_storeStrong((id *)&self->_currentGadgetSpec, 0);
}

- (void)setUpdatedGadgets:(id)a3
{
}

- (NSHashTable)updatedGadgets
{
  return self->_updatedGadgets;
}

- (void)setTraitCollection:(id)a3
{
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (int64_t)scrollAxis
{
  return self->_scrollAxis;
}

- (Class)gadgetSpecClass
{
  return self->_gadgetSpecClass;
}

- (PXGadgetSpec)currentGadgetSpec
{
  return self->_currentGadgetSpec;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXGadgetSpecManager;
  [(PXGadgetSpecManager *)&v3 performChanges:a3];
}

- (void)_extendedTraitCollection:(id)a3 didChange:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(PXGadgetSpecManager *)self currentGadgetSpec];
  v7 = objc_msgSend(objc_alloc(-[PXGadgetSpecManager gadgetSpecClass](self, "gadgetSpecClass")), "initWithTraitCollection:scrollAxis:", v5, -[PXGadgetSpecManager scrollAxis](self, "scrollAxis"));

  id v8 = v7;
  v9 = v6;
  if (v6 == v8) {
    goto LABEL_4;
  }
  char v10 = [v6 isEqual:v8];

  if ((v10 & 1) == 0)
  {
    v9 = [(PXGadgetSpecManager *)self updatedGadgets];
    [v9 removeAllObjects];
LABEL_4:
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PXGadgetSpecManager__extendedTraitCollection_didChange___block_invoke;
  v12[3] = &unk_1E5DAF6E0;
  id v13 = v8;
  id v11 = v8;
  [(PXGadgetSpecManager *)self performChanges:v12];
}

uint64_t __58__PXGadgetSpecManager__extendedTraitCollection_didChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCurrentGadgetSpec:*(void *)(a1 + 32)];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXExtendedTraitCollectionObservationContext == a5)
  {
    id v16 = v9;
    id v10 = v9;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        [(PXGadgetSpecManager *)self _extendedTraitCollection:v10 didChange:a4];

        id v9 = v16;
        goto LABEL_5;
      }
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v14);
      v15 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
      [v11 handleFailureInMethod:a2, self, @"PXGadgetSpecManager.m", 81, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v13, v15 object file lineNumber description];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      [v11 handleFailureInMethod:a2, self, @"PXGadgetSpecManager.m", 81, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v13 object file lineNumber description];
    }

    goto LABEL_4;
  }
LABEL_5:
}

- (void)updateGadgetDataSourceToSpecIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGadgetSpecManager *)self updatedGadgets];
  id v6 = [(PXGadgetSpecManager *)self currentGadgetSpec];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PXGadgetSpecManager_updateGadgetDataSourceToSpecIfNeeded___block_invoke;
  v13[3] = &unk_1E5DAF690;
  id v7 = v6;
  id v14 = v7;
  [v4 enumerateGadgetSectionsUsingBlock:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__PXGadgetSpecManager_updateGadgetDataSourceToSpecIfNeeded___block_invoke_2;
  v10[3] = &unk_1E5DAF6B8;
  id v11 = v5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v5;
  [v4 enumerateGadgetsUsingBlock:v10];
}

uint64_t __60__PXGadgetSpecManager_updateGadgetDataSourceToSpecIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setGadgetSpec:*(void *)(a1 + 32)];
}

void __60__PXGadgetSpecManager_updateGadgetDataSourceToSpecIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [v3 setGadgetSpec:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)setCurrentGadgetSpec:(id)a3
{
  id v5 = (PXGadgetSpec *)a3;
  if (self->_currentGadgetSpec != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_currentGadgetSpec, a3);
    [(PXGadgetSpecManager *)self signalChange:1];
    id v5 = v6;
  }
}

- (PXGadgetSpecManager)initWithGadgetSpecClass:(Class)a3 scrollAxis:(int64_t)a4 traitCollection:(id)a5
{
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXGadgetSpecManager;
  id v10 = [(PXGadgetSpecManager *)&v17 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_gadgetSpecClass, a3);
    v11->_scrollAxis = a4;
    objc_storeStrong((id *)&v11->_traitCollection, a5);
    uint64_t v12 = [[a3 alloc] initWithTraitCollection:v9 scrollAxis:a4];
    currentGadgetSpec = v11->_currentGadgetSpec;
    v11->_currentGadgetSpec = (PXGadgetSpec *)v12;

    [v9 registerChangeObserver:v11 context:PXExtendedTraitCollectionObservationContext];
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    updatedGadgets = v11->_updatedGadgets;
    v11->_updatedGadgets = (NSHashTable *)v14;
  }
  return v11;
}

@end