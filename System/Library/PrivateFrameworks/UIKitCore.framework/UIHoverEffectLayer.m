@interface UIHoverEffectLayer
+ (BOOL)supportsStyle:(id)a3;
- (UIHoverEffectLayer)init;
- (UIHoverEffectLayer)initWithCoder:(id)a3;
- (UIHoverEffectLayer)initWithContainerView:(id)a3 style:(id)a4;
- (UIHoverEffectLayer)initWithLayer:(id)a3;
- (UIHoverStyle)hoverStyle;
- (UIView)containerView;
- (void)layoutSublayers;
- (void)setContainerView:(id)a3;
- (void)setHoverStyle:(id)a3;
@end

@implementation UIHoverEffectLayer

- (UIHoverStyle)hoverStyle
{
  return (UIHoverStyle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                 + OBJC_IVAR___UIHoverEffectLayer__hoverStyle));
}

- (void)setHoverStyle:(id)a3
{
  v4 = (char *)a3;
  v5 = self;
  sub_185A65A00(v4);
}

- (UIView)containerView
{
  v2 = (void *)MEMORY[0x18C109380]((char *)self + OBJC_IVAR___UIHoverEffectLayer_containerView, a2);
  return (UIView *)v2;
}

- (void)setContainerView:(id)a3
{
}

- (UIHoverEffectLayer)init
{
  return (UIHoverEffectLayer *)sub_185A6603C();
}

- (UIHoverEffectLayer)initWithCoder:(id)a3
{
  return (UIHoverEffectLayer *)UIHoverEffectLayer.init(coder:)(a3);
}

- (UIHoverEffectLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_186A1F1CC();
  swift_unknownObjectRelease();
  return (UIHoverEffectLayer *)sub_185A665D8(v4);
}

- (UIHoverEffectLayer)initWithContainerView:(id)a3 style:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UIHoverEffectLayer *)self init];
  swift_unknownObjectWeakAssign();
  if (v7)
  {
    v9 = v8;
    [(UIHoverEffectLayer *)v9 setHoverStyle:v7];
  }
  return v8;
}

- (void)layoutSublayers
{
  v2 = self;
  UIHoverEffectLayer.layoutSublayers()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_185638FA4(*(void **)((char *)&self->super.super.isa + OBJC_IVAR___UIHoverEffectLayer_shape), *(void *)((char *)&self->super._attr.refcount + OBJC_IVAR___UIHoverEffectLayer_shape), *(uint64_t *)((char *)&self->super._attr.layer + OBJC_IVAR___UIHoverEffectLayer_shape), *(uint64_t *)((char *)&self->super._attr._objc_observation_info + OBJC_IVAR___UIHoverEffectLayer_shape), *(void *)&self->_hoverStyle[OBJC_IVAR___UIHoverEffectLayer_shape], *(void *)&self->backgroundSublayers[OBJC_IVAR___UIHoverEffectLayer_shape], *(void *)&self->overlaySublayers[OBJC_IVAR___UIHoverEffectLayer_shape], self->shape[OBJC_IVAR___UIHoverEffectLayer_shape]);
  swift_unknownObjectWeakDestroy();
}

+ (BOOL)supportsStyle:(id)a3
{
  id v3 = a3;
  char v4 = sub_185A67928((uint64_t)v3);

  return v4 & 1;
}

@end