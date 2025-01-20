@interface _UIButtonBar
- ($1AB5FA073B851C12C2339EC22442E995)widthInfo;
- (BOOL)_item:(id)a3 addSymbolEffect:(id)a4 options:(id)a5 animated:(BOOL)a6;
- (BOOL)_item:(id)a3 removeAllSymbolEffectsWithOptions:(id)a4 animated:(BOOL)a5;
- (BOOL)_item:(id)a3 removeSymbolEffectOfType:(id)a4 options:(id)a5 animated:(BOOL)a6;
- (BOOL)_itemDidUpdateMenu:(id)a3 fromMenu:(id)a4;
- (BOOL)allowsViewWrappers;
- (BOOL)doneItemAppearanceNeedsUpdate;
- (BOOL)forceFixedSpacing;
- (BOOL)hasAlwaysOverflowGroups;
- (BOOL)hasVisibleContent;
- (BOOL)itemsInGroupUseSameSize;
- (BOOL)needsLeadingSpacer;
- (BOOL)needsTrailingSpacer;
- (BOOL)plainItemAppearanceNeedsUpdate;
- (BOOL)supportsAlwaysOverflowGroups;
- (BOOL)supportsOverflow;
- (CGRect)_preferredRegionRectForButton:(id)a3;
- (NSArray)barButtonGroups;
- (NSArray)elementsForOverflowMenu;
- (NSArray)elementsRepresentingOrderedGroups;
- (NSArray)fixedLeadingGroups;
- (NSArray)fixedTrailingGroups;
- (NSArray)groupRealizedOrder;
- (NSDirectionalEdgeInsets)hitTestDirectionalInsets;
- (NSString)description;
- (UIBarButtonItem)leadingVisibleItem;
- (UIBarButtonItem)popOverPresentingSourceItem;
- (UIBarButtonItem)trailingClippingItem;
- (UIBarButtonItem)trailingVisibleItem;
- (UIEdgeInsets)hitTestInsets;
- (UIPointerInteractionDelegate)assistantView;
- (UIView)_viewForOverlayRects;
- (UIView)view;
- (_UIBarButtonItemData)doneItemAppearance;
- (_UIBarButtonItemData)plainItemAppearance;
- (_UIButtonBar)init;
- (_UIButtonBar)initWithCoder:(id)a3;
- (_UIButtonBarAppearanceDelegate)_appearanceDelegate;
- (_UIButtonBarDelegate)delegate;
- (_UIButtonBarGroupOrderer)groupOrderer;
- (_UIPointerInteractionAssistant)assistant;
- (double)_widthInfoForLayout:(uint64_t)a1;
- (double)minimumInterItemSpace;
- (double)targetLayoutWidth;
- (id)_groupOrdererGroups:(id)a3;
- (id)_layoutForGroup:(id)a3;
- (id)_overflowFallbackItem;
- (id)_targetActionForBarButtonItem:(id)a3;
- (id)_updatedViewForBarButtonItem:(id)a3 withView:(id)a4;
- (id)defaultActionFilter;
- (id)itemAtPoint:(CGPoint)a3 inView:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)viewUpdater;
- (int64_t)itemDistribution;
- (void)_appearanceChanged;
- (void)_buttonBarStackViewDidLayoutSubviews:(id)a3;
- (void)_confirmOwnershipOfFixedGroups;
- (void)_disablePointerInteractions;
- (void)_enablePointerInteractions;
- (void)_enumerateAllGroups:(id)a3;
- (void)_enumerateLayoutGroups:(id)a3;
- (void)_forwardEnumerateVisibleItems:(void *)a1;
- (void)_groupDidUpdateItems:(id)a3 removedItems:(id)a4;
- (void)_groupDidUpdateRepresentative:(id)a3 fromRepresentative:(id)a4;
- (void)_groupOrdererDidUpdate:(id)a3;
- (void)_invalidateAssistant:(id)a3;
- (void)_item:(id)a3 applyContentTransition:(id)a4 options:(id)a5;
- (void)_itemCustomViewDidChange:(id)a3 fromView:(id)a4;
- (void)_itemDidChangeHiddenState:(id)a3;
- (void)_itemDidChangeSelectionState:(id)a3;
- (void)_itemDidChangeWidth:(id)a3;
- (void)_itemStandardViewNeedsUpdate:(id)a3;
- (void)_layoutBar;
- (void)_reverseEnumerateVisibleItems:(void *)a1;
- (void)_setNeedsAppearanceUpdate;
- (void)_setNeedsVisualUpdate;
- (void)_updateEffectiveLayout;
- (void)_updateHitRects;
- (void)_validateAllItems;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAllowsViewWrappers:(BOOL)a3;
- (void)setAssistant:(id)a3;
- (void)setBarButtonGroups:(id)a3;
- (void)setDefaultActionFilter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneItemAppearance:(id)a3;
- (void)setFixedLeadingGroups:(id)a3;
- (void)setFixedTrailingGroups:(id)a3;
- (void)setForceFixedSpacing:(BOOL)a3;
- (void)setGroupOrderer:(id)a3;
- (void)setHitTestDirectionalInsets:(NSDirectionalEdgeInsets)a3;
- (void)setHitTestInsets:(UIEdgeInsets)a3;
- (void)setItemDistribution:(int64_t)a3;
- (void)setItemsInGroupUseSameSize:(BOOL)a3;
- (void)setMinimumInterItemSpace:(double)a3;
- (void)setNeedsHitTestUpdate;
- (void)setPlainItemAppearance:(id)a3;
- (void)setPopOverPresentingSourceItem:(id)a3;
- (void)setSupportsAlwaysOverflowGroups:(BOOL)a3;
- (void)setSupportsOverflow:(BOOL)a3;
- (void)setTargetLayoutWidth:(double)a3;
- (void)setViewUpdater:(id)a3;
- (void)set_appearanceDelegate:(id)a3;
@end

@implementation _UIButtonBar

- (void)setTargetLayoutWidth:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (*(double *)&self->_groupOrderer != a3)
  {
    *(double *)&self->_groupOrderer = a3;
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)widthInfo
{
  -[_UIButtonBar _updateEffectiveLayout]((uint64_t)self);
  effectiveLayout = self->_effectiveLayout;
  double v4 = [(_UIButtonBar *)(uint64_t)self _widthInfoForLayout:effectiveLayout];
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)_updateEffectiveLayout
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  BOOL v2 = [*(id *)(a1 + 8) distribution] != 0;
  v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __38___UIButtonBar__updateEffectiveLayout__block_invoke;
  v27[3] = &unk_1E52DDA08;
  v27[4] = a1;
  BOOL v31 = v2;
  id v21 = v3;
  id v28 = v21;
  id v22 = v4;
  id v29 = v22;
  v30 = &v32;
  [(id)a1 _enumerateLayoutGroups:v27];
  objc_storeStrong((id *)(a1 + 64), v4);
  objc_storeStrong((id *)(a1 + 80), v3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = *(id *)(a1 + 64);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (!v8)
  {

    v9 = 0;
    goto LABEL_22;
  }
  v9 = 0;
  uint64_t v10 = *(void *)v24;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
      uint64_t v13 = objc_msgSend(v12, "group", v21);
      if (v13)
      {
        uint64_t v14 = *(void *)(v13 + 48);
        if (v14)
        {
          BOOL v15 = v14 == 1;

          if (v15) {
            goto LABEL_15;
          }
        }
        else
        {
          BOOL v16 = (*(unsigned char *)(v13 + 24) & 1) == 0;

          if (!v16) {
            goto LABEL_15;
          }
        }
      }
      [v6 addObject:v12];
      [v12 dirtyLayoutForPlainAppearanceChange:(*(unsigned __int8 *)(a1 + 120) >> 2) & 1 doneAppearanceChanged:(*(unsigned __int8 *)(a1 + 120) >> 3) & 1];
      if (v9)
      {
        [v5 addObject:v9];
        objc_msgSend(v12, "setLeadingSpacerType:", +[_UIButtonBarSpacerLayout typeOfSpacerBetweenLayout:andLayout:](_UIButtonBarSpacerLayout, "typeOfSpacerBetweenLayout:andLayout:", v9, v12));
      }
      id v17 = v12;

      v9 = v17;
LABEL_15:
      ++v11;
    }
    while (v8 != v11);
    uint64_t v18 = [v7 countByEnumeratingWithState:&v23 objects:v36 count:16];
    uint64_t v8 = v18;
  }
  while (v18);

  if (v9) {
    [v5 addObject:v9];
  }
