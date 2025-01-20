@interface _UIKBRTDecayingObject
- (BOOL)isActive;
- (BOOL)isDecaying;
- (BOOL)isHolding;
- (_UIKBRTDecayingObject)initWithTimeoutDuration:(double)a3;
- (double)lastUpdate;
- (double)timeoutDuration;
- (void)onResetDo:(id)a3;
- (void)reset;
- (void)resetActiveDecayTo:(double)a3;
- (void)resetDecayTo:(double)a3;
- (void)setTimeoutDuration:(double)a3;
- (void)startDecaying;
- (void)startOrUpdateDecay;
- (void)updateDecay;
@end

@implementation _UIKBRTDecayingObject

- (_UIKBRTDecayingObject)initWithTimeoutDuration:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIKBRTDecayingObject;
  result = [(_UIKBRTDecayingObject *)&v5 init];
  if (result) {
    result->_timeoutDuration = a3;
  }
  return result;
}

- (void)startDecaying
{
  if (self->_isHolding)
  {
    *(_WORD *)&self->_isDecaying = 1;
    self->_lastUpdate = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  }
}

- (BOOL)isActive
{
  return self->_isHolding || self->_isDecaying;
}

- (void)resetDecayTo:(double)a3
{
  if (CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff - a3 >= self->_timeoutDuration)
  {
    [(_UIKBRTDecayingObject *)self reset];
  }
  else
  {
    self->_lastUpdate = a3;
    *(_WORD *)&self->_isDecaying = 256;
  }
}

- (void)reset
{
  *(_WORD *)&self->_isDecaying = 0;
  self->_lastUpdate = 0.0;
  [(NSMutableArray *)self->_resetBlocks enumerateObjectsUsingBlock:&__block_literal_global_256_1];
}

- (void)updateDecay
{
  if (self->_isDecaying
    && CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff - self->_lastUpdate >= self->_timeoutDuration)
  {
    [(_UIKBRTDecayingObject *)self reset];
  }
}

- (void)startOrUpdateDecay
{
  if (self->_isHolding)
  {
    [(_UIKBRTDecayingObject *)self startDecaying];
  }
  else if (self->_isDecaying)
  {
    [(_UIKBRTDecayingObject *)self updateDecay];
  }
}

- (void)resetActiveDecayTo:(double)a3
{
  if (self->_isHolding || self->_isDecaying) {
    [(_UIKBRTDecayingObject *)self resetDecayTo:a3];
  }
}

- (void)onResetDo:(id)a3
{
  id v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_resetBlocks)
  {
    objc_super v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resetBlocks = v4->_resetBlocks;
    v4->_resetBlocks = v5;
  }
  objc_sync_exit(v4);

  v7 = v4->_resetBlocks;
  v8 = (void *)[v10 copy];
  v9 = _Block_copy(v8);
  [(NSMutableArray *)v7 addObject:v9];
}

- (double)lastUpdate
{
  return self->_lastUpdate;
}

- (double)timeoutDuration
{
  return self->_timeoutDuration;
}

- (void)setTimeoutDuration:(double)a3
{
  self->_timeoutDuration = a3;
}

- (BOOL)isDecaying
{
  return self->_isDecaying;
}

- (BOOL)isHolding
{
  return self->_isHolding;
}

- (void).cxx_destruct
{
}

@end