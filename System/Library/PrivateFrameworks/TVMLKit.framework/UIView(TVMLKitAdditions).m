@interface UIView(TVMLKitAdditions)
+ (uint64_t)tv_performByPreventingAdditiveAnimations:()TVMLKitAdditions;
- (double)tv_alignmentInsetsForExpectedWidth:()TVMLKitAdditions;
- (double)tv_focusMargin;
- (double)tv_interitemSpacing;
- (double)tv_itemHeight;
- (double)tv_itemWidth;
- (double)tv_lineSpacing;
- (double)tv_margin;
- (double)tv_maxHeight;
- (double)tv_maxWidth;
- (double)tv_minHeight;
- (double)tv_minWidth;
- (double)tv_nonDirectionalMargin;
- (double)tv_padding;
- (double)tv_sizeThatFits:()TVMLKitAdditions withSizeCalculation:;
- (id)tv_AccessibilityText;
- (id)tv_layout;
- (id)tv_siriData;
- (id)tv_valueForTVViewTag:()TVMLKitAdditions;
- (id)valueForTVViewStyle:()TVMLKitAdditions;
- (int64_t)tv_alignment;
- (int64_t)tv_position;
- (uint64_t)transferLayoutStylesFromElement:()TVMLKitAdditions;
- (uint64_t)tv_backgroundColor;
- (uint64_t)tv_contentAlignment;
- (uint64_t)tv_elementName;
- (uint64_t)tv_elementType;
- (uint64_t)tv_highlightColor;
- (uint64_t)tv_isAnimationDisabledForProperty:()TVMLKitAdditions;
- (uint64_t)tv_isPrototypeView;
- (uint64_t)tv_marqueeOnHighlight;
- (uint64_t)tv_shouldAnimatePropertyWithKey:()TVMLKitAdditions;
- (uint64_t)tv_shouldReuseCachedSizeThatFits:()TVMLKitAdditions previousTargetSize:newTargetSize:;
- (uint64_t)tv_showOnHighlight;
- (uint64_t)tv_sizeThatFits:()TVMLKitAdditions;
- (void)_transferAttributesFromElement:()TVMLKitAdditions;
- (void)setValue:()TVMLKitAdditions forTVViewStyle:;
- (void)tv_disableAnimation:()TVMLKitAdditions forProperty:;
- (void)tv_setAccessibilityText:()TVMLKitAdditions;
- (void)tv_setLayout:()TVMLKitAdditions;
- (void)tv_setSiriData:()TVMLKitAdditions;
- (void)tv_setValue:()TVMLKitAdditions forTVViewTag:;
@end

@implementation UIView(TVMLKitAdditions)

+ (uint64_t)tv_performByPreventingAdditiveAnimations:()TVMLKitAdditions
{
  return [MEMORY[0x263F1CB60] animateWithDuration:2048 delay:a3 options:0 animations:0.0 completion:0.0];
}

- (void)setValue:()TVMLKitAdditions forTVViewStyle:
{
  id v9 = a3;
  id v6 = a4;
  v7 = objc_msgSend(a1, "tv_layout");
  objc_msgSend(v7, "tv_layoutPropertySetterForStyle:", v6);
  v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  if (v8) {
    ((void (**)(void, id))v8)[2](v8, v9);
  }
}

- (id)valueForTVViewStyle:()TVMLKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "tv_layout");
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v5, "tv_layoutPropertyGetterForStyle:", v4);
    v8 = (void *)v7;
    if (v7)
    {
      id v9 = (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)tv_setValue:()TVMLKitAdditions forTVViewTag:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 layer];
  [v8 setValue:v7 forKey:v6];
}

- (id)tv_valueForTVViewTag:()TVMLKitAdditions
{
  id v4 = a3;
  v5 = [a1 layer];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)tv_disableAnimation:()TVMLKitAdditions forProperty:
{
  id v12 = a4;
  if (tv_disableAnimation_forProperty__onceToken != -1) {
    dispatch_once(&tv_disableAnimation_forProperty__onceToken, &__block_literal_global_116);
  }
  id v6 = objc_getAssociatedObject(a1, "TVMLDisabledAnimations");
  id v7 = (void *)[v6 mutableCopy];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF9C0] set];
  }
  v10 = v9;

  if (a3) {
    [v10 addObject:v12];
  }
  else {
    [v10 removeObject:v12];
  }
  v11 = (void *)[v10 copy];
  objc_setAssociatedObject(a1, "TVMLDisabledAnimations", v11, (void *)0x301);
}

- (uint64_t)tv_isAnimationDisabledForProperty:()TVMLKitAdditions
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, "TVMLDisabledAnimations");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)transferLayoutStylesFromElement:()TVMLKitAdditions
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v10 = v4;
    uint64_t v6 = +[TVViewLayout layoutClassForElement:v4];
    id v7 = objc_msgSend(a1, "tv_layout");
    id v8 = [(objc_class *)v6 layoutWithLayout:v7 element:v10];

    if (v8) {
      objc_msgSend(a1, "tv_setLayout:", v8);
    }
    [a1 _transferAttributesFromElement:v10];

    id v5 = v10;
  }
  return MEMORY[0x270F9A758](v4, v5);
}

