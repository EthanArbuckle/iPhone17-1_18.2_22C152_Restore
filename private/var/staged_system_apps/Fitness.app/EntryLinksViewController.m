@interface EntryLinksViewController
- (_TtC10FitnessApp24EntryLinksViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp24EntryLinksViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EntryLinksViewController

- (_TtC10FitnessApp24EntryLinksViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp24EntryLinksViewController_hostingController) = 0;
  id v4 = a3;

  result = (_TtC10FitnessApp24EntryLinksViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006A0FEC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for EntryLinksViewController();
  id v4 = v8.receiver;
  [(EntryLinksViewController *)&v8 viewWillAppear:v3];
  id v5 = [v4 navigationController];
  if (v5)
  {
    v6 = v5;
    self;
    v7 = (void *)swift_dynamicCastObjCClass();
    if (!v7) {

    }
    [v7 detachPalette];
  }
  else
  {
    v7 = v4;
  }
}

- (_TtC10FitnessApp24EntryLinksViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp24EntryLinksViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24EntryLinksViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24EntryLinksViewController_dashboardViewController));

  swift_release();
}

@end