LABEL_22:
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a1 + 120) & 0xDF | (32 * *((unsigned char *)v33 + 24));
  v19 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v5;
  id v20 = v5;

  _Block_object_dispose(&v32, 8);
}

- (void)_enumerateLayoutGroups:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, uint64_t))a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = self->_fixedTrailingGroups;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v28 + 1) + 8 * v9++), 1);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_UIButtonBar *)self groupRealizedOrder];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        v4[2](v4, *(void *)(*((void *)&v24 + 1) + 8 * v14++), 0);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v15 = self->_delegate;
  uint64_t v16 = [(_UIButtonBarDelegate *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        v4[2](v4, *(void *)(*((void *)&v20 + 1) + 8 * v19++), 1);
      }
      while (v17 != v19);
      uint64_t v17 = [(_UIButtonBarDelegate *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (NSArray)groupRealizedOrder
{
  defaultActionFilter = self->_defaultActionFilter;
  if (defaultActionFilter)
  {
    -[_UIButtonBarGroupOrderer orderedGroups](defaultActionFilter);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = *(id *)&self->_minimumInterItemSpace;
  }
  return (NSArray *)v4;
}

- (BOOL)needsTrailingSpacer
{
  if (BYTE1(self->_barButtonGroups))
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3032000000;
    uint64_t v9 = __Block_byref_object_copy__15;
    uint64_t v10 = __Block_byref_object_dispose__15;
    id v11 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __35___UIButtonBar_needsTrailingSpacer__block_invoke;
    v5[3] = &unk_1E52DD8A0;
    v5[4] = &v6;
    -[_UIButtonBar _reverseEnumerateVisibleItems:](self, v5);
    v3 = (void *)v7[5];
    if (v3) {
      int v2 = [v3 isSpaceItem] ^ 1;
    }
    else {
      LOBYTE(v2) = 0;
    }
    _Block_object_dispose(&v6, 8);
  }
  return v2;
}

- (void)_updateHitRects
{
  id v51 = (id)objc_opt_new();
  _addInteractiveLayouts(self->_effectiveLayout, v51, [(UIView *)self->_stackView _shouldReverseLayoutDirection]);
  uint64_t v3 = [v51 count];
  if (v3)
  {
    uint64_t v4 = v3;
    [(UIView *)self->_stackView bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(UIView *)self->_stackView hitTestInsets];
    CGFloat v14 = v6 + v13;
    CGFloat v16 = v8 + v15;
    CGFloat v18 = v10 - (v13 + v17);
    CGFloat v20 = v12 - (v15 + v19);
    v53.origin.x = v14;
    v53.origin.y = v16;
    v53.size.width = v18;
    v53.size.height = v20;
    double MinX = CGRectGetMinX(v53);
    v54.origin.x = v14;
    v54.origin.y = v16;
    v54.size.width = v18;
    v54.size.height = v20;
    double MaxX = CGRectGetMaxX(v54);
    double v23 = MaxX;
    if (v4 == 1)
    {
      id v24 = [v51 firstObject];
      if ([v24 isCustomViewItem])
      {
LABEL_14:

        goto LABEL_15;
      }
      id v25 = [v24 view];
      _configureInsets(v25, MinX, v23);
    }
    else
    {
      if (v4 < 2) {
        goto LABEL_15;
      }
      double v49 = MaxX;
      long long v26 = [v51 firstObject];
      long long v27 = _viewRepresentingItem(v26, self->_stackView);
      id v25 = 0;
      id v24 = 0;
      uint64_t v28 = 1;
      do
      {
        double v50 = MinX;
        long long v29 = [v51 objectAtIndexedSubscript:v28];

        long long v30 = _viewRepresentingItem(v29, self->_stackView);

        [v27 frame];
        CGFloat v32 = v31;
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        [v30 frame];
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        CGFloat v44 = v43;
        CGFloat v46 = v45;
        v55.origin.x = v32;
        v55.origin.y = v34;
        v55.size.width = v36;
        v55.size.height = v38;
        double v47 = CGRectGetMaxX(v55);
        v56.origin.x = v40;
        v56.origin.y = v42;
        v56.size.width = v44;
        v56.size.height = v46;
        double v48 = (v47 + CGRectGetMinX(v56)) * 0.5;
        if (([v26 isCustomViewItem] & 1) == 0) {
          _configureInsets(v27, v50, v48);
        }
        id v25 = v30;

        id v24 = v29;
        ++v28;
        long long v27 = v25;
        long long v26 = v24;
        double MinX = v48;
      }
      while (v4 != v28);
      if (([v24 isCustomViewItem] & 1) == 0) {
        _configureInsets(v25, v48, v49);
      }
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_layoutBar
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_buttonBarFlags & 1) == 0)
  {
    *(unsigned char *)&self->_buttonBarFlags |= 1u;
    -[_UIButtonBar _updateEffectiveLayout]((uint64_t)self);
    if (BYTE2(self->_barButtonGroups))
    {
      [(_UIButtonBar *)(uint64_t)self _widthInfoForLayout:self->_effectiveLayout];
      double v4 = v3;
      groupOrderer = self->_groupOrderer;
      int v7 = (*(double *)&groupOrderer < v6) & (*(unsigned char *)&self->_buttonBarFlags >> 5);
      double v8 = self->_effectiveLayout;
      obuint64_t j = v7;
      if (*(double *)&groupOrderer >= v4 && v7 == 0) {
        goto LABEL_44;
      }
      long long v167 = 0u;
      long long v166 = 0u;
      long long v165 = 0u;
      long long v164 = 0u;
      double v10 = self->_effectiveLayout;
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v164 objects:v172 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        double v13 = 0;
        CGFloat v14 = 0;
        double v15 = 0;
        uint64_t v16 = *(void *)v165;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v165 != v16) {
              objc_enumerationMutation(v10);
            }
            CGFloat v18 = *(void **)(*((void *)&v164 + 1) + 8 * i);
            if ([v18 critical])
            {
              id v19 = v18;

              double v13 = v19;
            }
            else
            {
              if ([v18 fixed])
              {
                if (!v14)
                {
                  CGFloat v14 = [MEMORY[0x1E4F1CA48] array];
                }
                CGFloat v20 = v14;
              }
              else
              {
                if (!v15)
                {
                  double v15 = [MEMORY[0x1E4F1CA48] array];
                }
                CGFloat v20 = v15;
              }
              [v20 addObject:v18];
            }
          }
          uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v164 objects:v172 count:16];
        }
        while (v12);

        if (*(double *)&groupOrderer < v4)
        {
          if (v13)
          {
            long long v21 = [MEMORY[0x1E4F1CA48] arrayWithObject:v13];
LABEL_37:

            if (v14) {
              [(NSMutableArray *)v21 addObjectsFromArray:v14];
            }
            if (!v15) {
              goto LABEL_43;
            }
            [(NSMutableArray *)v21 addObjectsFromArray:v15];
LABEL_42:

LABEL_43:
            double v8 = v21;
LABEL_44:
            double v28 = *(double *)&self->_groupOrderer;
            long long v160 = 0u;
            long long v161 = 0u;
            long long v162 = 0u;
            long long v163 = 0u;
            long long v22 = v8;
            uint64_t v29 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v160 objects:&v168 count:16];
            if (!v29) {
              goto LABEL_68;
            }
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v161;
            char v32 = 1;
            double v33 = 0.0;
            double v34 = 0.0;
            while (1)
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v161 != v31) {
                  objc_enumerationMutation(v22);
                }
                CGFloat v36 = *(void **)(*((void *)&v160 + 1) + 8 * j);
                if ([v36 fixed])
                {
                  [v36 compactWidth];
                  double v33 = v33 + v37;
                }
                [v36 compactWidth];
                double v34 = v34 + v38;
                double v39 = self->_groupOrderer;
                if (v33 > *(double *)&v39)
                {
                  [v36 setCompact:1];
                  uint64_t v40 = [v36 fixed] ^ 1;
                  double v41 = v36;
LABEL_55:
                  [v41 setSpilled:v40];
                  continue;
                }
                if (v34 > *(double *)&v39)
                {
                  [v36 setCompact:1];
                  double v41 = v36;
                  uint64_t v40 = 1;
                  goto LABEL_55;
                }
                [v36 compactWidth];
                double v28 = v28 - v42;
                [v36 expandedWidth];
                double v44 = v43;
                [v36 compactWidth];
                double v46 = v44 - v45;
                if (([v36 critical] & obj) == 1 && v46 > 0.0)
                {
                  char v47 = 1;
                }
                else
                {
                  double v48 = [v36 group];
                  char v47 = [v48 _shouldAlwaysCollapse];

                  if (((v46 <= v28 + 0.00000011920929) & v32) != 0 && (v47 & 1) == 0)
                  {
                    [v36 setCompact:0];
                    [v36 setSpilled:0];
                    double v28 = v28 - v46;
                    double v34 = v34 + v46;
                    continue;
                  }
                }
                [v36 setCompact:1];
                if (v28 >= 0.0) {
                  uint64_t v49 = 0;
                }
                else {
                  uint64_t v49 = [v36 fixed] ^ 1;
                }
                [v36 setSpilled:v49];
                v32 &= (v46 <= v28 + 0.00000011920929) & v47;
              }
              uint64_t v30 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v160 objects:&v168 count:16];
              if (!v30)
              {
LABEL_68:

                goto LABEL_69;
              }
            }
          }
