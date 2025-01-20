@interface COSCDPPostUpsellRepairController
+ (BOOL)controllerNeedsToRun;
- (COSCDPPostUpsellRepairController)init;
- (COSCDPPostUpsellRepairController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (COSCDPPostUpsellRepairController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
@end

@implementation COSCDPPostUpsellRepairController

+ (BOOL)controllerNeedsToRun
{
  return sub_100141928() & 1;
}

- (COSCDPPostUpsellRepairController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CDPPostUpsellRepairController();
  return [(COSCDPRepairController *)&v3 init];
}

- (COSCDPPostUpsellRepairController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (COSCDPPostUpsellRepairController *)sub_100141AAC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (COSCDPPostUpsellRepairController *)sub_100141AAC(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (COSCDPPostUpsellRepairController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  id v11 = a5;
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a4)
  {
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for CDPPostUpsellRepairController();
  uint64_t v14 = [(COSCDPRepairController *)&v16 initWithTitle:v12 detailText:v13 icon:v11 contentLayout:a6];

  return v14;
}

@end