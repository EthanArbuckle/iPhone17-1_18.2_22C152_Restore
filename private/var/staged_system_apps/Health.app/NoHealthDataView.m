@interface NoHealthDataView
- (_TtC6Health16NoHealthDataView)initWithCoder:(id)a3;
- (_TtC6Health16NoHealthDataView)initWithFrame:(CGRect)a3;
@end

@implementation NoHealthDataView

- (_TtC6Health16NoHealthDataView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC6Health16NoHealthDataView_label;
  id v9 = objc_allocWithZone((Class)UILabel);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 init];

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for NoHealthDataView();
  v11 = -[NoHealthDataView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_10008150C();

  return v11;
}

- (_TtC6Health16NoHealthDataView)initWithCoder:(id)a3
{
  return (_TtC6Health16NoHealthDataView *)sub_100081438(a3);
}

- (void).cxx_destruct
{
}

@end