@interface PKDashboardFooterTextView
- (BOOL)_isLinkRangeValid:(_NSRange)a3;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)useCustomContentInsets;
- (CGSize)_layoutWithBounds:(CGRect)a3 templateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)sources;
- (NSString)footerText;
- (PKDashboardFooterTextView)initWithFrame:(CGRect)a3;
- (UIColor)linkTextColor;
- (UIEdgeInsets)customContentInsets;
- (UIFont)font;
- (UIView)additionalView;
- (int64_t)maximumLines;
- (unint64_t)bottomInsetType;
- (unsigned)horizontalAlignment;
- (void)_updateText;
- (void)createSubviews;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)resetFonts;
- (void)setAdditionalView:(id)a3;
- (void)setBottomInsetType:(unint64_t)a3;
- (void)setCustomContentInsets:(UIEdgeInsets)a3;
- (void)setFont:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setHorizontalAlignment:(unsigned int)a3;
- (void)setLinkTextColor:(id)a3;
- (void)setMaximumLines:(int64_t)a3;
- (void)setSources:(id)a3;
- (void)setUseCustomContentInsets:(BOOL)a3;
@end

@implementation PKDashboardFooterTextView

- (PKDashboardFooterTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDashboardFooterTextView;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_horizontalAlignment = 0;
    v3->_bottomInsetType = 1;
    [(PKDashboardFooterTextView *)v3 createSubviews];
    [(PKDashboardCollectionViewCell *)v4 setWantsCustomAppearance:1];
  }
  return v4;
}

- (void)createSubviews
{
  objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v3;

  [(UITextView *)self->_textView textContainerInset];
  self->_defaultTextContainerInsets.top = v5;
  self->_defaultTextContainerInsets.left = v6;
  self->_defaultTextContainerInsets.bottom = v7;
  self->_defaultTextContainerInsets.right = v8;
  [(UITextView *)self->_textView setDelegate:self];
  [(UITextView *)self->_textView setSelectable:1];
  [(UITextView *)self->_textView setUserInteractionEnabled:1];
  [(UITextView *)self->_textView _setInteractiveTextSelectionDisabled:1];
  v9 = self->_textView;
  v10 = [MEMORY[0x1E4FB1D30] _defaultTextColorForTableViewStyle:1 isSectionHeader:0];
  [(UITextView *)v9 setTextColor:v10];

  v11 = self->_textView;
  uint64_t horizontalAlignment = self->_horizontalAlignment;
  int v13 = [(PKDashboardFooterTextView *)self _shouldReverseLayoutDirection];
  switch((int)horizontalAlignment)
  {
    case 1:
      break;
    case 2:
      if (v13) {
        uint64_t horizontalAlignment = 0;
      }
      else {
        uint64_t horizontalAlignment = 2;
      }
      break;
    case 3:
      uint64_t horizontalAlignment = 3;
      break;
    default:
      if (v13) {
        uint64_t horizontalAlignment = 2;
      }
      else {
        uint64_t horizontalAlignment = 0;
      }
      break;
  }
  [(UITextView *)v11 setTextAlignment:horizontalAlignment];
  uint64_t v14 = *MEMORY[0x1E4F855A8];
  [(PKDashboardFooterTextView *)self setAccessibilityIdentifier:*MEMORY[0x1E4F855A8]];
  v15 = [(PKDashboardFooterTextView *)self contentView];
  [v15 addSubview:self->_textView];

  [(PKDashboardFooterTextView *)self setAccessibilityIdentifier:v14];

  [(PKDashboardFooterTextView *)self resetFonts];
}

- (void)resetFonts
{
  textView = self->_textView;
  if (self->_font)
  {
    v3 = self->_textView;
    -[UITextView setFont:](v3, "setFont:");
  }
  else
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB2788], 0x8000, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UITextView *)textView setFont:v4];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardFooterTextView;
  [(PKDashboardCollectionViewCell *)&v3 layoutSubviews];
  [(PKDashboardFooterTextView *)self bounds];
  -[PKDashboardFooterTextView _layoutWithBounds:templateLayout:](self, "_layoutWithBounds:templateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDashboardFooterTextView _layoutWithBounds:templateLayout:](self, "_layoutWithBounds:templateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardFooterTextView;
  [(PKDashboardCollectionViewCell *)&v3 prepareForReuse];
  [(PKDashboardFooterTextView *)self setHorizontalAlignment:0];
  [(PKDashboardFooterTextView *)self setBottomInsetType:1];
  [(PKDashboardFooterTextView *)self setFont:0];
  [(PKDashboardFooterTextView *)self setFooterText:0];
  [(PKDashboardFooterTextView *)self setUseCustomContentInsets:0];
  [(PKDashboardFooterTextView *)self setMaximumLines:0];
  [(PKDashboardFooterTextView *)self setAdditionalView:0];
}