LABEL_36:
          long long v21 = [MEMORY[0x1E4F1CA48] array];
          double v13 = 0;
          goto LABEL_37;
        }
      }
      else
      {

        CGFloat v14 = 0;
        double v15 = 0;
        double v13 = 0;
        if (*(double *)&groupOrderer < v4) {
          goto LABEL_36;
        }
      }
      long long v21 = (NSMutableArray *)[(NSMutableArray *)self->_effectiveLayout mutableCopy];

      [(NSMutableArray *)v21 removeObject:v13];
      [(NSMutableArray *)v21 insertObject:v13 atIndex:0];
      goto LABEL_42;
    }
    long long v171 = 0u;
    long long v170 = 0u;
    long long v169 = 0u;
    long long v168 = 0u;
    long long v22 = self->_effectiveLayout;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v168 objects:v172 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v169;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v169 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = *(void **)(*((void *)&v168 + 1) + 8 * k);
          [v27 setCompact:0];
          [v27 setSpilled:0];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v168 objects:v172 count:16];
      }
      while (v24);
    }
LABEL_69:

    v118 = (void *)[(NSMutableArray *)self->_layoutActiveConstraints copy];
    v116 = (void *)[(NSMutableArray *)self->_layoutViews copy];
    v117 = (void *)[(NSMutableArray *)self->_layoutGuides copy];
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableArray *)self->_layoutViews removeAllObjects];
    [(NSMutableArray *)self->_layoutGuides removeAllObjects];
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    obja = self->_effectiveLayout;
    uint64_t v52 = [(NSMutableArray *)obja countByEnumeratingWithState:&v153 objects:v172 count:16];
    v122 = v50;
    id v123 = v51;
    if (v52)
    {
      uint64_t v53 = v52;
      CGRect v54 = 0;
      uint64_t v55 = *(void *)v154;
      uint64_t v120 = *(void *)v154;
      do
      {
        for (uint64_t m = 0; m != v53; ++m)
        {
          if (*(void *)v154 != v55) {
            objc_enumerationMutation(obja);
          }
          v57 = *(void **)(*((void *)&v153 + 1) + 8 * m);
          [v57 addLayoutViews:self->_layoutViews layoutGuides:self->_layoutGuides constraintsToActivate:v50 constraintsToDeactivate:v51];
          if (!v54)
          {
            long long v151 = 0u;
            long long v152 = 0u;
            long long v149 = 0u;
            long long v150 = 0u;
            v58 = self->_layoutViews;
            uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v149 objects:&v168 count:16];
            if (v59)
            {
              uint64_t v60 = v59;
              CGRect v54 = 0;
              uint64_t v61 = *(void *)v150;
              do
              {
                for (uint64_t n = 0; n != v60; ++n)
                {
                  if (*(void *)v150 != v61) {
                    objc_enumerationMutation(v58);
                  }
                  v63 = *(void **)(*((void *)&v149 + 1) + 8 * n);
                  if ([v57 shouldHorizontallyCenterView:v63])
                  {
                    id v64 = v63;

                    CGRect v54 = v64;
                  }
                }
                uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v149 objects:&v168 count:16];
              }
              while (v60);
            }
            else
            {
              CGRect v54 = 0;
            }

            id v50 = v122;
            id v51 = v123;
            uint64_t v55 = v120;
          }
        }
        uint64_t v53 = [(NSMutableArray *)obja countByEnumeratingWithState:&v153 objects:v172 count:16];
      }
      while (v53);
    }
    else
    {
      CGRect v54 = 0;
    }

    *(unsigned char *)&self->_buttonBarFlags &= 0xF1u;
    v65 = [MEMORY[0x1E4F1CAD0] setWithArray:v50];
    v66 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_layoutViews];
    v67 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_layoutGuides];
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v68 = v116;
    uint64_t v69 = [v68 countByEnumeratingWithState:&v145 objects:&v164 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v146;
      do
      {
        for (iuint64_t i = 0; ii != v70; ++ii)
        {
          if (*(void *)v146 != v71) {
            objc_enumerationMutation(v68);
          }
          v73 = *(void **)(*((void *)&v145 + 1) + 8 * ii);
          if (([v66 containsObject:v73] & 1) == 0)
          {
            [(UIStackView *)self->_stackView removeArrangedSubview:v73];
            [v73 removeFromSuperview];
          }
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v145 objects:&v164 count:16];
      }
      while (v70);
    }

    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id objb = v117;
    uint64_t v74 = [objb countByEnumeratingWithState:&v141 objects:&v160 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v142;
      do
      {
        for (juint64_t j = 0; jj != v75; ++jj)
        {
          if (*(void *)v142 != v76) {
            objc_enumerationMutation(objb);
          }
          uint64_t v78 = *(void *)(*((void *)&v141 + 1) + 8 * jj);
          if (([v67 containsObject:v78] & 1) == 0) {
            [(UIView *)self->_stackView removeLayoutGuide:v78];
          }
        }
        uint64_t v75 = [objb countByEnumeratingWithState:&v141 objects:&v160 count:16];
      }
      while (v75);
    }
    v121 = v68;

    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v79 = v118;
    uint64_t v80 = [v79 countByEnumeratingWithState:&v137 objects:v159 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      uint64_t v82 = *(void *)v138;
      do
      {
        for (kuint64_t k = 0; kk != v81; ++kk)
        {
          if (*(void *)v138 != v82) {
            objc_enumerationMutation(v79);
          }
          v84 = *(void **)(*((void *)&v137 + 1) + 8 * kk);
          if (([v65 containsObject:v84] & 1) == 0) {
            [v84 setActive:0];
          }
        }
        uint64_t v81 = [v79 countByEnumeratingWithState:&v137 objects:v159 count:16];
      }
      while (v81);
    }
    v119 = v79;

    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    v85 = self->_layoutViews;
    uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v133 objects:v158 count:16];
    if (v86)
    {
      uint64_t v87 = v86;
      uint64_t v88 = 0;
      uint64_t v89 = *(void *)v134;
      do
      {
        for (muint64_t m = 0; mm != v87; ++mm)
        {
          if (*(void *)v134 != v89) {
            objc_enumerationMutation(v85);
          }
          [(UIStackView *)self->_stackView insertArrangedSubview:*(void *)(*((void *)&v133 + 1) + 8 * mm) atIndex:v88 + mm];
        }
        uint64_t v87 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v133 objects:v158 count:16];
        v88 += mm;
      }
      while (v87);
    }

    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    v91 = self->_layoutGuides;
    uint64_t v92 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v129 objects:v157 count:16];
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = *(void *)v130;
      do
      {
        for (nuint64_t n = 0; nn != v93; ++nn)
        {
          if (*(void *)v130 != v94) {
            objc_enumerationMutation(v91);
          }
          [(UIView *)self->_stackView addLayoutGuide:*(void *)(*((void *)&v129 + 1) + 8 * nn)];
        }
        uint64_t v93 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v129 objects:v157 count:16];
      }
      while (v93);
    }

    objc_storeStrong((id *)&self->_layoutActiveConstraints, v122);
    v96 = v123;
    if (self->_centeredView) {
      [v123 addObject:self->_centeringConstraint];
    }
    [MEMORY[0x1E4F5B268] deactivateConstraints:v123];
    if (v54)
    {
      v97 = [v54 centerXAnchor];
      v98 = [(UIView *)self->_stackView centerXAnchor];
      v99 = [v97 constraintEqualToAnchor:v98];

      v96 = v123;
      LODWORD(v100) = 1144569856;
      [(NSLayoutConstraint *)v99 setPriority:v100];
      centeringConstraint = self->_centeringConstraint;
      self->_centeringConstraint = v99;
      v102 = v99;

      [v122 addObject:self->_centeringConstraint];
    }
    [MEMORY[0x1E4F5B268] activateConstraints:v122];

    v103 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    v124 = self->_effectiveLayout;
    uint64_t v104 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v164 objects:v172 count:16];
    if (v104)
    {
      uint64_t v105 = v104;
      id objc = *(id *)v165;
      do
      {
        for (uint64_t i1 = 0; i1 != v105; ++i1)
        {
          if (*(id *)v165 != objc) {
            objc_enumerationMutation(v124);
          }
          v107 = *(void **)(*((void *)&v164 + 1) + 8 * i1);
          long long v160 = 0u;
          long long v161 = 0u;
          long long v162 = 0u;
          long long v163 = 0u;
          v108 = [v107 subLayouts];
          uint64_t v109 = [v108 countByEnumeratingWithState:&v160 objects:&v168 count:16];
          if (v109)
          {
            uint64_t v110 = v109;
            uint64_t v111 = *(void *)v161;
            do
            {
              for (uint64_t i2 = 0; i2 != v110; ++i2)
              {
                if (*(void *)v161 != v111) {
                  objc_enumerationMutation(v108);
                }
                v113 = [*(id *)(*((void *)&v160 + 1) + 8 * i2) barButtonItem];
                if (v113)
                {
                  v114 = [(NSMapTable *)self->_senderActionMap objectForKey:v113];
                  [(NSMapTable *)v103 setObject:v114 forKey:v113];
                }
              }
              uint64_t v110 = [v108 countByEnumeratingWithState:&v160 objects:&v168 count:16];
            }
            while (v110);
          }
        }
        uint64_t v105 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v164 objects:v172 count:16];
      }
      while (v105);
    }

    senderActionMap = self->_senderActionMap;
    self->_senderActionMap = v103;

    [(_UIButtonBar *)self _enablePointerInteractions];
    *(unsigned char *)&self->_buttonBarFlags &= ~1u;
  }
}

