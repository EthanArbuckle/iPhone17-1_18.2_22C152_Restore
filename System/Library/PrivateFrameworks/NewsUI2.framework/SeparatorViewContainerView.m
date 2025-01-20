@interface SeparatorViewContainerView
- (_TtC7NewsUI226SeparatorViewContainerView)initWithCoder:(id)a3;
- (_TtC7NewsUI226SeparatorViewContainerView)initWithFrame:(CGRect)a3;
@end

@implementation SeparatorViewContainerView

- (_TtC7NewsUI226SeparatorViewContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC7NewsUI226SeparatorViewContainerView_separator;
  id v10 = objc_allocWithZone((Class)sub_1DFDF0CF0());
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[SeparatorViewContainerView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  [(SeparatorViewContainerView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC7NewsUI226SeparatorViewContainerView_separator)];
  return v12;
}

- (_TtC7NewsUI226SeparatorViewContainerView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI226SeparatorViewContainerView_separator;
  id v6 = objc_allocWithZone((Class)sub_1DFDF0CF0());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI226SeparatorViewContainerView *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226SeparatorViewContainerView_separator));
}

@end