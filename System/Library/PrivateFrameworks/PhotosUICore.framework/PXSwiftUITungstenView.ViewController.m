@interface PXSwiftUITungstenView.ViewController
- (_TtCV12PhotosUICore21PXSwiftUITungstenViewP33_056D1FF7FB10D0432A5593ADA99729F214ViewController)initWithCoder:(id)a3;
- (_TtCV12PhotosUICore21PXSwiftUITungstenViewP33_056D1FF7FB10D0432A5593ADA99729F214ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXSwiftUITungstenView.ViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AA7C7170(a3);
}

- (_TtCV12PhotosUICore21PXSwiftUITungstenViewP33_056D1FF7FB10D0432A5593ADA99729F214ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1AB23A76C();
    id v6 = a4;
    v7 = (void *)sub_1AB23A72C();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PXSwiftUITungstenView.ViewController();
  v9 = [(PXSwiftUITungstenView.ViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtCV12PhotosUICore21PXSwiftUITungstenViewP33_056D1FF7FB10D0432A5593ADA99729F214ViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PXSwiftUITungstenView.ViewController();
  return [(PXSwiftUITungstenView.ViewController *)&v5 initWithCoder:a3];
}

@end