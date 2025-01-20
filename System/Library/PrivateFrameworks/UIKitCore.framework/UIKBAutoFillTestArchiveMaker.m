@interface UIKBAutoFillTestArchiveMaker
+ (id)archiveMakerWithViewControllerToSnapshot:(id)a3;
- (UIKBAutoFillTestArchiveMaker)initWithViewControllerToSnapshot:(id)a3;
- (id)_cloneBarButtonItem:(id)a3;
- (id)_cloneButton:(id)a3;
- (id)_cloneGenericView:(id)a3;
- (id)_cloneLabel:(id)a3;
- (id)_cloneNavigationItem:(id)a3;
- (id)_cloneTableView:(id)a3;
- (id)_cloneTextField:(id)a3;
- (id)_cloneTextView:(id)a3;
- (id)_cloneView:(id)a3;
- (id)_cloneViewHierarchyFromRootView:(id)a3;
- (id)_makeCopyOfObject:(id)a3;
- (id)archiver:(id)a3 willEncodeObject:(id)a4;
- (id)makeArchive;
- (void)_applyPropertiesFromLabel:(id)a3 toLabel:(id)a4;
- (void)_applyPropertiesFromView:(id)a3 toView:(id)a4;
@end

@implementation UIKBAutoFillTestArchiveMaker

+ (id)archiveMakerWithViewControllerToSnapshot:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithViewControllerToSnapshot:v4];

  return v5;
}

- (UIKBAutoFillTestArchiveMaker)initWithViewControllerToSnapshot:(id)a3
{
  id v5 = a3;
  v6 = [(UIKBAutoFillTestArchiveMaker *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewControllerToSnapshot, a3);
    v8 = v7;
  }

  return v7;
}

- (id)makeArchive
{
  testArchive = self->_testArchive;
  if (testArchive)
  {
    v3 = testArchive;
    goto LABEL_12;
  }
  id v5 = objc_alloc_init(UIKBAutoFillTestArchive);
  v6 = self->_testArchive;
  self->_testArchive = v5;

  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [(UIKBAutoFillTestArchive *)self->_testArchive setViewControllerClassName:v8];

  v9 = [(UIViewController *)self->_viewControllerToSnapshot title];
  [(UIKBAutoFillTestArchive *)self->_testArchive setViewControllerTitle:v9];

  v10 = [(UIViewController *)self->_viewControllerToSnapshot navigationItem];
  v11 = [(UIKBAutoFillTestArchiveMaker *)self _cloneNavigationItem:v10];
  [(UIKBAutoFillTestArchive *)self->_testArchive setViewControllerNavigationItem:v11];

  v12 = [(UIViewController *)self->_viewControllerToSnapshot navigationController];
  if (v12)
  {
    [(UIKBAutoFillTestArchive *)self->_testArchive setRequiresNavigationControllerNesting:1];
    v13 = [(UIViewController *)self->_viewControllerToSnapshot navigationController];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [(UIKBAutoFillTestArchive *)self->_testArchive setNavigationControllerClassName:v15];

    v16 = [(UIViewController *)v12 presentingViewController];
    if (!v16)
    {
      viewControllerToSnapshot = v12;
      goto LABEL_9;
    }
LABEL_7:
    id v18 = v16;

LABEL_10:
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [(UIKBAutoFillTestArchive *)self->_testArchive setPresentingViewControllerClassName:v20];

    goto LABEL_11;
  }
  v16 = [(UIViewController *)self->_viewControllerToSnapshot presentingViewController];
  if (v16) {
    goto LABEL_7;
  }
  viewControllerToSnapshot = self->_viewControllerToSnapshot;
LABEL_9:
  id v18 = [(UIViewController *)viewControllerToSnapshot parentViewController];
  if (v18) {
    goto LABEL_10;
  }
LABEL_11:
  v21 = [(UIViewController *)self->_viewControllerToSnapshot view];
  v22 = [(UIKBAutoFillTestArchiveMaker *)self _cloneViewHierarchyFromRootView:v21];

  [v22 setAutoresizingMask:0];
  [(UIKBAutoFillTestArchive *)self->_testArchive setSnapshotView:v22];
  v3 = self->_testArchive;

LABEL_12:
  return v3;
}

