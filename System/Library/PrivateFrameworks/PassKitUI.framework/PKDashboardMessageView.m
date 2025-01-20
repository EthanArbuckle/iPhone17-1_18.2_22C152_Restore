@interface PKDashboardMessageView
- (BOOL)imageOnTrailingEdge;
- (BOOL)imageRequestExtraLarge;
- (BOOL)smallDevice;
- (BOOL)strokeImage;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNContact)avatarContact;
- (NSString)message;
- (NSString)secondaryMessage;
- (NSString)secondaryTitle;
- (NSString)title;
- (PKDashboardMessageView)initWithFrame:(CGRect)a3;
- (UIColor)iconImageBackgroundColor;
- (UIColor)iconImageTintColor;
- (UIImage)dismissImage;
- (UIImage)iconImage;
- (UIImage)messageImage;
- (UILabel)labelMessage;
- (UILabel)labelSecondaryMessage;
- (UILabel)labelSecondaryTitle;
- (UILabel)labelTitle;
- (double)leftContentInset;
- (id)_messageWithImageAttributedText;
- (id)actionOnDismiss;
- (int64_t)iconImageContentMode;
- (unint64_t)type;
- (void)_updateAvatarView;
- (void)_updateFonts;
- (void)_updateMessageLabel;
- (void)dismissButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setActionOnDismiss:(id)a3;
- (void)setAvatarContact:(id)a3;
- (void)setDismissImage:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageBackgroundColor:(id)a3;
- (void)setIconImageContentMode:(int64_t)a3;
- (void)setIconImageTintColor:(id)a3;
- (void)setImageOnTrailingEdge:(BOOL)a3;
- (void)setImageRequestExtraLarge:(BOOL)a3;
- (void)setLeftContentInset:(double)a3;
- (void)setMessage:(id)a3;
- (void)setMessage:(id)a3 withImage:(id)a4;
- (void)setMessageImage:(id)a3;
- (void)setSecondaryMessage:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSmallDevice:(BOOL)a3;
- (void)setStrokeImage:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateWithMessage:(id)a3;
@end

@implementation PKDashboardMessageView

- (PKDashboardMessageView)initWithFrame:(CGRect)a3
{
  v45.receiver = self;
  v45.super_class = (Class)PKDashboardMessageView;
  v3 = -[PKDashboardMessageView initWithFrame:](&v45, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __40__PKDashboardMessageView_initWithFrame___block_invoke;
    v42 = &unk_1E59CBEE0;
    objc_copyWeak(&v43, &location);
    v5 = [v4 actionWithHandler:&v39];
    v6 = (void *)MEMORY[0x1E4FB14D8];
    v7 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"xmark", v39, v40, v41, v42);
    v8 = (void *)MEMORY[0x1E4FB1830];
    v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09A8]];
    v10 = [v8 configurationWithFont:v9];
    v11 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v12 = objc_msgSend(v6, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v7, v10, v11);

    v3->_smallDevice = PKUIGetMinScreenWidthType() == 0;
    uint64_t v13 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v12 primaryAction:v5];
    dismissButton = v3->_dismissButton;
    v3->_dismissButton = (UIButton *)v13;

    [(UIButton *)v3->_dismissButton setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    [(PKDashboardMessageView *)v3 addSubview:v3->_dismissButton];
    id v15 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v16 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v20 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], v17, v18, v19);
    labelTitle = v3->_labelTitle;
    v3->_labelTitle = (UILabel *)v20;

    v22 = v3->_labelTitle;
    v23 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v22 setTextColor:v23];

    [(UILabel *)v3->_labelTitle setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(PKDashboardMessageView *)v3 addSubview:v3->_labelTitle];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v16, v17, v18, v19);
    labelSecondaryTitle = v3->_labelSecondaryTitle;
    v3->_labelSecondaryTitle = (UILabel *)v24;

    v26 = v3->_labelSecondaryTitle;
    v27 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v26 setTextColor:v27];

    [(UILabel *)v3->_labelSecondaryTitle setAccessibilityIdentifier:*MEMORY[0x1E4F85988]];
    [(PKDashboardMessageView *)v3 addSubview:v3->_labelSecondaryTitle];
    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v16, v17, v18, v19);
    labelMessage = v3->_labelMessage;
    v3->_labelMessage = (UILabel *)v28;

    v30 = v3->_labelMessage;
    v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v30 setTextColor:v31];

    [(UILabel *)v3->_labelMessage setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(PKDashboardMessageView *)v3 addSubview:v3->_labelMessage];
    uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v16, v17, v18, v19);
    labelSecondaryMessage = v3->_labelSecondaryMessage;
    v3->_labelSecondaryMessage = (UILabel *)v32;

    v34 = v3->_labelSecondaryMessage;
    v35 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v34 setTextColor:v35];

    [(UILabel *)v3->_labelSecondaryMessage setAccessibilityIdentifier:*MEMORY[0x1E4F85980]];
    [(PKDashboardMessageView *)v3 addSubview:v3->_labelSecondaryMessage];
    uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v16, v17, v18, v19);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v36;

    [(UIImageView *)v3->_iconImageView setContentMode:1];
    [(UIImageView *)v3->_iconImageView setClipsToBounds:1];
    [(UIImageView *)v3->_iconImageView _setContinuousCornerRadius:4.0];
    [(PKDashboardMessageView *)v3 addSubview:v3->_iconImageView];
    [(PKDashboardMessageView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F856E0]];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__PKDashboardMessageView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained dismissButtonPressed:v4];
}

