@interface _UIButtonBarItemGroupLayout
- (BOOL)compact;
- (BOOL)critical;
- (BOOL)fixed;
- (BOOL)isGroupLayout;
- (BOOL)isSpaceLayout;
- (BOOL)shouldHorizontallyCenterView:(id)a3;
- (BOOL)spilled;
- (BOOL)suppressCustomSpacing;
- (BOOL)suppressSpacing;
- (BOOL)useGroupSizing;
- (UIBarButtonItemGroup)group;
- (UILayoutGuide)groupSizeGuide;
- (_UIButtonBarItemGroupLayout)initWithLayoutMetrics:(id)a3;
- (_UIButtonBarItemGroupLayout)initWithLayoutMetrics:(id)a3 barButtonItemGroup:(id)a4;
- (double)compactWidth;
- (double)expandedWidth;
- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3;
- (id)_itemLayouts;
- (id)_newLayoutForBarButtonItem:(id)a3 useGroupSizing:(BOOL)a4;
- (id)_representativeLayout;
- (id)description;
- (id)itemViewGenerator;
- (id)layoutForBarButtonItem:(id)a3;
- (id)layoutsForSpacerItem:(id)a3;
- (id)subLayouts;
- (int64_t)leadingSpacerType;
- (void)_addConstraintsToActivate:(id)a3 toDeactivate:(id)a4;
- (void)_addLayoutGuides:(id)a3;
- (void)_addLayoutViews:(id)a3;
- (void)_configure;
- (void)_iterateConfiguredLayouts:(id)a3;
- (void)dirtyLayoutForPlainAppearanceChange:(BOOL)a3 doneAppearanceChanged:(BOOL)a4;
- (void)recalculateLayoutWidthsGivenItemSpaceWidth:(double)a3;
- (void)setCompact:(BOOL)a3;
- (void)setCritical:(BOOL)a3;
- (void)setFixed:(BOOL)a3;
- (void)setItemViewGenerator:(id)a3;
- (void)setLeadingSpacerType:(int64_t)a3;
- (void)setSpilled:(BOOL)a3;
- (void)setSuppressCustomSpacing:(BOOL)a3;
- (void)setSuppressSpacing:(BOOL)a3;
- (void)setUseGroupSizing:(BOOL)a3;
@end

@implementation _UIButtonBarItemGroupLayout

- (UIBarButtonItemGroup)group
{
  return self->_group;
}

- (void)setLeadingSpacerType:(int64_t)a3
{
  if (self->_leadingSpacerType != a3)
  {
    self->_leadingSpacerType = a3;
    [(_UIButtonBarLayout *)self setDirty:1];
  }
}

- (void)setSuppressSpacing:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_suppressSpacing != a3)
  {
    self->_suppressSpacing = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = self->_itemLayouts;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setSuppressSpacing:", self->_suppressSpacing, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(_UIButtonBarLayout *)self setDirty:1];
  }
}

- (void)setSuppressCustomSpacing:(BOOL)a3
{
  if (self->_suppressCustomSpacing != a3)
  {
    self->_suppressCustomSpacing = a3;
    [(_UIButtonBarLayout *)self setDirty:1];
  }
}

- (void)setFixed:(BOOL)a3
{
  self->_fixed = a3;
}

