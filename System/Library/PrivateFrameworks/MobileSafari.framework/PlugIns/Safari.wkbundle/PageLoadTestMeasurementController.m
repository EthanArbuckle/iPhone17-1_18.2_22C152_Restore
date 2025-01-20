@interface PageLoadTestMeasurementController
- (void)_doAfterPageLoad;
- (void)_doBeforePageLoad;
@end

@implementation PageLoadTestMeasurementController

- (void)_doBeforePageLoad
{
  v5 = NSNumber;
  v6 = objc_msgSend_date(MEMORY[0x263EFF910], a2, v2, v3);
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9);
  objc_msgSend_numberWithDouble_(v5, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setValue_forKey_(self->super._loadData, v13, (uint64_t)v14, @"PageLoadStartTime");
}

- (void)_doAfterPageLoad
{
  v5 = NSNumber;
  v6 = objc_msgSend_date(MEMORY[0x263EFF910], a2, v2, v3);
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9);
  objc_msgSend_numberWithDouble_(v5, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setValue_forKey_(self->super._loadData, v13, (uint64_t)v14, @"PageLoadEndTime");
}

@end