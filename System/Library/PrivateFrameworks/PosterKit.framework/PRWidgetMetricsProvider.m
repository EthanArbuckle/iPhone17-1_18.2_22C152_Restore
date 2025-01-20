@interface PRWidgetMetricsProvider
+ (id)sharedInstance;
- (CGSize)_sizeForItemWithGridWidth:(int64_t)a3 height:(int64_t)a4;
- (CHSEdgeInsets)_edgeInsets;
- (double)_insetScreenWidth;
- (double)_scaleFactor;
- (id)_complicationCircularMetrics;
- (id)_complicationInlineMetrics;
- (id)_complicationRectangularMetrics;
- (id)_systemSmallMetrics;
- (id)_transparentMediumMetrics;
- (id)lockScreenWidgetMetricsSpecifications;
- (id)systemMetricsForWidget:(id)a3;
- (int64_t)_complicationFontStyle;
@end

@implementation PRWidgetMetricsProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)sharedInstance_widgetMetricsProvider;
  return v2;
}

uint64_t __41__PRWidgetMetricsProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PRWidgetMetricsProvider);
  uint64_t v1 = sharedInstance_widgetMetricsProvider;
  sharedInstance_widgetMetricsProvider = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)lockScreenWidgetMetricsSpecifications
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F58D60]);
  v4 = [(PRWidgetMetricsProvider *)self _complicationCircularMetrics];
  [v3 setMetrics:v4 forFamily:10];

  v5 = [(PRWidgetMetricsProvider *)self _complicationRectangularMetrics];
  [v3 setMetrics:v5 forFamily:11];

  v6 = [(PRWidgetMetricsProvider *)self _complicationInlineMetrics];
  [v3 setMetrics:v6 forFamily:12];

  v7 = [(PRWidgetMetricsProvider *)self _transparentMediumMetrics];
  [v3 setMetrics:v7 forFamily:5];

  v8 = [(PRWidgetMetricsProvider *)self _systemSmallMetrics];
  [v3 setMetrics:v8 forFamily:1];

  return v3;
}

- (id)systemMetricsForWidget:(id)a3
{
  uint64_t v4 = [a3 family];
  if (v4 > 10)
  {
    if (v4 != 11)
    {
      if (v4 == 12)
      {
        v5 = [(PRWidgetMetricsProvider *)self _complicationInlineMetrics];
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    v5 = [(PRWidgetMetricsProvider *)self _complicationRectangularMetrics];
  }
  else
  {
    if (v4 != 1)
    {
      if (v4 == 10)
      {
        v5 = [(PRWidgetMetricsProvider *)self _complicationCircularMetrics];
        goto LABEL_11;
      }
LABEL_8:
      v5 = [(PRWidgetMetricsProvider *)self _transparentMediumMetrics];
      goto LABEL_11;
    }
    v5 = [(PRWidgetMetricsProvider *)self _systemSmallMetrics];
  }
LABEL_11:
  return v5;
}

- (CHSEdgeInsets)_edgeInsets
{
  uint64_t v2 = [MEMORY[0x1E4F5E4A8] complicationEdgeInset];
  v4.n128_u64[0] = v3.n128_u64[0];
  v5.n128_u64[0] = v3.n128_u64[0];
  v6.n128_u64[0] = v3.n128_u64[0];
  MEMORY[0x1F4111770](v2, v3, v4, v5, v6);
  result.var3 = v10;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (double)_scaleFactor
{
  uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double v4 = 1.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    __n128 v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 scale];
    double v7 = v6;
    double v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 nativeScale];
    double v4 = v7 / v9;
  }
  return v4;
}

