@interface FakePlayerViewController
- (_TtC5BooksP33_4CE531663E8287118D36641A99287EBA24FakePlayerViewController)initWithCoder:(id)a3;
- (_TtC5BooksP33_4CE531663E8287118D36641A99287EBA24FakePlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation FakePlayerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100409E3C();
}

- (_TtC5BooksP33_4CE531663E8287118D36641A99287EBA24FakePlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1007FDC70();
    id v6 = a4;
    NSString v7 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FakePlayerViewController();
  v9 = [(FakePlayerViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC5BooksP33_4CE531663E8287118D36641A99287EBA24FakePlayerViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FakePlayerViewController();
  return [(FakePlayerViewController *)&v5 initWithCoder:a3];
}

@end