- (void)dirtyLayoutForPlainAppearanceChange:(BOOL)a3 doneAppearanceChanged:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[_UIButtonBarLayout dirtyLayoutForPlainAppearanceChange:doneAppearanceChanged:](self->_representativeLayout, "dirtyLayoutForPlainAppearanceChange:doneAppearanceChanged:");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_itemLayouts;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "dirtyLayoutForPlainAppearanceChange:doneAppearanceChanged:", v5, v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setUseGroupSizing:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_useGroupSizing != a3)
  {
    self->_useGroupSizing = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v4 = self->_itemLayouts;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setUseGroupSizing:", self->_useGroupSizing, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setItemViewGenerator:(id)a3
{
}

- (double)compactWidth
{
  return self->_compactWidth;
}

- (BOOL)fixed
{
  return self->_fixed;
}

- (double)expandedWidth
{
  return self->_expandedWidth;
}

- (BOOL)shouldHorizontallyCenterView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_itemLayouts;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "shouldHorizontallyCenterView:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)recalculateLayoutWidthsGivenItemSpaceWidth:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(_UIButtonBarLayout *)self configure];
  if (self->_leadingSpacerType == 1)
  {
    [(_UIButtonBarSpacerLayout *)self->_leadingSpacerLayout minimumLayoutWidthGivenMinimumSpaceWidth:a3];
    double v6 = v5;
    uint64_t v7 = [(NSMutableArray *)self->_configuredItemLayouts count];
    double v8 = 0.0;
    if (v7) {
      double v9 = v6;
    }
    else {
      double v9 = 0.0;
    }
    self->_expandedWidth = v9;
    if (self->_representativeLayout) {
      double v8 = v6;
    }
    self->_compactWidth = v8;
  }
  else
  {
    self->_expandedWidth = 0.0;
    self->_compactWidth = 0.0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v10 = self->_configuredItemLayouts;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "minimumLayoutWidthGivenMinimumSpaceWidth:", a3, (void)v20);
        self->_expandedWidth = v15 + self->_expandedWidth;
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  [(UIBarButtonItemGroup *)self->_group _contextualExpandedPadding];
  double v17 = v16 + self->_expandedWidth;
  self->_expandedWidth = v17;
  representativeLayout = self->_representativeLayout;
  if (representativeLayout)
  {
    [(_UIButtonBarLayout *)representativeLayout minimumLayoutWidthGivenMinimumSpaceWidth:a3];
    double v17 = v19 + self->_compactWidth;
  }
  self->_compactWidth = v17;
}

- (id)subLayouts
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_compact)
  {
    v4[0] = self->_representativeLayout;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = self->_configuredItemLayouts;
  }
  return v2;
}

- (void)setSpilled:(BOOL)a3
{
  BOOL v3 = a3 && !self->_fixed;
  self->_spilled = v3;
}

- (void)setCompact:(BOOL)a3
{
  BOOL v4 = a3 && -[UIBarButtonItemGroup _canCollapse]((BOOL)self->_group);
  self->_compact = v4;
}

- (void)_addLayoutViews:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47___UIButtonBarItemGroupLayout__addLayoutViews___block_invoke;
  v6[3] = &unk_1E52DDBD8;
  id v7 = v4;
  id v5 = v4;
  [(_UIButtonBarItemGroupLayout *)self _iterateConfiguredLayouts:v6];
}

- (void)_addLayoutGuides:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_useGroupSizing && !self->_compact) {
    [v4 addObject:self->_groupSizeGuide];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48___UIButtonBarItemGroupLayout__addLayoutGuides___block_invoke;
  v7[3] = &unk_1E52DDBD8;
  id v8 = v5;
  id v6 = v5;
  [(_UIButtonBarItemGroupLayout *)self _iterateConfiguredLayouts:v7];
}

- (void)_addConstraintsToActivate:(id)a3 toDeactivate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70___UIButtonBarItemGroupLayout__addConstraintsToActivate_toDeactivate___block_invoke;
  v10[3] = &unk_1E52DDC00;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_UIButtonBarItemGroupLayout *)self _iterateConfiguredLayouts:v10];
}

