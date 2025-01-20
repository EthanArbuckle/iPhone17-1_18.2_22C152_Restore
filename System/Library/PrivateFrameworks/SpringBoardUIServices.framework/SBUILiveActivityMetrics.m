@interface SBUILiveActivityMetrics
+ (id)_systemApertureMetrics;
+ (id)ambientCompactDefaultMetrics;
+ (id)ambientDefaultMetrics;
+ (id)ambientWidgetMetrics;
+ (id)defaultMetrics;
+ (id)lockScreenNotificationListItemMetricsWithScaleFactor:(double)a3;
@end

@implementation SBUILiveActivityMetrics

+ (id)defaultMetrics
{
  id v3 = objc_alloc((Class)getACUISActivityMetricsRequestClass());
  v4 = [a1 lockScreenNotificationListItemMetricsWithScaleFactor:1.0];
  v5 = (void *)[v3 initWithLockScreenMetrics:v4];

  if (SBSIsSystemApertureAvailable())
  {
    v6 = [a1 _systemApertureMetrics];
    [v5 setSystemApertureMetrics:v6];
  }
  return v5;
}

+ (id)ambientDefaultMetrics
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  id v3 = [v2 traitCollection];
  [v3 displayCornerRadius];
  double v5 = v4;

  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 nativeBounds];
  double v8 = v7;
  double v10 = v9;

  v11 = [MEMORY[0x1E4F42D90] mainScreen];
  [v11 nativeScale];
  double v13 = v12;

  v14 = [getACUISSizeDimensionRequestClass() fixed:v10 / v13];
  v15 = [getACUISSizeDimensionRequestClass() fixed:v8 / v13];
  v16 = (void *)[objc_alloc((Class)getACUISEdgeInsetsClass()) initWithTop:0.0 leading:30.0 bottom:0.0 trailing:34.0];
  v17 = (void *)[objc_alloc((Class)getACUISActivityItemMetricsRequestClass()) initWithWidth:v14 height:v15 cornerRadius:v16 edgeInsets:v5 clipMargin:1.0 scaleFactor:1.0];
  v18 = (void *)[objc_alloc((Class)getACUISActivityMetricsRequestClass()) initWithLockScreenMetrics:v17];
  [v18 setAmbientMetrics:v17];

  return v18;
}

+ (id)ambientCompactDefaultMetrics
{
  v2 = [getACUISSizeDimensionRequestClass() fixed:40.0];
  id v3 = [getACUISSizeDimensionRequestClass() fixed:40.0];
  double v4 = (void *)[objc_alloc((Class)getACUISActivityItemMetricsRequestClass()) initWithWidth:v2 height:v3 cornerRadius:0 edgeInsets:10.0 clipMargin:1.0 scaleFactor:1.0];
  double v5 = (void *)[objc_alloc((Class)getACUISActivityMetricsRequestClass()) initWithLockScreenMetrics:v4];

  return v5;
}

+ (id)ambientWidgetMetrics
{
  id v3 = [a1 lockScreenNotificationListItemMetricsWithScaleFactor:2.0];
  double v4 = (void *)[objc_alloc((Class)getACUISActivityMetricsRequestClass()) initWithLockScreenMetrics:v3];
  [v4 setAmbientMetrics:v3];
  double v5 = [a1 _systemApertureMetrics];
  [v4 setSystemApertureMetrics:v5];

  return v4;
}

