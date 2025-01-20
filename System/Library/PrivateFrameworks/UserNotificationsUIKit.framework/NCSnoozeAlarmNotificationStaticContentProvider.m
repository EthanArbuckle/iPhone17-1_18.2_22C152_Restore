@interface NCSnoozeAlarmNotificationStaticContentProvider
- (BOOL)_hasOneMinuteOrLessRemainingForTime:(double)a3;
- (NCNotificationViewController)viewController;
- (NCSnoozeAlarmNotificationStaticContentProvider)initWithNotificationRequest:(id)a3 viewController:(id)a4;
- (NSAttributedString)secondaryText;
- (NSTimer)tickTimer;
- (double)_remainingDurationForTime:(double)a3;
- (double)fireTime;
- (id)_formatDuration:(double)a3 includeSeconds:(BOOL)a4;
- (id)_secondaryTextForTime:(double)a3;
- (id)_timelinesForDateInterval:(id)a3;
- (id)date;
- (id)title;
- (void)_beginObservingAlwaysOnEnvironment;
- (void)_tickTimerFired:(id)a3;
- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4;
- (void)_updateContentForTime:(double)a3;
- (void)_updateWithFrameSpecifier:(id)a3;
- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidateTimer;
- (void)notificationViewControllerWillDismiss:(id)a3;
- (void)setFireTime:(double)a3;
- (void)setSecondaryText:(id)a3;
- (void)setTickTimer:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation NCSnoozeAlarmNotificationStaticContentProvider

- (NCSnoozeAlarmNotificationStaticContentProvider)initWithNotificationRequest:(id)a3 viewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NCSnoozeAlarmNotificationStaticContentProvider;
  v8 = [(NCNotificationRequestContentProvider *)&v23 initWithNotificationRequest:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewController, a4);
    [(NCNotificationViewController *)v9->_viewController addObserver:v9];
    [(NCNotificationRequestContentProvider *)v9 setDelegate:v7];
    v10 = [v6 context];
    uint64_t v11 = *MEMORY[0x1E4F78A98];
    v12 = [v10 objectForKey:*MEMORY[0x1E4F78A98]];
    if (!v12)
    {
      v13 = [v6 userNotification];
      v14 = [v13 request];
      v15 = [v14 content];
      v16 = [v15 userInfo];
      v12 = [v16 objectForKey:v11];
    }
    [v12 timeIntervalSinceNow];
    v9->_fireTime = v17 + CFAbsoluteTimeGetCurrent();
    uint64_t v18 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:v9 target:sel__tickTimerFired_ selector:0 userInfo:1 repeats:1.0];
    tickTimer = v9->_tickTimer;
    v9->_tickTimer = (NSTimer *)v18;

    v20 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v20 addTimer:v9->_tickTimer forMode:*MEMORY[0x1E4F1C4B0]];

    v21 = [(NCSnoozeAlarmNotificationStaticContentProvider *)v9 _secondaryTextForTime:CFAbsoluteTimeGetCurrent()];
    [(NCSnoozeAlarmNotificationStaticContentProvider *)v9 setSecondaryText:v21];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(NCNotificationViewController *)self->_viewController view];
  v4 = [v3 window];
  v5 = [v4 windowScene];
  id v6 = [v5 _alwaysOnEnvironment];
  [v6 removeObserver:self];

  [(NCNotificationViewController *)self->_viewController removeObserver:self];
  [(NCSnoozeAlarmNotificationStaticContentProvider *)self invalidateTimer];
  v7.receiver = self;
  v7.super_class = (Class)NCSnoozeAlarmNotificationStaticContentProvider;
  [(NCSnoozeAlarmNotificationStaticContentProvider *)&v7 dealloc];
}

- (void)invalidateTimer
{
}

- (id)title
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"ALARM_TITLE" value:&stru_1F2F516F8 table:0];

  return v3;
}

- (id)date
{
  return 0;
}

