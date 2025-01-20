@interface SUUIIndexBarControl
- (BOOL)_reloadLineSpacing;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_visibleBounds;
- (CGSize)_sizeForEntries:(id)a3;
- (CGSize)_sizeForEntryAtIndexPath:(id)a3;
- (CGSize)_totalSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDictionary)defaultTextAttributes;
- (SUUIIndexBarControl)initWithCoder:(id)a3;
- (SUUIIndexBarControl)initWithFrame:(CGRect)a3;
- (SUUIIndexBarControlDataSource)dataSource;
- (SUUIIndexBarControlDelegate)delegate;
- (UIEdgeInsets)contentEdgeInsets;
- (UIEdgeInsets)hitTestEdgeInsets;
- (id)_allEntries;
- (id)_allRequiredEntries;
- (id)_combinedEntry;
- (id)_displayEntries;
- (id)_displayEntriesThatFitInViewForGroupedEntries;
- (id)_entryAtIndexPath:(id)a3;
- (int64_t)_numberOfEntriesInSection:(int64_t)a3;
- (int64_t)_numberOfSections;
- (int64_t)_totalEntryCount;
- (void)_configureNewEntry:(id)a3;
- (void)_enumerateEntryIndexPathsUsingBlock:(id)a3;
- (void)_invalidateDisplayEntries;
- (void)_invalidateForChangedLayoutProperties;
- (void)_sendSelectionForTouch:(id)a3 withEvent:(id)a4;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)reloadCombinedEntry;
- (void)reloadData;
- (void)reloadEntryAtIndexPath:(id)a3;
- (void)reloadSections:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultTextAttributes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SUUIIndexBarControl

- (SUUIIndexBarControl)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIIndexBarControl;
  v3 = [(SUUIIndexBarControl *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    _SUUIIndexBarControlInitialization(v3);
  }
  return v4;
}

