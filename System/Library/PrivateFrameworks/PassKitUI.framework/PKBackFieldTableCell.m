@interface PKBackFieldTableCell
- (BOOL)showLinks;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGRect)_textBounds;
- (CGSize)_computeSizeWithBounds:(CGRect)a3 shouldLayOut:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKBackFieldTableCell)initWithBridgeStyle:(BOOL)a3 reuseIdentifier:(id)a4;
- (PKPassField)field;
- (id)_linkTextAttributes;
- (void)_setUpTitleLabelAttributes;
- (void)_setUpValueTextViewAttributes;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setField:(id)a3;
- (void)setShowLinks:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKBackFieldTableCell

- (PKBackFieldTableCell)initWithBridgeStyle:(BOOL)a3 reuseIdentifier:(id)a4
{
  v5 = [(PKBackFieldTableCell *)self initWithStyle:0 reuseIdentifier:a4];
  v6 = v5;
  if (v5)
  {
    v5->_useBridgeStyle = a3;
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    valueTextView = v6->_valueTextView;
    v6->_valueTextView = (UITextView *)v7;

    v9 = [(UITextView *)v6->_valueTextView textContainer];
    [v9 setLineFragmentPadding:0.0];

    -[UITextView setTextContainerInset:](v6->_valueTextView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UITextView *)v6->_valueTextView setDelegate:v6];
    v10 = [(PKBackFieldTableCell *)v6 contentView];
    [v10 addSubview:v6->_valueTextView];

    [(PKBackFieldTableCell *)v6 setSelectionStyle:0];
  }
  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKBackFieldTableCell;
  [(PKBackFieldTableCell *)&v2 dealloc];
}

- (void)_setUpValueTextViewAttributes
{
  v3 = self->_valueTextView;
  v14 = v3;
  if (self->_showLinks)
  {
    [(UITextView *)v3 setDataDetectorTypes:[(PKPassField *)self->_field dataDetectorTypes]];
  }
  else
  {
    v4 = [(UITextView *)v3 webView];
    [v4 setDataDetectorTypes:0];
    [v4 setAllowsDataDetectorsSheet:0];
    [v4 setAllowsImageSheet:0];
    [v4 setAllowsLinkSheet:0];
  }
  [(UITextView *)v14 setSelectable:self->_showLinks];
  [(UITextView *)v14 setUserInteractionEnabled:self->_showLinks];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(PKPassField *)self->_field cellStyle] == 3) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  uint64_t v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  v8 = [(PKPassField *)self->_field link];
  v9 = [(PKPassField *)self->_field value];
  v10 = v9;
  if (v8 && [v9 length])
  {
    [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB0720]];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v5];
  }
  else
  {
    uint64_t v11 = PKAttributedStringByParsingLinksInString();
  }
  v12 = (void *)v11;
  [(UITextView *)v14 setAttributedText:v11];

  [(UITextView *)v14 setTextAlignment:4];
  v13 = [(PKBackFieldTableCell *)self _linkTextAttributes];
  [(UITextView *)v14 setLinkTextAttributes:v13];
}

