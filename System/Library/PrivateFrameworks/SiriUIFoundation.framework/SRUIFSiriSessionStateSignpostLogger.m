@interface SRUIFSiriSessionStateSignpostLogger
- (void)sessionStateHandler:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 forEvent:(int64_t)a6 machAbsoluteTime:(double)a7;
@end

@implementation SRUIFSiriSessionStateSignpostLogger

- (void)sessionStateHandler:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 forEvent:(int64_t)a6 machAbsoluteTime:(double)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  if (a6 == 6)
  {
    if (self->_thinkingIntervalID)
    {
      v17 = (id)*MEMORY[0x263F28348];
      v18 = v17;
      os_signpost_id_t thinkingIntervalID = self->_thinkingIntervalID;
      if (thinkingIntervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        LOWORD(v26) = 0;
        _os_signpost_emit_with_name_impl(&dword_225FBA000, v18, OS_SIGNPOST_INTERVAL_END, thinkingIntervalID, "ThinkingStateTransition", "", (uint8_t *)&v26, 2u);
      }

      self->_os_signpost_id_t thinkingIntervalID = 0;
    }
  }
  else if (a6 == 2)
  {
    v13 = (id *)MEMORY[0x263F28348];
    self->_os_signpost_id_t thinkingIntervalID = os_signpost_id_generate((os_log_t)*MEMORY[0x263F28348]);
    v14 = *v13;
    v15 = v14;
    os_signpost_id_t v16 = self->_thinkingIntervalID;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_225FBA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "ThinkingStateTransition", "", (uint8_t *)&v26, 2u);
    }
  }
  switch(a5)
  {
    case 0:
      char v20 = 0;
      uint64_t v21 = 1416;
      break;
    case 1:
      char v20 = 0;
      uint64_t v21 = 1417;
      break;
    case 2:
      char v20 = 0;
      uint64_t v21 = 1418;
      break;
    case 3:
      char v20 = 0;
      uint64_t v21 = 1419;
      break;
    default:
      uint64_t v21 = 0;
      char v20 = 1;
      break;
  }
  if (a4 != a5)
  {
    v22 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = AFAnalyticsEventTypeGetName();
      int v26 = 136315394;
      v27 = "-[SRUIFSiriSessionStateSignpostLogger sessionStateHandler:didTransitionFromState:toState:forEvent:machAbsoluteTime:]";
      __int16 v28 = 2112;
      v29 = v24;
      _os_log_impl(&dword_225FBA000, v23, OS_LOG_TYPE_DEFAULT, "%s logging event %@", (uint8_t *)&v26, 0x16u);
    }
    v25 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v25 logEventWithType:v21 machAbsoluteTime:(unint64_t)a7 context:0];

    if ((v20 & 1) == 0) {
      kdebug_trace();
    }
  }
}

@end