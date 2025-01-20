@interface PXPersonItem
- (NSUUID)cellUUID;
- (PHPerson)modelObject;
- (PXPersonItem)initWithPerson:(id)a3;
- (UIImage)faceImage;
- (id)faceImageLoadingCompletionBlock;
- (id)resultHandler;
- (int)faceImageRequestID;
- (void)setCellUUID:(id)a3;
- (void)setFaceImage:(id)a3;
- (void)setFaceImageLoadingCompletionBlock:(id)a3;
- (void)setFaceImageRequestID:(int)a3;
- (void)setModelObject:(id)a3;
- (void)setResultHandler:(id)a3;
@end

@implementation PXPersonItem

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_faceImage);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong(&self->_faceImageLoadingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_cellUUID, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
}

- (void)setFaceImage:(id)a3
{
}

- (UIImage)faceImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceImage);
  return (UIImage *)WeakRetained;
}

- (void)setResultHandler:(id)a3
{
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setFaceImageLoadingCompletionBlock:(id)a3
{
}

- (id)faceImageLoadingCompletionBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCellUUID:(id)a3
{
}

- (NSUUID)cellUUID
{
  return self->_cellUUID;
}

- (void)setFaceImageRequestID:(int)a3
{
  self->_faceImageRequestID = a3;
}

- (int)faceImageRequestID
{
  return self->_faceImageRequestID;
}

- (void)setModelObject:(id)a3
{
}

- (PHPerson)modelObject
{
  return self->_modelObject;
}

- (PXPersonItem)initWithPerson:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPersonItem;
  v6 = [(PXPersonItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modelObject, a3);
  }

  return v7;
}

@end