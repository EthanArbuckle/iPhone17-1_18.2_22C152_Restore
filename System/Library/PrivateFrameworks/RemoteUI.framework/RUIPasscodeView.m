@interface RUIPasscodeView
- (BOOL)_requiresLocalPasscodeValidation;
- (BOOL)shouldManageScrollViewInsets;
- (NSString)headerTitle;
- (NSString)submittedPIN;
- (RUIElement)footer;
- (RUIHTMLHeaderElement)HTMLHeader;
- (RUIHeaderElement)header;
- (RUIObjectModel)objectModel;
- (RUIPage)page;
- (RUIPasscodeField)passcodeField;
- (RUIPasscodeView)initWithAttributes:(id)a3 parent:(id)a4;
- (UIColor)foregroundColor;
- (_TtC8RemoteUI28RUITextActivityIndicatorView)activityIndicatorView;
- (id)HTMLHeaderView;
- (id)_passcodeFieldAccessibilityIdentifier;
- (id)footerView;
- (id)headerView;
- (id)passcodeView;
- (id)sourceURL;
- (id)subElementWithID:(id)a3;
- (id)titleLabel;
- (int64_t)keyboardAppearance;
- (unint64_t)numberOfEntryFields;
- (void)_clearPasscode;
- (void)_complexPasscodeFieldDidChange:(id)a3;
- (void)_doneButtonTapped:(id)a3;
- (void)_jiggleView:(id)a3;
- (void)_updateFieldSpacer;
- (void)autofillWithToken:(id)a3;
- (void)footerView:(id)a3 activatedLinkWithURL:(id)a4;
- (void)keyboardFrameDidChange:(id)a3;
- (void)performAction:(int)a3 forElement:(id)a4 completion:(id)a5;
- (void)populatePostbackDictionary:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setFooter:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHTMLHeader:(id)a3;
- (void)setHeader:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageAlignment:(int)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setNumberOfEntryFields:(unint64_t)a3;
- (void)setObjectModel:(id)a3;
- (void)setPage:(id)a3;
- (void)setShouldManageScrollViewInsets:(BOOL)a3;
- (void)setSubmittedPIN:(id)a3;
- (void)startActivityIndicator;
- (void)stopActivityIndicator;
- (void)submitPIN;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayout;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RUIPasscodeView

- (RUIPasscodeView)initWithAttributes:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RUIPasscodeView;
  v8 = [(RUIElement *)&v15 initWithAttributes:v6 parent:v7];
  v9 = v8;
  if (v8)
  {
    v8->_numberOfEntryFields = 4;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v10 = (void *)getPSListControllerClass_softClass;
    uint64_t v20 = getPSListControllerClass_softClass;
    if (!getPSListControllerClass_softClass)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __getPSListControllerClass_block_invoke;
      v16[3] = &unk_264211600;
      v16[4] = &v17;
      __getPSListControllerClass_block_invoke((uint64_t)v16);
      v10 = (void *)v18[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v17, 8);
    v12 = [v11 appearance];
    v13 = [MEMORY[0x263F825C8] labelColor];
    [v12 setTextColor:v13];
  }
  return v9;
}

- (RUIPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (id)sourceURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  v3 = [WeakRetained sourceURL];

  return v3;
}

- (void)setForegroundColor:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  p_foregroundColor = &self->_foregroundColor;
  if (self->_foregroundColor != (UIColor *)v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    [(PSPasscodeField *)self->_passcodeField setForegroundColor:*p_foregroundColor];
    if (objc_opt_respondsToSelector()) {
      [(RUIHeader *)self->_headerView setHeaderColor:*p_foregroundColor];
    }
    uint64_t v5 = objc_opt_respondsToSelector();
    uint64_t v6 = v8;
    if (v5)
    {
      uint64_t v5 = [(RemoteUITableFooter *)self->_footerView setTextColor:*p_foregroundColor];
      uint64_t v6 = v8;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  if (self->_keyboardAppearance != a3)
  {
    self->_keyboardAppearance = a3;
    -[PSPasscodeField setKeyboardAppearance:](self->_passcodeField, "setKeyboardAppearance:");
  }
}

- (void)_updateFieldSpacer
{
  if (![(RUIPasscodeView *)self _requiresLocalPasscodeValidation]
    && self->_passcodeField)
  {
    v3 = [(RUIElement *)self attributes];
    id v6 = [v3 objectForKeyedSubscript:@"fieldSpacer"];

    if ((self->_numberOfEntryFields & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v6 isEqualToString:@"center"])
        {
          v4 = objc_opt_new();
          if (self->_numberOfEntryFields >= 4)
          {
            unint64_t v5 = 1;
            do
            {
              [v4 addObject:&unk_26C557E80];
              ++v5;
            }
            while (v5 < self->_numberOfEntryFields >> 1);
          }
          [v4 addObject:&unk_26C557E98];
          [(PSPasscodeField *)self->_passcodeField setFieldSpacing:v4];
        }
      }
    }
  }
}

