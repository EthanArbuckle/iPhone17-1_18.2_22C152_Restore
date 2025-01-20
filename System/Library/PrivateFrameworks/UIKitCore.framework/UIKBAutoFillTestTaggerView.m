@interface UIKBAutoFillTestTaggerView
- (NSArray)tagRequests;
- (UIKBAutoFillTestTaggerView)initWithFrame:(CGRect)a3;
- (UIKBAutoFillTestTaggerViewDelegate)delegate;
- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4;
- (id)_formTypes;
- (id)_textFieldTypes;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_doneBarButtonAction:(id)a3;
- (void)_nextBarButtonAction:(id)a3;
- (void)_performTagRequest:(id)a3;
- (void)_previousBarButtonAction:(id)a3;
- (void)_updateTitle;
- (void)_updateToolbarButtons;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setTagRequests:(id)a3;
@end

@implementation UIKBAutoFillTestTaggerView

- (UIKBAutoFillTestTaggerView)initWithFrame:(CGRect)a3
{
  v99[19] = *MEMORY[0x1E4F143B8];
  v98.receiver = self;
  v98.super_class = (Class)UIKBAutoFillTestTaggerView;
  v3 = -[UIView initWithFrame:](&v98, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [UIVisualEffectView alloc];
    v14 = +[UIBlurEffect effectWithStyle:501];
    uint64_t v15 = [(UIVisualEffectView *)v13 initWithEffect:v14];
    visualEffectView = v4->_visualEffectView;
    v4->_visualEffectView = (UIVisualEffectView *)v15;

    [(UIView *)v4->_visualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 addSubview:v4->_visualEffectView];
    v17 = [(UIVisualEffectView *)v4->_visualEffectView contentView];
    v18 = objc_alloc_init(UIView);
    v19 = +[UIColor lightGrayColor];
    [(UIView *)v18 setBackgroundColor:v19];

    [(UIView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 addSubview:v18];
    v20 = -[UIToolbar initWithFrame:]([UIToolbar alloc], "initWithFrame:", v6, v8, v10, v12);
    toolbar = v4->_toolbar;
    v4->_toolbar = v20;

    [(UIToolbar *)v4->_toolbar setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 addSubview:v4->_toolbar];
    v22 = objc_alloc_init(UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v22;

    v24 = [off_1E52D39B8 systemFontOfSize:15.0 weight:*(double *)off_1E52D6BF8];
    [(UILabel *)v4->_titleLabel setFont:v24];

    v25 = +[UIColor grayColor];
    [(UILabel *)v4->_titleLabel setTextColor:v25];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(UIView *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 addSubview:v4->_titleLabel];
    v26 = -[UIPickerView initWithFrame:]([UIPickerView alloc], "initWithFrame:", v6, v8, v10, v12);
    pickerView = v4->_pickerView;
    v4->_pickerView = v26;

    [(UIPickerView *)v4->_pickerView setDataSource:v4];
    [(UIPickerView *)v4->_pickerView setDelegate:v4];
    [(UIView *)v4->_pickerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 addSubview:v4->_pickerView];
    v73 = (void *)MEMORY[0x1E4F5B268];
    v96 = [(UIView *)v18 topAnchor];
    v95 = [(UIView *)v4 topAnchor];
    v94 = [v96 constraintEqualToAnchor:v95];
    v99[0] = v94;
    v93 = [(UIView *)v18 leadingAnchor];
    v92 = [(UIView *)v4 leadingAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v99[1] = v91;
    v90 = [(UIView *)v18 trailingAnchor];
    v89 = [(UIView *)v4 trailingAnchor];
    v88 = [v90 constraintEqualToAnchor:v89];
    v99[2] = v88;
    v97 = v18;
    v86 = [(UIView *)v18 heightAnchor];
    v87 = +[UIScreen mainScreen];
    [v87 scale];
    v85 = [v86 constraintEqualToConstant:1.0 / v28];
    v99[3] = v85;
    v84 = [(UIView *)v4->_visualEffectView topAnchor];
    v83 = [(UIView *)v18 bottomAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v99[4] = v82;
    v81 = [(UIView *)v4->_visualEffectView leadingAnchor];
    v80 = [(UIView *)v4 leadingAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v99[5] = v79;
    v78 = [(UIView *)v4->_visualEffectView trailingAnchor];
    v77 = [(UIView *)v4 trailingAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v99[6] = v76;
    v75 = [(UIView *)v4->_visualEffectView bottomAnchor];
    v74 = [(UIView *)v4 bottomAnchor];
    v72 = [v75 constraintEqualToAnchor:v74];
    v99[7] = v72;
    v70 = [(UIView *)v4->_toolbar topAnchor];
    v69 = [v17 topAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v99[8] = v68;
    v67 = [(UIView *)v4->_toolbar leadingAnchor];
    v66 = [v17 leadingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v99[9] = v65;
    v64 = [(UIView *)v4->_toolbar trailingAnchor];
    v63 = [v17 trailingAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v99[10] = v62;
    v61 = [(UIView *)v4->_titleLabel topAnchor];
    v60 = [(UIView *)v4->_toolbar bottomAnchor];
    v59 = [v61 constraintEqualToAnchor:v60 constant:15.0];
    v99[11] = v59;
    v58 = [(UIView *)v4->_titleLabel centerXAnchor];
    v57 = [v17 centerXAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v99[12] = v56;
    v55 = [(UIView *)v4->_titleLabel leadingAnchor];
    v54 = [v17 leadingAnchor];
    v53 = [v55 constraintEqualToAnchor:v54 constant:16.0];
    v99[13] = v53;
    v52 = [(UIView *)v4->_titleLabel trailingAnchor];
    v71 = v17;
    v51 = [v17 trailingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51 constant:-16.0];
    v99[14] = v50;
    v49 = [(UIView *)v4->_pickerView topAnchor];
    v48 = [(UIView *)v4->_titleLabel bottomAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v99[15] = v47;
    v46 = [(UIView *)v4->_pickerView leadingAnchor];
    v29 = [v17 leadingAnchor];
    v30 = [v46 constraintEqualToAnchor:v29];
    v99[16] = v30;
    v31 = [(UIView *)v4->_pickerView trailingAnchor];
    v32 = [v17 trailingAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v99[17] = v33;
    v34 = [(UIView *)v4->_pickerView bottomAnchor];
    v35 = [v17 bottomAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v99[18] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:19];
    [v73 activateConstraints:v37];

    v38 = [[UIBarButtonItem alloc] initWithTitle:@"Previous" style:0 target:v4 action:sel__previousBarButtonAction_];
    previousBarButtonItem = v4->_previousBarButtonItem;
    v4->_previousBarButtonItem = v38;

    v40 = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:0 target:v4 action:sel__nextBarButtonAction_];
    nextBarButtoItem = v4->_nextBarButtoItem;
    v4->_nextBarButtoItem = v40;

    v42 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:0 target:v4 action:sel__doneBarButtonAction_];
    doneBarButtonItem = v4->_doneBarButtonItem;
    v4->_doneBarButtonItem = v42;

    v44 = v4;
  }

  return v4;
}

- (void)setTagRequests:(id)a3
{
  v4 = (NSArray *)a3;
  tagRequests = self->_tagRequests;
  if (tagRequests != v4)
  {
    double v10 = v4;
    BOOL v6 = [(NSArray *)tagRequests isEqualToArray:v4];
    v4 = v10;
    if (!v6)
    {
      double v7 = (NSArray *)[(NSArray *)v10 copy];
      double v8 = self->_tagRequests;
      self->_tagRequests = v7;

      double v9 = [(NSArray *)self->_tagRequests firstObject];
      [(UIKBAutoFillTestTaggerView *)self _performTagRequest:v9];

      v4 = v10;
    }
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v5 = [(UIKBAutoFillTestTagRequest *)self->_currentRequest requestType];
  if (v5 == 1)
  {
    BOOL v6 = [(UIKBAutoFillTestTaggerView *)self _textFieldTypes];
    goto LABEL_5;
  }
  if (!v5)
  {
    BOOL v6 = [(UIKBAutoFillTestTaggerView *)self _formTypes];
LABEL_5:
    double v7 = v6;
    int64_t v8 = [v6 count];

    return v8;
  }
  return 0;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  int64_t v7 = [(UIKBAutoFillTestTagRequest *)self->_currentRequest requestType];
  if (v7 == 1)
  {
    int64_t v8 = [(UIKBAutoFillTestTaggerView *)self _textFieldTypes];
    double v9 = [v8 objectAtIndexedSubscript:a4];
    uint64_t v10 = [v9 integerValue];
    double v11 = @"Unspecified";
    switch(v10)
    {
      case 0:
        goto LABEL_24;
      case 1:
        double v11 = @"User Name";
        break;
      case 2:
        double v11 = @"User Name (Email)";
        break;
      case 3:
        double v11 = @"Password";
        break;
      case 4:
        double v11 = @"Confirm Password";
        break;
      case 5:
        double v11 = @"New Password";
        break;
      case 6:
        double v11 = @"One Time Code";
        break;
      case 7:
        double v11 = @"Email";
        break;
      case 8:
        double v11 = @"First Name";
        break;
      case 9:
        double v11 = @"Last Name";
        break;
      case 10:
        double v11 = @"Zip Code";
        break;
      default:
LABEL_8:
        if (v10 == 10000) {
          double v11 = @"Other";
        }
        else {
          double v11 = &stru_1ED0E84C0;
        }
        break;
    }
    goto LABEL_24;
  }
  if (!v7)
  {
    int64_t v8 = [(UIKBAutoFillTestTaggerView *)self _formTypes];
    double v9 = [v8 objectAtIndexedSubscript:a4];
    uint64_t v10 = [v9 integerValue];
    double v11 = @"Unspecified";
    switch(v10)
    {
      case 0:
        break;
      case 1:
        double v11 = @"Sign In";
        break;
      case 2:
        double v11 = @"Sign In (Multi-step)";
        break;
      case 3:
        double v11 = @"Sign Up";
        break;
      case 4:
        double v11 = @"Sign Up (Multi-step)";
        break;
      case 5:
        double v11 = @"Change Password";
        break;
      default:
        goto LABEL_8;
    }
LABEL_24:

    return v11;
  }
  return &stru_1ED0E84C0;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 35.0;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (![(UIKBAutoFillTestTagRequest *)self->_currentRequest requestType])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    currentRequest = self->_currentRequest;
    int64_t v8 = [(UIKBAutoFillTestTaggerView *)self _formTypes];
    double v9 = [v8 objectAtIndexedSubscript:a4];
    objc_msgSend(WeakRetained, "taggerView:didTagFormRequest:withSelectedType:", self, currentRequest, objc_msgSend(v9, "integerValue"));
    goto LABEL_7;
  }
  if ([(UIKBAutoFillTestTagRequest *)self->_currentRequest requestType] == 1
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int64_t v7 = self->_currentRequest;
    int64_t v8 = [(UIKBAutoFillTestTaggerView *)self _textFieldTypes];
    double v9 = [v8 objectAtIndexedSubscript:a4];
    objc_msgSend(WeakRetained, "taggerView:didTagTextFieldRequest:withSelectedType:", self, v7, objc_msgSend(v9, "integerValue"));
LABEL_7:
  }
LABEL_8:
}

- (id)_formTypes
{
  if (_formTypes_formTypes)
  {
    id v2 = (id)_formTypes_formTypes;
  }
  else
  {
    id v2 = &unk_1ED3EFD58;
    _formTypes_formTypes = (uint64_t)&unk_1ED3EFD58;
  }
  return v2;
}

- (id)_textFieldTypes
{
  if (_textFieldTypes_textFieldTypes)
  {
    id v2 = (id)_textFieldTypes_textFieldTypes;
  }
  else
  {
    id v2 = &unk_1ED3EFD70;
    _textFieldTypes_textFieldTypes = (uint64_t)&unk_1ED3EFD70;
  }
  return v2;
}

- (void)_performTagRequest:(id)a3
{
  int64_t v5 = (UIKBAutoFillTestTagRequest *)a3;
  if (v5)
  {
    p_currentRequest = &self->_currentRequest;
    if (self->_currentRequest != v5)
    {
      v14 = v5;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained taggerView:self willTagRequest:v14];
      }
      objc_storeStrong((id *)&self->_currentRequest, a3);
      [(UIKBAutoFillTestTaggerView *)self _updateToolbarButtons];
      [(UIKBAutoFillTestTaggerView *)self _updateTitle];
      if ([(UIKBAutoFillTestTagRequest *)v14 requestType])
      {
        if ([(UIKBAutoFillTestTagRequest *)v14 requestType] == 1
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v8 = [WeakRetained taggerView:self selectedTypeForTextFieldRequest:*p_currentRequest];
          uint64_t v9 = [(UIKBAutoFillTestTaggerView *)self _textFieldTypes];
          goto LABEL_11;
        }
      }
      else if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = [WeakRetained taggerView:self selectedTypeForFormRequest:*p_currentRequest];
        uint64_t v9 = [(UIKBAutoFillTestTaggerView *)self _formTypes];
LABEL_11:
        uint64_t v10 = (void *)v9;
        double v11 = [NSNumber numberWithInteger:v8];
        uint64_t v12 = [v10 indexOfObject:v11];

        if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = v12;
        }
        goto LABEL_15;
      }
      uint64_t v13 = 0;
LABEL_15:
      [(UIPickerView *)self->_pickerView reloadAllComponents];
      [(UIPickerView *)self->_pickerView selectRow:v13 inComponent:0 animated:1];

      int64_t v5 = v14;
    }
  }
}

- (void)_updateToolbarButtons
{
  int64_t v7 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:5 target:0 action:0];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", self->_previousBarButtonItem, v7, 0);
  unint64_t v4 = [(NSArray *)self->_tagRequests indexOfObject:self->_currentRequest];
  NSUInteger v5 = [(NSArray *)self->_tagRequests count];
  uint64_t v6 = 6;
  if (v4 < v5 - 1) {
    uint64_t v6 = 5;
  }
  [v3 addObject:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIKBAutoFillTestTaggerView__visualEffectView[v6])];
  [(UIBarButtonItem *)self->_previousBarButtonItem setEnabled:v4 != 0];
  [(UIToolbar *)self->_toolbar setItems:v3 animated:1];
}

- (void)_updateTitle
{
  currentRequest = self->_currentRequest;
  unint64_t v4 = &stru_1ED0E84C0;
  if (currentRequest)
  {
    uint64_t v5 = [(UIKBAutoFillTestTagRequest *)currentRequest requestType];
    uint64_t v6 = @"What kind of form field is this?";
    if (v5 != 1) {
      uint64_t v6 = &stru_1ED0E84C0;
    }
    if (v5) {
      unint64_t v4 = v6;
    }
    else {
      unint64_t v4 = @"What kind of form is this view controller?";
    }
  }
  titleLabel = self->_titleLabel;
  [(UILabel *)titleLabel setText:v4];
}

- (void)_nextBarButtonAction:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_tagRequests indexOfObject:self->_currentRequest] + 1;
  if (v4 < [(NSArray *)self->_tagRequests count])
  {
    id v5 = [(NSArray *)self->_tagRequests objectAtIndexedSubscript:v4];
    [(UIKBAutoFillTestTaggerView *)self _performTagRequest:v5];
  }
}

- (void)_previousBarButtonAction:(id)a3
{
  id v4 = [(NSArray *)self->_tagRequests objectAtIndexedSubscript:[(NSArray *)self->_tagRequests indexOfObject:self->_currentRequest] - 1];
  [(UIKBAutoFillTestTaggerView *)self _performTagRequest:v4];
}

- (void)_doneBarButtonAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained taggerViewDidFinish:self];
  }
}

- (UIKBAutoFillTestTaggerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKBAutoFillTestTaggerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)tagRequests
{
  return self->_tagRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_previousBarButtonItem, 0);
  objc_storeStrong((id *)&self->_nextBarButtoItem, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end