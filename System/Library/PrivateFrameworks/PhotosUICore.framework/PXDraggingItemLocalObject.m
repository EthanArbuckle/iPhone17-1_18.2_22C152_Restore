@interface PXDraggingItemLocalObject
- (BOOL)needsImport;
- (PXAssetReference)assetReference;
- (PXDraggingItemLocalObject)init;
- (PXDraggingItemLocalObject)initWithAssetReference:(id)a3;
@end

@implementation PXDraggingItemLocalObject

- (void).cxx_destruct
{
}

- (PXAssetReference)assetReference
{
  return self->_assetReference;
}

- (BOOL)needsImport
{
  v3 = [(PXDraggingItemLocalObject *)self assetReference];
  v4 = [v3 asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  v6 = [(PXDraggingItemLocalObject *)self assetReference];
  v7 = [v6 asset];
  BOOL v8 = [v7 sourceType] == 2;

  return v8;
}

- (PXDraggingItemLocalObject)initWithAssetReference:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDraggingItemLocalObject;
  v6 = [(PXDraggingItemLocalObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetReference, a3);
  }

  return v7;
}

- (PXDraggingItemLocalObject)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDraggingItemLocalObject.m", 22, @"%s is not available as initializer", "-[PXDraggingItemLocalObject init]");

  abort();
}

@end