- (double)_widthInfoForLayout:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = v3;
  double v5 = 0.0;
  if (a1)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    double v7 = 0.0;
    double v8 = 0.0;
    if (v6)
    {
      uint64_t v9 = v6;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v12 recalculateLayoutWidthsGivenItemSpaceWidth:*(double *)(a1 + 144)];
          [v12 compactWidth];
          double v14 = v13;
          double v15 = [v12 group];
          int v16 = [v15 _disabledExpansion];

          if (v16) {
            [v12 compactWidth];
          }
          else {
            [v12 expandedWidth];
          }
          double v18 = v17;
          if ([v12 fixed])
          {
            [v12 compactWidth];
            double v8 = v8 + v19;
          }
          double v7 = v7 + v14;
          double v5 = v5 + v18;
        }
        uint64_t v9 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (void)_enablePointerInteractions
{
  *(unsigned char *)&self->_buttonBarFlags &= ~0x10u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popOverPresentingSourceItem);
  [WeakRetained invalidate];
}

- (void)_appearanceChanged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_groupLayouts;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setDirty:", 1, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(_UIButtonBar *)self _setNeedsVisualUpdate];
}

- (void)_setNeedsVisualUpdate
{
  [(UIView *)self->_stackView setNeedsUpdateConstraints];
  [(UIView *)self->_stackView setNeedsLayout];
  [(_UIButtonBar *)self _disablePointerInteractions];
}

- (UIView)view
{
  return (UIView *)self->_stackView;
}

- (void)setHitTestInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  bottouint64_t m = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(UIView *)self->_stackView hitTestInsets];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    -[UIView setHitTestInsets:](self->_stackView, "setHitTestInsets:", top, left, bottom, right);
    [(_UIButtonBar *)self setNeedsHitTestUpdate];
  }
}

- (BOOL)_itemDidUpdateMenu:(id)a3 fromMenu:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _UIButtonBarButtonFromItem(a3);
  uint64_t v7 = v6;
  if (v6) {
    char v8 = [v6 updatePresentedMenuFrom:v5];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (void)setBarButtonGroups:(id)a3
{
  id v4 = a3;
  id v5 = *(id *)&self->_minimumInterItemSpace;
  id v6 = v4;
  id v12 = v6;
  if (v5 == v6)
  {

    goto LABEL_11;
  }
  if (v6 && v5)
  {
    char v7 = [v5 isEqual:v6];

    if (v7) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  _UIButtonBarClearOwners(*(void **)&self->_minimumInterItemSpace, self);
  double v8 = COERCE_DOUBLE([v12 copy]);
  double minimumInterItemSpace = self->_minimumInterItemSpace;
  self->_double minimumInterItemSpace = v8;

  _UIButtonBarSetOwners(*(void **)&self->_minimumInterItemSpace, self);
  defaultActionFilter = self->_defaultActionFilter;
  if (defaultActionFilter)
  {
    double v11 = (void *)defaultActionFilter[3];
    defaultActionFilter[3] = 0;
  }
  [(_UIButtonBar *)self _setNeedsVisualUpdate];
LABEL_11:
}

- (void)_disablePointerInteractions
{
  *(unsigned char *)&self->_buttonBarFlags |= 0x10u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popOverPresentingSourceItem);
  [WeakRetained invalidate];
}

- (void)_confirmOwnershipOfFixedGroups
{
  _UIButtonBarSetOwners(self->_fixedTrailingGroups, self);
  delegate = self->_delegate;
  _UIButtonBarSetOwners(delegate, self);
}

- (id)_updatedViewForBarButtonItem:(id)a3 withView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isCustomViewItem])
  {
    id v8 = [v6 customView];
  }
  else
  {
    Class isa = self[1].super.isa;
    if (isa)
    {
      (*((void (**)(Class, _UIButtonBar *, id, id))isa + 2))(isa, self, v6, v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = v7;
    }
  }
  double v10 = v8;

  return v10;
}

