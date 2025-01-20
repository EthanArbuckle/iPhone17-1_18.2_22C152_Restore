@interface _UIStatusBarRegionAxesLayout
- (BOOL)canOverflowItems;
- (BOOL)fitsAllItems;
- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4;
- (NSArray)displayItems;
- (NSArray)horizontalConstraints;
- (NSArray)layoutGuides;
- (NSArray)verticalConstraints;
- (_UIStatusBarRegion)region;
- (_UIStatusBarRegionAxisLayout)horizontalLayout;
- (_UIStatusBarRegionAxisLayout)verticalLayout;
- (void)_updateConstraints;
- (void)setDisplayItems:(id)a3;
- (void)setHorizontalConstraints:(id)a3;
- (void)setHorizontalLayout:(id)a3;
- (void)setLayoutGuides:(id)a3;
- (void)setRegion:(id)a3;
- (void)setVerticalConstraints:(id)a3;
- (void)setVerticalLayout:(id)a3;
@end

@implementation _UIStatusBarRegionAxesLayout

- (void)setRegion:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_region, obj);
    [(_UIStatusBarRegionAxesLayout *)self _updateConstraints];
    v5 = obj;
  }
}

- (void)setDisplayItems:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_displayItems != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_displayItems, a3);
    [(_UIStatusBarRegionAxesLayout *)self _updateConstraints];
    v5 = v6;
  }
}

- (void)setHorizontalLayout:(id)a3
{
  v5 = (_UIStatusBarRegionAxisLayout *)a3;
  if (self->_horizontalLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_horizontalLayout, a3);
    [(_UIStatusBarRegionAxesLayout *)self _updateConstraints];
    v5 = v6;
  }
}

- (void)setVerticalLayout:(id)a3
{
  v5 = (_UIStatusBarRegionAxisLayout *)a3;
  if (self->_verticalLayout != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_verticalLayout, a3);
    [(_UIStatusBarRegionAxesLayout *)self _updateConstraints];
    v5 = v6;
  }
}

- (void)_updateConstraints
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_horizontalConstraints count]) {
    [MEMORY[0x1E4F5B268] deactivateConstraints:self->_horizontalConstraints];
  }
  if ([(NSArray *)self->_verticalConstraints count]) {
    [MEMORY[0x1E4F5B268] deactivateConstraints:self->_verticalConstraints];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v4 = self->_layoutGuides;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v37;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v8++), "_ui_removeFromParentLayoutItem");
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v6);
  }

  v9 = [(_UIStatusBarRegionAxesLayout *)self region];
  v10 = [v9 containerItem];

  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = [MEMORY[0x1E4F1CA48] array];
  if (v10 && [(NSArray *)self->_displayItems count])
  {
    displayItems = self->_displayItems;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __50___UIStatusBarRegionAxesLayout__updateConstraints__block_invoke;
    v34[3] = &unk_1E53056E8;
    id v15 = v10;
    id v35 = v15;
    [(NSArray *)displayItems enumerateObjectsUsingBlock:v34];
    if (!self->_horizontalLayout)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2, self, @"_UIStatusBarRegionAxesLayout.m", 94, @"%@ has no horizontal layout", self object file lineNumber description];
    }
    if (!self->_verticalLayout)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, self, @"_UIStatusBarRegionAxesLayout.m", 95, @"%@ has no vertical layout", self object file lineNumber description];
    }
    v16 = [(_UIStatusBarRegionAxisLayout *)self->_horizontalLayout constraintsForDisplayItems:self->_displayItems layoutGuides:v11 inContainerItem:v15 axis:0];
    [(NSArray *)v12 addObjectsFromArray:v16];

    v17 = [(_UIStatusBarRegionAxisLayout *)self->_verticalLayout constraintsForDisplayItems:self->_displayItems layoutGuides:v11 inContainerItem:v15 axis:1];
    [(NSArray *)v13 addObjectsFromArray:v17];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v18 = v11;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v15, "_ui_addSubLayoutItem:", *(void *)(*((void *)&v30 + 1) + 8 * v22++));
        }
        while (v20 != v22);
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v20);
    }

    [MEMORY[0x1E4F5B268] activateConstraints:v12];
    [MEMORY[0x1E4F5B268] activateConstraints:v13];
  }
  horizontalConstraints = self->_horizontalConstraints;
  self->_horizontalConstraints = v12;
  v24 = v12;

  verticalConstraints = self->_verticalConstraints;
  self->_verticalConstraints = v13;
  v26 = v13;

  layoutGuides = self->_layoutGuides;
  self->_layoutGuides = v11;
}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = ((objc_opt_respondsToSelector() & 1) == 0
     || [(_UIStatusBarRegionAxisLayout *)self->_horizontalLayout mayFitDisplayItems:v6 inContainerItem:v7 axis:0])&& ((objc_opt_respondsToSelector() & 1) == 0|| [(_UIStatusBarRegionAxisLayout *)self->_verticalLayout mayFitDisplayItems:v6 inContainerItem:v7 axis:1]);

  return v8;
}