- (void)updateWithMessage:(id)a3
{
  id v4 = a3;
  -[PKDashboardMessageView setType:](self, "setType:", [v4 type]);
  v5 = [v4 title];
  [(PKDashboardMessageView *)self setTitle:v5];

  v6 = [v4 secondaryTitle];
  [(PKDashboardMessageView *)self setSecondaryTitle:v6];

  v7 = [v4 message];
  v8 = [v4 messageImage];
  [(PKDashboardMessageView *)self setMessage:v7 withImage:v8];

  v9 = [v4 secondaryMessage];
  [(PKDashboardMessageView *)self setSecondaryMessage:v9];

  v10 = [v4 image];
  [(PKDashboardMessageView *)self setIconImage:v10];

  v11 = [v4 imageBackgroundColor];
  [(PKDashboardMessageView *)self setIconImageBackgroundColor:v11];

  -[PKDashboardMessageView setIconImageContentMode:](self, "setIconImageContentMode:", [v4 imageContentMode]);
  -[PKDashboardMessageView setImageOnTrailingEdge:](self, "setImageOnTrailingEdge:", [v4 imageOnTrailingEdge]);
  -[PKDashboardMessageView setImageRequestExtraLarge:](self, "setImageRequestExtraLarge:", [v4 imageRequestExtraLarge]);
  -[PKDashboardMessageView setStrokeImage:](self, "setStrokeImage:", [v4 strokeImage]);
  v12 = [v4 imageTintColor];
  [(PKDashboardMessageView *)self setIconImageTintColor:v12];

  uint64_t v13 = [v4 avatarContact];
  [(PKDashboardMessageView *)self setAvatarContact:v13];

  v14 = [v4 actionOnDismiss];
  id v15 = v4;
  id v16 = v14;
  double v17 = v16;
  if (v16)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = ___ReportableActionOnDismissPressedForMessageWithAction_block_invoke;
    v19[3] = &unk_1E59CAD68;
    id v21 = v16;
    id v20 = v15;
    double v18 = _Block_copy(v19);
  }
  else
  {
    double v18 = 0;
  }

  [(PKDashboardMessageView *)self setActionOnDismiss:v18];
  [(PKDashboardMessageView *)self _updateFonts];
}

- (void)setSmallDevice:(BOOL)a3
{
  self->_smallDevice = a3;
  [(PKDashboardMessageView *)self _updateFonts];
}