- (id)passcodeView
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (!self->_containerView)
  {
    id v3 = objc_alloc(MEMORY[0x263F82B88]);
    double v4 = *MEMORY[0x263F001A8];
    double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v8 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
    containerView = self->_containerView;
    self->_containerView = v8;

    v10 = self->_containerView;
    id v11 = [MEMORY[0x263F825C8] clearColor];
    [(UIScrollView *)v10 setBackgroundColor:v11];

    -[UIScrollView setDirectionalLayoutMargins:](self->_containerView, "setDirectionalLayoutMargins:", 0.0, 20.0, 0.0, 20.0);
    [(UIScrollView *)self->_containerView setLayoutMarginsFollowReadableWidth:1];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:self selector:sel_keyboardFrameDidChange_ name:*MEMORY[0x263F83808] object:0];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:self selector:sel_keyboardFrameDidChange_ name:*MEMORY[0x263F83798] object:0];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:self selector:sel_keyboardFrameDidChange_ name:*MEMORY[0x263F83800] object:0];

    if ([(RUIPasscodeView *)self _requiresLocalPasscodeValidation])
    {
      LODWORD(v44) = 0;
      objc_super v15 = [getMCProfileConnectionClass() sharedConnection];
      int v16 = [v15 unlockScreenTypeWithOutSimplePasscodeType:&v44];

      if (v16 == 2 || v16 == 1)
      {
        BOOL v18 = v16 == 2;
        uint64_t v19 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x263F82CF0]), "initWithFrame:", v4, v5, v6, v7);
        p_complexPasscodeField = (id *)&self->_complexPasscodeField;
        complexPasscodeField = self->_complexPasscodeField;
        self->_complexPasscodeField = v19;

        [(UITextField *)self->_complexPasscodeField setKeyboardAppearance:self->_keyboardAppearance];
        [(UITextField *)self->_complexPasscodeField setEnablesReturnKeyAutomatically:1];
        [(UITextField *)self->_complexPasscodeField addTarget:self action:sel__complexPasscodeFieldDidChange_ forControlEvents:983040];
        v22 = self->_complexPasscodeField;
        v23 = (void *)MEMORY[0x263F81708];
        v24 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v25 = [v24 userInterfaceIdiom];

        double v26 = 18.0;
        if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
          double v26 = 23.0;
        }
        v27 = objc_msgSend(v23, "systemFontOfSize:", v26, v44);
        [(UITextField *)v22 setFont:v27];

        [*p_complexPasscodeField setSecureTextEntry:1];
        [*p_complexPasscodeField setTextAlignment:1];
        v28 = [*p_complexPasscodeField layer];
        [v28 setBorderWidth:1.0];

        v29 = [*p_complexPasscodeField layer];
        id v30 = [MEMORY[0x263F825C8] _labelColor];
        objc_msgSend(v29, "setBorderColor:", objc_msgSend(v30, "CGColor"));

        v31 = [*p_complexPasscodeField layer];
        [v31 setCornerRadius:10.0];

        if (!v18) {
          [*p_complexPasscodeField setKeyboardType:4];
        }
        goto LABEL_24;
      }
      if (v16)
      {
        if (_isInternalInstall())
        {
          v32 = _RUILoggingFacility();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v16;
            _os_log_impl(&dword_2144F2000, v32, OS_LOG_TYPE_DEFAULT, "Error! Unexpected unlock type: %d", buf, 8u);
          }
        }
        goto LABEL_19;
      }
      if (v44 == 1)
      {
        unint64_t v17 = 6;
      }
      else
      {
        if (v44)
        {
          if (_isInternalInstall())
          {
            v43 = _RUILoggingFacility();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v44;
              _os_log_impl(&dword_2144F2000, v43, OS_LOG_TYPE_DEFAULT, "Error! Unlock type is MCUnlockScreenSimple, but value for MCSimplePasscodeType (%d) is invalid.", buf, 8u);
            }
          }
          goto LABEL_19;
        }
        unint64_t v17 = 4;
      }
      self->_numberOfEntryFields = v17;
    }
