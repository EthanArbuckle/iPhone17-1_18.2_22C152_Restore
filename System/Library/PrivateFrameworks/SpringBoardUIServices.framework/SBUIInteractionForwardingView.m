@interface SBUIInteractionForwardingView
- (NSSet)ignoreAlphaSubviews;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)addIgnoreAlphaSubview:(id)a3;
- (void)removeIgnoreAlphaSubview:(id)a3;
- (void)setIgnoreAlphaSubviews:(id)a3;
@end

@implementation SBUIInteractionForwardingView

- (NSSet)ignoreAlphaSubviews
{
  ignoreAlphaSubviewsTable = self->_ignoreAlphaSubviewsTable;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  if (ignoreAlphaSubviewsTable)
  {
    v4 = [(NSHashTable *)ignoreAlphaSubviewsTable allObjects];
    v5 = [v3 setWithArray:v4];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v5;
}

- (void)setIgnoreAlphaSubviews:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NSHashTable addObject:](v5, "addObject:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  ignoreAlphaSubviewsTable = self->_ignoreAlphaSubviewsTable;
  self->_ignoreAlphaSubviewsTable = v5;
}

- (void)addIgnoreAlphaSubview:(id)a3
{
  id v4 = a3;
  ignoreAlphaSubviewsTable = self->_ignoreAlphaSubviewsTable;
  id v8 = v4;
  if (!ignoreAlphaSubviewsTable)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_ignoreAlphaSubviewsTable;
    self->_ignoreAlphaSubviewsTable = v6;

    id v4 = v8;
    ignoreAlphaSubviewsTable = self->_ignoreAlphaSubviewsTable;
  }
  [(NSHashTable *)ignoreAlphaSubviewsTable addObject:v4];
}

- (void)removeIgnoreAlphaSubview:(id)a3
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v18.receiver = self;
  v18.super_class = (Class)SBUIInteractionForwardingView;
  -[SBUIInteractionForwardingView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (SBUIInteractionForwardingView *)v20[5];
  if (v8) {
    BOOL v9 = v8 == self;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    uint64_t v10 = [(SBUIInteractionForwardingView *)self subviews];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__SBUIInteractionForwardingView_hitTest_withEvent___block_invoke;
    v13[3] = &unk_1E5CCEDC0;
    v13[4] = self;
    double v16 = x;
    double v17 = y;
    id v14 = v7;
    long long v15 = &v19;
    [v10 enumerateObjectsWithOptions:2 usingBlock:v13];

    id v8 = (SBUIInteractionForwardingView *)v20[5];
  }
  v11 = v8;
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __51__SBUIInteractionForwardingView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "member:");
  if (v7)
  {
    id v8 = (void *)v7;
    if ([v11 isHidden])
    {
    }
    else
    {
      [v11 alpha];
      double v10 = v9;

      if (v10 >= 0.01) {
        goto LABEL_7;
      }
    }
    objc_msgSend(v11, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
    if (objc_msgSend(v11, "pointInside:withEvent:", *(void *)(a1 + 40)))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
LABEL_7:
}

- (void).cxx_destruct
{
}

@end