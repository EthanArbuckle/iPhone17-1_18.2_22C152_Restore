@interface RemoteUITableViewCell
- (BOOL)_tableIsGrouped;
- (BOOL)activityIndicatorVisible;
- (BOOL)forceFullSizeDetailLabel;
- (BOOL)leftAlignDetailLabel;
- (BOOL)shouldSkipCustomLayout;
- (CGRect)expand:(CGRect)a3 by:(CGSize)a4 anchor:(CGPoint)a5;
- (CGSize)imageSize;
- (RUIWebContainerView)webContainerView;
- (RemoteUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)badgeImageView;
- (UIView)remoteUIAccessoryView;
- (double)webViewWidth;
- (id)_checkmarkImage:(BOOL)a3;
- (id)_disclosureChevronImage:(BOOL)a3;
- (id)_paddedImageWithImage:(id)a3 size:(CGSize)a4 insets:(UIEdgeInsets)a5;
- (id)detailLinkButton;
- (id)editableTextField;
- (int64_t)remoteUIAccessoryType;
- (void)_accessoriesChanged;
- (void)_detailLinkPressed;
- (void)_setRemoteUIAccessoryType:(int64_t)a3 withColor:(id)a4;
- (void)_showActivityIndicatorAccessory;
- (void)addDetailLinkButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setActivityIndicatorVisible:(BOOL)a3;
- (void)setBadgeImage:(id)a3 tintColor:(id)a4 isCircular:(BOOL)a5;
- (void)setDetailLinkText:(id)a3 handler:(id)a4;
- (void)setForceFullSizeDetailLabel:(BOOL)a3;
- (void)setHTMLData:(id)a3 sourceURL:(id)a4 delegate:(id)a5;
- (void)setImage:(id)a3 padding:(UIEdgeInsets)a4 tintColor:(id)a5;
- (void)setImageSize:(CGSize)a3;
- (void)setLeftAlignDetailLabel:(BOOL)a3;
- (void)setRemoteUIAccessoryType:(int64_t)a3;
- (void)setRemoteUIAccessoryView:(id)a3;
- (void)setRowInvalid:(BOOL)a3;
- (void)setWebContainerView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation RemoteUITableViewCell

- (void)prepareForReuse
{
  [(RemoteUITableViewCell *)self setDetailLinkText:0 handler:0];
  [(RemoteUITableViewCell *)self setActivityIndicatorVisible:0];
  v3.receiver = self;
  v3.super_class = (Class)RemoteUITableViewCell;
  [(RemoteUITableViewCell *)&v3 prepareForReuse];
}

- (RemoteUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)RemoteUITableViewCell;
  v4 = [(RemoteUITableViewCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    badgeImageView = v4->_badgeImageView;
    v4->_badgeImageView = v5;

    [(UIImageView *)v4->_badgeImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(RemoteUITableViewCell *)v4 contentView];
    [v7 addSubview:v4->_badgeImageView];

    [(UIImageView *)v4->_badgeImageView setHidden:1];
    [(UIImageView *)v4->_badgeImageView setContentMode:1];
    v8 = (void *)MEMORY[0x263F08938];
    v9 = [(UIImageView *)v4->_badgeImageView widthAnchor];
    v10 = [v9 constraintEqualToConstant:20.0];
    v16[0] = v10;
    v11 = [(UIImageView *)v4->_badgeImageView heightAnchor];
    v12 = [v11 constraintEqualToConstant:20.0];
    v16[1] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    [v8 activateConstraints:v13];

    [(RemoteUITableViewCell *)v4 updateConstraints];
  }
  return v4;
}

- (void)updateConstraints
{
  v18[2] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)RemoteUITableViewCell;
  [(RemoteUITableViewCell *)&v17 updateConstraints];
  uint64_t v3 = [(UIImageView *)self->_badgeImageView superview];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(RemoteUITableViewCell *)self imageView];
    v6 = [v5 superview];

    if (v6)
    {
      v7 = (void *)MEMORY[0x263F08938];
      v8 = [(UIImageView *)self->_badgeImageView trailingAnchor];
      v9 = [(RemoteUITableViewCell *)self imageView];
      v10 = [v9 trailingAnchor];
      v11 = [v8 constraintEqualToAnchor:v10 constant:8.0];
      v18[0] = v11;
      v12 = [(UIImageView *)self->_badgeImageView bottomAnchor];
      v13 = [(RemoteUITableViewCell *)self imageView];
      v14 = [v13 bottomAnchor];
      objc_super v15 = [v12 constraintEqualToAnchor:v14 constant:6.0];
      v18[1] = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
      [v7 activateConstraints:v16];
    }
  }
}

- (void)setImage:(id)a3 padding:(UIEdgeInsets)a4 tintColor:(id)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  v11 = (UIImage *)a3;
  v12 = (UIColor *)a5;
  image = self->_image;
  self->_image = v11;
  v14 = v11;

  self->_imagePadding.CGFloat top = top;
  self->_imagePadding.CGFloat left = left;
  self->_imagePadding.CGFloat bottom = bottom;
  self->_imagePadding.CGFloat right = right;
  imageTintColor = self->_imageTintColor;
  self->_imageTintColor = v12;

  [(RemoteUITableViewCell *)self imageSize];
  -[RemoteUITableViewCell _paddedImageWithImage:size:insets:](self, "_paddedImageWithImage:size:insets:", v14);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  v16 = [(UITableViewCell *)self ruiImageView];
  [v16 setImage:v17];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if (self->_image)
  {
    id v11 = v4;
    v5 = [(RemoteUITableViewCell *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];
    uint64_t v7 = [v11 userInterfaceStyle];

    id v4 = v11;
    if (v6 != v7)
    {
      image = self->_image;
      [(RemoteUITableViewCell *)self imageSize];
      v9 = -[RemoteUITableViewCell _paddedImageWithImage:size:insets:](self, "_paddedImageWithImage:size:insets:", image);
      v10 = [(UITableViewCell *)self ruiImageView];
      [v10 setImage:v9];

      id v4 = v11;
    }
  }
}