- (SUUIIndexBarControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIIndexBarControl;
  v3 = -[SUUIIndexBarControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    _SUUIIndexBarControlInitialization(v3);
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v4 = [(SUUIIndexBarControl *)self _displayEntries];
  [(SUUIIndexBarControl *)self _visibleBounds];
  CGFloat width = v35.size.width;
  CGFloat height = v35.size.height;
  CGFloat y = v35.origin.y;
  CGFloat x = v35.origin.x;
  double MinY = CGRectGetMinY(v35);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v13 size];
        double v15 = v14;
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        CGRectGetMinX(v36);
        v16 = [(SUUIIndexBarControl *)self traitCollection];
        [v16 displayScale];
        uint64_t v26 = v17;
        UIRectCenteredXInRectScale();
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;

        objc_msgSend(v13, "_drawInRect:", v19, v21, v23, v25, v26);
        double MinY = MinY + v15 + self->_lineSpacing;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SUUIIndexBarControl *)self bounds];
  double top = self->_hitTestEdgeInsets.top;
  double left = self->_hitTestEdgeInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_hitTestEdgeInsets.right);
  double v16 = v15 - (top + self->_hitTestEdgeInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;
  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUUIIndexBarControl *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)SUUIIndexBarControl;
  -[SUUIIndexBarControl setBounds:](&v15, sel_setBounds_, x, y, width, height);
  [(SUUIIndexBarControl *)self bounds];
  if (v9 != v13 || v11 != v12) {
    [(SUUIIndexBarControl *)self _invalidateForChangedLayoutProperties];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SUUIIndexBarControl *)self frame];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)SUUIIndexBarControl;
  -[SUUIIndexBarControl setFrame:](&v15, sel_setFrame_, x, y, width, height);
  [(SUUIIndexBarControl *)self frame];
  if (v9 != v13 || v11 != v12) {
    [(SUUIIndexBarControl *)self _invalidateForChangedLayoutProperties];
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  memset(&v9, 0, sizeof(v9));
  [(SUUIIndexBarControl *)self transform];
  v8.receiver = self;
  v8.super_class = (Class)SUUIIndexBarControl;
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
  [(SUUIIndexBarControl *)&v8 setTransform:&t1];
  [(SUUIIndexBarControl *)self transform];
  CGAffineTransform t1 = v9;
  if (!CGAffineTransformEqualToTransform(&t1, &v6)) {
    [(SUUIIndexBarControl *)self _invalidateForChangedLayoutProperties];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SUUIIndexBarControl *)self _totalSize];
  if (width < v5) {
    double v5 = width;
  }
  double v7 = round(v5);
  if (height < v6) {
    double v6 = height;
  }
  double v8 = round(v6);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)tintColorDidChange
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)SUUIIndexBarControl;
  [(SUUIIndexBarControl *)&v13 tintColorDidChange];
  v3 = [(SUUIIndexBarControl *)self tintColor];
  if ([(NSMapTable *)self->_indexPathToEntryMapTable count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = [(NSMapTable *)self->_indexPathToEntryMapTable objectEnumerator];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setTintColor:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v6);
    }
  }
  [(SUUIIndexBarControl *)self setNeedsDisplay];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIIndexBarControl;
  id v4 = a3;
  [(SUUIIndexBarControl *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(SUUIIndexBarControl *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (vabdd_f64(v7, v9) > 0.00000011920929) {
    [(SUUIIndexBarControl *)self setNeedsDisplay];
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarControl;
  id v6 = a4;
  id v7 = a3;
  [(SUUIIndexBarControl *)&v9 beginTrackingWithTouch:v7 withEvent:v6];
  -[SUUIIndexBarControl _sendSelectionForTouch:withEvent:](self, "_sendSelectionForTouch:withEvent:", v7, v6, v9.receiver, v9.super_class);

  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarControl;
  id v6 = a4;
  id v7 = a3;
  [(SUUIIndexBarControl *)&v9 continueTrackingWithTouch:v7 withEvent:v6];
  -[SUUIIndexBarControl _sendSelectionForTouch:withEvent:](self, "_sendSelectionForTouch:withEvent:", v7, v6, v9.receiver, v9.super_class);

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIIndexBarControl;
  id v6 = a4;
  id v7 = a3;
  [(SUUIIndexBarControl *)&v9 endTrackingWithTouch:v7 withEvent:v6];
  -[SUUIIndexBarControl _sendSelectionForTouch:withEvent:](self, "_sendSelectionForTouch:withEvent:", v7, v6, v9.receiver, v9.super_class);

  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = 0;

  self->_didSendPastBottom = 0;
  self->_didSendPastTop = 0;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIIndexBarControl;
  [(SUUIIndexBarControl *)&v5 cancelTrackingWithEvent:a3];
  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = 0;

  self->_didSendPastBottom = 0;
  self->_didSendPastTop = 0;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    self->_hasValidTotalSize = 0;
    [(SUUIIndexBarControl *)self _invalidateDisplayEntries];
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_dataSource, obj);
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

    id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    if (objc_opt_respondsToSelector()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xFD | v7;

    [(SUUIIndexBarControl *)self reloadData];
  }
}

- (void)setDefaultTextAttributes:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = (NSDictionary *)a3;
  defaultTextAttributes = self->_defaultTextAttributes;
  if (defaultTextAttributes != v5
    && ![(NSDictionary *)defaultTextAttributes isEqualToDictionary:v5])
  {
    objc_storeStrong((id *)&self->_defaultTextAttributes, a3);
    if ([(NSMapTable *)self->_indexPathToEntryMapTable count])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      char v7 = [(NSMapTable *)self->_indexPathToEntryMapTable objectEnumerator];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        char v10 = 0;
        uint64_t v11 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v7);
            }
            objc_super v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v13 setDefaultTextAttributes:self->_defaultTextAttributes];
              char v10 = 1;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);

        if (v10) {
          [(SUUIIndexBarControl *)self setNeedsDisplay];
        }
      }
      else
      {
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xFB | v6;

    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xF7 | v8;

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v10 = 16;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xEF | v10;
  }
}

- (void)reloadCombinedEntry
{
  combinedEntrdouble y = self->_combinedEntry;
  self->_combinedEntrdouble y = 0;

  if (self->_hasValidCombinedEntry)
  {
    self->_hasValidCombinedEntrdouble y = 0;
    [(SUUIIndexBarControl *)self _invalidateDisplayEntries];
  }
}

- (void)reloadData
{
  combinedEntrdouble y = self->_combinedEntry;
  self->_combinedEntrdouble y = 0;

  self->_hasValidCombinedEntrdouble y = 0;
  self->_hasValidNumberOfSections = 0;
  self->_hasValidTotalSize = 0;
  indexPathToEntryMapTable = self->_indexPathToEntryMapTable;
  self->_indexPathToEntryMapTable = 0;

  sectionIndexToNumberOfEntriesMapTable = self->_sectionIndexToNumberOfEntriesMapTable;
  self->_sectionIndexToNumberOfEntriesMapTable = 0;

  self->_hasValidTotalEntryCount = 0;
  self->_totalEntryCount = 0;
  [(SUUIIndexBarControl *)self _invalidateDisplayEntries];
}

