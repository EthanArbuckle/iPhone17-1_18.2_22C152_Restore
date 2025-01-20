@interface PXComposeRecipientTableViewCell
- (PXComposeRecipientTableCellModel)cellModel;
- (PXComposeRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)popoverSourceView;
- (id)_textColor;
- (void)_updateAccessoryImageView;
- (void)_updateAddressLabel;
- (void)_updateAvatarView;
- (void)_updateLocalizedNameLabel;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setPopoverSourceView:(id)a3;
@end

@implementation PXComposeRecipientTableViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverSourceView, 0);
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_localizedNameLabel, 0);
  objc_storeStrong((id *)&self->_customAvatarImageView, 0);
  objc_storeStrong((id *)&self->_contactAvatarViewController, 0);
  objc_storeStrong((id *)&self->_contactAvatarView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

- (void)setPopoverSourceView:(id)a3
{
}

- (PXComposeRecipientTableCellModel)cellModel
{
  return self->_cellModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXComposeRecipientTableCellModelObservationContext == a5)
  {
    uint64_t v9 = v6 & 0x1C;
    uint64_t v10 = v6 & 0x18;
    id v12 = v8;
    if ((v6 & 0x81) != 0)
    {
      [(PXComposeRecipientTableViewCell *)self _updateAvatarView];
      id v8 = v12;
    }
    uint64_t v11 = v6 & 0x60;
    if (v9)
    {
      [(PXComposeRecipientTableViewCell *)self _updateLocalizedNameLabel];
      id v8 = v12;
    }
    if (v10)
    {
      [(PXComposeRecipientTableViewCell *)self _updateAddressLabel];
      id v8 = v12;
    }
    if (v11)
    {
      [(PXComposeRecipientTableViewCell *)self _updateAccessoryImageView];
      id v8 = v12;
    }
  }
}

- (void)_updateAccessoryImageView
{
  if ([(PXComposeRecipientTableCellModel *)self->_cellModel showsCheckbox])
  {
    if ([(PXComposeRecipientTableCellModel *)self->_cellModel checked])
    {
      v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
      [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    else
    {
      v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
      [MEMORY[0x1E4FB1618] systemLightGrayColor];
    v4 = };
    [(UIImageView *)self->_accessoryImageView setImage:v3];
    [(UIImageView *)self->_accessoryImageView setTintColor:v4];
    [(UIImageView *)self->_accessoryImageView sizeToFit];
    [(UIImageView *)self->_accessoryImageView setHidden:0];
  }
  else
  {
    [(UIImageView *)self->_accessoryImageView setHidden:1];
  }
  [(PXComposeRecipientTableViewCell *)self setNeedsLayout];
}

- (void)_updateAddressLabel
{
  id v5 = [(PXComposeRecipientTableCellModel *)self->_cellModel address];
  [(UILabel *)self->_addressLabel setText:v5];
  if (v5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 3;
  }
  [(PXComposeRecipientTableViewCell *)self setSelectionStyle:v3];
  v4 = [(PXComposeRecipientTableViewCell *)self _textColor];
  [(UILabel *)self->_addressLabel setTextColor:v4];

  [(PXComposeRecipientTableViewCell *)self setNeedsLayout];
}

- (void)_updateLocalizedNameLabel
{
  uint64_t v3 = [(PXComposeRecipientTableCellModel *)self->_cellModel name];
  [(UILabel *)self->_localizedNameLabel setText:v3];

  v4 = [(PXComposeRecipientTableViewCell *)self _textColor];
  [(UILabel *)self->_localizedNameLabel setTextColor:v4];

  id v5 = [(PXComposeRecipientTableCellModel *)self->_cellModel address];

  if (v5) {
    uint64_t v6 = 32770;
  }
  else {
    uint64_t v6 = 0x8000;
  }
  objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], v6, 2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_localizedNameLabel setFont:v7];
  [(PXComposeRecipientTableViewCell *)self setNeedsLayout];
}

