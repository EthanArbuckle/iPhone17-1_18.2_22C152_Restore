@interface LanguageSelectionWelcomeController
- (_TtC9SiriSetup34LanguageSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC9SiriSetup34LanguageSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueTappedWithSender:(id)a3;
@end

@implementation LanguageSelectionWelcomeController

- (void)continueTappedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235A59E64(v4);
}

- (_TtC9SiriSetup34LanguageSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC9SiriSetup34LanguageSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup34LanguageSelectionWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC9SiriSetup34LanguageSelectionWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_orbView));
  long long v3 = *(_OWORD *)((char *)&self->super.super.super._dimmingView
                 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[8] = *(_OWORD *)((char *)&self->super.super.super._previousRootViewController
                    + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[9] = v3;
  long long v4 = *(_OWORD *)((char *)&self->super.super.super._externalObjectsTableForViewLoading
                 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[10] = *(_OWORD *)((char *)&self->super.super.super._currentAction
                     + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[11] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super._title
                 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[4] = *(_OWORD *)((char *)&self->super.super.super._navigationItem
                    + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[5] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super._childModalViewControllers
                 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[6] = *(_OWORD *)((char *)&self->super.super.super._nibBundle
                    + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[7] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[1] = v7;
  long long v8 = *(_OWORD *)((char *)&self->super.super.super._tab
                 + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[2] = *(_OWORD *)((char *)&self->super.super.super._view
                    + OBJC_IVAR____TtC9SiriSetup34LanguageSelectionWelcomeController_viewModel);
  v9[3] = v8;
  sub_235A346CC((uint64_t)v9);
}

@end