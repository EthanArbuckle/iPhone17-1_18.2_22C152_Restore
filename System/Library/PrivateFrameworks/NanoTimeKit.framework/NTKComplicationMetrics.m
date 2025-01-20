@interface NTKComplicationMetrics
+ (BOOL)supportsSecureCoding;
+ (id)defaultMetricsForFamily:(int64_t)a3 device:(id)a4;
+ (id)metricsWithSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 cornerRadius:(double)a5 opaque:(BOOL)a6;
+ (id)metricsWithSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 cornerRadius:(double)a5 opaque:(BOOL)a6 scaleFactor:(double)a7 widgetGroupMetrics:(id)a8;
+ (id)metricsWithSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 cornerRadius:(double)a5 opaque:(BOOL)a6 widgetGroupMetrics:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)opaque;
- (CGSize)size;
- (NTKComplicationMetrics)initWithCoder:(id)a3;
- (NTKComplicationWidgetGroupMetrics)widgetGroupMetrics;
- (UIEdgeInsets)safeAreaInsets;
- (double)cornerRadius;
- (double)scaleFactor;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKComplicationMetrics

+ (id)metricsWithSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 cornerRadius:(double)a5 opaque:(BOOL)a6
{
  return (id)objc_msgSend(a1, "metricsWithSize:safeAreaInsets:cornerRadius:opaque:widgetGroupMetrics:", a6, 0, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5);
}

+ (id)metricsWithSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 cornerRadius:(double)a5 opaque:(BOOL)a6 widgetGroupMetrics:(id)a7
{
  return (id)objc_msgSend(a1, "metricsWithSize:safeAreaInsets:cornerRadius:opaque:scaleFactor:widgetGroupMetrics:", a6, a7, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5, 1.0);
}

+ (id)metricsWithSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 cornerRadius:(double)a5 opaque:(BOOL)a6 scaleFactor:(double)a7 widgetGroupMetrics:(id)a8
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v19 = a8;
  v20 = (id *)objc_alloc_init((Class)a1);
  v21 = v20;
  if (v20)
  {
    *((CGFloat *)v20 + 5) = width;
    *((CGFloat *)v20 + 6) = height;
    *((CGFloat *)v20 + 7) = top;
    *((CGFloat *)v20 + 8) = left;
    *((CGFloat *)v20 + 9) = bottom;
    *((CGFloat *)v20 + 10) = right;
    *((unsigned char *)v20 + 8) = a6;
    *((double *)v20 + 2) = a5;
    *((double *)v20 + 3) = a7;
    objc_storeStrong(v20 + 4, a8);
  }

  return v21;
}

+ (id)defaultMetricsForFamily:(int64_t)a3 device:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  long long v7 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  *(_OWORD *)(v6 + 56) = *MEMORY[0x1E4FB2848];
  *(_OWORD *)(v6 + 72) = v7;
  *(unsigned char *)(v6 + 8) = 0;
  *(_OWORD *)(v6 + 16) = xmmword_1BC8A01F0;
  v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = 0;

  switch(a3)
  {
    case 8:
      CDCircularSmallComplicationDiameter();
    case 9:
    case 10:
      CDCircularMediumComplicationDiameter();
    case 11:
      CDGraphicLargeRectangularComplicationInset();
    case 12:
      CDCircularMediumComplicationDiameter();
    default:
      *(_OWORD *)(v6 + 40) = *MEMORY[0x1E4F1DB30];

      return (id)v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __34__NTKComplicationMetrics_isEqual___block_invoke;
  v33[3] = &unk_1E62C1030;
  id v6 = v4;
  id v34 = v6;
  id v7 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v33, self->_size.width, self->_size.height);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_2;
  v31[3] = &unk_1E62C1058;
  v31[4] = self;
  id v8 = v6;
  id v32 = v8;
  id v9 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v31, 0);
  double cornerRadius = self->_cornerRadius;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_3;
  v29[3] = &unk_1E62C1080;
  id v11 = v8;
  id v30 = v11;
  id v12 = (id)[v5 appendCGFloat:v29 counterpart:cornerRadius];
  BOOL opaque = self->_opaque;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_4;
  v27[3] = &unk_1E62C10A8;
  id v14 = v11;
  id v28 = v14;
  id v15 = (id)[v5 appendBool:opaque counterpart:v27];
  double scaleFactor = self->_scaleFactor;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_5;
  v25[3] = &unk_1E62C1080;
  id v17 = v14;
  id v26 = v17;
  id v18 = (id)[v5 appendCGFloat:v25 counterpart:scaleFactor];
  widgetGroupMetrics = self->_widgetGroupMetrics;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_6;
  v23[3] = &unk_1E62C10D0;
  id v24 = v17;
  id v20 = v17;
  id v21 = (id)[v5 appendObject:widgetGroupMetrics counterpart:v23];
  LOBYTE(widgetGroupMetrics) = [v5 isEqual];

  return (char)widgetGroupMetrics;
}

