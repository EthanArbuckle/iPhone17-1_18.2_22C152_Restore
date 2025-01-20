@interface MRLayerClock
- (BOOL)_isPaused;
- (BOOL)isInPhaseIn;
- (BOOL)isInPhaseOut;
- (BOOL)isPaused;
- (BOOL)jumpedBackInTime;
- (BOOL)parentIsPaused;
- (BOOL)selfIsPaused;
- (MRLayerClock)initWithPlug:(id)a3;
- (double)containerDuration;
- (double)containerTime;
- (double)externalTime;
- (double)fullDuration;
- (double)loopDuration;
- (double)numberOfLoops;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (int64_t)currentLoopIndex;
- (void)deactivate;
- (void)pauseAfter:(double)a3;
- (void)pauseOnNextUpdate;
- (void)reactivateWithPlug:(id)a3;
- (void)resumeAfter:(double)a3;
- (void)resumeOnNextUpdate;
- (void)setContainerTime:(double)a3;
- (void)setExternalTime:(double)a3;
- (void)setFullDuration:(double)a3;
- (void)setLoopDuration:(double)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setParentIsPaused:(BOOL)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)syncToPlug:(id)a3;
- (void)updateForExternalTime:(double)externalTimeForPauseInversion;
@end

@implementation MRLayerClock

- (MRLayerClock)initWithPlug:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRLayerClock;
  v4 = [(MRLayerClock *)&v6 init];
  if (v4)
  {
    [a3 container];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || ([a3 container], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ((objc_msgSend(objc_msgSend(objc_msgSend(a3, "container"), "effectID"), "isEqualToString:", @"ReflectionsBackground") & 1) != 0|| objc_msgSend(objc_msgSend(objc_msgSend(a3, "container"), "effectID"), "isEqualToString:", @"VignettingOverlay")))
    {
      v4->_flags |= 0x80uLL;
    }
    [(MRLayerClock *)v4 syncToPlug:a3];
    v4->_externalTimeForPauseInversion = -1.0e10;
  }
  return v4;
}

- (void)reactivateWithPlug:(id)a3
{
  -[MRLayerClock syncToPlug:](self, "syncToPlug:");
  unint64_t flags = self->_flags;
  if ((flags & 0x21) == 0)
  {
    self->_unint64_t flags = flags | 1;
    unsigned int v6 = [a3 startsPaused];
    unint64_t flags = self->_flags;
    if (!v6) {
      flags |= 0x20uLL;
    }
  }
  self->_containerTime = -1.0e10;
  *(_OWORD *)&self->_internalTimeOffset = xmmword_165410;
  self->_unint64_t flags = flags | 4;
}

- (void)syncToPlug:(id)a3
{
  [a3 phaseInDuration];
  self->_phaseInDuration = v5;
  if ((self->_flags & 0x80) != 0) {
    double v6 = 1.0e10;
  }
  else {
    [a3 loopDuration];
  }
  self->_loopDuration = v6;
  [a3 phaseOutDuration];
  self->_phaseOutDuration = v7;
  [a3 numberOfLoops];
  self->_numberOfLoops = v8;
  self->_containerDuration = self->_phaseInDuration + self->_loopDuration + self->_phaseOutDuration;
}

- (void)deactivate
{
  self->_unint64_t flags = 0;
}

- (double)fullDuration
{
  return self->_phaseInDuration + self->_loopDuration * self->_numberOfLoops + self->_phaseOutDuration;
}

- (void)setFullDuration:(double)a3
{
  if ((self->_flags & 0x80) == 0)
  {
    double phaseInDuration = self->_phaseInDuration;
    if (phaseInDuration <= a3)
    {
      double phaseOutDuration = self->_phaseOutDuration;
      if (phaseInDuration + phaseOutDuration <= a3)
      {
        if (self->_numberOfLoops <= 1.0 || (double loopDuration = self->_loopDuration, loopDuration <= 0.0))
        {
          double loopDuration = a3 - phaseInDuration - phaseOutDuration;
          self->_double loopDuration = loopDuration;
          self->_numberOfLoops = 1.0;
        }
        else
        {
          self->_numberOfLoops = (a3 - phaseInDuration - phaseOutDuration) / loopDuration;
        }
      }
      else
      {
        self->_double loopDuration = 0.0;
        double phaseOutDuration = a3 - phaseInDuration;
        self->_double phaseOutDuration = a3 - phaseInDuration;
        double loopDuration = 0.0;
      }
    }
    else
    {
      self->_double phaseInDuration = a3;
      double phaseOutDuration = 0.0;
      double loopDuration = 0.0;
      double phaseInDuration = a3;
      self->_double loopDuration = 0.0;
      self->_double phaseOutDuration = 0.0;
    }
    self->_containerDuration = phaseInDuration + loopDuration + phaseOutDuration;
  }
}

