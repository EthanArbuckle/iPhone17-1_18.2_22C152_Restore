@interface PTPersonReactionSlot
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeGestureLastSeenTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latestGestureFirstSeenTime;
- (PTEffectReaction)reaction;
- (PTPersonReactionSlot)initWithStartTime:(float)a3 stopTime:(float)a4;
- (float)milliSecondsToStart;
- (float)milliSecondsToStop;
- (unsigned)activeGestureType;
- (unsigned)latestGestureType;
- (void)setActiveGestureLastSeenTime:(id *)a3;
- (void)setActiveGestureType:(unsigned int)a3;
- (void)setLatestGestureFirstSeenTime:(id *)a3;
- (void)setLatestGestureType:(unsigned int)a3;
- (void)setMilliSecondsToStart:(float)a3;
- (void)setMilliSecondsToStop:(float)a3;
- (void)setReaction:(id)a3;
@end

@implementation PTPersonReactionSlot

- (PTPersonReactionSlot)initWithStartTime:(float)a3 stopTime:(float)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PTPersonReactionSlot;
  v6 = [(PTPersonReactionSlot *)&v13 init];
  v7 = (PTPersonReactionSlot *)v6;
  if (v6)
  {
    *((void *)v6 + 1) = 0;
    uint64_t v8 = MEMORY[0x1E4F1F9F8];
    long long v9 = *MEMORY[0x1E4F1F9F8];
    *((_OWORD *)v6 + 2) = *MEMORY[0x1E4F1F9F8];
    uint64_t v10 = *(void *)(v8 + 16);
    *((void *)v6 + 6) = v10;
    *(_OWORD *)(v6 + 56) = v9;
    *((void *)v6 + 9) = v10;
    *((float *)v6 + 4) = a3;
    *((float *)v6 + 5) = a4;
    v11 = v6;
  }

  return v7;
}

- (PTEffectReaction)reaction
{
  return (PTEffectReaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReaction:(id)a3
{
}

- (unsigned)activeGestureType
{
  return self->_activeGestureType;
}

- (void)setActiveGestureType:(unsigned int)a3
{
  self->_activeGestureType = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeGestureLastSeenTime
{
  objc_copyStruct(retstr, &self->_activeGestureLastSeenTime, 24, 1, 0);
  return result;
}

- (void)setActiveGestureLastSeenTime:(id *)a3
{
}

- (unsigned)latestGestureType
{
  return self->_latestGestureType;
}

- (void)setLatestGestureType:(unsigned int)a3
{
  self->_latestGestureType = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latestGestureFirstSeenTime
{
  objc_copyStruct(retstr, &self->_latestGestureFirstSeenTime, 24, 1, 0);
  return result;
}

- (void)setLatestGestureFirstSeenTime:(id *)a3
{
}

- (float)milliSecondsToStart
{
  return self->_milliSecondsToStart;
}

- (void)setMilliSecondsToStart:(float)a3
{
  self->_milliSecondsToStart = a3;
}

- (float)milliSecondsToStop
{
  return self->_milliSecondsToStop;
}

- (void)setMilliSecondsToStop:(float)a3
{
  self->_milliSecondsToStop = a3;
}

- (void).cxx_destruct
{
}

@end