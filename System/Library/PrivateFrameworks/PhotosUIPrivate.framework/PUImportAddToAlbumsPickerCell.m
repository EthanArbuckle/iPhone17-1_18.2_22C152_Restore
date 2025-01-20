@interface PUImportAddToAlbumsPickerCell
- (BOOL)isSelectable;
- (NSArray)constraints;
- (NSLayoutConstraint)labelLeadingConstraintNoImage;
- (NSLayoutConstraint)labelLeadingConstraintWithImage;
- (PUImportAddToAlbumsPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PXDisplayCollection)collection;
- (UIImage)thumbnail;
- (UIImageView)thumbnailView;
- (UILabel)titleLabel;
- (unint64_t)type;
- (void)_configureCell;
- (void)performChanges:(id)a3;
- (void)prepareForReuse;
- (void)setCollection:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setLabelLeadingConstraintNoImage:(id)a3;
- (void)setLabelLeadingConstraintWithImage:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setThumbnail:(id)a3;
- (void)setThumbnailView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateConstraints;
- (void)updateTitle;
@end

@implementation PUImportAddToAlbumsPickerCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLeadingConstraintWithImage, 0);
  objc_storeStrong((id *)&self->_labelLeadingConstraintNoImage, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

- (void)setLabelLeadingConstraintWithImage:(id)a3
{
}

- (NSLayoutConstraint)labelLeadingConstraintWithImage
{
  return self->_labelLeadingConstraintWithImage;
}

- (void)setLabelLeadingConstraintNoImage:(id)a3
{
}

- (NSLayoutConstraint)labelLeadingConstraintNoImage
{
  return self->_labelLeadingConstraintNoImage;
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (PXDisplayCollection)collection
{
  return self->_collection;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setThumbnailView:(id)a3
{
}

- (UIImageView)thumbnailView
{
  return self->_thumbnailView;
}

- (BOOL)isSelectable
{
  return [(PUImportAddToAlbumsPickerCell *)self type] != 1;
}

- (void)updateTitle
{
  v3 = [(PUImportAddToAlbumsPickerCell *)self collection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(PUImportAddToAlbumsPickerCell *)self collection];
    v8 = [v5 localizedTitle];
  }
  else if ([(PUImportAddToAlbumsPickerCell *)self type] {
         && [(PUImportAddToAlbumsPickerCell *)self type] != 1)
  }
  {
    v8 = 0;
  }
  else
  {
    PLLocalizedFrameworkString();
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v8) {
    v6 = v8;
  }
  else {
    v6 = &stru_1F06BE7B8;
  }
  v7 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  [v7 setText:v6];

  [(PUImportAddToAlbumsPickerCell *)self invalidateIntrinsicContentSize];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUImportAddToAlbumsPickerCell *)self isSelectable])
  {
    v6.receiver = self;
    v6.super_class = (Class)PUImportAddToAlbumsPickerCell;
    [(PUImportAddToAlbumsPickerCell *)&v6 setSelected:v3];
    if (v3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 0;
    }
    [(PUImportAddToAlbumsPickerCell *)self setAccessoryType:v5];
  }
}

- (void)setThumbnail:(id)a3
{
  id v5 = a3;
  if (!self->_isPerformingUpdate) {
    _PFAssertContinueHandler();
  }
  v4 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  [v4 setImage:v5];
}

