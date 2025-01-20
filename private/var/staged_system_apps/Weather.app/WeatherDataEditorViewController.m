@interface WeatherDataEditorViewController
- (_TtC7Weather31WeatherDataEditorViewController)initWithCoder:(id)a3;
- (_TtC7Weather31WeatherDataEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation WeatherDataEditorViewController

- (_TtC7Weather31WeatherDataEditorViewController)initWithCoder:(id)a3
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10072D63C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1009BC4B8();
}

- (_TtC7Weather31WeatherDataEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_1009BC6A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Weather31WeatherDataEditorViewController_hostingController));

  swift_bridgeObjectRelease();
}

@end