@interface SessionPlatterMetricContainer
- (_TtC9SeymourUI29SessionPlatterMetricContainer)initWithCoder:(id)a3;
- (_TtC9SeymourUI29SessionPlatterMetricContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionPlatterMetricContainer

- (_TtC9SeymourUI29SessionPlatterMetricContainer)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI29SessionPlatterMetricContainer *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SessionPlatterMetricContainer();
  v2 = (char *)v6.receiver;
  [(SessionPlatterMetricContainer *)&v6 layoutSubviews];
  sub_23A40226C();
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI29SessionPlatterMetricContainer_contentView];
  id v4 = objc_msgSend(v3, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v4, sel_setAnchorPoint_, 0.0, 0.0);

  id v5 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v5, sel_setPosition_, 0.0, 0.0);
}

- (_TtC9SeymourUI29SessionPlatterMetricContainer)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI29SessionPlatterMetricContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionPlatterMetricContainer_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionPlatterMetricContainer_stackView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI29SessionPlatterMetricContainer_platter);
}

@end