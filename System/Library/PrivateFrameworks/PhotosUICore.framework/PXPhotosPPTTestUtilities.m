@interface PXPhotosPPTTestUtilities
+ (BOOL)requestTargetSelectorWithTestName:(id)a3 testOptions:(id)a4 application:(id)a5 gesturePerformer:(id)a6 scrollTestPerformer:(id)a7 resultHandler:(id)a8;
- (PXPhotosPPTTestUtilities)init;
@end

@implementation PXPhotosPPTTestUtilities

+ (BOOL)requestTargetSelectorWithTestName:(id)a3 testOptions:(id)a4 application:(id)a5 gesturePerformer:(id)a6 scrollTestPerformer:(id)a7 resultHandler:(id)a8
{
  v11 = _Block_copy(a8);
  uint64_t v12 = sub_1AB23A76C();
  uint64_t v14 = v13;
  uint64_t v15 = sub_1AB23A4DC();
  v18[2] = v11;
  swift_getObjCClassMetadata();
  id v16 = a5;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  LOBYTE(a5) = static PhotosPPTTestUtilities.requestTargetSelector(testName:testOptions:application:gesturePerformer:scrollTestPerformer:resultHandler:)(v12, v14, v15, (uint64_t)v16, (uint64_t)a6, (uint64_t)a7, (uint64_t)sub_1AA3F23C8, (uint64_t)v18);
  _Block_release(v11);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a5 & 1;
}

- (PXPhotosPPTTestUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosPPTTestUtilities();
  return [(PXPhotosPPTTestUtilities *)&v3 init];
}

@end