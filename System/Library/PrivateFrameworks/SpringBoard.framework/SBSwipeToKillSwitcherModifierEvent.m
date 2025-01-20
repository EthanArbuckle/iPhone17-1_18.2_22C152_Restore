@interface SBSwipeToKillSwitcherModifierEvent
- (BOOL)isDragging;
- (CGPoint)translation;
- (SBAppLayout)appLayout;
- (SBSwipeToKillSwitcherModifierEvent)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 progress:(double)a5 translation:(CGPoint)a6;
- (double)decelerationTargetProgress;
- (double)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)layoutRole;
- (int64_t)type;
- (void)setDecelerationTargetProgress:(double)a3;
- (void)setDragging:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setTranslation:(CGPoint)a3;
@end

@implementation SBSwipeToKillSwitcherModifierEvent

- (SBSwipeToKillSwitcherModifierEvent)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 progress:(double)a5 translation:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBSwipeToKillSwitcherModifierEvent;
  v13 = [(SBSwipeToKillSwitcherModifierEvent *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_layoutRole = a3;
    objc_storeStrong((id *)&v13->_appLayout, a4);
    v14->_progress = a5;
    v14->_translation.CGFloat x = x;
    v14->_translation.CGFloat y = y;
  }

  return v14;
}

- (int64_t)type
{
  return 12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBSwipeToKillSwitcherModifierEvent;
  v4 = [(SBChainableModifierEvent *)&v8 copyWithZone:a3];
  v4[4] = self->_layoutRole;
  uint64_t v5 = [(SBAppLayout *)self->_appLayout copy];
  v6 = (void *)v4[5];
  v4[5] = v5;

  v4[6] = *(void *)&self->_progress;
  *((_OWORD *)v4 + 4) = self->_translation;
  *((unsigned char *)v4 + 24) = self->_dragging;
  v4[7] = *(void *)&self->_decelerationTargetProgress;
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v11 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendFloat:@"progress" withName:self->_progress];
  id v6 = (id)objc_msgSend(v4, "appendPoint:withName:", @"translation", self->_translation.x, self->_translation.y);
  v7 = SBLayoutRoleDescription(self->_layoutRole);
  [v4 appendString:v7 withName:@"role"];

  objc_super v8 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v9 = (id)[v4 appendObject:v8 withName:@"appLayout"];

  return v4;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (double)decelerationTargetProgress
{
  return self->_decelerationTargetProgress;
}

- (void)setDecelerationTargetProgress:(double)a3
{
  self->_decelerationTargetProgress = a3;
}

- (void).cxx_destruct
{
}

@end