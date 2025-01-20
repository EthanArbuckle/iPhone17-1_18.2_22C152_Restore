@interface CRLCommandController.CRLCommandControllerCommandGroup
- (NSString)actionString;
- (_TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup)init;
- (void)setActionString:(id)a3;
@end

@implementation CRLCommandController.CRLCommandControllerCommandGroup

- (NSString)actionString
{
  v2 = self;
  sub_10078B6A4();
  if (!v3) {
    sub_10085521C();
  }

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (void)setActionString:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup__currentGroupActionString);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup)init
{
  uint64_t v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC8Freeform20CRLCommandControllerP33_F675CB786BBB78E2B0BD13D7028A0B2032CRLCommandControllerCommandGroup__currentGroupActionString);
  uint64_t v4 = (objc_class *)type metadata accessor for CRLCommandController.CRLCommandControllerCommandGroup();
  *uint64_t v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(CRLCommandGroup *)&v6 init];
}

- (void).cxx_destruct
{
}

@end