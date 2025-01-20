@interface SFHighlightContactListCell
- (BOOL)isFirstInList;
- (BOOL)isLastInList;
- (CNContact)contact;
- (SFHighlightContactListCell)initWithContact:(id)a3;
- (SFHighlightContactListCellDelegate)delegate;
- (id)infoViewControllerHandler;
- (void)_didReceiveTap:(id)a3;
- (void)_updateMaskedCorners;
- (void)setDelegate:(id)a3;
- (void)setFirstInList:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setInfoViewControllerHandler:(id)a3;
- (void)setLastInList:(BOOL)a3;
@end

@implementation SFHighlightContactListCell

- (SFHighlightContactListCell)initWithContact:(id)a3
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v84 = a3;
  v91.receiver = self;
  v91.super_class = (Class)SFHighlightContactListCell;
  v4 = -[SFHighlightContactListCell initWithFrame:](&v91, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v4)
  {
    objc_initWeak(&location, v4);
    uint64_t v5 = [v84 copy];
    contact = v4->_contact;
    v4->_contact = (CNContact *)v5;

    v7 = [MEMORY[0x1E4F982D8] sharedContactStoreManager];
    v79 = [v7 contactStore];

    v78 = [MEMORY[0x1E4F1BB50] settingsWithContactStore:v79];
    v80 = (void *)[objc_alloc(MEMORY[0x1E4F1BB40]) initWithSettings:v78];
    if (v84)
    {
      v93[0] = v84;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];
      [v80 setContacts:v8];
    }
    v9 = [v80 view];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFHighlightContactListCell *)v4 addSubview:v9];
    v85 = v9;
    id v77 = objc_alloc_init(MEMORY[0x1E4F1B910]);
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    uint64_t v11 = *MEMORY[0x1E4FB28C8];
    v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v10 setFont:v12];
    v86 = v10;

    [v10 setNumberOfLines:0];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setAdjustsFontForContentSizeCategory:1];
    v13 = [v77 stringFromContact:v84];
    [v10 setText:v13];

    LODWORD(v14) = 1144586240;
    [v10 setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = 1131413504;
    [v10 setContentHuggingPriority:0 forAxis:v15];
    [(SFHighlightContactListCell *)v4 addSubview:v10];
    v81 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
    objc_msgSend(v81, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    v16 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v11 scale:2];
    [v81 setPreferredSymbolConfigurationForImage:v16];

    v17 = (void *)MEMORY[0x1E4FB14D0];
    v18 = (void *)MEMORY[0x1E4FB13F0];
    v19 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle"];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __46__SFHighlightContactListCell_initWithContact___block_invoke;
    v87[3] = &unk_1E54EA9B0;
    objc_copyWeak(&v89, &location);
    id v88 = v84;
    v20 = [v18 actionWithTitle:&stru_1EDA07C28 image:v19 identifier:0 handler:v87];
    v82 = [v17 buttonWithConfiguration:v81 primaryAction:v20];

    [v82 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFHighlightContactListCell *)v4 addSubview:v82];
    v83 = [(SFHighlightContactListCell *)v4 layoutMarginsGuide];
    v48 = (void *)MEMORY[0x1E4F28DC8];
    v76 = [v85 leadingAnchor];
    v75 = [v83 leadingAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v92[0] = v74;
    v73 = [v85 widthAnchor];
    v72 = [v73 constraintEqualToConstant:22.0];
    v92[1] = v72;
    v71 = [v85 centerYAnchor];
    v70 = [(SFHighlightContactListCell *)v4 centerYAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v92[2] = v69;
    v68 = [v85 heightAnchor];
    v67 = [v68 constraintEqualToConstant:22.0];
    v92[3] = v67;
    v66 = [v85 topAnchor];
    v65 = [v83 topAnchor];
    v64 = [v66 constraintGreaterThanOrEqualToAnchor:v65];
    v92[4] = v64;
    v63 = [v86 leadingAnchor];
    v62 = [v85 trailingAnchor];
    v61 = [v63 constraintEqualToSystemSpacingAfterAnchor:v62 multiplier:1.0];
    v92[5] = v61;
    v60 = [v86 centerYAnchor];
    v59 = [(SFHighlightContactListCell *)v4 centerYAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v92[6] = v58;
    v57 = [v86 topAnchor];
    v56 = [v83 topAnchor];
    v55 = [v57 constraintGreaterThanOrEqualToAnchor:v56];
    v92[7] = v55;
    v54 = [v82 leadingAnchor];
    v53 = [v86 trailingAnchor];
    v52 = [v54 constraintEqualToSystemSpacingAfterAnchor:v53 multiplier:2.0];
    v92[8] = v52;
    v51 = [v82 centerYAnchor];
    v50 = [(SFHighlightContactListCell *)v4 centerYAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v92[9] = v49;
    v21 = [v82 topAnchor];
    v22 = [v83 topAnchor];
    v23 = [v21 constraintGreaterThanOrEqualToAnchor:v22];
    v92[10] = v23;
    v24 = [v82 trailingAnchor];
    v25 = [v83 trailingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v92[11] = v26;
    v27 = [(SFHighlightContactListCell *)v4 heightAnchor];
    v28 = [v27 constraintGreaterThanOrEqualToConstant:44.0];
    v92[12] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:13];
    [v48 activateConstraints:v29];

    [(SFHighlightContactListCell *)v4 bounds];
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    id v38 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v94.origin.x = v31;
    v94.origin.y = v33;
    v94.size.width = v35;
    v94.size.height = v37;
    double Height = CGRectGetHeight(v94);
    double v40 = _SFOnePixel();
    v95.origin.x = v31;
    v95.origin.y = v33;
    v95.size.width = v35;
    v95.size.height = v37;
    double Width = CGRectGetWidth(v95);
    uint64_t v42 = objc_msgSend(v38, "initWithFrame:", 0.0, Height - v40, Width, _SFOnePixel());
    separator = v4->_separator;
    v4->_separator = (UIView *)v42;

    [(UIView *)v4->_separator setAutoresizingMask:10];
    v44 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v4->_separator setBackgroundColor:v44];

    [(SFHighlightContactListCell *)v4 addSubview:v4->_separator];
    [(SFHighlightContactListCell *)v4 _updateMaskedCorners];
    v45 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__didReceiveTap_];
    [(SFHighlightContactListCell *)v4 addGestureRecognizer:v45];

    v46 = v4;
    objc_destroyWeak(&v89);

    objc_destroyWeak(&location);
  }

  return v4;
}