LABEL_19:
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2050000000;
    v33 = (void *)getPSPasscodeFieldClass_softClass;
    uint64_t v47 = getPSPasscodeFieldClass_softClass;
    if (!getPSPasscodeFieldClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v49 = 3221225472;
      v50 = __getPSPasscodeFieldClass_block_invoke;
      v51 = &unk_264211600;
      v52 = &v44;
      __getPSPasscodeFieldClass_block_invoke((uint64_t)buf);
      v33 = (void *)v45[3];
    }
    v34 = v33;
    _Block_object_dispose(&v44, 8);
    id v35 = [v34 alloc];
    v36 = (PSPasscodeField *)objc_msgSend(v35, "initWithNumberOfEntryFields:", self->_numberOfEntryFields, v44);
    p_complexPasscodeField = (id *)&self->_passcodeField;
    passcodeField = self->_passcodeField;
    self->_passcodeField = v36;

    [(PSPasscodeField *)self->_passcodeField setAccessibilityTraits:*MEMORY[0x263F832B8]];
    v38 = [(RUIPasscodeView *)self _passcodeFieldAccessibilityIdentifier];
    [(PSPasscodeField *)self->_passcodeField setAccessibilityIdentifier:v38];

    if (self->_foregroundColor) {
      objc_msgSend(*p_complexPasscodeField, "setForegroundColor:");
    }
    [(RUIPasscodeView *)self _updateFieldSpacer];
    [*p_complexPasscodeField setKeyboardAppearance:self->_keyboardAppearance];
    v39 = self->_containerView;
    v40 = [(RUIPasscodeView *)self activityIndicatorView];
    [(UIScrollView *)v39 addSubview:v40];

    [*p_complexPasscodeField setDelegate:self];
LABEL_24:
    [(UIScrollView *)self->_containerView addSubview:*p_complexPasscodeField];
  }
  v41 = self->_containerView;
  return v41;
}

- (id)_passcodeFieldAccessibilityIdentifier
{
  id v3 = [(RUIElement *)self attributes];
  double v4 = @"accessibilityIdentifier";
  double v5 = [v3 objectForKeyedSubscript:@"accessibilityIdentifier"];

  double v6 = [(RUIElement *)self attributes];
  double v7 = v6;
  if (v5) {
    goto LABEL_4;
  }
  double v4 = @"id";
  uint64_t v8 = [v6 objectForKeyedSubscript:@"id"];

  if (v8)
  {
    double v6 = [(RUIElement *)self attributes];
    double v7 = v6;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:v4];

    goto LABEL_5;
  }
  v9 = @"passcodeField";
LABEL_5:
  return v9;
}