- (void)reloadEntryAtIndexPath:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    sectionIndexToNumberOfEntriesMapTable = self->_sectionIndexToNumberOfEntriesMapTable;
    self->_sectionIndexToNumberOfEntriesMapTable = 0;

    id v5 = [(NSMapTable *)self->_sectionIndexToNumberOfEntriesMapTable objectForKey:v6];

    if (v5)
    {
      [(NSMapTable *)self->_sectionIndexToNumberOfEntriesMapTable removeObjectForKey:v6];
      self->_hasValidTotalSize = 0;
      [(SUUIIndexBarControl *)self _invalidateDisplayEntries];
    }
  }
}

- (void)reloadSections:(id)a3
{
  id v4 = a3;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SUUIIndexBarControl_reloadSections___block_invoke;
  v5[3] = &unk_2654014F0;
  v5[4] = self;
  v5[5] = &v6;
  [v4 enumerateIndexesUsingBlock:v5];
  if (*((unsigned char *)v7 + 24))
  {
    self->_hasValidTotalEntryCount = 0;
    self->_totalEntryCount = 0;
    self->_hasValidTotalSize = 0;
    [(SUUIIndexBarControl *)self _invalidateDisplayEntries];
  }
  _Block_object_dispose(&v6, 8);
}

void __38__SUUIIndexBarControl_reloadSections___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 488);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v10 section] == a2) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 488), "removeObjectForKey:", v16, (void)v21);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }

  if (![*(id *)(*(void *)(a1 + 32) + 488) count])
  {
    uint64_t v17 = *(void *)(a1 + 32);
    CGFloat v18 = *(void **)(v17 + 488);
    *(void *)(v17 + 488) = 0;
  }
  if (*(void *)(*(void *)(a1 + 32) + 520))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    NSMapRemove(*(NSMapTable **)(*(void *)(a1 + 32) + 520), (const void *)(a2 + 1));
    if (![*(id *)(*(void *)(a1 + 32) + 520) count])
    {
      uint64_t v19 = *(void *)(a1 + 32);
      double v20 = *(void **)(v19 + 520);
      *(void *)(v19 + 520) = 0;
    }
  }
}

- (id)_allEntries
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__104;
  char v9 = __Block_byref_object_dispose__104;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__SUUIIndexBarControl__allEntries__block_invoke;
  v4[3] = &unk_2654093F0;
  v4[4] = self;
  v4[5] = &v5;
  [(SUUIIndexBarControl *)self _enumerateEntryIndexPathsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__SUUIIndexBarControl__allEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v8;
  }
  uint64_t v7 = [*(id *)(a1 + 32) _entryAtIndexPath:v3];
  if (v7) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

- (id)_allRequiredEntries
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__104;
  char v9 = __Block_byref_object_dispose__104;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__SUUIIndexBarControl__allRequiredEntries__block_invoke;
  v4[3] = &unk_2654093F0;
  v4[4] = self;
  v4[5] = &v5;
  [(SUUIIndexBarControl *)self _enumerateEntryIndexPathsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__SUUIIndexBarControl__allRequiredEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v9;
  }
  uint64_t v7 = [*(id *)(a1 + 32) _entryAtIndexPath:v3];
  id v8 = v7;
  if (v7 && [v7 visibilityPriority] == 1000) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
  }
}

- (void)_enumerateEntryIndexPathsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, unsigned char *))a3;
  if (v4)
  {
    uint64_t v5 = [(SUUIIndexBarControl *)self _numberOfSections];
    unsigned __int8 v13 = 0;
    if (v5 >= 1)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = [(SUUIIndexBarControl *)self _numberOfEntriesInSection:v7];
        int v9 = v13;
        if (v8 >= 1 && !v13)
        {
          uint64_t v10 = v8;
          uint64_t v11 = 1;
          do
          {
            uint64_t v12 = [MEMORY[0x263F088C8] indexPathForItem:v11 - 1 inSection:v7];
            v4[2](v4, v12, &v13);

            int v9 = v13;
            if (v11 >= v10) {
              break;
            }
            ++v11;
          }
          while (!v13);
        }
        ++v7;
      }
      while (v7 < v6 && !v9);
    }
  }
}

