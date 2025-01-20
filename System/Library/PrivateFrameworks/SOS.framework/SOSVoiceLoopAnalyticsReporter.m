@interface SOSVoiceLoopAnalyticsReporter
- (NSString)capture_FirstDTMFDigit;
- (NSString)language;
- (SOSVoiceLoopAnalyticsReporter)initWithReason:(int64_t)a3 language:(id)a4 dtmfAvailable:(BOOL)a5;
- (VLAR_DTMFEventReport)activeDTMFEventReport;
- (VLAR_DTMFStateRecord)state;
- (double)_elapsedSeconds;
- (double)capture_FirstDTMFCommand_Seconds;
- (double)capture_FirstDTMFDigit_Seconds;
- (double)capture_FirstLoopSilence_Seconds;
- (double)capture_FirstRepeatCommand_Seconds;
- (double)capture_Loop_StoppedAt_Seconds;
- (id)_newEventReportWithTrigger:(id)a3;
- (int64_t)voiceLoopReason;
- (unint64_t)capture_DTMFAvail_FirstFalse_LoopIteration;
- (unint64_t)capture_DTMFAvail_FirstTrue_LoopIteration;
- (unint64_t)capture_Loop_CompletedIterations;
- (unint64_t)capture_Loop_StoppedAt_Iteration;
- (unint64_t)capture_Loop_StoppedAt_Phase;
- (unint64_t)capture_Loop_StoppedBy;
- (unint64_t)nDTMFAvailNoToYes;
- (unint64_t)nDTMFAvailYesToNo;
- (void)_noteLoopInternalResumed;
- (void)_noteLoopStoppedBy:(unint64_t)a3 eventReport:(id)a4;
- (void)_submitReport:(id)a3;
- (void)reportVoiceLoopDidFinishHandlingDTMFDigitReceived:(char)a3;
- (void)reportVoiceLoopDidReceiveCommand:(unint64_t)a3;
- (void)reportVoiceLoopDidStartHandlingDTMFDigitReceived:(char)a3;
- (void)reportVoiceLoopIndexChanged:(unint64_t)a3;
- (void)reportVoiceLoopLoopPhaseChanged:(unint64_t)a3;
- (void)reportVoiceLoopPlaybackStateChanged:(unint64_t)a3;
- (void)reportVoiceLoopSupportsDTMF:(BOOL)a3;
- (void)reportVoiceLoopWillPerformAction:(unint64_t)a3;
- (void)reportVoiceLoopWillStopLocally;
- (void)reportVoiceLoopWillTerminate;
- (void)setActiveDTMFEventReport:(id)a3;
- (void)setState:(VLAR_DTMFStateRecord *)a3;
@end

@implementation SOSVoiceLoopAnalyticsReporter

- (SOSVoiceLoopAnalyticsReporter)initWithReason:(int64_t)a3 language:(id)a4 dtmfAvailable:(BOOL)a5
{
  v8 = (__CFString *)a4;
  v22.receiver = self;
  v22.super_class = (Class)SOSVoiceLoopAnalyticsReporter;
  v9 = [(SOSVoiceLoopAnalyticsReporter *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_voiceLoopReason = a3;
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = @"Unknown";
    }
    objc_storeStrong((id *)&v9->_language, v11);
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
    loopStartDate = v10->_loopStartDate;
    v10->_loopStartDate = (NSDate *)v12;

    v10->_state.dtmfAvailable = a5;
    v14 = objc_alloc_init(VLAR_DTMFEventsAccumulator);
    dtmfEventAccumulator = v10->_dtmfEventAccumulator;
    v10->_dtmfEventAccumulator = v14;

    v16 = objc_alloc_init(VLAR_DTMFCommandsAccumulator);
    dtmfCommandsAccumulator = v10->_dtmfCommandsAccumulator;
    v10->_dtmfCommandsAccumulator = v16;

    v18 = objc_alloc_init(VLAR_DTMFActionsAccumulator);
    dtmfActionsAccumulator = v10->_dtmfActionsAccumulator;
    v10->_dtmfActionsAccumulator = v18;

    capture_FirstDTMFDigit = v10->_capture_FirstDTMFDigit;
    v10->_capture_FirstDTMFDigit = (NSString *)&stru_1F0C40F10;

    v10->_capture_Loop_StoppedBy = 0;
  }

  return v10;
}