- (void)_iterateConfiguredLayouts:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, _UIButtonBarSpacerLayout *))a3;
  if (self->_spilled) {
    goto LABEL_16;
  }
  if (self->_leadingSpacerType)
  {
    if (self->_compact)
    {
      if (!self->_representativeLayout) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if ([(NSMutableArray *)self->_configuredItemLayouts count]) {
LABEL_5:
    }
      v4[2](v4, self->_leadingSpacerLayout);
  }
LABEL_6:
  if (self->_compact)
  {
    v4[2](v4, (_UIButtonBarSpacerLayout *)self->_representativeLayout);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_configuredItemLayouts;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(_UIButtonBarSpacerLayout **)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
LABEL_16:
}

- (BOOL)critical
{
  return self->_critical;
}

- (BOOL)isGroupLayout
{
  return 1;
}

- (void)_configure
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 32;
  [(NSMutableArray *)self->_itemLayouts removeAllObjects];
  [(NSMutableArray *)self->_configuredItemLayouts removeAllObjects];
  id v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  if (-[UIBarButtonItemGroup _canCollapse]((BOOL)self->_group)
    && ([(UIBarButtonItemGroup *)self->_group representativeItem],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [(NSMapTable *)self->_itemLayoutMap objectForKey:v5];
    representativeLayout = self->_representativeLayout;
    self->_representativeLayout = v7;

    if (!self->_representativeLayout)
    {
      uint64_t v9 = [(_UIButtonBarItemGroupLayout *)self _newLayoutForBarButtonItem:v6 useGroupSizing:0];
      long long v10 = self->_representativeLayout;
      self->_representativeLayout = v9;

      [v4 setObject:self->_representativeLayout forKey:v6];
    }
  }
  else
  {
    long long v11 = self->_representativeLayout;
    self->_representativeLayout = 0;

    uint64_t v6 = 0;
  }
  v32 = v6;
  -[UIBarButtonItemGroup _items]((id *)&self->_group->super.isa);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v12)
  {
    v35 = 0;
    uint64_t v19 = 24;
    goto LABEL_31;
  }
  uint64_t v13 = v12;
  v35 = 0;
  uint64_t v14 = *(void *)v37;
  uint64_t v15 = &OBJC_IVAR____UIAlertControllerTextFieldViewCollectionCell__selectButtonGesture;
  uint64_t v33 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v37 != v14) {
        objc_enumerationMutation(obj);
      }
      double v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      int v18 = [v17 isSpaceItem];
      uint64_t v19 = v15[489];
      if (v18) {
        [*(id *)((char *)&self->super.super.isa + v19) removeObjectForKey:v17];
      }
      id v20 = [*(id *)((char *)&self->super.super.isa + v19) objectForKey:v17];
      if (!v20) {
        id v20 = [(_UIButtonBarItemGroupLayout *)self _newLayoutForBarButtonItem:v17 useGroupSizing:self->_useGroupSizing];
      }
      [v4 setObject:v20 forKey:v17];
      [*(id *)((char *)&self->super.super.isa + v3) addObject:v20];
      [v20 setDirty:1];
      if (([v17 isHidden] & 1) == 0)
      {
        long long v21 = v15;
        uint64_t v22 = v3;
        long long v23 = v4;
        if (self->_suppressSpacing || self->_suppressCustomSpacing)
        {
          if (([v17 isSpaceItem] & 1) == 0)
          {
            v24 = v35;
            if (self->_suppressSpacing || !v35) {
              goto LABEL_25;
            }
            goto LABEL_23;
          }
        }
        else
        {
          v24 = v35;
          if (!v35) {
            goto LABEL_25;
          }
LABEL_23:
          uint64_t v25 = [(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics _upcastIfReadOnly];
          v26 = +[_UIButtonBarSpacerLayout spacerForLayoutMetrics:v25 betweenLayout:v35 andLayout:v20];

          v24 = v35;
          if (v26)
          {
            [(NSMutableArray *)self->_configuredItemLayouts addObject:v26];
          }
LABEL_25:
          [(NSMutableArray *)self->_configuredItemLayouts addObject:v20];
          id v27 = v20;

          v35 = v27;
        }
        id v4 = v23;
        uint64_t v3 = v22;
        uint64_t v15 = v21;
        uint64_t v14 = v33;
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v13);
LABEL_31:
  objc_storeStrong((id *)((char *)&self->super.super.isa + v19), v4);
  if (self->_leadingSpacerType)
  {
    leadingSpacerLayout = self->_leadingSpacerLayout;
    v29 = [(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics _upcastIfReadOnly];
    v30 = +[_UIButtonBarSpacerLayout _updateSpacer:leadingSpacerLayout layoutMetrics:v29 spacerType:self->_leadingSpacerType];
    v31 = self->_leadingSpacerLayout;
    self->_leadingSpacerLayout = v30;
  }
}

- (id)_newLayoutForBarButtonItem:(id)a3 useGroupSizing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isSystemItem] && (unint64_t)(objc_msgSend(v6, "systemItem") - 5) <= 1)
  {
    uint64_t v7 = [_UIButtonBarSpacerLayout alloc];
    uint64_t v8 = [(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics _upcastIfReadOnly];
    uint64_t v9 = [(_UIButtonBarSpacerLayout *)v7 initWithLayoutMetrics:v8 barButtonItem:v6];
  }
  else
  {
    long long v10 = [_UIButtonBarItemLayout alloc];
    long long v11 = [(_UIButtonBarLayoutMetricsData *)self->super._layoutMetrics _upcastIfReadOnly];
    uint64_t v9 = [(_UIButtonBarItemLayout *)v10 initWithLayoutMetrics:v11 barButtonItem:v6];

    [(_UIButtonBarLayout *)v9 setUseGroupSizing:v4];
    [(_UIButtonBarSpacerLayout *)v9 setItemViewGenerator:self->_itemViewGenerator];
  }

  return v9;
}

