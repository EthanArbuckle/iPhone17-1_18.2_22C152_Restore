@interface SPUISearchFirstTimeViewController
+ (BOOL)hasBeenDisplayed;
+ (BOOL)needsDisplay;
+ (BOOL)useZKWFTE;
+ (int64_t)viewCount;
+ (void)dismissForever;
+ (void)incrementViewCount;
+ (void)updateViewCountToCount:(int64_t)a3;
- (SPUISearchFirstTimeViewController)initWithDomains:(id)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6;
- (UIView)contentView;
- (double)idealContentHeight;
- (void)setContentView:(id)a3;
- (void)updateViewCount;
@end

@implementation SPUISearchFirstTimeViewController

+ (BOOL)needsDisplay
{
  return (unint64_t)[a1 viewCount] < 3;
}

+ (int64_t)viewCount
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.spotlightui"];
  if ([v2 integerForKey:@"SPUISearchFirstTimeLastOSVersionUsed"] <= 15)
  {
    v3 = [MEMORY[0x263F08AB0] processInfo];
    v4 = v3;
    if (v3)
    {
      [v3 operatingSystemVersion];
      uint64_t v5 = v10;
    }
    else
    {
      uint64_t v5 = 0;
    }
    [v2 setInteger:v5 forKey:@"SPUISearchFirstTimeLastOSVersionUsed"];

    [v2 setInteger:0 forKey:@"SPUISearchFirstTimeShowCount"];
  }
  int64_t v6 = [v2 integerForKey:@"SPUISearchFirstTimeShowCount"];
  v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v2;
    __int16 v13 = 2048;
    int64_t v14 = v6;
    _os_log_impl(&dword_23D2E6000, v7, v8, "[FTE] count from new prefs (%@) is: %ld", buf, 0x16u);
  }

  return v6;
}

+ (void)updateViewCountToCount:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.spotlightui"];
  [v4 setInteger:a3 forKey:@"SPUISearchFirstTimeShowCount"];
  uint64_t v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = 138412546;
    os_log_type_t v8 = v4;
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl(&dword_23D2E6000, v5, v6, "[FTE] updating view count in %@ to: %ld", (uint8_t *)&v7, 0x16u);
  }

  notify_post("com.apple.spotlightui.prefschanged");
}

+ (void)dismissForever
{
}

- (SPUISearchFirstTimeViewController)initWithDomains:(id)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6
{
  v16.receiver = self;
  v16.super_class = (Class)SPUISearchFirstTimeViewController;
  os_log_type_t v6 = [(SearchUIFirstTimeExperienceViewController *)&v16 initWithDomains:a3 explanationText:a4 learnMoreText:a5 continueButtonTitle:a6];
  if (v6)
  {
    int v7 = objc_opt_new();
    [v7 setAlwaysBounceVertical:1];
    [v7 setDelaysContentTouches:0];
    [v7 setKeyboardDismissMode:1];
    os_log_type_t v8 = [(SPUISearchFirstTimeViewController *)v6 view];
    [v7 addSubview:v8];

    __int16 v9 = [(SPUISearchFirstTimeViewController *)v6 view];
    [(SPUISearchFirstTimeViewController *)v6 setContentView:v9];

    int64_t v10 = (void *)MEMORY[0x263F67C10];
    uint64_t v11 = [(SPUISearchFirstTimeViewController *)v6 view];
    [v10 constrainViewHeightContainer:v11];

    v12 = (void *)MEMORY[0x263F67C10];
    __int16 v13 = [(SPUISearchFirstTimeViewController *)v6 view];
    id v14 = (id)[v12 alignView:v7 toView:v13 withAttribute:9];

    [(SPUISearchFirstTimeViewController *)v6 setView:v7];
  }
  return v6;
}

- (void)updateViewCount
{
  v2 = objc_opt_class();
  [v2 incrementViewCount];
}

+ (void)incrementViewCount
{
  _hasBeenDisplayed = 1;
  uint64_t v3 = [a1 viewCount] + 1;
  [a1 updateViewCountToCount:v3];
}

- (double)idealContentHeight
{
  uint64_t v3 = [(SPUISearchFirstTimeViewController *)self contentView];
  [v3 setNeedsLayout];

  v4 = [(SPUISearchFirstTimeViewController *)self contentView];
  [v4 layoutIfNeeded];

  uint64_t v5 = [(SPUISearchFirstTimeViewController *)self contentView];
  [v5 frame];
  double v7 = v6;

  return v7;
}

+ (BOOL)hasBeenDisplayed
{
  return _hasBeenDisplayed;
}

+ (BOOL)useZKWFTE
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x263F7E3D0];
    LOBYTE(v2) = [v3 isPhone];
  }
  return v2;
}

- (UIView)contentView
{
  return (UIView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setContentView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end