- (int64_t)_numberOfEntriesInSection:(int64_t)a3
{
  uint64_t v5 = (const void *)(a3 + 1);
  sectionIndexToNumberOfEntriesMapTable = self->_sectionIndexToNumberOfEntriesMapTable;
  if (!sectionIndexToNumberOfEntriesMapTable
    || (uint64_t v7 = NSMapGet(sectionIndexToNumberOfEntriesMapTable, (const void *)(a3 + 1))) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v9 = [WeakRetained indexBarControl:self numberOfEntriesInSection:a3];

    if (!self->_sectionIndexToNumberOfEntriesMapTable)
    {
      uint64_t v10 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x263F08968]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, -[SUUIIndexBarControl _numberOfSections](self, "_numberOfSections"));
      uint64_t v11 = self->_sectionIndexToNumberOfEntriesMapTable;
      self->_sectionIndexToNumberOfEntriesMapTable = v10;
    }
    uint64_t v7 = [NSNumber numberWithInteger:v9];
    NSMapInsert(self->_sectionIndexToNumberOfEntriesMapTable, v5, v7);
  }
  int64_t v12 = [v7 integerValue];

  return v12;
}

- (id)_combinedEntry
{
  if (!self->_hasValidCombinedEntry)
  {
    if (*(unsigned char *)&self->_dataSourceDelegateFlags)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      uint64_t v5 = [WeakRetained combinedEntryForIndexBarControl:self];
      combinedEntrdouble y = self->_combinedEntry;
      self->_combinedEntrdouble y = v5;
    }
    else
    {
      id v3 = +[SUUIIndexBarEntry systemCombinedEntry];
      id WeakRetained = self->_combinedEntry;
      self->_combinedEntrdouble y = v3;
    }

    if (self->_combinedEntry) {
      -[SUUIIndexBarControl _configureNewEntry:](self, "_configureNewEntry:");
    }
    self->_hasValidCombinedEntrdouble y = 1;
  }
  uint64_t v7 = self->_combinedEntry;
  return v7;
}

- (void)_configureNewEntry:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SUUIIndexBarControl *)self tintColor];
  [v6 setTintColor:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SUUIIndexBarControl *)self defaultTextAttributes];
    [v6 setDefaultTextAttributes:v5];
  }
}