- (void)_updateFonts
{
  labelTitle = self->_labelTitle;
  id v4 = (void *)*MEMORY[0x1E4FB2950];
  v5 = (void *)*MEMORY[0x1E4FB28C8];
  if (self->_smallDevice) {
    v6 = (void *)*MEMORY[0x1E4FB2950];
  }
  else {
    v6 = (void *)*MEMORY[0x1E4FB28C8];
  }
  v7 = PKFontForDefaultDesign(v6, 0, 32770, 0);
  [(UILabel *)labelTitle setFont:v7];

  labelSecondaryTitle = self->_labelSecondaryTitle;
  if (self->_smallDevice) {
    v9 = v4;
  }
  else {
    v9 = v5;
  }
  v10 = PKFontForDefaultDesign(v9, 0, 32770, 0);
  [(UILabel *)labelSecondaryTitle setFont:v10];

  labelMessage = self->_labelMessage;
  v12 = (void *)*MEMORY[0x1E4FB28F0];
  if (self->_smallDevice) {
    uint64_t v13 = (void *)*MEMORY[0x1E4FB28F0];
  }
  else {
    uint64_t v13 = v4;
  }
  v14 = PKFontForDefaultDesign(v13, 0, self->_smallDevice << 15, 0);
  [(UILabel *)labelMessage setFont:v14];

  labelSecondaryMessage = self->_labelSecondaryMessage;
  if (self->_smallDevice) {
    id v16 = v12;
  }
  else {
    id v16 = v4;
  }
  PKFontForDefaultDesign(v16, 0, self->_smallDevice << 15, 0);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)labelSecondaryMessage setFont:v17];
}

- (void)prepareForReuse
{
  [(UIImageView *)self->_iconImageView setImage:0];
  [(PKDashboardMessageView *)self setIconImageBackgroundColor:0];
  [(PKDashboardMessageView *)self setIconImageContentMode:1];
  [(PKDashboardMessageView *)self setStrokeImage:0];
  [(UILabel *)self->_labelTitle setText:0];
  [(UILabel *)self->_labelSecondaryTitle setText:0];
  [(UILabel *)self->_labelMessage setText:0];
  [(UILabel *)self->_labelSecondaryMessage setText:0];
  dismissButton = self->_dismissButton;

  [(UIButton *)dismissButton setHidden:1];
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
  [(PKDashboardMessageView *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  p_title = &self->_title;
  objc_storeStrong((id *)&self->_title, a3);
  id v6 = a3;
  [(UILabel *)self->_labelTitle setText:*p_title];

  [(PKDashboardMessageView *)self setNeedsLayout];
}

- (void)setSecondaryTitle:(id)a3
{
  p_secondaryTitle = &self->_secondaryTitle;
  objc_storeStrong((id *)&self->_secondaryTitle, a3);
  id v6 = a3;
  [(UILabel *)self->_labelSecondaryTitle setText:*p_secondaryTitle];

  [(PKDashboardMessageView *)self setNeedsLayout];
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);

  [(PKDashboardMessageView *)self _updateMessageLabel];
}

- (void)setMessageImage:(id)a3
{
  objc_storeStrong((id *)&self->_messageImage, a3);

  [(PKDashboardMessageView *)self _updateMessageLabel];
}

- (void)setMessage:(id)a3 withImage:(id)a4
{
  id v6 = (NSString *)a3;
  v7 = (UIImage *)a4;
  message = self->_message;
  self->_message = v6;
  v9 = v6;

  messageImage = self->_messageImage;
  self->_messageImage = v7;

  [(PKDashboardMessageView *)self _updateMessageLabel];
}

- (void)_updateMessageLabel
{
  messageImage = self->_messageImage;
  labelMessage = self->_labelMessage;
  if (messageImage)
  {
    [(UILabel *)labelMessage setText:0];
    v5 = self->_labelMessage;
    id v6 = [(PKDashboardMessageView *)self _messageWithImageAttributedText];
    [(UILabel *)v5 setAttributedText:v6];
  }
  else
  {
    [(UILabel *)labelMessage setAttributedText:0];
    [(UILabel *)self->_labelMessage setText:self->_message];
  }

  [(PKDashboardMessageView *)self setNeedsLayout];
}

- (id)_messageWithImageAttributedText
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (self->_messageImage)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v3 setLineBreakMode:0];
    [v3 setFirstLineHeadIndent:0.0];
    uint64_t v12 = *MEMORY[0x1E4FB0738];
    v13[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v5 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:self->_messageImage];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    v7 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v5];
    [v6 appendAttributedString:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    v9 = [@" " stringByAppendingString:self->_message];
    v10 = (void *)[v8 initWithString:v9 attributes:v4];
    [v6 appendAttributedString:v10];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setSecondaryMessage:(id)a3
{
  p_secondaryMessage = &self->_secondaryMessage;
  objc_storeStrong((id *)&self->_secondaryMessage, a3);
  id v6 = a3;
  [(UILabel *)self->_labelSecondaryMessage setText:*p_secondaryMessage];

  [(PKDashboardMessageView *)self setNeedsLayout];
}

- (void)setIconImage:(id)a3
{
  p_iconImage = &self->_iconImage;
  objc_storeStrong((id *)&self->_iconImage, a3);
  id v6 = a3;
  [(UIImageView *)self->_iconImageView setImage:*p_iconImage];
  [(UIImageView *)self->_iconImageView setHidden:*p_iconImage == 0];

  [(PKDashboardMessageView *)self setNeedsLayout];
}

- (void)setIconImageBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageBackgroundColor, a3);
  id v5 = a3;
  [(UIImageView *)self->_iconImageView setBackgroundColor:v5];
}

