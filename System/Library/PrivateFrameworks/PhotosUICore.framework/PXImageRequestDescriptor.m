@interface PXImageRequestDescriptor
- (BOOL)isEqual:(id)a3;
- (CGSize)targetSize;
- (PXDisplayAsset)asset;
- (PXImageRequestDescriptor)init;
- (PXImageRequestDescriptor)initWithAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
- (PXImageRequestOptions)options;
- (id)description;
- (int64_t)contentMode;
- (unint64_t)hash;
@end

@implementation PXImageRequestDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PXImageRequestOptions)options
{
  return self->_options;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (PXImageRequestDescriptor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImageRequestDescriptor.m", 57, @"%s is not available as initializer", "-[PXImageRequestDescriptor init]");

  abort();
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXImageRequestDescriptor *)self asset];
  [(PXImageRequestDescriptor *)self targetSize];
  uint64_t v8 = v7;
  [(PXImageRequestDescriptor *)self targetSize];
  uint64_t v10 = v9;
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXImageRequestDescriptor contentMode](self, "contentMode"));
  v12 = [(PXImageRequestDescriptor *)self options];
  v13 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; asset: %@, targetSize: {%.2f, %.2f}; contentMode: %@; options: %@>",
                  v5,
                  self,
                  v6,
                  v8,
                  v10,
                  v11,
                  v12);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXImageRequestDescriptor *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(PXImageRequestDescriptor *)self asset];
      id v7 = [(PXImageRequestDescriptor *)v5 asset];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      [(PXImageRequestDescriptor *)self targetSize];
      double v10 = v9;
      double v12 = v11;
      [(PXImageRequestDescriptor *)v5 targetSize];
      LOBYTE(v8) = 0;
      if (v10 == v14 && v12 == v13)
      {
        int64_t v15 = [(PXImageRequestDescriptor *)self contentMode];
        LOBYTE(v8) = v15 == [(PXImageRequestDescriptor *)v5 contentMode];
      }
      goto LABEL_12;
    }
    LOBYTE(v8) = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PXDisplayAsset *)self->_asset hash] ^ (uint64_t)self->_targetSize.width;
  options = self->_options;
  uint64_t v5 = v3 ^ (uint64_t)self->_targetSize.height ^ self->_contentMode;
  return v5 ^ [(PXImageRequestOptions *)options hash];
}

- (PXImageRequestDescriptor)initWithAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v12 = a3;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PXImageRequestDescriptor;
  double v14 = [(PXImageRequestDescriptor *)&v19 init];
  int64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_asset, a3);
    v15->_targetSize.CGFloat width = width;
    v15->_targetSize.CGFloat height = height;
    v15->_contentMode = a5;
    uint64_t v16 = [v13 copy];
    options = v15->_options;
    v15->_options = (PXImageRequestOptions *)v16;
  }
  return v15;
}

@end