- (id)_displayEntries
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  displayEntries = self->_displayEntries;
  if (self->_hasValidDisplayEntries)
  {
    id v3 = displayEntries;
  }
  else
  {
    location = (id *)&self->_displayEntries;
    self->_displayEntries = 0;

    self->_hasValidDisplayEntries = 1;
    [(SUUIIndexBarControl *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double top = self->_contentEdgeInsets.top;
    double left = self->_contentEdgeInsets.left;
    double bottom = self->_contentEdgeInsets.bottom;
    double right = self->_contentEdgeInsets.right;
    v50 = self;
    v45 = [(SUUIIndexBarControl *)self _allEntries];
    uint64_t v17 = v45;
    if ([v45 count])
    {
      double v18 = v6 + left;
      double v19 = v8 + top;
      double v20 = v10 - (left + right);
      double v21 = v12 - (top + bottom);
      [(SUUIIndexBarControl *)v50 _sizeForEntries:v45];
      double v23 = v22;
      v67.origin.double x = v18;
      v67.origin.double y = v19;
      v67.size.double width = v20;
      v67.size.double height = v21;
      if (v23 <= CGRectGetHeight(v67))
      {
        objc_storeStrong(location, v45);
      }
      else
      {
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x2020000000;
        uint64_t v63 = 0;
        id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
        v59[0] = 0;
        v59[1] = v59;
        v59[2] = 0x2020000000;
        v59[3] = 0;
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __38__SUUIIndexBarControl__displayEntries__block_invoke;
        v55[3] = &unk_265409418;
        v57 = &v60;
        v58 = v59;
        id v44 = v24;
        id v56 = v44;
        [v45 enumerateObjectsUsingBlock:v55];
        long long v25 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
        if (v61[3])
        {
          unint64_t v26 = 1;
          uint64_t v46 = 2;
          do
          {
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            id obj = v44;
            uint64_t v27 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
            if (v27)
            {
              uint64_t v48 = *(void *)v52;
              do
              {
                uint64_t v49 = v27;
                for (uint64_t i = 0; i != v49; ++i)
                {
                  if (*(void *)v52 != v48) {
                    objc_enumerationMutation(obj);
                  }
                  long long v29 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                  long long v30 = objc_msgSend(v29, "firstObject", location);
                  if ([v30 visibilityPriority] == 1000)
                  {
                    [v25 addObjectsFromArray:v29];
                  }
                  else
                  {
                    unint64_t v31 = [v29 count];
                    if (v26 >= v31) {
                      goto LABEL_20;
                    }
                    char v32 = 0;
                    uint64_t v33 = v46;
                    do
                    {
                      uint64_t v34 = [(SUUIIndexBarControl *)v50 _combinedEntry];
                      if (v34) {
                        [v25 addObject:v34];
                      }
                      CGRect v35 = [v29 objectAtIndex:v33 - 1];
                      [v25 addObject:v35];

                      v32 |= v31 == v33;
                      v33 += v26;
                    }
                    while (v33 - 1 < v31);
                    if ((v32 & 1) == 0)
                    {
LABEL_20:
                      CGRect v36 = [(SUUIIndexBarControl *)v50 _combinedEntry];
                      if (v36) {
                        [v25 addObject:v36];
                      }
                    }
                  }
                }
                uint64_t v27 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
              }
              while (v27);
            }

            [(SUUIIndexBarControl *)v50 _sizeForEntries:v25];
            double v38 = v37;
            v68.origin.double x = v18;
            v68.origin.double y = v19;
            v68.size.double width = v20;
            v68.size.double height = v21;
            if (v38 <= CGRectGetHeight(v68)) {
              break;
            }
            [v25 removeAllObjects];
            ++v46;
          }
          while (v26++ < v61[3]);
        }
        if (objc_msgSend(v25, "count", location))
        {
          id v40 = v25;
        }
        else
        {
          id v40 = [(SUUIIndexBarControl *)v50 _displayEntriesThatFitInViewForGroupedEntries];
        }
        id v41 = *location;
        id *location = v40;

        _Block_object_dispose(v59, 8);
        _Block_object_dispose(&v60, 8);
      }
      uint64_t v17 = v45;
    }
    id v3 = (NSArray *)*location;
  }
  return v3;
}

void __38__SUUIIndexBarControl__displayEntries__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [v8 visibilityPriority];
  uint64_t v6 = v5;
  if (v5)
  {
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (v5 == *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    double v7 = [*(id *)(a1 + 32) lastObject];
    [v7 addObject:v8];
    goto LABEL_8;
  }
LABEL_7:
  double v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  [v7 addObject:v8];
  [*(id *)(a1 + 32) addObject:v7];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
LABEL_8:
}

- (id)_displayEntriesThatFitInViewForGroupedEntries
{
  id v3 = [(SUUIIndexBarControl *)self _allRequiredEntries];
  uint64_t v4 = [v3 count];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(SUUIIndexBarControl *)self bounds];
  if (v4 >= 2)
  {
    double top = self->_contentEdgeInsets.top;
    double left = self->_contentEdgeInsets.left;
    double v12 = v9 - (top + self->_contentEdgeInsets.bottom);
    double v13 = v8 - (left + self->_contentEdgeInsets.right);
    double v14 = v7 + top;
    double v15 = v6 + left;
    uint64_t v16 = 1;
    uint64_t v17 = 2;
    do
    {
      uint64_t v18 = 0;
      uint64_t v19 = v4 + ~v16++;
      do
      {
        double v20 = [v3 objectAtIndex:v18];
        [v5 addObject:v20];

        double v21 = [(SUUIIndexBarControl *)self _combinedEntry];
        if (v21 && v18 < v19) {
          [v5 addObject:v21];
        }

        v18 += v17;
      }
      while (v18 < v4);
      [(SUUIIndexBarControl *)self _sizeForEntries:v5];
      double v23 = v22;
      v27.origin.double x = v15;
      v27.origin.double y = v14;
      v27.size.double width = v13;
      v27.size.double height = v12;
      if (v23 <= CGRectGetHeight(v27)) {
        break;
      }
      [v5 removeAllObjects];
      ++v17;
    }
    while (v16 != v4);
  }
  if ([v5 count]) {
    id v24 = v5;
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;

  return v25;
}

- (id)_entryAtIndexPath:(id)a3
{
  id v5 = a3;
  double v6 = [(NSMapTable *)self->_indexPathToEntryMapTable objectForKey:v5];
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    double v6 = [WeakRetained indexBarControl:self entryAtIndexPath:v5];

    if (!v6)
    {
      double v12 = [MEMORY[0x263F08690] currentHandler];
      id v13 = objc_loadWeakRetained((id *)&self->_dataSource);
      [v12 handleFailureInMethod:a2, self, @"SUUIIndexBarControl.m", 490, @"Data source (%@) must return a non-nil entry at index path %@", v13, v5 object file lineNumber description];
    }
    [(SUUIIndexBarControl *)self _configureNewEntry:v6];
    indexPathToEntryMapTable = self->_indexPathToEntryMapTable;
    if (!indexPathToEntryMapTable)
    {
      double v9 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:1];
      double v10 = self->_indexPathToEntryMapTable;
      self->_indexPathToEntryMapTable = v9;

      indexPathToEntryMapTable = self->_indexPathToEntryMapTable;
    }
    [(NSMapTable *)indexPathToEntryMapTable setObject:v6 forKey:v5];
  }

  return v6;
}