- (id)_paddedImageWithImage:(id)a3 size:(CGSize)a4 insets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  v13 = v12;
  if (left == *(double *)(MEMORY[0x263F834E8] + 8)
    && top == *MEMORY[0x263F834E8]
    && right == *(double *)(MEMORY[0x263F834E8] + 24)
    && bottom == *(double *)(MEMORY[0x263F834E8] + 16))
  {
    id v23 = v12;
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x263F827A0]);
    v18 = (void *)MEMORY[0x263F827B0];
    v19 = [(RemoteUITableViewCell *)self traitCollection];
    v20 = [v18 formatForTraitCollection:v19];
    v21 = objc_msgSend(v17, "initWithSize:format:", v20, width, height);

    if (self->_imageTintColor)
    {
      objc_msgSend(v13, "imageWithTintColor:");
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = v13;
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __59__RemoteUITableViewCell__paddedImageWithImage_size_insets___block_invoke;
    v26[3] = &unk_264211288;
    double v28 = width;
    double v29 = height;
    double v30 = top;
    double v31 = left;
    double v32 = bottom;
    double v33 = right;
    id v27 = v22;
    id v24 = v22;
    id v23 = [v21 imageWithActions:v26];
  }
  return v23;
}

void __59__RemoteUITableViewCell__paddedImageWithImage_size_insets___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  double v1 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "imageByPreparingThumbnailOfSize:", *(double *)(a1 + 40) - v1 - *(double *)(a1 + 80), *(double *)(a1 + 48) - v2 - *(double *)(a1 + 72));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawAtPoint:", v1, v2);
}

- (void)_accessoriesChanged
{
  invalidRowView = self->_invalidRowView;
  remoteUIAccessoryView = self->_remoteUIAccessoryView;
  if (invalidRowView)
  {
    if (remoteUIAccessoryView)
    {
      double v5 = *MEMORY[0x263F001A8];
      double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
      [(UIImageView *)invalidRowView frame];
      double v8 = v7;
      double v10 = v9;
      [(UIView *)self->_remoteUIAccessoryView frame];
      double v13 = v11;
      double v14 = v12;
      if (v10 >= v12) {
        double v15 = v10;
      }
      else {
        double v15 = v12;
      }
      v16 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v5, v6, v8 + v11 + 6.0, v15);
      id v17 = self->_invalidRowView;
      id v23 = v16;
      [(UIImageView *)v23 addSubview:v17];
      [(UIImageView *)v23 addSubview:self->_remoteUIAccessoryView];

      float v18 = v15 * 0.5 - v10 * 0.5;
      float v19 = v15 * 0.5 - v14 * 0.5;
      double v20 = roundf(v19);
      -[UIImageView setFrame:](self->_invalidRowView, "setFrame:", v13 + 6.0, roundf(v18), v8, v10);
      -[UIView setFrame:](self->_remoteUIAccessoryView, "setFrame:", 0.0, v20, v13, v14);
      v21 = v23;
      goto LABEL_10;
    }
    id v22 = invalidRowView;
  }
  else
  {
    id v22 = remoteUIAccessoryView;
  }
  v21 = v22;
LABEL_10:
  id v24 = v21;
  [(RemoteUITableViewCell *)self setAccessoryView:v21];
  [(RemoteUITableViewCell *)self setEditingAccessoryView:v24];
}

- (id)_checkmarkImage:(BOOL)a3
{
  if (self->_accessoryColor)
  {
    v8.receiver = self;
    v8.super_class = (Class)RemoteUITableViewCell;
    id v4 = [(RemoteUITableViewCell *)&v8 _checkmarkImage:a3];
    double v5 = [v4 _flatImageWithColor:self->_accessoryColor];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RemoteUITableViewCell;
    double v5 = [(RemoteUITableViewCell *)&v7 _checkmarkImage:a3];
  }
  return v5;
}

- (id)_disclosureChevronImage:(BOOL)a3
{
  if (self->_accessoryColor)
  {
    v8.receiver = self;
    v8.super_class = (Class)RemoteUITableViewCell;
    id v4 = [(RemoteUITableViewCell *)&v8 _disclosureChevronImage:a3];
    double v5 = [v4 _flatImageWithColor:self->_accessoryColor];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RemoteUITableViewCell;
    double v5 = [(RemoteUITableViewCell *)&v7 _disclosureChevronImage:a3];
  }
  return v5;
}

- (id)editableTextField
{
  v6.receiver = self;
  v6.super_class = (Class)RemoteUITableViewCell;
  id v3 = [(RemoteUITableViewCell *)&v6 editableTextField];
  if (!self->_didSetupEditableTextFieldLargeText)
  {
    id v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [v3 setFont:v4];

    [v3 setAdjustsFontSizeToFitWidth:1];
    self->_didSetupEditableTextFieldLargeText = 1;
  }
  return v3;
}

