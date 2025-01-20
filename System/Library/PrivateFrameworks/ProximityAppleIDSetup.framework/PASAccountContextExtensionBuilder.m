@interface PASAccountContextExtensionBuilder
- (_TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder)init;
@end

@implementation PASAccountContextExtensionBuilder

- (_TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_requiresCDP) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_requiresManateeRepair) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_requiresFamilyRepair) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_showPrivacyDisclosureOnSourceDevice) = 0;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_showPasscodeBiometricsRequestOnTargetDevice) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_flowStepAllSetContext) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PASAccountContextExtensionBuilder();
  return [(PASAccountContextExtensionBuilder *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityAppleIDSetup33PASAccountContextExtensionBuilder_flowStepAllSetContext));
}

@end