- (void)_invalidateDisplayEntries
{
  self->_hasValidDisplayEntries = 0;
  displayEntries = self->_displayEntries;
  self->_displayEntries = 0;

  [(SUUIIndexBarControl *)self setNeedsDisplay];
}

- (void)_invalidateForChangedLayoutProperties
{
  [(SUUIIndexBarControl *)self _invalidateDisplayEntries];
  [(SUUIIndexBarControl *)self _reloadLineSpacing];
}

- (int64_t)_numberOfSections
{
  if (!self->_hasValidNumberOfSections)
  {
    if ((*(unsigned char *)&self->_dataSourceDelegateFlags & 2) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      self->_numberOfSections = [WeakRetained numberOfSectionsInIndexBarControl:self];
    }
    else
    {
      self->_numberOfSections = 1;
    }
    self->_hasValidNumberOfSections = 1;
  }
  return self->_numberOfSections;
}

- (BOOL)_reloadLineSpacing
{
  [(SUUIIndexBarControl *)self bounds];
  CGFloat Height = CGRectGetHeight(v7);
  double v4 = 4.0;
  if (Height + -768.0 < -0.00000011920929) {
    double v4 = 1.0;
  }
  double v5 = vabdd_f64(self->_lineSpacing, v4);
  if (v5 > 0.00000011920929)
  {
    self->_lineSpacing = v4;
    self->_hasValidTotalSize = 0;
  }
  return v5 > 0.00000011920929;
}

- (void)_sendSelectionForTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 locationInView:self];
  double v9 = v8;
  [(SUUIIndexBarControl *)self _visibleBounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  int64_t v18 = [(SUUIIndexBarControl *)self _totalEntryCount];
  v41.origin.double x = v11;
  v41.origin.double y = v13;
  v41.size.double width = v15;
  v41.size.double height = v17;
  if (v9 < CGRectGetMinY(v41))
  {
    if (!self->_didSendPastTop)
    {
      self->_didSendPastTop = 1;
      if ((*(unsigned char *)&self->_dataSourceDelegateFlags & 0x10) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained indexBarControlDidSelectBeyondTop:self];
      }
    }
    uint64_t v20 = 464;
LABEL_11:
    *((unsigned char *)&self->super.super.super.super.isa + v20) = 0;
    lastSelectedIndexPath = self->_lastSelectedIndexPath;
    self->_lastSelectedIndexPath = 0;

    goto LABEL_24;
  }
  v42.origin.double x = v11;
  v42.origin.double y = v13;
  v42.size.double width = v15;
  v42.size.double height = v17;
  if (v9 > CGRectGetMaxY(v42))
  {
    if (!self->_didSendPastBottom)
    {
      self->_didSendPastBottom = 1;
      if ((*(unsigned char *)&self->_dataSourceDelegateFlags & 8) != 0)
      {
        id v21 = objc_loadWeakRetained((id *)&self->_delegate);
        [v21 indexBarControlDidSelectBeyondBottom:self];
      }
    }
    uint64_t v20 = 465;
    goto LABEL_11;
  }
  v43.origin.double x = v11;
  v43.origin.double y = v13;
  v43.size.double width = v15;
  v43.size.double height = v17;
  double v23 = v9 - CGRectGetMinY(v43);
  v44.origin.double x = v11;
  v44.origin.double y = v13;
  v44.size.double width = v15;
  v44.size.double height = v17;
  CGFloat Height = CGRectGetHeight(v44);
  id v25 = 0;
  uint64_t v26 = v18 - 1;
  int64_t v27 = llround(v23 / Height * (double)(v18 - 1));
  if (v18 - 1 >= v27) {
    uint64_t v26 = v27;
  }
  uint64_t v28 = v26 & ~(v26 >> 63);
  uint64_t v35 = 0;
  CGRect v36 = &v35;
  uint64_t v37 = 0x3032000000;
  double v38 = __Block_byref_object_copy__104;
  v39 = __Block_byref_object_dispose__104;
  id v40 = 0;
  if (v28 < v18)
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __56__SUUIIndexBarControl__sendSelectionForTouch_withEvent___block_invoke;
    v33[3] = &unk_265409440;
    v33[5] = &v35;
    v33[6] = v28;
    v33[4] = v34;
    [(SUUIIndexBarControl *)self _enumerateEntryIndexPathsUsingBlock:v33];
    _Block_object_dispose(v34, 8);
    long long v29 = (void *)v36[5];
    if (v29) {
      id v25 = v29;
    }
    else {
      id v25 = 0;
    }
  }
  _Block_object_dispose(&v35, 8);

  p_lastSelectedIndexPath = &self->_lastSelectedIndexPath;
  unint64_t v31 = self->_lastSelectedIndexPath;
  if (v31 != v25 && ([(NSIndexPath *)v31 isEqual:v25] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastSelectedIndexPath, v25);
    if (*p_lastSelectedIndexPath)
    {
      if ((*(unsigned char *)&self->_dataSourceDelegateFlags & 4) != 0)
      {
        id v32 = objc_loadWeakRetained((id *)&self->_delegate);
        [v32 indexBarControl:self didSelectEntryAtIndexPath:*p_lastSelectedIndexPath];
      }
    }
  }
  self->_didSendPastBottom = 0;
  self->_didSendPastTop = 0;

