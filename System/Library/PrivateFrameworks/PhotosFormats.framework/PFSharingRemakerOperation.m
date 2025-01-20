@interface PFSharingRemakerOperation
+ (id)remakerOperationWithInputType:(int64_t)a3 videoURL:(id)a4 imageURL:(id)a5 adjustmentData:(id)a6;
- (NSString)_uuid;
- (NSURL)imageOutputURL;
- (NSURL)videoOutputURL;
- (PFPhotoSharingOperation)_imageOperation;
- (PFSharingRemakerOperation)init;
- (PFVideoSharingOperation)_videoOperation;
- (int64_t)inputType;
- (void)_setImageOperation:(id)a3;
- (void)_setImageOutputURL:(id)a3;
- (void)_setInputType:(int64_t)a3;
- (void)_setUUID:(id)a3;
- (void)_setVideoOperation:(id)a3;
- (void)_setVideoOutputURL:(id)a3;
@end

@implementation PFSharingRemakerOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageOperation, 0);
  objc_storeStrong((id *)&self->__videoOperation, 0);
  objc_storeStrong((id *)&self->__uuid, 0);
  objc_storeStrong((id *)&self->_videoOutputURL, 0);

  objc_storeStrong((id *)&self->_imageOutputURL, 0);
}

- (void)_setImageOperation:(id)a3
{
}

- (PFPhotoSharingOperation)_imageOperation
{
  return self->__imageOperation;
}

- (void)_setVideoOperation:(id)a3
{
}

- (PFVideoSharingOperation)_videoOperation
{
  return self->__videoOperation;
}

- (void)_setUUID:(id)a3
{
}

- (NSString)_uuid
{
  return self->__uuid;
}

- (void)_setVideoOutputURL:(id)a3
{
}

- (NSURL)videoOutputURL
{
  return self->_videoOutputURL;
}

- (void)_setImageOutputURL:(id)a3
{
}

- (NSURL)imageOutputURL
{
  return self->_imageOutputURL;
}

- (void)_setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (PFSharingRemakerOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFSharingRemakerOperation;
  v2 = [(PFSharingRemakerOperation *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    v4 = [v3 UUIDString];
    [(PFSharingRemakerOperation *)v2 _setUUID:v4];
  }
  return v2;
}

+ (id)remakerOperationWithInputType:(int64_t)a3 videoURL:(id)a4 imageURL:(id)a5 adjustmentData:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = objc_alloc_init(PFSharingRemakerOperation);
  [(PFSharingRemakerOperation *)v12 _setInputType:a3];
  if ((unint64_t)(a3 - 1) <= 2)
  {
    v13 = [[PFVideoSharingOperation alloc] initWithVideoURL:v9 adjustmentData:v11];
    [(PFSharingRemakerOperation *)v12 _setVideoOperation:v13];
  }
  if ((unint64_t)a3 <= 1)
  {
    v14 = [[PFPhotoSharingOperation alloc] initWithImageURL:v10 adjustmentData:v11];
    [(PFSharingRemakerOperation *)v12 _setImageOperation:v14];
  }

  return v12;
}

@end