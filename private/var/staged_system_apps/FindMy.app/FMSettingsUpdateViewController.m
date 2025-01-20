@interface FMSettingsUpdateViewController
- (UIButton)accessibilityButton;
- (_TtC6FindMy30FMSettingsUpdateViewController)initWithCoder:(id)a3;
- (void)backAction;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMSettingsUpdateViewController

- (_TtC6FindMy30FMSettingsUpdateViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100356260();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMSettingsUpdateViewController();
  v2 = v6.receiver;
  id v3 = [(FMSettingsUpdateViewController *)&v6 viewDidLoad];
  (*(void (**)(id))((swift_isaMask & *v2) + 0xF8))(v3);
  sub_100355558();
  (*(void (**)(uint64_t, uint64_t))((swift_isaMask & *v2) + 0x108))(v4, v5);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMSettingsUpdateViewController();
  uint64_t v4 = v6.receiver;
  id v5 = [(FMSettingsUpdateViewController *)&v6 viewWillAppear:v3];
  (*(void (**)(id))((swift_isaMask & *v4) + 0x110))(v5);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100355EC0();
}

- (void)backAction
{
  v5[4] = State.rawValue.getter;
  v5[5] = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_10003C410;
  v5[3] = &unk_100635288;
  BOOL v3 = _Block_copy(v5);
  uint64_t v4 = self;
  [(FMSettingsUpdateViewController *)v4 dismissViewControllerAnimated:1 completion:v3];
  _Block_release(v3);
}

- (UIButton)accessibilityButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_button));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_scrollContentView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy30FMSettingsUpdateViewController_heightConstraint);
}

@end