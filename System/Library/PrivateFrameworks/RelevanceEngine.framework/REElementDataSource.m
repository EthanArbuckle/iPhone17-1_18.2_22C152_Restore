@interface REElementDataSource
+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersion;
+ (BOOL)drivenByUserInteraction;
+ (BOOL)supportsPersistence;
+ (BOOL)wantsAppPrewarm;
+ (BOOL)wantsAutomaticFetching;
+ (BOOL)wantsLocationInUseAsserton;
+ (BOOL)wantsPrivateQueue;
+ (BOOL)wantsReloadForFirstDeviceUnlock;
+ (BOOL)wantsReloadForSignificantTimeChange;
+ (NSString)bundleIdentifier;
+ (id)contentAttributes;
+ (id)overrideDataSourceImage;
+ (id)overrideLocalizedDataSourceName;
+ (unint64_t)elementContentMode;
- (BOOL)allowsLocationUse;
- (BOOL)hasUnlockedSinceBoot;
- (BOOL)isRunning;
- (NSArray)supportedSections;
- (NSDictionary)dataSourceProperties;
- (NSString)logHeader;
- (NSString)name;
- (REElementDataSource)init;
- (REElementDataSourceDelegate)delegate;
- (id)activityDelegate;
- (id)complicationDescriptor;
- (unint64_t)state;
- (void)beginActivity:(id)a3;
- (void)beginFetchingData;
- (void)collectLoggableState:(id)a3;
- (void)finishActivity:(id)a3;
- (void)finishFetchingData;
- (void)getElementsDuringDateInterval:(id)a3 inSection:(unint64_t)a4 withHandler:(id)a5;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
- (void)loadLoggingHeader;
- (void)setActivityDelegate:(id)a3;
- (void)setAllowsLocationUse:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setUnlockedSinceBoot:(BOOL)a3;
@end

@implementation REElementDataSource

- (void)loadLoggingHeader
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v9 = (id)[v4 mutableCopy];

  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"REUpNext", &stru_26CFA57D0, 1, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"DataSource", &stru_26CFA57D0, 1, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"Watch", &stru_26CFA57D0, 1, 0, objc_msgSend(v9, "length"));
  v5 = NSString;
  v6 = [v9 lowercaseString];
  v7 = [v5 stringWithFormat:@"[DS: %@]", v6];
  logHeader = self->_logHeader;
  self->_logHeader = v7;
}

- (void)setUnlockedSinceBoot:(BOOL)a3
{
  self->_unlockedSinceBoot = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setActivityDelegate:(id)a3
{
}

- (REElementDataSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)REElementDataSource;
  v2 = [(REElementDataSource *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 1;
    [(REElementDataSource *)v2 loadLoggingHeader];
  }
  return v3;
}

+ (BOOL)wantsReloadForSignificantTimeChange
{
  return 1;
}

+ (BOOL)wantsPrivateQueue
{
  return 0;
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersion
{
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 1;
  return result;
}

+ (unint64_t)elementContentMode
{
  return 2;
}

+ (BOOL)drivenByUserInteraction
{
  return 0;
}

+ (id)contentAttributes
{
  if (contentAttributes_onceToken != -1) {
    dispatch_once(&contentAttributes_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)contentAttributes_ContentAttributes;
  return v2;
}

void __40__REElementDataSource_contentAttributes__block_invoke()
{
  v2[8] = *MEMORY[0x263EF8340];
  v2[0] = @"REContentHeaderTextKey";
  v2[1] = @"REContentDescription1TextKey";
  v2[2] = @"REContentDescription2TextKey";
  v2[3] = @"REContentDescription3TextKey";
  v2[4] = @"REContentCLKHeaderTextKey";
  v2[5] = @"REContentCLKDescription1TextKey";
  v2[6] = @"REContentCLKDescription2TextKey";
  v2[7] = @"REContentCLKDescription3TextKey";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:8];
  v1 = (void *)contentAttributes_ContentAttributes;
  contentAttributes_ContentAttributes = v0;
}

+ (id)overrideDataSourceImage
{
  return 0;
}

+ (id)overrideLocalizedDataSourceName
{
  return 0;
}

+ (BOOL)wantsAppPrewarm
{
  return 1;
}

+ (BOOL)wantsLocationInUseAsserton
{
  return 0;
}

+ (BOOL)supportsPersistence
{
  return 0;
}

- (NSArray)supportedSections
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (id)complicationDescriptor
{
  return 0;
}

+ (BOOL)wantsReloadForFirstDeviceUnlock
{
  return 1;
}

+ (BOOL)wantsAutomaticFetching
{
  return 1;
}

- (void)beginFetchingData
{
}

- (void)finishFetchingData
{
}

- (id)activityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityDelegate);
  return WeakRetained;
}

- (void)beginActivity:(id)a3
{
  p_activityDelegate = &self->_activityDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_activityDelegate);
  [WeakRetained dataSource:self didBeginActivity:v5];
}

- (void)finishActivity:(id)a3
{
  p_activityDelegate = &self->_activityDelegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_activityDelegate);
  [WeakRetained dataSource:self didFinishActivity:v5];
}

- (NSString)name
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSDictionary)dataSourceProperties
{
  return 0;
}

- (REElementDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (REElementDataSourceDelegate *)WeakRetained;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (BOOL)allowsLocationUse
{
  return self->_allowsLocationUse;
}

- (void)setAllowsLocationUse:(BOOL)a3
{
  self->_allowsLocationUse = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)logHeader
{
  return self->_logHeader;
}

- (BOOL)hasUnlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHeader, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activityDelegate);
}

- (void)collectLoggableState:(id)a3
{
  if (a3) {
    (*((void (**)(id, __CFString *))a3 + 2))(a3, &stru_26CFA57D0);
  }
}

+ (NSString)bundleIdentifier
{
  return 0;
}

- (void)getElementsDuringDateInterval:(id)a3 inSection:(unint64_t)a4 withHandler:(id)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end