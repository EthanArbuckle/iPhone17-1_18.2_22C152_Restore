@interface TipsTOCViewController
- (_TtC4Tips21TipsTOCViewController)initWithAppController:(id)a3;
- (_TtC4Tips21TipsTOCViewController)initWithCoder:(id)a3;
- (_TtC4Tips21TipsTOCViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)applicationWillEnterBackground;
- (void)applicationWillEnterForeground;
- (void)dealloc;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TipsTOCViewController

- (_TtC4Tips21TipsTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Tips21TipsTOCViewController_canIncreaseViewCount) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipsTOCViewController();
  return [(TPSViewController *)&v5 initWithNibName:0 bundle:0];
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4 name:UIApplicationWillEnterForegroundNotification object:0];
  [v5 removeObserver:v4 name:UIApplicationDidEnterBackgroundNotification object:0];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for TipsTOCViewController();
  [(TPSViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod));

  swift_release();
}

- (_TtC4Tips21TipsTOCViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Tips21TipsTOCViewController_canIncreaseViewCount) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipsTOCViewController();
  return [(TPSViewController *)&v5 initWithCoder:a3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100066148(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipsTOCViewController();
  v4 = v5.receiver;
  [(TPSAppViewController *)&v5 viewWillDisappear:v3];
  v4[OBJC_IVAR____TtC4Tips21TipsTOCViewController_canIncreaseViewCount] = 0;
  if (*(void *)&v4[OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask])
  {
    swift_retain();
    Task.cancel()();

    swift_release();
  }
  else
  {
  }
}

- (void)applicationWillEnterForeground
{
  v2 = self;
  sub_1000658E4();
}

- (void)applicationWillEnterBackground
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Tips21TipsTOCViewController_analyticsLoggingTask))
  {
    v2 = self;
    swift_retain();
    Task.cancel()();
    swift_release();
  }
  else
  {
    BOOL v3 = self;
  }
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC4Tips21TipsTOCViewController_canIncreaseViewCount) = 0;
}

- (_TtC4Tips21TipsTOCViewController)initWithAppController:(id)a3
{
  id v3 = a3;
  result = (_TtC4Tips21TipsTOCViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end