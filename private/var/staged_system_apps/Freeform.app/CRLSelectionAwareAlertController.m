@interface CRLSelectionAwareAlertController
- (BOOL)staysOpenOnSelectionChange;
- (_TtC8Freeform32CRLSelectionAwareAlertController)initWithCoder:(id)a3;
- (_TtC8Freeform32CRLSelectionAwareAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setStaysOpenOnSelectionChange:(BOOL)a3;
@end

@implementation CRLSelectionAwareAlertController

- (BOOL)staysOpenOnSelectionChange
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange);
}

- (void)setStaysOpenOnSelectionChange:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange) = a3;
}

- (_TtC8Freeform32CRLSelectionAwareAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange) = 1;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange) = 1;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CRLSelectionAwareAlertController();
  v9 = [(CRLSelectionAwareAlertController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC8Freeform32CRLSelectionAwareAlertController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform32CRLSelectionAwareAlertController_staysOpenOnSelectionChange) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSelectionAwareAlertController();
  return [(CRLSelectionAwareAlertController *)&v5 initWithCoder:a3];
}

@end