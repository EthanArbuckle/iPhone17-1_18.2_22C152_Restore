@interface PTEffectReactionState
- (BOOL)uiTriggeredReaction;
- (double)startTime;
- (unint64_t)effectType;
- (void)setEffectType:(unint64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setUiTriggeredReaction:(BOOL)a3;
@end

@implementation PTEffectReactionState

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unint64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(unint64_t)a3
{
  self->_effectType = a3;
}

- (BOOL)uiTriggeredReaction
{
  return self->_uiTriggeredReaction;
}

- (void)setUiTriggeredReaction:(BOOL)a3
{
  self->_uiTriggeredReaction = a3;
}

@end