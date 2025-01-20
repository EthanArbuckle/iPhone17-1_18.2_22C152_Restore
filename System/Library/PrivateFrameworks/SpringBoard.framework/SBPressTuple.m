@interface SBPressTuple
- (BOOL)isEqual:(id)a3;
- (SBPressTuple)initWithDurationDown:(double)a3 durationUp:(double)a4;
- (double)durationDown;
- (double)durationUp;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setDurationDown:(double)a3;
- (void)setDurationUp:(double)a3;
@end

@implementation SBPressTuple

- (SBPressTuple)initWithDurationDown:(double)a3 durationUp:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBPressTuple;
  result = [(SBPressTuple *)&v7 init];
  if (result)
  {
    result->_durationDown = a3;
    result->_durationUp = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v7 = v6;
    }
    else {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }
  id v8 = v7;

  if (v8
    && ([(SBPressTuple *)self durationDown],
        [v8 durationDown],
        BSFloatEqualToFloat()))
  {
    [(SBPressTuple *)self durationUp];
    [v8 durationUp];
    char v9 = BSFloatEqualToFloat();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)succinctDescription
{
  v2 = [(SBPressTuple *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendFloat:@"durationDown" withName:self->_durationDown];
  id v5 = (id)[v3 appendFloat:@"durationUp" withName:self->_durationUp];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBPressTuple *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (double)durationDown
{
  return self->_durationDown;
}

- (void)setDurationDown:(double)a3
{
  self->_durationDown = a3;
}

- (double)durationUp
{
  return self->_durationUp;
}

- (void)setDurationUp:(double)a3
{
  self->_durationUp = a3;
}

@end