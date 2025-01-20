@interface MockViewController
- (_TtC17PhotosSwiftUICore18MockViewController)initWithCoder:(id)a3;
- (_TtC17PhotosSwiftUICore18MockViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation MockViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_259B866EC();
}

- (_TtC17PhotosSwiftUICore18MockViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_259C445A8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC17PhotosSwiftUICore18MockViewController *)MockViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC17PhotosSwiftUICore18MockViewController)initWithCoder:(id)a3
{
  return (_TtC17PhotosSwiftUICore18MockViewController *)MockViewController.init(coder:)(a3);
}

@end