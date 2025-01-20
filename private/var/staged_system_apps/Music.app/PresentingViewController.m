@interface PresentingViewController
- (_TtC5MusicP33_83652B105F10641E50D93A0041F7187E24PresentingViewController)initWithCoder:(id)a3;
- (_TtC5MusicP33_83652B105F10641E50D93A0041F7187E24PresentingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation PresentingViewController

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  id v5 = [v3 initWithFrame:0.0, 0.0, 1.0, 1.0];
  [(PresentingViewController *)v4 setView:v5];
}

- (_TtC5MusicP33_83652B105F10641E50D93A0041F7187E24PresentingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PresentingViewController();
  v9 = [(PresentingViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC5MusicP33_83652B105F10641E50D93A0041F7187E24PresentingViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PresentingViewController();
  return [(PresentingViewController *)&v5 initWithCoder:a3];
}

@end