- (double)_elapsedSeconds
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSinceDate:self->_loopStartDate];
  double v5 = v4;

  return v5;
}

- (void)reportVoiceLoopWillStopLocally
{
  v3 = sos_vlar_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopWillStopLocally", v5, 2u);
  }

  id v4 = [(SOSVoiceLoopAnalyticsReporter *)self _newEventReportWithTrigger:@"LoopStoppedLocally"];
  [(SOSVoiceLoopAnalyticsReporter *)self _noteLoopStoppedBy:1 eventReport:v4];
  [(SOSVoiceLoopAnalyticsReporter *)self _submitReport:v4];
}

- (void)reportVoiceLoopWillTerminate
{
  v3 = sos_vlar_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopWillTerminate", v5, 2u);
  }

  id v4 = [(SOSVoiceLoopAnalyticsReporter *)self _newEventReportWithTrigger:@"SessionEnded"];
  [(SOSVoiceLoopAnalyticsReporter *)self _submitReport:v4];
}

- (void)_noteLoopStoppedBy:(unint64_t)a3 eventReport:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = sos_vlar_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v26 = a3;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_INFO, "_noteLoopStoppedBy:%tu", buf, 0xCu);
  }

  p_capture_Loop_StoppedBy = &self->_capture_Loop_StoppedBy;
  if (self->_capture_Loop_StoppedBy)
  {
    v9 = sos_vlar_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SOSVoiceLoopAnalyticsReporter _noteLoopStoppedBy:eventReport:]((uint64_t)p_capture_Loop_StoppedBy, v9, v10, v11, v12, v13, v14, v15);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v6 || ([v6 state], v24 != 100))
  {
    v9 = sos_vlar_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (v6)
      {
        [v6 state];
        unint64_t v20 = v21;
      }
      else
      {
        unint64_t v20 = 0;
      }
      *(_DWORD *)buf = 134217984;
      unint64_t v26 = v20;
      _os_log_error_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_ERROR, "_noteLoopStoppedBy but unexpected playbackState:%tu", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v16 = sos_vlar_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v26 = a3;
    _os_log_impl(&dword_1B3A94000, v16, OS_LOG_TYPE_DEFAULT, "_noteLoopStoppedBy:%tu, capturing", buf, 0xCu);
  }

  self->_capture_Loop_StoppedBy = a3;
  [v6 state];
  self->_capture_Loop_StoppedAt_Iteration = v23;
  [v6 state];
  self->_capture_Loop_StoppedAt_Phase = v22;
  [v6 elapsedSeconds];
  self->_capture_Loop_StoppedAt_Seconds = v17;
  self->_unint64_t capture_Loop_CompletedIterations = self->_capture_Loop_StoppedAt_Iteration - 1;
  v18 = sos_vlar_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t capture_Loop_CompletedIterations = self->_capture_Loop_CompletedIterations;
    *(_DWORD *)buf = 134217984;
    unint64_t v26 = capture_Loop_CompletedIterations;
    _os_log_impl(&dword_1B3A94000, v18, OS_LOG_TYPE_DEFAULT, "Reporting SOS loop played %lu times", buf, 0xCu);
  }

  +[SOSCoreAnalyticsReporter reportSOSNumberOfVoiceLoops:self->_capture_Loop_CompletedIterations];
LABEL_15:
}

- (void)_noteLoopInternalResumed
{
  v3 = sos_vlar_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "_noteLoopInternalResumed", v4, 2u);
  }

  self->_capture_Loop_StoppedBy = 0;
}

