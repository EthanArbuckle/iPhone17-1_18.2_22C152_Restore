@interface BarrierBlockTimout
+ (id)create;
- (BOOL)armAndTestIfExpired;
- (BOOL)disarmAndTestIfWasExpired;
@end

@implementation BarrierBlockTimout

+ (id)create
{
  v2 = objc_alloc_init(BarrierBlockTimout);
  v2->_timerLock._os_unfair_lock_opaque = 0;
  *(_WORD *)&v2->_timerArmed = 0;
  v2->_arm_time = 0;

  return v2;
}

- (BOOL)armAndTestIfExpired
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  if (*(double *)&qword_100047C90 == 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v4) = info.denom;
    LODWORD(v5) = info.numer;
    *(double *)&qword_100047C90 = (double)v4 / (double)v5;
  }
  unint64_t v6 = (unint64_t)(*(double *)&qword_100047C90 * (double)mach_absolute_time());
  if (self->_timerArmed)
  {
    if (v6 - self->_arm_time >= 0x3B9ACA00) {
      self->_BOOL timerExpired = 1;
    }
  }
  else
  {
    self->_timerArmed = 1;
    self->_arm_time = v6;
  }
  BOOL timerExpired = self->_timerExpired;
  os_unfair_lock_unlock(p_timerLock);
  return timerExpired;
}

- (BOOL)disarmAndTestIfWasExpired
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  BOOL timerExpired = self->_timerExpired;
  *(_WORD *)&self->_timerArmed = 0;
  os_unfair_lock_unlock(p_timerLock);
  return timerExpired;
}

@end