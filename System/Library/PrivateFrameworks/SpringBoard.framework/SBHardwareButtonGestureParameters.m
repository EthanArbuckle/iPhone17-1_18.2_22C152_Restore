@interface SBHardwareButtonGestureParameters
- (NSString)description;
- (double)longPressTimeInterval;
- (double)multiplePressTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)maximumPressCount;
@end

@implementation SBHardwareButtonGestureParameters

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[SBHardwareButtonGestureParameters allocWithZone:a3] init];
  [(SBHardwareButtonGestureParameters *)self multiplePressTimeInterval];
  v4->_multiplePressTimeInterval = v5;
  [(SBHardwareButtonGestureParameters *)self longPressTimeInterval];
  v4->_longPressTimeInterval = v6;
  v4->_maximumPressCount = [(SBHardwareButtonGestureParameters *)self maximumPressCount];
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[SBMutableHardwareButtonGestureParameters allocWithZone:a3] init];
  [(SBMutableHardwareButtonGestureParameters *)v4 setMaximumPressCount:[(SBHardwareButtonGestureParameters *)self maximumPressCount]];
  [(SBHardwareButtonGestureParameters *)self longPressTimeInterval];
  -[SBMutableHardwareButtonGestureParameters setLongPressTimeInterval:](v4, "setLongPressTimeInterval:");
  [(SBHardwareButtonGestureParameters *)self multiplePressTimeInterval];
  -[SBMutableHardwareButtonGestureParameters setMultiplePressTimeInterval:](v4, "setMultiplePressTimeInterval:");
  return v4;
}

- (NSString)description
{
  return (NSString *)[(SBHardwareButtonGestureParameters *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHardwareButtonGestureParameters *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBHardwareButtonGestureParameters *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHardwareButtonGestureParameters *)self succinctDescriptionBuilder];
  id v5 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBHardwareButtonGestureParameters maximumPressCount](self, "maximumPressCount"), @"maximumPressCount");
  [(SBHardwareButtonGestureParameters *)self longPressTimeInterval];
  id v6 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", @"longPressTimeInterval", 0);
  [(SBHardwareButtonGestureParameters *)self multiplePressTimeInterval];
  id v7 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", @"multiplePressTimeInterval", 0);
  return v4;
}

- (int64_t)maximumPressCount
{
  return self->_maximumPressCount;
}

- (double)longPressTimeInterval
{
  return self->_longPressTimeInterval;
}

- (double)multiplePressTimeInterval
{
  return self->_multiplePressTimeInterval;
}

@end