- (void)reportVoiceLoopPlaybackStateChanged:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v5 = sos_vlar_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopPlaybackStateChanged:%zd", (uint8_t *)&v6, 0xCu);
  }

  self->_state.playbackState = a3;
}

- (void)reportVoiceLoopIndexChanged:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v5 = sos_vlar_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopIndexChanged:%tu", (uint8_t *)&v6, 0xCu);
  }

  self->_state.loopIteration = a3;
}

- (void)reportVoiceLoopLoopPhaseChanged:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v5 = sos_vlar_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopLoopPhaseChanged:%zd", (uint8_t *)&v10, 0xCu);
  }

  self->_state.loopPhase = a3;
  [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstLoopSilence_Seconds];
  if (a3 == 10000 && v6 <= 0.0 && self->_state.playbackState == 100)
  {
    [(SOSVoiceLoopAnalyticsReporter *)self _elapsedSeconds];
    self->_double capture_FirstLoopSilence_Seconds = v7;
    uint64_t v8 = sos_vlar_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double capture_FirstLoopSilence_Seconds = self->_capture_FirstLoopSilence_Seconds;
      int v10 = 134217984;
      unint64_t v11 = *(void *)&capture_FirstLoopSilence_Seconds;
      _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "_capture_FirstLoopSilence_Seconds:%0.3f", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)reportVoiceLoopDidStartHandlingDTMFDigitReceived:(char)a3
{
  uint64_t v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v5 = sos_vlar_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 67240192;
    int v16 = v3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidStartHandlingDTMFDigitReceived:%{public}c", (uint8_t *)&v15, 8u);
  }

  [(VLAR_DTMFEventsAccumulator *)self->_dtmfEventAccumulator noteDidReceiveDTMFDigit:v3];
  double v6 = _NSStringFromDTMFDigitChar(v3);
  double v7 = [@"DTMF-" stringByAppendingString:v6];
  id v8 = [(SOSVoiceLoopAnalyticsReporter *)self _newEventReportWithTrigger:v7];
  [(SOSVoiceLoopAnalyticsReporter *)self setActiveDTMFEventReport:v8];

  if (![(NSString *)self->_capture_FirstDTMFDigit length])
  {
    objc_storeStrong((id *)&self->_capture_FirstDTMFDigit, v6);
    v9 = sos_vlar_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67240192;
      int v16 = v3;
      _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidStartHandlingDTMFDigitReceived:%{public}c => _capture_FirstDTMFDigit", (uint8_t *)&v15, 8u);
    }
  }
  [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstDTMFDigit_Seconds];
  if (v10 <= 0.0)
  {
    unint64_t v11 = [(SOSVoiceLoopAnalyticsReporter *)self activeDTMFEventReport];
    [v11 elapsedSeconds];
    self->_capture_FirstDTMFDigit_Seconds = v12;

    uint64_t v13 = sos_vlar_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstDTMFDigit_Seconds];
      int v15 = 67240448;
      int v16 = v3;
      __int16 v17 = 2048;
      uint64_t v18 = v14;
      _os_log_impl(&dword_1B3A94000, v13, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidStartHandlingDTMFDigitReceived:%{public}c => capture_FirstDTMFDigit_Seconds:%0.3f", (uint8_t *)&v15, 0x12u);
    }
  }
}

