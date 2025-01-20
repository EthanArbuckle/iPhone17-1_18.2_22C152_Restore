@interface _UIToolbarContentView
- (BOOL)compactMetrics;
- (NSDirectionalEdgeInsets)_directionalSafeArea;
- (NSDirectionalEdgeInsets)padding;
- (_UIBarButtonItemData)doneItemAppearance;
- (_UIBarButtonItemData)plainItemAppearance;
- (double)absorptionForItem:(id)a3;
- (double)defaultEdgeSpacing;
- (double)defaultTextPadding;
- (id)_computeEdgeAbsorptionForItems:(id)a3;
- (int64_t)barType;
- (int64_t)itemDistribution;
- (unint64_t)edgesPaddingBarButtonItem:(id)a3;
- (void)_ensureButtonBar;
- (void)_setButtonBarLeadingInset:(double)a3 trailingInset:(double)a4;
- (void)_updateThreeUpFlagsForItems:(id)a3;
- (void)layoutMarginsDidChange;
- (void)reloadWithItems:(id)a3;
- (void)setCompactMetrics:(BOOL)a3;
- (void)setDoneItemAppearance:(id)a3;
- (void)setItemDistribution:(int64_t)a3;
- (void)setPadding:(NSDirectionalEdgeInsets)a3;
- (void)setPlainItemAppearance:(id)a3;
- (void)tintColorDidChange;
- (void)updateConstraints;
- (void)updateContent;
- (void)updateWithItems:(id)a3 fromOldItems:(id)a4 animate:(BOOL)a5;
@end

@implementation _UIToolbarContentView

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_UIToolbarContentView;
  [(UIView *)&v3 updateConstraints];
  [(_UIToolbarContentView *)self updateContent];
}

- (double)defaultEdgeSpacing
{
  double result = 0.0;
  if (self->_itemDistribution != 3) {
    return self->_standardEdgeSpacing;
  }
  return result;
}

- (int64_t)barType
{
  return 2;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIToolbarContentView;
  [(UIView *)&v3 layoutMarginsDidChange];
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)tintColorDidChange
{
}

- (BOOL)compactMetrics
{
  return self->_compactMetrics;
}

- (double)absorptionForItem:(id)a3
{
  objc_super v3 = [(NSMapTable *)self->_absorptionTable objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)defaultTextPadding
{
  v2 = [(UIView *)self traitCollection];
  if ([v2 userInterfaceIdiom] == 5) {
    double v3 = 6.0;
  }
  else {
    double v3 = 8.0;
  }

  return v3;
}

- (unint64_t)edgesPaddingBarButtonItem:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (self->_itemDistribution)
  {
    unint64_t v6 = 0;
  }
  else if ([v4 _wantsThreeUp])
  {
    unint64_t v6 = 15;
  }
  else
  {
    v7 = [(_UIButtonBar *)self->_buttonBar barButtonGroups];
    v8 = [v7 objectAtIndexedSubscript:0];
    id v9 = [v8 barButtonItems];
    v10 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isSpaceItem", (void)v26) & 1) == 0) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    int v17 = *((_DWORD *)&self->super.super._viewFlags + 4);
    v18 = [v10 firstObject];

    BOOL v19 = (*(void *)&v17 & 0x80000) == 0;
    if ((*(void *)&v17 & 0x80000) != 0) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = 8;
    }
    uint64_t v21 = 7;
    if (v19) {
      uint64_t v21 = 13;
    }
    if (v18 == v5) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 15;
    }
    v23 = objc_msgSend(v10, "lastObject", (void)v26);

    if (v23 == v5) {
      uint64_t v24 = v20;
    }
    else {
      uint64_t v24 = 0;
    }
    unint64_t v6 = v24 ^ v22;
  }
  return v6;
}