void __46__SFHighlightContactListCell_initWithContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained && WeakRetained[61])
  {
    v6 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:*(void *)(a1 + 32)];
    objc_initWeak(&location, v6);
    id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v8 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __46__SFHighlightContactListCell_initWithContact___block_invoke_2;
    v17 = &unk_1E54EA728;
    objc_copyWeak(&v18, &location);
    v9 = [v8 actionWithHandler:&v14];
    id v10 = objc_msgSend(v7, "initWithBarButtonSystemItem:primaryAction:", 0, v9, v14, v15, v16, v17);
    uint64_t v11 = [v6 navigationItem];
    [v11 setLeftBarButtonItem:v10];

    uint64_t v12 = v5[61];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __46__SFHighlightContactListCell_initWithContact___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFHighlightContactListCell;
  -[SFHighlightContactListCell setHighlighted:](&v6, sel_setHighlighted_);
  if (a3)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] systemGray4Color];
    [(SFHighlightContactListCell *)self setBackgroundColor:v5];
  }
  else
  {
    [(SFHighlightContactListCell *)self setBackgroundColor:0];
  }
}

- (void)setFirstInList:(BOOL)a3
{
  if (self->_firstInList != a3)
  {
    self->_firstInList = a3;
    [(SFHighlightContactListCell *)self _updateMaskedCorners];
  }
}

- (void)setLastInList:(BOOL)a3
{
  if (self->_lastInList != a3)
  {
    self->_lastInList = a3;
    -[UIView setHidden:](self->_separator, "setHidden:");
    [(SFHighlightContactListCell *)self _updateMaskedCorners];
  }
}

- (void)_updateMaskedCorners
{
  uint64_t v2 = 3;
  if (!self->_firstInList) {
    uint64_t v2 = 0;
  }
  if (self->_lastInList) {
    uint64_t v3 = v2 | 0xC;
  }
  else {
    uint64_t v3 = v2;
  }
  id v4 = [(SFHighlightContactListCell *)self layer];
  [v4 setMaskedCorners:v3];
}

- (void)_didReceiveTap:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cellDidReceiveTap:self];
}

- (CNContact)contact
{
  return self->_contact;
}

- (SFHighlightContactListCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFHighlightContactListCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFirstInList
{
  return self->_firstInList;
}

- (BOOL)isLastInList
{
  return self->_lastInList;
}

- (id)infoViewControllerHandler
{
  return self->_infoViewControllerHandler;
}

- (void)setInfoViewControllerHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_infoViewControllerHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_separator, 0);
}

@end