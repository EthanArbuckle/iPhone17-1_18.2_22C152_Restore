@interface PopoverViewController
- (_TtC7MusicUI21PopoverViewController)initWithCoder:(id)a3;
- (_TtC7MusicUI21PopoverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7MusicUI21PopoverViewController)initWithRequest:(id)a3;
- (_TtC7MusicUI21PopoverViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
@end

@implementation PopoverViewController

- (_TtC7MusicUI21PopoverViewController)initWithRequest:(id)a3
{
  return (_TtC7MusicUI21PopoverViewController *)sub_229E776E4(a3);
}

- (_TtC7MusicUI21PopoverViewController)initWithCoder:(id)a3
{
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (_TtC7MusicUI21PopoverViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = a5;
  sub_229E77834();
}

- (_TtC7MusicUI21PopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_22A1707E0();
  }
  id v5 = a4;
  sub_229E77890();
}

@end