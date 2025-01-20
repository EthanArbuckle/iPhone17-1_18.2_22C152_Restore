@interface BiometricPresenceDetectOperationPearl
- (BOOL)checked;
- (BOOL)continuous;
- (BOOL)eyeRelief;
- (BOOL)finished;
- (BOOL)highPriority;
- (BOOL)motionDetect;
- (BOOL)timeouted;
- (NSTimer)timer;
- (unint64_t)endTime;
- (unsigned)cancelledMessage;
- (unsigned)taskPausedMessage;
- (unsigned)taskResumeFailedMessage;
- (unsigned)taskResumedMessage;
- (void)dealloc;
- (void)setChecked:(BOOL)a3;
- (void)setContinuous:(BOOL)a3;
- (void)setEndTime:(unint64_t)a3;
- (void)setEyeRelief:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setMotionDetect:(BOOL)a3;
- (void)setTimeouted:(BOOL)a3;
- (void)setTimer:(id)a3;
@end

@implementation BiometricPresenceDetectOperationPearl

- (unsigned)taskPausedMessage
{
  return 0;
}

- (unsigned)taskResumedMessage
{
  return 0;
}

- (unsigned)taskResumeFailedMessage
{
  return 0;
}

- (unsigned)cancelledMessage
{
  if (!self->_checked) {
    return 99;
  }
  if (self->_finished) {
    return 1050;
  }
  if (self->_timeouted) {
    return 1051;
  }
  return 99;
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BiometricPresenceDetectOperationPearl;
  [(BiometricPresenceDetectOperationPearl *)&v3 dealloc];
}

- (BOOL)continuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_endTime = a3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (BOOL)eyeRelief
{
  return self->_eyeRelief;
}

- (void)setEyeRelief:(BOOL)a3
{
  self->_eyeRelief = a3;
}

- (BOOL)motionDetect
{
  return self->_motionDetect;
}

- (void)setMotionDetect:(BOOL)a3
{
  self->_motionDetect = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)checked
{
  return self->_checked;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
}

- (BOOL)timeouted
{
  return self->_timeouted;
}

- (void)setTimeouted:(BOOL)a3
{
  self->_timeouted = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void).cxx_destruct
{
}

@end