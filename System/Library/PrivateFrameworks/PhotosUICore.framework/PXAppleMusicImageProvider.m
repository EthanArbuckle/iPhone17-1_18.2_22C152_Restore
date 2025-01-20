@interface PXAppleMusicImageProvider
- (id)createImageLoaderForRequest:(id)a3;
- (id)imageCacheKeyForRequest:(id)a3;
- (id)resultForCompletedImageLoader:(id)a3 request:(id)a4 error:(id *)a5;
@end

@implementation PXAppleMusicImageProvider

- (id)resultForCompletedImageLoader:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v17 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, self, @"PXAppleMusicImageProvider.m", 63, @"%@ should be an instance inheriting from %@, but it is %@", @"imageLoader", v15, v17 object file lineNumber description];
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"PXAppleMusicImageProvider.m", 63, @"%@ should be an instance inheriting from %@, but it is nil", @"imageLoader", v15 object file lineNumber description];
  }

LABEL_3:
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1818]), "initWithCGImage:", objc_msgSend(v10, "image"));

  return v11;
}

- (id)createImageLoaderForRequest:(id)a3
{
  id v5 = a3;
  v6 = [v5 asset];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    v18 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXAppleMusicImageProvider.m", 58, @"%@ should be an instance inheriting from %@, but it is %@", @"request.asset", v16, v18 object file lineNumber description];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXAppleMusicImageProvider.m", 58, @"%@ should be an instance inheriting from %@, but it is nil", @"request.asset", v16 object file lineNumber description];
  }

LABEL_3:
  v7 = [_PXAppleMusicImageLoader alloc];
  [v5 targetSize];
  double v9 = v8;
  double v11 = v10;

  v12 = -[_PXAppleMusicImageLoader initWithAsset:targetSize:](v7, "initWithAsset:targetSize:", v6, v9, v11);
  return v12;
}

- (id)imageCacheKeyForRequest:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 asset];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, self, @"PXAppleMusicImageProvider.m", 48, @"%@ should be an instance inheriting from %@, but it is %@", @"request.asset", v18, v20 object file lineNumber description];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"PXAppleMusicImageProvider.m", 48, @"%@ should be an instance inheriting from %@, but it is nil", @"request.asset", v18 object file lineNumber description];
  }

LABEL_3:
  [v5 targetSize];
  double v8 = v7;
  double v10 = v9;

  id v11 = objc_alloc((Class)off_1E5DA9660);
  v21[0] = v6;
  v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v8, v10);
  v21[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v14 = (void *)[v11 initWithObjects:v13];

  return v14;
}

@end