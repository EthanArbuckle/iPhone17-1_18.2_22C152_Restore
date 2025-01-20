@interface TwoLinesOutlineCell
- (TwoLinesOutlineCell)initWithFrame:(CGRect)a3;
- (TwoLinesOutlineCellModel)cellModel;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_accessoryButtonTapped:(id)a3 accessoryModel:(id)a4;
- (void)_invalidateConstraints;
- (void)_toggleDisclosureAccessory:(id)a3;
- (void)_updateAccessoryFromModel;
- (void)_updateAccessoryVisibility;
- (void)_updateActionViewFromModel;
- (void)_updateConstraints;
- (void)_updateDisclosureAccessoryInteraction;
- (void)_updateFromModel;
- (void)_updateTextColors;
- (void)setCellModel:(id)a3;
- (void)setHovering:(BOOL)a3;
- (void)setUseLightForegroundColors:(BOOL)a3;
@end

@implementation TwoLinesOutlineCell

- (TwoLinesOutlineCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TwoLinesOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[TwoLinesContentView initWithFrame:]([TwoLinesContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    twoLinesContentView = v3->_twoLinesContentView;
    v3->_twoLinesContentView = v4;

    [(TwoLinesContentView *)v3->_twoLinesContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(TwoLinesOutlineCell *)v3 contentView];
    [v6 addSubview:v3->_twoLinesContentView];

    [(TwoLinesOutlineCell *)v3 _invalidateConstraints];
  }
  return v3;
}

- (void)_updateConstraints
{
  if (!self->_constraints)
  {
    v3 = [(TwoLinesOutlineCellActionView *)self->_actionView superview];

    v4 = [(TwoLinesContentView *)self->_twoLinesContentView topAnchor];
    v43 = [(TwoLinesOutlineCell *)self contentView];
    [v43 topAnchor];
    v42 = v47 = v4;
    v50 = [v4 constraintEqualToAnchor:];
    if (v3)
    {
      v52[0] = v50;
      v36 = [(TwoLinesContentView *)self->_twoLinesContentView leadingAnchor];
      v38 = [(TwoLinesOutlineCell *)self contentView];
      v37 = [v38 layoutMarginsGuide];
      v49 = [v37 leadingAnchor];
      v48 = [v36 constraintEqualToAnchor:];
      v52[1] = v48;
      v5 = [(TwoLinesContentView *)self->_twoLinesContentView trailingAnchor];
      v45 = [(TwoLinesOutlineCell *)self contentView];
      v44 = [v45 layoutMarginsGuide];
      v39 = [v44 trailingAnchor];
      v46 = v5;
      uint64_t v27 = [v5 constraintEqualToAnchor:v39];
      v52[2] = v27;
      v32 = [(TwoLinesOutlineCellActionView *)self->_actionView topAnchor];
      v6 = [(TwoLinesContentView *)self->_twoLinesContentView bottomAnchor];
      v41 = [v32 constraintEqualToAnchor:v6 constant:7.0];
      v52[3] = v41;
      v7 = [(TwoLinesOutlineCellActionView *)self->_actionView leadingAnchor];
      v35 = [(TwoLinesOutlineCell *)self contentView];
      v34 = [(NSArray *)v35 layoutMarginsGuide];
      v33 = [v34 leadingAnchor];
      v40 = v7;
      v31 = [v7 constraintEqualToAnchor:v33 constant:32.0];
      v52[4] = v31;
      v29 = [(TwoLinesOutlineCellActionView *)self->_actionView trailingAnchor];
      v30 = [(TwoLinesOutlineCell *)self contentView];
      v28 = [v30 layoutMarginsGuide];
      objc_super v8 = [v28 trailingAnchor];
      v9 = [v29 constraintEqualToAnchor:v8];
      v52[5] = v9;
      v10 = [(TwoLinesOutlineCellActionView *)self->_actionView bottomAnchor];
      v11 = [(TwoLinesOutlineCell *)self contentView];
      v12 = [v11 bottomAnchor];
      LODWORD(v13) = 1112276992;
      v14 = [v10 constraintEqualToAnchor:v12 constant:-7.0 priority:v13];
      v52[6] = v14;
      v15 = +[NSArray arrayWithObjects:v52 count:7];
      constraints = self->_constraints;
      self->_constraints = v15;

      v17 = (void *)v27;
      v18 = v32;

      v19 = v38;
      v20 = v37;

      v21 = v36;
      v22 = v35;
    }
    else
    {
      v51[0] = v50;
      v21 = [(TwoLinesContentView *)self->_twoLinesContentView leadingAnchor];
      v19 = [(TwoLinesOutlineCell *)self contentView];
      v20 = [v19 layoutMarginsGuide];
      v49 = [v20 leadingAnchor];
      v48 = [v21 constraintEqualToAnchor:];
      v51[1] = v48;
      v23 = [(TwoLinesContentView *)self->_twoLinesContentView trailingAnchor];
      v45 = [(TwoLinesOutlineCell *)self contentView];
      v44 = [v45 layoutMarginsGuide];
      [v44 trailingAnchor];
      v39 = v46 = v23;
      v17 = [v23 constraintEqualToAnchor:v39];
      v51[2] = v17;
      v18 = [(TwoLinesContentView *)self->_twoLinesContentView bottomAnchor];
      v6 = [(TwoLinesOutlineCell *)self contentView];
      uint64_t v24 = [v6 bottomAnchor];
      LODWORD(v25) = 1112276992;
      v41 = (void *)v24;
      v40 = [v18 constraintEqualToAnchor:0.0 constant:v25 priority:];
      v51[3] = v40;
      v26 = +[NSArray arrayWithObjects:v51 count:4];
      v22 = self->_constraints;
      self->_constraints = v26;
    }

    +[NSLayoutConstraint activateConstraints:self->_constraints];
  }
}

- (void)_invalidateConstraints
{
  if (self->_constraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    constraints = self->_constraints;
    self->_constraints = 0;
  }

  [(TwoLinesOutlineCell *)self _updateConstraints];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TwoLinesOutlineCell;
  v5 = [(TwoLinesOutlineCell *)&v10 preferredLayoutAttributesFittingAttributes:v4];
  v6 = [(TwoLinesOutlineCellActionView *)self->_actionView superview];

  if (v6)
  {
    [v5 frame];
    -[TwoLinesOutlineCell setFrame:](self, "setFrame:");
    [(TwoLinesOutlineCell *)self layoutIfNeeded];
    v9.receiver = self;
    v9.super_class = (Class)TwoLinesOutlineCell;
    uint64_t v7 = [(TwoLinesOutlineCell *)&v9 preferredLayoutAttributesFittingAttributes:v4];

    v5 = (void *)v7;
  }

  return v5;
}

- (void)setHovering:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TwoLinesOutlineCell;
  [(SidebarOutlineCell *)&v4 setHovering:a3];
  [(TwoLinesOutlineCell *)self _updateAccessoryVisibility];
}