- (void)_updateAvatarView
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PXComposeRecipientTableCellModel *)self->_cellModel contact];
  if (v4)
  {
    if (!self->_contactAvatarViewController)
    {
      id v5 = (CNAvatarViewController *)objc_alloc_init(MEMORY[0x1E4F1BB40]);
      contactAvatarViewController = self->_contactAvatarViewController;
      self->_contactAvatarViewController = v5;

      id v7 = [(CNAvatarViewController *)self->_contactAvatarViewController view];
      contactAvatarView = self->_contactAvatarView;
      self->_contactAvatarView = v7;

      uint64_t v9 = [(PXComposeRecipientTableViewCell *)self contentView];
      [v9 addSubview:self->_contactAvatarView];
    }
    v21[0] = v4;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [(CNAvatarViewController *)self->_contactAvatarViewController setContacts:v10];

    uint64_t v11 = self->_contactAvatarView;
    [(UIView *)self->_contactAvatarView setHidden:0];
    [(PXRoundImageView *)self->_customAvatarImageView setHidden:1];
    if (v11) {
      goto LABEL_5;
    }
LABEL_9:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewCell+iOS.m", 168, @"Invalid parameter not satisfying: %@", @"avatarView" object file lineNumber description];

    goto LABEL_5;
  }
  v14 = [(PXComposeRecipientTableCellModel *)self->_cellModel image];
  customAvatarImageView = self->_customAvatarImageView;
  if (!customAvatarImageView)
  {
    v16 = objc_alloc_init(PXRoundImageView);
    v17 = self->_customAvatarImageView;
    self->_customAvatarImageView = v16;

    v18 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [(PXRoundImageView *)self->_customAvatarImageView setBackgroundColor:v18];

    [(PXRoundImageView *)self->_customAvatarImageView setAccessibilityIgnoresInvertColors:1];
    v19 = [(PXComposeRecipientTableViewCell *)self contentView];
    [v19 addSubview:self->_customAvatarImageView];

    customAvatarImageView = self->_customAvatarImageView;
  }
  [(PXRoundImageView *)customAvatarImageView setImage:v14];
  uint64_t v11 = self->_customAvatarImageView;
  [(PXRoundImageView *)self->_customAvatarImageView setHidden:0];
  [(UIView *)self->_contactAvatarView setHidden:1];

  if (!v11) {
    goto LABEL_9;
  }
LABEL_5:
  avatarView = self->_avatarView;
  self->_avatarView = &v11->super.super;
  v13 = v11;

  [(PXComposeRecipientTableViewCell *)self setNeedsLayout];
}

