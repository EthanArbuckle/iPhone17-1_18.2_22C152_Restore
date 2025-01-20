@interface PXSharedLibraryFaceTileImageProvider
- (PXSharedLibraryFaceTileImageProvider)init;
- (PXSharedLibraryFaceTileImageProviderModel)providerModel;
- (UIImage)combinedImage;
- (void)_setMeContact:(id)a3;
- (void)_updateCombinedImage;
- (void)_updateContext;
- (void)_updateIncludeMeContact;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCombinedImage:(id)a3;
@end

@implementation PXSharedLibraryFaceTileImageProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedImage, 0);
  objc_storeStrong((id *)&self->_providerModel, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_faceTileImageCombiner, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
}

- (UIImage)combinedImage
{
  return self->_combinedImage;
}

- (PXSharedLibraryFaceTileImageProviderModel)providerModel
{
  return self->_providerModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v8 = a3;
  if ((void *)PXSharedLibraryFaceTileImageProviderModelObservationContext == a5)
  {
    id v9 = v8;
    if (v6)
    {
      [(PXSharedLibraryFaceTileImageProvider *)self _updateIncludeMeContact];
      id v8 = v9;
    }
    if ((v6 & 0x1FE) != 0)
    {
      [(PXSharedLibraryFaceTileImageProvider *)self _updateContext];
    }
    else if ((v6 & 0x201) == 0)
    {
      goto LABEL_8;
    }
    [(PXSharedLibraryFaceTileImageProvider *)self _updateCombinedImage];
    id v8 = v9;
  }
LABEL_8:
}

- (void)_updateCombinedImage
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_meContact
    && [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel includeMeContact])
  {
    [v3 addObject:self->_meContact];
  }
  v4 = [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel faceTileCombinerItems];
  [v3 addObjectsFromArray:v4];

  unint64_t v5 = [v3 count];
  if (v5 > [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel includeMeContact]
    && self->_context)
  {
    if (v5 >= 5) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = v5;
    }
    v7 = [v3 subarrayWithRange:v5 - v6];
    if (!self->_faceTileImageCombiner)
    {
      id v8 = objc_alloc_init(PXFaceTileImageCombiner);
      faceTileImageCombiner = self->_faceTileImageCombiner;
      self->_faceTileImageCombiner = v8;
    }
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    objc_initWeak(&location, self);
    v10 = self->_faceTileImageCombiner;
    context = self->_context;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__PXSharedLibraryFaceTileImageProvider__updateCombinedImage__block_invoke;
    v13[3] = &unk_1E5DAF7D0;
    v13[4] = &v16;
    objc_copyWeak(&v14, &location);
    [(PXFaceTileImageCombiner *)v10 requestCombinedImageForItems:v7 context:context resultHandler:v13];
    if (*((unsigned char *)v17 + 24))
    {
      v12 = +[PXFaceTileImageCombiner placeholderImageForNumberOfItems:context:](PXFaceTileImageCombiner, "placeholderImageForNumberOfItems:context:", [v7 count], self->_context);
      [(PXSharedLibraryFaceTileImageProvider *)self setCombinedImage:v12];
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    [(PXSharedLibraryFaceTileImageProvider *)self setCombinedImage:0];
  }
}

void __60__PXSharedLibraryFaceTileImageProvider__updateCombinedImage__block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  v2 = (id *)(a1 + 40);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setCombinedImage:v3];
}

- (void)_updateContext
{
  [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel displayScale];
  double v4 = v3;
  BOOL v5 = [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel isRTL];
  BOOL v6 = [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel isAscending];
  [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel imageDiameter];
  double v8 = v7;
  [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel imageOffset];
  double v10 = v9;
  id v17 = [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel backgroundColor];
  v11 = [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel borderColor];
  [(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel borderWidth];
  if (v4 <= 0.0 || v17 == 0 || v11 == 0) {
    v15 = 0;
  }
  else {
    v15 = [[PXFaceTileImageCombinerContext alloc] initWithDisplayScale:v5 isRTL:v6 isAscending:v17 imageSize:v11 imageOffset:v4 backgroundColor:v8 borderColor:round(v8 * v10) borderWidth:v12];
  }
  context = self->_context;
  self->_context = v15;
}

- (void)_updateIncludeMeContact
{
  if ([(PXSharedLibraryFaceTileImageProviderModel *)self->_providerModel includeMeContact])
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63__PXSharedLibraryFaceTileImageProvider__updateIncludeMeContact__block_invoke;
    v4[3] = &unk_1E5DAF7A8;
    objc_copyWeak(&v5, &location);
    +[PXActivityUtilities requestMeContactWithCompletion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    meContact = self->_meContact;
    self->_meContact = 0;
  }
}

void __63__PXSharedLibraryFaceTileImageProvider__updateIncludeMeContact__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setMeContact:v3];
}

- (void)_setMeContact:(id)a3
{
  double v8 = (CNContact *)a3;
  id v5 = self->_meContact;
  if (v5 == v8)
  {
  }
  else
  {
    BOOL v6 = v5;
    char v7 = [(CNContact *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_meContact, a3);
      [(PXSharedLibraryFaceTileImageProvider *)self _updateCombinedImage];
    }
  }
}

- (void)setCombinedImage:(id)a3
{
  double v4 = (UIImage *)a3;
  id v5 = self->_combinedImage;
  if (v5 == v4)
  {
  }
  else
  {
    BOOL v6 = v5;
    char v7 = [(UIImage *)v5 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      double v8 = (UIImage *)[(UIImage *)v4 copy];
      combinedImage = self->_combinedImage;
      self->_combinedImage = v8;

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __57__PXSharedLibraryFaceTileImageProvider_setCombinedImage___block_invoke;
      v10[3] = &unk_1E5DD0FA8;
      v10[4] = self;
      [(PXSharedLibraryFaceTileImageProvider *)self performChanges:v10];
    }
  }
}

uint64_t __57__PXSharedLibraryFaceTileImageProvider_setCombinedImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:1];
}

- (PXSharedLibraryFaceTileImageProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryFaceTileImageProvider;
  v2 = [(PXSharedLibraryFaceTileImageProvider *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(PXSharedLibraryFaceTileImageProviderModel);
    providerModel = v2->_providerModel;
    v2->_providerModel = v3;

    [(PXSharedLibraryFaceTileImageProviderModel *)v2->_providerModel registerChangeObserver:v2 context:PXSharedLibraryFaceTileImageProviderModelObservationContext];
  }
  return v2;
}

@end