- (id)_cloneView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(UIKBAutoFillTestArchiveMaker *)self _cloneTextField:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(UIKBAutoFillTestArchiveMaker *)self _cloneTextView:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = [(UIKBAutoFillTestArchiveMaker *)self _cloneLabel:v4];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(UIKBAutoFillTestArchiveMaker *)self _cloneButton:v4];
        }
        else {
        uint64_t v5 = [(UIKBAutoFillTestArchiveMaker *)self _cloneGenericView:v4];
        }
      }
    }
  }
  v6 = (void *)v5;

  return v6;
}

- (void)_applyPropertiesFromView:(id)a3 toView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  [v6 setTransform:v9];
  v7 = [v5 backgroundColor];
  [v6 setBackgroundColor:v7];

  objc_msgSend(v6, "setOpaque:", objc_msgSend(v5, "isOpaque"));
  objc_msgSend(v6, "setHidden:", objc_msgSend(v5, "isHidden"));
  objc_msgSend(v6, "setUserInteractionEnabled:", objc_msgSend(v5, "isUserInteractionEnabled"));
  [v5 alpha];
  objc_msgSend(v6, "setAlpha:");
  objc_msgSend(v6, "setContentMode:", objc_msgSend(v5, "contentMode"));
  v8 = [v5 tintColor];
  [v6 setTintColor:v8];
}

- (void)_applyPropertiesFromLabel:(id)a3 toLabel:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [(UIKBAutoFillTestArchiveMaker *)self _applyPropertiesFromView:v13 toView:v6];
  v7 = [v13 text];
  [v6 setText:v7];

  objc_msgSend(v6, "setTextAlignment:", objc_msgSend(v13, "textAlignment"));
  v8 = [v13 shadowColor];
  [v6 setShadowColor:v8];

  [v13 shadowOffset];
  objc_msgSend(v6, "setShadowOffset:");
  objc_msgSend(v6, "setNumberOfLines:", objc_msgSend(v13, "numberOfLines"));
  objc_msgSend(v6, "setBaselineAdjustment:", objc_msgSend(v13, "baselineAdjustment"));
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v13, "adjustsFontSizeToFitWidth"));
  objc_msgSend(v6, "setLineBreakMode:", objc_msgSend(v13, "lineBreakMode"));
  [v13 minimumScaleFactor];
  objc_msgSend(v6, "setMinimumScaleFactor:");
  v9 = [v13 textColor];
  [v6 setTextColor:v9];

  long long v10 = [v13 attributedText];

  if (v10)
  {
    long long v11 = [v13 attributedText];
    [v6 setAttributedText:v11];
  }
  long long v12 = [v13 font];
  [v6 setFont:v12];
}

- (id)_cloneLabel:(id)a3
{
  id v4 = a3;
  id v5 = [UILabel alloc];
  [v4 frame];
  id v6 = -[UILabel initWithFrame:](v5, "initWithFrame:");
  [(UIKBAutoFillTestArchiveMaker *)self _applyPropertiesFromLabel:v4 toLabel:v6];

  return v6;
}

