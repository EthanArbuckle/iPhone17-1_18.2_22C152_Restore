@interface PaletteContainerView
- (NSArray)interactions;
- (_TtC9SeymourUI20PaletteContainerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI20PaletteContainerView)initWithFrame:(CGRect)a3;
- (void)addInteraction:(id)a3;
- (void)layoutSubviews;
- (void)removeInteraction:(id)a3;
- (void)setInteractions:(id)a3;
@end

@implementation PaletteContainerView

- (NSArray)interactions
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_interactions);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A1BAF8);
  sub_23A7FFC78();

  v5 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v5;
}

- (void)setInteractions:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A1BAF8);
  sub_23A7FFC78();
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView);
  v5 = self;
  id v6 = (id)sub_23A7FFC58();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setInteractions_, v6);
}

- (_TtC9SeymourUI20PaletteContainerView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView;
  type metadata accessor for PaletteContainerView.ContainerView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_contentInsets);
  long long v9 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  _OWORD *v8 = *MEMORY[0x263F834E8];
  v8[1] = v9;

  result = (_TtC9SeymourUI20PaletteContainerView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A4EE6F0();
}

- (void)addInteraction:(id)a3
{
}

- (void)removeInteraction:(id)a3
{
}

- (_TtC9SeymourUI20PaletteContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI20PaletteContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_backgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView);
}

@end