- (void)setShowLinks:(BOOL)a3
{
  if (self->_showLinks != a3)
  {
    self->_showLinks = a3;
    [(PKBackFieldTableCell *)self _setUpValueTextViewAttributes];
    [(PKBackFieldTableCell *)self setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKBackFieldTableCell;
  [(PKBackFieldTableCell *)&v4 traitCollectionDidChange:a3];
  self->_cachedWidth = 0.0;
}

- (void)setField:(id)a3
{
  v6 = (PKPassField *)a3;
  if (self->_field != v6)
  {
    objc_storeStrong((id *)&self->_field, a3);
    self->_cachedWidth = 0.0;
    [(PKBackFieldTableCell *)self _setUpTitleLabelAttributes];
    [(PKBackFieldTableCell *)self _setUpValueTextViewAttributes];
    id v5 = [(PKPassField *)v6 key];
    PKAccessibilityIDCellSet(self, v5);

    [(PKBackFieldTableCell *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKBackFieldTableCell *)self _textBounds];
  if (self->_cachedWidth == v6)
  {
    double computedHeight = self->_computedHeight;
  }
  else
  {
    self->_cachedWidth = v6;
    -[PKBackFieldTableCell _computeSizeWithBounds:shouldLayOut:](self, "_computeSizeWithBounds:shouldLayOut:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
    double width = v8;
  }
  double v9 = width;
  result.double height = computedHeight;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKBackFieldTableCell;
  [(PKBackFieldTableCell *)&v3 layoutSubviews];
  [(PKBackFieldTableCell *)self bounds];
  -[PKBackFieldTableCell _computeSizeWithBounds:shouldLayOut:](self, "_computeSizeWithBounds:shouldLayOut:", 1);
}

- (CGSize)_computeSizeWithBounds:(CGRect)a3 shouldLayOut:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat width = a3.size.width;
  [(PKBackFieldTableCell *)self _textBounds];
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(PKBackFieldTableCell *)self textLabel];
  v14 = [v13 text];
  CGFloat v68 = width;
  if ([v14 length])
  {
    v15 = [v13 text];
    v16 = v15;
    if (v15 == @" ")
    {
      int v17 = 0;
    }
    else if (v15)
    {
      int v17 = [(__CFString *)v15 isEqualToString:@" "] ^ 1;
    }
    else
    {
      int v17 = 1;
    }
  }
  else
  {
    int v17 = 0;
  }

  v18 = [(UITextView *)self->_valueTextView text];
  uint64_t v19 = [v18 length];

  uint64_t v20 = [(PKPassField *)self->_field cellStyle];
  double v21 = 10.0;
  if (v20 == 3) {
    double v21 = 0.0;
  }
  double v67 = v12;
  double v22 = v12 - v21;
  -[UITextView sizeThatFits:](self->_valueTextView, "sizeThatFits:", v12 - v21, 1.79769313e308);
  double v24 = v23;
  CGFloat v26 = v25;
  if (v17)
  {
    objc_msgSend(v13, "sizeThatFits:", v22, 1.79769313e308);
    double v28 = v27;
    double v65 = v29;
    double v30 = *MEMORY[0x1E4F1DB30];
    double v31 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v30 = *MEMORY[0x1E4F1DB30];
    double v31 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v65 = v31;
    double v28 = *MEMORY[0x1E4F1DB30];
  }
  if (v19) {
    double v32 = v26;
  }
  else {
    double v32 = v31;
  }
  if (v19) {
    double v33 = v24;
  }
  else {
    double v33 = v30;
  }
  [(PKBackFieldTableCell *)self _shouldReverseLayoutDirection];
  unint64_t v34 = [(PKPassField *)self->_field cellStyle];
  if (v34 < 3)
  {
    if (v33 + v28 + 10.0 > v67)
    {
      double v35 = v10;
      double v36 = v31;
      if (v17)
      {
        objc_msgSend(v13, "sizeThatFits:", v67, 1.79769313e308);
        double v36 = v37;
      }
      if (v19)
      {
        -[UITextView sizeThatFits:](self->_valueTextView, "sizeThatFits:", v67, 1.79769313e308);
        double v31 = v38;
      }
      v70.origin.y = v35 + 7.0;
      v70.origin.x = v8;
      double v66 = v35 + 7.0;
      v70.size.CGFloat width = v67;
      v70.size.double height = v36;
      CGFloat MaxY = CGRectGetMaxY(v70);
      self->_double computedHeight = fmax(v36 + v31 + 7.0 + 7.0, 58.0);
      double v40 = MaxY + 2.0;
      CGFloat v41 = v8;
      double v42 = v67;
      double v43 = v41;
      double v44 = v67;
      if (!v4) {
        goto LABEL_37;
      }
LABEL_36:
      double v59 = v41;
      double v60 = v40;
      objc_msgSend(v13, "setFrame:", v59, v66, v44, v36);
      -[UITextView setFrame:](self->_valueTextView, "setFrame:", v43, v60, v42, v31);
      goto LABEL_37;
    }
    self->_double computedHeight = fmax(fmax(fmax(v65, 34.0), v32) + 7.0 + 7.0, 48.0);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    CGFloat v41 = v51;
    double v66 = v52;
    double v44 = v53;
    double v36 = v54;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    double v43 = v55;
    double v40 = v56;
    double v42 = v57;
    double v31 = v58;
LABEL_35:
    if (!v4) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  double v45 = v32;
  double v46 = v10;
  CGFloat v47 = v8;
  double v31 = 0.0;
  double v42 = 0.0;
  double v40 = 0.0;
  double v43 = 0.0;
  double v36 = 0.0;
  double v44 = 0.0;
  double v66 = 0.0;
  CGFloat v41 = 0.0;
  if (v34 != 3) {
    goto LABEL_35;
  }
  double v40 = v46 + 7.0;
  if (((v19 != 0) & v17) != 0) {
    double v48 = 58.0;
  }
  else {
    double v48 = 48.0;
  }
  if (v19)
  {
    CGFloat v41 = v47;
    v71.origin.x = v47;
    v71.origin.y = v46 + 7.0;
    double v44 = v67;
    v71.size.CGFloat width = v67;
    v71.size.double height = v26;
    double v49 = v40;
    CGFloat v50 = CGRectGetMaxY(v71);
    double v40 = v49;
    double v66 = v50;
    double v36 = v65;
  }
  else
  {
    double v36 = v65;
    double v64 = fmax(v65, v48 + -7.0 + -7.0);
    if (v17) {
      double v36 = v64;
    }
    double v66 = v46 + 7.0;
    CGFloat v41 = v47;
    double v44 = v67;
  }
  double v31 = v45;
  self->_double computedHeight = fmax(v48, v45 + 7.0 + v36 + 7.0);
  double v42 = v44;
  double v43 = v41;
  if (v4) {
    goto LABEL_36;
  }
LABEL_37:
  double computedHeight = self->_computedHeight;

  double v62 = v68;
  double v63 = computedHeight;
  result.double height = v63;
  result.CGFloat width = v62;
  return result;
}

- (CGRect)_textBounds
{
  [(PKBackFieldTableCell *)self separatorInset];
  double v4 = v3;
  int v5 = [(PKBackFieldTableCell *)self _shouldReverseLayoutDirection];
  if (v5) {
    double v6 = 15.0;
  }
  else {
    double v6 = v4;
  }
  if (v5) {
    double v7 = v4;
  }
  else {
    double v7 = 15.0;
  }
  CGFloat v8 = [(PKBackFieldTableCell *)self contentView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v6 + v11;
  double v14 = v13 + 0.0;
  double v16 = v15 - (v6 + v7);

  double v17 = v12;
  double v18 = v14;
  double v19 = v16;
  double v20 = v10;
  result.size.double height = v20;
  result.size.CGFloat width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_setUpTitleLabelAttributes
{
  id v7 = [(PKBackFieldTableCell *)self textLabel];
  double v3 = [(PKPassField *)self->_field label];
  [v7 setText:v3];

  if ([(PKPassField *)self->_field cellStyle] == 3)
  {
    double v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [v7 setFont:v4];

    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else
  {
    int v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v7 setFont:v5];

    [MEMORY[0x1E4FB1618] labelColor];
  double v6 = };
  [v7 setTextColor:v6];
}

- (id)_linkTextAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (self->_useBridgeStyle) {
    PKBridgeButtonTextColor();
  }
  else {
  objc_super v2 = [MEMORY[0x1E4FB1618] linkColor];
  }
  uint64_t v3 = *MEMORY[0x1E4FB0808];
  v6[0] = *MEMORY[0x1E4FB0700];
  v6[1] = v3;
  v7[0] = v2;
  v7[1] = &unk_1EF2B8D90;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v8
    && ([v8 absoluteString],
        double v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 hasPrefix:@"com.apple.Home-private://userLockSettings/"],
        v10,
        v11)
    && (id v12 = (id)*MEMORY[0x1E4F87298]) != 0)
  {
    double v13 = v12;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v14 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F62678]];
    [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F62628]];
    double v15 = SBSCreateOpenApplicationService();
    double v16 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v14];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__PKBackFieldTableCell_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    v19[3] = &unk_1E59D0A18;
    id v20 = v9;
    id v21 = v13;
    [v15 openApplication:v13 withOptions:v16 completion:v19];

    BOOL v17 = 0;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

void __75__PKBackFieldTableCell_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Attempted to open %@ at for %@, but got error: %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (PKPassField)field
{
  return self->_field;
}

- (BOOL)showLinks
{
  return self->_showLinks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTextView, 0);

  objc_storeStrong((id *)&self->_field, 0);
}

@end