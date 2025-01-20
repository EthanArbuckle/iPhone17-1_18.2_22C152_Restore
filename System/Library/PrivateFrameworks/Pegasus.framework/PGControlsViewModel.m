@interface PGControlsViewModel
- (BOOL)isInActivitySession;
- (BOOL)isInterrupted;
- (BOOL)isPrerollSkippable;
- (PGControlsViewModel)init;
- (PGControlsViewModelDelegate)delegate;
- (PGControlsViewModelValues)values;
- (PGPlaybackState)playbackState;
- (double)preferredMinimumWidth;
- (int64_t)secondsUntilPrerollSkippable;
- (unint64_t)recommendedUpdateCadenceForProgressBarWithWidthInPixels:(double)a3;
- (void)_updateViewModelValues;
- (void)handleActionButtonTapped;
- (void)handleCancelButtonTapped;
- (void)handleDoubleDoubleTap;
- (void)handleDoubleTap;
- (void)handleRestoreButtonTapped;
- (void)handleSingleTap;
- (void)handleSkipBackButtonTapped;
- (void)handleSkipForwardButtonTapped;
- (void)handleSkipPrerollButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setInActivitySession:(BOOL)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)updatePlaybackStateWithDiff:(id)a3;
@end

@implementation PGControlsViewModel

- (PGControlsViewModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)PGControlsViewModel;
  v2 = [(PGControlsViewModel *)&v8 init];
  if (v2)
  {
    v3 = [[PGPlaybackState alloc] initWithDictionary:0];
    playbackState = v2->_playbackState;
    v2->_playbackState = v3;

    v5 = objc_alloc_init(PGControlsViewModelValues);
    values = v2->_values;
    v2->_values = v5;

    [(PGControlsViewModel *)v2 _updateViewModelValues];
  }
  return v2;
}

- (void)updatePlaybackStateWithDiff:(id)a3
{
  id v4 = a3;
  v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PGControlsViewModel updatePlaybackStateWithDiff:]((uint64_t)v4, v5);
  }

  v6 = [(PGControlsViewModel *)self playbackState];
  [v6 updatePlaybackStateWithDiff:v4];

  v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PGControlsViewModel updatePlaybackStateWithDiff:](self, v7);
  }

  [(PGControlsViewModel *)self _updateViewModelValues];
}

- (void)setInterrupted:(BOOL)a3
{
  if (self->_interrupted != a3)
  {
    self->_interrupted = a3;
    [(PGControlsViewModel *)self _updateViewModelValues];
  }
}

- (void)setInActivitySession:(BOOL)a3
{
  if (self->_inActivitySession != a3)
  {
    self->_inActivitySession = a3;
    [(PGControlsViewModel *)self _updateViewModelValues];
  }
}

- (unint64_t)recommendedUpdateCadenceForProgressBarWithWidthInPixels:(double)a3
{
  v5 = [(PGControlsViewModel *)self values];
  int v6 = [v5 progressBarShouldUpdate];

  if (!v6) {
    return 0;
  }
  v7 = [(PGControlsViewModel *)self playbackState];
  [v7 contentDuration];
  double v9 = a3 / v8;

  return vcvtpd_u64_f64(v9);
}

- (void)handleActionButtonTapped
{
  id v8 = [(PGControlsViewModel *)self playbackState];
  uint64_t v3 = [v8 contentType];
  if ((unint64_t)(v3 - 1) < 2)
  {
    v5 = [(PGControlsViewModel *)self playbackState];
    uint64_t v6 = +[PGCommand commandForSetPlaying:](PGCommand, "commandForSetPlaying:", [v5 timeControlStatus] == 0);
    goto LABEL_8;
  }
  if (v3 == 3)
  {
    v5 = [(PGControlsViewModel *)self playbackState];
    uint64_t v6 = +[PGCommand commandForSetMuted:](PGCommand, "commandForSetMuted:", [v5 isMuted] ^ 1);
LABEL_8:
    id v4 = (void *)v6;

    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v3 == 4)
  {
    id v4 = +[PGCommand commandForSendActionButtonTapped];
    if (v4)
    {
LABEL_9:
      v7 = [(PGControlsViewModel *)self delegate];
      [v7 controlsViewModel:self didIssueCommand:v4];
    }
  }
LABEL_10:
}