- (double)_remainingDurationForTime:(double)a3
{
  return fmax(self->_fireTime - a3, 0.0);
}

- (BOOL)_hasOneMinuteOrLessRemainingForTime:(double)a3
{
  [(NCSnoozeAlarmNotificationStaticContentProvider *)self _remainingDurationForTime:a3];
  return v3 <= 60.0;
}

- (id)_formatDuration:(double)a3 includeSeconds:(BOOL)a4
{
  if (a4)
  {
    v5 = [MEMORY[0x1E4F4F708] sharedInstance];
    [v5 formatAlarmSnoozeDuration:a3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    NCFormatTimeIntervalForMinutesOnly((uint64_t)v5, a3);
  id v6 = };

  return v6;
}

- (void)_updateContentForTime:(double)a3
{
  v4 = [(NCSnoozeAlarmNotificationStaticContentProvider *)self _secondaryTextForTime:a3];
  [(NCSnoozeAlarmNotificationStaticContentProvider *)self setSecondaryText:v4];

  id v5 = [(NCSnoozeAlarmNotificationStaticContentProvider *)self viewController];
  [v5 setHasUpdatedContent];
  [v5 updateContent];
}

- (id)_secondaryTextForTime:(double)a3
{
  -[NCSnoozeAlarmNotificationStaticContentProvider _remainingDurationForTime:](self, "_remainingDurationForTime:");
  double v6 = v5;
  objc_super v7 = [(NCSnoozeAlarmNotificationStaticContentProvider *)self viewController];
  v8 = [v7 traitCollection];
  uint64_t v9 = [v8 _backlightLuminance];

  BOOL v10 = v9 != 1
     || [(NCSnoozeAlarmNotificationStaticContentProvider *)self _hasOneMinuteOrLessRemainingForTime:a3];
  uint64_t v11 = [(NCSnoozeAlarmNotificationStaticContentProvider *)self _formatDuration:v10 includeSeconds:v6];
  v12 = NSString;
  v13 = NCUserNotificationsUIKitFrameworkBundle();
  v14 = [v13 localizedStringForKey:@"ALARM_SNOOZE_TIME_REMAINING" value:&stru_1F2F516F8 table:0];
  v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11);

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15];

  return v16;
}

- (void)_tickTimerFired:(id)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  -[NCSnoozeAlarmNotificationStaticContentProvider _updateContentForTime:](self, "_updateContentForTime:");
  [(NCSnoozeAlarmNotificationStaticContentProvider *)self _remainingDurationForTime:Current];
  if (v5 < 0.0)
  {
    [(NCSnoozeAlarmNotificationStaticContentProvider *)self invalidateTimer];
  }
}

