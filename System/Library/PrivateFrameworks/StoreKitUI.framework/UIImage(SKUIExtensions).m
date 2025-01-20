@interface UIImage(SKUIExtensions)
+ (id)resizeImage:()SKUIExtensions toSize:;
+ (id)singlePointImageWithColor:()SKUIExtensions;
@end

@implementation UIImage(SKUIExtensions)

+ (id)singlePointImageWithColor:()SKUIExtensions
{
  id v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[UIImage(SKUIExtensions) singlePointImageWithColor:]();
  }
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  CGFloat v6 = v5;
  v13.width = 1.0;
  v13.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v6);

  CurrentContext = UIGraphicsGetCurrentContext();
  id v8 = v3;
  v9 = (CGColor *)[v8 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v9);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 1.0;
  v14.size.height = 1.0;
  CGContextFillRect(CurrentContext, v14);
  v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

+ (id)resizeImage:()SKUIExtensions toSize:
{
  id v7 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[UIImage(SKUIExtensions) resizeImage:toSize:]();
  }
  v11.width = a1;
  v11.height = a2;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  objc_msgSend(v7, "drawInRect:", 0.0, 0.0, a1, a2);

  id v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v8;
}

+ (void)singlePointImageWithColor:()SKUIExtensions .cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[UIImage(SKUIExtensions) singlePointImageWithColor:]";
}

+ (void)resizeImage:()SKUIExtensions toSize:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[UIImage(SKUIExtensions) resizeImage:toSize:]";
}

@end