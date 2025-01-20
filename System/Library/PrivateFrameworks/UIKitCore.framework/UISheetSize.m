@interface UISheetSize
@end

@implementation UISheetSize

void ___UISheetSize_block_invoke()
{
  v0 = [_UISheetLayoutInfo alloc];
  v1 = _UIFallbackSheetMetrics();
  uint64_t v2 = [(_UISheetLayoutInfo *)v0 initWithMetrics:v1];
  v3 = (void *)qword_1EB25FFA0;
  qword_1EB25FFA0 = v2;

  v4 = objc_alloc_init(UIViewController);
  [(id)qword_1EB25FFA0 _setPresentedViewController:v4];
}

@end