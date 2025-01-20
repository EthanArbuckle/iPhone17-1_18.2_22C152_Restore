@interface NTKComplicationWidgetGroupMetrics
+ (BOOL)supportsSecureCoding;
+ (NTKComplicationWidgetGroupMetrics)metricsWithSafeAreaInsets:(UIEdgeInsets)a3 nestedContentMetrics:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NTKComplicationMetrics)nestedContentMetrics;
- (NTKComplicationWidgetGroupMetrics)initWithCoder:(id)a3;
- (UIEdgeInsets)safeAreaInsets;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKComplicationWidgetGroupMetrics

+ (NTKComplicationWidgetGroupMetrics)metricsWithSafeAreaInsets:(UIEdgeInsets)a3 nestedContentMetrics:(id)a4
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  id v10 = a4;
  v11 = (id *)objc_alloc_init((Class)a1);
  v12 = v11;
  if (v11)
  {
    *((CGFloat *)v11 + 2) = top;
    *((CGFloat *)v11 + 3) = left;
    *((CGFloat *)v11 + 4) = bottom;
    *((CGFloat *)v11 + 5) = right;
    objc_storeStrong(v11 + 1, a4);
  }

  return (NTKComplicationWidgetGroupMetrics *)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__NTKComplicationWidgetGroupMetrics_isEqual___block_invoke;
  v14[3] = &unk_1E62C1058;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v14, 0);
  nestedContentMetrics = self->_nestedContentMetrics;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__NTKComplicationWidgetGroupMetrics_isEqual___block_invoke_2;
  v12[3] = &unk_1E62C6628;
  id v13 = v6;
  id v9 = v6;
  id v10 = (id)[v5 appendObject:nestedContentMetrics counterpart:v12];
  LOBYTE(nestedContentMetrics) = [v5 isEqual];

  return (char)nestedContentMetrics;
}

uint64_t __45__NTKComplicationWidgetGroupMetrics_isEqual___block_invoke(uint64_t a1)
{
  return vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(*(void *)(a1 + 32) + 16), *(float64x2_t *)(*(void *)(a1 + 40) + 16)), (int32x4_t)vceqq_f64(*(float64x2_t *)(*(void *)(a1 + 32) + 32), *(float64x2_t *)(*(void *)(a1 + 40) + 32)))), 0xFuLL))) & 1;
}

id __45__NTKComplicationWidgetGroupMetrics_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendCGFloat:self->_safeAreaInsets.top];
  id v5 = (id)[v3 appendCGFloat:self->_safeAreaInsets.left];
  id v6 = (id)[v3 appendCGFloat:self->_safeAreaInsets.right];
  id v7 = (id)[v3 appendCGFloat:self->_safeAreaInsets.bottom];
  id v8 = (id)[v3 appendObject:self->_nestedContentMetrics];
  unint64_t v9 = [v3 hash];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationWidgetGroupMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeUIEdgeInsetsForKey:@"safeAreaInsets"];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nestedContentMetrics"];

  +[NTKComplicationWidgetGroupMetrics metricsWithSafeAreaInsets:nestedContentMetrics:](NTKComplicationWidgetGroupMetrics, "metricsWithSafeAreaInsets:nestedContentMetrics:", v13, v6, v8, v10, v12);
  v14 = (NTKComplicationWidgetGroupMetrics *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  id v8 = a3;
  objc_msgSend(v8, "encodeUIEdgeInsets:forKey:", @"safeAreaInsets", top, left, bottom, right);
  [v8 encodeObject:self->_nestedContentMetrics forKey:@"nestedContentMetrics"];
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NTKComplicationMetrics)nestedContentMetrics
{
  return self->_nestedContentMetrics;
}

- (void).cxx_destruct
{
}

@end