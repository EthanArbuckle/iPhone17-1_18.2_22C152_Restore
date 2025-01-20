@interface MacFooterView
- (BOOL)rightButtonEnabled;
- (MacFooterView)initWithNoBlurRightSideButtonsOfType:(int64_t)a3;
- (MacFooterView)initWithRightButtonType:(int64_t)a3;
- (MacFooterView)initWithRightButtonType:(int64_t)a3 hasBlur:(BOOL)a4;
- (MacFooterViewDelegate)delegate;
- (UIButton)rightButton;
- (UIView)accessoryView;
- (id)_basicButtonSetupAddedToContentView:(id)a3;
- (void)_backButtonTapped:(id)a3;
- (void)_leftButtonTapped:(id)a3;
- (void)_rightButtonTapped:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRightButton:(id)a3;
- (void)setRightButtonEnabled:(BOOL)a3;
- (void)submissionFinishedWithError:(id)a3;
- (void)willBeginSubmissionWithProgress:(id)a3;
@end

@implementation MacFooterView

- (MacFooterView)initWithRightButtonType:(int64_t)a3
{
  return [(MacFooterView *)self initWithRightButtonType:a3 hasBlur:1];
}

- (MacFooterView)initWithNoBlurRightSideButtonsOfType:(int64_t)a3
{
  return [(MacFooterView *)self initWithRightButtonType:a3 hasBlur:0];
}

- (MacFooterView)initWithRightButtonType:(int64_t)a3 hasBlur:(BOOL)a4
{
  BOOL v4 = a4;
  char v5 = a3;
  v62.receiver = self;
  v62.super_class = (Class)MacFooterView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result = -[MacFooterView initWithFrame:](&v62, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (!result) {
    return result;
  }
  v56 = result;
  v10 = result;
  v11 = v10;
  if (v4)
  {
    v12 = +[MapsTheme visualEffectViewAllowingBlur:1];
    [(MacFooterView *)v11 addSubview:v12];
    v57 = v12;
    v13 = [v12 contentView];
  }
  else
  {
    v57 = 0;
    v13 = v10;
  }
  v14 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  accessoryView = v11->_accessoryView;
  v11->_accessoryView = v14;

  [(UIView *)v11->_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v16) = 1132068864;
  [(UIView *)v11->_accessoryView setContentHuggingPriority:0 forAxis:v16];
  LODWORD(v17) = 1132068864;
  [(UIView *)v11->_accessoryView setContentCompressionResistancePriority:0 forAxis:v17];
  [v13 addSubview:v11->_accessoryView];
  id v18 = objc_alloc_init((Class)NSMutableArray);
  if ((v5 & 0x1D) != 0)
  {
    v19 = [(MacFooterView *)v11 _basicButtonSetupAddedToContentView:v13];
    [v19 setRole:1];
    [(MacFooterView *)v11 setRightButton:v19];
    if (v5)
    {
      v20 = +[NSBundle mainBundle];
      v21 = v20;
      CFStringRef v22 = @"Add";
    }
    else if ((v5 & 4) != 0)
    {
      v20 = +[NSBundle mainBundle];
      v21 = v20;
      CFStringRef v22 = @"Submit";
    }
    else
    {
      if ((v5 & 0x18) == 0)
      {
LABEL_13:
        [v19 addTarget:v11 action:"_rightButtonTapped:" forControlEvents:64];
        [v18 addObject:v19];

        goto LABEL_14;
      }
      v20 = +[NSBundle mainBundle];
      v21 = v20;
      CFStringRef v22 = @"Done";
    }
    v23 = [v20 localizedStringForKey:v22 value:@"localized string not found" table:0];
    [v19 setTitle:v23 forState:0];

    goto LABEL_13;
  }
LABEL_14:
  if ((v5 & 2) != 0)
  {
    v24 = [(MacFooterView *)v11 _basicButtonSetupAddedToContentView:v13];
    v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"Back" value:@"localized string not found" table:0];
    [v24 setTitle:v26 forState:0];
    v27 = &selRef__backButtonTapped_;
    goto LABEL_18;
  }
  if ((v5 & 8) == 0)
  {
    v24 = [(MacFooterView *)v11 _basicButtonSetupAddedToContentView:v13];
    v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
    [v24 setTitle:v26 forState:0];
    v27 = &selRef__leftButtonTapped_;
LABEL_18:

    [v24 addTarget:v11 action:*v27 forControlEvents:64];
    [v18 addObject:v24];
  }
  id v28 = objc_alloc((Class)MUSizeLayout);
  +[MUSizeLayout useIntrinsicContentSize];
  id v29 = [v28 initWithItem:v11];
  id v30 = objc_alloc((Class)MUSizeLayout);
  v31 = v11->_accessoryView;
  +[MUSizeLayout useIntrinsicContentSize];
  id v32 = [v30 initWithItem:v31];
  v55 = v13;
  id v33 = [objc_alloc((Class)MUStackLayout) initWithContainer:v13 axis:0];
  [v33 addArrangedLayoutItem:v11->_accessoryView];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v34 = [v18 reverseObjectEnumerator];
  id v35 = [v34 countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v59;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v59 != v37) {
          objc_enumerationMutation(v34);
        }
        [v33 addArrangedLayoutItem:*(void *)(*((void *)&v58 + 1) + 8 * i)];
      }
      id v36 = [v34 countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v36);
  }

  [v33 setDistribution:0];
  [v33 setDistributionBoundsContent:1];
  [v33 setAlignment:2];
  [v33 setInsets:0.0, 16.0, 0.0, 16.0];
  [v33 setSpacing:20.0];
  v54 = v29;
  v64[0] = v29;
  v64[1] = v32;
  v64[2] = v33;
  v39 = +[NSArray arrayWithObjects:v64 count:3];
  v40 = +[NSMutableArray arrayWithArray:v39];

  v41 = v57;
  if (v57)
  {
    id v42 = [objc_alloc((Class)MUEdgeLayout) initWithItem:v57 container:v11];
    [v40 addObject:v42];
  }
  v43 = v18;
  if ([v18 count] == (id)2)
  {
    v53 = [v18 objectAtIndexedSubscript:0];
    v44 = [v53 widthAnchor];
    v45 = [v18 objectAtIndexedSubscript:1];
    v46 = [v45 widthAnchor];
    LODWORD(v47) = 1140457472;
    [v44 constraintEqualToAnchor:v46 constant:0.0 priority:v47];
    v49 = id v48 = v32;
    v63 = v49;
    v50 = +[NSArray arrayWithObjects:&v63 count:1];

    id v32 = v48;
    v41 = v57;
  }
  else
  {
    v50 = &__NSArray0__struct;
  }
  +[NSLayoutConstraint _mapsui_activateLayouts:v40 constraints:v50];
  v51 = (NSArray *)[v43 copy];
  actionButtons = v11->_actionButtons;
  v11->_actionButtons = v51;

  return v56;
}