- (void)updateContent
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  double top = self->_padding.top;
  double leading = self->_padding.leading;
  double bottom = self->_padding.bottom;
  double trailing = self->_padding.trailing;
  v7 = [(_UIButtonBar *)self->_buttonBar view];
  objc_msgSend(v7, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);

  v8 = [(_UIButtonBar *)self->_buttonBar barButtonGroups];
  id v9 = [v8 firstObject];
  v10 = -[UIBarButtonItemGroup _items](v9);

  if ([v10 count])
  {
    [(_UIToolbarContentView *)self _directionalSafeArea];
    double v12 = v11;
    double v14 = v13;
    v15 = [(UIView *)self superview];
    [v15 _contentMargin];
    double v17 = v16;

    double v18 = v12 + v17;
    BOOL v19 = [v10 firstObject];
    uint64_t v20 = [v10 lastObject];
    if ([v19 isSystemItem] && objc_msgSend(v19, "systemItem") == 6)
    {
      [v19 width];
      double v22 = v18 + v21;
      if (v18 + v21 < 0.0) {
        double v22 = 0.0;
      }
      if (v21 < 0.0) {
        double v18 = v22;
      }
    }
    double v23 = v14 + v17;
    if ([v20 isSystemItem] && objc_msgSend(v20, "systemItem") == 6)
    {
      [v20 width];
      double v25 = v23 + v24;
      if (v23 + v24 < 0.0) {
        double v25 = 0.0;
      }
      if (v24 < 0.0) {
        double v23 = v25;
      }
    }
    v44 = v19;
    long long v47 = 0u;
    long long v48 = 0u;
    if (v18 - v12 >= v23 - v14) {
      double v26 = v23 - v14;
    }
    else {
      double v26 = v18 - v12;
    }
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    id v27 = v10;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      id v30 = 0;
      id v31 = 0;
      uint64_t v32 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(v27);
          }
          v34 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (([v34 isSpaceItem] & 1) == 0)
          {
            if (!v30) {
              id v30 = v34;
            }
            id v35 = v34;

            id v31 = v35;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v29);
    }
    else
    {
      id v30 = 0;
      id v31 = 0;
    }

    if (v26 <= 0.0)
    {
      self->_double standardEdgeSpacing = 0.0;
      [(_UIToolbarContentView *)self _setButtonBarLeadingInset:v18 trailingInset:v23];
      v39 = v44;
LABEL_48:

      goto LABEL_49;
    }
    double standardEdgeSpacing = self->_standardEdgeSpacing;
    self->_double standardEdgeSpacing = v26;
    if ([v30 isCustomViewItem])
    {
      id v37 = [v27 firstObject];
      BOOL v38 = v30 != v37;
    }
    else
    {
      BOOL v38 = 1;
    }
    if ([v31 isCustomViewItem])
    {
      id v40 = [v27 lastObject];

      double v41 = 0.0;
      if (v38) {
        double v41 = v26;
      }
      double v42 = v18 - v41;
      if (v31 == v40) {
        goto LABEL_45;
      }
    }
    else
    {
      double v43 = 0.0;
      if (v38) {
        double v43 = v26;
      }
      double v42 = v18 - v43;
    }
    double v23 = v23 - v26;
LABEL_45:
    v39 = v44;
    [(_UIToolbarContentView *)self _setButtonBarLeadingInset:v42 trailingInset:v23];
    if (standardEdgeSpacing != v26)
    {
      [v30 _updateView];
      if (v30 != v31) {
        [v31 _updateView];
      }
    }
    goto LABEL_48;
  }
  self->_double standardEdgeSpacing = 0.0;
  [(_UIToolbarContentView *)self _setButtonBarLeadingInset:0.0 trailingInset:0.0];
LABEL_49:
}

- (void)_setButtonBarLeadingInset:(double)a3 trailingInset:(double)a4
{
  -[NSLayoutConstraint setConstant:](self->_buttonBarLeadingConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_buttonBarTrailingConstraint setConstant:a4];
  buttonBar = self->_buttonBar;
  -[_UIButtonBar setHitTestDirectionalInsets:](buttonBar, "setHitTestDirectionalInsets:", 0.0, -a3, 0.0, -a4);
}

