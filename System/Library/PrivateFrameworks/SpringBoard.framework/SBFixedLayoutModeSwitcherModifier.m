@interface SBFixedLayoutModeSwitcherModifier
- (SBFixedLayoutModeSwitcherModifier)initWithUpdateMode:(int64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
@end

@implementation SBFixedLayoutModeSwitcherModifier

- (id)animationAttributesForLayoutElement:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFixedLayoutModeSwitcherModifier;
  v4 = [(SBFixedLayoutModeSwitcherModifier *)&v7 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  [v5 setUpdateMode:self->_updateMode];
  [v5 setLayoutUpdateMode:self->_updateMode];
  [v5 setPositionUpdateMode:self->_updateMode];
  [v5 setScaleUpdateMode:self->_updateMode];
  [v5 setOpacityUpdateMode:self->_updateMode];
  [v5 setCornerRadiusUpdateMode:self->_updateMode];
  [v5 setClippingUpdateMode:self->_updateMode];
  return v5;
}

- (SBFixedLayoutModeSwitcherModifier)initWithUpdateMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFixedLayoutModeSwitcherModifier;
  result = [(SBSwitcherModifier *)&v5 init];
  if (result) {
    result->_updateMode = a3;
  }
  return result;
}

@end