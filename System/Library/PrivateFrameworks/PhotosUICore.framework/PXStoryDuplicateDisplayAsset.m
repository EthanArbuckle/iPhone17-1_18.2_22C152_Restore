@interface PXStoryDuplicateDisplayAsset
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSString)alternateUUID;
- (NSString)description;
- (PXDisplayAsset)displayAsset;
- (PXStoryDuplicateDisplayAsset)initWithDisplayAsset:(id)a3 alternateUUID:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (unint64_t)hash;
@end

@implementation PXStoryDuplicateDisplayAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_alternateUUID, 0);
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (NSString)alternateUUID
{
  return self->_alternateUUID;
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryDuplicateDisplayAsset;
  v4 = [(PXStoryDuplicateDisplayAsset *)&v10 description];
  v5 = [(PXStoryDuplicateDisplayAsset *)self alternateUUID];
  v6 = [(PXStoryDuplicateDisplayAsset *)self displayAsset];
  v7 = [v6 description];
  v8 = [v3 stringWithFormat:@"%@ alternateUUID %@ -> %@", v4, v5, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryDuplicateDisplayAsset *)self displayAsset];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5 = [(PXStoryDuplicateDisplayAsset *)self displayAsset];
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXStoryDuplicateDisplayAsset;
    BOOL v6 = [(PXStoryDuplicateDisplayAsset *)&v8 isKindOfClass:a3];
  }

  return v6;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryDuplicateDisplayAsset;
  v5 = -[PXStoryDuplicateDisplayAsset methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    BOOL v6 = [(PXStoryDuplicateDisplayAsset *)self displayAsset];
    v5 = [v6 methodSignatureForSelector:a3];
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(PXStoryDuplicateDisplayAsset *)self displayAsset];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryDuplicateDisplayAsset;
  if ([(PXStoryDuplicateDisplayAsset *)&v8 conformsToProtocol:v4])
  {
    char v5 = 1;
  }
  else
  {
    BOOL v6 = [(PXStoryDuplicateDisplayAsset *)self displayAsset];
    char v5 = [v6 conformsToProtocol:v4];
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryDuplicateDisplayAsset;
  if (-[PXStoryDuplicateDisplayAsset respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    char v5 = [(PXStoryDuplicateDisplayAsset *)self displayAsset];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (PXStoryDuplicateDisplayAsset)initWithDisplayAsset:(id)a3 alternateUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryDuplicateDisplayAsset;
  v9 = [(PXStoryDuplicateDisplayAsset *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayAsset, a3);
    objc_storeStrong((id *)&v10->_alternateUUID, a4);
  }

  return v10;
}

@end