- (id)_cloneTextField:(id)a3
{
  id v4 = a3;
  id v5 = [UITextField alloc];
  [v4 frame];
  id v6 = -[UITextField initWithFrame:](v5, "initWithFrame:");
  ++self->_currentTextFieldTag;
  -[UIView setTag:](v6, "setTag:");
  [(UIKBAutoFillTestArchiveMaker *)self _applyPropertiesFromView:v4 toView:v6];
  -[UITextField setAutocapitalizationType:](v6, "setAutocapitalizationType:", [v4 autocapitalizationType]);
  -[UITextField setAutocorrectionType:](v6, "setAutocorrectionType:", [v4 autocorrectionType]);
  -[UITextField setSpellCheckingType:](v6, "setSpellCheckingType:", [v4 spellCheckingType]);
  -[UITextField setKeyboardType:](v6, "setKeyboardType:", [v4 keyboardType]);
  -[UITextField setKeyboardAppearance:](v6, "setKeyboardAppearance:", [v4 keyboardAppearance]);
  -[UITextField setReturnKeyType:](v6, "setReturnKeyType:", [v4 returnKeyType]);
  -[UITextField setSecureTextEntry:](v6, "setSecureTextEntry:", [v4 isSecureTextEntry]);
  v7 = [v4 textContentType];
  [(UITextField *)v6 setTextContentType:v7];

  v8 = [v4 passwordRules];
  [(UITextField *)v6 setPasswordRules:v8];

  -[UITextField setTextAlignment:](v6, "setTextAlignment:", [v4 textAlignment]);
  -[UITextField setBorderStyle:](v6, "setBorderStyle:", [v4 borderStyle]);
  v9 = [v4 font];
  [(UITextField *)v6 setFont:v9];

  -[UITextField setAdjustsFontSizeToFitWidth:](v6, "setAdjustsFontSizeToFitWidth:", [v4 adjustsFontSizeToFitWidth]);
  long long v10 = [v4 textColor];
  [(UITextField *)v6 setTextColor:v10];

  long long v11 = [v4 text];
  [(UITextField *)v6 setText:v11];

  long long v12 = [v4 attributedText];

  if (v12)
  {
    id v13 = [v4 attributedText];
    [(UITextField *)v6 setAttributedText:v13];
  }
  v14 = [v4 placeholder];
  [(UITextField *)v6 setPlaceholder:v14];

  v15 = [v4 attributedPlaceholder];

  if (v15)
  {
    v16 = [v4 attributedPlaceholder];
    [(UITextField *)v6 setAttributedPlaceholder:v16];
  }
  return v6;
}

- (id)_cloneTextView:(id)a3
{
  id v4 = a3;
  id v5 = [UITextView alloc];
  [v4 frame];
  id v6 = -[UITextView initWithFrame:](v5, "initWithFrame:");
  ++self->_currentTextFieldTag;
  -[UIView setTag:](v6, "setTag:");
  [(UIKBAutoFillTestArchiveMaker *)self _applyPropertiesFromView:v4 toView:v6];
  -[UITextView setAutocapitalizationType:](v6, "setAutocapitalizationType:", [v4 autocapitalizationType]);
  -[UITextView setAutocorrectionType:](v6, "setAutocorrectionType:", [v4 autocorrectionType]);
  -[UITextView setSpellCheckingType:](v6, "setSpellCheckingType:", [v4 spellCheckingType]);
  -[UITextView setKeyboardType:](v6, "setKeyboardType:", [v4 keyboardType]);
  -[UITextView setKeyboardAppearance:](v6, "setKeyboardAppearance:", [v4 keyboardAppearance]);
  -[UITextView setReturnKeyType:](v6, "setReturnKeyType:", [v4 returnKeyType]);
  -[UITextView setSecureTextEntry:](v6, "setSecureTextEntry:", [v4 isSecureTextEntry]);
  v7 = [v4 textContentType];
  [(UITextView *)v6 setTextContentType:v7];

  -[UITextView setTextAlignment:](v6, "setTextAlignment:", [v4 textAlignment]);
  v8 = [v4 passwordRules];
  [(UITextView *)v6 setPasswordRules:v8];

  v9 = [v4 font];
  [(UITextView *)v6 setFont:v9];

  long long v10 = [v4 text];
  [(UITextView *)v6 setText:v10];

  long long v11 = [v4 textColor];
  [(UITextView *)v6 setTextColor:v11];

  long long v12 = [v4 attributedText];

  if (v12)
  {
    id v13 = [v4 attributedText];
    [(UITextView *)v6 setAttributedText:v13];
  }
  return v6;
}

- (id)_cloneButton:(id)a3
{
  id v4 = a3;
  id v5 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", [v4 buttonType]);
  [(UIKBAutoFillTestArchiveMaker *)self _applyPropertiesFromView:v4 toView:v5];
  [v4 frame];
  objc_msgSend(v5, "setFrame:");
  id v6 = [v4 titleLabel];
  v7 = [v5 titleLabel];
  [(UIKBAutoFillTestArchiveMaker *)self _applyPropertiesFromLabel:v6 toLabel:v7];

  v8 = [v4 titleForState:0];
  [v5 setTitle:v8 forState:0];

  v9 = [v4 titleColorForState:0];
  [v5 setTitleColor:v9 forState:0];

  long long v10 = [v4 attributedTitleForState:0];
  if (v10) {
    [v5 setAttributedTitle:v10 forState:0];
  }
  long long v11 = [v4 backgroundImageForState:0];
  [v5 setBackgroundImage:v11 forState:0];

  long long v12 = [v4 imageForState:0];
  [v5 setImage:v12 forState:0];

  return v5;
}