- (BOOL)suppressSpacing
{
  return self->_suppressSpacing;
}

- (BOOL)isSpaceLayout
{
  if (self->_compact)
  {
    v2 = self->_representativeLayout;
  }
  else
  {
    v2 = [(NSMutableArray *)self->_configuredItemLayouts lastObject];
  }
  uint64_t v3 = v2;
  BOOL v4 = [(_UIButtonBarLayout *)v2 isSpaceLayout];

  return v4;
}

- (_UIButtonBarItemGroupLayout)initWithLayoutMetrics:(id)a3 barButtonItemGroup:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_alloc_init(UILayoutGuide);
  long long v10 = objc_msgSend(NSString, "stringWithFormat:", @"UIButtonBar.sizingGuide.%p", v7);
  [(UILayoutGuide *)v9 setIdentifier:v10];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72___UIButtonBarItemGroupLayout_initWithLayoutMetrics_barButtonItemGroup___block_invoke;
  v21[3] = &unk_1E52DDBB0;
  long long v11 = v9;
  uint64_t v22 = v11;
  uint64_t v12 = (void *)[v8 _copyWithModifications:v21];

  v20.receiver = self;
  v20.super_class = (Class)_UIButtonBarItemGroupLayout;
  uint64_t v13 = [(_UIButtonBarLayout *)&v20 initWithLayoutMetrics:v12];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_group, a4);
    objc_storeStrong((id *)&v14->_groupSizeGuide, v9);
    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    itemLayouts = v14->_itemLayouts;
    v14->_itemLayouts = v15;

    double v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    configuredItemLayouts = v14->_configuredItemLayouts;
    v14->_configuredItemLayouts = v17;
  }
  return v14;
}

- (id)layoutForBarButtonItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isSpaceItem] & 1) == 0
    && ([v4 buttonGroup],
        uint64_t v5 = (UIBarButtonItemGroup *)objc_claimAutoreleasedReturnValue(),
        group = self->_group,
        v5,
        v5 == group))
  {
    id v7 = [(NSMapTable *)self->_itemLayoutMap objectForKey:v4];
    if (!v7)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v9 = self->_itemLayouts;
      id v7 = (id)[(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v9);
            }
            uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            objc_msgSend(v12, "barButtonItem", (void)v14);
            id v13 = (id)objc_claimAutoreleasedReturnValue();

            if (v13 == v4)
            {
              id v7 = v12;
              goto LABEL_18;
            }
          }
          id v7 = (id)[(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_18:
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemViewGenerator, 0);
  objc_storeStrong((id *)&self->_groupSizeGuide, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_leadingSpacerLayout, 0);
  objc_storeStrong((id *)&self->_representativeLayout, 0);
  objc_storeStrong((id *)&self->_configuredItemLayouts, 0);
  objc_storeStrong((id *)&self->_itemLayouts, 0);
  objc_storeStrong((id *)&self->_itemLayoutMap, 0);
}

