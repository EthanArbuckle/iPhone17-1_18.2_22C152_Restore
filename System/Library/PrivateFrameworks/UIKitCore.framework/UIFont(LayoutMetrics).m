@interface UIFont(LayoutMetrics)
+ (id)layoutMetrics;
+ (void)registerLayoutMetrics:()LayoutMetrics;
@end

@implementation UIFont(LayoutMetrics)

+ (id)layoutMetrics
{
  v0 = (void *)__layoutMetrics;
  if (!__layoutMetrics)
  {
    v1 = objc_alloc_init(_UIFontLayoutMetrics);
    v2 = (void *)__layoutMetrics;
    __layoutMetrics = (uint64_t)v1;

    v0 = (void *)__layoutMetrics;
  }
  return v0;
}

+ (void)registerLayoutMetrics:()LayoutMetrics
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = NSStringFromClass(a3);
    [v8 handleFailureInMethod:a2, a1, @"UIFontMetrics.m", 131, @"layoutMetrics of type %@ is not a subclass of _UIFontLayoutMetrics.", v9 object file lineNumber description];
  }
  id v6 = objc_alloc_init(a3);
  v7 = (void *)__layoutMetrics;
  __layoutMetrics = (uint64_t)v6;
}

@end