- (uint64_t)tv_sizeThatFits:()TVMLKitAdditions
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return objc_msgSend(a1, "tv_textSizeForSize:", a2, a3);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__UIView_TVMLKitAdditions__tv_sizeThatFits___block_invoke;
    v7[3] = &unk_264BA66C0;
    v7[4] = a1;
    return objc_msgSend(a1, "tv_sizeThatFits:withSizeCalculation:", v7, a2, a3);
  }
}

- (double)tv_sizeThatFits:()TVMLKitAdditions withSizeCalculation:
{
  id v7 = a5;
  objc_msgSend(a1, "tv_minWidth");
  double v9 = v8;
  objc_msgSend(a1, "tv_minHeight");
  objc_msgSend(a1, "tv_maxWidth");
  double v11 = v10;
  objc_msgSend(a1, "tv_maxHeight");
  double v13 = v12;
  objc_msgSend(a1, "tv_itemWidth");
  double v15 = v14;
  objc_msgSend(a1, "tv_itemHeight");
  double v17 = v16;
  if (v15 <= 0.0 || v16 <= 0.0)
  {
    double v18 = v15;
    double v19 = v15;
    if (v15 <= 0.0)
    {
      if (a2 > 0.0 && (a2 < v11 || v11 <= 0.0))
      {
        double v15 = a2;
        double v18 = v9;
        double v19 = a2;
      }
      else
      {
        if (v11 <= 0.0) {
          double v15 = a2;
        }
        else {
          double v15 = v11;
        }
        double v18 = v9;
        double v19 = v11;
      }
    }
    if (v16 <= 0.0)
    {
      if (a3 > 0.0 && (a3 < v13 || v13 <= 0.0))
      {
        double v17 = a3;
      }
      else if (v13 > 0.0)
      {
        double v17 = v13;
      }
      else
      {
        double v17 = a3;
      }
    }
    double v20 = v7[2](v7, v15, v17);
    if (v20 <= v19 || v19 <= 0.0) {
      double v22 = v20;
    }
    else {
      double v22 = v19;
    }
    if (v20 >= v18) {
      double v15 = v22;
    }
    else {
      double v15 = v18;
    }
  }

  return v15;
}

- (uint64_t)tv_shouldReuseCachedSizeThatFits:()TVMLKitAdditions previousTargetSize:newTargetSize:
{
  if (a1 == *MEMORY[0x263F001B0] && a2 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    return 1;
  }
  if (a3 == a5 && a4 == a6) {
    return 0;
  }
  if (a5 > a3)
  {
    BOOL v8 = a1 < a3;
    return !v8;
  }
  if (a5 < a3)
  {
    BOOL v8 = a1 < a5;
    return !v8;
  }
  if (a6 == 0.0)
  {
    BOOL v8 = a2 < a4;
    return !v8;
  }
  BOOL v10 = a2 > a6;
  if (a6 >= a4) {
    BOOL v10 = 0;
  }
  if (a6 > a4) {
    BOOL v10 = a2 >= a4;
  }
  if (a4 == 0.0) {
    return a2 > a6;
  }
  else {
    return v10;
  }
}

- (double)tv_alignmentInsetsForExpectedWidth:()TVMLKitAdditions
{
  return *MEMORY[0x263F1D1C0];
}

- (double)tv_margin
{
  v1 = [a1 valueForTVViewStyle:@"margin"];
  if (objc_opt_respondsToSelector())
  {
    [v1 UIEdgeInsetsValue];
    double v3 = v2;
  }
  else
  {
    double v3 = *MEMORY[0x263F1D1C0];
  }

  return v3;
}

- (double)tv_nonDirectionalMargin
{
  objc_msgSend(a1, "tv_margin");
  double v3 = v2;
  [a1 effectiveUserInterfaceLayoutDirection];
  return v3;
}

- (double)tv_focusMargin
{
  v1 = [a1 valueForTVViewStyle:@"tv-focus-margin"];
  if (objc_opt_respondsToSelector())
  {
    [v1 UIEdgeInsetsValue];
    double v3 = v2;
  }
  else
  {
    double v3 = *MEMORY[0x263F1D1C0];
  }

  return v3;
}

- (double)tv_padding
{
  v1 = [a1 valueForTVViewStyle:@"padding"];
  if (objc_opt_respondsToSelector())
  {
    [v1 UIEdgeInsetsValue];
    double v3 = v2;
  }
  else
  {
    double v3 = *MEMORY[0x263F1D1C0];
  }

  return v3;
}

- (int64_t)tv_alignment
{
  double v2 = [a1 valueForTVViewStyle:@"tv-align"];
  int64_t v3 = +[TVMLUtilities semanticAlignmentForAlignment:semanticContentAttribute:](TVMLUtilities, "semanticAlignmentForAlignment:semanticContentAttribute:", [v2 unsignedIntegerValue], objc_msgSend(a1, "semanticContentAttribute"));

  return v3;
}