- (CGSize)_layoutWithBounds:(CGRect)a3 templateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_useCustomContentInsets) {
    p_defaultTextContainerInsets = (UIEdgeInsets *)MEMORY[0x1E4FB2848];
  }
  else {
    p_defaultTextContainerInsets = &self->_defaultTextContainerInsets;
  }
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", p_defaultTextContainerInsets->top, p_defaultTextContainerInsets->left, p_defaultTextContainerInsets->bottom, p_defaultTextContainerInsets->right);
  NSUInteger v11 = [(NSString *)self->_footerText length];
  if (self->_maximumLines)
  {
    v12 = [(UITextView *)self->_textView textContainer];
    [v12 setMaximumNumberOfLines:self->_maximumLines];

    int v13 = [(UITextView *)self->_textView textContainer];
    [v13 setLineBreakMode:4];
  }
  if (self->_useCustomContentInsets)
  {
    double top = self->_customContentInsets.top;
    double left = self->_customContentInsets.left;
    double bottom = self->_customContentInsets.bottom;
    double right = self->_customContentInsets.right;
  }
  else
  {
    unint64_t bottomInsetType = self->_bottomInsetType;
    if (bottomInsetType == 2)
    {
      [(UITextView *)self->_textView textContainerInset];
      -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:");
      double v19 = 26.0;
    }
    else
    {
      double v19 = 10.0;
      if (bottomInsetType != 1) {
        double v19 = 0.0;
      }
    }
    if (v11) {
      double top = 0.0;
    }
    else {
      double top = v19;
    }
    double v20 = v19;
    [(PKDashboardCollectionViewCell *)self horizontalInset];
    double bottom = v20;
    double left = right;
  }
  double v21 = width - left - right;
  double v22 = x + left;
  double v23 = width;
  double v24 = width - (right + left);
  memset(&slice, 0, sizeof(slice));
  remainder.origin.double x = v22;
  remainder.origin.double y = y + top;
  double v25 = height - (bottom + top);
  remainder.size.double width = v24;
  remainder.size.double height = v25;
  if (!v11)
  {
    double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    p_additionalView = &self->_additionalView;
    additionalView = self->_additionalView;
    if (!additionalView)
    {
      double v35 = 0.0;
      goto LABEL_28;
    }
    double v39 = bottom;
    double v31 = 0.0;
    goto LABEL_24;
  }
  double v39 = bottom;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v21, 3.40282347e38);
  CGFloat v27 = v26;
  v43.origin.double x = v22;
  v43.origin.double y = y + top;
  v43.size.double width = v24;
  v43.size.double height = v25;
  double v28 = v27;
  CGRectDivide(v43, &slice, &remainder, v27, CGRectMinYEdge);
  if (!a4)
  {
    textView = self->_textView;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UITextView setFrame:](textView, "setFrame:");
  }
  p_additionalView = &self->_additionalView;
  if (self->_additionalView)
  {
    double v31 = 12.0;
    CGRectDivide(remainder, &slice, &remainder, 12.0, CGRectMinYEdge);
    additionalView = *p_additionalView;
LABEL_24:
    -[UIView sizeThatFits:](additionalView, "sizeThatFits:", v21, 3.40282347e38);
    double v34 = v33;
    CGRectDivide(remainder, &slice, &remainder, v33, CGRectMinYEdge);
    double v35 = v31 + v34;
    if (!a4)
    {
      v36 = *p_additionalView;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIView setFrame:](v36, "setFrame:");
    }
    goto LABEL_27;
  }
  double v35 = 0.0;
LABEL_27:
  double bottom = v39;
LABEL_28:
  double v37 = bottom + top + v28 + v35;
  double v38 = v23;
  result.double height = v37;
  result.double width = v38;
  return result;
}

- (void)setFooterText:(id)a3
{
  double v4 = (NSString *)[a3 copy];
  footerText = self->_footerText;
  self->_footerText = v4;

  [(UITextView *)self->_textView setText:self->_footerText];
  linkTextColor = self->_linkTextColor;
  self->_linkTextColor = 0;

  sources = self->_sources;
  self->_sources = 0;

  [(PKDashboardFooterTextView *)self resetFonts];

  [(PKDashboardFooterTextView *)self setNeedsLayout];
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(PKDashboardFooterTextView *)self _updateText];
  }
}

- (void)setUseCustomContentInsets:(BOOL)a3
{
  if (self->_useCustomContentInsets != a3)
  {
    self->_useCustomContentInsets = a3;
    [(PKDashboardFooterTextView *)self setNeedsLayout];
  }
}

- (void)setCustomContentInsets:(UIEdgeInsets)a3
{
  if (self->_useCustomContentInsets
    && (a3.left != self->_customContentInsets.left
     || a3.top != self->_customContentInsets.top
     || a3.right != self->_customContentInsets.right
     || a3.bottom != self->_customContentInsets.bottom))
  {
    self->_customContentInsets = a3;
    [(PKDashboardFooterTextView *)self setNeedsLayout];
  }
}

- (void)setMaximumLines:(int64_t)a3
{
  if (self->_maximumLines != a3)
  {
    self->_maximumLines = a3;
    [(PKDashboardFooterTextView *)self setNeedsLayout];
  }
}

- (void)setSources:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sources, a3);
    [(PKDashboardFooterTextView *)self _updateText];
  }
}

- (void)setLinkTextColor:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_linkTextColor, a3);
    [(PKDashboardFooterTextView *)self _updateText];
  }
}