- (void)_setRemoteUIAccessoryType:(int64_t)a3 withColor:(id)a4
{
  self->_remoteUIAccessoryType = a3;
  p_accessoryColor = &self->_accessoryColor;
  objc_storeStrong((id *)&self->_accessoryColor, a4);
  id v9 = a4;
  [(RemoteUITableViewCell *)self setAccessoryType:a3];
  objc_super v8 = *p_accessoryColor;
  *p_accessoryColor = 0;
}

- (void)setRemoteUIAccessoryType:(int64_t)a3
{
}

- (void)setRemoteUIAccessoryView:(id)a3
{
  double v5 = (UIView *)a3;
  p_remoteUIAccessoryView = &self->_remoteUIAccessoryView;
  if (self->_remoteUIAccessoryView != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)p_remoteUIAccessoryView, a3);
    p_remoteUIAccessoryView = (UIView **)[(RemoteUITableViewCell *)self _accessoriesChanged];
    double v5 = v7;
  }
  MEMORY[0x270F9A758](p_remoteUIAccessoryView, v5);
}

- (void)setActivityIndicatorVisible:(BOOL)a3
{
  if (self->_activityIndicatorVisible != a3)
  {
    self->_activityIndicatorVisible = a3;
    if (a3)
    {
      [(RemoteUITableViewCell *)self _showActivityIndicatorAccessory];
    }
    else
    {
      [(RemoteUITableViewCell *)self setAccessoryView:0];
      [(RemoteUITableViewCell *)self setEditingAccessoryView:0];
      [(RemoteUITableViewCell *)self _accessoriesChanged];
    }
  }
}

- (void)_showActivityIndicatorAccessory
{
  id v8 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v8 startAnimating];
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  [v8 bounds];
  double v5 = v4 + 16.0;
  [v8 bounds];
  objc_super v6 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, v5);
  [v6 addSubview:v8];
  [v6 bounds];
  double MidX = CGRectGetMidX(v10);
  [v6 bounds];
  objc_msgSend(v8, "setCenter:", MidX, CGRectGetMidY(v11));
  [(RemoteUITableViewCell *)self setAccessoryView:v6];
  [(RemoteUITableViewCell *)self setEditingAccessoryView:v6];
}

- (void)setHTMLData:(id)a3 sourceURL:(id)a4 delegate:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  [(RUIWebContainerView *)self->_webContainerView removeFromSuperview];
  webContainerView = self->_webContainerView;
  self->_webContainerView = 0;

  if (v14)
  {
    CGRect v11 = [[RUIWebContainerView alloc] initWithContent:v14 baseURL:v8];
    double v12 = self->_webContainerView;
    self->_webContainerView = v11;

    [(RUIWebContainerView *)self->_webContainerView setDelegate:v9];
    double v13 = [(RemoteUITableViewCell *)self contentView];
    [v13 addSubview:self->_webContainerView];
  }
}

- (void)_detailLinkPressed
{
  if (self->_detailLinkHandler)
  {
    [(RemoteUITableViewCell *)self _showActivityIndicatorAccessory];
    [(UIButton *)self->_detailLinkButton removeFromSuperview];
    [(RemoteUITableViewCell *)self setNeedsLayout];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__RemoteUITableViewCell__detailLinkPressed__block_invoke;
    block[3] = &unk_2642112D8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __43__RemoteUITableViewCell__detailLinkPressed__block_invoke(uint64_t a1)
{
  double v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 1056));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 1056);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__RemoteUITableViewCell__detailLinkPressed__block_invoke_2;
  v7[3] = &unk_2642112B0;
  v7[4] = v3;
  id v8 = v2;
  double v5 = *(void (**)(uint64_t, uint64_t, void *))(v4 + 16);
  id v6 = v2;
  v5(v4, v3, v7);
}

void __43__RemoteUITableViewCell__detailLinkPressed__block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2[132] == *(void *)(a1 + 40))
  {
    [v2 setAccessoryView:0];
    [*(id *)(a1 + 32) setEditingAccessoryView:0];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 1056);
    *(void *)(v3 + 1056) = 0;

    double v5 = *(id **)(a1 + 32);
    id v6 = [v5[131] titleForState:0];
    [v5 setDetailLinkText:v6 handler:*(void *)(a1 + 40)];
  }
}

- (void)addDetailLinkButton:(id)a3
{
  id v4 = [(RemoteUITableViewCell *)self contentView];
  [v4 addSubview:self->_detailLinkButton];
}

- (void)setDetailLinkText:(id)a3 handler:(id)a4
{
  id v6 = a3;
  if (self->_detailLinkHandler != a4)
  {
    id v18 = v6;
    objc_super v7 = (void *)[a4 copy];
    id detailLinkHandler = self->_detailLinkHandler;
    self->_id detailLinkHandler = v7;

    if (self->_detailLinkHandler)
    {
      id v9 = [MEMORY[0x263F824E8] buttonWithType:1];
      detailLinkButton = self->_detailLinkButton;
      self->_detailLinkButton = v9;

      CGRect v11 = [(UITableViewCell *)self ruiDetailTextLabel];
      [v11 setText:v18];

      double v12 = [(UITableViewCell *)self ruiDetailTextLabel];
      [v12 setHidden:1];

      [(UIButton *)self->_detailLinkButton setExclusiveTouch:1];
      [(UIButton *)self->_detailLinkButton addTarget:self action:sel__detailLinkPressed forControlEvents:64];
      [(UIButton *)self->_detailLinkButton setTitle:v18 forState:0];
      double v13 = [(UIButton *)self->_detailLinkButton titleLabel];
      id v14 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
      [v13 setFont:v14];

      [(RemoteUITableViewCell *)self addDetailLinkButton:self->_detailLinkButton];
    }
    else
    {
      double v15 = [(UITableViewCell *)self ruiDetailTextLabel];
      [v15 setHidden:0];

      v16 = [(UITableViewCell *)self ruiDetailTextLabel];
      [v16 setText:0];

      [(UIButton *)self->_detailLinkButton removeFromSuperview];
      id v17 = self->_detailLinkButton;
      self->_detailLinkButton = 0;
    }
    [(RemoteUITableViewCell *)self setNeedsLayout];
    id v6 = v18;
  }
}

