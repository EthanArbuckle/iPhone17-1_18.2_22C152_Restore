@interface SFSettingsAnalytics
+ (void)trackingAppAccessTransparencyVisited:(id)a3;
+ (void)trackingAppActivitySaved;
+ (void)trackingControlValueChanged:(id)a3 sender:(id)a4;
+ (void)trackingPerformSelector:(id)a3 targetString:(id)a4;
+ (void)trackingRecordAppActivityVisited;
+ (void)trackingSettingsOpenByURL:(BOOL)a3 url:(id)a4;
+ (void)trackingSettingsSearchUsed:(BOOL)a3 isUser65AgeOrOlder:(BOOL)a4 numberOfSectionsInResults:(unint64_t)a5 numberOfTotalResults:(unint64_t)a6 searchFromSpotlight:(BOOL)a7 methodForEndingSearch:(unint64_t)a8 searchResultURL:(id)a9 searchActivityID:(id)a10;
+ (void)trackingSettingsSearchUsed:(BOOL)a3 isUser65AgeOrOlder:(BOOL)a4 searchFromSpotlight:(BOOL)a5 searchActivityID:(id)a6;
+ (void)trackingSettingsSearchUsed:(BOOL)a3 numberOfSectionsInResults:(unint64_t)a4 numberOfTotalResults:(unint64_t)a5 searchFromSpotlight:(BOOL)a6 methodForEndingSearch:(unint64_t)a7 searchActivityID:(id)a8;
+ (void)trackingSettingsSearchUsed:(BOOL)a3 searchFromSpotlight:(BOOL)a4 methodForEndingSearch:(unint64_t)a5 searchResultURL:(id)a6;
+ (void)trackingStateOfRequest:(BOOL)a3 askAppsToStopTracking:(BOOL)a4;
+ (void)trackingStateOfRequestForSpecificApp:(unint64_t)a3 view:(id)a4;
+ (void)trackingViewControllersVisitedInRootController:(id)a3;
+ (void)trackingViewVisited;
@end

@implementation SFSettingsAnalytics

