@interface ReadingListTableViewCell
+ (double)minimumCellHeight;
- (BOOL)hasImage;
- (NSString)fetchingStatusText;
- (NSString)previewText;
- (NSString)siteName;
- (ReadingListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (int)bookmarkID;
- (void)_createImageViewIfNeeded;
- (void)_initializeAutoLayoutConstraints;
- (void)_setFetchingStatusTextForBookmark:(id)a3;
- (void)_setOpaque:(BOOL)a3 forSubview:(id)a4;
- (void)_updateMaximumContentSizeCategory;
- (void)_updateNumberOfLines;
- (void)_updateSelectedAnimated:(BOOL)a3;
- (void)_updateVibrantEffect;
- (void)displayThumbnailIconForBookmark:(id)a3 synchronously:(BOOL)a4;
- (void)dragStateDidChange:(int64_t)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAlpha:(double)a3;
- (void)setBookmark:(id)a3;
- (void)setBookmark:(id)a3 isArchiving:(BOOL)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFetchingStatusText:(id)a3;
- (void)setHasImage:(BOOL)a3;
- (void)setPreviewText:(id)a3;
- (void)setReadingListIcon:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSiteName:(id)a3;
- (void)setUsesVibrantEffect:(BOOL)a3;
@end

@implementation ReadingListTableViewCell

- (ReadingListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)ReadingListTableViewCell;
  v4 = [(ReadingListTableViewCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(ReadingListTableViewCell *)v4 contentView];
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v5->_textLabel;
    v5->_textLabel = v7;

    [(UILabel *)v5->_textLabel setAdjustsFontForContentSizeCategory:1];
    uint64_t v9 = *MEMORY[0x1E4FB2950];
    v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2950], 2);
    [(UILabel *)v5->_textLabel setFont:v10];

    [v6 addSubview:v5->_textLabel];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailTextLabel = v5->_detailTextLabel;
    v5->_detailTextLabel = v11;

    [(UILabel *)v5->_detailTextLabel setAdjustsFontForContentSizeCategory:1];
    v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2960], 0x8000);
    [(UILabel *)v5->_detailTextLabel setFont:v13];

    [(UILabel *)v5->_detailTextLabel setNumberOfLines:2];
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5->_detailTextLabel setTextColor:v14];

    [v6 addSubview:v5->_detailTextLabel];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    siteNameLabel = v5->_siteNameLabel;
    v5->_siteNameLabel = v15;

    [(UILabel *)v5->_siteNameLabel setAdjustsFontForContentSizeCategory:1];
    v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v9];
    [(UILabel *)v5->_siteNameLabel setFont:v17];

    [v6 addSubview:v5->_siteNameLabel];
    -[ReadingListTableViewCell setSeparatorInset:](v5, "setSeparatorInset:", 0.0, 15.0, 0.0, 0.0);
    -[ReadingListTableViewCell setLayoutMargins:](v5, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(ReadingListTableViewCell *)v5 setPreservesSuperviewLayoutMargins:0];
    [(ReadingListTableViewCell *)v5 _initializeAutoLayoutConstraints];
    [(ReadingListTableViewCell *)v5 _updateNumberOfLines];
    [(ReadingListTableViewCell *)v5 _updateMaximumContentSizeCategory];
    v26[0] = objc_opt_class();
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v19 = (id)[(ReadingListTableViewCell *)v5 registerForTraitChanges:v18 withTarget:v5 action:sel__updateNumberOfLines];

    uint64_t v25 = objc_opt_class();
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    id v21 = (id)[(ReadingListTableViewCell *)v5 registerForTraitChanges:v20 withTarget:v5 action:sel__updateMaximumContentSizeCategory];

    v22 = v5;
  }

  return v5;
}

- (void)setAlpha:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ReadingListTableViewCell;
  -[ReadingListTableViewCell setAlpha:](&v7, sel_setAlpha_);
  if (a3 >= 1.0) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [(VibrantTableViewCell *)self usesVibrantEffect] ^ 1;
  }
  v6 = [(ReadingListTableViewCell *)self layer];
  [v6 setAllowsGroupBlending:v5];
  [v6 setAllowsGroupOpacity:v5];
}