- (id)detailLinkButton
{
  return self->_detailLinkButton;
}

- (CGRect)expand:(CGRect)a3 by:(CGSize)a4 anchor:(CGPoint)a5
{
  double v5 = a3.origin.x - a4.width * a5.x;
  double v6 = a3.origin.y - a4.height * a5.y;
  double v7 = a3.size.width + a4.width;
  double v8 = a3.size.height + a4.height;
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_tableIsGrouped
{
  uint64_t v3 = [(RemoteUITableViewCell *)self _tableView];
  if ([v3 style] == 2)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(RemoteUITableViewCell *)self _tableView];
    BOOL v4 = [v5 style] == 1;
  }
  return v4;
}

- (void)setBadgeImage:(id)a3 tintColor:(id)a4 isCircular:(BOOL)a5
{
  BOOL v5 = a5;
  badgeImageView = self->_badgeImageView;
  id v9 = a4;
  [(UIImageView *)badgeImageView setImage:a3];
  [(UIImageView *)self->_badgeImageView setHidden:a3 == 0];
  [(UIImageView *)self->_badgeImageView setTintColor:v9];

  CGRect v10 = self->_badgeImageView;
  if (v5)
  {
    [(UIImageView *)v10 _setCornerRadius:10.0];
    [(UIImageView *)self->_badgeImageView setClipsToBounds:1];
    if ([(RemoteUITableViewCell *)self _tableIsGrouped])
    {
      id v11 = [MEMORY[0x263F825C8] tableCellGroupedBackgroundColor];
      uint64_t v12 = [v11 CGColor];
      double v13 = [(UIImageView *)self->_badgeImageView layer];
      [v13 setBorderColor:v12];

      [MEMORY[0x263F825C8] tableCellGroupedBackgroundColor];
    }
    else
    {
      id v16 = [MEMORY[0x263F825C8] tableCellPlainBackgroundColor];
      uint64_t v17 = [v16 CGColor];
      id v18 = [(UIImageView *)self->_badgeImageView layer];
      [v18 setBorderColor:v17];

      [MEMORY[0x263F825C8] tableCellPlainBackgroundColor];
    }
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    [(UIImageView *)self->_badgeImageView setBackgroundColor:v19];
  }
  else
  {
    [(UIImageView *)v10 _setCornerRadius:0.0];
    [(UIImageView *)self->_badgeImageView setClipsToBounds:1];
    id v14 = [(UIImageView *)self->_badgeImageView layer];
    [v14 setBorderColor:0];

    double v15 = self->_badgeImageView;
    [(UIImageView *)v15 setBackgroundColor:0];
  }
}

- (BOOL)shouldSkipCustomLayout
{
  return 0;
}