- (id)_cloneGenericView:(id)a3
{
  id v4 = a3;
  id v5 = [UIView alloc];
  [v4 frame];
  id v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  [(UIKBAutoFillTestArchiveMaker *)self _applyPropertiesFromView:v4 toView:v6];

  return v6;
}

- (id)_cloneTableView:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [UITableView alloc];
  [v4 frame];
  long long v10 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", [v4 style], v6, v7, v8, v9);
  int64_t currentTableViewTag = self->_currentTableViewTag;
  v62 = self;
  self->_int64_t currentTableViewTag = currentTableViewTag + 1;
  v55 = v10;
  int64_t v56 = currentTableViewTag + 1;
  -[UIView setTag:](v10, "setTag:");
  long long v12 = objc_alloc_init(UIKBAutoFillTestTableViewDataSource);
  uint64_t v13 = [v4 numberOfSections];
  if (v13 >= 1)
  {
    for (uint64_t i = 0; i != v13; ++i)
      -[UIKBAutoFillTestTableViewDataSource setNumberOfRows:forSection:](v12, "setNumberOfRows:forSection:", [v4 numberOfRowsInSection:i], i);
  }
  uint64_t v58 = v13;
  v64 = v12;
  v15 = [v4 indexPathsForVisibleRows];
  v16 = (void *)[v15 mutableCopy];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v59 = v16;
  obuint64_t j = (id)[v16 copy];
  uint64_t v17 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
  id v63 = v4;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v66 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v65 + 1) + 8 * j);
        v22 = [v4 cellForRowAtIndexPath:v21];
        v23 = v22;
        if (v22)
        {
          v24 = [v22 contentView];
          v25 = [(UIKBAutoFillTestArchiveMaker *)v62 _makeCopyOfObject:v24];

          v26 = [UITableViewCell alloc];
          uint64_t v27 = [v23 style];
          v28 = [MEMORY[0x1E4F29128] UUID];
          v29 = [v28 UUIDString];
          v30 = [(UITableViewCell *)v26 initWithStyle:v27 reuseIdentifier:v29];

          [v23 frame];
          -[UITableViewCell setFrame:](v30, "setFrame:");
          v31 = [(UITableViewCell *)v30 contentView];
          [v31 addSubview:v25];

          v32 = [UIKBTestAutoFillTableViewCellData alloc];
          [v23 frame];
          v33 = [(UIKBTestAutoFillTableViewCellData *)v32 initWithCell:v30 height:CGRectGetHeight(v72)];
          [(UIKBAutoFillTestTableViewDataSource *)v64 setCellData:v33 forRowAtIndexPath:v21];

          id v4 = v63;
        }
        else
        {
          [v59 removeObject:v21];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v18);
  }

  v34 = [v4 delegate];
  uint64_t v35 = [v4 dataSource];
  char obja = objc_opt_respondsToSelector();
  v36 = (void *)v35;
  char v57 = objc_opt_respondsToSelector();
  char v37 = objc_opt_respondsToSelector();
  char v38 = objc_opt_respondsToSelector();
  char v39 = objc_opt_respondsToSelector();
  char v40 = objc_opt_respondsToSelector();
  if (v58 >= 1)
  {
    uint64_t v41 = 0;
    char v42 = v37 & v39;
    char v43 = v38 & v40;
    do
    {
      if (v42)
      {
        [v34 tableView:v4 heightForHeaderInSection:v41];
        double v45 = v44;
        if (v44 <= 0.0)
        {
          uint64_t v46 = 0;
        }
        else
        {
          uint64_t v46 = [v34 tableView:v4 viewForHeaderInSection:v41];
        }
      }
      else
      {
        uint64_t v46 = 0;
        double v45 = 0.0;
      }
      if (obja)
      {
        uint64_t v47 = [v36 tableView:v4 titleForHeaderInSection:v41];
      }
      else
      {
        uint64_t v47 = 0;
      }
      if (v46 | v47)
      {
        v48 = [[UIKBAutoFillTestTableViewHeaderFooterData alloc] initWithTitle:v47 view:v46 height:v45];
        [(UIKBAutoFillTestTableViewDataSource *)v64 setHeaderData:v48 forSection:v41];

        id v4 = v63;
      }
      if (v43)
      {
        [v34 tableView:v4 heightForFooterInSection:v41];
        double v50 = v49;
        if (v49 <= 0.0)
        {
          uint64_t v51 = 0;
        }
        else
        {
          uint64_t v51 = [v34 tableView:v4 viewForFooterInSection:v41];
        }
      }
      else
      {
        uint64_t v51 = 0;
        double v50 = 0.0;
      }
      if (v57)
      {
        uint64_t v52 = [v36 tableView:v4 titleForFooterInSection:v41];
      }
      else
      {
        uint64_t v52 = 0;
      }
      if (v51 | v52)
      {
        v53 = [[UIKBAutoFillTestTableViewHeaderFooterData alloc] initWithTitle:v52 view:v51 height:v50];
        [(UIKBAutoFillTestTableViewDataSource *)v64 setFooterData:v53 forSection:v41];

        id v4 = v63;
      }

      ++v41;
    }
    while (v58 != v41);
  }
  [(UIKBAutoFillTestArchive *)v62->_testArchive setTableViewDataSource:v64 forTableViewWithTag:v56];

  return v55;
}

