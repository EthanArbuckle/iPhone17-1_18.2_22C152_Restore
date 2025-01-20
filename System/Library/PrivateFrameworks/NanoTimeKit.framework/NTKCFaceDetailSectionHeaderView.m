@interface NTKCFaceDetailSectionHeaderView
+ (double)headerHeight;
+ (id)reuseIdentifier;
- (NSString)groupName;
- (NSString)subtitle;
- (NSString)title;
- (NTKCFaceDetailSectionHeaderView)init;
- (NTKCFaceDetailSectionHeaderView)initWithReuseIdentifier:(id)a3;
- (id)_traitCollectionAdjustedIfNeeded;
- (void)_updateConfig;
- (void)layoutSubviews;
- (void)setGroupName:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NTKCFaceDetailSectionHeaderView

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (double)headerHeight
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v3 = [v2 traitCollection];
  v4 = [v3 preferredContentSizeCategory];

  v5 = (void *)*MEMORY[0x1E4FB2790];
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending)
  {
    id v6 = v5;

    v4 = v6;
  }
  v7 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v4];
  if (_os_feature_enabled_impl())
  {
    v8 = [MEMORY[0x1E4FB1948] sidebarHeaderConfiguration];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1EB8]) initWithTraitCollection:v7];
    id v10 = (id)[v8 updatedConfigurationForState:v9];
    v11 = [v8 textProperties];
    v12 = [v11 font];

    [v12 _scaledValueForValue:6.0];
    double v14 = v13;
    [v12 lineHeight];
    UICeilToScale();
    double v16 = v14 + v15;
  }
  else
  {
    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v7];
    [v8 _scaledValueForValue:32.0];
    double v16 = v17;
  }

  return v16;
}

- (NTKCFaceDetailSectionHeaderView)init
{
  v3 = [(id)objc_opt_class() reuseIdentifier];
  v4 = [(NTKCFaceDetailSectionHeaderView *)self initWithReuseIdentifier:v3];

  return v4;
}

- (NTKCFaceDetailSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)NTKCFaceDetailSectionHeaderView;
  v3 = [(NTKCFaceDetailSectionHeaderView *)&v17 initWithReuseIdentifier:a3];
  if (v3)
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v4 = [MEMORY[0x1E4FB1948] sidebarHeaderConfiguration];
      configuration = v3->_configuration;
      v3->_configuration = (UIListContentConfiguration *)v4;
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1F00]);
      configuration = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
      v7 = (void *)[v6 initWithEffect:configuration];
      [(NTKCFaceDetailSectionHeaderView *)v3 setBackgroundView:v7];
    }
    uint64_t v8 = objc_opt_new();
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = (UILabel *)v8;

    id v10 = BPSDetailTextColor();
    [(UILabel *)v3->_detailLabel setTextColor:v10];

    if (CLKLayoutIsRTL()) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 2;
    }
    [(UILabel *)v3->_detailLabel setTextAlignment:v11];
    v12 = [(NTKCFaceDetailSectionHeaderView *)v3 contentView];
    [v12 addSubview:v3->_detailLabel];

    uint64_t v13 = objc_opt_new();
    separator = v3->_separator;
    v3->_separator = (NTKCSeparatorView *)v13;

    [(NTKCFaceDetailSectionHeaderView *)v3 addSubview:v3->_separator];
    double v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v3 selector:sel__fontSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    [(NTKCFaceDetailSectionHeaderView *)v3 _fontSizeDidChange];
  }
  return v3;
}

- (NSString)title
{
  v2 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
  [v5 setText:v4];

  id v6 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
  [v6 sizeToFit];

  [(NTKCFaceDetailSectionHeaderView *)self setNeedsLayout];
}

- (NSString)subtitle
{
  return [(UILabel *)self->_detailLabel text];
}

- (void)setSubtitle:(id)a3
{
  [(UILabel *)self->_detailLabel setText:a3];
  [(UILabel *)self->_detailLabel sizeToFit];

  [(NTKCFaceDetailSectionHeaderView *)self setNeedsLayout];
}

- (NSString)groupName
{
  if (_os_feature_enabled_impl())
  {
    v3 = 0;
  }
  else
  {
    id v4 = [(NTKCFaceDetailSectionHeaderView *)self backgroundView];
    v3 = [v4 _groupName];
  }

  return (NSString *)v3;
}

- (void)setGroupName:(id)a3
{
  id v5 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v4 = [(NTKCFaceDetailSectionHeaderView *)self backgroundView];
    [v4 _setGroupName:v5];
  }
}