- (UIBarButtonItem)trailingVisibleItem
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__15;
  double v9 = __Block_byref_object_dispose__15;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35___UIButtonBar_trailingVisibleItem__block_invoke;
  v4[3] = &unk_1E52DD8A0;
  v4[4] = &v5;
  -[_UIButtonBar _reverseEnumerateVisibleItems:](self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (UIBarButtonItem *)v2;
}

- (void)_reverseEnumerateVisibleItems:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v18 = 0;
    double v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    uint64_t v5 = (void *)a1[20];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke;
    v15[3] = &unk_1E52DD940;
    double v17 = &v18;
    id v6 = v3;
    id v16 = v6;
    [v5 enumerateObjectsWithOptions:2 usingBlock:v15];
    if (!*((unsigned char *)v19 + 24))
    {
      uint64_t v7 = (void *)a1[17];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke_2;
      v12[3] = &unk_1E52DD940;
      double v14 = &v18;
      id v8 = v6;
      id v13 = v8;
      [v7 enumerateObjectsWithOptions:2 usingBlock:v12];

      if (!*((unsigned char *)v19 + 24))
      {
        double v9 = (void *)a1[19];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke_3;
        v10[3] = &unk_1E52DD968;
        id v11 = v8;
        [v9 enumerateObjectsWithOptions:2 usingBlock:v10];
      }
    }

    _Block_object_dispose(&v18, 8);
  }
}

- (void)setAssistant:(id)a3
{
}

- (UIPointerInteractionDelegate)assistantView
{
  return (UIPointerInteractionDelegate *)self->_stackView;
}

- (void)setSupportsOverflow:(BOOL)a3
{
  if (BYTE2(self->_barButtonGroups) != a3)
  {
    BYTE2(self->_barButtonGroups) = a3;
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- (void)setGroupOrderer:(id)a3
{
  uint64_t v5 = (id *)a3;
  p_defaultActionFilter = &self->_defaultActionFilter;
  defaultActionFilter = (id *)self->_defaultActionFilter;
  if (defaultActionFilter != v5)
  {
    id v8 = v5;
    if (defaultActionFilter) {
      objc_storeWeak(defaultActionFilter + 5, 0);
    }
    objc_storeStrong(&self->_defaultActionFilter, a3);
    if (*p_defaultActionFilter) {
      objc_storeWeak((id *)*p_defaultActionFilter + 5, self);
    }
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
    uint64_t v5 = v8;
  }
}

- (void)setForceFixedSpacing:(BOOL)a3
{
  if (BYTE1(self->_barButtonGroups) != a3)
  {
    BYTE1(self->_barButtonGroups) = a3;
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setPopOverPresentingSourceItem:(id)a3
{
}

- (void)setFixedLeadingGroups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_fixedTrailingGroups;
  id v6 = (NSArray *)v4;
  id v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSArray *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    _UIButtonBarClearOwners(self->_fixedTrailingGroups, self);
    id v8 = (NSArray *)[(NSArray *)v10 copy];
    fixedTrailingGroups = self->_fixedTrailingGroups;
    self->_fixedTrailingGroups = v8;

    _UIButtonBarSetOwners(self->_fixedTrailingGroups, self);
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
LABEL_9:
}

- (NSArray)barButtonGroups
{
  return *(NSArray **)&self->_minimumInterItemSpace;
}

- (void)setHitTestDirectionalInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  bottouint64_t m = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  [(UIView *)self->_stackView hitTestDirectionalInsets];
  if (v11 != leading || v8 != top || v10 != trailing || v9 != bottom)
  {
    -[UIView setHitTestDirectionalInsets:](self->_stackView, "setHitTestDirectionalInsets:", top, leading, bottom, trailing);
    [(_UIButtonBar *)self setNeedsHitTestUpdate];
  }
}

- (void)setNeedsHitTestUpdate
{
}

- (UIView)_viewForOverlayRects
{
  id v3 = [(UIStackView *)self->_stackView arrangedSubviews];
  stackView = (_UIButtonBarStackView *)[v3 count];
  if (stackView) {
    stackView = self->_stackView;
  }
  uint64_t v5 = stackView;

  return v5;
}

- (id)_targetActionForBarButtonItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_senderActionMap objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = [[_UIButtonBarTargetAction alloc] initWithBarButtonItem:v4];
    [(_UIButtonBarTargetAction *)v5 setActionFilter:self->__appearanceDelegate];
    [(NSMapTable *)self->_senderActionMap setObject:v5 forKey:v4];
  }

  return v5;
}

- (_UIButtonBarAppearanceDelegate)_appearanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plainItemAppearance);
  return (_UIButtonBarAppearanceDelegate *)WeakRetained;
}

- (_UIBarButtonItemData)plainItemAppearance
{
  return self->_doneItemAppearance;
}

- (BOOL)plainItemAppearanceNeedsUpdate
{
  return (*(unsigned char *)&self->_buttonBarFlags >> 2) & 1;
}

- (_UIBarButtonItemData)doneItemAppearance
{
  return (_UIBarButtonItemData *)self->_assistant;
}

- (BOOL)doneItemAppearanceNeedsUpdate
{
  return (*(unsigned char *)&self->_buttonBarFlags >> 3) & 1;
}

- (void)_buttonBarStackViewDidLayoutSubviews:(id)a3
{
  id v4 = [a3 layer];
  char v5 = [v4 needsLayout];

  if ((v5 & 1) == 0)
  {
    id v6 = [(_UIButtonBar *)self delegate];
    [v6 buttonBarDidLayout:self];
  }
}

- (_UIButtonBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetLayoutWidth);
  return (_UIButtonBarDelegate *)WeakRetained;
}

- (UIBarButtonItem)leadingVisibleItem
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  double v8 = __Block_byref_object_copy__15;
  double v9 = __Block_byref_object_dispose__15;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34___UIButtonBar_leadingVisibleItem__block_invoke;
  v4[3] = &unk_1E52DD8A0;
  v4[4] = &v5;
  -[_UIButtonBar _forwardEnumerateVisibleItems:](self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (UIBarButtonItem *)v2;
}

- (BOOL)needsLeadingSpacer
{
  if (BYTE1(self->_barButtonGroups))
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3032000000;
    double v9 = __Block_byref_object_copy__15;
    id v10 = __Block_byref_object_dispose__15;
    id v11 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34___UIButtonBar_needsLeadingSpacer__block_invoke;
    v5[3] = &unk_1E52DD8A0;
    v5[4] = &v6;
    -[_UIButtonBar _forwardEnumerateVisibleItems:](self, v5);
    id v3 = (void *)v7[5];
    if (v3) {
      int v2 = [v3 isSpaceItem] ^ 1;
    }
    else {
      LOBYTE(v2) = 0;
    }
    _Block_object_dispose(&v6, 8);
  }
  return v2;
}

- (void)_forwardEnumerateVisibleItems:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v18 = 0;
    double v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    uint64_t v5 = (void *)a1[19];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke;
    v15[3] = &unk_1E52DD940;
    double v17 = &v18;
    id v6 = v3;
    id v16 = v6;
    [v5 enumerateObjectsUsingBlock:v15];
    if (!*((unsigned char *)v19 + 24))
    {
      uint64_t v7 = (void *)a1[17];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke_2;
      v12[3] = &unk_1E52DD940;
      double v14 = &v18;
      id v8 = v6;
      id v13 = v8;
      [v7 enumerateObjectsUsingBlock:v12];

      if (!*((unsigned char *)v19 + 24))
      {
        double v9 = (void *)a1[20];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke_3;
        v10[3] = &unk_1E52DD968;
        id v11 = v8;
        [v9 enumerateObjectsUsingBlock:v10];
      }
    }

    _Block_object_dispose(&v18, 8);
  }
}

