@interface WFPencilActionConfigurationMetricsProvider
+ (id)sharedProvider;
- ($4BD088D663DD6A85D21B478F22F2D506)metricsWithInterfaceOrientation:(SEL)a3;
- (CGSize)sheetPreferredContentSizeWithMetrics:(id *)a3;
- (NSMutableDictionary)cache;
- (UIEdgeInsets)uiEdgeInsetsFromDirectionalInsets:(NSDirectionalEdgeInsets)a3;
- (WFPencilActionConfigurationMetricsProvider)init;
- (os_unfair_lock_s)cacheLock;
- (void)setCache:(id)a3;
@end

@implementation WFPencilActionConfigurationMetricsProvider

- (void).cxx_destruct
{
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (void)setCache:(id)a3
{
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (UIEdgeInsets)uiEdgeInsetsFromDirectionalInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  double leading = a3.leading;
  CGFloat top = a3.top;
  v7 = [MEMORY[0x263F82B60] mainScreen];
  v8 = [v7 traitCollection];
  uint64_t v9 = [v8 layoutDirection];

  if (v9) {
    double v10 = trailing;
  }
  else {
    double v10 = leading;
  }
  if (v9) {
    double v11 = leading;
  }
  else {
    double v11 = trailing;
  }
  double v12 = top;
  double v13 = bottom;
  result.right = v11;
  result.CGFloat bottom = v13;
  result.left = v10;
  result.CGFloat top = v12;
  return result;
}

- (CGSize)sheetPreferredContentSizeWithMetrics:(id *)a3
{
  -[WFPencilActionConfigurationMetricsProvider uiEdgeInsetsFromDirectionalInsets:](self, "uiEdgeInsetsFromDirectionalInsets:", a3->var3.var2.top, a3->var3.var2.leading, a3->var3.var2.bottom, a3->var3.var2.trailing);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 bounds];
  double v13 = v12 - (v6 + v10);
  double v15 = v14 - (v4 + v8);

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- ($4BD088D663DD6A85D21B478F22F2D506)metricsWithInterfaceOrientation:(SEL)a3
{
  double v7 = [WFPencilActionConfigurationMetricsCacheKey alloc];
  double v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 bounds];
  double v11 = -[WFPencilActionConfigurationMetricsCacheKey initWithInterfaceOrientation:screenSize:](v7, "initWithInterfaceOrientation:screenSize:", a4, v9, v10);

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  double v13 = [(WFPencilActionConfigurationMetricsProvider *)self cache];
  double v14 = [v13 objectForKeyedSubscript:v11];

  if (v14)
  {
    double v15 = v14;
    os_unfair_lock_unlock(&self->_cacheLock);
  }
  else
  {
    double v16 = [MEMORY[0x263F82B60] mainScreen];
    [v16 bounds];
    _CF = (unint64_t)(a4 - 1) >= 2;
    BOOL v19 = (unint64_t)(a4 - 1) < 2;
    if (_CF) {
      double v20 = 20.0;
    }
    else {
      double v20 = 0.0;
    }
    double v21 = 40.0;
    if (!_CF) {
      double v21 = 0.0;
    }
    double v22 = v21 + 716.0 + 240.0;
    double v23 = v17 - v22;
    if (vabdd_f64(v17, v22) >= 60.0)
    {
      long long v40 = xmmword_217869810;
      double v24 = 208.0;
    }
    else
    {
      double v24 = v23 / 3.0 + 208.0;
      __asm { FMOV            V3.2D, #30.0 }
      *(double *)&_Q3 = v24;
      long long v40 = _Q3;
      double v23 = v17 - (v21 + v24 * 3.0 + 60.0 + 32.0 + 240.0);
    }
    if (v23 >= 0.0)
    {
      uint64_t v29 = 3;
    }
    else
    {
      double v23 = v17 - (v21 + v24 * 2.0 + 30.0 + 32.0 + 240.0);
      uint64_t v29 = 2;
    }
    if (v23 >= 144.0)
    {
      double v23 = v17 - (v21 + (double)(v29 - 1) * 30.0 + (double)v29 * v24 + 176.0 + 240.0);
      long long v30 = xmmword_217869840;
      long long v31 = xmmword_217869850;
      double v32 = 88.0;
    }
    else
    {
      long long v30 = xmmword_217869820;
      long long v31 = xmmword_217869830;
      double v32 = 16.0;
    }
    if (v23 >= v24 + 30.0)
    {
      double v33 = (double)v29++;
      double v23 = v17 - (v21 + v33 * 30.0 + (double)v29 * v24 + v32 + v32 + 240.0);
    }
    if (v23 >= 40.0)
    {
      double v23 = v17 - (v21 + (double)(v29 - 1) * 30.0 + (double)v29 * v24 + v32 + v32 + 280.0);
      long long v34 = xmmword_217869870;
    }
    else
    {
      long long v34 = xmmword_217869860;
    }
    long long v39 = v34;
    if (v23 <= 0.0)
    {
      long long v37 = v30;
    }
    else
    {
      *((double *)&v30 + 1) = v23 * 0.5 + v32;
      long long v37 = v30;
      *((double *)&v31 + 1) = *((double *)&v30 + 1);
    }
    long long v38 = v31;

    BOOL v41 = v19;
    long long v42 = v39;
    uint64_t v43 = v29;
    long long v44 = v40;
    long long v45 = v37;
    long long v46 = v38;
    long long v47 = xmmword_217869880;
    uint64_t v48 = 0x405C400000000000;
    double v49 = v20;
    uint64_t v50 = 0;
    double v51 = v20;
    long long v52 = xmmword_217869890;
    long long v53 = xmmword_2178698A0;
    long long v54 = xmmword_2178698B0;
    double v15 = [[WFPencilActionConfigurationMetricsCacheValue alloc] initWithValue:&v41];
    v35 = [(WFPencilActionConfigurationMetricsProvider *)self cache];
    [v35 setObject:v15 forKeyedSubscript:v11];

    os_unfair_lock_unlock(p_cacheLock);
    if (!v15)
    {
      *(_OWORD *)&retstr->var4.var2.CGFloat top = 0u;
      *(_OWORD *)&retstr->var4.var2.CGFloat bottom = 0u;
      *(_OWORD *)&retstr->var3.var2.CGFloat bottom = 0u;
      *(_OWORD *)&retstr->var4.var0 = 0u;
      *(_OWORD *)&retstr->var3.var0 = 0u;
      *(_OWORD *)&retstr->var3.var2.CGFloat top = 0u;
      *(_OWORD *)&retstr->var2.var3.CGFloat top = 0u;
      *(_OWORD *)&retstr->var2.var3.CGFloat bottom = 0u;
      *(_OWORD *)&retstr->var1.var1 = 0u;
      *(_OWORD *)&retstr->var2.var1 = 0u;
      *(_OWORD *)&retstr->var0 = 0u;
      goto LABEL_27;
    }
  }
  [(WFPencilActionConfigurationMetricsCacheValue *)v15 value];
LABEL_27:

  return result;
}

- (WFPencilActionConfigurationMetricsProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFPencilActionConfigurationMetricsProvider;
  v2 = [(WFPencilActionConfigurationMetricsProvider *)&v7 init];
  if (v2)
  {
    double v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cache = v2->_cache;
    v2->_cache = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    double v5 = v2;
  }

  return v2;
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_2973);
  }
  v2 = (void *)sharedProvider_sharedProvider;
  return v2;
}

uint64_t __60__WFPencilActionConfigurationMetricsProvider_sharedProvider__block_invoke()
{
  sharedProvider_sharedProvider = objc_alloc_init(WFPencilActionConfigurationMetricsProvider);
  return MEMORY[0x270F9A758]();
}

@end