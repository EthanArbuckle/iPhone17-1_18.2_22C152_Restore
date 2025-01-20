@interface COSUnifiedOptinFYIViewController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)hasTelephonyAndIsGreenTea;
+ (BOOL)skipControllerForExpressMode:(id)a3;
- (COSUnifiedOptinFYIViewController)init;
- (id)_detailStringKeyForCurrentState;
- (id)detailString;
- (id)okayButtonTitle;
- (id)titleString;
- (void)okayButtonPressed:(id)a3;
@end

@implementation COSUnifiedOptinFYIViewController

+ (BOOL)controllerNeedsToRun
{
  if ([a1 hasTelephonyAndIsGreenTea]) {
    return 1;
  }

  return +[COSOptinFYIController wantsUnifiedFYIPane];
}

+ (BOOL)skipControllerForExpressMode:(id)a3
{
  unsigned int v4 = +[COSOptinFYIController wantsUnifiedFYIPane];
  if (v4) {
    LOBYTE(v4) = [a1 hasTelephonyAndIsGreenTea] ^ 1;
  }
  return v4;
}

+ (BOOL)hasTelephonyAndIsGreenTea
{
  v2 = +[UIDevice currentDevice];
  if (objc_msgSend(v2, "sf_isChinaRegionCellularDevice"))
  {
    v3 = [UIApp activeWatch];
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
    unsigned __int8 v5 = [v3 supportsCapability:v4];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (COSUnifiedOptinFYIViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSUnifiedOptinFYIViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSUnifiedOptinFYIViewController *)v2 setStyle:32];
  }
  return v3;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"UNIFIED_FYI_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"UNIFIED_FYI_OK" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = [(COSUnifiedOptinFYIViewController *)self _detailStringKeyForCurrentState];
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:v2 value:&stru_100249230 table:@"Localizable"];

  return v4;
}

- (id)_detailStringKeyForCurrentState
{
  if (BPSShouldOfferSiriForDeviceLanguage()) {
    v2 = @"UNIFIED_FYI_DETAIL";
  }
  else {
    v2 = @"UNIFIED_FYI_DETAIL_DICTATION_ONLY";
  }
  v3 = +[NSString stringWithFormat:@"%@_WIFI", @"-v4"];
  id v4 = [(__CFString *)v2 stringByAppendingString:v3];
  objc_super v5 = SFLocalizableWAPIStringKeyForKey();

  if ([(id)objc_opt_class() hasTelephonyAndIsGreenTea])
  {
    uint64_t v6 = [v5 stringByAppendingString:@"-GT"];

    objc_super v5 = (void *)v6;
  }
  v7 = [UIApp activeWatch];
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
  unsigned int v9 = [v7 supportsCapability:v8];

  if (v9)
  {
    uint64_t v10 = [v5 stringByAppendingString:@"-CELLULAR"];

    objc_super v5 = (void *)v10;
  }

  return v5;
}

- (void)okayButtonPressed:(id)a3
{
  +[COSOptinFYIController doWorkForSkippedPanes];
  id v4 = [(COSUnifiedOptinFYIViewController *)self delegate];
  [v4 buddyControllerDone:self];
}

@end