- (void)layoutSubviews
{
  v306[1] = *MEMORY[0x263EF8340];
  v304.receiver = self;
  v304.super_class = (Class)RemoteUITableViewCell;
  [(RemoteUITableViewCell *)&v304 layoutSubviews];
  if ([(RemoteUITableViewCell *)self shouldSkipCustomLayout]) {
    return;
  }
  uint64_t v3 = [(RemoteUITableViewCell *)self contentView];
  BOOL v4 = [v3 superview];
  BOOL v5 = [(RemoteUITableViewCell *)self contentView];
  [v4 bringSubviewToFront:v5];

  double v6 = [(UIImageView *)self->_badgeImageView superview];
  [v6 bringSubviewToFront:self->_badgeImageView];

  double v7 = [(RemoteUITableViewCell *)self layoutManager];
  [(RemoteUITableViewCell *)self frame];
  [v7 textRectForCell:self rowWidth:0 forSizing:CGRectGetWidth(v307)];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  id v16 = [(RemoteUITableViewCell *)self traitCollection];
  uint64_t v17 = [v16 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

  id v19 = [(RemoteUITableViewCell *)self contentView];
  [v19 bounds];
  double v21 = v20;
  double v23 = v22;

  uint64_t v24 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[RemoteUITableViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  [(RemoteUITableViewCell *)self imageSize];
  double v26 = v25;
  [(RemoteUITableViewCell *)self imageSize];
  double v28 = v26 * v27;
  if (v26 * v27 != 0.0)
  {
    double v29 = [(RemoteUITableViewCell *)self imageView];
    double v30 = [v29 image];

    id v31 = objc_alloc(MEMORY[0x263F827A0]);
    [(RemoteUITableViewCell *)self imageSize];
    double v32 = objc_msgSend(v31, "initWithSize:");
    v301[0] = MEMORY[0x263EF8330];
    v301[1] = 3221225472;
    v301[2] = __39__RemoteUITableViewCell_layoutSubviews__block_invoke;
    v301[3] = &unk_264211300;
    id v302 = v30;
    v303 = self;
    id v33 = v30;
    v34 = [v32 imageWithActions:v301];
    v35 = [(RemoteUITableViewCell *)self imageView];
    [v35 setImage:v34];

    v300.receiver = self;
    v300.super_class = (Class)RemoteUITableViewCell;
    [(RemoteUITableViewCell *)&v300 layoutSubviews];
  }
  detailLinkButton = self->_detailLinkButton;
  if (detailLinkButton)
  {
    v37 = detailLinkButton;
  }
  else
  {
    v37 = [(RemoteUITableViewCell *)self detailTextLabel];
  }
  v38 = v37;
  v39 = [(UIButton *)self->_detailLinkButton titleLabel];
  v40 = v39;
  if (v39)
  {
    id v41 = v39;
  }
  else
  {
    id v41 = [(RemoteUITableViewCell *)self detailTextLabel];
  }
  v42 = v41;

  v43 = [(RemoteUITableViewCell *)self detailTextLabel];
  [v43 frame];
  -[UIButton setFrame:](v38, "setFrame:");

  [v42 setTextAlignment:2 * (v24 == 0)];
  -[UIButton sizeThatFits:](v38, "sizeThatFits:", v21, v23);
  double rect = v45;
  double v294 = v44;
  v308.origin.double x = v9;
  v308.origin.double y = v11;
  v308.size.double width = v13;
  v308.size.CGFloat height = v15;
  double MinX = CGRectGetMinX(v308);
  v309.origin.double x = v9;
  v309.origin.double y = v11;
  v309.size.double width = v13;
  v309.size.CGFloat height = v15;
  double v298 = v21 - CGRectGetMaxX(v309);
  double v299 = v15;
  if (!IsAccessibilityCategory)
  {
    double v296 = v9;
    v47 = [(RemoteUITableViewCell *)self editableTextField];
    [v47 frame];
    CGFloat v49 = v48;
    double v51 = v50;
    CGFloat v53 = v52;
    double v55 = v54;

    v56 = [(RemoteUITableViewCell *)self textLabel];
    [v56 frame];
    double MidY = CGRectGetMidY(v310);

    v311.origin.double x = v49;
    v311.origin.double y = v51;
    v311.size.double width = v53;
    v311.size.CGFloat height = v55;
    double v58 = v51 + MidY - CGRectGetMidY(v311);
    if (v24)
    {
      double v59 = MinX;
      [(RemoteUITableViewCell *)self textFieldOffset];
      double v61 = v21 - MinX - MinX - v60;
    }
    else
    {
      [(RemoteUITableViewCell *)self textFieldOffset];
      double v59 = MinX + v62;
      double v61 = v21 - (MinX + v62) - v298;
    }
    v63 = [(RemoteUITableViewCell *)self editableTextField];
    objc_msgSend(v63, "setFrame:", v59, v58, v61, v55);

    CGFloat v9 = v296;
  }
  uint64_t v64 = [(RemoteUITableViewCell *)self accessoryView];
  if (v64)
  {
    v65 = (void *)v64;
    int64_t v66 = [(RemoteUITableViewCell *)self remoteUIAccessoryType];

    if (!v66)
    {
      v67 = [(RemoteUITableViewCell *)self accessoryView];
      [v67 frame];
      double v68 = v9;
      double v70 = v69;
      double v72 = v71;
      double v74 = v73;
      double v76 = v75;

      double v77 = -6.0;
      if (!v24) {
        double v77 = 6.0;
      }
      double v78 = v77 + v70;
      v79 = [(RemoteUITableViewCell *)self accessoryView];
      double v80 = v78;
      CGFloat v9 = v68;
      objc_msgSend(v79, "setFrame:", v80, v72, v74, v76);
    }
  }
  v81 = [(RemoteUITableViewCell *)self textLabel];
  v82 = [v81 text];
  uint64_t v83 = [v82 length];

  v84 = [(RemoteUITableViewCell *)self editableTextField];
  v85 = v84;
  if (!v83)
  {
    [v84 frame];
    double v141 = v140;
    double v143 = v142;
    double v145 = v144;
    double v147 = v146;
    v148 = [(RemoteUITableViewCell *)self imageView];
    [v148 size];
    double v150 = v149;

    if (v150 == 0.0)
    {
      v151 = [(RemoteUITableViewCell *)self contentView];
      [v151 bounds];
      double MaxX = CGRectGetMaxX(v323);
    }
    else
    {
      v151 = [(RemoteUITableViewCell *)self imageView];
      [v151 frame];
      double MaxX = CGRectGetMinX(v320);
    }
    double v179 = MaxX;

    if (v24)
    {
      v324.origin.double x = v141;
      v324.origin.double y = v143;
      v324.size.double width = v145;
      v324.size.CGFloat height = v147;
      double v180 = v145 + v179 - CGRectGetMaxX(v324) - MinX;
      v325.origin.double x = v141;
      v325.origin.double y = v143;
      v325.size.double width = v180;
      v325.size.CGFloat height = v147;
      double MinX = v179 - CGRectGetWidth(v325) - MinX;
    }
    else
    {
      double v180 = v145 + v141 - MinX;
    }
    objc_msgSend(v85, "setFrame:", MinX, v143, v180, v147);

    goto LABEL_50;
  }
  if (v84) {
    char v86 = IsAccessibilityCategory;
  }
  else {
    char v86 = 1;
  }

  if ((v86 & 1) == 0)
  {
    v153 = [(RemoteUITableViewCell *)self editableTextField];
    [v153 frame];
    double v155 = v154;
    double v157 = v156;
    double v159 = v158;
    double v161 = v160;

    v162 = [(RemoteUITableViewCell *)self textLabel];
    [v162 frame];
    double v164 = v163;
    uint64_t v166 = v165;
    double v168 = v167;
    uint64_t v170 = v169;

    if (v24) {
      double v172 = v164 + -10.0;
    }
    else {
      double v172 = v164;
    }
    v321.origin.double x = v155;
    v321.origin.double y = v157;
    v321.size.double width = v159;
    v321.size.CGFloat height = v161;
    uint64_t v173 = v166;
    uint64_t v174 = v170;
    double v171 = v168 + 10.0;
    CGRect v322 = CGRectIntersection(v321, *(CGRect *)&v172);
    double width = v322.size.width;
    if (!CGRectIsNull(v322))
    {
      double v176 = -0.0;
      if (!v24) {
        double v176 = width;
      }
      double v177 = v155 + v176;
      v178 = [(RemoteUITableViewCell *)self editableTextField];
      objc_msgSend(v178, "setFrame:", v177, v157, v159 - width, v161);
    }
    goto LABEL_50;
  }
  double v289 = MinX;
  if (v38)
  {
    [v42 setTextAlignment:2 * (v24 != 0)];
    if (!IsAccessibilityCategory)
    {
      double v297 = v9;
      [(UIButton *)v38 frame];
      double x = v312.origin.x;
      double y = v312.origin.y;
      double v89 = v312.size.width;
      if (CGRectIsEmpty(v312))
      {
        double v90 = v294 - v89;
        if (v24) {
          double v90 = 0.0;
        }
        -[UIButton setFrame:](v38, "setFrame:", x - v90, y, v294, rect);
      }
      [(UIButton *)v38 frame];
      CGFloat v92 = v91;
      CGFloat v94 = v93;
      CGFloat v96 = v95;
      v97 = [(RemoteUITableViewCell *)self textLabel];
      [v97 frame];
      CGFloat v99 = v98;
      CGFloat v101 = v100;
      CGFloat v103 = v102;

      v313.origin.double x = 0.0;
      v343.origin.double x = 0.0;
      v313.origin.double y = v92;
      v313.size.double width = v94;
      v313.size.CGFloat height = v96;
      v343.origin.double y = v99;
      v343.size.double width = v101;
      v343.size.CGFloat height = v103;
      CGRect v314 = CGRectIntersection(v313, v343);
      if (!CGRectIsEmpty(v314))
      {
        if (self->_leftAlignDetailLabel)
        {
          [(UIButton *)v38 frame];
          double v105 = v104;
          CGFloat v107 = v106;
          CGFloat v109 = v108;
          double v111 = v110;
          v112 = [(RemoteUITableViewCell *)self textLabel];
          [v112 frame];
          uint64_t v114 = v113;
          uint64_t v116 = v115;
          uint64_t v118 = v117;
          uint64_t recta = v119;

          uint64_t v120 = v114;
          uint64_t v121 = v116;
          uint64_t v122 = v118;
          if (v24)
          {
            uint64_t v123 = recta;
            CGFloat v124 = CGRectGetMinX(*(CGRect *)&v120);
            CGFloat v125 = v105;
            CGFloat v126 = v124 + -10.0;
            v315.origin.double x = v125;
            v315.origin.double y = v107;
            v315.size.double width = v109;
            v315.size.CGFloat height = v111;
            double v127 = v126 - CGRectGetWidth(v315);
            v316.origin.double x = v127;
            v316.origin.double y = v107;
            v316.size.double width = v109;
            v316.size.CGFloat height = v111;
            double v128 = CGRectGetMaxX(v316);
            v129 = [(RemoteUITableViewCell *)self contentView];
            [v129 bounds];
            CGFloat v130 = v107;
            double v131 = CGRectGetMaxX(v317);
            [(RemoteUITableViewCell *)self textFieldOffset];
            double v133 = v131 - v132;

            CGFloat v134 = v109;
            double v135 = v130;
            if (v128 > v133)
            {
              v136 = [(RemoteUITableViewCell *)self contentView];
              [v136 bounds];
              double v137 = CGRectGetMaxX(v318);
              v319.origin.double x = v127;
              v319.origin.double y = v130;
              v319.size.double width = v134;
              v319.size.CGFloat height = v111;
              double v138 = v137 - CGRectGetWidth(v319);
              [(RemoteUITableViewCell *)self textFieldOffset];
              double v127 = v138 - v139;
            }
          }
          else
          {
            uint64_t v187 = recta;
            double v127 = CGRectGetMaxX(*(CGRect *)&v120) + 10.0;
            [(RemoteUITableViewCell *)self textFieldOffset];
            CGFloat v134 = v109;
            double v135 = v107;
            if (v127 < v188)
            {
              [(RemoteUITableViewCell *)self textFieldOffset];
              double v127 = v189;
            }
          }
          v190 = [(RemoteUITableViewCell *)self contentView];
          [v190 bounds];
          double v191 = CGRectGetMaxX(v326) - v298;

          v327.origin.double x = v127;
          v327.origin.double y = v135;
          v327.size.double width = v134;
          v327.size.CGFloat height = v111;
          double v192 = CGRectGetWidth(v327);
          if (v24)
          {
            double v193 = v192;
            v194 = [(RemoteUITableViewCell *)self contentView];
            [v194 bounds];
            double v195 = CGRectGetMaxX(v328);
            v329.origin.double x = v127;
            v329.origin.double y = v135;
            v329.size.double width = v134;
            v329.size.CGFloat height = v111;
            double v196 = v195 - CGRectGetMaxX(v329);

            double v197 = v191 - v196;
            v330.origin.double x = v127;
            v330.origin.double y = v135;
            v330.size.double width = v191 - v196;
            v330.size.CGFloat height = v111;
            double v127 = v127 + v193 - CGRectGetWidth(v330);
          }
          else
          {
            double v197 = v191 - v127;
          }
          -[UIButton setFrame:](v38, "setFrame:", v127, v135, v197, v111);
        }
        if (self->_forceFullSizeDetailLabel)
        {
          [(UIButton *)v38 frame];
          double v199 = v198;
          CGFloat rectb = v200;
          double v202 = v201;
          double v280 = v203;
          v204 = [(RemoteUITableViewCell *)self textLabel];
          [v204 frame];
          double v206 = v205;
          double v208 = v207;
          double v210 = v209;
          double v212 = v211;

          double v213 = v21 - v289 - v298;
          if (v294 < v213) {
            double v213 = v294;
          }
          double v214 = ceil(v213 - v202);
          double v215 = v202 + v214;
          if (v24) {
            double v214 = 0.0;
          }
          double v216 = v199 - v214;
          double v281 = v206;
          CGFloat v283 = v210;
          CGFloat v287 = v208;
          double v217 = FARectRoundMetrics(v206);
          CGFloat v219 = v218;
          CGFloat v221 = v220;
          CGFloat v223 = v222;
          CGFloat v285 = v216;
          v344.origin.double x = FARectRoundMetrics(v216);
          v344.origin.double y = v224;
          v344.size.double width = v225;
          v344.size.CGFloat height = v226;
          v331.origin.double x = v217;
          v331.origin.double y = v219;
          v331.size.double width = v221;
          v331.size.CGFloat height = v223;
          if (CGRectIntersectsRect(v331, v344))
          {
            double v227 = v281;
            v332.origin.double x = v281;
            v332.origin.double y = v287;
            v332.size.double width = v283;
            v332.size.CGFloat height = v212;
            double v228 = CGRectGetWidth(v332);
            if (v24)
            {
              double v279 = v228;
              v333.origin.double x = v281;
              double v229 = v287;
              v333.origin.double y = v287;
              v333.size.double width = v283;
              v333.size.CGFloat height = v212;
              double v230 = CGRectGetMaxX(v333);
              double v231 = v285;
              v334.origin.double x = v285;
              double v232 = rectb;
              v334.origin.double y = rectb;
              v334.size.double width = v215;
              v334.size.CGFloat height = v280;
              double v233 = fmax(v230 - CGRectGetMaxX(v334) + -6.0, 0.0);
              v335.origin.double x = v281;
              v335.origin.double y = v287;
              v335.size.double width = v233;
              v335.size.CGFloat height = v212;
              double v227 = v281 + v279 - CGRectGetWidth(v335);
            }
            else
            {
              double v231 = v216;
              v336.origin.double x = v216;
              double v232 = rectb;
              v336.origin.double y = rectb;
              v336.size.double width = v215;
              v336.size.CGFloat height = v280;
              CGFloat v234 = CGRectGetMinX(v336);
              v337.size.double width = v283;
              CGFloat v235 = v234 + -6.0;
              v337.origin.double x = v281;
              double v229 = v287;
              v337.origin.double y = v287;
              v337.size.CGFloat height = v212;
              double v233 = fmax(v235 - CGRectGetMinX(v337), 0.0);
            }
          }
          else
          {
            double v232 = rectb;
            double v227 = v281;
            double v233 = v283;
            double v229 = v287;
            double v231 = v285;
          }
          -[UIButton setFrame:](v38, "setFrame:", v231, v232, v215, v280, *(void *)&v279);
          v236 = [(RemoteUITableViewCell *)self textLabel];
          objc_msgSend(v236, "setFrame:", v227, v229, v233, v212);
        }
        if (!self->_leftAlignDetailLabel && !self->_forceFullSizeDetailLabel)
        {
          v237 = [(RemoteUITableViewCell *)self textLabel];
          [v237 frame];
          CGFloat v239 = v238;
          CGFloat v241 = v240;
          CGFloat v243 = v242;
          CGFloat v245 = v244;

          v246 = [(RemoteUITableViewCell *)self detailTextLabel];
          [v246 frame];
          CGFloat v248 = v247;
          CGFloat v250 = v249;
          double v295 = v251;
          double v253 = v252;

          CGFloat v282 = v239;
          v338.origin.double x = v239;
          double rectc = v241;
          v338.origin.double y = v241;
          double v288 = v243;
          v338.size.double width = v243;
          CGFloat v286 = v245;
          v338.size.CGFloat height = v245;
          CGRect v339 = CGRectInset(v338, -3.0, 0.0);
          CGFloat v254 = v339.origin.x;
          CGFloat v255 = v339.origin.y;
          CGFloat v256 = v339.size.width;
          CGFloat height = v339.size.height;
          v339.origin.double x = v248;
          CGFloat v284 = v250;
          v339.origin.double y = v250;
          double v258 = v253;
          double v259 = v295;
          v339.size.double width = v295;
          v339.size.CGFloat height = v258;
          CGRect v345 = CGRectInset(v339, -3.0, 0.0);
          v340.origin.double x = v254;
          v340.origin.double y = v255;
          v340.size.double width = v256;
          v340.size.CGFloat height = height;
          CGRect v341 = CGRectIntersection(v340, v345);
          if (!CGRectIsEmpty(v341) || v295 < 40.0)
          {
            double v260 = v288;
            if (v21 - v289 - v298 - v288 > 40.0)
            {
              double v262 = v284;
              double v261 = v286;
              double v263 = v282;
              double v264 = v248;
LABEL_83:
              v278 = [(RemoteUITableViewCell *)self textLabel];
              objc_msgSend(v278, "setFrame:", v263, rectc, v260, v261);

              -[UIButton setFrame:](v38, "setFrame:", v264, v262, v259, v258);
              goto LABEL_50;
            }
            v265 = [(RemoteUITableViewCell *)self detailTextLabel];
            v266 = [v265 text];
            uint64_t v267 = [v266 length];

            double v264 = v248;
            if (v267)
            {
              v268 = [(RemoteUITableViewCell *)self detailTextLabel];
              v269 = [v268 text];
              uint64_t v305 = *MEMORY[0x263F814F0];
              v270 = [(RemoteUITableViewCell *)self detailTextLabel];
              v271 = [v270 font];
              v306[0] = v271;
              v272 = [NSDictionary dictionaryWithObjects:v306 forKeys:&v305 count:1];
              [v269 sizeWithAttributes:v272];
              double v274 = v273;

              double v259 = fmin(v274, 40.0);
              if (v24)
              {
                double v264 = v289;
                v342.origin.double x = v289;
                double v262 = v284;
                v342.origin.double y = v284;
                v342.size.double width = v259;
                v342.size.CGFloat height = v258;
                CGFloat v275 = CGRectGetMaxX(v342) + 6.0;
                double v276 = v21 - v275;
                double v263 = v275;
                double v260 = v276 - v298;
                double v261 = v286;
                goto LABEL_83;
              }
              float v277 = v21 - v298 - v259;
              double v264 = floorf(v277);
              double v260 = v264 + -6.0 - v297;
            }
            double v262 = v284;
            double v261 = v286;
            double v263 = v282;
            goto LABEL_83;
          }
        }
      }
    }
  }
LABEL_50:
  [(RemoteUITableViewCell *)self webViewWidth];
  double v182 = v181;
  -[RUIWebContainerView heightForWidth:](self->_webContainerView, "heightForWidth:");
  if (v299 >= v183) {
    double v184 = v183;
  }
  else {
    double v184 = v299;
  }
  [(RemoteUITableViewCell *)self bounds];
  float v186 = (v185 - v184) * 0.5;
  -[RUIWebContainerView setFrame:](self->_webContainerView, "setFrame:", 10.0, floorf(v186), v182, v184);
}

uint64_t __39__RemoteUITableViewCell_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) imageSize];
  double v4 = v3;
  [*(id *)(a1 + 40) imageSize];
  return objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v4, v5);
}

