@interface CHMoveModeChangePromptViewController
- (CHMoveModeChangePromptViewController)initWithNextMoveMode:(int64_t)a3 notificationType:(int64_t)a4 healthStore:(id)a5 formattingManager:(id)a6;
- (CHMoveModeChangePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (CHMoveModeChangePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapAcceptButton;
- (void)didTapSkipButton;
- (void)viewDidLoad;
@end

@implementation CHMoveModeChangePromptViewController

- (CHMoveModeChangePromptViewController)initWithNextMoveMode:(int64_t)a3 notificationType:(int64_t)a4 healthStore:(id)a5 formattingManager:(id)a6
{
  return (CHMoveModeChangePromptViewController *)sub_1006B6B9C(a3, a4, a5, a6);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006B6D10();
}

- (void)didTapAcceptButton
{
  v2 = self;
  sub_1006B70AC();
}

- (void)didTapSkipButton
{
}

- (CHMoveModeChangePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (CHMoveModeChangePromptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CHMoveModeChangePromptViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (CHMoveModeChangePromptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR___CHMoveModeChangePromptViewController_formattingManager];
}

@end