- (void)updateForExternalTime:(double)externalTimeForPauseInversion
{
  self->_externalTime = externalTimeForPauseInversion;
  double phaseInDuration = self->_phaseInDuration;
  long double loopDuration = self->_loopDuration;
  self->_containerDuration = phaseInDuration + loopDuration + self->_phaseOutDuration;
  double internalTimeOffset = self->_internalTimeOffset;
  double containerTime = self->_containerTime;
  if (externalTimeForPauseInversion < 0.0)
  {
    self->_double internalTimeOffset = 0.0;
    self->_currentLoopIndex = 0;
    if (internalTimeOffset != -1.0e10) {
      self->_unint64_t flags = self->_flags & 0xFFFFFFFFFFFFFFFDLL | (2 * (containerTime > externalTimeForPauseInversion));
    }
    self->_double containerTime = externalTimeForPauseInversion;
    return;
  }
  unint64_t flags = self->_flags;
  BOOL v9 = (flags & 1) == 0;
  double v10 = self->_internalTimeOffset;
  if (internalTimeOffset == -1.0e10)
  {
    double v10 = externalTimeForPauseInversion - containerTime;
    self->_double internalTimeOffset = externalTimeForPauseInversion - containerTime;
    self->_currentLoopIndex = 0;
  }
  int v11 = flags & 1;
  if ((flags & 0x20) != 0 && (double v12 = self->_externalTimeForPauseInversion, v12 <= externalTimeForPauseInversion))
  {
    if ((flags & 1) == 0 || internalTimeOffset == -1.0e10 || containerTime == -1.0e10)
    {
      if (flags)
      {
        BOOL v13 = 0;
      }
      else
      {
        BOOL v13 = v12 >= 0.0;
        if (v12 >= 0.0 && internalTimeOffset != -1.0e10) {
          externalTimeForPauseInversion = self->_externalTimeForPauseInversion;
        }
      }
    }
    else
    {
      BOOL v13 = 0;
      double v10 = externalTimeForPauseInversion - (containerTime + (double)self->_currentLoopIndex * loopDuration);
      self->_double internalTimeOffset = v10;
    }
    unint64_t flags = flags & 0xFFFFFFFFFFFFFFDFLL ^ 1;
    self->_externalTimeForPauseInversion = -1.0e10;
    int v11 = v9;
  }
  else
  {
    BOOL v13 = 0;
  }
  if (internalTimeOffset == -1.0e10)
  {
    if (containerTime != -1.0e10) {
      goto LABEL_41;
    }
  }
  else if (((v13 | v11 ^ 1) & 1) == 0 && containerTime != -1.0e10)
  {
    flags &= ~2uLL;
    goto LABEL_41;
  }
  double v15 = externalTimeForPauseInversion - v10;
  if (v15 <= phaseInDuration)
  {
    int64_t v19 = 0;
  }
  else
  {
    double numberOfLoops = self->_numberOfLoops;
    if (v15 >= phaseInDuration + loopDuration * numberOfLoops)
    {
      double v15 = v15 - loopDuration * (numberOfLoops + -1.0);
      int64_t v19 = (uint64_t)(ceil(numberOfLoops) + -1.0);
    }
    else
    {
      if (loopDuration <= 0.0)
      {
        int64_t v19 = 0;
        double v18 = 0.0;
      }
      else
      {
        double v17 = v15 - phaseInDuration;
        double v18 = fmod(v15 - phaseInDuration, loopDuration);
        int64_t v19 = vcvtmd_s64_f64(v17 / loopDuration);
      }
      double v15 = phaseInDuration + v18;
    }
  }
  self->_currentLoopIndex = v19;
  unint64_t v20 = flags & 0xFFFFFFFFFFFFFFFDLL;
  if (v15 < containerTime) {
    unint64_t v20 = flags | 2;
  }
  if (internalTimeOffset != -1.0e10) {
    unint64_t flags = v20;
  }
  self->_double containerTime = v15;
  double containerTime = v15;
LABEL_41:
  unint64_t v21 = flags & 0xFFFFFFFFFFFFFFE7;
  self->_unint64_t flags = flags & 0xFFFFFFFFFFFFFFE7;
  if (containerTime >= 0.0 && (flags & 4) != 0)
  {
    if (containerTime >= phaseInDuration)
    {
      if (containerTime < phaseInDuration + loopDuration) {
        return;
      }
      unint64_t v23 = v21 | 0x10;
    }
    else
    {
      unint64_t v23 = v21 | 8;
    }
    self->_unint64_t flags = v23;
  }
}