- (void)handleCancelButtonTapped
{
  if ([(PGControlsViewModel *)self isInActivitySession]) {
    +[PGCommand commandForEndOrLeaveActivityRequested];
  }
  else {
  id v4 = +[PGCommand commandForCancelPIP];
  }
  uint64_t v3 = [(PGControlsViewModel *)self delegate];
  [v3 controlsViewModel:self didIssueCommand:v4];
}

- (void)handleDoubleTap
{
  uint64_t v3 = [(PGControlsViewModel *)self values];
  int v4 = [v3 includesDoubleTapGestureRecognizer];

  if (v4)
  {
    id v6 = [(PGControlsViewModel *)self delegate];
    v5 = +[PGCommand commandForToggleZoom];
    [v6 controlsViewModel:self didIssueCommand:v5];
  }
}

- (void)handleSingleTap
{
  id v7 = [(PGControlsViewModel *)self playbackState];
  unint64_t v3 = [v7 contentType];
  if (v3 <= 6)
  {
    if (((1 << v3) & 0xE) != 0)
    {
      if ([(PGControlsViewModel *)self isInterrupted]) {
        goto LABEL_11;
      }
      uint64_t v4 = +[PGCommand commandForToggleControlsVisibility];
    }
    else
    {
      if (((1 << v3) & 0x31) != 0) {
        +[PGCommand commandForRestoreFromPIP];
      }
      else {
      uint64_t v4 = +[PGCommand commandForSendActionButtonTapped];
      }
    }
    v5 = (void *)v4;
    if (v4)
    {
      id v6 = [(PGControlsViewModel *)self delegate];
      [v6 controlsViewModel:self didIssueCommand:v5];
    }
  }
LABEL_11:
}

- (void)handleDoubleDoubleTap
{
  unint64_t v3 = [(PGControlsViewModel *)self values];
  int v4 = [v3 includesDoubleDoubleTapGestureRecognizer];

  if (v4)
  {
    id v6 = [(PGControlsViewModel *)self delegate];
    v5 = +[PGCommand commandForRestoreFromPIP];
    [v6 controlsViewModel:self didIssueCommand:v5];
  }
}

- (void)handleRestoreButtonTapped
{
  id v4 = [(PGControlsViewModel *)self delegate];
  unint64_t v3 = +[PGCommand commandForRestoreFromPIP];
  [v4 controlsViewModel:self didIssueCommand:v3];
}

- (void)handleSkipBackButtonTapped
{
  unint64_t v3 = [(PGControlsViewModel *)self playbackState];
  uint64_t v4 = [v3 contentType];

  if (v4 == 4)
  {
    v11 = [(PGControlsViewModel *)self playbackState];
    int v12 = [v11 supportsFaceTimeActions];

    if (!v12) {
      return;
    }
    v13 = [(PGControlsViewModel *)self playbackState];
    +[PGCommand commandForSetMicrophoneMuted:](PGCommand, "commandForSetMicrophoneMuted:", [v13 isMicrophoneMuted] ^ 1);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = (uint64_t)v16;
    if (!v16) {
      return;
    }
    goto LABEL_12;
  }
  if (v4 != 2)
  {
    if (v4 != 1) {
      return;
    }
    v5 = [(PGControlsViewModel *)self playbackState];
    char v6 = [v5 requiresLinearPlayback];

    if (v6) {
      return;
    }
    goto LABEL_8;
  }
  id v15 = [(PGControlsViewModel *)self playbackState];
  if (([v15 requiresLinearPlayback] & 1) == 0)
  {
    id v7 = [(PGControlsViewModel *)self playbackState];
    [v7 contentDuration];
    double v9 = v8;

    if (v9 <= 30.0) {
      return;
    }
LABEL_8:
    uint64_t v10 = +[PGCommand commandForSkipByInterval:-10.0];
    if (!v10) {
      return;
    }
LABEL_12:
    id v15 = (id)v10;
    v14 = [(PGControlsViewModel *)self delegate];
    [v14 controlsViewModel:self didIssueCommand:v15];
  }
}