- (BOOL)fitsAllItems
{
  v3 = [(_UIStatusBarRegionAxesLayout *)self displayItems];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 1;
  }
  uint64_t v5 = [(_UIStatusBarRegionAxesLayout *)self region];
  id v6 = [v5 containerItem];
  objc_msgSend(v6, "_ui_bounds");
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  if ([(_UIStatusBarRegionAxisLayout *)self->_horizontalLayout canOverflowItems]) {
    double v15 = -0.001;
  }
  else {
    double v15 = -1000000.0;
  }
  if ([(_UIStatusBarRegionAxisLayout *)self->_verticalLayout canOverflowItems]) {
    double v16 = -0.001;
  }
  else {
    double v16 = -1000000.0;
  }
  v37.origin.CGFloat x = v8;
  v37.origin.CGFloat y = v10;
  v37.size.CGFloat width = v12;
  v37.size.CGFloat height = v14;
  CGRect v38 = CGRectInset(v37, v15, v16);
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  uint64_t v21 = [(_UIStatusBarRegionAxesLayout *)self displayItems];
  uint64_t v22 = [v21 firstObject];
  v23 = [v22 layoutItem];
  objc_msgSend(v23, "_ui_frame");
  v41.origin.CGFloat x = v24;
  v41.origin.CGFloat y = v25;
  v41.size.CGFloat width = v26;
  v41.size.CGFloat height = v27;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  if (CGRectContainsRect(v39, v41))
  {
    v28 = [(_UIStatusBarRegionAxesLayout *)self displayItems];
    v29 = [v28 lastObject];
    long long v30 = [v29 layoutItem];
    objc_msgSend(v30, "_ui_frame");
    v42.origin.CGFloat x = v31;
    v42.origin.CGFloat y = v32;
    v42.size.CGFloat width = v33;
    v42.size.CGFloat height = v34;
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    BOOL v35 = CGRectContainsRect(v40, v42);
  }
  else
  {
    BOOL v35 = 0;
  }

  return v35;
}

- (BOOL)canOverflowItems
{
  if ([(_UIStatusBarRegionAxisLayout *)self->_horizontalLayout canOverflowItems]) {
    return 1;
  }
  verticalLayout = self->_verticalLayout;
  return [(_UIStatusBarRegionAxisLayout *)verticalLayout canOverflowItems];
}

- (_UIStatusBarRegion)region
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  return (_UIStatusBarRegion *)WeakRetained;
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (_UIStatusBarRegionAxisLayout)horizontalLayout
{
  return self->_horizontalLayout;
}

- (_UIStatusBarRegionAxisLayout)verticalLayout
{
  return self->_verticalLayout;
}

- (NSArray)horizontalConstraints
{
  return self->_horizontalConstraints;
}

- (void)setHorizontalConstraints:(id)a3
{
}

- (NSArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setVerticalConstraints:(id)a3
{
}

- (NSArray)layoutGuides
{
  return self->_layoutGuides;
}

- (void)setLayoutGuides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGuides, 0);
  objc_storeStrong((id *)&self->_verticalConstraints, 0);
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLayout, 0);
  objc_storeStrong((id *)&self->_horizontalLayout, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_destroyWeak((id *)&self->_region);
}

@end