- (void)setBottomInsetType:(unint64_t)a3
{
  if (self->_bottomInsetType != a3)
  {
    self->_unint64_t bottomInsetType = a3;
    [(PKDashboardFooterTextView *)self setNeedsLayout];
  }
}

- (void)setHorizontalAlignment:(unsigned int)a3
{
  if (self->_horizontalAlignment != a3)
  {
    self->_uint64_t horizontalAlignment = a3;
    textView = self->_textView;
    int v6 = [(PKDashboardFooterTextView *)self _shouldReverseLayoutDirection];
    uint64_t v7 = a3;
    switch(a3)
    {
      case 1u:
        break;
      case 2u:
        if (v6) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = 2;
        }
        break;
      case 3u:
        uint64_t v7 = 3;
        break;
      default:
        if (v6) {
          uint64_t v7 = 2;
        }
        else {
          uint64_t v7 = 0;
        }
        break;
    }
    [(UITextView *)textView setTextAlignment:v7];
    [(PKDashboardFooterTextView *)self setNeedsLayout];
  }
}

- (void)setAdditionalView:(id)a3
{
  id v5 = (UIView *)a3;
  additionalView = self->_additionalView;
  if (additionalView != v5)
  {
    uint64_t v7 = v5;
    if (additionalView) {
      [(UIView *)additionalView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_additionalView, a3);
    if (v7) {
      [(PKDashboardFooterTextView *)self addSubview:v7];
    }
    [(PKDashboardFooterTextView *)self setNeedsLayout];
    id v5 = v7;
  }
}

- (void)_updateText
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  font = self->_font;
  if (font)
  {
    double v4 = font;
  }
  else
  {
    double v4 = [MEMORY[0x1E4FB1D30] _defaultFontForTableViewStyle:1 isSectionHeader:0];
  }
  id v5 = v4;
  uint64_t v6 = [MEMORY[0x1E4FB1D30] _defaultTextColorForTableViewStyle:1 isSectionHeader:0];
  linkTextColor = self->_linkTextColor;
  if (linkTextColor)
  {
    CGFloat v8 = linkTextColor;
  }
  else
  {
    CGFloat v8 = [MEMORY[0x1E4FB1618] linkColor];
  }
  double v23 = v8;
  NSUInteger v9 = [(NSString *)self->_footerText length];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:self->_footerText];
  uint64_t v22 = *MEMORY[0x1E4FB0700];
  double v24 = (void *)v6;
  objc_msgSend(v10, "addAttribute:value:range:");
  double v25 = v5;
  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v5, 0, v9);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_sources;
  uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    uint64_t v27 = *MEMORY[0x1E4FB0720];
    uint64_t v26 = *MEMORY[0x1E4FB0808];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = [*(id *)(*((void *)&v29 + 1) + 8 * v14) linkText];
        uint64_t v16 = [(NSString *)self->_footerText rangeOfString:v15];
        uint64_t v18 = v17;
        if (-[PKDashboardFooterTextView _isLinkRangeValid:](self, "_isLinkRangeValid:", v16, v17))
        {
          double v19 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EF1B5B50];
          objc_msgSend(v10, "addAttribute:value:range:", v27, v19, v16, v18);

          objc_msgSend(v10, "addAttribute:value:range:", v26, MEMORY[0x1E4F1CC28], v16, v18);
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v12);
  }

  [(UITextView *)self->_textView setAttributedText:v10];
  textView = self->_textView;
  uint64_t v33 = v22;
  double v34 = v23;
  double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  [(UITextView *)textView setLinkTextAttributes:v21];

  [(PKDashboardFooterTextView *)self setNeedsLayout];
}

- (BOOL)_isLinkRangeValid:(_NSRange)a3
{
  return a3.location != 0x7FFFFFFFFFFFFFFFLL
      && a3.length != 0
      && a3.location + a3.length <= [(NSString *)self->_footerText length];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger range2 = a5.length;
  NSUInteger location = a5.location;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_sources;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = [v13 linkText];
        v15 = [v8 text];
        NSUInteger v16 = [v15 rangeOfString:v14];
        NSUInteger v18 = v17;

        v30.NSUInteger location = v16;
        v30.length = v18;
        v31.NSUInteger location = location;
        v31.length = range2;
        if (NSIntersectionRange(v30, v31).length)
        {
          uint64_t v19 = [v13 action];
          double v20 = (void *)v19;
          if (v19) {
            (*(void (**)(uint64_t))(v19 + 16))(v19);
          }
        }
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  return 0;
}

- (unint64_t)bottomInsetType
{
  return self->_bottomInsetType;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (unsigned)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (NSArray)sources
{
  return self->_sources;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)maximumLines
{
  return self->_maximumLines;
}

- (BOOL)useCustomContentInsets
{
  return self->_useCustomContentInsets;
}

- (UIEdgeInsets)customContentInsets
{
  double top = self->_customContentInsets.top;
  double left = self->_customContentInsets.left;
  double bottom = self->_customContentInsets.bottom;
  double right = self->_customContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)additionalView
{
  return self->_additionalView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalView, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_footerText, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end