- (void)setRightButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_rightButtonEnabled = a3;
  id v4 = [(MacFooterView *)self rightButton];
  [v4 setEnabled:v3];
}

- (id)_basicButtonSetupAddedToContentView:(id)a3
{
  id v3 = a3;
  id v4 = +[UIButton buttonWithType:1];
  [v3 addSubview:v4];

  LODWORD(v5) = 1148846080;
  [v4 setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v4 setContentCompressionResistancePriority:0 forAxis:v6];

  return v4;
}

- (void)_leftButtonTapped:(id)a3
{
  id v4 = [(MacFooterView *)self delegate];
  [v4 macFooterViewLeftButtonTapped:self];
}

- (void)_rightButtonTapped:(id)a3
{
  id v4 = [(MacFooterView *)self delegate];
  [v4 macFooterViewRightButtonTapped:self];
}

- (void)_backButtonTapped:(id)a3
{
  id v4 = [(MacFooterView *)self delegate];
  [v4 macFooterViewBackButtonTapped:self];
}

- (void)willBeginSubmissionWithProgress:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_actionButtons;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setEnabled:0 v8];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)submissionFinishedWithError:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_actionButtons;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v8);
        long long v10 = [(MacFooterView *)self rightButton];

        if (v9 == v10)
        {
          BOOL v11 = [(MacFooterView *)self rightButtonEnabled];
          v12 = [(MacFooterView *)self rightButton];
          [v12 setEnabled:v11];
        }
        else
        {
          [v9 setEnabled:1];
        }
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (MacFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MacFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
}

- (BOOL)rightButtonEnabled
{
  return self->_rightButtonEnabled;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_actionButtons, 0);
}

@end