- (_TtC8RemoteUI28RUITextActivityIndicatorView)activityIndicatorView
{
  id v3 = [(RUIElement *)self style];
  int v4 = [v3 supportActivityIndicatorInPinView];

  if (v4)
  {
    activityIndicatorView = self->_activityIndicatorView;
    if (!activityIndicatorView)
    {
      double v6 = objc_alloc_init(_TtC8RemoteUI28RUITextActivityIndicatorView);
      double v7 = self->_activityIndicatorView;
      self->_activityIndicatorView = v6;

      activityIndicatorView = self->_activityIndicatorView;
    }
    uint64_t v8 = activityIndicatorView;
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (void)keyboardFrameDidChange:(id)a3
{
  containerView = self->_containerView;
  id v5 = a3;
  double v6 = [(UIScrollView *)containerView superview];
  double v7 = [v6 keyboardSceneDelegate];
  uint64_t v8 = [(UIScrollView *)self->_containerView superview];
  v9 = [v5 userInfo];

  [v7 verticalOverlapForView:v8 usingKeyboardInfo:v9];
  self->_keyboardHeight = v10;

  [(RUIPasscodeView *)self viewDidLayout];
}

- (void)setNumberOfEntryFields:(unint64_t)a3
{
  if (![(RUIPasscodeView *)self _requiresLocalPasscodeValidation]
    && self->_numberOfEntryFields != a3)
  {
    self->_numberOfEntryFields = a3;
    [(PSPasscodeField *)self->_passcodeField setNumberOfEntryFields:a3];
    [(RUIPasscodeView *)self _updateFieldSpacer];
  }
}

- (void)populatePostbackDictionary:(id)a3
{
  id v7 = a3;
  if (![(RUIPasscodeView *)self _requiresLocalPasscodeValidation])
  {
    int v4 = [(RUIElement *)self attributes];
    id v5 = [v4 objectForKeyedSubscript:@"id"];

    if ([v5 length])
    {
      submittedPIN = self->_submittedPIN;
      if (submittedPIN) {
        [v7 setObject:submittedPIN forKey:v5];
      }
    }
  }
}

- (void)performAction:(int)a3 forElement:(id)a4 completion:(id)a5
{
  p_objectModel = &self->_objectModel;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  [WeakRetained passcodeViewOM:self activatedElement:v9 completion:v8];
}

- (id)subElementWithID:(id)a3
{
  id v4 = a3;
  p_header = (id *)&self->_header;
  double v6 = [(RUIElement *)self->_header identifier];
  char v7 = [v6 isEqualToString:v4];

  if ((v7 & 1) != 0
    || (p_header = (id *)&self->_footer,
        [(RUIElement *)self->_footer identifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:v4],
        v8,
        v9))
  {
    id v10 = *p_header;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)titleLabel
{
  return 0;
}

- (void)setHeaderTitle:(id)a3
{
  id v9 = a3;
  if (!self->_header)
  {
    id v4 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:0 parent:self];
    header = self->_header;
    self->_header = v4;
  }
  double v6 = [(RUIPasscodeView *)self headerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(RUIPasscodeView *)self headerView];
    [v8 setTitle:v9];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  self->_appeared = 1;
  if (self->_pendingAutoFillToken)
  {
    if (_isInternalInstall())
    {
      id v4 = _RUILoggingFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_2144F2000, v4, OS_LOG_TYPE_DEFAULT, "Filling pending PINView token", v13, 2u);
      }
    }
    id v5 = [(RUIPasscodeView *)self passcodeField];
    [v5 setStringValue:self->_pendingAutoFillToken];

    pendingAutoFillToken = self->_pendingAutoFillToken;
    self->_pendingAutoFillToken = 0;
  }
  [(UIScrollView *)self->_containerView contentSize];
  double v8 = v7;
  id v9 = [(RUIPasscodeView *)self view];
  id v10 = [v9 readableContentGuide];
  [v10 layoutFrame];
  double v12 = v11;

  if ([(RUIPasscodeView *)self shouldManageScrollViewInsets]) {
    -[UIScrollView setContentOffset:animated:](self->_containerView, "setContentOffset:animated:", 1, 0.0, fmax(v8 - v12, 0.0));
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  if (self->_passcodeField)
  {
    id v4 = [(RUIElement *)self attributes];
    id v5 = [v4 objectForKeyedSubscript:@"secure"];
    if (v5)
    {
      double v6 = [(RUIElement *)self attributes];
      double v7 = [v6 objectForKeyedSubscript:@"secure"];
      uint64_t v8 = [v7 BOOLValue];
    }
    else
    {
      uint64_t v8 = 1;
    }

    [(PSPasscodeField *)self->_passcodeField setSecurePasscodeEntry:v8];
    passcodeField = self->_passcodeField;
    [(PSPasscodeField *)passcodeField becomeFirstResponder];
  }
  else if (self->_complexPasscodeField)
  {
    id v12 = (id)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped_];
    [v12 setEnabled:0];
    id v9 = [(RUIPasscodeView *)self page];
    id v10 = [v9 navigationItem];
    [v10 setRightBarButtonItem:v12];

    [(UITextField *)self->_complexPasscodeField becomeFirstResponder];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  self->_appeared = 0;
  passcodeField = self->_passcodeField;
  if (passcodeField || (passcodeField = self->_complexPasscodeField) != 0) {
    objc_msgSend(passcodeField, "resignFirstResponder", a3);
  }
}

- (void)viewDidLayout
{
  [(UIScrollView *)self->_containerView bounds];
  double v122 = v3;
  double v5 = v4;
  double v6 = [(RUIPasscodeView *)self view];
  double v7 = [v6 readableContentGuide];
  [v7 layoutFrame];
  double v9 = v8;

  double keyboardHeight = 0.0;
  if (!+[RUIPlatform isAppleTV]) {
    double keyboardHeight = self->_keyboardHeight;
  }
  double v11 = [(RUIPasscodeView *)self scrollView];
  [v11 adjustedContentInset];
  double v13 = v12;

  complexPasscodeField = self->_complexPasscodeField;
  if (complexPasscodeField)
  {
    [(UITextField *)complexPasscodeField sizeToFit];
    [(UITextField *)self->_complexPasscodeField frame];
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    double v21 = 14.0;
    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v21 = 24.0;
    }
    -[UITextField setFrame:](self->_complexPasscodeField, "setFrame:", v21, v16, v122 + v21 * -2.0, v18 + v18);
  }
  passcodeField = self->_passcodeField;
  if (!passcodeField) {
    passcodeField = self->_complexPasscodeField;
  }
  id v121 = passcodeField;
  [v121 frame];
  double v24 = v23;
  double v26 = v25;
  v27 = [(RUIPasscodeView *)self headerView];
  [v27 frame];

  v28 = [(RUIPasscodeView *)self headerView];
  char v29 = objc_opt_respondsToSelector();

  id v30 = [(RUIPasscodeView *)self headerView];
  v31 = v30;
  double v119 = v26;
  if (v29)
  {
    v32 = [(RUIPasscodeView *)self view];
    [v31 headerHeightForWidth:v32 inView:v9];
    double v34 = v33;

    double v113 = v9;
  }
  else
  {
    objc_msgSend(v30, "sizeThatFits:", v9, 1.79769313e308);
    double v113 = v35;
    double v34 = v36;
  }
  double v37 = v5 - keyboardHeight;

  v38 = [(RUIPasscodeView *)self HTMLHeaderView];
  [v38 frame];
  double v40 = v39;
  double v42 = v41;

  v43 = [(RUIPasscodeView *)self HTMLHeaderView];

  if (v43)
  {
    uint64_t v44 = [(RUIPasscodeView *)self HTMLHeaderView];
    v45 = [(RUIPasscodeView *)self view];
    [v44 headerHeightForWidth:v45 inView:v9];
    double v42 = v46;

    double v117 = v9;
  }
  else
  {
    double v117 = v40;
  }
  double v47 = v37 - v13;
  v48 = [(RUIPasscodeView *)self footerView];
  [v48 frame];

  uint64_t v49 = [(RUIPasscodeView *)self footerView];
  char v50 = objc_opt_respondsToSelector();

  v51 = [(RUIPasscodeView *)self footerView];
  v52 = v51;
  double v53 = v24;
  double v115 = keyboardHeight;
  double v118 = v9;
  if (v50)
  {
    v54 = [(RUIPasscodeView *)self view];
    [v52 footerHeightForWidth:v54 inView:v9];
    double v56 = v55;
  }
  else
  {
    objc_msgSend(v51, "sizeThatFits:", v9, 1.79769313e308);
    double v56 = v57;
  }
  double v58 = v119;

  BOOL v59 = +[RUIPlatform isAppleTV];
  [v121 bounds];
  footer = self->_footer;
  BOOL v62 = footer == 0;
  unsigned int v63 = footer != 0;
  double v116 = v56;
  if (v62) {
    double v64 = 0.0;
  }
  else {
    double v64 = v56;
  }
  double v65 = v60 + v64;
  header = self->_header;
  if (header) {
    double v67 = v34;
  }
  else {
    double v67 = 0.0;
  }
  double v68 = v65 + v67;
  HTMLHeader = self->_HTMLHeader;
  if (header) {
    ++v63;
  }
  if (HTMLHeader) {
    double v70 = v42;
  }
  else {
    double v70 = 0.0;
  }
  double v71 = v68 + v70;
  if (HTMLHeader) {
    ++v63;
  }
  double v72 = fmax(v47 - v71, 0.0) / (double)v63;
  if (v72 <= 20.0) {
    double v73 = v72;
  }
  else {
    double v73 = 20.0;
  }
  double v74 = v34;
  double v75 = v34 + v73;
  if (!header) {
    double v75 = 0.0;
  }
  if (HTMLHeader) {
    double v76 = v42 + v73;
  }
  else {
    double v76 = 0.0;
  }
  if (v59) {
    double v77 = -160.0;
  }
  else {
    double v77 = 0.0;
  }
  if (v59) {
    double v58 = 600.0;
  }
  double v78 = (v47 - v58) * 0.5;
  if (v59) {
    double v79 = v122;
  }
  else {
    double v79 = v53;
  }
  double v80 = v75 + v76;
  if (v78 <= v80) {
    double v78 = v80;
  }
  double v81 = v77 + v78;
  objc_msgSend(v121, "setFrame:", round((v122 - v79) * 0.5), v77 + v78, v79, v58);
  if (self->_header)
  {
    v82 = [(RUIPasscodeView *)self page];
    char v83 = [v82 showsTitlesAsHeaderViews];

    if ((v83 & 1) == 0)
    {
      double v84 = 0.0;
      if (self->_HTMLHeader) {
        double v84 = v42 + v73;
      }
      double v120 = v81 - v73 - v84 - v74 - v77;
      float v85 = (v122 - v114) * 0.5;
      double v86 = floorf(v85);
      v87 = [(RUIPasscodeView *)self headerView];
      objc_msgSend(v87, "setFrame:", v86, v120, v114, v74);
    }
  }
  if (self->_HTMLHeader)
  {
    float v88 = (v122 - v117) * 0.5;
    double v89 = floorf(v88);
    v90 = [(RUIPasscodeView *)self HTMLHeaderView];
    objc_msgSend(v90, "setFrame:", v89, v81 - v73 - v42 - v77, v117, v42);
  }
  double MaxY = v58 + v81;
  if (self->_footer)
  {
    double v92 = v73 + MaxY;
    v93 = [(RUIPasscodeView *)self footerView];
    objc_msgSend(v93, "setFrame:", (v122 - v118) * 0.5, v92, v118, v116);

    double MaxY = v116 + v92;
  }
  v94 = [(RUIPasscodeView *)self activityIndicatorView];
  char v95 = [v94 isHidden];

  if ((v95 & 1) == 0)
  {
    CGFloat v96 = v73 + MaxY;
    v97 = [(RUIPasscodeView *)self activityIndicatorView];
    [v97 frame];

    v98 = [(RUIPasscodeView *)self activityIndicatorView];
    objc_msgSend(v98, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
    double v100 = v99;
    double v102 = v101;

    v103 = [(RUIPasscodeView *)self activityIndicatorView];
    v104 = [v103 superview];
    [v104 bounds];
    CGFloat v105 = CGRectGetMidX(v124) + v100 * -0.5;

    v106 = [(RUIPasscodeView *)self activityIndicatorView];
    objc_msgSend(v106, "setFrame:", v105, v96, v100, v102);

    v125.origin.x = v105;
    v125.origin.y = v96;
    v125.size.width = v100;
    v125.size.height = v102;
    double MaxY = CGRectGetMaxY(v125);
  }
  -[UIScrollView setContentSize:](self->_containerView, "setContentSize:", 0.0, MaxY);
  [(UIScrollView *)self->_containerView contentInset];
  double v108 = v107;
  double v110 = v109;
  double v112 = v111;
  if ([(RUIPasscodeView *)self shouldManageScrollViewInsets]) {
    -[UIScrollView setContentInset:](self->_containerView, "setContentInset:", v108, v110, v115, v112);
  }
}

- (void)startActivityIndicator
{
  double v3 = [(RUIPasscodeView *)self activityIndicatorView];
  [v3 startAnimating];

  id v6 = [(RUIElement *)self pageElement];
  double v4 = [v6 page];
  double v5 = [v4 view];
  [v5 setNeedsLayout];
}

- (void)stopActivityIndicator
{
  id v2 = [(RUIPasscodeView *)self activityIndicatorView];
  [v2 stopAnimating];
}

- (id)headerView
{
  v28[3] = *MEMORY[0x263EF8340];
  if (self->_header && !self->_headerView)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v3 = [(RUIPasscodeView *)self page];
      [v3 showsTitlesAsHeaderViews];
      double v4 = (objc_class *)objc_opt_class();
    }
    else
    {
      double v4 = 0;
    }
    id v5 = [v4 alloc];
    id v6 = [(RUIPasscodeView *)self header];
    double v7 = [v6 attributes];
    double v8 = (RUIHeader *)[v5 initWithAttributes:v7];
    headerView = self->_headerView;
    self->_headerView = v8;

    [(RUIHeaderElement *)self->_header configureView:self->_headerView];
    if (self->_foregroundColor && (objc_opt_respondsToSelector() & 1) != 0) {
      [(RUIHeader *)self->_headerView setHeaderColor:self->_foregroundColor];
    }
    id v10 = [(RUIPasscodeView *)self passcodeView];
    [v10 addSubview:self->_headerView];

    double v11 = [(RUIPasscodeView *)self page];
    int v12 = [v11 showsTitlesAsHeaderViews];

    if (v12)
    {
      [(RUIHeader *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
      double v24 = (void *)MEMORY[0x263F08938];
      v27 = [(RUIHeader *)self->_headerView topAnchor];
      double v26 = [(UIScrollView *)self->_containerView topAnchor];
      double v25 = [v27 constraintEqualToAnchor:v26];
      v28[0] = v25;
      double v23 = [(RUIHeader *)self->_headerView leftAnchor];
      double v13 = [(UIScrollView *)self->_containerView readableContentGuide];
      v14 = [v13 leftAnchor];
      double v15 = [v23 constraintEqualToAnchor:v14];
      v28[1] = v15;
      double v16 = [(RUIHeader *)self->_headerView rightAnchor];
      double v17 = [(UIScrollView *)self->_containerView readableContentGuide];
      double v18 = [v17 rightAnchor];
      uint64_t v19 = [v16 constraintEqualToAnchor:v18];
      v28[2] = v19;
      uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
      [v24 activateConstraints:v20];
    }
    if ([(RUIElement *)self hasImage]) {
      [(RUIElement *)self loadImage];
    }
  }
  double v21 = self->_headerView;
  return v21;
}

- (id)HTMLHeaderView
{
  if (self->_HTMLHeader)
  {
    if (!self->_HTMLHeaderView)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v3 = objc_alloc_init(RUIHTMLHeaderView);
        HTMLHeaderView = self->_HTMLHeaderView;
        self->_HTMLHeaderView = v3;

        [(RUIHTMLHeaderElement *)self->_HTMLHeader configureView:self->_HTMLHeaderView];
        id v5 = [(RUIPasscodeView *)self passcodeView];
        [v5 addSubview:self->_HTMLHeaderView];
      }
    }
  }
  id v6 = self->_HTMLHeaderView;
  return v6;
}