- (void)setPlainItemAppearance:(id)a3
{
  id v5 = a3;
  id v6 = self->_doneItemAppearance;
  uint64_t v7 = (_UIBarButtonItemData *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(_UIBarAppearanceData *)v6 isEqual:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_doneItemAppearance, a3);
    *(unsigned char *)&self->_buttonBarFlags |= 4u;
    [(_UIButtonBar *)self _setNeedsAppearanceUpdate];
  }
LABEL_9:
}

- (void)setDoneItemAppearance:(id)a3
{
  id v5 = a3;
  id v6 = self->_assistant;
  uint64_t v7 = (_UIPointerInteractionAssistant *)v5;
  double v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(_UIPointerInteractionAssistant *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_assistant, a3);
    *(unsigned char *)&self->_buttonBarFlags |= 8u;
    [(_UIButtonBar *)self _setNeedsAppearanceUpdate];
  }
LABEL_9:
}

- (void)_setNeedsAppearanceUpdate
{
  if ((*(unsigned char *)&self->_buttonBarFlags & 2) == 0)
  {
    *(unsigned char *)&self->_buttonBarFlags |= 2u;
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- (void)set_appearanceDelegate:(id)a3
{
}

- (void)setViewUpdater:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  Class v5 = (Class)a3;
  if (!v5)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"UIButtonBar.m" lineNumber:614 description:@"viewUpdater is nil"];
  }
  if (self[1].super.isa != v5)
  {
    id v6 = (objc_class *)[(objc_class *)v5 copy];
    Class isa = self[1].super.isa;
    self[1].super.Class isa = v6;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    char v8 = self->_groupLayouts;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "setDirty:", 1, (void)v14);
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- (void)setMinimumInterItemSpace:(double)a3
{
  if (*(double *)&self->_fixedLeadingGroups != a3)
  {
    *(double *)&self->_fixedLeadingGroups = a3;
    -[NSLayoutConstraint setConstant:](self->_minimumInterItemSpaceConstraint, "setConstant:");
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- (void)setAllowsViewWrappers:(BOOL)a3
{
}

- (_UIButtonBar)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBar;
  int v2 = [(_UIButtonBar *)&v5 init];
  id v3 = v2;
  if (v2) {
    _UIButtonBarCommonInit(v2);
  }
  return v3;
}

- (void)setItemDistribution:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(UIStackView *)self->_stackView distribution] != a3)
  {
    [(UIStackView *)self->_stackView setDistribution:a3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    objc_super v5 = self->_groupLayouts;
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
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setSuppressSpacing:", a3 != 0, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- (void)_groupDidUpdateItems:(id)a3 removedItems:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (id *)a3;
  id v7 = a4;
  _UIButtonBarClearOwnedItems(v7, self);
  uint64_t v8 = -[UIBarButtonItemGroup _items](v6);
  _UIButtonBarSetItemOwners(v8, self);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NSMapTable removeObjectForKey:](self->_senderActionMap, "removeObjectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * v13++), (void)v15);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  long long v14 = [(_UIButtonBar *)self _layoutForGroup:v6];
  [v14 setDirty:1];

  [(_UIButtonBar *)self _setNeedsVisualUpdate];
}

- (void)_itemStandardViewNeedsUpdate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 buttonGroup];
  id v7 = [(_UIButtonBar *)self _layoutForGroup:v5];

  uint64_t v6 = [v7 layoutForBarButtonItem:v4];

  [v6 setDirty:1];
  [(_UIButtonBar *)self _setNeedsVisualUpdate];
}

- (id)_layoutForGroup:(id)a3
{
  return [(NSMapTable *)self->_groupLayoutMap objectForKey:a3];
}

- (void)setFixedTrailingGroups:(id)a3
{
  id v4 = a3;
  objc_super v5 = self->_delegate;
  uint64_t v6 = (_UIButtonBarDelegate *)v4;
  uint64_t v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(_UIButtonBarDelegate *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    _UIButtonBarClearOwners(self->_delegate, self);
    uint64_t v8 = (_UIButtonBarDelegate *)[(_UIButtonBarDelegate *)v10 copy];
    delegate = self->_delegate;
    self->_delegate = v8;

    _UIButtonBarSetOwners(self->_delegate, self);
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
LABEL_9:
}

- (void)dealloc
{
  _UIButtonBarClearOwners(*(void **)&self->_minimumInterItemSpace, self);
  _UIButtonBarClearOwners(self->_fixedTrailingGroups, self);
  _UIButtonBarClearOwners(self->_delegate, self);
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_layoutActiveConstraints];
  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBar;
  [(_UIButtonBar *)&v3 dealloc];
}

- (_UIButtonBar)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIButtonBar;
  objc_super v5 = [(_UIButtonBar *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    _UIButtonBarCommonInit(v5);
    char v7 = [v4 decodeObjectForKey:@"UIButtonBarGroups"];
    uint64_t v8 = [v7 copy];
    double minimumInterItemSpace = v6->_minimumInterItemSpace;
    *(void *)&v6->_double minimumInterItemSpace = v8;

    _UIButtonBarSetOwners(*(void **)&v6->_minimumInterItemSpace, v6);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double minimumInterItemSpace = self->_minimumInterItemSpace;
  if (minimumInterItemSpace != 0.0) {
    [a3 encodeObject:*(void *)&minimumInterItemSpace forKey:@"UIButtonBarGroups"];
  }
}

- (void)setItemsInGroupUseSameSize:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (LOBYTE(self->_barButtonGroups) != a3)
  {
    LOBYTE(self->_barButtonGroups) = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_groupLayouts;
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
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setUseGroupSizing:", LOBYTE(self->_barButtonGroups), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- (BOOL)allowsViewWrappers
{
  return [(_UIButtonBarLayoutMetrics *)self->_layoutMetrics allowsViewWrappers];
}

- (int64_t)itemDistribution
{
  return [(UIStackView *)self->_stackView distribution];
}

- (UIEdgeInsets)hitTestInsets
{
  [(UIView *)self->_stackView hitTestInsets];
  result.double right = v5;
  result.bottouint64_t m = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)hitTestDirectionalInsets
{
  [(UIView *)self->_stackView hitTestDirectionalInsets];
  result.double trailing = v5;
  result.bottouint64_t m = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (BOOL)hasVisibleContent
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(_UIButtonBar *)self groupRealizedOrder];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = 0;
        long long v11 = &v10;
        uint64_t v12 = 0x2020000000;
        char v13 = 0;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __33___UIButtonBar_hasVisibleContent__block_invoke;
        v9[3] = &unk_1E52DD8A0;
        v9[4] = &v10;
        -[UIBarButtonItemGroup enumerateVisibleItems:](v6, v9);
        int v7 = *((unsigned __int8 *)v11 + 24);
        _Block_object_dispose(&v10, 8);
        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasAlwaysOverflowGroups
{
  if (!BYTE3(self->_barButtonGroups)) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39___UIButtonBar_hasAlwaysOverflowGroups__block_invoke;
  v4[3] = &unk_1E52DD8C8;
  v4[4] = &v5;
  [(_UIButtonBar *)self _enumerateAllGroups:v4];
  BOOL v2 = *((unsigned char *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSArray)elementsForOverflowMenu
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = self->_effectiveLayout;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
        if (([v9 spilled] & 1) == 0)
        {
          uint64_t v10 = [v9 group];
          if (!v10)
          {
            uint64_t v12 = 0;
            goto LABEL_10;
          }
          char v11 = v10[24];

          if ((v11 & 8) == 0) {
            goto LABEL_11;
          }
        }
        uint64_t v12 = [v9 group];
        [v3 addObject:v12];
LABEL_10:

LABEL_11:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v13 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
      uint64_t v6 = v13;
    }
    while (v13);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __39___UIButtonBar_elementsForOverflowMenu__block_invoke;
  v27[3] = &unk_1E52DD8F0;
  id v14 = v3;
  id v28 = v14;
  [(_UIButtonBar *)self _enumerateAllGroups:v27];
  long long v15 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        char v21 = -[UIBarButtonItemGroup _effectiveMenuRepresentation](*(void **)(*((void *)&v23 + 1) + 8 * i));
        objc_msgSend(v15, "addObject:", v21, (void)v23);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v18);
  }

  return (NSArray *)v15;
}

