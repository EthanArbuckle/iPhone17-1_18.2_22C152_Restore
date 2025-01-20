@interface PXStoryPhotoKitAssetContainer
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (PHAssetCollection)assetCollection;
- (PHObject)container;
- (PHObject)originalContainer;
- (PHPhotoLibrary)photoLibrary;
- (PXStoryPhotoKitAssetContainer)init;
- (PXStoryPhotoKitAssetContainer)initWithAssetCollection:(id)a3 originalContainer:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXStoryPhotoKitAssetContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_originalContainer, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHObject)originalContainer
{
  return self->_originalContainer;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXStoryPhotoKitAssetContainer *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@: %p; identifier: %@>", v5, self, v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [(PXStoryPhotoKitAssetContainer *)self assetCollection];
  uint64_t v4 = [v3 hash];

  v5 = [(PXStoryPhotoKitAssetContainer *)self originalContainer];
  unint64_t v6 = v4 ^ (2 * [v5 hash]);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXStoryPhotoKitAssetContainer *)a3;
  v5 = v4;
  if (v4 != self)
  {
    unint64_t v6 = v4;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;

      if (!v7)
      {
        char v11 = 0;
LABEL_16:

        goto LABEL_17;
      }
      unint64_t v6 = [(PXStoryPhotoKitAssetContainer *)self assetCollection];
      v8 = [(PXStoryPhotoKitAssetContainer *)v7 assetCollection];
      if ([(PXStoryPhotoKitAssetContainer *)v6 isEqual:v8])
      {
        v9 = [(PXStoryPhotoKitAssetContainer *)self originalContainer];
        v10 = [(PXStoryPhotoKitAssetContainer *)v7 originalContainer];
        if (v9 == v10) {
          char v11 = 1;
        }
        else {
          char v11 = [v9 isEqual:v10];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      v7 = 0;
      char v11 = 0;
    }

    goto LABEL_16;
  }
  char v11 = 1;
LABEL_17:

  return v11;
}

- (PHObject)container
{
  v3 = [(PXStoryPhotoKitAssetContainer *)self originalContainer];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PXStoryPhotoKitAssetContainer *)self assetCollection];
  }
  unint64_t v6 = v5;

  return (PHObject *)v6;
}

- (PXStoryPhotoKitAssetContainer)initWithAssetCollection:(id)a3 originalContainer:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PXStoryPhotoKitAssetContainer;
  v10 = [(PXStoryPhotoKitAssetContainer *)&v24 init];
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetCollection, a3);
    objc_storeStrong((id *)&v11->_originalContainer, a4);
    uint64_t v12 = [v8 photoLibrary];
    photoLibrary = v11->_photoLibrary;
    v11->_photoLibrary = (PHPhotoLibrary *)v12;

    originalContainer = v11->_originalContainer;
    if (originalContainer)
    {
      v15 = [(PHObject *)originalContainer photoLibrary];
      char v16 = [v15 isEqual:v11->_photoLibrary];

      if ((v16 & 1) == 0)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:v11 file:@"PXStoryPhotoKitAssetContainer.m" lineNumber:31 description:@"photo library mismatch"];
      }
    }
    v17 = NSString;
    v18 = [v8 localIdentifier];
    v19 = [v9 localIdentifier];
    uint64_t v20 = [v17 stringWithFormat:@"%@-%@", v18, v19];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v20;
  }
  return v11;
}

- (PXStoryPhotoKitAssetContainer)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPhotoKitAssetContainer.m", 20, @"%s is not available as initializer", "-[PXStoryPhotoKitAssetContainer init]");

  abort();
}

@end