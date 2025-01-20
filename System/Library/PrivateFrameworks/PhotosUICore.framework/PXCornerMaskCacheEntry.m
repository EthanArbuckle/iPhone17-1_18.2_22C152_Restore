@interface PXCornerMaskCacheEntry
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius;
- (CGSize)size;
- (PXCornerMaskCacheEntry)initWithCornerRadius:(id)a3 size:(CGSize)a4 image:(id)a5;
- (UIImage)image;
- (id)description;
@end

@implementation PXCornerMaskCacheEntry

- (void).cxx_destruct
{
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  [(PXCornerMaskCacheEntry *)self size];
  NSStringFromCGSize(v5);
  objc_claimAutoreleasedReturnValue();
  [(PXCornerMaskCacheEntry *)self cornerRadius];
  PXGCornerRadiusDescription();
}

- (PXCornerMaskCacheEntry)initWithCornerRadius:(id)a3 size:(CGSize)a4 image:(id)a5
{
  v9 = *(void **)&a3.var0.var0.var0;
  CGFloat v10 = v8;
  CGFloat v11 = v7;
  float v12 = v6;
  float v13 = v5;
  float v14 = *(float *)&a4.height;
  float v15 = *(float *)&a4.width;
  id v17 = *(id *)&a3.var0.var0.var0;
  v21.receiver = self;
  v21.super_class = (Class)PXCornerMaskCacheEntry;
  v18 = [(PXCornerMaskCacheEntry *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_cornerRadius.var0.var0.topLeft = v15;
    v18->_cornerRadius.var0.var0.topRight = v14;
    v18->_cornerRadius.var0.var0.bottomLeft = v13;
    v18->_cornerRadius.var0.var0.bottomRight = v12;
    v18->_size.double width = v11;
    v18->_size.double height = v10;
    objc_storeStrong((id *)&v18->_image, v9);
  }

  return v19;
}

@end