- (NSArray)elementsRepresentingOrderedGroups
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(_UIButtonBar *)self groupRealizedOrder];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = -[UIBarButtonItemGroup _effectiveMenuRepresentation](*(void **)(*((void *)&v11 + 1) + 8 * i));
        objc_msgSend(v3, "addObject:", v9, (void)v11);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)itemAtPoint:(CGPoint)a3 inView:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__15;
  uint64_t v20 = __Block_byref_object_dispose__15;
  id v21 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35___UIButtonBar_itemAtPoint_inView___block_invoke;
  v11[3] = &unk_1E52DD918;
  id v8 = v7;
  CGFloat v14 = x;
  CGFloat v15 = y;
  id v12 = v8;
  long long v13 = &v16;
  -[_UIButtonBar _forwardEnumerateVisibleItems:](self, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (UIBarButtonItem)trailingClippingItem
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__15;
  long long v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36___UIButtonBar_trailingClippingItem__block_invoke;
  v4[3] = &unk_1E52DD990;
  v4[4] = &v7;
  void v4[5] = v5;
  -[_UIButtonBar _reverseEnumerateVisibleItems:](self, v4);
  id v2 = (id)v8[5];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);

  return (UIBarButtonItem *)v2;
}

- (void)_enumerateAllGroups:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, uint64_t))a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = self->_fixedTrailingGroups;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v31 + 1) + 8 * v9++), 1);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  defaultActionFilter = (id *)self->_defaultActionFilter;
  if (defaultActionFilter)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __36___UIButtonBar__enumerateAllGroups___block_invoke;
    v29[3] = &unk_1E52DD9B8;
    long long v30 = v4;
    -[_UIButtonBarGroupOrderer enumerateSourceGroups:](defaultActionFilter, v29);
    id v11 = v30;
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = *(id *)&self->_minimumInterItemSpace;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          v4[2](v4, *(void *)(*((void *)&v25 + 1) + 8 * v15++), 0);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v36 count:16];
      }
      while (v13);
    }
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = self->_delegate;
  uint64_t v17 = [(_UIButtonBarDelegate *)v16 countByEnumeratingWithState:&v21 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        v4[2](v4, *(void *)(*((void *)&v21 + 1) + 8 * v20++), 1);
      }
      while (v18 != v20);
      uint64_t v18 = [(_UIButtonBarDelegate *)v16 countByEnumeratingWithState:&v21 objects:v35 count:16];
    }
    while (v18);
  }
}

- (void)_validateAllItems
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)&self->_minimumInterItemSpace;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_validateAllItems", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_itemCustomViewDidChange:(id)a3 fromView:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 buttonGroup];
  id v8 = [(_UIButtonBar *)self _layoutForGroup:v6];

  long long v7 = [v8 layoutForBarButtonItem:v5];

  [v7 setDirty:1];
  [(_UIButtonBar *)self _setNeedsVisualUpdate];
}

- (void)_itemDidChangeWidth:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 buttonGroup];
  uint64_t v6 = [(_UIButtonBar *)self _layoutForGroup:v5];

  long long v7 = [v6 layoutsForSpacerItem:v4];
  id v8 = v7;
  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) setDirty:1];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
  else
  {
    uint64_t v13 = [v6 layoutForBarButtonItem:v4];
    [v13 setDirty:1];
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- (void)_itemDidChangeSelectionState:(id)a3
{
  id v4 = a3;
  uint64_t v3 = _UIButtonBarButtonFromItem(v4);
  if (v3) {
    objc_msgSend(v3, "setSelected:", objc_msgSend(v4, "isSelected"));
  }
}

- (void)_itemDidChangeHiddenState:(id)a3
{
  id v4 = [a3 buttonGroup];
  id v5 = [(_UIButtonBar *)self _layoutForGroup:v4];
  [v5 setDirty:1];

  [(_UIButtonBar *)self _setNeedsVisualUpdate];
}

- (BOOL)_item:(id)a3 addSymbolEffect:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _UIButtonBarButtonFromItem(a3);
  uint64_t v12 = v11;
  if (v11) {
    [v11 addSymbolEffect:v9 options:v10 animated:v6];
  }

  return v12 == 0;
}

- (BOOL)_item:(id)a3 removeSymbolEffectOfType:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _UIButtonBarButtonFromItem(a3);
  uint64_t v12 = v11;
  if (v11) {
    [v11 removeSymbolEffectOfType:v9 options:v10 animated:v6];
  }

  return v12 == 0;
}

- (BOOL)_item:(id)a3 removeAllSymbolEffectsWithOptions:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = _UIButtonBarButtonFromItem(a3);
  id v9 = v8;
  if (v8) {
    [v8 removeAllSymbolEffectsWithOptions:v7 animated:v5];
  }

  return v9 == 0;
}

- (void)_item:(id)a3 applyContentTransition:(id)a4 options:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = _UIButtonBarButtonFromItem(a3);
  id v9 = v8;
  if (v8) {
    [v8 applyContentTransition:v10 options:v7];
  }
}

- (id)_overflowFallbackItem
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->_effectiveLayout;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        if ((objc_msgSend(v8, "spilled", (void)v14) & 1) != 0
          || ([v8 group], (id v9 = (unsigned char *)objc_claimAutoreleasedReturnValue()) != 0)
          && (char v10 = v9[24], v9, (v10 & 8) != 0))
        {
          id WeakRetained = objc_loadWeakRetained(&self->_viewUpdater);
          goto LABEL_16;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v11 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v5 = v11;
      id WeakRetained = 0;
    }
    while (v11);
  }
  else
  {
    id WeakRetained = 0;
  }
LABEL_16:

  return WeakRetained;
}

- (void)_groupDidUpdateRepresentative:(id)a3 fromRepresentative:(id)a4
{
  id v6 = a3;
  [a4 _relinquishOwnership:self];
  uint64_t v7 = [v6 representativeItem];
  [v7 _setViewOwner:self];

  id v8 = [(_UIButtonBar *)self _layoutForGroup:v6];

  [v8 setDirty:1];
  [(_UIButtonBar *)self _setNeedsVisualUpdate];
}

- (id)_groupOrdererGroups:(id)a3
{
  if (self->_defaultActionFilter == a3) {
    return *(id *)&self->_minimumInterItemSpace;
  }
  else {
    return 0;
  }
}

- (void)_groupOrdererDidUpdate:(id)a3
{
  if (self->_defaultActionFilter == a3) {
    [(_UIButtonBar *)self _setNeedsVisualUpdate];
  }
}

- (void)_invalidateAssistant:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popOverPresentingSourceItem);
  [WeakRetained invalidate];
}

- (CGRect)_preferredRegionRectForButton:(id)a3
{
  [a3 _buttonBarHitRect];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ((*(unsigned char *)&self->_buttonBarFlags & 0x10) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    long long v16 = 0;
    goto LABEL_14;
  }
  [v7 request:v8 locationInView:self->_stackView];
  -[UIView hitTest:withEvent:](self->_stackView, "hitTest:withEvent:", 0);
  id v9 = (_UIButtonBarStackView *)objc_claimAutoreleasedReturnValue();
  char v10 = v9;
  if (!v9) {
    goto LABEL_12;
  }
  if (v9 == self->_stackView) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![(UIView *)v10 isEnabled]) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UIView *)v10 bounds];
      long long v16 = objc_msgSend(v7, "createRegionFromRect:targetView:identifier:selected:", v10, @"com.apple.UIKit.UIButtonBar.UIButton", -[_UIButtonBarStackView isSelected](v10, "isSelected"), v17, v18, v19, v20);
      goto LABEL_13;
    }
