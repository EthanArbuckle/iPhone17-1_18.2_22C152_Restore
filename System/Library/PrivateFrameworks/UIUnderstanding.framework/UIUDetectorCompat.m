@interface UIUDetectorCompat
+ (float)staticIOUThreshold;
- (UIUDetectorCompat)init;
- (UIUDetectorCompat)initWithPlatform:(int64_t)a3 elementConfidenceThresholds:(id)a4 clickabilityConfidenceThresholds:(id)a5 elementConfig:(id)a6 clickabilityConfig:(id)a7 error:(id *)a8;
- (id)getUIObjectsInScreen:(CGImage *)a3 addOCR:(BOOL)a4 addIconRecognition:(BOOL)a5 addClickability:(BOOL)a6 addFocusElements:(BOOL)a7 nmsThreshold:(float)a8 useAccurateOCR:(BOOL)a9 error:(id *)a10;
@end

@implementation UIUDetectorCompat

+ (float)staticIOUThreshold
{
  return 0.2;
}

- (UIUDetectorCompat)initWithPlatform:(int64_t)a3 elementConfidenceThresholds:(id)a4 clickabilityConfidenceThresholds:(id)a5 elementConfig:(id)a6 clickabilityConfig:(id)a7 error:(id *)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  return (UIUDetectorCompat *)UIUDetector.init(platform:elementConfidenceThresholds:clickabilityConfidenceThresholds:elementConfig:clickabilityConfig:)(a3, a4, a5, a6, a7);
}

- (UIUDetectorCompat)init
{
  result = (UIUDetectorCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_2606228A0((uint64_t)self + OBJC_IVAR___UIUDetectorCompat_focusElementDetector, &qword_26A88E7C0);
}

- (id)getUIObjectsInScreen:(CGImage *)a3 addOCR:(BOOL)a4 addIconRecognition:(BOOL)a5 addClickability:(BOOL)a6 addFocusElements:(BOOL)a7 nmsThreshold:(float)a8 useAccurateOCR:(BOOL)a9 error:(id *)a10
{
  BOOL v10 = a9;
  BOOL v12 = a7;
  BOOL v13 = a6;
  BOOL v14 = a5;
  BOOL v15 = a4;
  uint64_t v18 = type metadata accessor for UIUDetectorResult();
  MEMORY[0x270FA5388](v18 - 8);
  v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a3;
  v22 = self;
  UIUDetector.getUIDetectionsInScreen(_:addOCR:addIconRecognition:addClickability:addFocusElements:nmsThreshold:useAccurateOCR:)(v21, v15, v14, v13, v12, v10, v20, a8);
  swift_bridgeObjectRetain();
  sub_2605F63E4((uint64_t)v20);

  type metadata accessor for UIObject();
  v23 = (void *)sub_260655928();
  swift_bridgeObjectRelease();

  return v23;
}

@end