- (_UIButtonBarItemGroupLayout)initWithLayoutMetrics:(id)a3
{
  return 0;
}

- (id)layoutsForSpacerItem:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isSpaceItem]
    && ([v4 buttonGroup],
        uint64_t v5 = (UIBarButtonItemGroup *)objc_claimAutoreleasedReturnValue(),
        id v6 = self->_group,
        v5,
        v5 == v6))
  {
    uint64_t v9 = [v4 _owningButtonGroup];
    group = self->_group;

    if (v9 == group)
    {
      v23[0] = self->_representativeLayout;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v11 = self->_itemLayouts;
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            objc_msgSend(v16, "barButtonItem", (void)v18);
            id v17 = (id)objc_claimAutoreleasedReturnValue();

            if (v17 == v4) {
              [v7 addObject:v16];
            }
          }
          uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v13);
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(_UIButtonBarLayout *)self configure];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_configuredItemLayouts;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "minimumLayoutWidthGivenMinimumSpaceWidth:", a3, (void)v13);
        double v9 = v9 + v11;
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (id)_itemLayouts
{
  return self->_itemLayouts;
}

- (id)_representativeLayout
{
  return self->_representativeLayout;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)_UIButtonBarItemGroupLayout;
  uint64_t v3 = [(_UIButtonBarLayout *)&v16 description];
  id v4 = (void *)[v3 mutableCopy];

  if (self->_useGroupSizing) {
    [v4 appendString:@" useGroupSizing"];
  }
  if (self->_compact) {
    [v4 appendString:@" compact"];
  }
  if (self->_spilled) {
    [v4 appendString:@" spilled"];
  }
  objc_msgSend(v4, "appendFormat:", @" group=%p groupSizingGuide=%p\n", self->_group, self->_groupSizeGuide);
  if (self->_leadingSpacerType && self->_leadingSpacerLayout) {
    [v4 appendFormat:@"\tleadingSpacer=%@\n", self->_leadingSpacerLayout];
  }
  if (-[UIBarButtonItemGroup _canCollapse]((BOOL)self->_group))
  {
    uint64_t v5 = [(UIBarButtonItemGroup *)self->_group representativeItem];

    if (v5) {
      [v4 appendFormat:@"\trepresentativeLayout=%@\n", self->_representativeLayout];
    }
  }
  objc_msgSend(v4, "appendFormat:", @"\titemLayouts=%p", self->_itemLayouts);
  if (self->_configuredItemLayouts)
  {
    [v4 appendString:@" configuredItemLayouts={\n"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_configuredItemLayouts;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 appendFormat:@"\t%@\n", *(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }

    [v4 appendString:@"}"];
  }
  return v4;
}

- (UILayoutGuide)groupSizeGuide
{
  return self->_groupSizeGuide;
}

- (void)setCritical:(BOOL)a3
{
  self->_critical = a3;
}

- (BOOL)compact
{
  return self->_compact;
}

- (BOOL)spilled
{
  return self->_spilled;
}

- (BOOL)useGroupSizing
{
  return self->_useGroupSizing;
}

- (BOOL)suppressCustomSpacing
{
  return self->_suppressCustomSpacing;
}

- (int64_t)leadingSpacerType
{
  return self->_leadingSpacerType;
}

- (id)itemViewGenerator
{
  return self->_itemViewGenerator;
}

@end