LABEL_12:
    long long v16 = 0;
    goto LABEL_13;
  }
  uint64_t v11 = v10;
  [(_UIButtonBar *)self _preferredRegionRectForButton:v11];
  long long v16 = objc_msgSend(v7, "createRegionFromRect:targetView:identifier:selected:", v11, @"com.apple.UIKit.UIButtonBar._UIButtonBarButton", -[_UIButtonBarStackView isSelected](v11, "isSelected"), v12, v13, v14, v15);

LABEL_13:
LABEL_14:

  return v16;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a3;
  double v6 = (id *)a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = 0;
    goto LABEL_11;
  }
  id v7 = -[_UIPointerAssistantRegion targetView](v6);
  if (!v7) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v5 createStyleForButton:v7 shapeProvider:0];
      goto LABEL_8;
    }
LABEL_9:
    id v9 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = [v7 pointerInteraction:v5 styleForRegion:v6];
LABEL_8:
  id v9 = (void *)v8;
LABEL_10:

LABEL_11:
  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v9 = a5;
  double v6 = -[_UIPointerAssistantRegion targetView]((id *)a4);
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 visualProvider];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_7;
      }
      id v7 = [v6 _visualProvider];
    }
    uint64_t v8 = v7;
    [v7 pointerWillEnter:v9];
  }
LABEL_7:
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v9 = a5;
  double v6 = -[_UIPointerAssistantRegion targetView]((id *)a4);
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 visualProvider];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_7;
      }
      id v7 = [v6 _visualProvider];
    }
    uint64_t v8 = v7;
    [v7 pointerWillExit:v9];
  }
LABEL_7:
}

- (NSString)description
{
  double v3 = (void *)MEMORY[0x1E4F28E78];
  v15.receiver = self;
  v15.super_class = (Class)_UIButtonBar;
  double v4 = [(_UIButtonBar *)&v15 description];
  id v5 = [v3 stringWithFormat:@"%@ %@\n", v4, self->_stackView];

  if ((*(unsigned char *)&self->_buttonBarFlags & 2) != 0) {
    double v6 = @" needsAppearanceUpdate";
  }
  else {
    double v6 = &stru_1ED0E84C0;
  }
  [v5 appendFormat:@"metrics=%p layout=%p groupLayouts=%p views=%p guides=%p activeConstraints=%p minimumInterItemSpace=%.3f minimumInterItemSpaceAnchor=%p flexibleSpaceEqualSizeAnchor=%p %@\n", self->_layoutMetrics, self->_effectiveLayout, self->_groupLayoutMap, self->_layoutViews, self->_layoutGuides, self->_layoutActiveConstraints, self->_fixedLeadingGroups, self->_minimumInterItemSpaceConstraint, self->_flexibleSpaceEqualSizeAnchor, v6];
  doneItemAppearance = self->_doneItemAppearance;
  if (doneItemAppearance)
  {
    if ((*(unsigned char *)&self->_buttonBarFlags & 4) != 0) {
      uint64_t v8 = @"needsUpdate ";
    }
    else {
      uint64_t v8 = &stru_1ED0E84C0;
    }
    [v5 appendFormat:@"%@plainItemAppearance=%@\n", v8, doneItemAppearance];
  }
  assistant = self->_assistant;
  if (assistant)
  {
    if ((*(unsigned char *)&self->_buttonBarFlags & 8) != 0) {
      char v10 = @"needsUpdate ";
    }
    else {
      char v10 = &stru_1ED0E84C0;
    }
    [v5 appendFormat:@"%@doneItemAppearance=%@\n", v10, assistant];
  }
  if ([(NSArray *)self->_fixedTrailingGroups count])
  {
    uint64_t v11 = [(NSArray *)self->_fixedTrailingGroups componentsJoinedByString:@"\n"];
    [v5 appendFormat:@"fixedLeadingGroups={\n%@\n} ", v11];
  }
  if ([*(id *)&self->_minimumInterItemSpace count])
  {
    double v12 = [*(id *)&self->_minimumInterItemSpace componentsJoinedByString:@"\n"];
    [v5 appendFormat:@"barButtonGroups={\n%@\n} ", v12];
  }
  if ([(_UIButtonBarDelegate *)self->_delegate count])
  {
    double v13 = [(_UIButtonBarDelegate *)self->_delegate componentsJoinedByString:@"\n"];
    [v5 appendFormat:@"fixedTrailingGroups={\n%@\n} ", v13];
  }
  return (NSString *)v5;
}

- (double)minimumInterItemSpace
{
  return *(double *)&self->_fixedLeadingGroups;
}

- (NSArray)fixedLeadingGroups
{
  return self->_fixedTrailingGroups;
}

- (NSArray)fixedTrailingGroups
{
  return (NSArray *)self->_delegate;
}

- (double)targetLayoutWidth
{
  return *(double *)&self->_groupOrderer;
}

- (BOOL)itemsInGroupUseSameSize
{
  return (BOOL)self->_barButtonGroups;
}

- (BOOL)forceFixedSpacing
{
  return BYTE1(self->_barButtonGroups);
}

- (BOOL)supportsOverflow
{
  return BYTE2(self->_barButtonGroups);
}

- (_UIButtonBarGroupOrderer)groupOrderer
{
  return (_UIButtonBarGroupOrderer *)self->_defaultActionFilter;
}

- (BOOL)supportsAlwaysOverflowGroups
{
  return BYTE3(self->_barButtonGroups);
}

- (void)setSupportsAlwaysOverflowGroups:(BOOL)a3
{
  BYTE3(self->_barButtonGroups) = a3;
}

- (id)defaultActionFilter
{
  return self->__appearanceDelegate;
}

- (void)setDefaultActionFilter:(id)a3
{
}

- (_UIPointerInteractionAssistant)assistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popOverPresentingSourceItem);
  return (_UIPointerInteractionAssistant *)WeakRetained;
}

- (UIBarButtonItem)popOverPresentingSourceItem
{
  id WeakRetained = objc_loadWeakRetained(&self->_viewUpdater);
  return (UIBarButtonItem *)WeakRetained;
}

- (id)viewUpdater
{
  return self[1].super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_destroyWeak(&self->_viewUpdater);
  objc_destroyWeak((id *)&self->_popOverPresentingSourceItem);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_doneItemAppearance, 0);
  objc_destroyWeak((id *)&self->_plainItemAppearance);
  objc_storeStrong((id *)&self->__appearanceDelegate, 0);
  objc_storeStrong(&self->_defaultActionFilter, 0);
  objc_destroyWeak((id *)&self->_targetLayoutWidth);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_fixedTrailingGroups, 0);
  objc_storeStrong((id *)&self->_minimumInterItemSpace, 0);
  objc_storeStrong((id *)&self->_senderActionMap, 0);
  objc_storeStrong((id *)&self->_layoutActiveConstraints, 0);
  objc_storeStrong((id *)&self->_layoutGuides, 0);
  objc_storeStrong((id *)&self->_layoutViews, 0);
  objc_storeStrong((id *)&self->_groupLayoutMap, 0);
  objc_storeStrong((id *)&self->_effectiveLayout, 0);
  objc_storeStrong((id *)&self->_groupLayouts, 0);
  objc_storeStrong((id *)&self->_layoutMetrics, 0);
  objc_storeStrong((id *)&self->_centeringConstraint, 0);
  objc_storeStrong((id *)&self->_centeredView, 0);
  objc_storeStrong((id *)&self->_minimumInterItemSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_minimumInterItemSpaceAnchor, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceEqualSizeAnchor, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end