- (id)_timelinesForDateInterval:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 startDate];
  double fireTime = self->_fireTime;
  [v5 timeIntervalSinceReferenceDate];
  double v8 = fireTime - v7;
  [v4 duration];
  double v10 = v9;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8 >= 0.0)
  {
    double v15 = v8 + -60.0;
    if (v8 + -60.0 >= v10) {
      double v16 = v10;
    }
    else {
      double v16 = v8 + -60.0;
    }
    if (v15 > 0.0)
    {
      unint64_t v17 = (unint64_t)(v16 / 60.0);
      if (v17)
      {
        unint64_t v18 = 0;
        do
        {
          v19 = [v5 dateByAddingTimeInterval:(double)((uint64_t)v8 % 60) + 1.0 + (double)v18];
          v20 = [MEMORY[0x1E4F4F4B8] entryForPresentationTime:v19 withRequestedFidelity:1];
          [v11 addObject:v20];

          v18 += 60;
          --v17;
        }
        while (v17);
      }
    }
    if (v8 >= v10) {
      double v21 = v10;
    }
    else {
      double v21 = v8;
    }
    uint64_t v22 = (uint64_t)(v21 - v15);
    objc_super v23 = (os_log_t *)MEMORY[0x1E4FB3750];
    if (v15 < v10)
    {
      if ((unint64_t)v22 >= 0x3D)
      {
        v24 = (void *)*MEMORY[0x1E4FB3750];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_FAULT))
        {
          v39 = (void *)MEMORY[0x1E4F1C9C8];
          double v40 = self->_fireTime;
          v41 = v24;
          v45 = [v39 dateWithTimeIntervalSinceReferenceDate:v40];
          v42 = objc_msgSend(v45, "bls_shortLoggingString");
          v43 = objc_msgSend(v4, "bls_shortLoggingString");
          v44 = objc_msgSend(v11, "bls_boundedDescriptionWithMax:transformer:", 15, &__block_literal_global_13);
          *(_DWORD *)buf = 134220034;
          v49 = self;
          __int16 v50 = 2048;
          uint64_t v51 = (uint64_t)(v21 - v15);
          __int16 v52 = 2114;
          v53 = v42;
          __int16 v54 = 2114;
          double v55 = *(double *)&v43;
          __int16 v56 = 2048;
          double v57 = v8;
          __int16 v58 = 2048;
          double v59 = v8 + -60.0;
          __int16 v60 = 2048;
          double v61 = v8 + -60.0;
          __int16 v62 = 2048;
          double v63 = v21;
          __int16 v64 = 2114;
          v65 = v44;
          _os_log_fault_impl(&dword_1D7C04000, v41, OS_LOG_TYPE_FAULT, "%p Alarm snooze timelines — bad endIncrement:%ld — fireTime:%{public}@ interval:%{public}@ untiFireTime:%lf untilSeconds:%lf endMinutes:%lf endSeconds:%lf entries:%{public}@", buf, 0x5Cu);
        }
        uint64_t v25 = 60;
        if (v22 < 60) {
          uint64_t v25 = (uint64_t)(v21 - v15);
        }
        uint64_t v22 = v25 & ~(v25 >> 63);
      }
      uint64_t v26 = 0;
      do
      {
        v27 = [v5 dateByAddingTimeInterval:v15 + (double)v26];
        v28 = [MEMORY[0x1E4F4F4B8] entryForPresentationTime:v27 withRequestedFidelity:2];
        [v11 addObject:v28];

        ++v26;
      }
      while (v22 + 1 != v26);
      objc_super v23 = (os_log_t *)MEMORY[0x1E4FB3750];
    }
    os_log_t v29 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEBUG))
    {
      v32 = (void *)MEMORY[0x1E4F1C9C8];
      double v33 = self->_fireTime;
      v34 = v29;
      v35 = [v32 dateWithTimeIntervalSinceReferenceDate:v33];
      v36 = objc_msgSend(v35, "bls_shortLoggingString");
      v37 = objc_msgSend(v4, "bls_shortLoggingString");
      v38 = objc_msgSend(v11, "bls_boundedDescriptionWithMax:transformer:", 15, &__block_literal_global_25);
      *(_DWORD *)buf = 134220034;
      v49 = self;
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)v36;
      __int16 v52 = 2114;
      v53 = v37;
      __int16 v54 = 2048;
      double v55 = v8;
      __int16 v56 = 2048;
      double v57 = v8 + -60.0;
      __int16 v58 = 2048;
      double v59 = v16;
      __int16 v60 = 2048;
      double v61 = v21;
      __int16 v62 = 2048;
      double v63 = *(double *)&v22;
      __int16 v64 = 2114;
      v65 = v38;
      _os_log_debug_impl(&dword_1D7C04000, v34, OS_LOG_TYPE_DEBUG, "%p Alarm snooze timelines — fireTime:%{public}@ interval:%{public}@ untiFireTime:%lf untilSeconds:%lf endMinutes:%lf endSeconds:%lf endIncrement:%ld entries:%{public}@", buf, 0x5Cu);
    }
    v13 = [MEMORY[0x1E4F4F4B0] timelineWithEntries:v11 identifier:@"NCSnoozeAlarmNotificationStaticContentProvider" configure:&__block_literal_global_33];
    v47 = v13;
    v14 = &v47;
  }
  else
  {
    v12 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
      -[NCSnoozeAlarmNotificationStaticContentProvider _timelinesForDateInterval:]((uint64_t)self, v12);
    }
    v13 = [MEMORY[0x1E4F4F4B0] emptyTimelineWithIdentifier:@"NCSnoozeAlarmNotificationStaticContentProvider"];
    v46 = v13;
    v14 = &v46;
  }
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  return v30;
}

