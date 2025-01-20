@interface TSDSwatchGridViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxIsReadyToLoadChildren;
- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm;
- (void)setSelectedItem:(id)a3;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
@end

@implementation TSDSwatchGridViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDSwatchGridView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  return [(TSDSwatchGridViewAccessibility *)self tsaxValueForKey:@"window"] != 0;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  id v31 = [(TSDSwatchGridViewAccessibility *)self tsaxValueForKey:@"mItems"];
  id v4 = [v31 count];
  id v5 = [(TSDSwatchGridViewAccessibility *)self tsaxUnsignedIntegerValueForKey:@"mRowCount"];
  id v6 = [(TSDSwatchGridViewAccessibility *)self tsaxUnsignedIntegerValueForKey:@"mItemsPerRow"];
  unsigned int v7 = [(TSDSwatchGridViewAccessibility *)self tsaxUnsignedIntValueForKey:@"mSwatchSize"];
  if (v6)
  {
    unsigned int v8 = v7;
    v9 = 0;
    UIAccessibilityTraits v28 = UIAccessibilityTraitSelected | UIAccessibilityTraitButton;
    UIAccessibilityTraits v29 = UIAccessibilityTraitButton;
    do
    {
      if (v5)
      {
        for (unint64_t i = 0; (id)i != v5; ++i)
        {
          if (v8 == 3)
          {
            unint64_t v11 = [[self tsaxValueForKey:@"swatchGridViewDelegate"] tsaxUnsignedIntegerValueForKey:@"itemCountPerSwatch"];
            unint64_t v12 = i % v11 + (void)&v9[i / v11 * (void)v6] * v11;
          }
          else
          {
            unint64_t v12 = (unint64_t)&v9[i * (void)v6];
          }
          if (v12 >= (unint64_t)v4) {
            break;
          }
          id v13 = [v31 objectAtIndex:];
          id v14 = [v13 accessibilityLabel];
          if ([v14 length])
          {
            v15 = [(TSAccessibilityElement *)[TSDSwatchAccessibilityElement alloc] initWithAccessibilityParent:self];
            [(TSDSwatchAccessibilityElement *)v15 setAccessibilityTraits:v29];
            if ([(TSDSwatchGridViewAccessibility *)self tsaxValueForKey:@"selectedItem"] == v13) {
              [(TSDSwatchAccessibilityElement *)v15 setAccessibilityTraits:v28];
            }
            [(TSDSwatchAccessibilityElement *)v15 setSwatchElement:v13];
            [(TSDSwatchGridViewAccessibility *)self bounds];
            double v17 = v16;
            double v19 = v18;
            double v21 = v20;
            double v23 = v22;
            if (objc_opt_respondsToSelector())
            {
              [(TSDSwatchGridViewAccessibility *)self p_swatchRectForSwatchAtRow:i column:v9];
              double v17 = v24;
              double v19 = v25;
              double v21 = v26;
              double v23 = v27;
            }
            -[TSDSwatchGridViewAccessibility tsaxFrameFromBounds:](self, "tsaxFrameFromBounds:", v17, v19, v21, v23);
            -[TSDSwatchAccessibilityElement setAccessibilityFrame:](v15, "setAccessibilityFrame:");
            [(TSDSwatchAccessibilityElement *)v15 setAccessibilityLabel:v14];
            [a3 addObject:v15];
          }
        }
      }
      ++v9;
    }
    while (v9 != v6);
  }
}

- (void)setSelectedItem:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)TSDSwatchGridViewAccessibility;
  -[TSDSwatchGridViewAccessibility setSelectedItem:](&v18, "setSelectedItem:");
  id v5 = [(TSDSwatchGridViewAccessibility *)self tsaxChildren];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    UIAccessibilityTraits v9 = UIAccessibilityTraitButton;
    UIAccessibilityTraits v10 = UIAccessibilityTraitSelected;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 swatchElement] == a3) {
          UIAccessibilityTraits v13 = v10;
        }
        else {
          UIAccessibilityTraits v13 = 0;
        }
        [v12 setAccessibilityTraits:v9 | v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
}

@end