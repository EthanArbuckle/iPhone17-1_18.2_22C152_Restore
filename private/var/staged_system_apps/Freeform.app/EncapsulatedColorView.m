@interface EncapsulatedColorView
- (CGRect)frame;
- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView)initWithCoder:(id)a3;
- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation EncapsulatedColorView

- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView)initWithCoder:(id)a3
{
  result = (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EncapsulatedColorView();
  [(EncapsulatedColorView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EncapsulatedColorView();
  v7 = (char *)v9.receiver;
  -[EncapsulatedColorView setFrame:](&v9, "setFrame:", x, y, width, height);
  v8 = *(void **)&v7[OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView_colorView];
  [v7 frame];
  [v8 setFrame:0.0, 0.0];
}

- (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView_color));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedColorView_colorView);
}

@end