- (void)reportVoiceLoopDidReceiveCommand:(unint64_t)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  double v5 = sos_vlar_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v39 = a3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidReceiveCommand:%zd", buf, 0xCu);
  }

  dtmfCommandsAccumulator = self->_dtmfCommandsAccumulator;
  [(SOSVoiceLoopAnalyticsReporter *)self state];
  [(VLAR_DTMFCommandsAccumulator *)dtmfCommandsAccumulator noteDidReceiveDTMFCommand:a3 withPlaybackState:v37];
  double v7 = [(SOSVoiceLoopAnalyticsReporter *)self activeDTMFEventReport];
  id v8 = v7;
  if (!v7)
  {
    double v10 = sos_vlar_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopDidReceiveCommand:](a3, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_28;
  }
  if ([v7 command])
  {
    v9 = sos_vlar_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopDidReceiveCommand:](v8);
    }
  }
  else
  {
    [v8 setCommand:a3];
  }
  __int16 v17 = [(VLAR_DTMFCommandsAccumulator *)self->_dtmfCommandsAccumulator reportedCommands];
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v19 = [v17 indexOfObject:v18];

  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v20 = sos_vlar_log();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 134217984;
    unint64_t v39 = a3;
    unint64_t v21 = "reportVoiceLoopDidReceiveCommand:%tu command not reportable, ignoring for capture";
    unint64_t v22 = v20;
    os_log_type_t v23 = OS_LOG_TYPE_INFO;
  }
  else
  {
    [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstDTMFCommand_Seconds];
    if (v24 > 0.0)
    {
      unint64_t v20 = sos_vlar_log();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstDTMFCommand_Seconds];
      *(_DWORD *)buf = 134218240;
      unint64_t v39 = a3;
      __int16 v40 = 2048;
      uint64_t v41 = v25;
      unint64_t v21 = "reportVoiceLoopDidReceiveCommand:%tu but already have capture_FirstDTMFCommand_Seconds:%0.3f, ignoring";
      unint64_t v22 = v20;
      os_log_type_t v23 = OS_LOG_TYPE_INFO;
      uint32_t v26 = 22;
      goto LABEL_20;
    }
    [v8 elapsedSeconds];
    self->_double capture_FirstDTMFCommand_Seconds = v27;
    unint64_t v20 = sos_vlar_log();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    double capture_FirstDTMFCommand_Seconds = self->_capture_FirstDTMFCommand_Seconds;
    *(_DWORD *)buf = 134217984;
    unint64_t v39 = *(void *)&capture_FirstDTMFCommand_Seconds;
    unint64_t v21 = "_capture_FirstDTMFCommand_Seconds:%0.3f";
    unint64_t v22 = v20;
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  }
  uint32_t v26 = 12;
LABEL_20:
  _os_log_impl(&dword_1B3A94000, v22, v23, v21, buf, v26);
LABEL_21:

  if (a3 == 200)
  {
    [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstRepeatCommand_Seconds];
    if (v29 <= 0.0)
    {
      [v8 elapsedSeconds];
      self->_double capture_FirstRepeatCommand_Seconds = v35;
      double v10 = sos_vlar_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double capture_FirstRepeatCommand_Seconds = self->_capture_FirstRepeatCommand_Seconds;
        *(_DWORD *)buf = 134217984;
        unint64_t v39 = *(void *)&capture_FirstRepeatCommand_Seconds;
        v31 = "_capture_FirstRepeatCommand_Seconds:%0.3f";
        v32 = v10;
        os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
        uint32_t v34 = 12;
        goto LABEL_27;
      }
    }
    else
    {
      double v10 = sos_vlar_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstRepeatCommand_Seconds];
        *(_DWORD *)buf = 134218240;
        unint64_t v39 = 200;
        __int16 v40 = 2048;
        uint64_t v41 = v30;
        v31 = "reportVoiceLoopDidReceiveCommand:%tu but already have capture_FirstRepeatCommand_Seconds:%0.3f, ignoring";
        v32 = v10;
        os_log_type_t v33 = OS_LOG_TYPE_INFO;
        uint32_t v34 = 22;
LABEL_27:
        _os_log_impl(&dword_1B3A94000, v32, v33, v31, buf, v34);
      }
    }
LABEL_28:
  }
}

