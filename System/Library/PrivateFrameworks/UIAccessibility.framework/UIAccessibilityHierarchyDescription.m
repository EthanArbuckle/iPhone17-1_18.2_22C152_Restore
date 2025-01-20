@interface UIAccessibilityHierarchyDescription
+ (BOOL)supportsSecureCoding;
- (NSArray)leafElements;
- (UIAccessibilityElementDescription)rootElement;
- (UIAccessibilityHierarchyDescription)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLeafElements:(id)a3;
- (void)setRootElement:(id)a3;
@end

@implementation UIAccessibilityHierarchyDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAccessibilityHierarchyDescription)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityHierarchyDescription;
  v5 = [(UIAccessibilityHierarchyDescription *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rootElement"];
    [(UIAccessibilityHierarchyDescription *)v5 setRootElement:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v9 = [v7 setWithArray:v8];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"leafElements"];
    [(UIAccessibilityHierarchyDescription *)v5 setLeafElements:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UIAccessibilityHierarchyDescription *)self rootElement];
  [v4 encodeObject:v5 forKey:@"rootElement"];

  id v6 = [(UIAccessibilityHierarchyDescription *)self leafElements];
  [v4 encodeObject:v6 forKey:@"leafElements"];
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"UIAXHierarchyDesc<%p>\n", self);
  id v4 = [(UIAccessibilityHierarchyDescription *)self rootElement];
  [v3 appendFormat:@"  Root: %@\n", v4];

  [v3 appendFormat:@"  Leaf Elements:\n"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(UIAccessibilityHierarchyDescription *)self leafElements];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v3;
}

- (UIAccessibilityElementDescription)rootElement
{
  return self->_rootElement;
}

- (void)setRootElement:(id)a3
{
}

- (NSArray)leafElements
{
  return self->_leafElements;
}

- (void)setLeafElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafElements, 0);

  objc_storeStrong((id *)&self->_rootElement, 0);
}

@end