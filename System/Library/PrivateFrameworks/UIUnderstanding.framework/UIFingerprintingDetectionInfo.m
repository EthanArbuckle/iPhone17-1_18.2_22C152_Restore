@interface UIFingerprintingDetectionInfo
- (_TtC15UIUnderstanding29UIFingerprintingDetectionInfo)init;
@end

@implementation UIFingerprintingDetectionInfo

- (_TtC15UIUnderstanding29UIFingerprintingDetectionInfo)init
{
  result = (_TtC15UIUnderstanding29UIFingerprintingDetectionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15UIUnderstanding29UIFingerprintingDetectionInfo_detection));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15UIUnderstanding29UIFingerprintingDetectionInfo_screenshot));
  swift_bridgeObjectRelease();
  v3 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC15UIUnderstanding29UIFingerprintingDetectionInfo_parentDetection);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15UIUnderstanding29UIFingerprintingDetectionInfo_parentDetection) = 0;
  if (v3)
  {
    while (1)
    {
      v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v4 = *(char **)&v6[OBJC_IVAR____TtC15UIUnderstanding29UIFingerprintingDetectionInfo_parentDetection];
      v5 = v4;

      v3 = v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    v3 = v6;
  }
LABEL_6:
}

@end