double __34__NTKComplicationMetrics_isEqual___block_invoke(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 40);
}

uint64_t __34__NTKComplicationMetrics_isEqual___block_invoke_2(uint64_t a1)
{
  return vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(*(void *)(a1 + 32) + 56), *(float64x2_t *)(*(void *)(a1 + 40) + 56)), (int32x4_t)vceqq_f64(*(float64x2_t *)(*(void *)(a1 + 32) + 72), *(float64x2_t *)(*(void *)(a1 + 40) + 72)))), 0xFuLL))) & 1;
}

double __34__NTKComplicationMetrics_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 16);
}

uint64_t __34__NTKComplicationMetrics_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

double __34__NTKComplicationMetrics_isEqual___block_invoke_5(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 24);
}

id __34__NTKComplicationMetrics_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendCGSize:", self->_size.width, self->_size.height);
  id v5 = (id)[v3 appendCGFloat:self->_safeAreaInsets.top];
  id v6 = (id)[v3 appendCGFloat:self->_safeAreaInsets.left];
  id v7 = (id)[v3 appendCGFloat:self->_safeAreaInsets.right];
  id v8 = (id)[v3 appendCGFloat:self->_safeAreaInsets.bottom];
  id v9 = (id)[v3 appendCGFloat:self->_cornerRadius];
  id v10 = (id)[v3 appendBool:self->_opaque];
  id v11 = (id)[v3 appendCGFloat:self->_scaleFactor];
  id v12 = (id)[v3 appendObject:self->_widgetGroupMetrics];
  unint64_t v13 = [v3 hash];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeCGSizeForKey:@"size"];
  double v6 = v5;
  double v8 = v7;
  [v4 decodeDoubleForKey:@"cornerRadius"];
  double v10 = v9;
  [v4 decodeUIEdgeInsetsForKey:@"safeAreaInsets"];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [v4 decodeBoolForKey:@"opaque"];
  id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetGroupMetrics"];

  +[NTKComplicationMetrics metricsWithSize:safeAreaInsets:cornerRadius:opaque:widgetGroupMetrics:](NTKComplicationMetrics, "metricsWithSize:safeAreaInsets:cornerRadius:opaque:widgetGroupMetrics:", v19, v20, v6, v8, v12, v14, v16, v18, v10);
  id v21 = (NTKComplicationMetrics *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  double width = self->_size.width;
  double height = self->_size.height;
  id v6 = a3;
  objc_msgSend(v6, "encodeCGSize:forKey:", @"size", width, height);
  [v6 encodeDouble:@"cornerRadius" forKey:self->_cornerRadius];
  objc_msgSend(v6, "encodeUIEdgeInsets:forKey:", @"safeAreaInsets", self->_safeAreaInsets.top, self->_safeAreaInsets.left, self->_safeAreaInsets.bottom, self->_safeAreaInsets.right);
  [v6 encodeBool:self->_opaque forKey:@"opaque"];
  [v6 encodeObject:self->_widgetGroupMetrics forKey:@"widgetGroupMetrics"];
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
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

- (BOOL)opaque
{
  return self->_opaque;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (NTKComplicationWidgetGroupMetrics)widgetGroupMetrics
{
  return self->_widgetGroupMetrics;
}

- (void).cxx_destruct
{
}

@end