- (NSDirectionalEdgeInsets)_directionalSafeArea
{
  [(UIView *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(UIView *)self _shouldReverseLayoutDirection];
  if (v11) {
    double v12 = v6;
  }
  else {
    double v12 = v10;
  }
  if (v11) {
    double v13 = v10;
  }
  else {
    double v13 = v6;
  }
  double v14 = v4;
  double v15 = v8;
  result.double trailing = v12;
  result.double bottom = v15;
  result.double leading = v13;
  result.double top = v14;
  return result;
}

- (id)_computeEdgeAbsorptionForItems:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id obj = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  double v4 = objc_opt_new();
  id v52 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if ([v10 isSpaceItem])
        {
          if ([v10 systemItem] != 6 || (objc_msgSend(v10, "width"), v11 != 0.0))
          {
            double v12 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", [v10 systemItem], 0, 0);
            if ([v10 systemItem] == 6)
            {
              [v10 width];
              -[UIBarButtonItem setWidth:](v12, "setWidth:");
            }
            [v4 addObject:v12];
          }
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v7);
  }

  double v13 = [(UIView *)self traitCollection];
  [v13 userInterfaceIdiom];

  if ([v4 count])
  {
    unint64_t v14 = 0;
    char v15 = 0;
    uint64_t v54 = 0;
    while (1)
    {
      double v16 = [v4 objectAtIndexedSubscript:v14];
      double v17 = v16;
      if ((v15 & 1) == 0 && [v16 systemItem] == 5) {
        break;
      }
      if (![v17 isCustomViewItem]) {
        goto LABEL_22;
      }
      ++v54;
LABEL_57:

      if ([v4 count] <= ++v14) {
        goto LABEL_60;
      }
    }
    char v15 = 1;
LABEL_22:
    if (v14)
    {
      double v18 = [v4 objectAtIndexedSubscript:(v14 - 1)];
    }
    else
    {
      double v18 = 0;
    }
    if ([v4 count] - 1 <= v14)
    {
      BOOL v19 = 0;
    }
    else
    {
      BOOL v19 = [v4 objectAtIndexedSubscript:v14 + 1];
    }
    id v20 = v17;
    id v21 = v18;
    id v22 = v19;
    double v23 = [v20 _imageForState:0 compact:0 type:0];
    double v24 = 0.0;
    if (!v23
      || ([v20 isCustomViewItem] & 1) != 0
      || ([v20 isSpaceItem] & 1) != 0
      || [v21 systemItem] == 5
      || [v22 systemItem] == 5
      || ([v23 size], double v26 = (34.0 - v25) * 0.5, v26 <= 0.0))
    {
LABEL_56:

      id v40 = [NSNumber numberWithDouble:v24];
      [obj setObject:v40 forKey:v20];

      goto LABEL_57;
    }
    uint64_t v27 = [v21 _viewOwner];
    uint64_t v50 = [v20 _viewOwner];
    long long v48 = [v22 _viewOwner];
    [v21 _setViewOwner:0];
    [v20 _setViewOwner:0];
    [v22 _setViewOwner:0];
    v49 = (void *)v27;
    if ([v21 isSpaceItem] && objc_msgSend(v22, "isSpaceItem"))
    {
      [v22 width];
      double v29 = v28 * 0.5;
      [v21 width];
      double v31 = v30 * 0.5;
      if (v29 < v31) {
        double v31 = v29;
      }
      if (v31 >= v26) {
        double v24 = v26;
      }
      else {
        double v24 = v31;
      }
      [v21 width];
      [v21 setWidth:v32 - v24];
    }
    else
    {
      if (v21 || ![v22 isSpaceItem])
      {
        int v36 = [v21 isSpaceItem];
        if (v22 || !v36) {
          goto LABEL_55;
        }
        [v21 width];
        double v38 = v37 * 0.5;
        if (v38 >= v26) {
          double v24 = v26;
        }
        else {
          double v24 = v38;
        }
        id v35 = v21;
LABEL_54:
        [v35 width];
        [v35 setWidth:v39 - v24];
        uint64_t v27 = (uint64_t)v49;
LABEL_55:
        [v21 _setViewOwner:v27];
        [v20 _setViewOwner:v50];
        [v22 _setViewOwner:v48];

        goto LABEL_56;
      }
      [v22 width];
      double v34 = v33 * 0.5;
      if (v34 >= v26) {
        double v24 = v26;
      }
      else {
        double v24 = v34;
      }
    }
    id v35 = v22;
    goto LABEL_54;
  }
  uint64_t v54 = 0;
  char v15 = 0;
