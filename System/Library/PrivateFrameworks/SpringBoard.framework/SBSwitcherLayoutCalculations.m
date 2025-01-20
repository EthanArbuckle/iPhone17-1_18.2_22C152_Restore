@interface SBSwitcherLayoutCalculations
- (CGRect)frame;
- (NSString)description;
- (double)scale;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setFrame:(CGRect)a3;
- (void)setScale:(double)a3;
@end

@implementation SBSwitcherLayoutCalculations

- (NSString)description
{
  return (NSString *)[(SBSwitcherLayoutCalculations *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSwitcherLayoutCalculations *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSwitcherLayoutCalculations *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBSwitcherLayoutCalculations *)self succinctDescriptionBuilder];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"frame", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  id v6 = (id)[v4 appendFloat:@"scale" withName:3 decimalPrecision:self->_scale];
  return v4;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

@end