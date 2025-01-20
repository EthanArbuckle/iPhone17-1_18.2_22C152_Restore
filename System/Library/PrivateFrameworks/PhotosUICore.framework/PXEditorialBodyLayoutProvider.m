@interface PXEditorialBodyLayoutProvider
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)bodyCornerRadius;
- (BOOL)avoidsFullWidthHeroes;
- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4;
- (PXEditorialBodyLayoutProvider)init;
- (PXEditorialBodyLayoutProvider)initWithViewModel:(id)a3;
- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate;
- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7;
- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5;
- (void)setAvoidsFullWidthHeroes:(BOOL)a3;
- (void)setBodyCornerRadius:(id)a3;
- (void)setInvalidationDelegate:(id)a3;
@end

@implementation PXEditorialBodyLayoutProvider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->invalidationDelegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)bodyCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (BOOL)avoidsFullWidthHeroes
{
  return self->_avoidsFullWidthHeroes;
}

- (void)setInvalidationDelegate:(id)a3
{
}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->invalidationDelegate);
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)WeakRetained;
}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 0;
}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  id v10 = a4;
  *a7 = 1;
  v11 = objc_alloc_init(PXEditorialSectionBodyLayout);
  if ([(PXPhotosViewModel *)self->_viewModel scrollingBehavior] == 1) {
    [(PXEditorialSectionBodyLayout *)v11 setDisableClipping:1];
  }
  uint64_t v12 = [v10 numberOfItemsInSection:a5->section];
  -[PXGGeneratedLayout setPadding:](v11, "setPadding:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  if (v12 > +[PXSmallCollectionLayoutGenerator maximumNumberOfItemsSupportedForStyle:0]|| [(PXPhotosViewModel *)self->_viewModel gridStyle] == 4)
  {
    if ([(PXEditorialBodyLayoutProvider *)self avoidsFullWidthHeroes]) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = 3;
    }
  }
  else
  {
    uint64_t v13 = 6;
  }
  [(PXDayAssetsSectionBodyLayout *)v11 setStyle:v13];

  return v11;
}

- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v22 = v9;
  if (v22)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v20);
    v21 = objc_msgSend(v22, "px_descriptionForAssertionMessage");
    [v17 handleFailureInMethod:a2, self, @"PXEditorialBodyLayoutProvider.m", 59, @"%@ should be an instance inheriting from %@, but it is %@", @"bodyLayout", v19, v21 object file lineNumber description];
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v17 handleFailureInMethod:a2, self, @"PXEditorialBodyLayoutProvider.m", 59, @"%@ should be an instance inheriting from %@, but it is nil", @"bodyLayout", v19 object file lineNumber description];
  }

LABEL_3:
  [v22 setDelegate:v10];
  [v22 setMediaKind:2];
  [v22 setContentSource:v10];
  objc_msgSend(v22, "setKeyItemIndex:", objc_msgSend(v10, "keyItemIndex"));
  uint64_t v12 = [v10 numberOfAssets];
  if ([v22 numberOfItems] != v12) {
    [v22 setNumberOfItems:v12];
  }
  uint64_t v13 = [(PXPhotosViewModel *)self->_viewModel specManager];
  v14 = [v13 extendedTraitCollection];

  v15 = [PXAssetsSectionBodyLemonadeEditorialLayoutSpec alloc];
  [v11 preferredCornerRadius];
  v16 = -[PXAssetsSectionBodyLemonadeEditorialLayoutSpec initWithExtendedTraitCollection:bodyCornerRadius:](v15, "initWithExtendedTraitCollection:bodyCornerRadius:", v14);
  [v22 setSpec:v16];
}

- (void)setBodyCornerRadius:(id)a3
{
  if (self->_bodyCornerRadius.var0.var0.topLeft != v3
    || self->_bodyCornerRadius.var0.var0.topRight != v4
    || self->_bodyCornerRadius.var0.var0.bottomLeft != v5
    || self->_bodyCornerRadius.var0.var0.bottomRight != v6)
  {
    self->_bodyCornerRadius.var0.var0.topLeft = v3;
    self->_bodyCornerRadius.var0.var0.topRight = v4;
    self->_bodyCornerRadius.var0.var0.bottomLeft = v5;
    self->_bodyCornerRadius.var0.var0.bottomRight = v6;
    id v11 = [(PXEditorialBodyLayoutProvider *)self invalidationDelegate];
    [v11 photosSectionBodyLayoutInvalidateConfiguredLayouts:self];
  }
}

- (void)setAvoidsFullWidthHeroes:(BOOL)a3
{
  if (self->_avoidsFullWidthHeroes != a3)
  {
    self->_avoidsFullWidthHeroes = a3;
    id v4 = [(PXEditorialBodyLayoutProvider *)self invalidationDelegate];
    [v4 photosSectionBodyLayoutInvalidateConfiguredLayouts:self];
  }
}

- (PXEditorialBodyLayoutProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXEditorialBodyLayoutProvider.m", 36, @"%s is not available as initializer", "-[PXEditorialBodyLayoutProvider init]");

  abort();
}

- (PXEditorialBodyLayoutProvider)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXEditorialBodyLayoutProvider;
  float v6 = [(PXEditorialBodyLayoutProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewModel, a3);
  }

  return v7;
}

@end