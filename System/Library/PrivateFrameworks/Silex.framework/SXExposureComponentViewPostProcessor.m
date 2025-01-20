@interface SXExposureComponentViewPostProcessor
- (NSMapTable)exposedEvents;
- (SXAnalyticsReportingProvider)analyticsReporterProvider;
- (SXComponentExposureMonitor)monitor;
- (SXExposureComponentViewPostProcessor)initWithExposureMonitor:(id)a3 analyticsReportingProvider:(id)a4;
- (void)processComponent:(id)a3 view:(id)a4;
@end

@implementation SXExposureComponentViewPostProcessor

- (SXExposureComponentViewPostProcessor)initWithExposureMonitor:(id)a3 analyticsReportingProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXExposureComponentViewPostProcessor;
  v9 = [(SXExposureComponentViewPostProcessor *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_monitor, a3);
    objc_storeStrong((id *)&v10->_analyticsReporterProvider, a4);
    uint64_t v11 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    exposedEvents = v10->_exposedEvents;
    v10->_exposedEvents = (NSMapTable *)v11;
  }
  return v10;
}

- (void)processComponent:(id)a3 view:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 analytics];
  v9 = [v8 allKeys];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [(SXExposureComponentViewPostProcessor *)self exposedEvents];
    [v11 removeObjectForKey:v7];

    v12 = [(SXExposureComponentViewPostProcessor *)self monitor];
    [v12 stopTrackingExposureOfComponentView:v7];

    objc_initWeak(&location, self);
    v13 = [(SXExposureComponentViewPostProcessor *)self monitor];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __62__SXExposureComponentViewPostProcessor_processComponent_view___block_invoke;
    v14[3] = &unk_264650D80;
    objc_copyWeak(&v17, &location);
    id v15 = v6;
    id v16 = v7;
    [v13 onExposureOf:v16 then:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __62__SXExposureComponentViewPostProcessor_processComponent_view___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      id v10 = WeakRetained;
      id v7 = [WeakRetained exposedEvents];
      v5 = [v7 objectForKey:*(void *)(a1 + 40)];

      if (!v5)
      {
LABEL_8:

        id WeakRetained = v10;
        goto LABEL_9;
      }
      [(SXAnalyticsEvent *)v5 determineEndDate];
      id v8 = [v10 analyticsReporterProvider];
      v9 = [v8 analyticsReporting];
      [v9 reportEvent:v5];

      id v6 = [v10 exposedEvents];
      [v6 removeObjectForKey:*(void *)(a1 + 40)];
    }
    else
    {
      if (a2 != 1) {
        goto LABEL_9;
      }
      id v10 = WeakRetained;
      v5 = [[SXComponentExposureEvent alloc] initWithComponent:*(void *)(a1 + 32)];
      id v6 = [v10 exposedEvents];
      [v6 setObject:v5 forKey:*(void *)(a1 + 40)];
    }

    goto LABEL_8;
  }
LABEL_9:
}

- (SXComponentExposureMonitor)monitor
{
  return self->_monitor;
}

- (SXAnalyticsReportingProvider)analyticsReporterProvider
{
  return self->_analyticsReporterProvider;
}

- (NSMapTable)exposedEvents
{
  return self->_exposedEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposedEvents, 0);
  objc_storeStrong((id *)&self->_analyticsReporterProvider, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end