LABEL_60:
  if ([v4 count])
  {
    unint64_t v41 = 0;
    do
    {
      double v42 = [v4 objectAtIndexedSubscript:v41];
      if ([v42 systemItem] == 6)
      {
        double v43 = [v4 objectAtIndexedSubscript:v41];
        [v43 width];
        double v45 = v44;

        if (v45 == 0.0) {
          [v52 addIndex:v41];
        }
      }
      else
      {
      }
      ++v41;
    }
    while ([v4 count] > v41);
  }
  [v4 removeObjectsAtIndexes:v52];
  objc_storeStrong((id *)&self->_absorptionTable, obj);
  if ((v15 & 1) == 0 && v54 != [v4 count])
  {
    long long v46 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:5 target:0 action:0];
    [v4 addObject:v46];
  }
  return v4;
}

- (void)reloadWithItems:(id)a3
{
  id v6 = [(_UIToolbarContentView *)self _computeEdgeAbsorptionForItems:a3];
  double v4 = [(_UIButtonBar *)self->_buttonBar barButtonGroups];
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 setBarButtonItems:v6];
}

- (void)_ensureButtonBar
{
  v50[1] = *MEMORY[0x1E4F143B8];
  if (!self->_buttonBar)
  {
    id v3 = objc_alloc_init(_UIButtonBar);
    buttonBar = self->_buttonBar;
    self->_buttonBar = v3;

    [(_UIButtonBar *)self->_buttonBar set_appearanceDelegate:self];
    [(_UIButtonBar *)self->_buttonBar setAllowsViewWrappers:1];
    [(_UIButtonBar *)self->_buttonBar setItemDistribution:self->_itemDistribution];
    id v5 = [(UIView *)self traitCollection];
    id v6 = +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", [v5 userInterfaceIdiom]);
    objc_opt_class();
    uint64_t v7 = _UIButtonBarButtonMakerForVisualProvider();
    [(_UIButtonBar *)self->_buttonBar setViewUpdater:v7];

    [(_UIButtonBar *)self->_buttonBar setMinimumInterItemSpace:0.0];
    uint64_t v8 = [UIBarButtonItemGroup alloc];
    long long v48 = [(UIBarButtonItemGroup *)v8 initWithBarButtonItems:MEMORY[0x1E4F1CBF0] representativeItem:0];
    v50[0] = v48;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    [(_UIButtonBar *)self->_buttonBar setBarButtonGroups:v9];

    double top = self->_padding.top;
    double leading = self->_padding.leading;
    double bottom = self->_padding.bottom;
    double trailing = self->_padding.trailing;
    unint64_t v14 = [(_UIButtonBar *)self->_buttonBar view];
    objc_msgSend(v14, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);

    char v15 = objc_alloc_init(_UIPointerInteractionAssistant);
    assistant = self->_assistant;
    self->_assistant = v15;

    [(UIView *)self addInteraction:self->_assistant];
    double v17 = self->_assistant;
    double v18 = [(_UIButtonBar *)self->_buttonBar assistantView];
    [(_UIPointerInteractionAssistant *)v17 setAssistedView:v18 identifier:@"ContentView.buttonBar"];

    [(_UIButtonBar *)self->_buttonBar setAssistant:self->_assistant];
    BOOL v19 = [(_UIButtonBar *)self->_buttonBar view];
    [(UIView *)self insertSubview:v19 atIndex:0];
    id v20 = [(_UIPointerInteractionAssistant *)self->_assistant previewContainer];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self insertSubview:v20 atIndex:1];
    id v21 = [v19 leadingAnchor];
    id v22 = [(UIView *)self leadingAnchor];
    double v23 = [v21 constraintEqualToAnchor:v22];
    buttonBarLeadingConstraint = self->_buttonBarLeadingConstraint;
    self->_buttonBarLeadingConstraint = v23;

    double v25 = [(UIView *)self trailingAnchor];
    double v26 = [v19 trailingAnchor];
    uint64_t v27 = [v25 constraintEqualToAnchor:v26];
    buttonBarTrailingConstraint = self->_buttonBarTrailingConstraint;
    self->_buttonBarTrailingConstraint = v27;

    unint64_t v41 = (void *)MEMORY[0x1E4F5B268];
    double v29 = self->_buttonBarTrailingConstraint;
    v49[0] = self->_buttonBarLeadingConstraint;
    v49[1] = v29;
    long long v47 = [v19 topAnchor];
    long long v46 = [(UIView *)self topAnchor];
    double v45 = [v47 constraintEqualToAnchor:v46];
    v49[2] = v45;
    double v44 = [v19 bottomAnchor];
    double v43 = [(UIView *)self bottomAnchor];
    double v42 = [v44 constraintEqualToAnchor:v43];
    v49[3] = v42;
    id v40 = [v20 leadingAnchor];
    double v39 = [v19 leadingAnchor];
    double v38 = [v40 constraintEqualToAnchor:v39];
    v49[4] = v38;
    double v30 = [v20 topAnchor];
    double v31 = [v19 topAnchor];
    double v32 = [v30 constraintEqualToAnchor:v31];
    v49[5] = v32;
    double v33 = [v20 widthAnchor];
    double v34 = [v33 constraintEqualToConstant:0.0];
    v49[6] = v34;
    id v35 = [v20 heightAnchor];
    int v36 = [v35 constraintEqualToConstant:0.0];
    v49[7] = v36;
    double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:8];
    [v41 activateConstraints:v37];
  }
}