- (void)layoutSubviews
{
  v69.receiver = self;
  v69.super_class = (Class)NTKCFaceDetailSectionHeaderView;
  [(NTKCFaceDetailSectionHeaderView *)&v69 layoutSubviews];
  [(NTKCFaceDetailSectionHeaderView *)self _updateConfig];
  v3 = [(NTKCFaceDetailSectionHeaderView *)self contentView];
  [v3 bounds];
  CGFloat v66 = v4;
  CGFloat v67 = v5;
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  double v10 = NTKCScreenEdgeMargin();
  double v11 = v10;
  int IsRTL = CLKLayoutIsRTL();
  uint64_t v13 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
  [v13 frame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v65 = v10;
  if (IsRTL)
  {
    v70.origin.x = v66;
    v70.origin.y = v67;
    v70.size.width = v7;
    v70.size.height = v9;
    double Width = CGRectGetWidth(v70);
    v71.origin.x = v15;
    v71.origin.y = v17;
    v71.size.width = v19;
    v71.size.height = v21;
    double v11 = Width - CGRectGetWidth(v71) - v10;
  }
  CGFloat v64 = v9;
  CGFloat v23 = v7;
  double v24 = 6.0;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v25 = [(UILabel *)self->_detailLabel font];
    [v25 _scaledValueForValue:22.0];
    double v27 = v26;

    v28 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
    [v28 _lastLineBaseline];
    double v24 = v27 - v29;
  }
  v30 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
  objc_msgSend(v30, "setFrame:", v11, v24, v19, v21);

  [(UILabel *)self->_detailLabel frame];
  CGFloat v61 = v32;
  CGFloat v62 = v31;
  double v63 = v33;
  double v68 = v10;
  CGFloat rect = v21;
  if (_os_feature_enabled_impl())
  {
    v72.origin.x = v11;
    v72.origin.y = v24;
    v72.size.width = v19;
    v72.size.height = v21;
    CGFloat v34 = v11;
    double MinY = CGRectGetMinY(v72);
    v36 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
    [v36 _firstLineBaseline];
    double v38 = MinY + v37;
    [(UILabel *)self->_detailLabel _lastLineBaseline];
    double v40 = v38 - v39;
  }
  else
  {
    v41 = [(UILabel *)self->_detailLabel font];
    [v41 _scaledValueForValue:22.0];
    CGFloat v34 = v11;
    double v43 = v42;

    [(UILabel *)self->_detailLabel _lastLineBaseline];
    double v40 = v43 - v44;
  }
  v73.origin.y = v67;
  v73.origin.x = v66;
  v73.size.width = v23;
  v73.size.height = v64;
  CGFloat v45 = CGRectGetWidth(v73) + v10 * -2.0;
  v74.origin.x = v34;
  v74.origin.y = v24;
  v74.size.width = v19;
  v74.size.height = rect;
  double v46 = v45 - CGRectGetWidth(v74) + -16.0;
  double v47 = v61;
  v75.origin.x = v62;
  v75.origin.y = v40;
  v75.size.width = v61;
  v75.size.height = v63;
  double v48 = CGRectGetWidth(v75);
  double v49 = 0.0;
  if (v46 >= 0.0) {
    double v49 = v46;
  }
  if (v48 > v46) {
    double v47 = v49;
  }
  double v50 = v65;
  if ((IsRTL & 1) == 0)
  {
    v76.origin.x = v66;
    v76.origin.y = v67;
    v76.size.width = v23;
    v76.size.height = v64;
    CGFloat v51 = CGRectGetWidth(v76) - v68;
    v77.origin.x = v62;
    v77.origin.y = v40;
    v77.size.width = v47;
    v77.size.height = v63;
    double v50 = v51 - CGRectGetWidth(v77);
  }
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", v50, v40, v47, v63);
  [(NTKCSeparatorView *)self->_separator frame];
  CGFloat v53 = v52;
  double v55 = v54;
  if (_os_feature_enabled_impl())
  {
    double v56 = 0.0;
    if (IsRTL) {
      double v57 = 0.0;
    }
    else {
      double v57 = v68;
    }
    [(NTKCFaceDetailSectionHeaderView *)self bounds];
    double v58 = CGRectGetWidth(v78) - v68;
  }
  else
  {
    [(NTKCFaceDetailSectionHeaderView *)self bounds];
    double v58 = CGRectGetWidth(v79);
    [(NTKCFaceDetailSectionHeaderView *)self bounds];
    double Height = CGRectGetHeight(v80);
    double v57 = 0.0;
    v81.origin.x = 0.0;
    v81.origin.y = v53;
    v81.size.width = v58;
    v81.size.height = v55;
    double v56 = Height - CGRectGetHeight(v81);
  }
  -[NTKCSeparatorView setFrame:](self->_separator, "setFrame:", v57, v56, v58, v55);
}

- (void)_updateConfig
{
  id v13 = [(NTKCFaceDetailSectionHeaderView *)self _traitCollectionAdjustedIfNeeded];
  if (_os_feature_enabled_impl())
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1EB8]) initWithTraitCollection:v13];
    double v4 = [(UIListContentConfiguration *)self->_configuration updatedConfigurationForState:v3];
    configuration = self->_configuration;
    self->_configuration = v4;

    double v6 = [(UIListContentConfiguration *)self->_configuration textProperties];
    CGFloat v7 = [v6 font];
    double v8 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
    [v8 setFont:v7];
  }
  else
  {
    v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908] compatibleWithTraitCollection:v13];
    double v6 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
    [v6 setFont:v3];
  }

  CGFloat v9 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
  [v9 sizeToFit];

  double v10 = BPSTextColor();
  double v11 = [(NTKCFaceDetailSectionHeaderView *)self textLabel];
  [v11 setTextColor:v10];

  v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v13];
  [(UILabel *)self->_detailLabel setFont:v12];
  [(UILabel *)self->_detailLabel sizeToFit];
}

- (id)_traitCollectionAdjustedIfNeeded
{
  v3 = [(NTKCFaceDetailSectionHeaderView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  uint64_t v5 = *MEMORY[0x1E4FB2790];
  if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending) {
    [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v5];
  }
  else {
  double v6 = [(NTKCFaceDetailSectionHeaderView *)self traitCollection];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_separator, 0);

  objc_storeStrong((id *)&self->_detailLabel, 0);
}

@end