- (void)setStrokeImage:(BOOL)a3
{
  self->_BOOL strokeImage = a3;
  double v4 = 0.0;
  if (a3) {
    double v4 = PKUIPixelLength();
  }
  id v5 = [(UIImageView *)self->_iconImageView layer];
  [v5 setBorderWidth:v4];

  BOOL strokeImage = self->_strokeImage;
  if (self->_strokeImage)
  {
    id v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
    uint64_t v7 = [v9 CGColor];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = [(UIImageView *)self->_iconImageView layer];
  [v8 setBorderColor:v7];

  if (strokeImage)
  {
  }
}

- (void)setIconImageContentMode:(int64_t)a3
{
  self->_iconImageContentMode = a3;
  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:");
}

- (void)setActionOnDismiss:(id)a3
{
  double v4 = _Block_copy(a3);
  id actionOnDismiss = self->_actionOnDismiss;
  self->_id actionOnDismiss = v4;

  id v8 = [(UIButton *)self->_dismissButton configuration];
  if (self->_imageOnTrailingEdge) {
    id v6 = @"xmark.circle.fill";
  }
  else {
    id v6 = @"xmark";
  }
  uint64_t v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v6];
  [v8 setImage:v7];

  [(UIButton *)self->_dismissButton setConfiguration:v8];
  [(UIButton *)self->_dismissButton setHidden:self->_actionOnDismiss == 0];
  [(PKDashboardMessageView *)self setNeedsLayout];
}

- (void)dismissButtonPressed:(id)a3
{
  id actionOnDismiss = (void (**)(id, SEL, id))self->_actionOnDismiss;
  if (actionOnDismiss)
  {
    actionOnDismiss[2](actionOnDismiss, a2, a3);
    BOOL v5 = self->_actionOnDismiss == 0;
  }
  else
  {
    BOOL v5 = 1;
  }
  dismissButton = self->_dismissButton;

  [(UIButton *)dismissButton setHidden:v5];
}