LABEL_24:
}

void __56__SUUIIndexBarControl__sendSelectionForTouch_withEvent___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1[4] + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v8 == a1[6])
  {
    id v9 = v6;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    id v6 = v9;
    *a3 = 1;
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v8 = *(void *)(v7 + 24);
  }
  *(void *)(v7 + 24) = v8 + 1;
}

- (CGSize)_sizeForEntries:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x3010000000;
  double v14 = "";
  long long v15 = *MEMORY[0x263F001B0];
  uint64_t v5 = [v4 count];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__SUUIIndexBarControl__sizeForEntries___block_invoke;
  v10[3] = &unk_265409468;
  v10[5] = &v11;
  v10[6] = v5;
  v10[4] = self;
  [v4 enumerateObjectsUsingBlock:v10];
  double v6 = v12[4];
  double v7 = v12[5];
  _Block_object_dispose(&v11, 8);

  double v8 = v6;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

double __39__SUUIIndexBarControl__sizeForEntries___block_invoke(void *a1, void *a2, unint64_t a3)
{
  [a2 size];
  uint64_t v7 = a1[6];
  uint64_t v8 = *(void *)(a1[5] + 8);
  if (*(double *)(v8 + 32) >= v5) {
    double v5 = *(double *)(v8 + 32);
  }
  *(double *)(v8 + 32) = v5;
  uint64_t v9 = *(void *)(a1[5] + 8);
  double result = v6 + *(double *)(v9 + 40);
  *(double *)(v9 + 40) = result;
  if (v7 - 1 > a3)
  {
    uint64_t v11 = *(void *)(a1[5] + 8);
    double result = *(double *)(a1[4] + 504) + *(double *)(v11 + 40);
    *(double *)(v11 + 40) = result;
  }
  return result;
}

