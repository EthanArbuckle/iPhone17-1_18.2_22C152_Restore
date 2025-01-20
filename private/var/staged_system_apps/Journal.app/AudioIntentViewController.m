@interface AudioIntentViewController
- (_TtC7Journal25AudioIntentViewController)initWithCoder:(id)a3;
- (_TtC7Journal25AudioIntentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AudioIntentViewController

- (_TtC7Journal25AudioIntentViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal25AudioIntentViewController_autosaveManager) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal25AudioIntentViewController_entry) = 0;
  id v4 = a3;

  result = (_TtC7Journal25AudioIntentViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudioIntentViewController();
  id v4 = v5.receiver;
  [(AudioIntentViewController *)&v5 viewDidAppear:v3];
  sub_1003CF0D8();
}

- (_TtC7Journal25AudioIntentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal25AudioIntentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC7Journal25AudioIntentViewController_uuid;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal25AudioIntentViewController_canvasTranscribingPickerVC));
  swift_release();

  swift_release();
}

@end