- (id)_cloneViewHierarchyFromRootView:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(UIKBAutoFillTestArchiveMaker *)self _cloneTableView:v4];
  }
  else
  {
    id v5 = [(UIKBAutoFillTestArchiveMaker *)self _cloneView:v4];
    if ([v5 isMemberOfClass:objc_opt_class()])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      double v6 = objc_msgSend(v4, "subviews", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = [(UIKBAutoFillTestArchiveMaker *)self _cloneViewHierarchyFromRootView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
            [v5 addSubview:v11];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }
    }
  }

  return v5;
}

- (id)_cloneBarButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(UIBarButtonItem);
  double v6 = [v4 largeContentSizeImage];
  [(UIBarButtonItem *)v5 setLargeContentSizeImage:v6];

  [v4 largeContentSizeImageInsets];
  -[UIBarButtonItem setLargeContentSizeImageInsets:](v5, "setLargeContentSizeImageInsets:");
  -[UIBarButtonItem setEnabled:](v5, "setEnabled:", [v4 isEnabled]);
  if ([v4 isSystemItem])
  {
    -[UIBarButtonItem _setSystemItem:](v5, "_setSystemItem:", [v4 systemItem]);
  }
  else if ([v4 isCustomViewItem])
  {
    uint64_t v7 = [v4 customView];
    uint64_t v8 = [(UIKBAutoFillTestArchiveMaker *)self _makeCopyOfObject:v7];
    [(UIBarButtonItem *)v5 setCustomView:v8];
  }
  uint64_t v9 = [v4 title];
  [(UIBarButtonItem *)v5 setTitle:v9];

  [v4 _width];
  if (v10 != 0.0)
  {
    [v4 _width];
    -[UIBarButtonItem _setWidth:](v5, "_setWidth:");
  }
  long long v11 = [v4 image];
  [(UIBarButtonItem *)v5 setImage:v11];

  [v4 imageInsets];
  -[UIBarButtonItem setImageInsets:](v5, "setImageInsets:");
  long long v12 = [v4 landscapeImagePhone];
  [(UIBarButtonItem *)v5 setLandscapeImagePhone:v12];

  [v4 landscapeImagePhoneInsets];
  -[UIBarButtonItem setLandscapeImagePhoneInsets:](v5, "setLandscapeImagePhoneInsets:");
  long long v13 = [v4 tintColor];
  [(UIBarButtonItem *)v5 setTintColor:v13];

  return v5;
}

