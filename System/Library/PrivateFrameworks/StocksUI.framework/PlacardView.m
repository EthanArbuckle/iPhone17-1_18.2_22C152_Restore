@interface PlacardView
- (_TtC8StocksUI11PlacardView)initWithCoder:(id)a3;
- (_TtC8StocksUI11PlacardView)initWithFrame:(CGRect)a3;
@end

@implementation PlacardView

- (_TtC8StocksUI11PlacardView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC8StocksUI11PlacardView_messageLabel;
  id v10 = objc_allocWithZone(MEMORY[0x263F828E0]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[PlacardView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  [(PlacardView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC8StocksUI11PlacardView_messageLabel)];
  return v12;
}

- (_TtC8StocksUI11PlacardView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI11PlacardView_messageLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI11PlacardView *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end