- (void)reportVoiceLoopWillPerformAction:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v5 = sos_vlar_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134217984;
    unint64_t v17 = a3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopWillPerformAction:%zd", (uint8_t *)&v16, 0xCu);
  }

  [(VLAR_DTMFActionsAccumulator *)self->_dtmfActionsAccumulator noteDTMFAction:a3];
  double v6 = [(SOSVoiceLoopAnalyticsReporter *)self activeDTMFEventReport];
  double v7 = v6;
  if (!v6)
  {
    id v8 = sos_vlar_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopWillPerformAction:](a3, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_9;
  }
  if ([v6 action])
  {
    id v8 = sos_vlar_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopWillPerformAction:](v7);
    }
LABEL_9:

    goto LABEL_11;
  }
  [v7 setAction:a3];
LABEL_11:
  if (a3 == 5000)
  {
    [(SOSVoiceLoopAnalyticsReporter *)self _noteLoopInternalResumed];
  }
  else if (a3 == 100)
  {
    uint64_t v15 = [(SOSVoiceLoopAnalyticsReporter *)self activeDTMFEventReport];
    [(SOSVoiceLoopAnalyticsReporter *)self _noteLoopStoppedBy:2 eventReport:v15];
  }
}

- (void)reportVoiceLoopDidFinishHandlingDTMFDigitReceived:(char)a3
{
  int v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v5 = sos_vlar_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67240192;
    v7[1] = v3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "reportVoiceLoopDidFinishHandlingDTMFDigitReceived:%{public}c", (uint8_t *)v7, 8u);
  }

  double v6 = [(SOSVoiceLoopAnalyticsReporter *)self activeDTMFEventReport];
  [(SOSVoiceLoopAnalyticsReporter *)self _submitReport:v6];

  [(SOSVoiceLoopAnalyticsReporter *)self setActiveDTMFEventReport:0];
}

- (void)reportVoiceLoopSupportsDTMF:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v5 = sos_vlar_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v3;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_INFO, "reportVoiceLoopSupportsDTMF:%{BOOL}d", buf, 8u);
  }

  if (v3)
  {
    if ([(SOSVoiceLoopAnalyticsReporter *)self capture_DTMFAvail_FirstTrue_LoopIteration])
    {
      goto LABEL_12;
    }
    [(SOSVoiceLoopAnalyticsReporter *)self state];
    self->_unint64_t capture_DTMFAvail_FirstTrue_LoopIteration = v13;
    double v6 = sos_vlar_log();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    unint64_t capture_DTMFAvail_FirstTrue_LoopIteration = self->_capture_DTMFAvail_FirstTrue_LoopIteration;
    *(_DWORD *)buf = 134217984;
    unint64_t v15 = capture_DTMFAvail_FirstTrue_LoopIteration;
    uint64_t v8 = "_capture_DTMFAvail_FirstTrue_LoopIteration:%tu";
    goto LABEL_10;
  }
  if ([(SOSVoiceLoopAnalyticsReporter *)self capture_DTMFAvail_FirstFalse_LoopIteration])
  {
    goto LABEL_12;
  }
  [(SOSVoiceLoopAnalyticsReporter *)self state];
  self->_unint64_t capture_DTMFAvail_FirstFalse_LoopIteration = v12;
  double v6 = sos_vlar_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t capture_DTMFAvail_FirstFalse_LoopIteration = self->_capture_DTMFAvail_FirstFalse_LoopIteration;
    *(_DWORD *)buf = 134217984;
    unint64_t v15 = capture_DTMFAvail_FirstFalse_LoopIteration;
    uint64_t v8 = "_capture_DTMFAvail_FirstFalse_LoopIteration:%tu";
LABEL_10:
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
  }
LABEL_11:

LABEL_12:
  if (self->_state.dtmfAvailable != v3)
  {
    self->_state.dtmfAvailable = v3;
    uint64_t v10 = 168;
    if (v3) {
      uint64_t v10 = 160;
    }
    ++*(Class *)((char *)&self->super.isa + v10);
    id v11 = [(SOSVoiceLoopAnalyticsReporter *)self _newEventReportWithTrigger:@"DTMFEnabledChanged"];
    [(SOSVoiceLoopAnalyticsReporter *)self _submitReport:v11];
  }
}