- (id)_cloneNavigationItem:(id)a3
{
  id v4 = a3;
  id v5 = [UINavigationItem alloc];
  double v6 = [v4 title];
  uint64_t v7 = [(UINavigationItem *)v5 initWithTitle:v6];

  uint64_t v8 = [v4 prompt];
  [(UINavigationItem *)v7 setPrompt:v8];

  uint64_t v9 = [v4 backButtonTitle];
  [(UINavigationItem *)v7 setBackButtonTitle:v9];

  double v10 = [v4 backBarButtonItem];
  [(UINavigationItem *)v7 setBackBarButtonItem:v10];

  long long v11 = [v4 leftBarButtonItems];
  if ([v11 count])
  {
    long long v12 = [(UIKBAutoFillTestArchiveMaker *)self _makeCopyOfObject:v11];
    [(UINavigationItem *)v7 setLeftBarButtonItems:v12];
  }
  else
  {
    long long v12 = [v4 leftBarButtonItem];
    long long v13 = [(UIKBAutoFillTestArchiveMaker *)self _makeCopyOfObject:v12];
    [(UINavigationItem *)v7 setLeftBarButtonItem:v13];
  }
  uint64_t v14 = [v4 titleView];
  if (v14)
  {
    long long v15 = (void *)v14;
    long long v16 = [(UIKBAutoFillTestArchiveMaker *)self _makeCopyOfObject:v14];

    [(UINavigationItem *)v7 setTitleView:v16];
  }
  uint64_t v17 = [v4 rightBarButtonItems];
  if ([v17 count])
  {
    uint64_t v18 = [(UIKBAutoFillTestArchiveMaker *)self _makeCopyOfObject:v17];
    [(UINavigationItem *)v7 setRightBarButtonItems:v18];
  }
  else
  {
    uint64_t v18 = [v4 rightBarButtonItem];
    uint64_t v19 = [(UIKBAutoFillTestArchiveMaker *)self _makeCopyOfObject:v18];
    [(UINavigationItem *)v7 setRightBarButtonItem:v19];
  }
  if (dyld_program_sdk_at_least()) {
    -[UINavigationItem setLargeTitleDisplayMode:](v7, "setLargeTitleDisplayMode:", [v4 largeTitleDisplayMode]);
  }

  return v7;
}

- (id)_makeCopyOfObject:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F28DB0];
    id v5 = a3;
    double v6 = (void *)[[v4 alloc] initRequiringSecureCoding:0];
    [v6 setDelegate:self];
    [v6 encodeObject:v5 forKey:@"Object"];

    uint64_t v7 = [v6 encodedData];
    uint64_t v11 = 0;
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:&v11];
    [v8 setRequiresSecureCoding:0];
    uint64_t v9 = [v8 decodeObjectForKey:@"Object"];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  if (v6)
  {
    uint64_t v7 = (objc_class *)v6;
    if (!isUIKitClass_UIKitBundle)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v9 = (void *)isUIKitClass_UIKitBundle;
      isUIKitClass_UIKitBundle = v8;
    }
    double v10 = NSStringFromClass(v7);
    uint64_t v11 = [(id)isUIKitClass_UIKitBundle classNamed:v10];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        ++self->_currentTextFieldTag;
        objc_msgSend(v5, "setTag:");
      }
      id v12 = v5;
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [(UIKBAutoFillTestArchiveMaker *)self _cloneNavigationItem:v5];
LABEL_13:
    long long v13 = v12;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [(UIKBAutoFillTestArchiveMaker *)self _cloneBarButtonItem:v5];
    goto LABEL_13;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v16 = v5;
  uint64_t v17 = v16;
  if (isKindOfClass)
  {
    long long v13 = [(UIKBAutoFillTestArchiveMaker *)self _cloneView:v16];
    if ([v13 isMemberOfClass:objc_opt_class()])
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v18 = objc_msgSend(v17, "subviews", 0);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            [v23 frame];
            double v25 = v24;
            double v27 = v26;
            double v29 = v28;
            double v31 = v30;
            [v23 removeFromSuperview];
            [v23 setTranslatesAutoresizingMaskIntoConstraints:1];
            objc_msgSend(v23, "setFrame:", v25, v27, v29, v31);
            [v13 addSubview:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v20);
      }
    }
  }
  else
  {
    long long v13 = v16;
  }
LABEL_14:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerToSnapshot, 0);
  objc_storeStrong((id *)&self->_testArchive, 0);
}

@end