- (id)footerView
{
  if (self->_footer && !self->_footerView)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    id v3 = objc_alloc((Class)objc_opt_class());
    double v4 = [(RUIPasscodeView *)self footer];
    id v5 = [v4 attributes];
    id v6 = (RemoteUITableFooter *)[v3 initWithAttributes:v5];
    footerView = self->_footerView;
    self->_footerView = v6;

    [(RemoteUITableFooter *)self->_footerView setDelegate:self];
    [(RUIElement *)self->_footer configureView:self->_footerView];
    if (self->_foregroundColor && (objc_opt_respondsToSelector() & 1) != 0) {
      [(RemoteUITableFooter *)self->_footerView setTextColor:self->_foregroundColor];
    }
    double v8 = [(RUIPasscodeView *)self passcodeView];
    [v8 addSubview:self->_footerView];
  }
  double v9 = self->_footerView;
  return v9;
}

- (void)footerView:(id)a3 activatedLinkWithURL:(id)a4
{
  if (self->_footer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    [WeakRetained passcodeViewOM:self activatedElement:self->_footer completion:0];
  }
}

- (void)submitPIN
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v3 = [(RUIPasscodeView *)self _requiresLocalPasscodeValidation];
  passcodeField = self->_passcodeField;
  if (!passcodeField) {
    passcodeField = self->_complexPasscodeField;
  }
  id v5 = passcodeField;
  if (v3)
  {
    if (self->_passcodeValidationAttempts > 2) {
      goto LABEL_20;
    }
    id v6 = self->_passcodeField;
    if (v6)
    {
      uint64_t v7 = [(PSPasscodeField *)v6 stringValue];
    }
    else
    {
      complexPasscodeField = self->_complexPasscodeField;
      if (!complexPasscodeField)
      {
        id v10 = 0;
LABEL_11:
        double v11 = [getMCProfileConnectionClass() sharedConnection];
        id v27 = 0;
        char v12 = [v11 unlockDeviceWithPasscode:v10 outError:&v27];
        id v13 = v27;

        if (v13 && _isInternalInstall())
        {
          v14 = _RUILoggingFacility();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v29 = v13;
            _os_log_impl(&dword_2144F2000, v14, OS_LOG_TYPE_DEFAULT, "Error! Entered passcode does not validate: %@", buf, 0xCu);
          }
        }
        ++self->_passcodeValidationAttempts;

        if (v12)
        {
          [(RUIPasscodeView *)self setSubmittedPIN:0];
          goto LABEL_18;
        }
        if (self->_passcodeValidationAttempts < 3)
        {
          [(RUIPasscodeView *)self _jiggleView:v5];
          dispatch_time_t v24 = dispatch_time(0, 250000000);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __28__RUIPasscodeView_submitPIN__block_invoke;
          block[3] = &unk_2642112D8;
          block[4] = self;
          dispatch_after(v24, MEMORY[0x263EF83A0], block);
          goto LABEL_22;
        }
LABEL_20:
        double v16 = (void *)MEMORY[0x263F82418];
        double v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        double v18 = [v17 localizedStringForKey:@"TOO_MANY_FAILED_PASSCODE_ATTEMPTS" value:&stru_26C545B50 table:@"Localizable"];
        id WeakRetained = [v16 alertControllerWithTitle:v18 message:0 preferredStyle:1];

        uint64_t v19 = (void *)MEMORY[0x263F82400];
        uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        double v21 = [v20 localizedStringForKey:@"OK" value:&stru_26C545B50 table:@"Localizable"];
        v22 = [v19 actionWithTitle:v21 style:1 handler:0];
        [WeakRetained addAction:v22];

        double v23 = [(RUIPasscodeView *)self page];
        [v23 presentViewController:WeakRetained animated:1 completion:0];

        goto LABEL_21;
      }
      uint64_t v7 = [(UITextField *)complexPasscodeField text];
    }
    id v10 = (void *)v7;
    goto LABEL_11;
  }
  double v8 = [(PSPasscodeField *)self->_passcodeField stringValue];
  [(RUIPasscodeView *)self setSubmittedPIN:v8];

