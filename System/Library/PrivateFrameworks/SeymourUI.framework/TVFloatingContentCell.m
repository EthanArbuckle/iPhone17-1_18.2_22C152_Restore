@interface TVFloatingContentCell
- (_TtC9SeymourUI21TVFloatingContentCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI21TVFloatingContentCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVFloatingContentCell

- (_TtC9SeymourUI21TVFloatingContentCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21TVFloatingContentCell *)sub_23A11A39C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI21TVFloatingContentCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI21TVFloatingContentCell_backgroundVisualEffectView;
  v6 = self;
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_effectWithStyle_, 18);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E50]), sel_initWithEffect_, v8);

  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)v9;

  result = (_TtC9SeymourUI21TVFloatingContentCell *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TVFloatingContentCell();
  v2 = (char *)v4.receiver;
  [(TVFloatingContentCell *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI21TVFloatingContentCell_backgroundVisualEffectView];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI21TVFloatingContentCell_floatingView], sel_cornerRadius, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_smu_setCornerRadius_);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A11A920(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVFloatingContentCell_floatingView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI21TVFloatingContentCell_backgroundVisualEffectView);
}

@end