- (uint64_t)tv_contentAlignment
{
  v1 = [a1 valueForTVViewStyle:@"tv-content-align"];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (int64_t)tv_position
{
  uint64_t v2 = [a1 valueForTVViewStyle:@"tv-position"];
  int64_t v3 = +[TVMLUtilities semanticPositionForPosition:semanticContentAttribute:](TVMLUtilities, "semanticPositionForPosition:semanticContentAttribute:", [v2 unsignedIntegerValue], objc_msgSend(a1, "semanticContentAttribute"));

  return v3;
}

- (double)tv_itemWidth
{
  v1 = [a1 valueForTVViewStyle:@"width"];
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (double)tv_itemHeight
{
  v1 = [a1 valueForTVViewStyle:@"height"];
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (double)tv_maxHeight
{
  v1 = [a1 valueForTVViewStyle:@"max-height"];
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (double)tv_maxWidth
{
  v1 = [a1 valueForTVViewStyle:@"max-width"];
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (double)tv_minHeight
{
  v1 = [a1 valueForTVViewStyle:@"min-height"];
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (double)tv_minWidth
{
  v1 = [a1 valueForTVViewStyle:@"min-width"];
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (double)tv_interitemSpacing
{
  v1 = [a1 valueForTVViewStyle:@"tv-interitem-spacing"];
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (double)tv_lineSpacing
{
  v1 = [a1 valueForTVViewStyle:@"tv-line-spacing"];
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (uint64_t)tv_backgroundColor
{
  return [a1 valueForTVViewStyle:@"background-color"];
}

- (uint64_t)tv_highlightColor
{
  return [a1 valueForTVViewStyle:@"tv-highlight-color"];
}

- (uint64_t)tv_elementType
{
  v1 = objc_msgSend(a1, "tv_valueForTVViewTag:", @"TVMLElementTypeTag");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 unsignedIntegerValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)tv_elementName
{
  return objc_msgSend(a1, "tv_valueForTVViewTag:", @"TVMLElementTypeName");
}

- (uint64_t)tv_isPrototypeView
{
  v1 = objc_msgSend(a1, "tv_valueForTVViewTag:", @"TVMLElementIsPrototypeViewTag");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)tv_showOnHighlight
{
  uint64_t v2 = [a1 valueForTVViewStyle:@"tv-highlight-style"];
  if ([v2 isEqualToString:@"show-on-highlight"])
  {
    uint64_t v3 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [a1 valueForTVViewStyle:@"tv-text-highlight-style"];

      if ([v4 isEqualToString:@"show-on-highlight"]) {
        uint64_t v3 = 1;
      }
      else {
        uint64_t v3 = [v4 isEqualToString:@"marquee-and-show-on-highlight"];
      }
      uint64_t v2 = v4;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return v3;
}

- (uint64_t)tv_marqueeOnHighlight
{
  v1 = [a1 valueForTVViewStyle:@"tv-text-highlight-style"];
  if ([v1 isEqualToString:@"marquee-on-highlight"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"marquee-and-show-on-highlight"];
  }

  return v2;
}

- (id)tv_siriData
{
  return objc_getAssociatedObject(a1, "TVMLSiriDataString");
}

- (void)tv_setSiriData:()TVMLKitAdditions
{
}

- (void)tv_setAccessibilityText:()TVMLKitAdditions
{
}

- (id)tv_AccessibilityText
{
  return objc_getAssociatedObject(a1, "TVMLAccessibilityText");
}

- (void)tv_setLayout:()TVMLKitAdditions
{
}

- (id)tv_layout
{
  return objc_getAssociatedObject(a1, "TVMLViewLayout");
}

- (uint64_t)tv_shouldAnimatePropertyWithKey:()TVMLKitAdditions
{
  id v4 = a3;
  if (objc_msgSend(a1, "tv_isAnimationDisabledForProperty:", v4)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = objc_msgSend(a1, "tv_shouldAnimatePropertyWithKey:", v4);
  }

  return v5;
}

- (void)_transferAttributesFromElement:()TVMLKitAdditions
{
  id v4 = a3;
  objc_msgSend(a1, "setSemanticContentAttribute:", objc_msgSend(v4, "tv_semanticContentAttribute"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "tv_elementType"));
  objc_msgSend(a1, "tv_setValue:forTVViewTag:", v5, @"TVMLElementTypeTag");

  uint64_t v6 = [v4 elementName];
  objc_msgSend(a1, "tv_setValue:forTVViewTag:", v6, @"TVMLElementTypeName");

  id v7 = NSNumber;
  uint64_t v8 = [v4 isPartOfPrototypeElement];

  id v9 = [v7 numberWithBool:v8];
  objc_msgSend(a1, "tv_setValue:forTVViewTag:", v9, @"TVMLElementIsPrototypeViewTag");
}

@end