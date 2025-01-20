@interface SBSwipeMetric
- (SBSwipeMetric)init;
@end

@implementation SBSwipeMetric

uint64_t __21__SBSwipeMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2 != 33) {
    return 0;
  }
  v4 = [a3 eventPayload];
  uint64_t v5 = *(void *)(a1 + 32) + 24;
  *(double *)uint64_t v5 = CGPointFromState(v4);
  *(void *)(v5 + 8) = v6;
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7648]];
  *(void *)(*(void *)(a1 + 32) + 40) = [v7 unsignedIntegerValue];

  v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7658]];
  [v8 doubleValue];
  *(double *)(*(void *)(a1 + 32) + 48) = v9 * 1000.0;

  return 1;
}

- (SBSwipeMetric)init
{
  v16.receiver = self;
  v16.super_class = (Class)SBSwipeMetric;
  v2 = [(SBAnalyticsStateMachineEventHandler *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __21__SBSwipeMetric_init__block_invoke;
    v14[3] = &unk_1E6AF4C08;
    v4 = v2;
    v15 = v4;
    uint64_t v5 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v14];
    [(SBAnalyticsStateMachineEventHandler *)v4 addEdge:v5];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __21__SBSwipeMetric_init__block_invoke_2;
    v12 = &unk_1E6AF4C08;
    uint64_t v6 = v4;
    v13 = v6;
    v7 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:&v9];
    -[SBAnalyticsStateMachineEventHandler addEdge:](v6, "addEdge:", v7, v9, v10, v11, v12);
  }
  return v3;
}

uint64_t __21__SBSwipeMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a2 != 34) {
    return 1;
  }
  v4 = [a3 eventPayload];
  double v5 = CGPointFromState(v4);
  CGFloat v7 = v6;
  v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7628]];
  unint64_t v9 = [v8 unsignedIntegerValue];

  uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7638]];
  [v10 doubleValue];
  uint64_t v12 = v11;

  v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7640]];
  [v13 doubleValue];
  uint64_t v15 = v14;

  objc_super v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7630]];
  [v16 doubleValue];
  uint64_t v18 = v17;

  v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7650]];
  [v19 doubleValue];
  uint64_t v21 = v20;

  v22 = +[SBDefaults localDefaults];
  v23 = [v22 appSwitcherDefaults];

  uint64_t v24 = [v23 bottomEdgeGestureSwipeCount];
  [v23 setBottomEdgeGestureSwipeCount:v24 + 1];
  v25 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = v24;
    _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_INFO, "----SWIPE BEGIN %lu----", buf, 0xCu);
  }

  v26 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = NSStringFromCGPoint(*(CGPoint *)(*(void *)(a1 + 32) + 24));
    *(_DWORD *)buf = 138543362;
    uint64_t v46 = (uint64_t)v27;
    _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_INFO, "initialLocation: %{public}@", buf, 0xCu);
  }
  v28 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v50.x = v5;
    v50.y = v7;
    v29 = NSStringFromCGPoint(v50);
    *(_DWORD *)buf = 138543362;
    uint64_t v46 = (uint64_t)v29;
    _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_INFO, "finalLocation: %{public}@", buf, 0xCu);
  }
  v30 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    unint64_t v31 = *(void *)(*(void *)(a1 + 32) + 40) - 1;
    if (v31 > 3) {
      v32 = @"unknown";
    }
    else {
      v32 = off_1E6B070A0[v31];
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v46 = (uint64_t)v32;
    _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_INFO, "orientation: %{public}@", buf, 0xCu);
  }

  v34 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    if (v9 > 3) {
      v35 = @"home";
    }
    else {
      v35 = off_1E6B070C0[v9];
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v46 = (uint64_t)v35;
    _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_INFO, "finalAction: %{public}@", buf, 0xCu);
  }

  v36 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = v21;
    _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_INFO, "peakSpeed: %g", buf, 0xCu);
  }

  v37 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v46 = v12;
    __int16 v47 = 2048;
    uint64_t v48 = v15;
    _os_log_impl(&dword_1D85BA000, v37, OS_LOG_TYPE_INFO, "liftOffVelocity: (%g, %g)", buf, 0x16u);
  }

  v38 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = v18;
    _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_INFO, "liftOffAngle: %g", buf, 0xCu);
  }

  v39 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = v40;
    _os_log_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_INFO, "timestampDelta: %g", buf, 0xCu);
  }

  v41 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    [v4 timestamp];
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = v42;
    _os_log_impl(&dword_1D85BA000, v41, OS_LOG_TYPE_INFO, "timestamp: %g", buf, 0xCu);
  }

  v43 = SBLogSystemGestureHome();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v46 = v24;
    _os_log_impl(&dword_1D85BA000, v43, OS_LOG_TYPE_INFO, "----SWIPE END %lu----", buf, 0xCu);
  }

  v44 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.d22.swipe.%lu.", v24);
  [v44 stringByAppendingString:@"il.x"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"il.y"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"fl.x"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"fl.y"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"o"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"ps"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"lov.x"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"lov.y"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"loa"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"ts"];
  [v4 timestamp];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"tsd"];
  ADClientSetValueForScalarKey();
  [v44 stringByAppendingString:@"fa"];
  ADClientSetValueForScalarKey();

  return 0;
}

@end