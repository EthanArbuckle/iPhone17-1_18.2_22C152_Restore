@interface CompactTextStyleView
- (BOOL)isHighlighted;
- (_TtC8PaperKit20CompactTextStyleView)initWithCoder:(id)a3;
- (_TtC8PaperKit20CompactTextStyleView)initWithFrame:(CGRect)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)didTapSelf;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CompactTextStyleView

- (_TtC8PaperKit20CompactTextStyleView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8PaperKit20CompactTextStyleView_imageView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82828]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC8PaperKit20CompactTextStyleView_image;
  closure #1 in variable initialization expression of CompactTextStyleView.image();
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = v9;

  result = (_TtC8PaperKit20CompactTextStyleView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(CompactTextStyleView *)&v6 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v2, sel_bounds);
  double Height = CGRectGetHeight(v7);
  objc_msgSend(v2, sel_bounds);
  double Width = CGRectGetWidth(v8);
  if (Width >= Height) {
    double Width = Height;
  }
  objc_msgSend(v3, sel_setCornerRadius_, Width * 0.5);
}

- (void)didTapSelf
{
  id v2 = self;
  CompactTextStyleView.didTapSelf()();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CompactTextStyleView *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  objc_super v6 = self;
  [(CompactTextStyleView *)&v11 setHighlighted:v3];
  v10.receiver = v6;
  v10.super_class = ObjectType;
  LODWORD(v3) = [(CompactTextStyleView *)&v10 isHighlighted];
  CGRect v7 = self;
  CGRect v8 = &selRef_secondarySystemFillColor;
  if (!v3) {
    CGRect v8 = &selRef_quaternarySystemFillColor;
  }
  id v9 = [v7 *v8];
  [(CompactTextStyleView *)v6 setBackgroundColor:v9];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (_TtC8PaperKit20CompactTextStyleView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit20CompactTextStyleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CompactTextStyleView_textStyleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CompactTextStyleView_imageView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit20CompactTextStyleView_image);
}

@end