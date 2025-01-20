@interface SKUICGRectHelpers
+ (CGRect)rect:(CGRect)a3 withFlippedOriginXRelativeTo:(CGRect)a4;
@end

@implementation SKUICGRectHelpers

+ (CGRect)rect:(CGRect)a3 withFlippedOriginXRelativeTo:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat rect = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:]();
  }
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, -1.0, 1.0);
  memset(&v15, 0, sizeof(v15));
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v18);
  CGAffineTransform v14 = v16;
  CGAffineTransformTranslate(&v15, &v14, -(MinX + MaxX), 0.0);
  CGAffineTransform v14 = v15;
  v19.origin.CGFloat x = v10;
  v19.origin.CGFloat y = v9;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = rect;
  return CGRectApplyAffineTransform(v19, &v14);
}

+ (void)rect:withFlippedOriginXRelativeTo:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:]";
}

@end