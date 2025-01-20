@interface _PISegmentationNullAsset
- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3;
- (BOOL)supportsSegmentationResourceCaching;
- (CGRect)acceptableCropRect;
- (CGRect)gazeAreaRect;
- (CGRect)preferredCropRect;
- (NSArray)faceRegions;
- (NSArray)petRegions;
- (NSString)localIdentifier;
- (NSURL)segmentationResourceURL;
- (int)loadMotionScore:(id)a3;
- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5;
- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4;
@end

@implementation _PISegmentationNullAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->petRegions, 0);
  objc_storeStrong((id *)&self->faceRegions, 0);
}

- (CGRect)gazeAreaRect
{
  double x = self->gazeAreaRect.origin.x;
  double y = self->gazeAreaRect.origin.y;
  double width = self->gazeAreaRect.size.width;
  double height = self->gazeAreaRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)petRegions
{
  return self->petRegions;
}

- (NSArray)faceRegions
{
  return self->faceRegions;
}

- (CGRect)acceptableCropRect
{
  double x = self->acceptableCropRect.origin.x;
  double y = self->acceptableCropRect.origin.y;
  double width = self->acceptableCropRect.size.width;
  double height = self->acceptableCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)preferredCropRect
{
  double x = self->preferredCropRect.origin.x;
  double y = self->preferredCropRect.origin.y;
  double width = self->preferredCropRect.size.width;
  double height = self->preferredCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int)loadMotionScore:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F7A438];
  id v5 = a3;
  v6 = [v4 unsupportedError:@"Not available" object:0];
  (*((void (**)(id, void *, float))a3 + 2))(v5, v6, -1.0);

  return 0;
}

- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F7A438];
  id v6 = a4;
  v7 = [v5 unsupportedError:@"Not available" object:0];
  (*((void (**)(id, void, void, void *))a4 + 2))(v6, 0, 0, v7);

  return 0;
}

- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3
{
  return 1;
}

- (NSURL)segmentationResourceURL
{
  return 0;
}

- (BOOL)supportsSegmentationResourceCaching
{
  return 0;
}

- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F7A438];
  id v7 = a5;
  v8 = [v6 unsupportedError:@"Not available" object:0];
  (*((void (**)(id, void, void *))a5 + 2))(v7, 0, v8);

  return 0;
}

- (NSString)localIdentifier
{
  return (NSString *)@"Null";
}

@end