+ (void)trackingStateOfRequestForSpecificApp:(unint64_t)a3 view:(id)a4
{
  id v4 = a4;
  v5 = v4;
  if (v4)
  {
    v14 = v4;
    AnalyticsSendEventLazy();
    v6 = v14;
  }
  else
  {
    v6 = SFLogForCategory(4uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SFSettingsAnalytics trackingStateOfRequestForSpecificApp:view:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

id __65__SFSettingsAnalytics_trackingStateOfRequestForSpecificApp_view___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"result";
  v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v5[1] = @"view";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (void)trackingViewVisited
{
}

id __42__SFSettingsAnalytics_trackingViewVisited__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v2 = @"result";
  v3[0] = &unk_26C610698;
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

+ (void)trackingStateOfRequest:(BOOL)a3 askAppsToStopTracking:(BOOL)a4
{
}

id __68__SFSettingsAnalytics_trackingStateOfRequest_askAppsToStopTracking___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"result";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v6[1] = @"askAppsToStopTracking";
  v7[0] = v2;
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 33)];
  v7[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)trackingAppAccessTransparencyVisited:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v13 = v3;
    AnalyticsSendEventLazy();
    v5 = v13;
  }
  else
  {
    v5 = SFLogForCategory(4uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SFSettingsAnalytics trackingAppAccessTransparencyVisited:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

id __60__SFSettingsAnalytics_trackingAppAccessTransparencyVisited___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"result";
  v4[1] = @"app";
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = &unk_26C610698;
  v5[1] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

+ (void)trackingRecordAppActivityVisited
{
}

id __55__SFSettingsAnalytics_trackingRecordAppActivityVisited__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v2 = @"result";
  v3[0] = MEMORY[0x263EFFA88];
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

+ (void)trackingAppActivitySaved
{
}

id __47__SFSettingsAnalytics_trackingAppActivitySaved__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v2 = @"result";
  v3[0] = &unk_26C610698;
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

+ (void)trackingPerformSelector:(id)a3 targetString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v16 = v5;
    id v17 = v7;
    AnalyticsSendEventLazy();

    uint64_t v8 = v16;
  }
  else
  {
    uint64_t v8 = SFLogForCategory(4uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SFSettingsAnalytics trackingPerformSelector:targetString:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

id __60__SFSettingsAnalytics_trackingPerformSelector_targetString___block_invoke(uint64_t a1)
{
  void v7[3] = *MEMORY[0x263EF8340];
  v6[0] = @"selector";
  v6[1] = @"target";
  uint64_t v1 = *(void *)(a1 + 40);
  v7[0] = *(void *)(a1 + 32);
  v7[1] = v1;
  void v6[2] = @"bundleID";
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];
  v7[2] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

+ (void)trackingViewControllersVisitedInRootController:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v13 = v3;
    AnalyticsSendEventLazy();
    id v5 = v13;
  }
  else
  {
    id v5 = SFLogForCategory(4uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SFSettingsAnalytics trackingViewControllersVisitedInRootController:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

id __70__SFSettingsAnalytics_trackingViewControllersVisitedInRootController___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v6[0] = @"target";
  v6[1] = @"bundleID";
  v7[0] = v1;
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];
  v7[1] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)trackingControlValueChanged:(id)a3 sender:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v16 = v5;
    id v17 = v7;
    AnalyticsSendEventLazy();

    uint64_t v8 = v16;
  }
  else
  {
    uint64_t v8 = SFLogForCategory(4uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SFSettingsAnalytics trackingControlValueChanged:sender:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

id __58__SFSettingsAnalytics_trackingControlValueChanged_sender___block_invoke(uint64_t a1)
{
  void v7[3] = *MEMORY[0x263EF8340];
  v6[0] = @"target";
  v6[1] = @"sender";
  uint64_t v1 = *(void *)(a1 + 40);
  v7[0] = *(void *)(a1 + 32);
  v7[1] = v1;
  void v6[2] = @"bundleID";
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];
  v7[2] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

+ (void)trackingSettingsOpenByURL:(BOOL)a3 url:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __53__SFSettingsAnalytics_trackingSettingsOpenByURL_url___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"fromSearch";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = @"url";
  v8[2] = @"bundleID";
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 bundleIdentifier];
  v9[2] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (void)trackingSettingsSearchUsed:(BOOL)a3 isUser65AgeOrOlder:(BOOL)a4 numberOfSectionsInResults:(unint64_t)a5 numberOfTotalResults:(unint64_t)a6 searchFromSpotlight:(BOOL)a7 methodForEndingSearch:(unint64_t)a8 searchResultURL:(id)a9 searchActivityID:(id)a10
{
  id v10 = a9;
  id v13 = a10;
  id v11 = v13;
  id v12 = v10;
  AnalyticsSendEventLazy();
}

id __191__SFSettingsAnalytics_trackingSettingsSearchUsed_isUser65AgeOrOlder_numberOfSectionsInResults_numberOfTotalResults_searchFromSpotlight_methodForEndingSearch_searchResultURL_searchActivityID___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v3 = [NSNumber numberWithBool:1];
    [v2 setObject:v3 forKeyedSubscript:@"keyboardDisplayed"];
  }
  if (*(unsigned char *)(a1 + 73))
  {
    id v4 = [NSNumber numberWithBool:1];
    [v2 setObject:v4 forKeyedSubscript:@"isUser65AgeOrOlder"];
  }
  if (*(void *)(a1 + 48))
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v2 setObject:v5 forKeyedSubscript:@"numberOfSectionsInResults"];
  }
  if (*(void *)(a1 + 56))
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v2 setObject:v6 forKeyedSubscript:@"numberOfTotalResults"];
  }
  if (*(unsigned char *)(a1 + 74))
  {
    uint64_t v7 = [NSNumber numberWithBool:1];
    [v2 setObject:v7 forKeyedSubscript:@"searchFromSpotlight"];
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v2 setObject:v8 forKeyedSubscript:@"methodForEndingSearch"];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    [v2 setObject:v9 forKeyedSubscript:@"searchResultURL"];
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    [v2 setObject:v10 forKeyedSubscript:@"searchActivityID"];
  }
  return v2;
}

+ (void)trackingSettingsSearchUsed:(BOOL)a3 isUser65AgeOrOlder:(BOOL)a4 searchFromSpotlight:(BOOL)a5 searchActivityID:(id)a6
{
}

+ (void)trackingSettingsSearchUsed:(BOOL)a3 numberOfSectionsInResults:(unint64_t)a4 numberOfTotalResults:(unint64_t)a5 searchFromSpotlight:(BOOL)a6 methodForEndingSearch:(unint64_t)a7 searchActivityID:(id)a8
{
}

+ (void)trackingSettingsSearchUsed:(BOOL)a3 searchFromSpotlight:(BOOL)a4 methodForEndingSearch:(unint64_t)a5 searchResultURL:(id)a6
{
}

+ (void)trackingStateOfRequestForSpecificApp:(uint64_t)a3 view:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)trackingAppAccessTransparencyVisited:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)trackingPerformSelector:(uint64_t)a3 targetString:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)trackingViewControllersVisitedInRootController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)trackingControlValueChanged:(uint64_t)a3 sender:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end