- (void)setUsesVibrantEffect:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VibrantTableViewCell *)self usesVibrantEffect] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ReadingListTableViewCell;
    [(VibrantTableViewCell *)&v5 setUsesVibrantEffect:v3];
    [(ReadingListTableViewCell *)self _updateVibrantEffect];
  }
}

- (void)_updateVibrantEffect
{
  if ([(VibrantTableViewCell *)self usesVibrantEffect]) {
    BOOL v3 = self->_dragState != 0;
  }
  else {
    BOOL v3 = 1;
  }
  v4 = [(ReadingListTableViewCell *)self contentView];
  id v5 = [v4 layer];

  [v5 setAllowsGroupBlending:v3];
  [v5 setAllowsGroupOpacity:v3];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)ReadingListTableViewCell;
  [(ReadingListTableViewCell *)&v3 prepareForReuse];
  [(_SFSiteIconView *)self->_imageView setBookmark:0];
}

- (void)_initializeAutoLayoutConstraints
{
  v18[2] = *MEMORY[0x1E4F143B8];
  [(UILabel *)self->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_detailTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_siteNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ReadingListTableViewCell *)self _createImageViewIfNeeded];
  objc_super v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(_SFSiteIconView *)self->_imageView widthAnchor];
  v17 = [(_SFSiteIconView *)self->_imageView heightAnchor];
  id v5 = objc_msgSend(v4, "constraintEqualToAnchor:");
  v18[0] = v5;
  v6 = [(_SFSiteIconView *)self->_imageView widthAnchor];
  objc_super v7 = [v6 constraintEqualToConstant:72.0];
  v18[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v3 activateConstraints:v8];

  uint64_t v9 = _NSDictionaryOfVariableBindings((NSString *)@"_textLabel, _detailTextLabel, _siteNameLabel, _imageView", self->_textLabel, self->_detailTextLabel, self->_siteNameLabel, self->_imageView, 0);
  v10 = _NSDictionaryOfVariableBindings((NSString *)@"vInterLabelSpacing, vImageViewSpacing, vLabelSpacing, hLabelSpacing, hLeadingImageViewSpacing", &unk_1F3C73F98, &unk_1F3C73FA8, &unk_1F3C73FB8, &unk_1F3C73FA8, &unk_1F3C73FC8, 0);
  v11 = (void *)MEMORY[0x1E4F28DC8];
  v12 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(vImageViewSpacing)-[_imageView]-(>=vImageViewSpacing)-|" options:0 metrics:v10 views:v9];
  [v11 activateConstraints:v12];

  v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(vLabelSpacing)-[_textLabel]-(vInterLabelSpacing)-[_siteNameLabel]-(vInterLabelSpacing)-[_detailTextLabel]-(>=vLabelSpacing)-|" options:96 metrics:v10 views:v9];
  [v13 activateConstraints:v14];

  v15 = (void *)MEMORY[0x1E4F28DC8];
  v16 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(hLeadingImageViewSpacing)-[_imageView]-(hLabelSpacing)-[_textLabel]-(hLabelSpacing)-|" options:0 metrics:v10 views:v9];
  [v15 activateConstraints:v16];
}