- (void)setItemDistribution:(int64_t)a3
{
  self->_itemDistribution = a3;
  -[_UIButtonBar setItemDistribution:](self->_buttonBar, "setItemDistribution:");
}

- (void)setCompactMetrics:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_compactMetrics != a3)
  {
    self->_compactMetrics = a3;
    id v3 = [(_UIButtonBar *)self->_buttonBar barButtonGroups];
    double v4 = [v3 firstObject];
    id v5 = -[UIBarButtonItemGroup _items](v4);

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_updateView", (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setPlainItemAppearance:(id)a3
{
  double v4 = (_UIBarButtonItemData *)[a3 copy];
  plainItemAppearance = self->_plainItemAppearance;
  self->_plainItemAppearance = v4;

  id v6 = self->_plainItemAppearance;
  buttonBar = self->_buttonBar;
  [(_UIButtonBar *)buttonBar setPlainItemAppearance:v6];
}

- (void)setDoneItemAppearance:(id)a3
{
  double v4 = (_UIBarButtonItemData *)[a3 copy];
  doneItemAppearance = self->_doneItemAppearance;
  self->_doneItemAppearance = v4;

  id v6 = self->_doneItemAppearance;
  buttonBar = self->_buttonBar;
  [(_UIButtonBar *)buttonBar setDoneItemAppearance:v6];
}

- (void)updateWithItems:(id)a3 fromOldItems:(id)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5
    && ([(_UIButtonBar *)self->_buttonBar view],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 window],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    long long v12 = [(_UIButtonBar *)self->_buttonBar view];
    long long v13 = [v12 snapshotViewAfterScreenUpdates:0];
  }
  else
  {
    long long v13 = 0;
  }
  long long v14 = [(_UIToolbarContentView *)self _computeEdgeAbsorptionForItems:v8];

  [(_UIToolbarContentView *)self _updateThreeUpFlagsForItems:v14];
  [(_UIToolbarContentView *)self _ensureButtonBar];
  char v15 = [(_UIButtonBar *)self->_buttonBar barButtonGroups];
  uint64_t v16 = [v15 objectAtIndexedSubscript:0];
  [v16 setBarButtonItems:v14];

  [(_UIToolbarContentView *)self updateContent];
  double v17 = [(_UIButtonBar *)self->_buttonBar view];
  double v18 = v17;
  if (v13)
  {
    [v17 frame];
    objc_msgSend(v13, "setFrame:");

    [(UIView *)self addSubview:v13];
    BOOL v19 = [(_UIButtonBar *)self->_buttonBar view];
    [v19 setAlpha:0.0];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62___UIToolbarContentView_updateWithItems_fromOldItems_animate___block_invoke;
    v22[3] = &unk_1E52D9F98;
    v22[4] = self;
    id v23 = v13;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62___UIToolbarContentView_updateWithItems_fromOldItems_animate___block_invoke_2;
    v20[3] = &unk_1E52DC3A0;
    id v21 = v23;
    +[UIView animateWithDuration:2 delay:v22 options:v20 animations:0.2 completion:0.0];
  }
  else
  {
    [v17 setAlpha:1.0];
  }
}