- (void)setIconImageTintColor:(id)a3
{
  p_iconImageTintColor = &self->_iconImageTintColor;
  objc_storeStrong((id *)&self->_iconImageTintColor, a3);
  id v6 = a3;
  [(UIImageView *)self->_iconImageView setTintColor:*p_iconImageTintColor];

  [(PKDashboardMessageView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardMessageView;
  [(PKDashboardMessageView *)&v3 layoutSubviews];
  [(PKDashboardMessageView *)self bounds];
  [(PKDashboardMessageView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKDashboardMessageView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v8);

  int v10 = [(PKDashboardMessageView *)self _shouldReverseLayoutDirection];
  if (v10) {
    int v11 = 2;
  }
  else {
    int v11 = 0;
  }
  CGRectEdge v87 = v11;
  if (v10) {
    int v12 = 0;
  }
  else {
    int v12 = 2;
  }
  CGRectEdge v84 = v12;
  BOOL smallDevice = self->_smallDevice;
  id actionOnDismiss = self->_actionOnDismiss;
  uint64_t v15 = 1;
  if (self->_type == 3)
  {
    int v16 = 1;
  }
  else
  {
    uint64_t v15 = 2;
    int v16 = IsAccessibilityCategory;
  }
  BOOL v17 = IsAccessibilityCategory;
  BOOL v18 = !IsAccessibilityCategory;
  if (IsAccessibilityCategory) {
    uint64_t v19 = 2 * (self->_type == 3);
  }
  else {
    uint64_t v19 = v15;
  }
  uint64_t v20 = v16 ^ 1u;
  if (v18) {
    uint64_t v21 = self->_type == 3;
  }
  else {
    uint64_t v21 = 2 * (self->_type == 3);
  }
  [(UILabel *)self->_labelTitle setNumberOfLines:v19];
  [(UILabel *)self->_labelTitle setAdjustsFontSizeToFitWidth:v20];
  [(UILabel *)self->_labelSecondaryTitle setNumberOfLines:v19];
  [(UILabel *)self->_labelSecondaryTitle setAdjustsFontSizeToFitWidth:v20];
  [(UILabel *)self->_labelMessage setNumberOfLines:v21];
  [(UILabel *)self->_labelMessage setAdjustsFontSizeToFitWidth:v20];
  [(UILabel *)self->_labelSecondaryMessage setNumberOfLines:v21];
  [(UILabel *)self->_labelSecondaryMessage setAdjustsFontSizeToFitWidth:v20];
  if (smallDevice) {
    double v22 = 10.0;
  }
  else {
    double v22 = 11.0;
  }
  double v23 = x + 14.0;
  double v24 = y + v22;
  double v25 = 27.0;
  if (!smallDevice) {
    double v25 = 25.0;
  }
  double v86 = width;
  double v26 = width - v25;
  double v27 = 20.0;
  if (!smallDevice) {
    double v27 = 22.0;
  }
  double v28 = height - v27;
  remainder.origin.double x = x + 14.0;
  remainder.origin.double y = y + v22;
  remainder.size.double width = v26;
  remainder.size.double height = v28;
  CGSize v29 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v94.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v94.CGSize size = v29;
  slice.origin = v94.origin;
  slice.CGSize size = v29;
  v92.origin = v94.origin;
  v92.CGSize size = v29;
  v91.origin = v94.origin;
  v91.CGSize size = v29;
  double v30 = 30.0;
  if (!self->_smallDevice)
  {
    if (self->_imageOnTrailingEdge)
    {
      if (self->_imageRequestExtraLarge) {
        double v30 = 83.0;
      }
      else {
        double v30 = 60.0;
      }
    }
    else
    {
      double v30 = 45.0;
    }
  }
  memset(&v95, 0, sizeof(v95));
  int v31 = v17;
  id v32 = actionOnDismiss;
  if (self->_iconImage && self->_iconImageView || (double v33 = v22, self->_avatarContact))
  {
    if (self->_imageOnTrailingEdge) {
      CGRectEdge v34 = v84;
    }
    else {
      CGRectEdge v34 = v87;
    }
    if (self->_imageOnTrailingEdge) {
      double v35 = v30 + 17.0;
    }
    else {
      double v35 = v30;
    }
    if (v31)
    {
      CGRectDivide(*(CGRect *)&v23, &slice, &remainder, v30, CGRectMinYEdge);
      CGRectDivide(remainder, &v95, &remainder, 10.0, CGRectMinYEdge);
      CGRectDivide(slice, &slice, &v92, v35, v34);
      if (self->_imageOnTrailingEdge) {
        p_CGRect slice = &slice;
      }
      else {
        p_CGRect slice = &v92;
      }
      CGSize size = p_slice->size;
      v90.origin = p_slice->origin;
      v90.CGSize size = size;
      CGFloat v38 = v90.origin.x;
      size.double width = v90.origin.y;
      CGFloat v39 = v90.size.width;
      CGFloat v40 = v90.size.height;
      CGRectDivide(*(CGRect *)((char *)&size - 8), &v91, &v90, 17.0, v84);
      CGRectDivide(v91, &v91, &v90, 17.0, CGRectMinYEdge);
      double v33 = v22 + v30 + 10.0;
    }
    else
    {
      CGRectDivide(*(CGRect *)&v23, &v94, &remainder, v35, v34);
      CGRectDivide(v94, &slice, &v92, 10.0, CGRectMinYEdge);
      CGRectDivide(v92, &slice, &v92, v30, CGRectMinYEdge);
      if (self->_imageOnTrailingEdge) {
        double v41 = 3.0;
      }
      else {
        double v41 = 12.0;
      }
      CGRectDivide(remainder, &v95, &remainder, v41, v34);
      double v33 = v22;
    }
  }
  double v83 = v33;
  double v85 = v22;
  CGRect v90 = remainder;
  CGSize v42 = remainder.size;
  -[UILabel sizeThatFits:](self->_labelTitle, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v44 = v43;
  [(UILabel *)self->_labelSecondaryTitle sizeThatFits:v42];
  double v46 = v45;
  [(UILabel *)self->_labelMessage sizeThatFits:v42];
  double v48 = v47;
  [(UILabel *)self->_labelSecondaryMessage sizeThatFits:v42];
  double v50 = v49;
  double v51 = v44 + 0.0;
  if (v44 <= 0.0) {
    double v51 = 0.0;
  }
  if (v46 <= 0.0) {
    double v52 = -0.0;
  }
  else {
    double v52 = v46;
  }
  double v53 = v51 + v52;
  BOOL v54 = v50 <= 0.0 && v48 <= 0.0;
  double v55 = v48 + 3.0 + v50;
  if (v54) {
    double v55 = -0.0;
  }
  double v56 = v53 + v55;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  CGRect v90 = v98;
  memset(&v89, 0, sizeof(v89));
  CGRectDivide(v98, &v89, &v90, v44 + v46, CGRectMinYEdge);
  if (actionOnDismiss) {
    int v57 = v31;
  }
  else {
    int v57 = 1;
  }
  if (v57 != 1)
  {
    if (self->_imageOnTrailingEdge) {
      v58 = &v94;
    }
    else {
      v58 = &v89;
    }
    p_double y = &v89.origin.y;
    if (self->_imageOnTrailingEdge) {
      p_double y = &v94.origin.y;
    }
    uint64_t v61 = *(void *)p_y;
    p_CGSize size = &v89.size;
    if (self->_imageOnTrailingEdge) {
      p_CGSize size = &v94.size;
    }
    p_double height = &v94.size.height;
    if (!self->_imageOnTrailingEdge) {
      p_double height = &v89.size.height;
    }
    uint64_t v65 = *(void *)p_height;
    CGFloat v59 = v58->origin.x;
    CGFloat v63 = p_size->width;
    CGRectDivide(*(CGRect *)(&v61 - 1), &v91, v58, 17.0, v84);
    if (!self->_isTemplateLayout)
    {
      CGRect v88 = v91;
      v66 = [(UILabel *)self->_labelTitle font];
      [v66 lineHeight];
      CGRectDivide(v91, &v88, &v91, v67, CGRectMinYEdge);

      dismissButton = self->_dismissButton;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIButton setFrame:](dismissButton, "setFrame:");
    }
    if (self->_imageOnTrailingEdge)
    {
      CGFloat v69 = v94.origin.x;
      CGFloat v70 = v94.origin.y;
      CGFloat v71 = v94.size.width;
      CGFloat v72 = v94.size.height;
      v73 = &v94;
      CGFloat v74 = 3.0;
    }
    else
    {
      CGFloat v69 = v89.origin.x;
      CGFloat v70 = v89.origin.y;
      CGFloat v71 = v89.size.width;
      CGFloat v72 = v89.size.height;
      v73 = &v89;
      CGFloat v74 = 13.0;
    }
    CGRectDivide(*(CGRect *)&v69, &v91, v73, v74, v84);
    id v32 = actionOnDismiss;
  }
  if (!self->_isTemplateLayout)
  {
    labelTitle = self->_labelTitle;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelTitle, "setFrame:");
    CGRectDivide(v89, &v95, &v89, v44, CGRectMinYEdge);
    labelSecondaryTitle = self->_labelSecondaryTitle;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelSecondaryTitle, "setFrame:");
  }
  CGRectDivide(v90, &v95, &v90, 3.0, CGRectMinYEdge);
  memset(&v88, 0, sizeof(v88));
  CGRectDivide(v90, &v88, &v90, v48 + v50, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    labelMessage = self->_labelMessage;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelMessage, "setFrame:");
    CGRectDivide(v88, &v95, &v88, v48, CGRectMinYEdge);
    labelSecondaryMessage = self->_labelSecondaryMessage;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelSecondaryMessage, "setFrame:");
    avatarView = self->_avatarView;
    if (avatarView || (avatarView = self->_iconImageView) != 0)
    {
      PKSizeAlignedInRect();
      objc_msgSend(avatarView, "setFrame:");
    }
    if (v32 && ((v31 ^ 1) & 1) == 0)
    {
      v80 = self->_dismissButton;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIButton setFrame:](v80, "setFrame:");
    }
  }
  double v81 = v85 + v83 + v56;
  double v82 = v86;
  result.double height = v81;
  result.double width = v82;
  return result;
}