- (id)_newEventReportWithTrigger:(id)a3
{
  id v4 = a3;
  double v5 = [VLAR_DTMFEventReport alloc];
  [(SOSVoiceLoopAnalyticsReporter *)self state];
  double v6 = [(VLAR_DTMFEventReport *)v5 initWithTrigger:v4 state:&v9 loopStartDate:self->_loopStartDate];

  double v7 = [(SOSVoiceLoopAnalyticsReporter *)self language];
  [(VLAR_DTMFEventReport *)v6 setLanguage:v7];

  [(VLAR_DTMFEventReport *)v6 setVoiceLoopReason:[(SOSVoiceLoopAnalyticsReporter *)self voiceLoopReason]];
  return v6;
}

- (void)_submitReport:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = sos_vlar_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v62 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "_submitReport:%{public}@", buf, 0xCu);
  }

  v52 = [MEMORY[0x1E4F1CA60] dictionary];
  v59[0] = @"event_Trigger";
  v49 = [v4 trigger];
  v60[0] = v49;
  v59[1] = @"event_ElapsedSeconds";
  double v6 = NSNumber;
  [v4 elapsedSeconds];
  v47 = objc_msgSend(v6, "numberWithDouble:");
  v60[1] = v47;
  v59[2] = @"event_SOSVoiceLanguage";
  double v7 = [v4 language];
  v60[2] = v7;
  v59[3] = @"event_SOSVoiceEventVariant";
  unint64_t v8 = [v4 voiceLoopReason];
  if (v8 > 2) {
    uint64_t v9 = @"Unknown";
  }
  else {
    uint64_t v9 = off_1E6064BE8[v8];
  }
  v60[3] = v9;
  v59[4] = @"event_PlaybackState";
  uint64_t v10 = NSNumber;
  if (v4)
  {
    [v4 state];
    uint64_t v11 = v56;
  }
  else
  {
    uint64_t v11 = 0;
  }
  unint64_t v12 = [v10 numberWithUnsignedInteger:v11];
  v60[4] = v12;
  v59[5] = @"event_LoopIteration";
  unint64_t v13 = NSNumber;
  if (v4)
  {
    [v4 state];
    uint64_t v14 = v55;
  }
  else
  {
    uint64_t v14 = 0;
  }
  unint64_t v15 = [v13 numberWithUnsignedInteger:v14];
  v60[5] = v15;
  v59[6] = @"event_LoopPhase";
  uint64_t v16 = NSNumber;
  if (v4)
  {
    [v4 state];
    uint64_t v17 = v54;
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v18 = [v16 numberWithUnsignedInteger:v17];
  v60[6] = v18;
  v59[7] = @"event_DTMFAvailable";
  uint64_t v19 = NSNumber;
  if (v4)
  {
    [v4 state];
    BOOL v20 = v53 != 0;
  }
  else
  {
    BOOL v20 = 0;
  }
  unint64_t v21 = [v19 numberWithBool:v20];
  v60[7] = v21;
  v59[8] = @"event_DTMFCommand";
  unint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "command"));
  v60[8] = v22;
  v59[9] = @"event_DTMFAction";
  os_log_type_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "action"));
  v60[9] = v23;
  v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:10];

  v57[0] = @"capture_FirstDTMFDigit";
  v50 = [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstDTMFDigit];
  v58[0] = v50;
  v57[1] = @"capture_FirstDTMFDigit_Seconds";
  double v24 = NSNumber;
  [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstDTMFDigit_Seconds];
  v48 = objc_msgSend(v24, "numberWithDouble:");
  v58[1] = v48;
  v57[2] = @"capture_FirstDTMFCommand_Seconds";
  uint64_t v25 = NSNumber;
  [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstDTMFCommand_Seconds];
  v46 = objc_msgSend(v25, "numberWithDouble:");
  v58[2] = v46;
  v57[3] = @"capture_FirstLoopSilence_Seconds";
  uint32_t v26 = NSNumber;
  [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstLoopSilence_Seconds];
  v45 = objc_msgSend(v26, "numberWithDouble:");
  v58[3] = v45;
  v57[4] = @"capture_Loop_StoppedBy";
  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_Loop_StoppedBy](self, "capture_Loop_StoppedBy"));
  v58[4] = v44;
  v57[5] = @"capture_Loop_StoppedAt_Iteration";
  v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_Loop_StoppedAt_Iteration](self, "capture_Loop_StoppedAt_Iteration"));
  v58[5] = v43;
  v57[6] = @"capture_Loop_StoppedAt_Phase";
  uint64_t v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_Loop_StoppedAt_Phase](self, "capture_Loop_StoppedAt_Phase"));
  v58[6] = v42;
  v57[7] = @"capture_Loop_StoppedAt_Seconds";
  double v27 = NSNumber;
  [(SOSVoiceLoopAnalyticsReporter *)self capture_Loop_StoppedAt_Seconds];
  v28 = objc_msgSend(v27, "numberWithDouble:");
  v58[7] = v28;
  v57[8] = @"capture_Loop_CompletedIterations";
  double v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_Loop_CompletedIterations](self, "capture_Loop_CompletedIterations"));
  v58[8] = v29;
  v57[9] = @"capture_FirstRepeatCommand_Seconds";
  uint64_t v30 = NSNumber;
  [(SOSVoiceLoopAnalyticsReporter *)self capture_FirstRepeatCommand_Seconds];
  v31 = objc_msgSend(v30, "numberWithDouble:");
  v58[9] = v31;
  v57[10] = @"capture_DTMFAvail_FirstTrue_LoopIteration";
  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_DTMFAvail_FirstTrue_LoopIteration](self, "capture_DTMFAvail_FirstTrue_LoopIteration"));
  v58[10] = v32;
  v57[11] = @"capture_DTMFAvail_FirstFalse_LoopIteration";
  os_log_type_t v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter capture_DTMFAvail_FirstFalse_LoopIteration](self, "capture_DTMFAvail_FirstFalse_LoopIteration"));
  v58[11] = v33;
  v57[12] = @"nDTMFAvailNoToYes";
  uint32_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter nDTMFAvailNoToYes](self, "nDTMFAvailNoToYes"));
  v58[12] = v34;
  v57[13] = @"nDTMFAvailYesToNo";
  double v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SOSVoiceLoopAnalyticsReporter nDTMFAvailYesToNo](self, "nDTMFAvailYesToNo"));
  v58[13] = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:14];

  [v52 addEntriesFromDictionary:v51];
  [v52 addEntriesFromDictionary:v36];
  uint64_t v37 = [(VLAR_DTMFEventsAccumulator *)self->_dtmfEventAccumulator analyticsDataDict];
  [v52 addEntriesFromDictionary:v37];

  v38 = [(VLAR_DTMFCommandsAccumulator *)self->_dtmfCommandsAccumulator analyticsDataDict];
  [v52 addEntriesFromDictionary:v38];

  unint64_t v39 = [(VLAR_DTMFActionsAccumulator *)self->_dtmfActionsAccumulator analyticsDataDict];
  [v52 addEntriesFromDictionary:v39];

  __int16 v40 = sos_vlar_log();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v62 = v52;
    _os_log_impl(&dword_1B3A94000, v40, OS_LOG_TYPE_DEFAULT, "_submitReport => data:%{public}@", buf, 0xCu);
  }

  id v41 = v52;
  AnalyticsSendEventLazy();
}

