@interface _UINavigationControllerDefaultVisualStyleProvider
- (id)styleForNavigationController:(id)a3;
@end

@implementation _UINavigationControllerDefaultVisualStyleProvider

- (id)styleForNavigationController:(id)a3
{
  id v4 = a3;
  if (self)
  {
    if (_MergedGlobals_939 != -1) {
      dispatch_once(&_MergedGlobals_939, &__block_literal_global_22);
    }
    self = (_UINavigationControllerDefaultVisualStyleProvider *)(id)qword_1EB25EF60;
  }
  v5 = NSNumber;
  v6 = [v4 traitCollection];
  v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "userInterfaceIdiom"));
  v8 = (objc_class *)[(_UINavigationControllerDefaultVisualStyleProvider *)self objectForKeyedSubscript:v7];

  if (!v8) {
    v8 = (objc_class *)objc_opt_class();
  }
  v9 = (void *)[[v8 alloc] initWithNavigationController:v4];

  return v9;
}

@end