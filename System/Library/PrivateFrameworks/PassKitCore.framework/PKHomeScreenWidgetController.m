@interface PKHomeScreenWidgetController
+ (void)reloadWidget:(id)a3 budgeted:(BOOL)a4 reason:(id)a5;
@end

@implementation PKHomeScreenWidgetController

+ (void)reloadWidget:(id)a3 budgeted:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = PKLogFacilityTypeGetObject(0x20uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "false";
    int v17 = 136315906;
    v18 = "+[PKHomeScreenWidgetController reloadWidget:budgeted:reason:]";
    __int16 v19 = 2112;
    id v20 = v7;
    if (v6) {
      v10 = "true";
    }
    __int16 v21 = 2080;
    v22 = v10;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "%s, identifier: %@ budgeted: %s, reason: %@", (uint8_t *)&v17, 0x2Au);
  }

  int v11 = PKIsPad();
  v12 = PKHomeScreenWidgetStubBundleIdentifier;
  if (!v11) {
    v12 = PKHomeScreenWidgetBundleIdentifier;
  }
  v13 = *v12;
  v14 = (void *)[objc_alloc((Class)getCHSTimelineControllerClass[0]()) initWithExtensionBundleIdentifier:v13 kind:v7];
  v15 = v14;
  if (v6) {
    [v14 reloadTimelineBudgetedWithReason:v8];
  }
  else {
  v16 = [v14 reloadTimelineWithReason:v8];
  }
  if (v16)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Chrono failied to reload timeline with error: %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

@end