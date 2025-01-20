@interface SATaskStateInTransition
- (SATaskStateInTransition)initWithKCDataTransitioningTask:(const transitioning_task_snapshot *)a3 andTerminatedThreadsInstructionCycles:(const instrs_cycles_snapshot *)a4 machTimebase:(mach_timebase_info)a5 andDonatingUniquePids:(id)a6 startTimestamp:(id)a7 endTimestamp:(id)a8 startSampleIndex:(unint64_t)a9 endSampleIndex:(unint64_t)a10;
- (unint64_t)transitionType;
@end

@implementation SATaskStateInTransition

- (unint64_t)transitionType
{
  return self->_transitionType;
}

- (SATaskStateInTransition)initWithKCDataTransitioningTask:(const transitioning_task_snapshot *)a3 andTerminatedThreadsInstructionCycles:(const instrs_cycles_snapshot *)a4 machTimebase:(mach_timebase_info)a5 andDonatingUniquePids:(id)a6 startTimestamp:(id)a7 endTimestamp:(id)a8 startSampleIndex:(unint64_t)a9 endSampleIndex:(unint64_t)a10
{
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SATaskStateInTransition;
  v16 = [(SATaskState *)&v20 initWithStartTimestamp:a7 endTimestamp:a8 startSampleIndex:a9 endSampleIndex:a10];
  v18 = v16;
  if (v16)
  {
    v16->_transitionType = a3->tts_transition_type;
    objc_setProperty_atomic(v16, v17, v15, 104);
    v18->super._ssFlags = a3->tts_ss_flags;
    if (a4)
    {
      v18->super._terminatedThreadsInstructions = a4->ics_instructions;
      v18->super._terminatedThreadsCycles = a4->ics_cycles;
    }
  }

  return v18;
}

@end