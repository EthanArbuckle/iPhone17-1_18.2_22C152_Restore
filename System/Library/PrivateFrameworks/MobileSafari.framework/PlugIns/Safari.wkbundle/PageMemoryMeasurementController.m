@interface PageMemoryMeasurementController
- (PageMemoryMeasurementController)initWithPluginPageContextController:(id)a3 pagesNeedingMemoryWarningSent:(id)a4;
- (id)_memoryUsage:(BOOL)a3;
- (void)_doBeforePageLoad;
- (void)_postPageLoadEnd;
- (void)_waitForMemoryPressureHandlerTimerFired:(id)a3;
@end

@implementation PageMemoryMeasurementController

- (PageMemoryMeasurementController)initWithPluginPageContextController:(id)a3 pagesNeedingMemoryWarningSent:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PageMemoryMeasurementController;
  v8 = [(MeasurementControllerBase *)&v12 initWithPluginPageContextController:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pagesNeedingMemoryWarningSent, a4);
    v9->_currentPageIndex = -1;
    v10 = v9;
  }

  return v9;
}

- (id)_memoryUsage:(BOOL)a3
{
  BOOL v3 = a3;
  mach_msg_type_number_t task_info_outCnt = 93;
  if (task_info(*MEMORY[0x263EF8960], 0x16u, task_info_out, &task_info_outCnt))
  {
    objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v4, 0, v5);
  }
  else if (v3)
  {
    objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v4, v12, v5);
  }
  else
  {
    objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v4, v11 + v10, v5);
  v6 = };

  return v6;
}

- (void)_doBeforePageLoad
{
}

- (void)_postPageLoadEnd
{
  v4 = objc_msgSend_objectForKey_(self->super._loadData, a2, @"PageMemoryBeforeWarning", v2);

  if (!v4)
  {
    objc_msgSend_objectAtIndex_(self->_pagesNeedingMemoryWarningSent, v5, self->_currentPageIndex, v6);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_msgSend_BOOLValue(v31, v7, v8, v9);

    if (v10)
    {
      objc_msgSend__memoryUsage_(self, v11, 1, v13);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forKey_(self->super._loadData, v14, (uint64_t)v32, @"PageMemoryBeforeWarning");
      notify_post("org.WebKit.lowMemory");
      id v15 = objc_alloc(MEMORY[0x263EFFA20]);
      v19 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v16, v17, v18, 2.0);
      v21 = (NSTimer *)objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(v15, v20, (uint64_t)v19, (uint64_t)self, sel__waitForMemoryPressureHandlerTimerFired_, 0, 0, 0.0);
      waitForMemoryPressureHandler = self->_waitForMemoryPressureHandler;
      self->_waitForMemoryPressureHandler = v21;

      v26 = objc_msgSend_currentRunLoop(MEMORY[0x263EFF9F0], v23, v24, v25);
      objc_msgSend_addTimer_forMode_(v26, v27, (uint64_t)self->_waitForMemoryPressureHandler, *MEMORY[0x263EFF478]);
    }
    else
    {
      objc_msgSend__sendPageLoadFinishedEvent(self, v11, v12, v13);
      objc_msgSend__clearPageLoadState(self, v28, v29, v30);
    }
  }
}

- (void)_waitForMemoryPressureHandlerTimerFired:(id)a3
{
  objc_msgSend__memoryUsage_(self, a2, 0, v3);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(self->super._loadData, v5, (uint64_t)v12, @"PageMemoryAfterWarning");
  objc_msgSend__sendPageLoadFinishedEvent(self, v6, v7, v8);
  objc_msgSend__clearPageLoadState(self, v9, v10, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pagesNeedingMemoryWarningSent, 0);

  objc_storeStrong((id *)&self->_waitForMemoryPressureHandler, 0);
}

@end