id __76__NCSnoozeAlarmNotificationStaticContentProvider__timelinesForDateInterval___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 presentationTime];
  double v3 = objc_msgSend(v2, "bls_shortLoggingString");

  return v3;
}

id __76__NCSnoozeAlarmNotificationStaticContentProvider__timelinesForDateInterval___block_invoke_23(uint64_t a1, void *a2)
{
  v2 = NSString;
  id v3 = a2;
  id v4 = [v3 presentationTime];
  double v5 = objc_msgSend(v4, "bls_shortLoggingString");
  [v3 requestedFidelity];

  double v6 = NSStringFromBLSUpdateFidelity();
  double v7 = [v2 stringWithFormat:@"%@ - %@", v5, v6];

  return v7;
}

- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = [(NCSnoozeAlarmNotificationStaticContentProvider *)self _timelinesForDateInterval:a3];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 entrySpecifierForTimelineIdentifier:@"NCSnoozeAlarmNotificationStaticContentProvider"];
    id v7 = [v6 timelineEntry];
    id v8 = [v7 presentationTime];

    if (!v8)
    {
      double v9 = (void *)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
        [(NCSnoozeAlarmNotificationStaticContentProvider *)(uint64_t)self _updateWithFrameSpecifier:v5];
      }
      double v10 = [v5 presentationInterval];
      id v8 = [v10 startDate];
    }
    [v8 timeIntervalSinceReferenceDate];
    -[NCSnoozeAlarmNotificationStaticContentProvider _updateContentForTime:](self, "_updateContentForTime:");
  }
  else
  {
    [(NCSnoozeAlarmNotificationStaticContentProvider *)self _updateContentForTime:CFAbsoluteTimeGetCurrent()];
  }
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  double v6 = (void (**)(void))a4;
  [(NCSnoozeAlarmNotificationStaticContentProvider *)self _updateWithFrameSpecifier:a3];
  v6[2]();
}

- (void)_beginObservingAlwaysOnEnvironment
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_ERROR, "Alarm snooze provider %p couldn't find alwaysOnEnvironment to observe", (uint8_t *)&v2, 0xCu);
}

- (void)notificationViewControllerWillDismiss:(id)a3
{
  id v7 = [(NCNotificationViewController *)self->_viewController view];
  uint64_t v4 = [v7 window];
  double v5 = [v4 windowScene];
  double v6 = [v5 _alwaysOnEnvironment];
  [v6 removeObserver:self];
}

- (NSAttributedString)secondaryText
{
  return self->secondaryText;
}

- (void)setSecondaryText:(id)a3
{
}

- (NCNotificationViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (double)fireTime
{
  return self->_fireTime;
}

- (void)setFireTime:(double)a3
{
  self->_double fireTime = a3;
}

- (NSTimer)tickTimer
{
  return self->_tickTimer;
}

- (void)setTickTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickTimer, 0);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong((id *)&self->secondaryText, 0);
}

- (void)_timelinesForDateInterval:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_DEBUG, "%p Alarm snooze not running - returning empty timeline", (uint8_t *)&v2, 0xCu);
}

- (void)_updateWithFrameSpecifier:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v5 = a2;
  double v6 = [a3 description];
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  double v10 = @"NCSnoozeAlarmNotificationStaticContentProvider";
  __int16 v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "%p Could not find id:%{public}@ in frameSpecifier:%{public}@", (uint8_t *)&v7, 0x20u);
}

@end