id __47__SOSVoiceLoopAnalyticsReporter__submitReport___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int64_t)voiceLoopReason
{
  return self->_voiceLoopReason;
}

- (NSString)language
{
  return self->_language;
}

- (VLAR_DTMFStateRecord)state
{
  long long v3 = *(_OWORD *)&self[6].playbackState;
  *(_OWORD *)&retstr->playbackState = *(_OWORD *)&self[5].loopPhase;
  *(_OWORD *)&retstr->loopPhase = v3;
  return self;
}

- (void)setState:(VLAR_DTMFStateRecord *)a3
{
  long long v3 = *(_OWORD *)&a3->loopPhase;
  *(_OWORD *)&self->_state.playbackState = *(_OWORD *)&a3->playbackState;
  *(_OWORD *)&self->_state.loopPhase = v3;
}

- (VLAR_DTMFEventReport)activeDTMFEventReport
{
  return self->_activeDTMFEventReport;
}

- (void)setActiveDTMFEventReport:(id)a3
{
}

- (NSString)capture_FirstDTMFDigit
{
  return self->_capture_FirstDTMFDigit;
}

- (double)capture_FirstDTMFDigit_Seconds
{
  return self->_capture_FirstDTMFDigit_Seconds;
}

- (double)capture_FirstDTMFCommand_Seconds
{
  return self->_capture_FirstDTMFCommand_Seconds;
}

