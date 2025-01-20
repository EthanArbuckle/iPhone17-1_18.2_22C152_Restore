@interface _UIMagicMorphView
- (BOOL)allowsElasticMorph;
- (BOOL)wantsEdgeAntialiasing;
- (_UIMagicMorphView)initWithCoder:(id)a3;
- (_UIMagicMorphView)initWithFrame:(CGRect)a3;
- (unint64_t)preferredMorphingAxis;
- (void)addMilestone:(id)a3 named:(id)a4;
- (void)layoutSubviews;
- (void)magicMoveItemsWithin:(id)a3;
- (void)morphTo:(id)a3;
- (void)removeMilestoneWithNamed:(id)a3;
- (void)reset;
- (void)setAllowsElasticMorph:(BOOL)a3;
- (void)setPreferredMorphingAxis:(unint64_t)a3;
- (void)setWantsEdgeAntialiasing:(BOOL)a3;
- (void)updateContentSize;
@end

@implementation _UIMagicMorphView

- (_UIMagicMorphView)initWithFrame:(CGRect)a3
{
  return (_UIMagicMorphView *)sub_18549C47C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)wantsEdgeAntialiasing
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_wantsEdgeAntialiasing);
}

- (void)setWantsEdgeAntialiasing:(BOOL)a3
{
  v4 = self;
  sub_185A5E044(a3);
}

- (BOOL)allowsElasticMorph
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_allowsElasticMorph);
}

- (void)setAllowsElasticMorph:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_allowsElasticMorph) = a3;
}

- (unint64_t)preferredMorphingAxis
{
  return *(unint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_preferredMorphingAxis);
}

- (void)setPreferredMorphingAxis:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_preferredMorphingAxis) = (Class)a3;
}

- (_UIMagicMorphView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185A63888();
}

- (void)morphTo:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_185A5E730(v4);
}

- (void)magicMoveItemsWithin:(id)a3
{
  id v4 = (char *)a3;
  v5 = self;
  sub_185A5FF54(v4);
}

- (void)reset
{
  v2 = self;
  sub_185A60998();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_185A60ED0();
}

- (void)updateContentSize
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____UIMagicMorphView_contentSizeDidChange) = 1;
  v2 = self;
  [(UIView *)v2 setNeedsLayout];
  if (objc_msgSend(self, sel__isInAnimationBlock)) {
    [(UIView *)v2 layoutIfNeeded];
  }
}

- (void)addMilestone:(id)a3 named:(id)a4
{
  uint64_t v6 = sub_186A1E95C();
  uint64_t v8 = v7;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____UIMagicMorphView_milestones);
  swift_beginAccess();
  id v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v9;
  uint64_t *v9 = 0x8000000000000000;
  sub_185977E94((uint64_t)v10, v6, v8, isUniquelyReferenced_nonNull_native);
  uint64_t *v9 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)removeMilestoneWithNamed:(id)a3
{
  uint64_t v4 = sub_186A1E95C();
  uint64_t v6 = v5;
  swift_beginAccess();
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_185A02074(v4, v6);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end