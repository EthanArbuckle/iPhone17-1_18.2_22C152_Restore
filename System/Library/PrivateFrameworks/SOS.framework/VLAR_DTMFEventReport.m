@interface VLAR_DTMFEventReport
- (NSDate)eventDate;
- (NSDate)loopStartDate;
- (NSString)language;
- (NSString)trigger;
- (VLAR_DTMFEventReport)initWithTrigger:(id)a3 state:(VLAR_DTMFStateRecord *)a4 loopStartDate:(id)a5;
- (VLAR_DTMFStateRecord)state;
- (double)elapsedSeconds;
- (int64_t)voiceLoopReason;
- (unint64_t)action;
- (unint64_t)command;
- (void)setAction:(unint64_t)a3;
- (void)setCommand:(unint64_t)a3;
- (void)setLanguage:(id)a3;
- (void)setState:(VLAR_DTMFStateRecord *)a3;
- (void)setVoiceLoopReason:(int64_t)a3;
@end

@implementation VLAR_DTMFEventReport

- (VLAR_DTMFEventReport)initWithTrigger:(id)a3 state:(VLAR_DTMFStateRecord *)a4 loopStartDate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VLAR_DTMFEventReport;
  v11 = [(VLAR_DTMFEventReport *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
    eventDate = v11->_eventDate;
    v11->_eventDate = (NSDate *)v12;

    objc_storeStrong((id *)&v11->_trigger, a3);
    long long v14 = *(_OWORD *)&a4->loopPhase;
    *(_OWORD *)&v11->_state.playbackState = *(_OWORD *)&a4->playbackState;
    *(_OWORD *)&v11->_state.loopPhase = v14;
    objc_storeStrong((id *)&v11->_loopStartDate, a5);
  }

  return v11;
}

- (double)elapsedSeconds
{
  [(NSDate *)self->_eventDate timeIntervalSinceDate:self->_loopStartDate];
  return result;
}

- (NSString)trigger
{
  return self->_trigger;
}

- (NSDate)loopStartDate
{
  return self->_loopStartDate;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (VLAR_DTMFStateRecord)state
{
  long long v3 = *(_OWORD *)&self[2].loopPhase;
  *(_OWORD *)&retstr->playbackState = *(_OWORD *)&self[2].playbackState;
  *(_OWORD *)&retstr->loopPhase = v3;
  return self;
}

- (void)setState:(VLAR_DTMFStateRecord *)a3
{
  long long v3 = *(_OWORD *)&a3->loopPhase;
  *(_OWORD *)&self->_state.playbackState = *(_OWORD *)&a3->playbackState;
  *(_OWORD *)&self->_state.loopPhase = v3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (int64_t)voiceLoopReason
{
  return self->_voiceLoopReason;
}

- (void)setVoiceLoopReason:(int64_t)a3
{
  self->_voiceLoopReason = a3;
}

- (unint64_t)command
{
  return self->_command;
}

- (void)setCommand:(unint64_t)a3
{
  self->_command = a3;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_loopStartDate, 0);

  objc_storeStrong((id *)&self->_trigger, 0);
}

@end