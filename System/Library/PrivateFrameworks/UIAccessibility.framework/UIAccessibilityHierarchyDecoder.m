@interface UIAccessibilityHierarchyDecoder
- (NSData)hierarchyData;
- (UIAccessibilityHierarchyDecoder)initWithHierarchyData:(id)a3;
- (id)decodeHierarchyWithContainer:(id)a3 error:(id *)a4;
- (void)setHierarchyData:(id)a3;
@end

@implementation UIAccessibilityHierarchyDecoder

- (UIAccessibilityHierarchyDecoder)initWithHierarchyData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIAccessibilityHierarchyDecoder;
  v5 = [(UIAccessibilityHierarchyDecoder *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UIAccessibilityHierarchyDecoder *)v5 setHierarchyData:v4];
  }

  return v6;
}

- (id)decodeHierarchyWithContainer:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  v9 = [(UIAccessibilityHierarchyDecoder *)self hierarchyData];
  id v28 = 0;
  v10 = [v7 unarchivedObjectOfClass:v8 fromData:v9 error:&v28];
  id v11 = v28;

  v12 = 0;
  v13 = 0;
  if (!v11)
  {
    v14 = [v10 rootElement];
    id v23 = v6;
    v13 = [v14 convertToAccessibilityElementWithContainer:v6];

    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v15 = [v10 leafElements];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v24 + 1) + 8 * v19) convertToAccessibilityElementWithContainer:v13];
          [v12 addObject:v20];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v17);
    }

    [v12 sortUsingSelector:sel_accessibilityCompareGeometry_];
    [v13 setAccessibilityElements:v12];
    id v6 = v23;
  }
  if (*a4) {
    *a4 = v11;
  }
  id v21 = v13;

  return v21;
}

- (NSData)hierarchyData
{
  return self->_hierarchyData;
}

- (void)setHierarchyData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end