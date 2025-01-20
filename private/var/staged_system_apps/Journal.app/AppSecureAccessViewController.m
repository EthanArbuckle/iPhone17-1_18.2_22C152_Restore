@interface AppSecureAccessViewController
- (_TtC7Journal29AppSecureAccessViewController)initWithCoder:(id)a3;
- (_TtC7Journal29AppSecureAccessViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)viewDidLoad;
@end

@implementation AppSecureAccessViewController

- (_TtC7Journal29AppSecureAccessViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal29AppSecureAccessViewController_gradient) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal29AppSecureAccessViewController_traitChangeRegistration) = 0;
  id v4 = a3;

  result = (_TtC7Journal29AppSecureAccessViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005C8B64();
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIContentUnavailableConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1005C9784();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7Journal29AppSecureAccessViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal29AppSecureAccessViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal29AppSecureAccessViewController_gradient));

  swift_unknownObjectRelease();
}

@end