- (void)setUseLightForegroundColors:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TwoLinesOutlineCell;
  [(SidebarOutlineCell *)&v4 setUseLightForegroundColors:a3];
  [(TwoLinesOutlineCell *)self _updateTextColors];
}

- (void)setCellModel:(id)a3
{
  v5 = (TwoLinesOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    objc_super v8 = v5;
    unsigned __int8 v7 = -[TwoLinesOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      [(TwoLinesOutlineCell *)self _updateFromModel];
      v6 = v8;
    }
  }
}

- (void)_updateFromModel
{
  v3 = [(TwoLinesOutlineCellModel *)self->_cellModel backgroundModel];
  [(SidebarOutlineCell *)self setBackgroundModel:v3];

  objc_super v4 = [(TwoLinesOutlineCellModel *)self->_cellModel contentModel];
  [(TwoLinesContentView *)self->_twoLinesContentView setViewModel:v4];

  v5 = [(SidebarOutlineCell *)self axSectionIdentifier];
  if ([v5 length])
  {
    CFStringRef v6 = [(SidebarOutlineCell *)self axSectionIdentifier];
  }
  else
  {
    CFStringRef v6 = &stru_101324E70;
  }
  v12 = (__CFString *)v6;

  unsigned __int8 v7 = [(TwoLinesContentView *)self->_twoLinesContentView viewModel];
  objc_super v8 = [v7 axIdentifier];
  if ([v8 length])
  {
    objc_super v9 = [(TwoLinesContentView *)self->_twoLinesContentView viewModel];
    objc_super v10 = [v9 axIdentifier];
  }
  else
  {
    objc_super v10 = @"TwoLinesOutlineCell";
  }

  v11 = [(__CFString *)v12 stringByAppendingString:v10];
  [(TwoLinesOutlineCell *)self setAccessibilityIdentifier:v11];

  [(TwoLinesOutlineCell *)self _updateAccessoryFromModel];
  [(TwoLinesOutlineCell *)self _updateActionViewFromModel];
  [(TwoLinesOutlineCell *)self _updateTextColors];
}

- (void)_updateTextColors
{
  [(TwoLinesContentView *)self->_twoLinesContentView setIsParentCellSelected:[(SidebarOutlineCell *)self useLightForegroundColors]];

  [(TwoLinesOutlineCell *)self _updateAccessoryVisibility];
}