- (void)_updateThreeUpFlagsForItems:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v5);
        }
        long long v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v13 _setWantsThreeUp:0];
        if ([v13 isSpaceItem])
        {
          if ([v13 systemItem] == 5) {
            [v4 addObject:v13];
          }
          ++v9;
        }
        else if ([v13 _flexible])
        {
          ++v10;
        }
        else if (([v13 isCustomViewItem] & 1) == 0)
        {
          uint64_t v14 = [v13 title];
          if (v14)
          {
            char v15 = (void *)v14;
            uint64_t v16 = [v13 hasImage] ^ 1;

            v8 += v16;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }

  if ([v4 count] == 2 && v10 == 0 && v9 + v8 < (unint64_t)objc_msgSend(v5, "count"))
  {
    double v18 = [v4 objectAtIndexedSubscript:0];
    uint64_t v19 = [v5 indexOfObjectIdenticalTo:v18];

    id v20 = [v4 objectAtIndexedSubscript:1];
    uint64_t v21 = [v5 indexOfObjectIdenticalTo:v20];

    if (v21 - v19 == 2)
    {
      id v22 = [v5 objectAtIndexedSubscript:v19 + 1];
      [v22 _setWantsThreeUp:1];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v23 = v4;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v29 != v26) {
              objc_enumerationMutation(v23);
            }
            objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "_setWantsThreeUp:", 1, (void)v28);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v25);
      }
    }
  }
}

- (NSDirectionalEdgeInsets)padding
{
  double top = self->_padding.top;
  double leading = self->_padding.leading;
  double bottom = self->_padding.bottom;
  double trailing = self->_padding.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (int64_t)itemDistribution
{
  return self->_itemDistribution;
}

- (_UIBarButtonItemData)plainItemAppearance
{
  return self->_plainItemAppearance;
}

- (_UIBarButtonItemData)doneItemAppearance
{
  return self->_doneItemAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneItemAppearance, 0);
  objc_storeStrong((id *)&self->_plainItemAppearance, 0);
  objc_storeStrong((id *)&self->_absorptionTable, 0);
  objc_storeStrong((id *)&self->_buttonBarTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonBarLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_assistant, 0);
  objc_storeStrong((id *)&self->_buttonBar, 0);
}

@end