+ (id)_systemApertureMetrics
{
  v2 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
  [v2 sensorRegionSize];
  double v4 = v3;
  double v6 = v5;
  [v2 minimumScreenEdgeInsets];
  double v8 = v7;
  [v2 minimumContinuousCornerRadius];
  double v10 = v9;
  [v2 maximumLeadingTrailingViewSize];
  double v12 = v11;
  uint64_t v14 = [objc_alloc((Class)getACUISSizeDimensionRequestClass()) initWithMinimum:0.0 maximum:v13];
  uint64_t v15 = [getACUISSizeDimensionRequestClass() fixed:v12];
  v16 = (void *)[objc_alloc((Class)getACUISEdgeInsetsClass()) initWithTop:7.0 leading:7.0 bottom:7.0 trailing:7.0];
  v17 = (void *)[v16 copy];
  [v17 setTrailing:0.0];
  v38 = v17;
  v39 = (void *)[objc_alloc((Class)getACUISActivityItemMetricsRequestClass()) initWithWidth:v14 height:v15 cornerRadius:v17 edgeInsets:v10 clipMargin:5.0];
  v18 = (void *)[v16 copy];
  [v18 setLeading:0.0];
  v40 = (void *)v14;
  v37 = (void *)[objc_alloc((Class)getACUISActivityItemMetricsRequestClass()) initWithWidth:v14 height:v15 cornerRadius:v18 edgeInsets:v10 clipMargin:5.0];
  id v19 = objc_alloc((Class)getACUISSizeDimensionRequestClass());
  [v2 maximumHorizontalMinimalViewSize];
  v35 = (void *)[v19 initWithMinimum:0.0 maximum:v20];
  v36 = (void *)v15;
  v21 = (void *)[objc_alloc((Class)getACUISActivityItemMetricsRequestClass()) initWithWidth:v35 height:v15 cornerRadius:v16 edgeInsets:v10 clipMargin:5.0];
  [v2 maximumContinuousCornerRadius];
  double v23 = v22;
  [v2 minimumExpandedSize];
  double v25 = v24;
  [v2 maximumExpandedSize];
  v27 = [getACUISSizeDimensionRequestClass() fixed:v26];
  v28 = (void *)[objc_alloc((Class)getACUISSizeDimensionRequestClass()) initWithMinimum:v25 maximum:160.0];
  v29 = (void *)[objc_alloc((Class)getACUISEdgeInsetsClass()) initWithTop:18.0 leading:18.0 bottom:18.0 trailing:18.0];
  v30 = (void *)[objc_alloc((Class)getACUISActivityItemMetricsRequestClass()) initWithWidth:v27 height:v28 cornerRadius:v29 edgeInsets:v23 clipMargin:13.0];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v31 = (void *)getACUISSystemApertureMetricsRequestClass_softClass;
  uint64_t v45 = getACUISSystemApertureMetricsRequestClass_softClass;
  if (!getACUISSystemApertureMetricsRequestClass_softClass)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __getACUISSystemApertureMetricsRequestClass_block_invoke;
    v41[3] = &unk_1E5CCC5D0;
    v41[4] = &v42;
    __getACUISSystemApertureMetricsRequestClass_block_invoke((uint64_t)v41);
    v31 = (void *)v43[3];
  }
  v32 = v31;
  _Block_object_dispose(&v42, 8);
  v33 = objc_msgSend([v32 alloc], "initWithObstructionSize:obstructionTopMargin:expandedMetricsRequest:compactLeadingMetricsRequest:compactTrailingMetricsRequest:minimalMetricsRequest:", v30, v39, v37, v21, v4, v6, v8);

  return v33;
}

+ (id)lockScreenNotificationListItemMetricsWithScaleFactor:(double)a3
{
  double v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    +[SBUISearchUtilities idealSearchPlatterWidth];
    double v7 = v6;
  }
  else
  {
    double v8 = [MEMORY[0x1E4F42D90] mainScreen];
    [v8 nativeBounds];
    double v10 = v9;
    double v11 = [MEMORY[0x1E4F42D90] mainScreen];
    [v11 nativeScale];
    double v13 = v12;

    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v14 = (double (*)(void))getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_ptr;
    double v23 = getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_ptr;
    if (!getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_ptr)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke;
      v19[3] = &unk_1E5CCC5D0;
      v19[4] = &v20;
      __getNCNotificationStructuredListViewControllerInsetMarginHorizontalSymbolLoc_block_invoke((uint64_t)v19);
      uint64_t v14 = (double (*)(void))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v14) {
      +[SBUILiveActivityMetrics lockScreenNotificationListItemMetricsWithScaleFactor:]();
    }
    double v7 = v10 / v13 + v14() * -2.0;
  }
  uint64_t v15 = [getACUISSizeDimensionRequestClass() fixed:v7];
  v16 = (void *)[objc_alloc((Class)getACUISSizeDimensionRequestClass()) initWithMinimum:64.0 maximum:160.0];
  v17 = (void *)[objc_alloc((Class)getACUISActivityItemMetricsRequestClass()) initWithWidth:v15 height:v16 cornerRadius:0 edgeInsets:23.5 clipMargin:1.0 scaleFactor:a3];

  return v17;
}

+ (void)lockScreenNotificationListItemMetricsWithScaleFactor:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"CGFloat soft_NCNotificationStructuredListViewControllerInsetMarginHorizontal(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBUILiveActivityMetrics.m", 40, @"%s", dlerror());

  __break(1u);
}

@end