@interface SXComponentExposureMonitor
- (NSMutableSet)trackingComponents;
- (SXComponentExposureMonitor)initWithViewport:(id)a3 appStateMonitor:(id)a4 componentController:(id)a5 host:(id)a6;
- (SXHost)host;
- (SXViewport)viewport;
- (void)beginExposure:(id)a3;
- (void)endExposure:(id)a3;
- (void)onExposureOf:(id)a3 then:(id)a4;
- (void)onExposureOf:(id)a3 then:(id)a4 when:(id)a5;
- (void)onExposureOf:(id)a3 traits:(unint64_t)a4 then:(id)a5;
- (void)onExposureOf:(id)a3 traits:(unint64_t)a4 then:(id)a5 when:(id)a6;
- (void)performMonitoring;
- (void)setTrackingComponents:(id)a3;
- (void)stopTrackingExposureOfComponentView:(id)a3;
- (void)trackExposureForTracking:(id)a3;
@end

@implementation SXComponentExposureMonitor

- (SXComponentExposureMonitor)initWithViewport:(id)a3 appStateMonitor:(id)a4 componentController:(id)a5 host:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)SXComponentExposureMonitor;
  v15 = [(SXComponentExposureMonitor *)&v34 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_viewport, a3);
    objc_storeStrong((id *)&v16->_host, a6);
    uint64_t v17 = [MEMORY[0x263EFF9C0] set];
    trackingComponents = v16->_trackingComponents;
    v16->_trackingComponents = (NSMutableSet *)v17;

    [v11 addViewportChangeListener:v16 forOptions:26];
    objc_initWeak(&location, v16);
    if (objc_opt_respondsToSelector())
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke;
      v31[3] = &unk_264651108;
      objc_copyWeak(&v32, &location);
      [v12 performOnApplicationWindowDidBecomeBackground:v31];
      objc_destroyWeak(&v32);
    }
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_2;
    v29[3] = &unk_264651108;
    objc_copyWeak(&v30, &location);
    [v12 performOnApplicationDidEnterBackground:v29];
    if (objc_opt_respondsToSelector())
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_3;
      v27[3] = &unk_264651108;
      objc_copyWeak(&v28, &location);
      [v12 performOnApplicationWindowDidBecomeForeground:v27];
      objc_destroyWeak(&v28);
    }
    if (objc_opt_respondsToSelector())
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_4;
      v25[3] = &unk_264651108;
      objc_copyWeak(&v26, &location);
      [v12 performOnApplicationWillEnterForeground:v25];
      objc_destroyWeak(&v26);
    }
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_5;
    v23 = &unk_264651108;
    objc_copyWeak(&v24, &location);
    [v12 performOnApplicationDidBecomeActive:&v20];
    objc_msgSend(v13, "addObserver:", v16, v20, v21, v22, v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "trackingComponents", 0);

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 lastObservedVisibilityState] == 1)
        {
          id v9 = objc_loadWeakRetained(v1);
          [v9 endExposure:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "trackingComponents", 0);

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 lastObservedVisibilityState] == 1)
        {
          id v9 = objc_loadWeakRetained(v1);
          [v9 endExposure:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performMonitoring];
}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performMonitoring];
}

void __88__SXComponentExposureMonitor_initWithViewport_appStateMonitor_componentController_host___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performMonitoring];
}

- (void)onExposureOf:(id)a3 then:(id)a4
{
}

- (void)onExposureOf:(id)a3 traits:(unint64_t)a4 then:(id)a5
{
}

- (void)onExposureOf:(id)a3 then:(id)a4 when:(id)a5
{
}

- (void)onExposureOf:(id)a3 traits:(unint64_t)a4 then:(id)a5 when:(id)a6
{
  id v8 = +[SXComponentExposureTracking exposureTrackingWithComponent:a3 traits:a4 exposureStateChangeBlock:a5 conditionBlock:a6];
  v7 = [(SXComponentExposureMonitor *)self trackingComponents];
  [v7 addObject:v8];

  [(SXComponentExposureMonitor *)self trackExposureForTracking:v8];
}