LABEL_18:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __28__RUIPasscodeView_submitPIN__block_invoke_2;
  v25[3] = &unk_2642113C0;
  v25[4] = self;
  [WeakRetained passcodeViewOM:self activatedElement:self completion:v25];
LABEL_21:

LABEL_22:
}

uint64_t __28__RUIPasscodeView_submitPIN__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearPasscode];
}

void __28__RUIPasscodeView_submitPIN__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 350000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__RUIPasscodeView_submitPIN__block_invoke_3;
  block[3] = &unk_2642112D8;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

uint64_t __28__RUIPasscodeView_submitPIN__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearPasscode];
}

- (void)_clearPasscode
{
  passcodeField = self->_passcodeField;
  if (passcodeField)
  {
    [(PSPasscodeField *)passcodeField setStringValue:&stru_26C545B50];
  }
  else
  {
    complexPasscodeField = self->_complexPasscodeField;
    if (complexPasscodeField)
    {
      [(UITextField *)complexPasscodeField setText:&stru_26C545B50];
      id v5 = self->_complexPasscodeField;
      [(RUIPasscodeView *)self _complexPasscodeFieldDidChange:v5];
    }
  }
}

- (void)autofillWithToken:(id)a3
{
  id v5 = a3;
  if (self->_appeared)
  {
    id v6 = [(RUIPasscodeView *)self passcodeField];
    [v6 setStringValue:v5];
  }
  else
  {
    if (_isInternalInstall())
    {
      uint64_t v7 = _RUILoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v8 = 0;
        _os_log_impl(&dword_2144F2000, v7, OS_LOG_TYPE_DEFAULT, "PINView autofill pending appearance", v8, 2u);
      }
    }
    objc_storeStrong((id *)&self->_pendingAutoFillToken, a3);
  }
}

