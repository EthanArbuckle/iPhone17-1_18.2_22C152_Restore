@interface AudioTraitDisclosureViewController.HeaderSymbolViewController
- (_TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController)initWithCoder:(id)a3;
- (_TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation AudioTraitDisclosureViewController.HeaderSymbolViewController

- (void)loadView
{
  v2 = self;
  sub_2E5510();
}

- (_TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_AB6510();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController_image) = 0;
    id v6 = a4;
    NSString v7 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController_image) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AudioTraitDisclosureViewController.HeaderSymbolViewController();
  v9 = [(AudioTraitDisclosureViewController.HeaderSymbolViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController_image) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudioTraitDisclosureViewController.HeaderSymbolViewController();
  id v4 = a3;
  v5 = [(AudioTraitDisclosureViewController.HeaderSymbolViewController *)&v7 initWithCoder:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController_image));
}

@end