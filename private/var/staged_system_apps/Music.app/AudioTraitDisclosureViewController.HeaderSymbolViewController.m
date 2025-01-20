@interface AudioTraitDisclosureViewController.HeaderSymbolViewController
- (_TtCC5Music34AudioTraitDisclosureViewControllerP33_B18012DE9244B542B3AC7DEA702FBC9726HeaderSymbolViewController)initWithCoder:(id)a3;
- (_TtCC5Music34AudioTraitDisclosureViewControllerP33_B18012DE9244B542B3AC7DEA702FBC9726HeaderSymbolViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation AudioTraitDisclosureViewController.HeaderSymbolViewController

- (void)loadView
{
  v2 = self;
  sub_1004AAB08();
}

- (_TtCC5Music34AudioTraitDisclosureViewControllerP33_B18012DE9244B542B3AC7DEA702FBC9726HeaderSymbolViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtCC5Music34AudioTraitDisclosureViewControllerP33_B18012DE9244B542B3AC7DEA702FBC9726HeaderSymbolViewController_image) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtCC5Music34AudioTraitDisclosureViewControllerP33_B18012DE9244B542B3AC7DEA702FBC9726HeaderSymbolViewController_image) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AudioTraitDisclosureViewController.HeaderSymbolViewController();
  v9 = [(AudioTraitDisclosureViewController.HeaderSymbolViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtCC5Music34AudioTraitDisclosureViewControllerP33_B18012DE9244B542B3AC7DEA702FBC9726HeaderSymbolViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music34AudioTraitDisclosureViewControllerP33_B18012DE9244B542B3AC7DEA702FBC9726HeaderSymbolViewController_image) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudioTraitDisclosureViewController.HeaderSymbolViewController();
  return [(AudioTraitDisclosureViewController.HeaderSymbolViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music34AudioTraitDisclosureViewControllerP33_B18012DE9244B542B3AC7DEA702FBC9726HeaderSymbolViewController_image));
}

@end