- (void)setAvatarContact:(id)a3
{
  double v5 = (CNContact *)a3;
  if (self->_avatarContact != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_avatarContact, a3);
    [(PKDashboardMessageView *)self _updateAvatarView];
    double v5 = v6;
  }
}

- (void)_updateAvatarView
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self->_avatarContact)
  {
    [(PKDashboardMessageView *)self setIconImage:0];
    [(PKDashboardMessageView *)self setIconImageTintColor:0];
    avatarView = self->_avatarView;
    if (!avatarView)
    {
      double v4 = (CNAvatarView *)objc_msgSend(objc_alloc(getCNAvatarViewClass()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v5 = self->_avatarView;
      self->_avatarView = v4;

      [(CNAvatarView *)self->_avatarView setUserInteractionEnabled:0];
      [(CNAvatarView *)self->_avatarView setAsynchronousRendering:1];
      [(CNAvatarView *)self->_avatarView setShowsContactOnTap:0];
      [(PKDashboardMessageView *)self addSubview:self->_avatarView];
      avatarView = self->_avatarView;
    }
    v9[0] = self->_avatarContact;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(CNAvatarView *)avatarView setContacts:v6];

    [(PKDashboardMessageView *)self setNeedsLayout];
  }
  else
  {
    uint64_t v7 = self->_avatarView;
    if (v7)
    {
      [(CNAvatarView *)v7 removeFromSuperview];
      id v8 = self->_avatarView;
      self->_avatarView = 0;

      [(PKDashboardMessageView *)self setNeedsLayout];
    }
  }
}