- (void)_createImageViewIfNeeded
{
  if (!self->_imageView)
  {
    objc_super v3 = (_SFSiteIconView *)objc_alloc_init(MEMORY[0x1E4F785A8]);
    imageView = self->_imageView;
    self->_imageView = v3;

    id v5 = [(ReadingListTableViewCell *)self contentView];
    [v5 addSubview:self->_imageView];

    v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(_SFSiteIconView *)self->_imageView setBackgroundColor:v6];

    [(_SFSiteIconView *)self->_imageView setClipsToBounds:1];
    objc_super v7 = self->_imageView;
    [(_SFSiteIconView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
}

- (void)_updateNumberOfLines
{
  objc_super v3 = [(ReadingListTableViewCell *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  if (IsAccessibilityCategory) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [(UILabel *)self->_textLabel setNumberOfLines:v6];
  siteNameLabel = self->_siteNameLabel;
  [(UILabel *)siteNameLabel setNumberOfLines:v7];
}

- (void)_updateMaximumContentSizeCategory
{
  objc_super v3 = [(ReadingListTableViewCell *)self traitCollection];
  uint64_t v4 = [v3 verticalSizeClass];

  if (v4 == 1) {
    uint64_t v5 = *MEMORY[0x1E4FB2790];
  }
  else {
    uint64_t v5 = 0;
  }
  [(ReadingListTableViewCell *)self setMaximumContentSizeCategory:v5];
}

- (void)setReadingListIcon:(id)a3
{
}

- (void)displayThumbnailIconForBookmark:(id)a3 synchronously:(BOOL)a4
{
  id v6 = a3;
  int bookmarkID = self->_bookmarkID;
  if (bookmarkID == [v6 identifier])
  {
    v8 = [(_SFSiteIconView *)self->_imageView image];

    if (!v8)
    {
      uint64_t v9 = [v6 iconData];
      if (v9)
      {
        v10 = [(ReadingListTableViewCell *)self reuseIdentifier];
        int v11 = [v10 isEqualToString:@"ReadingListTableViewCellWithImage"];

        if (v11)
        {
          v12 = self->_imageView;
          if (a4)
          {
            v13 = [MEMORY[0x1E4FB1818] imageWithData:v9];
            [(_SFSiteIconView *)v12 setLeadingImage:v13];
          }
          else
          {
            v14 = dispatch_get_global_queue(0, 0);
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __74__ReadingListTableViewCell_displayThumbnailIconForBookmark_synchronously___block_invoke;
            v15[3] = &unk_1E6D79148;
            id v16 = v9;
            v17 = self;
            id v18 = v6;
            id v19 = v12;
            dispatch_async(v14, v15);
          }
        }
      }
    }
  }
}

void __74__ReadingListTableViewCell_displayThumbnailIconForBookmark_synchronously___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1818] imageWithData:*(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__ReadingListTableViewCell_displayThumbnailIconForBookmark_synchronously___block_invoke_2;
  v5[3] = &unk_1E6D79148;
  objc_super v3 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v3;
  id v7 = *(id *)(a1 + 56);
  id v8 = v2;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __74__ReadingListTableViewCell_displayThumbnailIconForBookmark_synchronously___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) bookmarkID];
  uint64_t result = [*(id *)(a1 + 40) identifier];
  if (v2 == result)
  {
    [*(id *)(a1 + 48) setLeadingImage:*(void *)(a1 + 56)];
    id v4 = *(void **)(a1 + 32);
    return [v4 setNeedsDisplay];
  }
  return result;
}

- (void)setBookmark:(id)a3
{
  id v18 = a3;
  self->_int bookmarkID = [v18 identifier];
  id v4 = [v18 previewText];
  if (v4) {
    [v18 previewText];
  }
  else {
  uint64_t v5 = [v18 localPreviewText];
  }
  objc_storeStrong((id *)&self->_previewText, v5);

  id v6 = [v18 address];
  id v7 = objc_msgSend(v6, "safari_userVisibleURL");
  objc_msgSend(v7, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  siteName = self->_siteName;
  self->_siteName = v8;

  char v10 = objc_opt_respondsToSelector();
  previewText = self->_previewText;
  if (v10) {
    int v12 = [(NSString *)previewText _isNaturallyRTL];
  }
  else {
    int v12 = [(NSString *)previewText isNaturallyRTL];
  }
  if (v12) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  textLabel = self->_textLabel;
  v15 = [v18 title];
  [(UILabel *)textLabel setText:v15];

  [(UILabel *)self->_detailTextLabel setText:self->_previewText];
  [(UILabel *)self->_detailTextLabel setTextAlignment:v13];
  [(UILabel *)self->_siteNameLabel setText:self->_siteName];
  id v16 = [(_SFSiteIconView *)self->_imageView bookmark];
  char v17 = [v16 isEqualToBookmark:v18];

  if ((v17 & 1) == 0) {
    [(_SFSiteIconView *)self->_imageView setBookmark:v18];
  }
  [(ReadingListTableViewCell *)self _setFetchingStatusTextForBookmark:v18];
}

- (void)setBookmark:(id)a3 isArchiving:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = v6;
  if (v4)
  {
    id v7 = _WBSLocalizedString();
    [(ReadingListTableViewCell *)self setFetchingStatusText:v7];
  }
  else
  {
    [(ReadingListTableViewCell *)self _setFetchingStatusTextForBookmark:v6];
  }
}

- (void)_setFetchingStatusTextForBookmark:(id)a3
{
  id v7 = a3;
  if (([v7 isFullArchiveAvailable] & 1) != 0
    || ([MEMORY[0x1E4F4BE68] sharedNetworkObserver],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isNetworkReachable],
        v4,
        (v5 & 1) != 0))
  {
    [(ReadingListTableViewCell *)self setFetchingStatusText:0];
  }
  else
  {
    id v6 = _WBSLocalizedString();
    [(ReadingListTableViewCell *)self setFetchingStatusText:v6];
  }
}

