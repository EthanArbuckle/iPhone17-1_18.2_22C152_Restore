@interface PXPeopleFaceCropRequest
+ (int)generateUniqueRequestID;
- (BOOL)canceled;
- (CGPoint)normalizedCenterEyeLine;
- (CGRect)flippedNormalizedEdgeAdjustedCropRect;
- (CGRect)normalizedEdgeAdjustedCropRect;
- (CGRect)normalizedFaceCropRect;
- (CGRect)normalizedSmallFaceRect;
- (CGRect)smallFaceRect;
- (CGSize)targetSizeToUse;
- (PHAsset)asset;
- (PHFace)face;
- (PXPeopleFaceCropFetchOptions)options;
- (PXPeopleFaceCropRequest)initWithFetchOptions:(id)a3;
- (id)description;
- (int)faceCropRequestID;
- (int)imageManagerRequestID;
- (void)cancel;
- (void)setAsset:(id)a3;
- (void)setFace:(id)a3;
- (void)setImageManagerRequestID:(int)a3;
- (void)setNormalizedCenterEyeLine:(CGPoint)a3;
- (void)setNormalizedEdgeAdjustedCropRect:(CGRect)a3;
- (void)setNormalizedFaceCropRect:(CGRect)a3;
- (void)setNormalizedSmallFaceRect:(CGRect)a3;
- (void)setSmallFaceRect:(CGRect)a3;
- (void)setTargetSizeToUse:(CGSize)a3;
@end

@implementation PXPeopleFaceCropRequest

- (PXPeopleFaceCropFetchOptions)options
{
  return self->_options;
}

- (CGSize)targetSizeToUse
{
  double width = self->_targetSizeToUse.width;
  double height = self->_targetSizeToUse.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageManagerRequestID:(int)a3
{
  self->_imageManagerRequestID = a3;
}

- (CGRect)normalizedFaceCropRect
{
  double x = self->_normalizedFaceCropRect.origin.x;
  double y = self->_normalizedFaceCropRect.origin.y;
  double width = self->_normalizedFaceCropRect.size.width;
  double height = self->_normalizedFaceCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (int)faceCropRequestID
{
  return self->_faceCropRequestID;
}

- (void)setNormalizedEdgeAdjustedCropRect:(CGRect)a3
{
}

- (PXPeopleFaceCropRequest)initWithFetchOptions:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPeopleFaceCropRequest;
  v6 = [(PXPeopleFaceCropRequest *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v7->_faceCropRequestID = +[PXPeopleFaceCropRequest generateUniqueRequestID];
    [v5 targetPixelSize];
    v7->_targetSizeToUse.double width = v8;
    v7->_targetSizeToUse.double height = v9;
  }

  return v7;
}

+ (int)generateUniqueRequestID
{
  return atomic_fetch_add(generateUniqueRequestID_uniqueRequestID, 1u);
}

- (CGPoint)normalizedCenterEyeLine
{
  double x = self->_normalizedCenterEyeLine.x;
  double y = self->_normalizedCenterEyeLine.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setTargetSizeToUse:(CGSize)a3
{
  self->_targetSizeToUse = a3;
}

- (void)setNormalizedFaceCropRect:(CGRect)a3
{
  self->_normalizedFaceCropRect = a3;
}

- (void)setNormalizedCenterEyeLine:(CGPoint)a3
{
  self->_normalizedCenterEyeLine = a3;
}

- (void)setFace:(id)a3
{
}

- (void)setAsset:(id)a3
{
}

- (CGRect)normalizedEdgeAdjustedCropRect
{
  double x = self->_normalizedEdgeAdjustedCropRect.origin.x;
  double y = self->_normalizedEdgeAdjustedCropRect.origin.y;
  double width = self->_normalizedEdgeAdjustedCropRect.size.width;
  double height = self->_normalizedEdgeAdjustedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)setSmallFaceRect:(CGRect)a3
{
  self->_smallFaceRect = a3;
}

- (CGRect)smallFaceRect
{
  double x = self->_smallFaceRect.origin.x;
  double y = self->_smallFaceRect.origin.y;
  double width = self->_smallFaceRect.size.width;
  double height = self->_smallFaceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedSmallFaceRect:(CGRect)a3
{
  self->_normalizedSmallFaceRect = a3;
}

- (CGRect)normalizedSmallFaceRect
{
  double x = self->_normalizedSmallFaceRect.origin.x;
  double y = self->_normalizedSmallFaceRect.origin.y;
  double width = self->_normalizedSmallFaceRect.size.width;
  double height = self->_normalizedSmallFaceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)flippedNormalizedEdgeAdjustedCropRect
{
  double x = self->_flippedNormalizedEdgeAdjustedCropRect.origin.x;
  double y = self->_flippedNormalizedEdgeAdjustedCropRect.origin.y;
  double width = self->_flippedNormalizedEdgeAdjustedCropRect.size.width;
  double height = self->_flippedNormalizedEdgeAdjustedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int)imageManagerRequestID
{
  return self->_imageManagerRequestID;
}

- (PHFace)face
{
  return self->_face;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)PXPeopleFaceCropRequest;
  v3 = [(PXPeopleFaceCropRequest *)&v16 description];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(PXPeopleFaceCropRequest *)self options];
  [v4 appendFormat:@":\noptions: %@", v5];

  v6 = [(PXPeopleFaceCropRequest *)self face];
  [v4 appendFormat:@"face: %@,\n", v6];

  v7 = [(PXPeopleFaceCropRequest *)self asset];
  [v4 appendFormat:@"asset: %@,\n", v7];

  objc_msgSend(v4, "appendFormat:", @"faceCropRequestID: %d,\n", -[PXPeopleFaceCropRequest faceCropRequestID](self, "faceCropRequestID"));
  objc_msgSend(v4, "appendFormat:", @"imageManagerRequestID: %d,\n", -[PXPeopleFaceCropRequest imageManagerRequestID](self, "imageManagerRequestID"));
  [(PXPeopleFaceCropRequest *)self normalizedFaceCropRect];
  CGFloat v8 = NSStringFromRect(v19);
  [v4 appendFormat:@"normalizedFaceCropRect: %@,\n", v8];

  [(PXPeopleFaceCropRequest *)self normalizedEdgeAdjustedCropRect];
  CGFloat v9 = NSStringFromRect(v20);
  [v4 appendFormat:@"normalizedEdgeAdjustedCropRect: %@,\n", v9];

  [(PXPeopleFaceCropRequest *)self flippedNormalizedEdgeAdjustedCropRect];
  v10 = NSStringFromRect(v21);
  [v4 appendFormat:@"flippedNormalizedEdgeAdjustedCropRect: %@,\n", v10];

  [(PXPeopleFaceCropRequest *)self normalizedCenterEyeLine];
  objc_super v11 = NSStringFromPoint(v18);
  [v4 appendFormat:@"normalizedCenterEyeLine: %@,\n", v11];

  BOOL v12 = [(PXPeopleFaceCropRequest *)self canceled];
  v13 = @"NO";
  if (v12) {
    v13 = @"YES";
  }
  v14 = v13;
  [v4 appendFormat:@"canceled: %@\n", v14];

  return v4;
}

- (void)cancel
{
  self->_canceled = 1;
  id v3 = [MEMORY[0x1E4F390D0] defaultManager];
  objc_msgSend(v3, "cancelImageRequest:", -[PXPeopleFaceCropRequest imageManagerRequestID](self, "imageManagerRequestID"));
}

@end