- (BOOL)smallDevice
{
  return self->_smallDevice;
}

- (double)leftContentInset
{
  return self->_leftContentInset;
}

- (void)setLeftContentInset:(double)a3
{
  self->_leftContentInset = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (UILabel)labelTitle
{
  return self->_labelTitle;
}

- (UILabel)labelSecondaryTitle
{
  return self->_labelSecondaryTitle;
}

- (UILabel)labelMessage
{
  return self->_labelMessage;
}

- (UILabel)labelSecondaryMessage
{
  return self->_labelSecondaryMessage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (NSString)message
{
  return self->_message;
}

- (UIImage)messageImage
{
  return self->_messageImage;
}

- (NSString)secondaryMessage
{
  return self->_secondaryMessage;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (BOOL)imageOnTrailingEdge
{
  return self->_imageOnTrailingEdge;
}

- (void)setImageOnTrailingEdge:(BOOL)a3
{
  self->_imageOnTrailingEdge = a3;
}

- (BOOL)imageRequestExtraLarge
{
  return self->_imageRequestExtraLarge;
}

- (void)setImageRequestExtraLarge:(BOOL)a3
{
  self->_imageRequestExtraLarge = a3;
}

- (UIColor)iconImageTintColor
{
  return self->_iconImageTintColor;
}

- (UIColor)iconImageBackgroundColor
{
  return self->_iconImageBackgroundColor;
}

- (BOOL)strokeImage
{
  return self->_strokeImage;
}

- (int64_t)iconImageContentMode
{
  return self->_iconImageContentMode;
}

- (UIImage)dismissImage
{
  return self->_dismissImage;
}

- (void)setDismissImage:(id)a3
{
}

- (CNContact)avatarContact
{
  return self->_avatarContact;
}

- (id)actionOnDismiss
{
  return self->_actionOnDismiss;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionOnDismiss, 0);
  objc_storeStrong((id *)&self->_avatarContact, 0);
  objc_storeStrong((id *)&self->_dismissImage, 0);
  objc_storeStrong((id *)&self->_iconImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_iconImageTintColor, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_secondaryMessage, 0);
  objc_storeStrong((id *)&self->_messageImage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_labelSecondaryMessage, 0);
  objc_storeStrong((id *)&self->_labelMessage, 0);
  objc_storeStrong((id *)&self->_labelSecondaryTitle, 0);

  objc_storeStrong((id *)&self->_labelTitle, 0);
}

@end