@interface TTRListBadgeView.ShadowLayer
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer)init;
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer)initWithCoder:(id)a3;
- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation TTRListBadgeView.ShadowLayer

- (void)layoutSublayers
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRListBadgeView.ShadowLayer();
  id v2 = v4.receiver;
  [(TTRListBadgeView.ShadowLayer *)&v4 layoutSublayers];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  CGPathRef v3 = CGPathCreateWithEllipseInRect(v5, 0);
  objc_msgSend(v2, sel_setShadowPath_, v3);
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRListBadgeView.ShadowLayer();
  return [(TTRNoDefaultImplicitActionLayer *)&v3 init];
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B9970200();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  uint64_t v4 = sub_1B9970B90();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRListBadgeView.ShadowLayer();
  CGRect v5 = [(TTRNoDefaultImplicitActionLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

- (_TtCC15RemindersUICore16TTRListBadgeViewP33_3DF80B16FE3BCF93F419A82E393676A411ShadowLayer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRListBadgeView.ShadowLayer();
  return [(TTRNoDefaultImplicitActionLayer *)&v5 initWithCoder:a3];
}

@end