- (double)capture_FirstLoopSilence_Seconds
{
  return self->_capture_FirstLoopSilence_Seconds;
}

- (unint64_t)capture_Loop_StoppedBy
{
  return self->_capture_Loop_StoppedBy;
}

- (unint64_t)capture_Loop_StoppedAt_Iteration
{
  return self->_capture_Loop_StoppedAt_Iteration;
}

- (unint64_t)capture_Loop_StoppedAt_Phase
{
  return self->_capture_Loop_StoppedAt_Phase;
}

- (double)capture_Loop_StoppedAt_Seconds
{
  return self->_capture_Loop_StoppedAt_Seconds;
}

- (unint64_t)capture_Loop_CompletedIterations
{
  return self->_capture_Loop_CompletedIterations;
}

- (double)capture_FirstRepeatCommand_Seconds
{
  return self->_capture_FirstRepeatCommand_Seconds;
}

- (unint64_t)capture_DTMFAvail_FirstTrue_LoopIteration
{
  return self->_capture_DTMFAvail_FirstTrue_LoopIteration;
}

- (unint64_t)capture_DTMFAvail_FirstFalse_LoopIteration
{
  return self->_capture_DTMFAvail_FirstFalse_LoopIteration;
}

- (unint64_t)nDTMFAvailNoToYes
{
  return self->_nDTMFAvailNoToYes;
}

- (unint64_t)nDTMFAvailYesToNo
{
  return self->_nDTMFAvailYesToNo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capture_FirstDTMFDigit, 0);
  objc_storeStrong((id *)&self->_activeDTMFEventReport, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_dtmfActionsAccumulator, 0);
  objc_storeStrong((id *)&self->_dtmfCommandsAccumulator, 0);
  objc_storeStrong((id *)&self->_dtmfEventAccumulator, 0);

  objc_storeStrong((id *)&self->_loopStartDate, 0);
}

- (void)_noteLoopStoppedBy:(uint64_t)a3 eventReport:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportVoiceLoopDidReceiveCommand:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportVoiceLoopDidReceiveCommand:(void *)a1 .cold.2(void *a1)
{
  [a1 command];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_1B3A94000, v1, v2, "reportVoiceLoopDidReceiveCommand:%tu but already have activeDTMFEventReport.command:%tu; only 1 command expected per"
    " activeDTMFEventReport",
    v3,
    v4,
    v5,
    v6,
    v7);
}

- (void)reportVoiceLoopWillPerformAction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportVoiceLoopWillPerformAction:(void *)a1 .cold.2(void *a1)
{
  [a1 action];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_1B3A94000, v1, v2, "reportVoiceLoopWillPerformAction:%tu but already have activeDTMFEventReport.command:%tu; only 1 action expected per "
    "activeDTMFEventReport",
    v3,
    v4,
    v5,
    v6,
    v7);
}

@end