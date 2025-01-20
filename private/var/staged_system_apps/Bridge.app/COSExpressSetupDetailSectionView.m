@interface COSExpressSetupDetailSectionView
- (BOOL)isCollapsed;
- (NSMutableDictionary)itemMap;
- (UIImageView)chevron;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)itemStackView;
- (id)itemViewForItem:(id)a3;
- (void)_didTapSection;
- (void)_setCollapsed:(BOOL)a3 animated:(BOOL)a4;
- (void)populateSection:(id)a3;
- (void)setChevron:(id)a3;
- (void)setImageView:(id)a3;
- (void)setIsCollapsed:(BOOL)a3;
- (void)setItemMap:(id)a3;
- (void)setItemStackView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation COSExpressSetupDetailSectionView

- (void)populateSection:(id)a3
{
  id v4 = a3;
  v5 = +[UIColor systemGray6Color];
  [(COSExpressSetupDetailSectionView *)self setBackgroundColor:v5];

  v6 = [(COSExpressSetupDetailSectionView *)self layer];
  [v6 setCornerRadius:8.0];

  v7 = (UILabel *)objc_opt_new();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  [(COSExpressSetupDetailSectionView *)self addSubview:self->_titleLabel];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [v4 title];
  [(UILabel *)self->_titleLabel setText:v9];

  v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [(UILabel *)self->_titleLabel setFont:v10];

  v11 = (UILabel *)objc_opt_new();
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v11;

  [(COSExpressSetupDetailSectionView *)self addSubview:self->_subtitleLabel];
  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v88 = v4;
  v13 = [v4 subtitle];
  [(UILabel *)self->_subtitleLabel setText:v13];

  v14 = +[UIColor systemGrayColor];
  [(UILabel *)self->_subtitleLabel setTextColor:v14];

  v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [(UILabel *)self->_subtitleLabel setFont:v15];

  [(UILabel *)self->_subtitleLabel setLineBreakMode:0];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  v16 = (UIImageView *)objc_opt_new();
  imageView = self->_imageView;
  self->_imageView = v16;

  [(COSExpressSetupDetailSectionView *)self addSubview:self->_imageView];
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_imageView setContentMode:1];
  v18 = [v4 image];
  [(UIImageView *)self->_imageView setImage:v18];

  v19 = (UIImageView *)objc_opt_new();
  chevron = self->_chevron;
  self->_chevron = v19;

  [(COSExpressSetupDetailSectionView *)self addSubview:self->_chevron];
  [(UIImageView *)self->_chevron setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = +[UIImage systemImageNamed:@"chevron.down"];
  [(UIImageView *)self->_chevron setImage:v21];

  v22 = +[UIColor systemGrayColor];
  [(UIImageView *)self->_chevron setTintColor:v22];

  v23 = (UIStackView *)objc_opt_new();
  itemStackView = self->_itemStackView;
  self->_itemStackView = v23;

  [(COSExpressSetupDetailSectionView *)self addSubview:self->_itemStackView];
  [(UIStackView *)self->_itemStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_itemStackView setAxis:1];
  [(UIStackView *)self->_itemStackView setAlignment:0];
  v87 = [(UIImageView *)self->_imageView topAnchor];
  v86 = [(COSExpressSetupDetailSectionView *)self topAnchor];
  v85 = [v87 constraintEqualToAnchor:v86 constant:16.0];
  v94[0] = v85;
  v84 = [(UIImageView *)self->_imageView leadingAnchor];
  v83 = [(COSExpressSetupDetailSectionView *)self leadingAnchor];
  v82 = [v84 constraintEqualToAnchor:v83 constant:16.0];
  v94[1] = v82;
  v81 = [(UIImageView *)self->_imageView widthAnchor];
  v80 = [v81 constraintEqualToConstant:36.0];
  v94[2] = v80;
  v79 = [(UIImageView *)self->_imageView heightAnchor];
  v78 = [v79 constraintEqualToConstant:36.0];
  v94[3] = v78;
  v77 = [(UIImageView *)self->_chevron trailingAnchor];
  v76 = [(COSExpressSetupDetailSectionView *)self trailingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:-16.0];
  v94[4] = v75;
  v74 = [(UIImageView *)self->_chevron centerYAnchor];
  v73 = [(UIImageView *)self->_imageView centerYAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v94[5] = v72;
  v71 = [(UILabel *)self->_titleLabel topAnchor];
  v70 = [(UIImageView *)self->_imageView topAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v94[6] = v69;
  v68 = [(UILabel *)self->_titleLabel leadingAnchor];
  v67 = [(UIImageView *)self->_imageView trailingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67 constant:8.0];
  v94[7] = v66;
  v65 = [(UILabel *)self->_titleLabel trailingAnchor];
  v64 = [(UIImageView *)self->_chevron trailingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:-2.0];
  v94[8] = v63;
  v62 = [(UILabel *)self->_subtitleLabel topAnchor];
  v61 = [(UILabel *)self->_titleLabel bottomAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:2.0];
  v94[9] = v60;
  v59 = [(UILabel *)self->_subtitleLabel leadingAnchor];
  v58 = [(UILabel *)self->_titleLabel leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v94[10] = v57;
  v56 = [(UILabel *)self->_subtitleLabel trailingAnchor];
  v55 = [(UIImageView *)self->_chevron trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:-2.0];
  v94[11] = v54;
  v53 = [(UILabel *)self->_subtitleLabel bottomAnchor];
  v52 = [(UIStackView *)self->_itemStackView topAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:-16.0];
  v94[12] = v51;
  v50 = [(UIStackView *)self->_itemStackView leadingAnchor];
  v25 = [(COSExpressSetupDetailSectionView *)self leadingAnchor];
  v26 = [v50 constraintEqualToAnchor:v25];
  v94[13] = v26;
  v27 = [(UIStackView *)self->_itemStackView trailingAnchor];
  v28 = [(COSExpressSetupDetailSectionView *)self trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v94[14] = v29;
  v30 = [(UIStackView *)self->_itemStackView bottomAnchor];
  v31 = [(COSExpressSetupDetailSectionView *)self bottomAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v94[15] = v32;
  v33 = +[NSArray arrayWithObjects:v94 count:16];
  +[NSLayoutConstraint activateConstraints:v33];

  v34 = v88;
  v35 = self;

  v36 = (NSMutableDictionary *)objc_opt_new();
  itemMap = self->_itemMap;
  self->_itemMap = v36;

  v38 = [v88 items];
  id v39 = [v38 count];

  if (v39)
  {
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v40 = [v88 items];
    id v41 = [v40 countByEnumeratingWithState:&v89 objects:v93 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v90;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v90 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          v46 = objc_opt_new();
          [v46 populateItem:v45];
          v47 = v35->_itemMap;
          v48 = [v45 identifier];
          [(NSMutableDictionary *)v47 setObject:v46 forKey:v48];

          [(UIStackView *)v35->_itemStackView addArrangedSubview:v46];
        }
        id v42 = [v40 countByEnumeratingWithState:&v89 objects:v93 count:16];
      }
      while (v42);
    }

    id v49 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v35 action:"_didTapSection"];
    [(COSExpressSetupDetailSectionView *)v35 addGestureRecognizer:v49];
    [(COSExpressSetupDetailSectionView *)v35 _setCollapsed:1 animated:0];

    v34 = v88;
  }
  else
  {
    [(UIImageView *)self->_chevron setHidden:1];
  }
}

- (id)itemViewForItem:(id)a3
{
  itemMap = self->_itemMap;
  id v4 = [a3 identifier];
  v5 = [(NSMutableDictionary *)itemMap objectForKey:v4];

  return v5;
}

- (void)_didTapSection
{
  uint64_t v3 = [(COSExpressSetupDetailSectionView *)self isCollapsed] ^ 1;

  [(COSExpressSetupDetailSectionView *)self _setCollapsed:v3 animated:1];
}

- (void)_setCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = objc_opt_new();
  if (v4) {
    double v8 = 0.25;
  }
  else {
    double v8 = 0.0;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000BED74;
  v20[3] = &unk_1002465B8;
  v20[4] = self;
  BOOL v22 = v5;
  id v21 = v7;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1000BEECC;
  v18 = &unk_100244CE0;
  id v9 = v21;
  id v19 = v9;
  +[UIView animateWithDuration:v20 animations:&v15 completion:v8];
  if (v5)
  {
    v10 = +[UIApplication sharedApplication];
    id v11 = [v10 userInterfaceLayoutDirection];

    if (v11 == (id)1) {
      CFStringRef v12 = @"chevron.left";
    }
    else {
      CFStringRef v12 = @"chevron.right";
    }
  }
  else
  {
    CFStringRef v12 = @"chevron.down";
  }
  v13 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v12, v15, v16, v17, v18);
  v14 = [(COSExpressSetupDetailSectionView *)self chevron];
  [v14 setImage:v13];

  [(COSExpressSetupDetailSectionView *)self setIsCollapsed:v5];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
}

- (UIStackView)itemStackView
{
  return self->_itemStackView;
}

- (void)setItemStackView:(id)a3
{
}

- (BOOL)isCollapsed
{
  return self->_isCollapsed;
}

- (void)setIsCollapsed:(BOOL)a3
{
  self->_isCollapsed = a3;
}

- (NSMutableDictionary)itemMap
{
  return self->_itemMap;
}

- (void)setItemMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemMap, 0);
  objc_storeStrong((id *)&self->_itemStackView, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end