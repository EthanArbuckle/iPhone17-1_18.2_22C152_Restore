@interface RAPCollapsableHeaderFooterView
+ (void)toggleCollapseForTableView:(id)a3 AtSection:(int64_t)a4 withSelectedValue:(id)a5 withSelectedIndex:(int64_t)a6 withAllValues:(id)a7;
- (id)_initialConstraints;
- (void)_createSubviews;
- (void)layoutSubviews;
- (void)setShowAllButtonVisible:(BOOL)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation RAPCollapsableHeaderFooterView

- (void)_createSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)RAPCollapsableHeaderFooterView;
  [(RAPHeaderFooterView *)&v12 _createSubviews];
  v3 = +[UIButton buttonWithType:1];
  showAllButton = self->_showAllButton;
  self->_showAllButton = v3;

  v5 = self->_showAllButton;
  v6 = [(RAPCollapsableHeaderFooterView *)self contentView];
  v7 = [v6 tintColor];
  [(UIButton *)v5 setTitleColor:v7 forState:0];

  [(UIButton *)self->_showAllButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = self->_showAllButton;
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Show More" value:@"localized string not found" table:0];
  [(UIButton *)v8 setTitle:v10 forState:0];

  [(UIButton *)self->_showAllButton setAlpha:0.0];
  v11 = [(RAPCollapsableHeaderFooterView *)self contentView];
  [v11 addSubview:self->_showAllButton];
}

- (id)_initialConstraints
{
  v18.receiver = self;
  v18.super_class = (Class)RAPCollapsableHeaderFooterView;
  v3 = [(RAPHeaderFooterView *)&v18 _initialConstraints];
  v4 = [(RAPHeaderFooterView *)self titleLabel];
  v5 = [v4 trailingAnchor];
  v6 = [(UIButton *)self->_showAllButton leadingAnchor];
  v7 = [v5 constraintLessThanOrEqualToAnchor:v6];
  [v3 addObject:v7];

  v8 = _NSDictionaryOfVariableBindings(@"_showAllButton", self->_showAllButton, 0);
  v9 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_showAllButton]-|" options:0 metrics:0 views:v8];
  [v3 addObjectsFromArray:v9];

  v10 = [v4 lastBaselineAnchor];
  v11 = [(UIButton *)self->_showAllButton lastBaselineAnchor];
  objc_super v12 = [v10 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  v13 = [(UIButton *)self->_showAllButton heightAnchor];
  v14 = [v13 constraintGreaterThanOrEqualToConstant:44.0];
  [v3 addObject:v14];

  v15 = [(UIButton *)self->_showAllButton widthAnchor];
  v16 = [v15 constraintGreaterThanOrEqualToConstant:44.0];
  [v3 addObject:v16];

  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)RAPCollapsableHeaderFooterView;
  [(RAPHeaderFooterView *)&v5 layoutSubviews];
  v3 = +[RAPFontManager regularTitleFont];
  v4 = [(UIButton *)self->_showAllButton titleLabel];
  [v4 setFont:v3];
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = [(UIButton *)self->_showAllButton allTargets];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(UIButton *)self->_showAllButton removeTarget:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) action:0 forControlEvents:64];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(UIButton *)self->_showAllButton addTarget:v6 action:a4 forControlEvents:64];
}

- (void)setShowAllButtonVisible:(BOOL)a3
{
  if (a3) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  [(UIButton *)self->_showAllButton alpha];
  if (v5 != v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1008175C0;
    v6[3] = &unk_1012E69C0;
    v6[4] = self;
    *(double *)&v6[5] = v4;
    +[UIView animateWithDuration:v6 animations:0.3];
  }
}

+ (void)toggleCollapseForTableView:(id)a3 AtSection:(int64_t)a4 withSelectedValue:(id)a5 withSelectedIndex:(int64_t)a6 withAllValues:(id)a7
{
  id v28 = a3;
  id v11 = a5;
  id v12 = a7;
  if (v28)
  {
    if (v11)
    {
      id v13 = objc_alloc_init((Class)NSMutableArray);
    }
    else
    {
      uint64_t v14 = (uint64_t)[v12 count];
      id v13 = objc_alloc_init((Class)NSMutableArray);
      if (v14 >= 1)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (a6 != i)
          {
            v16 = +[NSIndexPath indexPathForRow:i inSection:a4];
            [v13 addObject:v16];
          }
        }
      }
    }
    id v17 = objc_alloc_init((Class)NSMutableArray);
    if (v11 && a6 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        v19 = +[NSIndexPath indexPathForRow:v18 inSection:a4];
        [v17 addObject:v19];

        ++v18;
      }
      while (a6 != v18);
    }
    id v26 = v12;
    if (v11) {
      id v20 = [v12 count];
    }
    else {
      id v20 = 0;
    }
    id v21 = objc_alloc_init((Class)NSMutableArray);
    v22 = v28;
    if ((uint64_t)v20 > a6)
    {
      uint64_t v23 = 0;
      int64_t v24 = a6 - (void)v20;
      do
      {
        if (v23)
        {
          v25 = +[NSIndexPath indexPathForRow:a6 + v23 inSection:a4];
          [v21 addObject:v25];

          v22 = v28;
        }
        ++v23;
      }
      while (v24 + v23);
    }
    [v22 beginUpdates:v26];
    [v28 deleteRowsAtIndexPaths:v17 withRowAnimation:0];
    [v28 deleteRowsAtIndexPaths:v21 withRowAnimation:3];
    [v28 insertRowsAtIndexPaths:v13 withRowAnimation:100];
    [v28 endUpdates];

    id v12 = v27;
  }
}

- (void).cxx_destruct
{
}

@end