@interface PASUIWelcomeController
- (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PASUIWelcomeController

- (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  uint64_t v7 = sub_22E7F3E90();
  uint64_t v9 = v8;
  if (a4)
  {
    a4 = (id)sub_22E7F3E90();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a5;
  return (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController *)sub_22E7EF5E4(v7, v9, (uint64_t)a4, v11, a5);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PASUIWelcomeController();
  v2 = (char *)v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidLoad];
  v3 = *(void **)&v2[OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView];
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0, v5.receiver, v5.super_class);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, sel_setContentCompressionResistancePriority_forAxis_, 1, v4);
  sub_22E7EFD10();
  sub_22E7EF864();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_22E7EF864();
}

- (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC23ProximityAppleIDSetupUI22PASUIWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView));
}

@end