- (CGSize)_sizeForEntryAtIndexPath:(id)a3
{
  id v3 = [(SUUIIndexBarControl *)self _entryAtIndexPath:a3];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (int64_t)_totalEntryCount
{
  if (!self->_hasValidTotalEntryCount)
  {
    uint64_t v5 = 0;
    double v6 = &v5;
    uint64_t v7 = 0x2020000000;
    uint64_t v8 = 0;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __39__SUUIIndexBarControl__totalEntryCount__block_invoke;
    v4[3] = &unk_265409490;
    v4[4] = &v5;
    [(SUUIIndexBarControl *)self _enumerateEntryIndexPathsUsingBlock:v4];
    self->_totalEntryCount = v6[3];
    _Block_object_dispose(&v5, 8);
  }
  return self->_totalEntryCount;
}

uint64_t __39__SUUIIndexBarControl__totalEntryCount__block_invoke(uint64_t result)
{
  return result;
}

- (CGSize)_totalSize
{
  if (!self->_hasValidTotalSize)
  {
    uint64_t v13 = 0;
    double v14 = (CGSize *)&v13;
    uint64_t v15 = 0x3010000000;
    double v16 = "";
    long long v17 = *MEMORY[0x263F001B0];
    uint64_t v9 = 0;
    double v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __33__SUUIIndexBarControl__totalSize__block_invoke;
    v8[3] = &unk_2654094B8;
    v8[4] = self;
    v8[5] = &v13;
    v8[6] = &v9;
    [(SUUIIndexBarControl *)self _enumerateEntryIndexPathsUsingBlock:v8];
    id v3 = v14;
    if (*((unsigned char *)v10 + 24))
    {
      v4.f64[0] = v14[2].height - self->_lineSpacing;
      v14[2].double height = v4.f64[0];
    }
    else
    {
      v4.f64[0] = v14[2].height;
    }
    v4.f64[1] = v3[2].width;
    int8x16_t v5 = (int8x16_t)vmaxnmq_f64(vaddq_f64(vaddq_f64(*(float64x2_t *)&self->_contentEdgeInsets.top, *(float64x2_t *)&self->_contentEdgeInsets.bottom), v4), (float64x2_t)0);
    v3[2] = (CGSize)vextq_s8(v5, v5, 8uLL);
    self->_totalSize = v3[2];
    self->_hasValidTotalSize = 1;
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
  }
  double width = self->_totalSize.width;
  double height = self->_totalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

double __33__SUUIIndexBarControl__totalSize__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _sizeForEntryAtIndexPath:a2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(double *)(v5 + 32) >= v3) {
    double v3 = *(double *)(v5 + 32);
  }
  *(double *)(v5 + 32) = v3;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)(*(void *)(a1 + 32) + 504) + *(double *)(v6 + 40);
  *(double *)(v6 + 40) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (CGRect)_visibleBounds
{
  double v3 = [(SUUIIndexBarControl *)self _displayEntries];
  [(SUUIIndexBarControl *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  uint64_t v12 = [v3 count];
  uint64_t v30 = 0;
  unint64_t v31 = &v30;
  uint64_t v32 = 0x4010000000;
  uint64_t v33 = "";
  long long v34 = 0u;
  long long v35 = 0u;
  v36.origin.double x = v5;
  v36.origin.double y = v7;
  v36.size.double width = v9;
  v36.size.double height = v11;
  CGFloat v13 = CGRectGetMinX(v36) + self->_contentEdgeInsets.left;
  v37.origin.double x = v5;
  v37.origin.double y = v7;
  v37.size.double width = v9;
  v37.size.double height = v11;
  CGFloat v14 = CGRectGetMinY(v37) + self->_contentEdgeInsets.top;
  *(CGFloat *)&long long v34 = v13;
  *((CGFloat *)&v34 + 1) = v14;
  long long v35 = 0uLL;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __37__SUUIIndexBarControl__visibleBounds__block_invoke;
  v29[3] = &unk_265409468;
  v29[5] = &v30;
  v29[6] = v12;
  v29[4] = self;
  [v3 enumerateObjectsUsingBlock:v29];
  uint64_t v15 = [(SUUIIndexBarControl *)self traitCollection];
  [v15 displayScale];
  UIRectCenteredIntegralRectScale();
  double v16 = v31;
  v31[4] = v17;
  v16[5] = v18;
  v16[6] = v19;
  v16[7] = v20;

  double v21 = *((double *)v31 + 4);
  double v22 = *((double *)v31 + 5);
  double v23 = *((double *)v31 + 6);
  double v24 = *((double *)v31 + 7);
  _Block_object_dispose(&v30, 8);

  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

void __37__SUUIIndexBarControl__visibleBounds__block_invoke(void *a1, void *a2, unint64_t a3)
{
  [a2 size];
  double v6 = v5;
  double v8 = v7;
  double Width = CGRectGetWidth(*(CGRect *)(*(void *)(a1[5] + 8) + 32));
  if (Width < v6) {
    double Width = v6;
  }
  uint64_t v10 = a1[6];
  *(double *)(*(void *)(a1[5] + 8) + 48) = Width;
  *(double *)(*(void *)(a1[5] + 8) + 56) = v8 + *(double *)(*(void *)(a1[5] + 8) + 56);
  if (v10 - 1 > a3) {
    *(double *)(*(void *)(a1[5] + 8) + 56) = *(double *)(a1[4] + 504)
  }
                                                 + *(double *)(*(void *)(a1[5] + 8) + 56);
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top = self->_hitTestEdgeInsets.top;
  double left = self->_hitTestEdgeInsets.left;
  double bottom = self->_hitTestEdgeInsets.bottom;
  double right = self->_hitTestEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  self->_hitTestEdgeInsets = a3;
}

- (SUUIIndexBarControlDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SUUIIndexBarControlDataSource *)WeakRetained;
}

- (NSDictionary)defaultTextAttributes
{
  return self->_defaultTextAttributes;
}

- (SUUIIndexBarControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIIndexBarControlDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultTextAttributes, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sectionIndexToNumberOfEntriesMapTable, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_indexPathToEntryMapTable, 0);
  objc_storeStrong((id *)&self->_displayEntries, 0);
  objc_storeStrong((id *)&self->_combinedEntry, 0);
}

@end