- (void)_complexPasscodeFieldDidChange:(id)a3
{
  double v4 = [(UITextField *)self->_complexPasscodeField text];
  if ([v4 length])
  {
    unint64_t passcodeValidationAttempts = self->_passcodeValidationAttempts;

    if (passcodeValidationAttempts <= 2)
    {
      id v10 = [(RUIPasscodeView *)self page];
      id v6 = [v10 navigationItem];
      uint64_t v7 = [v6 rightBarButtonItem];
      double v8 = v7;
      uint64_t v9 = 1;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v10 = [(RUIPasscodeView *)self page];
  id v6 = [v10 navigationItem];
  uint64_t v7 = [v6 rightBarButtonItem];
  double v8 = v7;
  uint64_t v9 = 0;
LABEL_6:
  [v7 setEnabled:v9];
}

- (void)_doneButtonTapped:(id)a3
{
  id v4 = [(UITextField *)self->_complexPasscodeField text];
  [(RUIPasscodeView *)self passcodeField:0 enteredPasscode:v4];
}

- (void)_jiggleView:(id)a3
{
  id v14 = [a3 layer];
  id v4 = [MEMORY[0x263F15890] animation];
  [v4 setMass:1.20000005];
  [v4 setStiffness:1200.0];
  [v4 setDamping:12.0];
  [v4 setDuration:1.39999998];
  [v4 setFillMode:*MEMORY[0x263F15AA0]];
  [v4 setDelegate:self];
  LODWORD(v5) = 30.0;
  id v6 = [NSNumber numberWithFloat:v5];
  [v4 setFromValue:v6];

  uint64_t v7 = [NSNumber numberWithFloat:0.0];
  [v4 setToValue:v7];

  double v8 = [MEMORY[0x263F15918] functionWithName:*MEMORY[0x263F16078]];
  [v4 setValueFunction:v8];

  LODWORD(v9) = 1028389654;
  LODWORD(v10) = 990057071;
  LODWORD(v11) = 1059712716;
  LODWORD(v12) = 1.0;
  id v13 = [MEMORY[0x263F15808] functionWithControlPoints:v9 :v10 :v11 :v12];
  [v4 setTimingFunction:v13];

  [v4 setKeyPath:@"transform"];
  [v14 addAnimation:v4 forKey:@"shake"];
}

- (BOOL)_requiresLocalPasscodeValidation
{
  dispatch_time_t v2 = [(RUIElement *)self attributes];
  BOOL v3 = [v2 objectForKeyedSubscript:@"requireLocalPasscode"];

  LOBYTE(v2) = [v3 isEqual:@"true"];
  return (char)v2;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  double v5 = [(RUIPasscodeView *)self page];
  int v6 = [v5 showsTitlesAsHeaderViews];

  uint64_t v7 = [(RUIPasscodeView *)self headerView];
  id v8 = v7;
  if (v6) {
    [v7 setIcon:v4 accessibilityLabel:0];
  }
  else {
    [v7 setIconImage:v4];
  }
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = [(RUIPasscodeView *)self page];
  char v7 = [v6 showsTitlesAsHeaderViews];

  if ((v7 & 1) == 0)
  {
    id v8 = [(RUIPasscodeView *)self headerView];
    objc_msgSend(v8, "setImageSize:", width, height);
  }
}

- (void)setImageAlignment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = [(RUIPasscodeView *)self page];
  char v6 = [v5 showsTitlesAsHeaderViews];

  if ((v6 & 1) == 0)
  {
    id v7 = [(RUIPasscodeView *)self headerView];
    [v7 setImageAlignment:v3];
  }
}

- (RUIObjectModel)objectModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  return (RUIObjectModel *)WeakRetained;
}

- (void)setObjectModel:(id)a3
{
}

- (RUIPage)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  return (RUIPage *)WeakRetained;
}

- (void)setPage:(id)a3
{
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (BOOL)shouldManageScrollViewInsets
{
  return self->_shouldManageScrollViewInsets;
}

- (void)setShouldManageScrollViewInsets:(BOOL)a3
{
  self->_shouldManageScrollViewInsets = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (NSString)submittedPIN
{
  return self->_submittedPIN;
}

- (void)setSubmittedPIN:(id)a3
{
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (unint64_t)numberOfEntryFields
{
  return self->_numberOfEntryFields;
}

- (RUIHeaderElement)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (RUIHTMLHeaderElement)HTMLHeader
{
  return self->_HTMLHeader;
}

- (void)setHTMLHeader:(id)a3
{
}

- (RUIElement)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_HTMLHeader, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_submittedPIN, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_destroyWeak((id *)&self->_page);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_storeStrong((id *)&self->_passcodeField, 0);
  objc_storeStrong((id *)&self->_pendingAutoFillToken, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_complexPasscodeField, 0);
  objc_storeStrong((id *)&self->_HTMLHeaderView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end