@interface PXSharedLibraryParticipantTableViewCell
- (PXSharedLibraryParticipantTableCellModel)cellModel;
- (PXSharedLibraryParticipantTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_updateAddressLabel;
- (void)_updateAvatarView;
- (void)_updateLocalizedNameLabel;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXSharedLibraryParticipantTableViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_localizedNameLabel, 0);
  objc_storeStrong((id *)&self->_customAvatarImageView, 0);
}

- (PXSharedLibraryParticipantTableCellModel)cellModel
{
  return self->_cellModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXSharedLibraryParticipantTableCellModelObservationContext == a5)
  {
    id v9 = v8;
    if (v6)
    {
      [(PXSharedLibraryParticipantTableViewCell *)self _updateAvatarView];
      id v8 = v9;
    }
    if ((v6 & 0xC) != 0)
    {
      [(PXSharedLibraryParticipantTableViewCell *)self _updateLocalizedNameLabel];
      id v8 = v9;
    }
    if ((v6 & 8) != 0)
    {
      [(PXSharedLibraryParticipantTableViewCell *)self _updateAddressLabel];
      id v8 = v9;
    }
  }
}

- (void)_updateAddressLabel
{
  v3 = [(PXSharedLibraryParticipantTableCellModel *)self->_cellModel address];
  [(UILabel *)self->_addressLabel setText:v3];

  [(PXSharedLibraryParticipantTableViewCell *)self setNeedsLayout];
}

- (void)_updateLocalizedNameLabel
{
  v3 = [(PXSharedLibraryParticipantTableCellModel *)self->_cellModel name];
  [(UILabel *)self->_localizedNameLabel setText:v3];

  [(PXSharedLibraryParticipantTableViewCell *)self setNeedsLayout];
}