- (void)_updateAccessoryFromModel
{
  obj = self->_accessoryModels;
  v3 = [(TwoLinesOutlineCellModel *)self->_cellModel accessoryModels];
  if (obj == v3)
  {
  }
  else
  {
    unsigned __int8 v4 = [(NSArray *)obj isEqual:v3];

    if ((v4 & 1) == 0)
    {
      v5 = [(TwoLinesOutlineCellModel *)self->_cellModel accessoryModels];
      accessoryModels = self->_accessoryModels;
      self->_accessoryModels = v5;

      unsigned __int8 v7 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      obja = self->_accessoryModels;
      id v8 = [(NSArray *)obja countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v21;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(obja);
            }
            v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            objc_initWeak(&location, self);
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_1008C3B5C;
            v17[3] = &unk_1012E6368;
            objc_copyWeak(&v18, &location);
            v17[4] = v11;
            v12 = +[UIAction actionWithHandler:v17];
            double v13 = [v11 createAccessoryConfigurationWithAction:v12];

            [(NSArray *)v7 addObject:v13];
            objc_destroyWeak(&v18);
            objc_destroyWeak(&location);
          }
          id v8 = [(NSArray *)obja countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v8);
      }

      accessoryConfigurations = self->_accessoryConfigurations;
      self->_accessoryConfigurations = v7;

      [(TwoLinesOutlineCell *)self _updateAccessoryVisibility];
      [(TwoLinesOutlineCell *)self _updateDisclosureAccessoryInteraction];
    }
  }
}

- (void)_updateAccessoryVisibility
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  accessoryModels = self->_accessoryModels;
  CFStringRef v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_1008C3C9C;
  uint64_t v9 = &unk_1012FF770;
  objc_super v10 = self;
  id v11 = v3;
  id v5 = v3;
  [(NSArray *)accessoryModels enumerateObjectsUsingBlock:&v6];
  -[TwoLinesOutlineCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", v5, v6, v7, v8, v9, v10);
}

- (void)_updateDisclosureAccessoryInteraction
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = self->_accessoryModels;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "accessoryType", (void)v13) == (id)2)
        {

          doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
          if (!doubleTapGestureRecognizer)
          {
            id v11 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_toggleDisclosureAccessory:"];
            v12 = self->_doubleTapGestureRecognizer;
            self->_doubleTapGestureRecognizer = v11;

            [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
            [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setDelaysTouchesEnded:0];
            [(TwoLinesOutlineCell *)self addGestureRecognizer:self->_doubleTapGestureRecognizer];
            doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
          }
          uint64_t v10 = 1;
          goto LABEL_14;
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
  uint64_t v10 = 0;
LABEL_14:
  -[UITapGestureRecognizer setEnabled:](doubleTapGestureRecognizer, "setEnabled:", v10, (void)v13);
}

- (void)_toggleDisclosureAccessory:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_accessoryModels;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "accessoryType", (void)v12) == (id)2)
        {
          id v11 = [v10 delegate];
          [v11 twoLinesOutlineCell:self accessoryViewTapped:v4 accessoryModel:v10];
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_accessoryButtonTapped:(id)a3 accessoryModel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 delegate];
  [v8 twoLinesOutlineCell:self accessoryViewTapped:v7 accessoryModel:v6];
}

- (void)_updateActionViewFromModel
{
  id v3 = [(TwoLinesOutlineCellModel *)self->_cellModel actionModel];

  actionView = self->_actionView;
  if (v3)
  {
    if (!actionView)
    {
      id v5 = -[TwoLinesOutlineCellActionView initWithFrame:twoLinesOutlineCell:]([TwoLinesOutlineCellActionView alloc], "initWithFrame:twoLinesOutlineCell:", self, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      id v6 = self->_actionView;
      self->_actionView = v5;

      [(TwoLinesOutlineCellActionView *)self->_actionView setTranslatesAutoresizingMaskIntoConstraints:0];
      actionView = self->_actionView;
    }
    id v7 = [(TwoLinesOutlineCellActionView *)actionView superview];

    if (!v7)
    {
      id v8 = [(TwoLinesOutlineCell *)self contentView];
      [v8 addSubview:self->_actionView];

      [(TwoLinesOutlineCell *)self _invalidateConstraints];
    }
    id v10 = [(TwoLinesOutlineCellModel *)self->_cellModel actionModel];
    [(TwoLinesOutlineCellActionView *)self->_actionView setViewModel:v10];
  }
  else
  {
    uint64_t v9 = [(TwoLinesOutlineCellActionView *)actionView superview];

    if (v9)
    {
      [(TwoLinesOutlineCellActionView *)self->_actionView removeFromSuperview];
      [(TwoLinesOutlineCell *)self _invalidateConstraints];
    }
  }
}

- (TwoLinesOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_accessoryConfigurations, 0);
  objc_storeStrong((id *)&self->_accessoryModels, 0);

  objc_storeStrong((id *)&self->_twoLinesContentView, 0);
}

@end