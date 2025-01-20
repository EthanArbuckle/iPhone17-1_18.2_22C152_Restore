@interface TTRListBadgeView.BackgroundLayer
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer)init;
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer)initWithCoder:(id)a3;
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer)initWithLayer:(id)a3;
- (float)opacity;
- (void)layoutSublayers;
- (void)setOpacity:(float)a3;
@end

@implementation TTRListBadgeView.BackgroundLayer

- (float)opacity
{
  uint64_t v3 = MEMORY[0x1BA9DB180]((char *)self+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_fillLayer, a2);
  if (!v3) {
    return 1.0;
  }
  v4 = (void *)v3;
  v5 = self;
  objc_msgSend(v4, sel_opacity);
  float v7 = v6;

  return v7;
}

- (void)setOpacity:(float)a3
{
  uint64_t v5 = MEMORY[0x1BA9DB180]((char *)self+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_fillLayer, a2);
  if (v5)
  {
    id v8 = (id)v5;
    float v6 = self;
    *(float *)&double v7 = a3;
    objc_msgSend(v8, sel_setOpacity_, v7);
  }
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer)init
{
  return (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer *)sub_1B989EAF8();
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B98A26F4();
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B9970200();
  swift_unknownObjectRelease();
  return (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer *)sub_1B989ED34(v4);
}

- (void)layoutSublayers
{
  v2 = self;
  sub_1B989EEC4();
}

- (void).cxx_destruct
{
  sub_1B98A0784(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings), *(void **)((char *)&self->super.super._attr.refcount+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings), *(uint64_t *)((char *)&self->super.super._attr.layer+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings), *(void **)((char *)&self->super.super._attr._objc_observation_info+ OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings), *(void **)&self->shape[OBJC_IVAR____TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A415BackgroundLayer_gradientAndBorderSettings]);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end