@interface PXPhotosFullscreenOverlayViewControllerFactory
+ (id)makeViewControllerWithOverlayControllers:(id)a3 photosViewModel:(id)a4;
- (PXPhotosFullscreenOverlayViewControllerFactory)init;
@end

@implementation PXPhotosFullscreenOverlayViewControllerFactory

+ (id)makeViewControllerWithOverlayControllers:(id)a3 photosViewModel:(id)a4
{
  sub_1A9E9B06C();
  unint64_t v5 = sub_1AB23AADC();
  id v6 = a4;
  v7 = (void *)sub_1AA97B60C(v5, v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (PXPhotosFullscreenOverlayViewControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosFullscreenOverlayViewControllerFactory();
  return [(PXPhotosFullscreenOverlayViewControllerFactory *)&v3 init];
}

@end