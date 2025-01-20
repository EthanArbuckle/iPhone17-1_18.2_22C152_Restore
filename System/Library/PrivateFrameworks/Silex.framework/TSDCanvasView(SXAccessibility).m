@interface TSDCanvasView(SXAccessibility)
- (id)_speakThisElements;
- (id)sxaxNextSpeakThisElementFromElement:()SXAccessibility;
- (uint64_t)_isInPreviewPlatter;
- (uint64_t)accessibilityElementsHidden;
@end

@implementation TSDCanvasView(SXAccessibility)

- (id)sxaxNextSpeakThisElementFromElement:()SXAccessibility
{
  id v4 = a3;
  v5 = [a1 _speakThisElements];
  unint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 >= [v5 count] - 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 objectAtIndexedSubscript:v6 + 1];
  }

  return v7;
}

- (uint64_t)accessibilityElementsHidden
{
  v3.receiver = a1;
  v3.super_class = (Class)TSDCanvasView_0;
  if (objc_msgSendSuper2(&v3, sel_accessibilityElementsHidden)) {
    return 1;
  }
  else {
    return [a1 _isInPreviewPlatter];
  }
}

- (id)_speakThisElements
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  objc_super v3 = [a1 controller];
  id v4 = [v3 canvas];
  v5 = [v4 topLevelReps];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v11 _accessibilityIsSpeakThisElement]) {
          [v2 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  v12 = [MEMORY[0x263F81198] defaultSpeakScreenOptions];
  v13 = [a1 _accessibilityLeafDescendantsWithOptions:v12];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        if (objc_msgSend(v19, "_accessibilityIsSpeakThisElement", (void)v22)
          && ([v2 containsObject:v19] & 1) == 0)
        {
          [v2 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  [v2 sortUsingComparator:&__block_literal_global_46];
  v20 = (void *)[v2 copy];

  return v20;
}

- (uint64_t)_isInPreviewPlatter
{
  Class v2 = NSClassFromString(&cfstr_Uiplattertrans.isa);
  if (!v2)
  {
    Class v2 = NSClassFromString(&cfstr_Uiplatterview.isa);
    if (!v2) {
      return 0;
    }
  }
  objc_super v3 = [a1 window];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__TSDCanvasView_SXAccessibility___isInPreviewPlatter__block_invoke;
  v8[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v8[4] = v2;
  id v4 = [v3 _accessibilityFindSubviewDescendant:v8];

  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 valueForKey:@"sourceView"];
    if (v5) {
      uint64_t v6 = [a1 isDescendantOfView:v5];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end