- (void)_updateAvatarView
{
  if (!self->_customAvatarImageView)
  {
    v3 = objc_alloc_init(PXRoundImageView);
    customAvatarImageView = self->_customAvatarImageView;
    self->_customAvatarImageView = v3;

    v5 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [(PXRoundImageView *)self->_customAvatarImageView setBackgroundColor:v5];

    [(PXRoundImageView *)self->_customAvatarImageView setAccessibilityIgnoresInvertColors:1];
    char v6 = [(PXSharedLibraryParticipantTableViewCell *)self contentView];
    [v6 addSubview:self->_customAvatarImageView];
  }
  v7 = [(PXSharedLibraryParticipantTableCellModel *)self->_cellModel image];
  [(PXRoundImageView *)self->_customAvatarImageView setImage:v7];

  [(PXSharedLibraryParticipantTableViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)PXSharedLibraryParticipantTableViewCell;
  [(PXSharedLibraryParticipantTableViewCell *)&v55 layoutSubviews];
  v3 = [(PXSharedLibraryParticipantTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  +[PXSharedLibraryParticipantTableCellModel imageDiameter];
  double width = v12;
  +[PXSharedLibraryParticipantTableCellModel imageInset];
  double v15 = v14;
  p_localizedNameLabel = &self->_localizedNameLabel;
  -[UILabel sizeThatFits:](self->_localizedNameLabel, "sizeThatFits:", v9, v11);
  double rect_16 = v17;
  double v49 = v18;
  p_addressLabel = &self->_addressLabel;
  -[UILabel sizeThatFits:](self->_addressLabel, "sizeThatFits:", v9, v11);
  double rect_8 = v20;
  double v48 = v21;
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXSharedLibraryParticipantTableViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  double x = v9 - width - v15;
  v56.origin.double x = v5;
  v56.origin.double y = v7;
  v56.size.double width = v9;
  v56.size.double height = v11;
  double y = CGRectGetMidY(v56) + width * -0.5;
  CGFloat rect = v5;
  CGFloat rect_24 = v7;
  if (v22 == 1)
  {
    v57.origin.double x = v9 - width - v15;
    v57.origin.double y = y;
    v57.size.double width = width;
    v57.size.double height = width;
    double v50 = CGRectGetMinX(v57) - v15;
    v58.origin.double x = v9 - width - v15;
    v58.origin.double y = y;
    v58.size.double width = width;
    v58.size.double height = width;
    CGFloat v25 = CGRectGetMinX(v58) - v15;
    v26 = [(PXSharedLibraryParticipantTableViewCell *)self contentView];
    [v26 frame];
    double v28 = v25 - v27;

    double height = width;
  }
  else
  {
    v59.origin.double x = MEMORY[0x1AD10B740](v9 - width - v15, y, width, width, v5, v7, v9, v11);
    double x = v59.origin.x;
    double y = v59.origin.y;
    double width = v59.size.width;
    double height = v59.size.height;
    double v30 = v15 + CGRectGetMaxX(v59);
    v60.origin.double x = v5;
    v60.origin.double y = rect_24;
    v60.size.double width = v9;
    v60.size.double height = v11;
    double v50 = v30;
    double v28 = CGRectGetMaxX(v60) - v30;
  }
  CGFloat v31 = v11;
  -[PXRoundImageView setFrame:](self->_customAvatarImageView, "setFrame:", x, y, width, height);
  v32 = [(UILabel *)*p_localizedNameLabel text];
  uint64_t v33 = [v32 length];

  v34 = [(UILabel *)*p_addressLabel text];
  BOOL v35 = [v34 length] != 0;

  double v36 = fmin(rect_16, v28);
  double v37 = fmin(rect_8, v28);
  double v38 = 0.0;
  if (v22 == 1) {
    double v39 = v36;
  }
  else {
    double v39 = 0.0;
  }
  double v40 = v50 - v39;
  if (v22 == 1) {
    double v38 = v37;
  }
  double v41 = v50 - v38;
  v61.origin.double x = rect;
  v61.origin.double y = rect_24;
  v61.size.double width = v9;
  v61.size.double height = v31;
  double MidY = CGRectGetMidY(v61);
  if ((v33 != 0) == v35)
  {
    [(UILabel *)*p_localizedNameLabel intrinsicContentSize];
    -[UILabel setFrame:](*p_localizedNameLabel, "setFrame:", v40, MidY - v46, v36, v49);
    [(UILabel *)*p_localizedNameLabel frame];
    double MaxY = CGRectGetMaxY(v62);
LABEL_14:
    p_localizedNameLabel = p_addressLabel;
    double v40 = v41;
    double v36 = v37;
    double v45 = v48;
    goto LABEL_15;
  }
  if (!v33)
  {
    [(UILabel *)*p_addressLabel intrinsicContentSize];
    double MaxY = MidY + v47 * -0.5;
    goto LABEL_14;
  }
  [(UILabel *)*p_localizedNameLabel intrinsicContentSize];
  double MaxY = MidY + v43 * -0.5;
  double v45 = v49;
LABEL_15:
  -[UILabel setFrame:](*p_localizedNameLabel, "setFrame:", v40, MaxY, v36, v45);
}

- (PXSharedLibraryParticipantTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryParticipantTableViewCell;
  double v4 = [(PXSharedLibraryParticipantTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    double v5 = objc_alloc_init(PXSharedLibraryParticipantTableCellModel);
    cellModel = v4->_cellModel;
    v4->_cellModel = v5;

    [(PXSharedLibraryParticipantTableCellModel *)v4->_cellModel registerChangeObserver:v4 context:PXSharedLibraryParticipantTableCellModelObservationContext];
    -[PXSharedLibraryParticipantTableViewCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(PXSharedLibraryParticipantTableViewCell *)v4 contentView];
    objc_claimAutoreleasedReturnValue();
    double v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    localizedNameLabel = v4->_localizedNameLabel;
    v4->_localizedNameLabel = v7;

    PXFontWithTextStyleSymbolicTraits();
  }
  return 0;
}

@end