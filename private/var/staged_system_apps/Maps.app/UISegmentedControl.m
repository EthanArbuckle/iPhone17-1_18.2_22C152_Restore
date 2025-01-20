@interface UISegmentedControl
- (BOOL)_maps_testFitSegmentTitlesToWidth:(double)a3;
- (void)_maps_setItems:(id)a3;
@end

@implementation UISegmentedControl

- (void)_maps_setItems:(id)a3
{
  id v4 = a3;
  [(UISegmentedControl *)self removeAllSegments];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(UISegmentedControl *)self insertSegmentWithTitle:v10 atIndex:[(UISegmentedControl *)self numberOfSegments] animated:0];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(UISegmentedControl *)self insertSegmentWithImage:v10 atIndex:[(UISegmentedControl *)self numberOfSegments] animated:0];
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)_maps_testFitSegmentTitlesToWidth:(double)a3
{
  [(UISegmentedControl *)self intrinsicContentSize];
  return v4 <= a3;
}

@end