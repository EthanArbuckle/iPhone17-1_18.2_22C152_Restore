@interface BEAccessibilityManager
+ (BOOL)isAccessibilityLoaded;
+ (id)sharedInstance;
+ (void)accessibilityInitialize;
+ (void)accessibilityNeedsReload;
- (BOOL)isAccessibilitySupportLoaded;
- (void)addSafeCategoryNamesToCollection:(id)a3;
- (void)loadAccessibilitySupport;
- (void)loadAccessibilitySupportWithDelay;
- (void)setIsAccessibilitySupportLoaded:(BOOL)a3;
@end

@implementation BEAccessibilityManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D27C;
  block[3] = &unk_208B8;
  block[4] = a1;
  if (qword_27200 != -1) {
    dispatch_once(&qword_27200, block);
  }
  v2 = (void *)qword_27208;

  return v2;
}

+ (void)accessibilityInitialize
{
  id v2 = [a1 sharedInstance];
  [v2 loadAccessibilitySupport];
}

+ (BOOL)isAccessibilityLoaded
{
  id v2 = [a1 sharedInstance];
  unsigned __int8 v3 = [v2 isAccessibilityLoaded];

  return v3;
}

+ (void)accessibilityNeedsReload
{
  id v2 = [a1 sharedInstance];
  [v2 setIsAccessibilitySupportLoaded:0];
  [v2 loadAccessibilitySupportWithDelay];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)loadAccessibilitySupportWithDelay
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D478;
  block[3] = &unk_20798;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)loadAccessibilitySupport
{
  if (![(BEAccessibilityManager *)self isAccessibilitySupportLoaded])
  {
    if (BAXShouldPerformValidationChecks()) {
      [(BEAccessibilityManager *)self performValidation];
    }
    id v3 = (id)objc_opt_new();
    [(BEAccessibilityManager *)self addSafeCategoryNamesToCollection:v3];
    BAXInstallSafeCategories(v3);
    [(BEAccessibilityManager *)self setIsAccessibilitySupportLoaded:1];
  }
}

- (void)addSafeCategoryNamesToCollection:(id)a3
{
  id v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [v3 addObject:@"BAXObjectWrapper"];
  }
  [v3 addObject:@"BEAXObjectWrapper_Notifications"];
  [v3 addObject:@"BAXWebPageAccessibilityObjectWrapper"];
}

- (BOOL)isAccessibilitySupportLoaded
{
  return self->_isAccessibilitySupportLoaded;
}

- (void)setIsAccessibilitySupportLoaded:(BOOL)a3
{
  self->_isAccessibilitySupportLoaded = a3;
}

@end