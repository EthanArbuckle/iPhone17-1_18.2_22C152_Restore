@interface JSSocialOnboardingWelcomeViewController
- (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation JSSocialOnboardingWelcomeViewController

- (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController_textDrawingCache;
  type metadata accessor for TextDrawing.Cache();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)TextDrawing.Cache.init()();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController____lazy_storage___socialOnboardingWelcomeView) = 0;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController_visibleBoundsSize);
  void *v7 = 0;
  v7[1] = 0;

  result = (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  JSSocialOnboardingWelcomeViewController.loadView()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(JSSocialOnboardingWelcomeViewController *)&v8 viewWillAppear:v3];
  id v5 = [v4 navigationController];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 navigationBar];

    [v7 setPrefersLargeTitles:0];
    id v4 = v7;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  JSSocialOnboardingWelcomeViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  id v2 = v14.receiver;
  [(JSSocialOnboardingWelcomeViewController *)&v14 viewWillLayoutSubviews];
  id v3 = [v2 view];
  if (v3)
  {
    id v4 = v3;
    [v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    id v13 = sub_AABE0();
    [v13 setFrame:v6, v8, v10, v12];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication39JSSocialOnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController_socialOnboardingWelcomeViewModel));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication39JSSocialOnboardingWelcomeViewController____lazy_storage___socialOnboardingWelcomeView);
}

@end