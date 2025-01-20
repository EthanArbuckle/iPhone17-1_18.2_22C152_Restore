@interface WFGlyphPickerCollectionView
- (id)_accessibilityViewChildrenWithOptions:(id)a3;
@end

@implementation WFGlyphPickerCollectionView

- (id)_accessibilityViewChildrenWithOptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)WFGlyphPickerCollectionView;
  v4 = [(WFGlyphPickerCollectionView *)&v18 _accessibilityViewChildrenWithOptions:a3];
  v5 = (void *)[v4 mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = [(WFGlyphPickerCollectionView *)self visibleCells];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v12 containsObject:v11] & 1) == 0) {
          [v5 removeObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

@end