- (CGSize)_sizeForItemWithGridWidth:(int64_t)a3 height:(int64_t)a4
{
  [MEMORY[0x1E4F5E4A8] complicationEdgeInset];
  double v8 = v7 + v7;
  [MEMORY[0x1E4F5E4A8] interComplicationSpacing];
  double v10 = v9 * (double)(a3 - 1);
  [MEMORY[0x1E4F5E4A8] gridUnitSize];
  double v12 = v8 + v10 + v11 * (double)a3;
  [MEMORY[0x1E4F5E4A8] interComplicationSpacing];
  double v14 = v13 * (double)(a4 - 1);
  [MEMORY[0x1E4F5E4A8] gridUnitSize];
  double v16 = v8 + v14 + v15 * (double)a4;
  [(PRWidgetMetricsProvider *)self _scaleFactor];
  double v18 = 1.0 / v17;
  double v19 = v12 * (1.0 / v17);
  double v20 = v16 * v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)_complicationCircularMetrics
{
  [(PRWidgetMetricsProvider *)self _sizeForItemWithGridWidth:1 height:1];
  double v4 = v3;
  double v6 = v5;
  [(PRWidgetMetricsProvider *)self _scaleFactor];
  double v8 = v4 * 0.5 * (1.0 / v7);
  id v9 = objc_alloc(MEMORY[0x1E4F58E80]);
  [(PRWidgetMetricsProvider *)self _scaleFactor];
  double v11 = v10;
  int64_t v12 = [(PRWidgetMetricsProvider *)self _complicationFontStyle];
  [(PRWidgetMetricsProvider *)self _edgeInsets];
  double v17 = objc_msgSend(v9, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:", v12, 2, v4, v6, v8, v11, v13, v14, v15, v16, *MEMORY[0x1E4F58BC0], *(void *)(MEMORY[0x1E4F58BC0] + 8), *(void *)(MEMORY[0x1E4F58BC0] + 16), *(void *)(MEMORY[0x1E4F58BC0] + 24));
  return v17;
}

- (id)_complicationRectangularMetrics
{
  id v3 = objc_alloc(MEMORY[0x1E4F58E80]);
  [(PRWidgetMetricsProvider *)self _sizeForItemWithGridWidth:2 height:1];
  double v5 = v4;
  double v7 = v6;
  [(PRWidgetMetricsProvider *)self _scaleFactor];
  double v9 = v8;
  int64_t v10 = [(PRWidgetMetricsProvider *)self _complicationFontStyle];
  [(PRWidgetMetricsProvider *)self _edgeInsets];
  uint64_t v15 = objc_msgSend(v3, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:", v10, 2, v5, v7, 0.0, v9, v11, v12, v13, v14, *MEMORY[0x1E4F58BC0], *(void *)(MEMORY[0x1E4F58BC0] + 8), *(void *)(MEMORY[0x1E4F58BC0] + 16), *(void *)(MEMORY[0x1E4F58BC0] + 24));
  return v15;
}

- (id)_complicationInlineMetrics
{
  +[PREditorElementLayoutController frameForElements:4];
  double v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F58E80]), "initWithSize:cornerRadius:", v2, v3, 0.0);
  return v4;
}

- (id)_systemSmallMetrics
{
  id v3 = objc_alloc(MEMORY[0x1E4F58E80]);
  [(PRWidgetMetricsProvider *)self _sizeForItemWithGridWidth:2 height:2];
  double v5 = v4;
  double v7 = v6;
  [(PRWidgetMetricsProvider *)self _scaleFactor];
  double v9 = v8;
  [(PRWidgetMetricsProvider *)self _edgeInsets];
  uint64_t v14 = objc_msgSend(v3, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:", 0, 2, v5, v7, 0.0, v9, v10, v11, v12, v13, *MEMORY[0x1E4F58BC0], *(void *)(MEMORY[0x1E4F58BC0] + 8), *(void *)(MEMORY[0x1E4F58BC0] + 16), *(void *)(MEMORY[0x1E4F58BC0] + 24));
  return v14;
}

- (id)_transparentMediumMetrics
{
  id v3 = objc_alloc(MEMORY[0x1E4F58E80]);
  [(PRWidgetMetricsProvider *)self _insetScreenWidth];
  double v4 = objc_msgSend(v3, "initWithSize:cornerRadius:");
  return v4;
}

- (double)_insetScreenWidth
{
  double v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 _referenceBounds];
  double v4 = v3 + -16.0;

  return v4;
}

- (int64_t)_complicationFontStyle
{
  double v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 7;
  }
  double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 _referenceBounds];
  double v7 = v6;

  if (v7 == 375.0)
  {
    double v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 nativeScale];
    BOOL v10 = v9 == 2.0;
  }
  else
  {
    BOOL v10 = 0;
  }
  int v11 = v7 < 375.0 || v10;
  int64_t v12 = 7;
  if (v7 > 394.0) {
    int64_t v12 = 8;
  }
  if (v11) {
    return 6;
  }
  else {
    return v12;
  }
}

@end