- (double)webViewWidth
{
  double v3 = [(RemoteUITableViewCell *)self layoutManager];
  [(RemoteUITableViewCell *)self frame];
  [v3 textRectForCell:self rowWidth:0 forSizing:CGRectGetWidth(v7)];
  double v5 = v4;

  return v5;
}

- (void)setRowInvalid:(BOOL)a3
{
  invalidRowView = self->_invalidRowView;
  if (a3)
  {
    if (!invalidRowView)
    {
      double v5 = (void *)MEMORY[0x263F827E8];
      double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      CGRect v7 = [v5 imageNamed:@"NotVerified" inBundle:v6];
      id v10 = [v7 imageFlippedForRightToLeftLayoutDirection];

      double v8 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v10];
      CGFloat v9 = self->_invalidRowView;
      self->_invalidRowView = v8;

      [(RemoteUITableViewCell *)self _accessoriesChanged];
    }
  }
  else if (invalidRowView)
  {
    self->_invalidRowView = 0;

    [(RemoteUITableViewCell *)self _accessoriesChanged];
  }
}

- (BOOL)forceFullSizeDetailLabel
{
  return self->_forceFullSizeDetailLabel;
}

- (void)setForceFullSizeDetailLabel:(BOOL)a3
{
  self->_forceFullSizeDetailLabel = a3;
}

- (BOOL)leftAlignDetailLabel
{
  return self->_leftAlignDetailLabel;
}

- (void)setLeftAlignDetailLabel:(BOOL)a3
{
  self->_leftAlignDetailLabel = a3;
}

- (int64_t)remoteUIAccessoryType
{
  return self->_remoteUIAccessoryType;
}

- (UIView)remoteUIAccessoryView
{
  return self->_remoteUIAccessoryView;
}

- (BOOL)activityIndicatorVisible
{
  return self->_activityIndicatorVisible;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (RUIWebContainerView)webContainerView
{
  return self->_webContainerView;
}

- (void)setWebContainerView:(id)a3
{
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_webContainerView, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_accessoryColor, 0);
  objc_storeStrong(&self->_detailLinkHandler, 0);
  objc_storeStrong((id *)&self->_detailLinkButton, 0);
  objc_storeStrong((id *)&self->_remoteUIAccessoryView, 0);
  objc_storeStrong((id *)&self->_invalidRowView, 0);
}

@end