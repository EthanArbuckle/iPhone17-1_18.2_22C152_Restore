@interface SiriSharedUIStandardViewDropletMaterial
- (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial)initWithCoder:(id)a3;
- (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation SiriSharedUIStandardViewDropletMaterial

- (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial_fresnelView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82E00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial_isLightMode) = 1;

  result = (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial *)sub_20CA83348();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SiriSharedUIStandardViewDropletMaterial();
  v2 = (char *)v4.receiver;
  [(SiriSharedUIStandardVisualEffectView *)&v4 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial_fresnelView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

  sub_20CA2DF08();
}

- (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial)initWithEffect:(id)a3
{
  id v3 = a3;
  result = (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial_fresnelView));
}

@end