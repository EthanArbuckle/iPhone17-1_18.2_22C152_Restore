@interface SBHapticSwitcherEventResponse
- (SBHapticSwitcherEventResponse)initWithHapticType:(int64_t)a3 phase:(int64_t)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)hapticType;
- (int64_t)phase;
- (int64_t)type;
- (unint64_t)hidEventSenderID;
- (void)setHidEventSenderID:(unint64_t)a3;
@end

@implementation SBHapticSwitcherEventResponse

- (int64_t)type
{
  return 3;
}

- (SBHapticSwitcherEventResponse)initWithHapticType:(int64_t)a3 phase:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBHapticSwitcherEventResponse;
  result = [(SBChainableModifierEventResponse *)&v7 init];
  if (result)
  {
    result->_hapticType = a3;
    result->_phase = a4;
    result->_hidEventSenderID = 0;
  }
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBHapticSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v14 descriptionBuilderWithMultilinePrefix:a3];
  v5 = v4;
  int64_t hapticType = self->_hapticType;
  objc_super v7 = @"FlyIn";
  if (hapticType == 2) {
    objc_super v7 = @"ReduceMotion";
  }
  if (hapticType == 1) {
    v8 = @"EmptySwitcher";
  }
  else {
    v8 = v7;
  }
  [v4 appendString:v8 withName:@"hapticType"];
  int64_t phase = self->_phase;
  v10 = @"Warmup";
  if (phase == 1) {
    v10 = @"Actuate";
  }
  if (phase == 2) {
    v11 = @"Cooldown";
  }
  else {
    v11 = v10;
  }
  [v5 appendString:v11 withName:@"phase"];
  id v12 = (id)[v5 appendUInt64:self->_hidEventSenderID withName:@"hidEventSenderID" format:1];
  return v5;
}

- (int64_t)hapticType
{
  return self->_hapticType;
}

- (int64_t)phase
{
  return self->_phase;
}

- (unint64_t)hidEventSenderID
{
  return self->_hidEventSenderID;
}

- (void)setHidEventSenderID:(unint64_t)a3
{
  self->_hidEventSenderID = a3;
}

@end