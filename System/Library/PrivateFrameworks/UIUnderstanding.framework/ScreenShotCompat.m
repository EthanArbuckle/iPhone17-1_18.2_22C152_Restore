@interface ScreenShotCompat
- (NSString)imageID;
- (ScreenShotCompat)init;
@end

@implementation ScreenShotCompat

- (NSString)imageID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_260655788();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (ScreenShotCompat)init
{
  result = (ScreenShotCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___ScreenShotCompat_detections;

  sub_2605F63E4((uint64_t)v3);
}

@end