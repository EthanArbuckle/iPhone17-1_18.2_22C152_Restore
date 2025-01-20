@interface _UITextViewVisualStyle
+ (id)inferredVisualStyle;
- (id)backgroundColor;
@end

@implementation _UITextViewVisualStyle

+ (id)inferredVisualStyle
{
  v2 = objc_alloc_init(_UITextViewVisualStyle_iOS);
  return v2;
}

- (id)backgroundColor
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UITextViewVisualStyle.m", 41, @"%@ should provide an implementation for %@", v6, v7 object file lineNumber description];

  return 0;
}

@end