@interface CompactTextAlignmentControl
- (BOOL)isHighlighted;
- (_TtC8PaperKit27CompactTextAlignmentControl)initWithCoder:(id)a3;
- (_TtC8PaperKit27CompactTextAlignmentControl)initWithFrame:(CGRect)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)didTapSelf;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)textAlignmentValueDidChange:(id)a3;
@end

@implementation CompactTextAlignmentControl

- (_TtC8PaperKit27CompactTextAlignmentControl)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized CompactTextAlignmentControl.init(coder:)();
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(CompactTextAlignmentControl *)&v6 layoutSubviews];
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
  CompactTextAlignmentControl.didTapSelf()();
}

- (void)textAlignmentValueDidChange:(id)a3
{
  char v4 = *((unsigned char *)a3 + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment + 8);
  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit27CompactTextAlignmentControl_selectedTextAlignment;
  *(void *)v5 = *(void *)((char *)a3 + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment);
  v5[8] = v4;
  id v6 = a3;
  CGRect v7 = self;
  CompactTextAlignmentControl.updateUI(selectedTextAlignmentDidChange:)(1);
  [(CompactTextAlignmentControl *)v7 sendActionsForControlEvents:4096];
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CompactTextAlignmentControl *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  id v6 = self;
  [(CompactTextAlignmentControl *)&v11 setHighlighted:v3];
  v10.receiver = v6;
  v10.super_class = ObjectType;
  LODWORD(v3) = [(CompactTextAlignmentControl *)&v10 isHighlighted];
  CGRect v7 = self;
  CGRect v8 = &selRef_secondarySystemFillColor;
  if (!v3) {
    CGRect v8 = &selRef_quaternarySystemFillColor;
  }
  id v9 = [v7 *v8];
  [(CompactTextAlignmentControl *)v6 setBackgroundColor:v9];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (_TtC8PaperKit27CompactTextAlignmentControl)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit27CompactTextAlignmentControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit27CompactTextAlignmentControl_imageView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit27CompactTextAlignmentControl_symbolConfiguration);
}

@end