@interface CheckMarkView
- (CGSize)intrinsicContentSize;
- (_TtC9SiriSetup13CheckMarkView)initWithCoder:(id)a3;
- (_TtC9SiriSetup13CheckMarkView)initWithFrame:(CGRect)a3;
@end

@implementation CheckMarkView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = sub_235A41418();
  objc_msgSend(v3, sel_bounds);
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC9SiriSetup13CheckMarkView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CheckMarkView();
  return -[CheckMarkView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SiriSetup13CheckMarkView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_colorLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_checkMaskLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CheckMarkView();
  return [(CheckMarkView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SiriSetup13CheckMarkView_xMaskLayer);
}

@end