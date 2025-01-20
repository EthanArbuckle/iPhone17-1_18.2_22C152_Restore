@interface MusicUsageDetailHeaderView
- (MusicUsageDetailHeaderView)init;
- (MusicUsageDetailHeaderView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (void)_updateContents;
- (void)configureForSpecifier:(id)a3;
- (void)dealloc;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation MusicUsageDetailHeaderView

- (MusicUsageDetailHeaderView)init
{
  v57.receiver = self;
  v57.super_class = (Class)MusicUsageDetailHeaderView;
  v2 = [(MusicUsageDetailHeaderView *)&v57 init];
  if (v2)
  {
    v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v2->_imageView;
    v2->_imageView = v3;

    [(UIImageView *)v2->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v2->_imageView setContentMode:1];
    [(UIImageView *)v2->_imageView setClipsToBounds:1];
    [(UIImageView *)v2->_imageView _setContinuousCornerRadius:4.0];
    objc_storeStrong((id *)&v2->_leadingView, v2->_imageView);
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v5;

    [(UILabel *)v2->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v7) = 1144750080;
    [(UILabel *)v2->_titleLabel setContentHuggingPriority:1 forAxis:v7];
    v8 = PreferencesTableViewHeaderColor();
    [(UILabel *)v2->_titleLabel setTextColor:v8];

    v9 = PreferencesTableViewHeaderFont();
    [(UILabel *)v2->_titleLabel setFont:v9];

    [(UILabel *)v2->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v2->_subtitleLabel;
    v2->_subtitleLabel = v10;

    [(UILabel *)v2->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1144750080;
    [(UILabel *)v2->_subtitleLabel setContentHuggingPriority:1 forAxis:v12];
    v13 = PreferencesTableViewHeaderColor();
    [(UILabel *)v2->_subtitleLabel setTextColor:v13];

    v14 = PreferencesTableViewHeaderFont();
    [(UILabel *)v2->_subtitleLabel setFont:v14];

    [(UILabel *)v2->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    v15 = (UILabel *)objc_alloc_init((Class)UILabel);
    sizeLabel = v2->_sizeLabel;
    v2->_sizeLabel = v15;

    [(UILabel *)v2->_sizeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v17) = 1144750080;
    [(UILabel *)v2->_sizeLabel setContentHuggingPriority:1 forAxis:v17];
    v18 = PreferencesTableViewHeaderColor();
    [(UILabel *)v2->_sizeLabel setTextColor:v18];

    v19 = PreferencesTableViewHeaderFont();
    [(UILabel *)v2->_sizeLabel setFont:v19];

    [(UILabel *)v2->_sizeLabel setAdjustsFontForContentSizeCategory:1];
    [(MusicUsageDetailHeaderView *)v2 addSubview:v2->_imageView];
    [(MusicUsageDetailHeaderView *)v2 addSubview:v2->_titleLabel];
    [(MusicUsageDetailHeaderView *)v2 addSubview:v2->_subtitleLabel];
    [(MusicUsageDetailHeaderView *)v2 addSubview:v2->_sizeLabel];
    v52 = +[NSLayoutConstraint constraintWithItem:v2->_imageView attribute:10 relatedBy:0 toItem:v2 attribute:10 multiplier:1.0 constant:0.0];
    v51 = +[NSLayoutConstraint constraintWithItem:v2->_imageView attribute:3 relatedBy:1 toItem:v2 attribute:3 multiplier:1.0 constant:0.0];
    v50 = +[NSLayoutConstraint constraintWithItem:v2->_imageView attribute:4 relatedBy:-1 toItem:v2 attribute:4 multiplier:1.0 constant:-8.0];
    v20 = +[NSLayoutConstraint constraintWithItem:v2->_imageView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    v60[0] = v20;
    v21 = +[NSLayoutConstraint constraintWithItem:v2->_imageView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    v60[1] = v21;
    uint64_t v22 = +[NSArray arrayWithObjects:v60 count:2];
    imageSizeConstraints = v2->_imageSizeConstraints;
    v2->_imageSizeConstraints = (NSArray *)v22;

    [(MusicUsageDetailHeaderView *)v2 addConstraints:v2->_imageSizeConstraints];
    v49 = +[NSLayoutConstraint constraintWithItem:v2->_subtitleLabel attribute:4 relatedBy:0 toItem:v2 attribute:4 multiplier:1.0 constant:-8.0];
    v48 = +[NSLayoutConstraint constraintWithItem:v2->_subtitleLabel attribute:6 relatedBy:-1 toItem:v2->_sizeLabel attribute:5 multiplier:1.0 constant:-8.0];
    v47 = +[NSLayoutConstraint constraintWithItem:v2->_subtitleLabel attribute:3 relatedBy:1 toItem:v2 attribute:3 multiplier:1.0 constant:0.0];
    uint64_t v24 = +[NSLayoutConstraint constraintWithItem:v2->_titleLabel attribute:3 relatedBy:1 toItem:v2 attribute:3 multiplier:1.0 constant:0.0];
    uint64_t v25 = +[NSLayoutConstraint constraintWithItem:v2->_titleLabel attribute:4 relatedBy:0 toItem:v2->_subtitleLabel attribute:3 multiplier:1.0 constant:0.0];
    uint64_t v26 = +[NSLayoutConstraint constraintWithItem:v2->_titleLabel attribute:6 relatedBy:-1 toItem:v2->_sizeLabel attribute:5 multiplier:1.0 constant:-8.0];
    uint64_t v27 = +[NSLayoutConstraint constraintWithItem:v2->_titleLabel attribute:5 relatedBy:0 toItem:v2->_subtitleLabel attribute:5 multiplier:1.0 constant:0.0];
    uint64_t v28 = +[NSLayoutConstraint constraintWithItem:v2->_sizeLabel attribute:3 relatedBy:1 toItem:v2 attribute:3 multiplier:1.0 constant:0.0];
    uint64_t v29 = +[NSLayoutConstraint constraintWithItem:v2->_sizeLabel attribute:4 relatedBy:-1 toItem:v2 attribute:4 multiplier:1.0 constant:-8.0];
    v30 = +[NSLayoutConstraint constraintWithItem:v2->_sizeLabel attribute:11 relatedBy:0 toItem:v2->_subtitleLabel attribute:11 multiplier:1.0 constant:0.0];
    v31 = +[NSLayoutConstraint constraintWithItem:v2->_sizeLabel attribute:6 relatedBy:0 toItem:v2 attribute:6 multiplier:1.0 constant:-8.0];
    v32 = +[NSLayoutConstraint constraintWithItem:v2 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:34.0];
    v59[0] = v52;
    v59[1] = v51;
    v59[2] = v50;
    v59[3] = v49;
    v59[4] = v47;
    v59[5] = v24;
    v45 = (void *)v25;
    v46 = (void *)v24;
    v59[6] = v25;
    v59[7] = v27;
    v42 = (void *)v29;
    v43 = (void *)v27;
    v33 = (void *)v28;
    v59[8] = v28;
    v59[9] = v29;
    v59[10] = v30;
    v59[11] = v31;
    v59[12] = v32;
    v59[13] = v26;
    v44 = (void *)v26;
    v59[14] = v48;
    +[NSArray arrayWithObjects:v59 count:15];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    id v35 = [v34 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v35)
    {
      id v37 = v35;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v34);
          }
          v40 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          LODWORD(v36) = 1148829696;
          [v40 setPriority:v36];
          [v40 setActive:1];
        }
        id v37 = [v34 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v37);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MusicUsageDetailHeaderView;
  [(MusicUsageDetailHeaderView *)&v4 dealloc];
}

- (MusicUsageDetailHeaderView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(MusicUsageDetailHeaderView *)self init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_specifier, v4);
    uint64_t v7 = [v4 propertyForKey:@"MusicUsageItemPropertyKey"];
    usageItem = v6->_usageItem;
    v6->_usageItem = (MusicUsageItem *)v7;

    [(MusicUsageDetailHeaderView *)v6 _updateContents];
  }

  return v6;
}

- (double)preferredHeightForWidth:(double)a3
{
  [(MusicUsageDetailHeaderView *)self _updateContents];
  -[MusicUsageDetailHeaderView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  return v4;
}

- (void)updateConstraints
{
  v3 = [(MusicUsageDetailHeaderView *)self traitCollection];
  double v4 = 8.0;
  if ([v3 horizontalSizeClass] == (char *)&dword_0 + 2)
  {
    PSTableViewSideInset();
    double v4 = v5 + 8.0;
  }

  leadingViewConstraint = self->_leadingViewConstraint;
  if (!leadingViewConstraint) {
    goto LABEL_7;
  }
  uint64_t v7 = [(NSLayoutConstraint *)leadingViewConstraint firstItem];
  leadingView = self->_leadingView;

  if (v7 != leadingView)
  {
    [(MusicUsageDetailHeaderView *)self removeConstraint:self->_leadingViewConstraint];
    v9 = self->_leadingViewConstraint;
    self->_leadingViewConstraint = 0;
  }
  v10 = self->_leadingViewConstraint;
  if (!v10)
  {
LABEL_7:
    v11 = +[NSLayoutConstraint constraintWithItem:self->_leadingView attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:v4];
    double v12 = self->_leadingViewConstraint;
    self->_leadingViewConstraint = v11;

    [(MusicUsageDetailHeaderView *)self addConstraint:self->_leadingViewConstraint];
    v10 = self->_leadingViewConstraint;
  }
  [(NSLayoutConstraint *)v10 setConstant:v4];
  v13 = self->_leadingView;
  subtitleLabel = self->_subtitleLabel;
  if (v13 != (UIView *)subtitleLabel)
  {
    subtitleLeadingConstraint = self->_subtitleLeadingConstraint;
    if (!subtitleLeadingConstraint)
    {
LABEL_14:
      v19 = +[NSLayoutConstraint constraintWithItem:subtitleLabel attribute:5 relatedBy:0 toItem:v13 attribute:6 multiplier:1.0 constant:8.0];
      v20 = self->_subtitleLeadingConstraint;
      self->_subtitleLeadingConstraint = v19;

      [(MusicUsageDetailHeaderView *)self addConstraint:self->_subtitleLeadingConstraint];
      goto LABEL_15;
    }
    v16 = [(NSLayoutConstraint *)subtitleLeadingConstraint secondItem];
    double v17 = self->_leadingView;

    if (v16 != v17)
    {
      [(MusicUsageDetailHeaderView *)self removeConstraint:self->_subtitleLeadingConstraint];
      v18 = self->_subtitleLeadingConstraint;
      self->_subtitleLeadingConstraint = 0;
    }
    if (!self->_subtitleLeadingConstraint)
    {
      subtitleLabel = self->_subtitleLabel;
      v13 = self->_leadingView;
      goto LABEL_14;
    }
  }
LABEL_15:
  v21.receiver = self;
  v21.super_class = (Class)MusicUsageDetailHeaderView;
  [(MusicUsageDetailHeaderView *)&v21 updateConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  [(MusicUsageDetailHeaderView *)self setNeedsUpdateConstraints];

  [(MusicUsageDetailHeaderView *)self updateConstraintsIfNeeded];
}

- (void)configureForSpecifier:(id)a3
{
  p_specifier = &self->_specifier;
  id v5 = a3;
  objc_storeWeak((id *)p_specifier, v5);
  v6 = [v5 propertyForKey:@"MusicUsageItemPropertyKey"];

  usageItem = self->_usageItem;
  self->_usageItem = v6;

  [(MusicUsageDetailHeaderView *)self _updateContents];
}

- (void)_updateContents
{
  v3 = [(MusicUsageItem *)self->_usageItem itemCollection];
  double v4 = [v3 artworkCatalog];
  id v5 = &OBJC_IVAR___MusicUsageDetailHeaderView__imageView;
  if (!v4) {
    id v5 = &OBJC_IVAR___MusicUsageDetailHeaderView__subtitleLabel;
  }
  objc_storeStrong((id *)&self->_leadingView, *(id *)((char *)&self->super.super.super.isa + *v5));
  if (v4)
  {
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    v6 = self->_imageSizeConstraints;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v43;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * i) setConstant:44.0];
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v8);
    }

    v11 = +[UIColor blackColor];
    double v12 = PSPointImageOfColor();
    [(UIImageView *)self->_imageView setImage:v12];

    v13 = [(MusicUsageDetailHeaderView *)self window];
    v14 = [v13 screen];
    [v14 scale];
    if (v15 == 0.0)
    {
      v16 = +[UIScreen mainScreen];
      [v16 scale];
      objc_msgSend(v4, "setDestinationScale:");
    }
    else
    {
      objc_msgSend(v4, "setDestinationScale:");
    }

    objc_msgSend(v4, "setFittingSize:", 44.0, 44.0);
    [v4 setDestination:self->_imageView configurationBlock:&stru_10500];
  }
  else
  {
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    long long v38 = 0uLL;
    long long v39 = 0uLL;
    double v17 = self->_imageSizeConstraints;
    id v18 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * (void)j) setConstant:0.0];
        }
        id v19 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v19);
    }
  }
  uint64_t v22 = (char *)[v3 count];
  v23 = v22;
  if (v22)
  {
    if (v22 == (unsigned char *)&dword_0 + 1)
    {
      uint64_t v24 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
      v23 = [v24 localizedStringForKey:@"SONG_COUNT_SUBTITLE_SINGULAR" value:&stru_108A0 table:@"MusicUsage"];
    }
    else
    {
      uint64_t v24 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
      uint64_t v25 = [v24 localizedStringForKey:@"SONG_COUNT_SUBTITLE_PLURAL" value:&stru_108A0 table:@"MusicUsage"];
      v23 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v23);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);
  uint64_t v27 = [WeakRetained name];

  uint64_t v28 = [v3 representativeItem];
  uint64_t v29 = [v28 valueForProperty:MPMediaItemPropertyIsCompilation];
  unsigned int v30 = [v29 BOOLValue];

  v31 = [v3 representativeItem];
  v32 = [v31 valueForProperty:MPMediaItemPropertyAlbumArtistPersistentID];
  id v33 = [v32 longLongValue];

  if (v30 && !v33)
  {
    id v34 = +[NSBundle bundleWithIdentifier:@"com.apple.MusicUsage"];
    uint64_t v35 = [v34 localizedStringForKey:@"VARIOUS_ARTISTS_TITLE" value:&stru_108A0 table:@"MusicUsage"];

    uint64_t v27 = (void *)v35;
  }
  [(UILabel *)self->_titleLabel setText:v27];
  [(UILabel *)self->_subtitleLabel setText:v23];
  double v36 = [(MusicUsageItem *)self->_usageItem childUsageGroup];
  id v37 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v36 groupSize], 2);
  [(UILabel *)self->_sizeLabel setText:v37];

  [(MusicUsageDetailHeaderView *)self setNeedsUpdateConstraints];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingViewConstraint, 0);
  objc_storeStrong((id *)&self->_imageSizeConstraints, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_usageItem, 0);

  objc_destroyWeak((id *)&self->_specifier);
}

@end