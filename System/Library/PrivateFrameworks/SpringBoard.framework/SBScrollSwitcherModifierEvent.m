@interface SBScrollSwitcherModifierEvent
- (BOOL)isUserInitiated;
- (CGPoint)contentOffset;
- (SBScrollSwitcherModifierEvent)initWithContentOffset:(CGPoint)a3 phase:(unint64_t)a4 userInitiated:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
- (unint64_t)phase;
- (void)setContentOffset:(CGPoint)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation SBScrollSwitcherModifierEvent

- (SBScrollSwitcherModifierEvent)initWithContentOffset:(CGPoint)a3 phase:(unint64_t)a4 userInitiated:(BOOL)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)SBScrollSwitcherModifierEvent;
  result = [(SBScrollSwitcherModifierEvent *)&v10 init];
  if (result)
  {
    result->_contentOffset.CGFloat x = x;
    result->_contentOffset.CGFloat y = y;
    result->_phase = a4;
    result->_userInitiated = a5;
  }
  return result;
}

- (int64_t)type
{
  return 19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBScrollSwitcherModifierEvent;
  id result = [(SBChainableModifierEvent *)&v5 copyWithZone:a3];
  *(CGPoint *)((char *)result + 40) = self->_contentOffset;
  *((void *)result + 4) = self->_phase;
  *((unsigned char *)result + 24) = self->_userInitiated;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBScrollSwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v9 descriptionBuilderWithMultilinePrefix:a3];
  objc_super v5 = NSStringFromCGPoint(self->_contentOffset);
  [v4 appendString:v5 withName:@"contentOffset"];

  if (self->_phase) {
    v6 = @"EndScrolling";
  }
  else {
    v6 = @"Scrolling";
  }
  [v4 appendString:v6 withName:@"phase"];
  id v7 = (id)[v4 appendBool:self->_userInitiated withName:@"userInitiated"];
  return v4;
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

@end