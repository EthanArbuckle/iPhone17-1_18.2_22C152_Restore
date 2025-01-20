@interface STUIStatusBarRegionAxesLayout
- (BOOL)canOverflowItems;
- (BOOL)fitsAllItems;
- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4;
- (NSArray)displayItems;
- (NSArray)horizontalConstraints;
- (NSArray)layoutGuides;
- (NSArray)verticalConstraints;
- (STUIStatusBarRegion)region;
- (STUIStatusBarRegionAxisLayout)horizontalLayout;
- (STUIStatusBarRegionAxisLayout)verticalLayout;
- (void)_updateConstraints;
- (void)setDisplayItems:(id)a3;
- (void)setHorizontalConstraints:(id)a3;
- (void)setHorizontalLayout:(id)a3;
- (void)setLayoutGuides:(id)a3;
- (void)setRegion:(id)a3;
- (void)setVerticalConstraints:(id)a3;
- (void)setVerticalLayout:(id)a3;
@end

@implementation STUIStatusBarRegionAxesLayout

- (void)_updateConstraints
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_horizontalConstraints count]) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_horizontalConstraints];
  }
  if ([(NSArray *)self->_verticalConstraints count]) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_verticalConstraints];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v3 = self->_layoutGuides;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v7++), "_ui_removeFromParentLayoutItem");
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v5);
  }

  v8 = [(STUIStatusBarRegionAxesLayout *)self region];
  v9 = [v8 containerItem];

  v10 = [MEMORY[0x1E4F1CA48] array];
  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [MEMORY[0x1E4F1CA48] array];
  if (v9 && [(NSArray *)self->_displayItems count])
  {
    displayItems = self->_displayItems;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __51__STUIStatusBarRegionAxesLayout__updateConstraints__block_invoke;
    v31[3] = &unk_1E6AA3738;
    id v14 = v9;
    id v32 = v14;
    [(NSArray *)displayItems enumerateObjectsUsingBlock:v31];
    v15 = [(STUIStatusBarRegionAxisLayout *)self->_horizontalLayout constraintsForDisplayItems:self->_displayItems layoutGuides:v10 inContainerItem:v14 axis:0];
    [(NSArray *)v11 addObjectsFromArray:v15];

    v16 = [(STUIStatusBarRegionAxisLayout *)self->_verticalLayout constraintsForDisplayItems:self->_displayItems layoutGuides:v10 inContainerItem:v14 axis:1];
    [(NSArray *)v12 addObjectsFromArray:v16];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = v10;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(v14, "_ui_addSubLayoutItem:", *(void *)(*((void *)&v27 + 1) + 8 * v21++), (void)v27);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v19);
    }

    [MEMORY[0x1E4F28DC8] activateConstraints:v11];
    [MEMORY[0x1E4F28DC8] activateConstraints:v12];
  }
  horizontalConstraints = self->_horizontalConstraints;
  self->_horizontalConstraints = v11;
  v23 = v11;

  verticalConstraints = self->_verticalConstraints;
  self->_verticalConstraints = v12;
  v25 = v12;

  layoutGuides = self->_layoutGuides;
  self->_layoutGuides = v10;
}

- (STUIStatusBarRegion)region
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  return (STUIStatusBarRegion *)WeakRetained;
}

- (BOOL)fitsAllItems
{
  v3 = [(STUIStatusBarRegionAxesLayout *)self displayItems];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 1;
  }
  uint64_t v5 = [(STUIStatusBarRegionAxesLayout *)self region];
  uint64_t v6 = [v5 containerItem];
  objc_msgSend(v6, "_ui_bounds");
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  if ([(STUIStatusBarRegionAxisLayout *)self->_horizontalLayout canOverflowItems]) {
    double v15 = -0.001;
  }
  else {
    double v15 = -1000000.0;
  }
  if ([(STUIStatusBarRegionAxisLayout *)self->_verticalLayout canOverflowItems]) {
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
  uint64_t v21 = [(STUIStatusBarRegionAxesLayout *)self displayItems];
  v22 = [v21 firstObject];
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
    long long v28 = [(STUIStatusBarRegionAxesLayout *)self displayItems];
    long long v29 = [v28 lastObject];
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

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void)setVerticalLayout:(id)a3
{
  uint64_t v5 = (STUIStatusBarRegionAxisLayout *)a3;
  p_verticalLayout = &self->_verticalLayout;
  if (self->_verticalLayout != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_verticalLayout, a3);
    p_verticalLayout = (STUIStatusBarRegionAxisLayout **)[(STUIStatusBarRegionAxesLayout *)self _updateConstraints];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_verticalLayout, v5);
}

- (void)setHorizontalLayout:(id)a3
{
  uint64_t v5 = (STUIStatusBarRegionAxisLayout *)a3;
  p_horizontalLayout = &self->_horizontalLayout;
  if (self->_horizontalLayout != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_horizontalLayout, a3);
    p_horizontalLayout = (STUIStatusBarRegionAxisLayout **)[(STUIStatusBarRegionAxesLayout *)self _updateConstraints];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_horizontalLayout, v5);
}

- (void)setDisplayItems:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  p_displayItems = &self->_displayItems;
  if (self->_displayItems != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_displayItems, a3);
    p_displayItems = (NSArray **)[(STUIStatusBarRegionAxesLayout *)self _updateConstraints];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_displayItems, v5);
}

- (void)setRegion:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_region, obj);
    [(STUIStatusBarRegionAxesLayout *)self _updateConstraints];
    uint64_t v5 = obj;
  }
}

void __51__STUIStatusBarRegionAxesLayout__updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 layoutItem];
  objc_msgSend(v3, "set_ui_usesManualLayout:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_ui_addSubLayoutItem:", v3);
}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = ((objc_opt_respondsToSelector() & 1) == 0
     || [(STUIStatusBarRegionAxisLayout *)self->_horizontalLayout mayFitDisplayItems:v6 inContainerItem:v7 axis:0])&& ((objc_opt_respondsToSelector() & 1) == 0|| [(STUIStatusBarRegionAxisLayout *)self->_verticalLayout mayFitDisplayItems:v6 inContainerItem:v7 axis:1]);

  return v8;
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

- (BOOL)canOverflowItems
{
  if ([(STUIStatusBarRegionAxisLayout *)self->_horizontalLayout canOverflowItems]) {
    return 1;
  }
  verticalLayout = self->_verticalLayout;
  return [(STUIStatusBarRegionAxisLayout *)verticalLayout canOverflowItems];
}

- (STUIStatusBarRegionAxisLayout)horizontalLayout
{
  return self->_horizontalLayout;
}

- (STUIStatusBarRegionAxisLayout)verticalLayout
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

@end