- (id)_textColor
{
  uint64_t v3 = [(PXComposeRecipientTableCellModel *)self->_cellModel address];
  if (v3)
  {
    if ([(PXComposeRecipientTableCellModel *)self->_cellModel isValidAddress]) {
      [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    else {
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemGreenColor];
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  id v5 = (void *)v4;

  return v5;
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)PXComposeRecipientTableViewCell;
  [(PXComposeRecipientTableViewCell *)&v58 layoutSubviews];
  uint64_t v3 = [(PXComposeRecipientTableViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  +[PXComposeRecipientTableCellModel imageDiameter];
  double v13 = v12;
  +[PXComposeRecipientTableCellModel imageInset];
  double v15 = v14;
  p_localizedNameLabel = &self->_localizedNameLabel;
  -[UILabel sizeThatFits:](self->_localizedNameLabel, "sizeThatFits:", v9, v11);
  double v54 = v17;
  double v19 = v18;
  p_addressLabel = &self->_addressLabel;
  -[UILabel sizeThatFits:](self->_addressLabel, "sizeThatFits:", v9, v11);
  double v55 = v21;
  double v52 = v22;
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXComposeRecipientTableViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  double v53 = v19;
  CGFloat v56 = v7;
  CGFloat v57 = v5;
  if (v23 == 1)
  {
    CGFloat v24 = v9 - v13 - v15;
    v59.origin.x = v5;
    v59.origin.y = v7;
    v59.size.width = v9;
    v59.size.height = v11;
    double v25 = CGRectGetMidY(v59) + v13 * -0.5;
    v60.origin.x = v24;
    v60.origin.y = v25;
    v60.size.width = v13;
    v60.size.height = v13;
    double v26 = CGRectGetMinX(v60) - v15;
    v61.origin.x = v24;
    v61.origin.y = v25;
    v61.size.width = v13;
    v61.size.height = v13;
    CGFloat v27 = CGRectGetMinX(v61) - v15;
    v28 = [(PXComposeRecipientTableViewCell *)self contentView];
    [v28 frame];
    double v30 = v27 - v29;

    double v15 = v24;
    double v31 = v54;
  }
  else
  {
    v62.origin.x = v5;
    v62.origin.y = v7;
    v62.size.width = v9;
    v62.size.height = v11;
    CGFloat v51 = v11;
    CGFloat v32 = v7;
    double v25 = CGRectGetMidY(v62) + v13 * -0.5;
    v63.origin.x = v15;
    v63.origin.y = v25;
    v63.size.width = v13;
    v63.size.height = v13;
    CGFloat v33 = v5;
    double v26 = v15 + CGRectGetMaxX(v63);
    if ([(UIImageView *)self->_accessoryImageView isHidden])
    {
      v64.origin.x = v33;
      v64.origin.y = v32;
      v64.size.width = v9;
      double v11 = v51;
      v64.size.height = v51;
      double MaxX = CGRectGetMaxX(v64);
    }
    else
    {
      [(UIImageView *)self->_accessoryImageView frame];
      double MaxX = CGRectGetMinX(v65);
      double v11 = v51;
    }
    double v31 = v54;
    double v30 = MaxX - v26;
  }
  -[UIView setFrame:](self->_avatarView, "setFrame:", v15, v25, v13, v13);
  v35 = [(UILabel *)*p_localizedNameLabel text];
  uint64_t v36 = [v35 length];

  v37 = [(UILabel *)*p_addressLabel text];
  BOOL v38 = [v37 length] != 0;

  double v39 = fmin(v31, v30);
  double v40 = fmin(v55, v30);
  double v41 = 0.0;
  if (v23 == 1) {
    double v42 = v39;
  }
  else {
    double v42 = 0.0;
  }
  double v43 = v26 - v42;
  if (v23 == 1) {
    double v41 = v40;
  }
  double v44 = v26 - v41;
  v66.origin.y = v56;
  v66.origin.x = v57;
  v66.size.width = v9;
  v66.size.height = v11;
  double MidY = CGRectGetMidY(v66);
  if ((v36 != 0) == v38)
  {
    [(UILabel *)*p_localizedNameLabel intrinsicContentSize];
    -[UILabel setFrame:](*p_localizedNameLabel, "setFrame:", v43, MidY - v49, v39, v53);
    [(UILabel *)*p_localizedNameLabel frame];
    double MaxY = CGRectGetMaxY(v67);
LABEL_17:
    p_localizedNameLabel = p_addressLabel;
    double v43 = v44;
    double v39 = v40;
    double v48 = v52;
    goto LABEL_18;
  }
  if (!v36)
  {
    [(UILabel *)*p_addressLabel intrinsicContentSize];
    double MaxY = MidY + v50 * -0.5;
    goto LABEL_17;
  }
  [(UILabel *)*p_localizedNameLabel intrinsicContentSize];
  double MaxY = MidY + v46 * -0.5;
  double v48 = v53;
LABEL_18:
  -[UILabel setFrame:](*p_localizedNameLabel, "setFrame:", v43, MaxY, v39, v48);
}

- (UIView)popoverSourceView
{
  return (UIView *)self->_localizedNameLabel;
}

- (PXComposeRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)PXComposeRecipientTableViewCell;
  double v4 = [(PXComposeRecipientTableViewCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    CGFloat v5 = objc_alloc_init(PXComposeRecipientTableCellModel);
    cellModel = v4->_cellModel;
    v4->_cellModel = v5;

    [(PXComposeRecipientTableCellModel *)v4->_cellModel registerChangeObserver:v4 context:PXComposeRecipientTableCellModelObservationContext];
    -[PXComposeRecipientTableViewCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    CGFloat v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    localizedNameLabel = v4->_localizedNameLabel;
    v4->_localizedNameLabel = v7;

    double v9 = [(PXComposeRecipientTableViewCell *)v4 contentView];
    [v9 addSubview:v4->_localizedNameLabel];

    double v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    addressLabel = v4->_addressLabel;
    v4->_addressLabel = v10;

    double v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB2950], 0x8000, 2);
    [(UILabel *)v4->_addressLabel setFont:v12];

    double v13 = [(PXComposeRecipientTableViewCell *)v4 contentView];
    [v13 addSubview:v4->_addressLabel];

    double v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = v14;

    v16 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
    [(UIImageView *)v4->_accessoryImageView setSymbolConfiguration:v16];

    [(PXComposeRecipientTableViewCell *)v4 setAccessoryView:v4->_accessoryImageView];
    [(PXComposeRecipientTableViewCell *)v4 _updateAvatarView];
    [(PXComposeRecipientTableViewCell *)v4 _updateLocalizedNameLabel];
    [(PXComposeRecipientTableViewCell *)v4 _updateAddressLabel];
    [(PXComposeRecipientTableViewCell *)v4 _updateAccessoryImageView];
  }
  return v4;
}

@end