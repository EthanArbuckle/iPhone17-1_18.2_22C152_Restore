@interface MiniMastheadView
- (BOOL)accessibilityElementsHidden;
- (_TtC7NewsUI216MiniMastheadView)initWithCoder:(id)a3;
- (_TtC7NewsUI216MiniMastheadView)initWithFrame:(CGRect)a3;
- (double)contentAlpha;
- (double)verticalOffset;
- (void)setContentAlpha:(double)a3;
- (void)setVerticalOffset:(double)a3;
@end

@implementation MiniMastheadView

- (_TtC7NewsUI216MiniMastheadView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC7NewsUI216MiniMastheadView_titleView;
  id v10 = objc_allocWithZone(MEMORY[0x1E4F82CE0]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[MiniMastheadView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  [(MiniMastheadView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216MiniMastheadView_titleView)];
  return v12;
}

- (_TtC7NewsUI216MiniMastheadView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI216MiniMastheadView_titleView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F82CE0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI216MiniMastheadView *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (BOOL)accessibilityElementsHidden
{
  v2 = self;
  id v3 = [(MiniMastheadView *)v2 window];
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(v3, sel_traitCollection);
    id v6 = objc_msgSend(v5, sel_horizontalSizeClass);

    return v6 == (id)1;
  }
  else
  {

    return 0;
  }
}

- (double)contentAlpha
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI216MiniMastheadView_titleView), sel_alpha);
  return result;
}

- (void)setContentAlpha:(double)a3
{
}

- (double)verticalOffset
{
  [(MiniMastheadView *)self transform];
  return v3;
}

- (void)setVerticalOffset:(double)a3
{
  v4 = self;
  [(MiniMastheadView *)v4 transform];
  double v6 = a3;
  [(MiniMastheadView *)v4 setTransform:&v5];
}

- (void).cxx_destruct
{
}

@end