- (void)_setOpaque:(BOOL)a3 forSubview:(id)a4
{
  BOOL v4 = a3;
  id v6 = (_SFSiteIconView *)a4;
  if (self->_imageView != v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)ReadingListTableViewCell;
    [(ReadingListTableViewCell *)&v7 _setOpaque:v4 forSubview:v6];
  }
}

- (void)dragStateDidChange:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ReadingListTableViewCell;
  -[ReadingListTableViewCell dragStateDidChange:](&v5, sel_dragStateDidChange_);
  self->_dragState = a3;
  [(ReadingListTableViewCell *)self _updateSelectedAnimated:0];
  [(ReadingListTableViewCell *)self _updateVibrantEffect];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self->_BOOL wantsSelectedAppearance = a3;
  [(ReadingListTableViewCell *)self _updateSelectedAnimated:a4];
  BOOL wantsSelectedAppearance = self->_wantsSelectedAppearance;
  uint64_t v6 = [(ReadingListTableViewCell *)self isEditing];
  [(ReadingListTableViewCell *)self safari_updateVisualStateIsSelected:wantsSelectedAppearance isEditing:v6];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(ReadingListTableViewCell *)self isEditing] != a3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__ReadingListTableViewCell_setEditing_animated___block_invoke;
    v8[3] = &unk_1E6D79060;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
    [(ReadingListTableViewCell *)self safari_updateVisualStateIsSelected:[(ReadingListTableViewCell *)self isSelected] isEditing:v5];
  }
  v7.receiver = self;
  v7.super_class = (Class)ReadingListTableViewCell;
  [(ReadingListTableViewCell *)&v7 setEditing:v5 animated:v4];
}

uint64_t __48__ReadingListTableViewCell_setEditing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
}

- (void)_updateSelectedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self->_wantsSelectedAppearance && self->_dragState == 0;
  v5.receiver = self;
  v5.super_class = (Class)ReadingListTableViewCell;
  [(ReadingListTableViewCell *)&v5 setSelected:v4 animated:v3];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)ReadingListTableViewCell;
  [(ReadingListTableViewCell *)&v7 layoutSubviews];
  BOOL v3 = [(ReadingListTableViewCell *)self fetchingStatusText];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ReadingListTableViewCell *)self previewText];
  }
  uint64_t v6 = v5;

  [(UILabel *)self->_detailTextLabel setText:v6];
}

+ (double)minimumCellHeight
{
  return 96.0;
}

- (int)bookmarkID
{
  return self->_bookmarkID;
}

- (NSString)siteName
{
  return self->_siteName;
}

- (void)setSiteName:(id)a3
{
}

- (NSString)previewText
{
  return self->_previewText;
}

- (void)setPreviewText:(id)a3
{
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setHasImage:(BOOL)a3
{
  self->_hasImage = a3;
}

- (NSString)fetchingStatusText
{
  return self->_fetchingStatusText;
}

- (void)setFetchingStatusText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchingStatusText, 0);
  objc_storeStrong((id *)&self->_previewText, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_siteNameLabel, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
}

@end