- (void)setType:(unint64_t)a3
{
  if (!self->_isPerformingUpdate) {
    _PFAssertContinueHandler();
  }
  if (self->_type != a3)
  {
    self->_type = a3;
    if (a3 == 2
      || (collection = self->_collection, self->_collection = 0, collection, self->_type != 1))
    {
      uint64_t v6 = [MEMORY[0x1E4FB1618] labelColor];
    }
    else
    {
      uint64_t v6 = [(PUImportAddToAlbumsPickerCell *)self tintColor];
    }
    v7 = (void *)v6;
    v8 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
    [v8 setTextColor:v7];

    BOOL v9 = self->_type == 0;
    v10 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
    [v10 setHidden:v9];

    [(PUImportAddToAlbumsPickerCell *)self updateTitle];
    [(PUImportAddToAlbumsPickerCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setCollection:(id)a3
{
  id v5 = (PXDisplayCollection *)a3;
  uint64_t v6 = v5;
  if (!self->_isPerformingUpdate)
  {
    _PFAssertContinueHandler();
    id v5 = v6;
  }
  if (self->_collection != v5)
  {
    objc_storeStrong((id *)&self->_collection, a3);
    self->_type = 2;
    [(PUImportAddToAlbumsPickerCell *)self updateTitle];
    id v5 = v6;
  }
}

- (void)performChanges:(id)a3
{
  if (a3)
  {
    self->_isPerformingUpdate = 1;
    id v5 = a3;
    uint64_t v6 = [(PUImportAddToAlbumsPickerCell *)self mutableChangeObject];
    (*((void (**)(id, void *))a3 + 2))(v5, v6);

    [(PUImportAddToAlbumsPickerCell *)self setNeedsLayout];
    self->_isPerformingUpdate = 0;
  }
}

- (void)updateConstraints
{
  v19[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(PUImportAddToAlbumsPickerCell *)self constraints];
  [v3 activateConstraints:v4];

  id v5 = (void *)MEMORY[0x1E4F28DC8];
  if (self->_type)
  {
    uint64_t v6 = [(PUImportAddToAlbumsPickerCell *)self labelLeadingConstraintNoImage];
    v17 = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v5 deactivateConstraints:v7];

    v8 = (void *)MEMORY[0x1E4F28DC8];
    BOOL v9 = [(PUImportAddToAlbumsPickerCell *)self labelLeadingConstraintWithImage];
    v16 = v9;
    v10 = (void *)MEMORY[0x1E4F1C978];
    v11 = &v16;
  }
  else
  {
    v12 = [(PUImportAddToAlbumsPickerCell *)self labelLeadingConstraintWithImage];
    v19[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v5 deactivateConstraints:v13];

    v8 = (void *)MEMORY[0x1E4F28DC8];
    BOOL v9 = [(PUImportAddToAlbumsPickerCell *)self labelLeadingConstraintNoImage];
    v18 = v9;
    v10 = (void *)MEMORY[0x1E4F1C978];
    v11 = &v18;
  }
  v14 = [v10 arrayWithObjects:v11 count:1];
  [v8 activateConstraints:v14];

  v15.receiver = self;
  v15.super_class = (Class)PUImportAddToAlbumsPickerCell;
  [(PUImportAddToAlbumsPickerCell *)&v15 updateConstraints];
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)PUImportAddToAlbumsPickerCell;
  [(PUImportAddToAlbumsPickerCell *)&v9 prepareForReuse];
  BOOL v3 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  [v3 setHidden:0];

  v4 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  [v4 setImage:0];

  id v5 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  [v5 setText:0];

  collection = self->_collection;
  self->_collection = 0;

  self->_type = 2;
  v7 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(PUImportAddToAlbumsPickerCell *)self setNeedsUpdateConstraints];
}

- (void)_configureCell
{
  v65[8] = *MEMORY[0x1E4F143B8];
  [(PUImportAddToAlbumsPickerCell *)self setSelectionStyle:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [(PUImportAddToAlbumsPickerCell *)self setThumbnailView:v3];

  v4 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  id v5 = [v4 layer];
  [v5 setCornerRadius:5.0];

  uint64_t v6 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  [v6 setClipsToBounds:1];

  v7 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
  v8 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  [v8 setBackgroundColor:v7];

  objc_super v9 = [(PUImportAddToAlbumsPickerCell *)self contentView];
  v10 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  [v9 addSubview:v10];

  id v11 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(PUImportAddToAlbumsPickerCell *)self setTitleLabel:v11];

  v12 = PXFontWithTextStyle();
  v13 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  [v13 setFont:v12];

  v14 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  [v14 setNumberOfLines:0];

  objc_super v15 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  [v15 setLineBreakMode:0];

  v16 = [(PUImportAddToAlbumsPickerCell *)self contentView];
  v17 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  [v16 addSubview:v17];

  v18 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v64 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  v62 = [v64 centerYAnchor];
  v63 = [(PUImportAddToAlbumsPickerCell *)self contentView];
  v61 = [v63 centerYAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v65[0] = v60;
  v59 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  v57 = [v59 leadingAnchor];
  v58 = [(PUImportAddToAlbumsPickerCell *)self contentView];
  v56 = [v58 leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56 constant:20.0];
  v65[1] = v55;
  v54 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  v53 = [v54 heightAnchor];
  v52 = [v53 constraintEqualToConstant:29.0];
  v65[2] = v52;
  v51 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  v50 = [v51 widthAnchor];
  v49 = [v50 constraintEqualToConstant:29.0];
  v65[3] = v49;
  v48 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  v46 = [v48 trailingAnchor];
  v47 = [(PUImportAddToAlbumsPickerCell *)self contentView];
  v45 = [v47 trailingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v65[4] = v44;
  v43 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  v41 = [v43 topAnchor];
  v42 = [(PUImportAddToAlbumsPickerCell *)self contentView];
  v40 = [v42 topAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v65[5] = v39;
  v20 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  v21 = [v20 bottomAnchor];
  v22 = [(PUImportAddToAlbumsPickerCell *)self contentView];
  v23 = [v22 bottomAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v65[6] = v24;
  v25 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintGreaterThanOrEqualToConstant:44.0];
  v65[7] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:8];
  [(PUImportAddToAlbumsPickerCell *)self setConstraints:v28];

  v29 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  v30 = [v29 leadingAnchor];
  v31 = [(PUImportAddToAlbumsPickerCell *)self contentView];
  v32 = [v31 leadingAnchor];
  v33 = [v30 constraintEqualToAnchor:v32 constant:20.0];
  [(PUImportAddToAlbumsPickerCell *)self setLabelLeadingConstraintNoImage:v33];

  v34 = [(PUImportAddToAlbumsPickerCell *)self titleLabel];
  v35 = [v34 leadingAnchor];
  v36 = [(PUImportAddToAlbumsPickerCell *)self thumbnailView];
  v37 = [v36 trailingAnchor];
  v38 = [v35 constraintEqualToAnchor:v37 constant:20.0];
  [(PUImportAddToAlbumsPickerCell *)self setLabelLeadingConstraintWithImage:v38];

  -[PUImportAddToAlbumsPickerCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 69.0, 0.0, 0.0);
  [(PUImportAddToAlbumsPickerCell *)self setNeedsUpdateConstraints];
}

- (PUImportAddToAlbumsPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PUImportAddToAlbumsPickerCell;
  v4 = [(PUImportAddToAlbumsPickerCell *)&v8 initWithStyle:0 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    collection = v4->_collection;
    v4->_collection = 0;

    v5->_type = 2;
    [(PUImportAddToAlbumsPickerCell *)v5 _configureCell];
  }
  return v5;
}

@end