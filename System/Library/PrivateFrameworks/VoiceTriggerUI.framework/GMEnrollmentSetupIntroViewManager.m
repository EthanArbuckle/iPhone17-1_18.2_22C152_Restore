@interface GMEnrollmentSetupIntroViewManager
- (_TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager)init;
- (id)createViewControllerWithIntroViewControllerDelegate:(id)a3;
- (void)proceedToReady;
- (void)resetIfInTraining;
@end

@implementation GMEnrollmentSetupIntroViewManager

- (id)createViewControllerWithIntroViewControllerDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)sub_2388CC4E4((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)proceedToReady
{
}

- (void)resetIfInTraining
{
}

- (_TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager__enrollmentStateChange) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GMEnrollmentSetupIntroViewManager();
  return [(GMEnrollmentSetupIntroViewManager *)&v3 init];
}

- (void).cxx_destruct
{
}

@end