- (void)stopTrackingExposureOfComponentView:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(SXComponentExposureMonitor *)self trackingComponents];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 componentView];

        if (v12 == v4)
        {
          long long v13 = [(SXComponentExposureMonitor *)self trackingComponents];
          id v14 = [v11 componentView];
          [v13 removeObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)performMonitoring
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [(SXComponentExposureMonitor *)self viewport];
  uint64_t v4 = [v3 appearState];

  if (v4 == 2)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v5 = [(SXComponentExposureMonitor *)self trackingComponents];
    uint64_t v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          [(SXComponentExposureMonitor *)self trackExposureForTracking:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v11 = [(SXComponentExposureMonitor *)self viewport];
    uint64_t v12 = [v11 appearState];

    if (v12) {
      return;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v13 = [(SXComponentExposureMonitor *)self trackingComponents];
    uint64_t v6 = (void *)[v13 copy];

    uint64_t v14 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v6);
          }
          long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * j);
          if ([v18 lastObservedVisibilityState] == 1) {
            [(SXComponentExposureMonitor *)self endExposure:v18];
          }
        }
        uint64_t v15 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }
  }
}

- (void)trackExposureForTracking:(id)a3
{
  id v66 = a3;
  uint64_t v4 = [v66 componentView];
  uint64_t v5 = [v4 superview];

  uint64_t v7 = v66;
  if (!v5) {
    goto LABEL_27;
  }
  uint64_t v8 = [v66 componentView];
  [v8 absoluteFrame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  long long v17 = [(SXComponentExposureMonitor *)self viewport];
  [v17 dynamicBounds];
  v80.origin.CGFloat x = v18;
  v80.origin.CGFloat y = v19;
  v80.size.CGFloat width = v20;
  v80.size.CGFloat height = v21;
  v70.origin.CGFloat x = v10;
  v70.origin.CGFloat y = v12;
  v70.size.CGFloat width = v14;
  v70.size.CGFloat height = v16;
  CGRect v71 = CGRectIntersection(v70, v80);
  CGFloat x = v71.origin.x;
  CGFloat y = v71.origin.y;
  CGFloat width = v71.size.width;
  CGFloat height = v71.size.height;

  long long v26 = [(SXComponentExposureMonitor *)self viewport];
  [v26 dynamicBounds];
  double MinY = CGRectGetMinY(v72);
  id v28 = [v66 componentView];
  [v28 absoluteFrame];
  double v29 = MinY - CGRectGetMinY(v73);

  if (v29 < 0.0) {
    double v29 = 0.0;
  }
  v74.origin.CGFloat x = x;
  v74.origin.CGFloat y = y;
  v74.size.CGFloat width = width;
  v74.size.CGFloat height = height;
  CGFloat v30 = CGRectGetWidth(v74);
  v75.origin.CGFloat x = x;
  v75.origin.CGFloat y = y;
  v75.size.CGFloat width = width;
  v75.size.CGFloat height = height;
  CGFloat v31 = CGRectGetHeight(v75);
  v76.origin.CGFloat x = 0.0;
  v76.origin.CGFloat y = v29;
  v76.size.CGFloat width = v30;
  v76.size.CGFloat height = v31;
  [v66 setMinimumVisibleY:CGRectGetMinY(v76)];
  v77.origin.CGFloat x = 0.0;
  v77.origin.CGFloat y = v29;
  v77.size.CGFloat width = v30;
  v77.size.CGFloat height = v31;
  [v66 setMaximumVisibleY:CGRectGetMaxY(v77)];
  uint64_t v6 = [v66 lastObservedVisibilityState];
  uint64_t v7 = v66;
  if (v6 != 2)
  {
    if (v6 != 1)
    {
      uint64_t v7 = v66;
      if (v6) {
        goto LABEL_27;
      }
      goto LABEL_7;
    }
    [v66 visibilityFactor];
    if (v33 < 0.0 || ([v66 visibilityFactor], v34 >= 0.00000011920929))
    {
      uint64_t v6 = [v66 conditionBlock];
      uint64_t v7 = v66;
      if (!v6) {
        goto LABEL_27;
      }
      v35 = (void *)v6;
      v44 = [v66 conditionBlock];
      char v47 = v44[2]();
    }
    else
    {
      if (([v66 traits] & 2) == 0)
      {
LABEL_25:
        uint64_t v6 = [(SXComponentExposureMonitor *)self endExposure:v66];
LABEL_26:
        uint64_t v7 = v66;
        goto LABEL_27;
      }
      v35 = [(SXComponentExposureMonitor *)self viewport];
      [v35 dynamicBounds];
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      v44 = [v66 componentView];
      [v44 absoluteFrame];
      v68.CGFloat x = v45;
      v68.CGFloat y = v46;
      v78.origin.CGFloat x = v37;
      v78.origin.CGFloat y = v39;
      v78.size.CGFloat width = v41;
      v78.size.CGFloat height = v43;
      char v47 = CGRectContainsPoint(v78, v68);
    }
    char v65 = v47;

    uint64_t v7 = v66;
    if (v65) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
LABEL_7:
  id v32 = [v7 conditionBlock];
  if (v32)
  {
    id v28 = [v66 conditionBlock];
    if (v28[2]())
    {

      uint64_t v7 = v66;
LABEL_17:
      [v7 visibilityFactor];
      if (v49 < 0.00000011920929)
      {
        uint64_t v6 = [v66 traits];
        uint64_t v7 = v66;
        if ((v6 & 2) == 0) {
          goto LABEL_27;
        }
        v50 = [(SXComponentExposureMonitor *)self viewport];
        [v50 dynamicBounds];
        CGFloat v52 = v51;
        CGFloat v54 = v53;
        CGFloat v56 = v55;
        CGFloat v58 = v57;
        v59 = [v66 componentView];
        [v59 absoluteFrame];
        v69.CGFloat x = v60;
        v69.CGFloat y = v61;
        v79.origin.CGFloat x = v52;
        v79.origin.CGFloat y = v54;
        v79.size.CGFloat width = v56;
        v79.size.CGFloat height = v58;
        BOOL v62 = CGRectContainsPoint(v79, v69);

        uint64_t v7 = v66;
        if (!v62) {
          goto LABEL_27;
        }
      }
      v63 = [(SXComponentExposureMonitor *)self host];
      int v64 = [v63 active];

      uint64_t v7 = v66;
      if (!v64) {
        goto LABEL_27;
      }
      uint64_t v6 = [(SXComponentExposureMonitor *)self beginExposure:v66];
      goto LABEL_26;
    }
  }
  v48 = [v66 conditionBlock];

  if (v32)
  {
  }
  uint64_t v7 = v66;
  if (!v48) {
    goto LABEL_17;
  }
LABEL_27:
  MEMORY[0x270F9A758](v6, v7);
}

- (void)beginExposure:(id)a3
{
  id v3 = a3;
  [v3 setLastObservedVisibilityState:1];
  uint64_t v4 = [v3 exposureStateChangeBlock];

  v4[2](v4, 1, 0.0);
}

- (void)endExposure:(id)a3
{
  id v6 = a3;
  id v3 = [v6 exposureStateChangeBlock];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = [v6 lastStateChange];
  [v4 timeIntervalSinceDate:v5];
  v3[2](v3, 2);

  [v6 setLastObservedVisibilityState:2];
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXHost)host
{
  return self->_host;
}

- (NSMutableSet)trackingComponents
{
  return self->_trackingComponents;
}

- (void)setTrackingComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingComponents, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end