- (void)handleSkipForwardButtonTapped
{
  unint64_t v3 = [(PGControlsViewModel *)self playbackState];
  uint64_t v4 = [v3 contentType];

  if (v4 != 4)
  {
    if (v4 != 2)
    {
      if (v4 != 1) {
        return;
      }
      v5 = [(PGControlsViewModel *)self playbackState];
      char v6 = [v5 requiresLinearPlayback];

      if (v6) {
        return;
      }
      goto LABEL_13;
    }
    id v7 = [(PGControlsViewModel *)self playbackState];
    if ([v7 requiresLinearPlayback])
    {
    }
    else
    {
      uint64_t v10 = [(PGControlsViewModel *)self playbackState];
      [v10 contentDuration];
      double v12 = v11;

      if (v12 > 30.0)
      {
LABEL_13:
        uint64_t v13 = +[PGCommand commandForSkipByInterval:10.0];
        if (!v13) {
          return;
        }
        goto LABEL_16;
      }
    }
    uint64_t v13 = +[PGCommand commandForSkipToLive];
    if (!v13) {
      return;
    }
LABEL_16:
    id v16 = (id)v13;
    v14 = [(PGControlsViewModel *)self delegate];
    [v14 controlsViewModel:self didIssueCommand:v16];

    goto LABEL_17;
  }
  id v16 = [(PGControlsViewModel *)self playbackState];
  if ([v16 supportsFaceTimeActions])
  {
    if ([(PGControlsViewModel *)self isInterrupted])
    {
      double v8 = [(PGControlsViewModel *)self playbackState];
      int v9 = [v8 isCameraActive];

      if (!v9) {
        return;
      }
    }
    else
    {
    }
    id v15 = [(PGControlsViewModel *)self playbackState];
    +[PGCommand commandForSetCameraEnabled:](PGCommand, "commandForSetCameraEnabled:", [v15 isCameraActive] ^ 1);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = (uint64_t)v17;
    if (!v17) {
      return;
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)handleSkipPrerollButtonTapped
{
  if ([(PGControlsViewModel *)self isPrerollSkippable])
  {
    id v4 = [(PGControlsViewModel *)self delegate];
    unint64_t v3 = +[PGCommand commandForSkipPreroll];
    [v4 controlsViewModel:self didIssueCommand:v3];
  }
}

- (int64_t)secondsUntilPrerollSkippable
{
  unint64_t v3 = [(PGControlsViewModel *)self values];
  id v4 = [v3 prerollAttributes];
  [v4 requiredLinearPlaybackEndTime];
  double v6 = v5;

  id v7 = [(PGControlsViewModel *)self values];
  LODWORD(v4) = [v7 isPrerollActive];

  if (!v4 || fabs(v6) == INFINITY) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  double v8 = [(PGControlsViewModel *)self playbackState];
  [v8 elapsedTime];
  double v10 = v6 - v9;

  uint64_t v11 = vcvtpd_s64_f64(v10);
  return v11 & ~(v11 >> 63);
}

- (BOOL)isPrerollSkippable
{
  unint64_t v3 = [(PGControlsViewModel *)self values];
  if ([v3 isPrerollActive]) {
    BOOL v4 = [(PGControlsViewModel *)self secondsUntilPrerollSkippable] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (double)preferredMinimumWidth
{
  v2 = [(PGControlsViewModel *)self playbackState];
  uint64_t v3 = [v2 contentType];

  if ((unint64_t)(v3 - 1) > 3) {
    return 128.0;
  }
  else {
    return dbl_1B568BC50[v3 - 1];
  }
}

- (void)_updateViewModelValues
{
  v152 = [(PGControlsViewModel *)self playbackState];
  uint64_t v3 = [(PGControlsViewModel *)self values];
  v131 = (void *)[v3 copy];

  [v152 contentDuration];
  double v5 = v4;
  [v152 elapsedTime];
  double v7 = v6;
  int v8 = [v152 requiresLinearPlayback];
  int v9 = [v152 isMuted];
  BOOL v10 = [(PGControlsViewModel *)self isInterrupted];
  uint64_t v11 = [v152 contentType];
  uint64_t v12 = [v152 timeControlStatus];
  v151 = PGLocalizedString(@"RESTORE_FULLSCREEN");
  v150 = PGLocalizedString(@"CLOSE_PIP");
  uint64_t v13 = 0;
  int v14 = 1;
  uint64_t v15 = v11 - 1;
  id v16 = 0;
  id v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  v20 = 0;
  v21 = 0;
  unsigned int v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  BOOL v26 = 0;
  int v27 = 0;
  int v28 = 1;
  LODWORD(v29) = 1;
  uint64_t v30 = 0;
  int v31 = 0;
  int v32 = 0;
  BOOL v33 = 0;
  v34 = 0;
  uint64_t v146 = 0;
  unsigned int v140 = 0;
  BOOL v35 = 0;
  switch(v15)
  {
    case 0:
      BOOL v36 = v5 == 0.0 && !self->_hasBegun;
      int v41 = [(PGControlsViewModel *)self isInterrupted];
      uint64_t v42 = [v152 prerollAttributes];
      int v43 = (v5 > 0.0) & ~(v36 | v8);
      if (v42) {
        int v43 = 0;
      }
      HIDWORD(v146) = !v36;
      BOOL v147 = v36;
      uint64_t v143 = v42;
      LODWORD(v146) = v43;
      if (v10)
      {
        [v152 hasInvalidTiming];
        int v136 = 0;
        BOOL v37 = 0;
        int v44 = 0;
        v134 = @"play.slash.fill";
      }
      else
      {
        if (v7 > 0.0) {
          int v44 = v43;
        }
        else {
          int v44 = 0;
        }
        if (v7 < v5) {
          BOOL v37 = v43;
        }
        else {
          BOOL v37 = 0;
        }
        int v136 = !v36;
        [v152 hasInvalidTiming];
        v48 = @"pause.fill";
        if (!v12) {
          v48 = @"play.fill";
        }
        v134 = v48;
      }
      BOOL v141 = v44;
      int v32 = (v12 == 1) & ~v41;
      id v16 = PGLocalizedString(@"SKIP_FORWARD_10_SECONDS");
      uint64_t v145 = PGLocalizedString(@"SKIP_BACK_10_SECONDS");
      if (v12)
      {
        uint64_t v138 = PGLocalizedString(@"PAUSE");
        if (v12 == 2) {
          uint64_t v19 = (v36 | v32) ^ 1u;
        }
        else {
          uint64_t v19 = 0;
        }
      }
      else
      {
        uint64_t v138 = PGLocalizedString(@"PLAY");
        uint64_t v19 = 0;
      }
      BOOL v49 = [(PGControlsViewModel *)self isInterrupted];
      uint64_t v13 = 0;
      uint64_t v29 = !v49;
      if (v5 > 0.0)
      {
        int v50 = !v49;
        unsigned int v132 = v32;
        uint64_t v51 = 0;
        goto LABEL_43;
      }
      v20 = 0;
      v21 = 0;
      v24 = @"gobackward.10";
      unsigned int v22 = 1;
      int v28 = 1;
      uint64_t v30 = 0;
      int v31 = 0;
      BOOL v26 = v37;
      unsigned int v140 = 1;
      BOOL v35 = 0;
      v23 = @"goforward.10";
      v34 = (void *)v143;
      id v17 = (void *)v145;
      uint64_t v18 = v138;
      v25 = v134;
      int v14 = v136;
      int v27 = v44;
      BOOL v33 = v36;
      break;
    case 1:
      unsigned int v132 = (v12 == 1) & ~[(PGControlsViewModel *)self isInterrupted];
      id v16 = PGLocalizedString(@"SKIP_FORWARD_10_SECONDS");
      PGLocalizedString(@"SKIP_BACK_10_SECONDS");
      BOOL v37 = ((v10 | v8) & 1) == 0;
      uint64_t v19 = v12 == 2;
      v145 = int v136 = !v10;
      if (v10)
      {
        uint64_t v138 = 0;
        v38 = @"play.slash.fill";
      }
      else if (v12)
      {
        if (v8)
        {
          uint64_t v138 = PGLocalizedString(@"STOP");
          v38 = @"stop.fill";
        }
        else
        {
          uint64_t v138 = PGLocalizedString(@"PAUSE");
          v38 = @"pause.fill";
        }
      }
      else
      {
        uint64_t v138 = PGLocalizedString(@"PLAY");
        v38 = @"play.fill";
      }
      v134 = v38;
      uint64_t v143 = 0;
      int v50 = ![(PGControlsViewModel *)self isInterrupted];
      uint64_t v51 = 1;
      BOOL v141 = v37;
      uint64_t v146 = 0x100000001;
      BOOL v147 = 0;
LABEL_43:
      v52 = [(PGControlsViewModel *)self playbackState];
      char v53 = [v52 hasInvalidTiming];

      if (v53)
      {
        uint64_t v13 = 0;
        v20 = 0;
        v21 = 0;
        BOOL v35 = 0;
      }
      else
      {
        v54 = [(PGControlsViewModel *)self playbackState];
        BOOL v55 = [v54 timeControlStatus] == 2;

        BOOL v35 = v55;
        uint64_t v13 = 0;
        v20 = 0;
        v21 = 0;
      }
      v24 = @"gobackward.10";
      unsigned int v22 = 1;
      int v28 = 1;
      int v31 = 1;
      unsigned int v140 = 1;
      v23 = @"goforward.10";
      v34 = (void *)v143;
      id v17 = (void *)v145;
      uint64_t v18 = v138;
      v25 = v134;
      BOOL v26 = v37;
      int v14 = v136;
      int v32 = v132;
      int v27 = v141;
      BOOL v33 = v147;
      LODWORD(v29) = v50;
      uint64_t v30 = v51;
      break;
    case 2:
      if (v9)
      {
        uint64_t v39 = objc_msgSend(MEMORY[0x1E4F428B8], "whiteColor", 1, 0, 1, 0, 0, 0);
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v39 = objc_msgSend(MEMORY[0x1E4F428B8], "blackColor", 1, 0, 1, 0, 0, 0);
        uint64_t v40 = [MEMORY[0x1E4F428B8] systemYellowColor];
      }
      v45 = [(PGControlsViewModel *)self playbackState];
      int v46 = [v45 cameraHasMicrophone];

      HIDWORD(v146) = v46;
      if ([v152 isMuted]) {
        v47 = @"UNMUTE";
      }
      else {
        v47 = @"MUTE";
      }
      uint64_t v18 = PGLocalizedString(v47);
      v34 = 0;
      v21 = (void *)v39;
      id v16 = 0;
      id v17 = 0;
      uint64_t v19 = 0;
      v23 = 0;
      v24 = 0;
      BOOL v26 = 0;
      int v27 = 0;
      uint64_t v30 = 0;
      int v31 = 0;
      int v32 = 0;
      BOOL v33 = 0;
      LODWORD(v146) = 0;
      BOOL v35 = 0;
      uint64_t v13 = 1;
      unsigned int v22 = 1;
      int v14 = 1;
      int v28 = 1;
      LODWORD(v29) = 1;
      unsigned int v140 = 1;
      v25 = @"mic.fill";
      v20 = (void *)v40;
      break;
    case 3:
    case 4:
      break;
    case 5:
      v34 = 0;
      id v16 = 0;
      id v17 = 0;
      uint64_t v18 = 0;
      uint64_t v13 = 0;
      uint64_t v19 = 0;
      v20 = 0;
      v21 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      BOOL v26 = 0;
      int v27 = 0;
      int v28 = 0;
      uint64_t v30 = 0;
      int v31 = 0;
      int v32 = 0;
      BOOL v33 = 0;
      uint64_t v146 = 0;
      unsigned int v140 = 0;
      BOOL v35 = 0;
      unsigned int v22 = 1;
      break;
    default:
      uint64_t v146 = 0;
      unsigned int v140 = 0;
      BOOL v35 = 0;
      break;
  }
  BOOL v123 = v26;
  BOOL v148 = v33;
  unsigned int v133 = v32;
  unsigned int v142 = v27;
  unsigned int v137 = v14;
  unsigned int v124 = v29;
  unsigned int v125 = v28;
  unsigned int v126 = v31;
  BOOL v149 = v35;
  v135 = v25;
  v127 = v21;
  v128 = v20;
  v144 = v34;
  v129 = v23;
  v130 = v24;
  v56 = v17;
  v57 = (void *)v18;
  uint64_t v58 = v30;
  v59 = [(PGControlsViewModel *)self values];
  v60 = [NSNumber numberWithBool:v19];
  [v59 setValue:v60 forKey:@"controlsShouldAutoHide"];

  v61 = [(PGControlsViewModel *)self values];
  [v61 setValue:v151 forKey:@"restoreButtonAccessibilityIdentifier"];

  v62 = [(PGControlsViewModel *)self values];
  [v62 setValue:v150 forKey:@"cancelButtonAccessibilityIdentifier"];

  v63 = [(PGControlsViewModel *)self values];
  v139 = v57;
  [v63 setValue:v57 forKey:@"actionButtonAccessibilityIdentifier"];

  v64 = [(PGControlsViewModel *)self values];
  [v64 setValue:v56 forKey:@"skipBackButtonAccessibilityIdentifier"];

  v65 = [(PGControlsViewModel *)self values];
  [v65 setValue:v16 forKey:@"skipForwardButtonAccessibilityIdentifier"];

  v66 = [(PGControlsViewModel *)self values];
  v67 = [NSNumber numberWithBool:v58];
  [v66 setValue:v67 forKey:@"includesLiveIndicatorBadge"];

  v68 = [(PGControlsViewModel *)self values];
  v69 = [NSNumber numberWithBool:v140];
  [v68 setValue:v69 forKey:@"includesRestoreButton"];

  v70 = [(PGControlsViewModel *)self values];
  v71 = [NSNumber numberWithBool:v22];
  [v70 setValue:v71 forKey:@"includesCancelButton"];

  v72 = [(PGControlsViewModel *)self values];
  v73 = [NSNumber numberWithBool:HIDWORD(v146)];
  [v72 setValue:v73 forKey:@"includesActionButton"];

  v74 = [(PGControlsViewModel *)self values];
  v75 = [NSNumber numberWithBool:v146];
  [v74 setValue:v75 forKey:@"includesSkipBackButton"];

  v76 = [(PGControlsViewModel *)self values];
  v77 = [NSNumber numberWithBool:v146];
  [v76 setValue:v77 forKey:@"includesSkipForwardButton"];

  v78 = [(PGControlsViewModel *)self values];
  v79 = [NSNumber numberWithBool:v148];
  [v78 setValue:v79 forKey:@"includesContentLoadingIndicator"];

  v80 = [(PGControlsViewModel *)self values];
  v81 = [NSNumber numberWithBool:v133];
  [v80 setValue:v81 forKey:@"includesWaitingToPlayIndicator"];

  v82 = [(PGControlsViewModel *)self values];
  v83 = [NSNumber numberWithBool:v142];
  [v82 setValue:v83 forKey:@"isSkipBackButtonEnabled"];

  v84 = [(PGControlsViewModel *)self values];
  v85 = [NSNumber numberWithBool:v137];
  [v84 setValue:v85 forKey:@"isActionButtonEnabled"];

  v86 = [(PGControlsViewModel *)self values];
  v87 = [NSNumber numberWithBool:v123];
  [v86 setValue:v87 forKey:@"isSkipForwardButtonEnabled"];

  v88 = [(PGControlsViewModel *)self values];
  v89 = [NSNumber numberWithBool:v124];
  [v88 setValue:v89 forKey:@"includesSingleTapGestureRecognizer"];

  v90 = [(PGControlsViewModel *)self values];
  v91 = [NSNumber numberWithBool:v125];
  [v90 setValue:v91 forKey:@"includesDoubleTapGestureRecognizer"];

  v92 = [(PGControlsViewModel *)self values];
  v93 = [NSNumber numberWithBool:v125];
  [v92 setValue:v93 forKey:@"includesDoubleDoubleTapGestureRecognizer"];

  v94 = [(PGControlsViewModel *)self values];
  v95 = [NSNumber numberWithBool:v126];
  [v94 setValue:v95 forKey:@"includesProgressBar"];

  v96 = [(PGControlsViewModel *)self values];
  v97 = [NSNumber numberWithBool:v149];
  [v96 setValue:v97 forKey:@"progressBarShouldUpdate"];

  v98 = [(PGControlsViewModel *)self values];
  [v98 setValue:v135 forKey:@"actionButtonSystemImageName"];

  v99 = [(PGControlsViewModel *)self values];
  [v99 setValue:v127 forKey:@"actionButtonImageTintColor"];

  v100 = [(PGControlsViewModel *)self values];
  [v100 setValue:v128 forKey:@"actionButtonBackgroundTintColor"];

  v101 = [(PGControlsViewModel *)self values];
  [v101 setValue:0 forKey:@"skipBackButtonImageTintColor"];

  v102 = [(PGControlsViewModel *)self values];
  [v102 setValue:0 forKey:@"skipBackButtonBackgroundTintColor"];

  v103 = [(PGControlsViewModel *)self values];
  [v103 setValue:0 forKey:@"skipForwardButtonImageTintColor"];

  v104 = [(PGControlsViewModel *)self values];
  [v104 setValue:0 forKey:@"skipForwardButtonBackgroundTintColor"];

  v105 = [(PGControlsViewModel *)self values];
  [v105 setValue:0 forKey:@"cancelButtonImageTintColor"];

  v106 = [(PGControlsViewModel *)self values];
  [v106 setValue:0 forKey:@"cancelButtonBackgroundTintColor"];

  v107 = [(PGControlsViewModel *)self values];
  [v107 setValue:v129 forKey:@"skipForwardButtonSystemImageName"];

  v108 = [(PGControlsViewModel *)self values];
  [v108 setValue:v130 forKey:@"skipBackButtonSystemImageName"];

  v109 = [(PGControlsViewModel *)self values];
  [v109 setValue:@"xmark" forKey:@"cancelButtonSystemImageName"];

  v110 = [(PGControlsViewModel *)self values];
  [v110 setValue:v144 forKey:@"prerollAttributes"];

  v111 = [(PGControlsViewModel *)self values];
  v112 = [NSNumber numberWithBool:0];
  [v111 setValue:v112 forKey:@"cancelButtonWantsBackground"];

  v113 = [(PGControlsViewModel *)self values];
  v114 = [NSNumber numberWithBool:0];
  [v113 setValue:v114 forKey:@"restoreButtonWantsBackground"];

  v115 = [(PGControlsViewModel *)self values];
  v116 = [NSNumber numberWithBool:v13];
  [v115 setValue:v116 forKey:@"actionButtonsWantBackground"];

  v117 = [(PGControlsViewModel *)self values];
  [v117 setValue:0 forKey:@"cancelButtonCustomText"];

  v118 = [(PGControlsViewModel *)self values];
  [v118 setValue:0 forKey:@"cancelButtonCustomImage"];

  BOOL v119 = 0;
  if (!v149) {
    BOOL v119 = self->_lastKnownElapsedTime != v7;
  }
  self->_lastKnownElapsedTime = v7;
  v120 = [(PGControlsViewModel *)self values];
  int v121 = [v131 isEqual:v120];

  if (!v121 || v119)
  {
    v122 = [(PGControlsViewModel *)self delegate];
    [v122 controlsViewModel:self valuesChangedFromOldValue:v131];
  }
}

- (PGControlsViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PGControlsViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PGPlaybackState)playbackState
{
  return self->_playbackState;
}

- (BOOL)isInterrupted
{
  return self->_interrupted;
}

- (BOOL)isInActivitySession
{
  return self->_inActivitySession;
}

- (PGControlsViewModelValues)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updatePlaybackStateWithDiff:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 playbackState];
  int v4 = 138412290;
  double v5 = v3;
  _os_log_debug_impl(&dword_1B5645000, a2, OS_LOG_TYPE_DEBUG, "playback state after updates: %@", (uint8_t *)&v4, 0xCu);
}

- (void)updatePlaybackStateWithDiff:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B5645000, a2, OS_LOG_TYPE_DEBUG, "updatePlaybackStateWithDiff: %@", (uint8_t *)&v2, 0xCu);
}

@end