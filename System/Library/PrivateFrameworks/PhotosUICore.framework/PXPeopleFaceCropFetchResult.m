@interface PXPeopleFaceCropFetchResult
- (BOOL)isCropped;
- (BOOL)isDegraded;
- (CGRect)faceRect;
- (NSManagedObjectID)assetObjectID;
- (NSString)assetLocalIdentifier;
- (PXPeopleFaceCropFetchOptions)options;
- (PXPeopleFaceCropFetchResult)initWithImage:(id)a3 assetObjectID:(id)a4 assetLocalIdentifier:(id)a5 faceRect:(CGRect)a6 isCropped:(BOOL)a7 isDegraded:(BOOL)a8 options:(id)a9;
- (UIImage)image;
- (id)description;
@end

@implementation PXPeopleFaceCropFetchResult

- (PXPeopleFaceCropFetchOptions)options
{
  return self->_options;
}

- (PXPeopleFaceCropFetchResult)initWithImage:(id)a3 assetObjectID:(id)a4 assetLocalIdentifier:(id)a5 faceRect:(CGRect)a6 isCropped:(BOOL)a7 isDegraded:(BOOL)a8 options:(id)a9
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a9;
  v27.receiver = self;
  v27.super_class = (Class)PXPeopleFaceCropFetchResult;
  v23 = [(PXPeopleFaceCropFetchResult *)&v27 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_image, a3);
    objc_storeStrong((id *)&v24->_assetObjectID, a4);
    objc_storeStrong((id *)&v24->_assetLocalIdentifier, a5);
    v24->_faceRect.origin.CGFloat x = x;
    v24->_faceRect.origin.CGFloat y = y;
    v24->_faceRect.size.CGFloat width = width;
    v24->_faceRect.size.CGFloat height = height;
    v24->_isCropped = a7;
    v24->_isDegraded = a8;
    objc_storeStrong((id *)&v24->_options, a9);
  }

  return v24;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isCropped
{
  return self->_isCropped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetObjectID, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (CGRect)faceRect
{
  double x = self->_faceRect.origin.x;
  double y = self->_faceRect.origin.y;
  double width = self->_faceRect.size.width;
  double height = self->_faceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (NSManagedObjectID)assetObjectID
{
  return self->_assetObjectID;
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleFaceCropFetchResult;
  v3 = [(PXPeopleFaceCropFetchResult *)&v15 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(PXPeopleFaceCropFetchResult *)self image];
  [v4 appendFormat:@":\nimage: %@,\n", v5];

  v6 = [(PXPeopleFaceCropFetchResult *)self assetObjectID];
  [v4 appendFormat:@"assetObjectID: %@,\n", v6];

  v7 = [(PXPeopleFaceCropFetchResult *)self assetLocalIdentifier];
  [v4 appendFormat:@"assetLocalIdentifier: %@,\n", v7];

  [(PXPeopleFaceCropFetchResult *)self faceRect];
  v8 = NSStringFromCGRect(v17);
  [v4 appendFormat:@"faceRect: %@,\n", v8];
  if ([(PXPeopleFaceCropFetchResult *)self isCropped]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = v9;
  [v4 appendFormat:@"isCropped: %@,\n", v10];

  if ([(PXPeopleFaceCropFetchResult *)self isDegraded]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = v11;
  [v4 appendFormat:@"isDegraded: %@,\n", v12];

  v13 = [(PXPeopleFaceCropFetchResult *)self options];
  [v4 appendFormat:@"options: %@\n", v13];

  return v4;
}

@end