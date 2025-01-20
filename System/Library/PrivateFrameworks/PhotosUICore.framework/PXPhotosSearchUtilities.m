@interface PXPhotosSearchUtilities
- (PXPhotosSearchUtilities)init;
@end

@implementation PXPhotosSearchUtilities

- (PXPhotosSearchUtilities)init
{
  return (PXPhotosSearchUtilities *)PhotosSearchUtilities.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end