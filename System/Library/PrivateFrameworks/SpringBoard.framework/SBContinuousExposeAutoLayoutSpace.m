@interface SBContinuousExposeAutoLayoutSpace
- (BOOL)containsDisplayItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStripVisible;
- (CGRect)boundingBox;
- (CGRect)compactedBoundingBox;
- (CGRect)stageArea;
- (NSArray)items;
- (SBContinuousExposeAutoLayoutConfiguration)configuration;
- (SBContinuousExposeAutoLayoutSpace)initWithItems:(id)a3;
- (id)_copyWithClass:(Class)a3;
- (id)autoLayoutItemForDisplayItem:(id)a3;
- (id)autoLayoutItemForDisplayItemIfExists:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setBoundingBox:(CGRect)a3;
- (void)setCompactedBoundingBox:(CGRect)a3;
- (void)setConfiguration:(id)a3;
- (void)setItems:(id)a3;
- (void)setStageArea:(CGRect)a3;
- (void)setStripVisible:(BOOL)a3;
@end

@implementation SBContinuousExposeAutoLayoutSpace

- (SBContinuousExposeAutoLayoutSpace)initWithItems:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeAutoLayoutSpace;
  v6 = [(SBContinuousExposeAutoLayoutSpace *)&v11 init];
  if (v6)
  {
    if (!v5)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, v6, @"SBContinuousExposeAutoLayoutSpace.m", 32, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];
    }
    uint64_t v7 = [v5 copy];
    items = v6->_items;
    v6->_items = (NSArray *)v7;
  }
  return v6;
}

- (id)autoLayoutItemForDisplayItemIfExists:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self->_items;
    id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "displayItem", (void)v13);
          int v11 = [v10 isEqual:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)autoLayoutItemForDisplayItem:(id)a3
{
  id v5 = a3;
  id v6 = [(SBContinuousExposeAutoLayoutSpace *)self autoLayoutItemForDisplayItemIfExists:v5];
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBContinuousExposeAutoLayoutSpace.m", 55, @"Expected to get an auto layout item for displayItem: '%@' in auto layout space: '%@'", v5, self object file lineNumber description];
  }
  return v6;
}

- (BOOL)containsDisplayItem:(id)a3
{
  v3 = [(SBContinuousExposeAutoLayoutSpace *)self autoLayoutItemForDisplayItemIfExists:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBContinuousExposeAutoLayoutSpace *)self _copyWithClass:v4];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBContinuousExposeAutoLayoutSpace *)self _copyWithClass:v4];
}

- (id)_copyWithClass:(Class)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = self->_items;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "mutableCopy", (void)v17);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [[a3 alloc] initWithItems:v5];
  objc_storeStrong((id *)(v12 + 24), self->_configuration);
  CGSize size = self->_boundingBox.size;
  *(CGPoint *)(v12 + 32) = self->_boundingBox.origin;
  *(CGSize *)(v12 + 48) = size;
  CGSize v14 = self->_stageArea.size;
  *(CGPoint *)(v12 + 64) = self->_stageArea.origin;
  *(CGSize *)(v12 + 80) = v14;
  CGSize v15 = self->_compactedBoundingBox.size;
  *(CGPoint *)(v12 + 96) = self->_compactedBoundingBox.origin;
  *(CGSize *)(v12 + 112) = v15;
  *(unsigned char *)(v12 + 8) = self->_stripVisible;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SBContinuousExposeAutoLayoutSpace *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeAutoLayoutSpace;
    if ([(SBContinuousExposeAutoLayoutSpace *)&v12 isEqual:v4])
    {
      uint64_t v5 = objc_opt_class();
      id v6 = v4;
      if (v5)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v7 = v6;
        }
        else {
          uint64_t v7 = 0;
        }
      }
      else
      {
        uint64_t v7 = 0;
      }
      uint64_t v9 = v7;

      if (v9)
      {
        uint64_t v10 = [(CGRect *)v9 items];
        BOOL v8 = BSEqualArrays()
          && CGRectEqualToRect(self->_boundingBox, v9[1])
          && CGRectEqualToRect(self->_stageArea, v9[2])
          && CGRectEqualToRect(self->_compactedBoundingBox, v9[3])
          && self->_stripVisible == LOBYTE(v9->origin.y);
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  id v4 = (id)[v3 appendObject:self->_items];
  id v5 = (id)objc_msgSend(v3, "appendCGRect:", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  id v6 = (id)objc_msgSend(v3, "appendCGRect:", self->_stageArea.origin.x, self->_stageArea.origin.y, self->_stageArea.size.width, self->_stageArea.size.height);
  id v7 = (id)objc_msgSend(v3, "appendCGRect:", self->_compactedBoundingBox.origin.x, self->_compactedBoundingBox.origin.y, self->_compactedBoundingBox.size.width, self->_compactedBoundingBox.size.height);
  id v8 = (id)[v3 appendBool:self->_stripVisible];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (id)description
{
  return [(SBContinuousExposeAutoLayoutSpace *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)succinctDescription
{
  v2 = [(SBContinuousExposeAutoLayoutSpace *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBContinuousExposeAutoLayoutSpace *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBContinuousExposeAutoLayoutSpace *)self succinctDescriptionBuilder];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"stageArea", self->_stageArea.origin.x, self->_stageArea.origin.y, self->_stageArea.size.width, self->_stageArea.size.height);
  id v6 = (id)objc_msgSend(v4, "appendRect:withName:", @"boundingBox", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  [v4 appendArraySection:self->_items withName:@"items" skipIfEmpty:0];
  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (SBContinuousExposeAutoLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

- (CGRect)stageArea
{
  double x = self->_stageArea.origin.x;
  double y = self->_stageArea.origin.y;
  double width = self->_stageArea.size.width;
  double height = self->_stageArea.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStageArea:(CGRect)a3
{
  self->_stageArea = a3;
}

- (CGRect)compactedBoundingBox
{
  double x = self->_compactedBoundingBox.origin.x;
  double y = self->_compactedBoundingBox.origin.y;
  double width = self->_compactedBoundingBox.size.width;
  double height = self->_compactedBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCompactedBoundingBox:(CGRect)a3
{
  self->_compactedBoundingBodouble x = a3;
}

- (BOOL)isStripVisible
{
  return self->_stripVisible;
}

- (void)setStripVisible:(BOOL)a3
{
  self->_stripVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end