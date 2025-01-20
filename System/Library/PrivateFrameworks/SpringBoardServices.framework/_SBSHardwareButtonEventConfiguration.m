@interface _SBSHardwareButtonEventConfiguration
- (id)description;
- (int64_t)maximumPriority;
- (unint64_t)eventMask;
- (void)setEventMask:(unint64_t)a3;
- (void)setMaximumPriority:(int64_t)a3;
@end

@implementation _SBSHardwareButtonEventConfiguration

- (void)setMaximumPriority:(int64_t)a3
{
  self->_maximumPriority = a3;
}

- (void)setEventMask:(unint64_t)a3
{
  self->_eventMask = a3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendUInt64:self->_eventMask withName:@"eventMask"];
  v5 = NSStringFromSBSHardwareButtonEventPriority(self->_maximumPriority);
  [v3 appendString:v5 withName:@"eventPriority"];

  v6 = [v3 build];

  return v6;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (int64_t)maximumPriority
{
  return self->_maximumPriority;
}

@end