- (void)resumeOnNextUpdate
{
  unint64_t v2 = self->_flags & 0xFFFFFFFFFFFFFFDFLL | (32 * (self->_flags & 1));
  self->_externalTimeForPauseInversion = -1.0e10;
  self->_unint64_t flags = v2;
}

- (void)pauseOnNextUpdate
{
  unint64_t v2 = (self->_flags & 0xFFFFFFFFFFFFFFDFLL | (32 * (self->_flags & 1))) ^ 0x20;
  self->_externalTimeForPauseInversion = -1.0e10;
  self->_unint64_t flags = v2;
}

- (void)resumeAfter:(double)a3
{
  unint64_t flags = self->_flags;
  if (flags)
  {
    unint64_t v4 = flags | 0x20;
    double v5 = self->_externalTime + a3;
  }
  else
  {
    unint64_t v4 = flags & 0xFFFFFFFFFFFFFFDFLL;
    double v5 = -1.0e10;
  }
  self->_unint64_t flags = v4;
  self->_externalTimeForPauseInversion = v5;
}

- (void)pauseAfter:(double)a3
{
  unint64_t flags = self->_flags;
  if (flags)
  {
    unint64_t v4 = flags & 0xFFFFFFFFFFFFFFDFLL;
    double v5 = -1.0e10;
  }
  else
  {
    unint64_t v4 = flags | 0x20;
    double v5 = self->_externalTime + a3;
  }
  self->_unint64_t flags = v4;
  self->_externalTimeForPauseInversion = v5;
}

- (void)setContainerTime:(double)a3
{
  if (self->_containerTime > a3)
  {
    unint64_t v3 = self->_flags | 2;
LABEL_5:
    self->_unint64_t flags = v3;
    goto LABEL_6;
  }
  if (self->_internalTimeOffset != -1.0e10)
  {
    unint64_t v3 = self->_flags & 0xFFFFFFFFFFFFFFFDLL;
    goto LABEL_5;
  }
LABEL_6:
  self->_double containerTime = a3;
  self->_double internalTimeOffset = -1.0e10;
}

- (BOOL)parentIsPaused
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (void)setParentIsPaused:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)_isPaused
{
  return (self->_flags & 0x41) != 0;
}

- (BOOL)isPaused
{
  unint64_t flags = self->_flags;
  BOOL v3 = (flags & 0x20) != 0 && self->_externalTimeForPauseInversion <= self->_externalTime;
  BOOL v4 = (flags >> 6) & 1;
  return (self->_flags & 1) != v3 || v4;
}

- (BOOL)selfIsPaused
{
  unint64_t flags = self->_flags;
  BOOL v3 = (flags & 0x20) != 0 && self->_externalTimeForPauseInversion <= self->_externalTime;
  return (flags & 1) != v3;
}

- (BOOL)jumpedBackInTime
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isInPhaseIn
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)isInPhaseOut
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (double)containerTime
{
  double result = self->_containerTime;
  if (result >= self->_containerDuration + -0.001) {
    return self->_containerDuration + -0.001;
  }
  return result;
}

- (double)externalTime
{
  return self->_externalTime;
}

- (void)setExternalTime:(double)a3
{
  self->_externalTime = a3;
}

- (double)phaseInDuration
{
  return self->_phaseInDuration;
}

- (void)setPhaseInDuration:(double)a3
{
  self->_double phaseInDuration = a3;
}

- (double)loopDuration
{
  return self->_loopDuration;
}

- (void)setLoopDuration:(double)a3
{
  self->_long double loopDuration = a3;
}

- (double)phaseOutDuration
{
  return self->_phaseOutDuration;
}

- (void)setPhaseOutDuration:(double)a3
{
  self->_double phaseOutDuration = a3;
}

- (double)numberOfLoops
{
  return self->_numberOfLoops;
}

- (void)setNumberOfLoops:(double)a3
{
  self->_double numberOfLoops = a3;
}

- (double)containerDuration
{
  return self->_containerDuration;
}

- (int64_t)currentLoopIndex
{
  return self->_currentLoopIndex;
}

@end