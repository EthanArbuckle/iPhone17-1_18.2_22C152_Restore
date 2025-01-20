@interface MathNotesHostingViewController.AppProtectionController
- (_TtCC15NotesUIServices30MathNotesHostingViewControllerP33_82644AFB0C2F2CCE6D5FA1AE07FA364223AppProtectionController)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)shieldViewUnlockButtonPressed:(id)a3;
@end

@implementation MathNotesHostingViewController.AppProtectionController

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_257DA3E1C();
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  sub_257DB0098();
  unint64_t v5 = sub_257DAFF88();
  swift_unknownObjectRetain();
  v6 = self;
  sub_257DA3F58(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtCC15NotesUIServices30MathNotesHostingViewControllerP33_82644AFB0C2F2CCE6D5FA1AE07FA364223AppProtectionController)init
{
  result = (_TtCC15NotesUIServices30MathNotesHostingViewControllerP33_82644AFB0C2F2CCE6D5FA1AE07FA364223AppProtectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end