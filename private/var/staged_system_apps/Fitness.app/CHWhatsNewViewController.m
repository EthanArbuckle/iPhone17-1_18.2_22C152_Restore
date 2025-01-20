@interface CHWhatsNewViewController
- (CHWhatsNewViewController)initWithFitnessPlusAvailable:(BOOL)a3 buttonHandler:(id)a4;
- (CHWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (CHWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapContinueButton;
- (void)viewDidLoad;
@end

@implementation CHWhatsNewViewController

- (CHWhatsNewViewController)initWithFitnessPlusAvailable:(BOOL)a3 buttonHandler:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v8 = sub_1001A7D48;
  }
  else
  {
    v8 = 0;
    uint64_t v7 = 0;
  }
  return (CHWhatsNewViewController *)sub_1005C9380(a3, (uint64_t)v8, v7);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005C9554();
}

- (void)didTapContinueButton
{
  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR___CHWhatsNewViewController_buttonHandler];
  if (v2)
  {
    v3 = self;
    v2();
  }
}

- (CHWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (CHWhatsNewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CHWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (CHWhatsNewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end