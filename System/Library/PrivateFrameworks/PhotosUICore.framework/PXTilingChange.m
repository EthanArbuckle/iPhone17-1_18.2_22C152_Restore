@interface PXTilingChange
- (BOOL)coordinateSpaceDidChange;
- (BOOL)isIdentity;
- (CGSize)initialReferenceSize;
- (CGSize)toReferenceSize;
- (NSArray)compositionInvalidationContexts;
- (NSArray)events;
- (NSArray)invalidationContexts;
- (PXTilingChange)init;
- (PXTilingLayout)initialLayout;
- (PXTilingLayout)toLayout;
- (UIEdgeInsets)initialContentInset;
- (UIEdgeInsets)toContentInset;
- (id)defaultAnimationOptionsForTilingController:(id)a3;
- (id)description;
- (void)addEvent:(id)a3;
- (void)recordCompositionInvalidationContexts:(id)a3;
- (void)recordContentInset:(UIEdgeInsets)a3;
- (void)recordLayout:(id)a3;
- (void)recordReferenceSize:(CGSize)a3;
@end

@implementation PXTilingChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionInvalidationContexts, 0);
  objc_storeStrong((id *)&self->_initialLayout, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

- (NSArray)compositionInvalidationContexts
{
  return self->_compositionInvalidationContexts;
}

- (UIEdgeInsets)initialContentInset
{
  double top = self->_initialContentInset.top;
  double left = self->_initialContentInset.left;
  double bottom = self->_initialContentInset.bottom;
  double right = self->_initialContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)initialReferenceSize
{
  double width = self->_initialReferenceSize.width;
  double height = self->_initialReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXTilingLayout)initialLayout
{
  return self->_initialLayout;
}

- (NSArray)invalidationContexts
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(PXTilingChange *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 type] == 5)
        {
          v10 = [v9 context];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)defaultAnimationOptionsForTilingController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXTilingChange *)self compositionInvalidationContexts];
  uint64_t v6 = +[PXTilingControllerCompositionInvalidationContext defaultAnimationOptionsForTilingController:v4 withInvalidationContexts:v5];

  return v6;
}

- (BOOL)coordinateSpaceDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(PXTilingChange *)self events];
  v3 = [v2 reverseObjectEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) type] == 4)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (UIEdgeInsets)toContentInset
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(PXTilingChange *)self initialContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v11 = [(PXTilingChange *)self events];
  long long v12 = [v11 reverseObjectEnumerator];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v17 type] == 3)
        {
          [v17 contentInset];
          double v4 = v18;
          double v6 = v19;
          double v8 = v20;
          double v10 = v21;
          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  double v22 = v4;
  double v23 = v6;
  double v24 = v8;
  double v25 = v10;
  result.double right = v25;
  result.double bottom = v24;
  result.double left = v23;
  result.double top = v22;
  return result;
}

- (CGSize)toReferenceSize
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(PXTilingChange *)self initialReferenceSize];
  double v4 = v3;
  double v6 = v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v7 = [(PXTilingChange *)self events];
  double v8 = [v7 reverseObjectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 type] == 2)
        {
          [v13 referenceSize];
          double v4 = v14;
          double v6 = v15;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  double v16 = v4;
  double v17 = v6;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (PXTilingLayout)toLayout
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = [(PXTilingChange *)self initialLayout];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v4 = [(PXTilingChange *)self events];
  double v5 = [v4 reverseObjectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 type] == 1)
        {
          uint64_t v11 = [v10 layout];

          double v3 = (void *)v11;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (PXTilingLayout *)v3;
}

- (id)description
{
  double v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  initialLayout = self->_initialLayout;
  uint64_t v6 = NSStringFromCGSize(self->_initialReferenceSize);
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p, initialLayout=%@, initialReferenceSize=%@, events=%@", v4, self, initialLayout, v6, self->_events];

  if (self->_compositionInvalidationContexts) {
    [v7 appendFormat:@", compositionInvalidationContexts=%@", self->_compositionInvalidationContexts];
  }
  [v7 appendString:@">"];
  return v7;
}

- (NSArray)events
{
  v2 = (void *)[(NSMutableArray *)self->_events copy];
  return (NSArray *)v2;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSMutableArray *)events addObject:v4];
}

- (void)recordCompositionInvalidationContexts:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    if (self->_compositionInvalidationContexts)
    {
      if (objc_msgSend(v6, "isEqualToArray:")) {
        goto LABEL_7;
      }
      id v4 = [(NSArray *)self->_compositionInvalidationContexts arrayByAddingObjectsFromArray:self->_compositionInvalidationContexts];
    }
    else
    {
      id v4 = (NSArray *)[v6 copy];
    }
    compositionInvalidationContexts = self->_compositionInvalidationContexts;
    self->_compositionInvalidationContexts = v4;
  }
LABEL_7:
}

- (void)recordContentInset:(UIEdgeInsets)a3
{
}

- (void)recordReferenceSize:(CGSize)a3
{
}

- (void)recordLayout:(id)a3
{
  id v5 = a3;
  initialLayout = self->_initialLayout;
  p_initialLayout = &self->_initialLayout;
  if (!initialLayout)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_initialLayout, a3);
    id v5 = v8;
  }
}

- (BOOL)isIdentity
{
  v2 = [(PXTilingChange *)self events];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (PXTilingChange)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXTilingChange;
  CGSize result = [(PXTilingChange *)&v5 init];
  if (result)
  {
    long long v3 = *(_OWORD *)off_1E5DAAF00;
    long long v4 = *((_OWORD *)off_1E5DAAF00 + 1);
    result->_initialReferenceSize = *(CGSize *)off_1E5DAB030;
    *(_OWORD *)&result->_initialContentInset.double top = v3;
    *(_OWORD *)&result->_initialContentInset.double bottom = v4;
  }
  return result;
}

@end