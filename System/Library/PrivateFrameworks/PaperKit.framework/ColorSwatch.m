@interface ColorSwatch
- (BOOL)isSelected;
- (_TtC8PaperKit11ColorSwatch)init;
- (_TtC8PaperKit11ColorSwatch)initWithCoder:(id)a3;
- (_TtC8PaperKit11ColorSwatch)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ColorSwatch

- (_TtC8PaperKit11ColorSwatch)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit11ColorSwatch_selectedColor) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  v4 = -[ColorSwatch initWithFrame:](&v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  ColorSwatch.updateUI()();

  return v4;
}

- (_TtC8PaperKit11ColorSwatch)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit11ColorSwatch_selectedColor) = 0;
  id v4 = a3;

  result = (_TtC8PaperKit11ColorSwatch *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(ColorSwatch *)&v6 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v2, sel_bounds);
  double Width = CGRectGetWidth(v7);
  objc_msgSend(v2, sel_bounds);
  double Height = CGRectGetHeight(v8);
  if (Height >= Width) {
    double Height = Width;
  }
  objc_msgSend(v3, sel_setCornerRadius_, Height * 0.5);
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ColorSwatch *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(ColorSwatch *)&v5 setSelected:v3];
  ColorSwatch.updateUI()();
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(ColorSwatch *)&v4 didMoveToWindow];
  id v3 = objc_msgSend(v2, sel_window, v4.receiver, v4.super_class);

  if (v3) {
    ColorSwatch.updateUI()();
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  CGRect v7 = self;
  ColorSwatch.updateUI()();
  v8.receiver = v7;
  v8.super_class = ObjectType;
  [(ColorSwatch *)&v8 traitCollectionDidChange:v6];
}

- (_TtC8PaperKit11ColorSwatch)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit11ColorSwatch *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end