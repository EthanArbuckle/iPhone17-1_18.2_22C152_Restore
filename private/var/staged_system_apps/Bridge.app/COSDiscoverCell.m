@interface COSDiscoverCell
+ (id)reuseIdentifier;
- (COSDiscoverCell)initWithFrame:(CGRect)a3;
- (UIImageView)heroImageView;
- (UIImageView)subtitleImage;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)divider;
- (UIView)trayView;
- (double)preferredWidth;
- (id)_subtitleLabelFont;
- (id)_titleLabelFont;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)setDivider:(id)a3;
- (void)setHeroImageView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 title:(id)a4 subtitle:(id)a5 wantsCellDivider:(BOOL)a6;
- (void)setPreferredWidth:(double)a3;
- (void)setSubtitleImage:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrayView:(id)a3;
@end

@implementation COSDiscoverCell

+ (id)reuseIdentifier
{
  return @"COSDiscoverCell";
}

- (COSDiscoverCell)initWithFrame:(CGRect)a3
{
  v92.receiver = self;
  v92.super_class = (Class)COSDiscoverCell;
  v3 = -[COSDiscoverCell initWithFrame:](&v92, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(COSDiscoverCell *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = objc_opt_new();
    heroImageView = v4->_heroImageView;
    v4->_heroImageView = (UIImageView *)v5;

    v7 = +[UIColor systemGray6Color];
    [(UIImageView *)v4->_heroImageView setBackgroundColor:v7];

    [(UIImageView *)v4->_heroImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_heroImageView setClipsToBounds:1];
    [(UIImageView *)v4->_heroImageView setContentMode:1];
    v8 = [(UIImageView *)v4->_heroImageView layer];
    [v8 setCornerRadius:8.0];

    [(COSDiscoverCell *)v4 addSubview:v4->_heroImageView];
    uint64_t v9 = objc_opt_new();
    trayView = v4->_trayView;
    v4->_trayView = (UIView *)v9;

    [(UIView *)v4->_trayView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(COSDiscoverCell *)v4 addSubview:v4->_trayView];
    uint64_t v11 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    v13 = v4->_titleLabel;
    v14 = [(COSDiscoverCell *)v4 _titleLabelFont];
    [(UILabel *)v13 setFont:v14];

    v15 = +[UIColor systemWhiteColor];
    [(UILabel *)v4->_titleLabel setColor:v15];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_trayView addSubview:v4->_titleLabel];
    uint64_t v16 = objc_opt_new();
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v16;

    v18 = v4->_subtitleLabel;
    v19 = [(COSDiscoverCell *)v4 _subtitleLabelFont];
    [(UILabel *)v18 setFont:v19];

    v20 = v4->_subtitleLabel;
    v21 = +[UIColor systemGrayColor];
    [(UILabel *)v20 setTextColor:v21];

    [(UILabel *)v4->_subtitleLabel setLineBreakMode:0];
    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v4->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_trayView addSubview:v4->_subtitleLabel];
    uint64_t v22 = objc_opt_new();
    divider = v4->_divider;
    v4->_divider = (UIView *)v22;

    v24 = v4->_divider;
    v25 = +[UIColor systemGray6Color];
    [(UIView *)v24 setBackgroundColor:v25];

    [(UIView *)v4->_divider setTranslatesAutoresizingMaskIntoConstraints:0];
    [(COSDiscoverCell *)v4 addSubview:v4->_divider];
    v91 = [(COSDiscoverCell *)v4 leadingAnchor];
    v90 = [(UIImageView *)v4->_heroImageView leadingAnchor];
    v89 = [v91 constraintEqualToAnchor:v90 constant:-20.0];
    v93[0] = v89;
    v88 = [(UIImageView *)v4->_heroImageView heightAnchor];
    v87 = [v88 constraintEqualToConstant:102.0];
    v93[1] = v87;
    v86 = [(UIImageView *)v4->_heroImageView widthAnchor];
    v85 = [v86 constraintEqualToConstant:102.0];
    v93[2] = v85;
    v84 = [(COSDiscoverCell *)v4 topAnchor];
    v83 = [(UIView *)v4->_trayView topAnchor];
    v82 = [v84 constraintLessThanOrEqualToAnchor:v83];
    v93[3] = v82;
    v81 = [(UIView *)v4->_trayView leadingAnchor];
    v80 = [(UIImageView *)v4->_heroImageView trailingAnchor];
    v79 = [v81 constraintEqualToAnchor:v80 constant:8.0];
    v93[4] = v79;
    v78 = [(COSDiscoverCell *)v4 layoutMarginsGuide];
    v77 = [v78 trailingAnchor];
    v76 = [(UIView *)v4->_trayView trailingAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v93[5] = v75;
    v74 = [(COSDiscoverCell *)v4 bottomAnchor];
    v73 = [(UIView *)v4->_trayView bottomAnchor];
    v72 = [v74 constraintGreaterThanOrEqualToAnchor:v73];
    v93[6] = v72;
    v71 = [(COSDiscoverCell *)v4 topAnchor];
    v70 = [(UIView *)v4->_divider topAnchor];
    v69 = [v71 constraintLessThanOrEqualToAnchor:v70];
    v93[7] = v69;
    v68 = [(UIView *)v4->_divider leadingAnchor];
    v67 = [(UIImageView *)v4->_heroImageView trailingAnchor];
    v66 = [v68 constraintEqualToAnchor:v67 constant:8.0];
    v93[8] = v66;
    v64 = [(UIView *)v4->_divider heightAnchor];
    v65 = +[UIScreen mainScreen];
    v63 = [v65 traitCollection];
    [v63 displayScale];
    v62 = [v64 constraintEqualToConstant:1.0 / v26];
    v93[9] = v62;
    v61 = [(COSDiscoverCell *)v4 trailingAnchor];
    v60 = [(UIView *)v4->_divider trailingAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v93[10] = v59;
    v58 = [(COSDiscoverCell *)v4 bottomAnchor];
    v57 = [(UIView *)v4->_divider bottomAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v93[11] = v56;
    v55 = [(UILabel *)v4->_titleLabel topAnchor];
    v54 = [(UIView *)v4->_trayView topAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v93[12] = v53;
    v52 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v51 = [(UIView *)v4->_trayView leadingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v93[13] = v50;
    v49 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v48 = [(UIView *)v4->_trayView trailingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v93[14] = v47;
    v46 = [(UILabel *)v4->_subtitleLabel topAnchor];
    v45 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v93[15] = v44;
    v43 = [(UILabel *)v4->_subtitleLabel leadingAnchor];
    v42 = [(UIView *)v4->_trayView leadingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v93[16] = v41;
    v40 = [(UILabel *)v4->_subtitleLabel bottomAnchor];
    v39 = [(UIView *)v4->_trayView bottomAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v93[17] = v38;
    v37 = [(UILabel *)v4->_subtitleLabel trailingAnchor];
    v27 = [(UIView *)v4->_trayView trailingAnchor];
    v28 = [v37 constraintEqualToAnchor:v27];
    v93[18] = v28;
    v29 = [(UIImageView *)v4->_heroImageView centerYAnchor];
    v30 = [(COSDiscoverCell *)v4 centerYAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v93[19] = v31;
    v32 = [(UIView *)v4->_trayView centerYAnchor];
    v33 = [(UIImageView *)v4->_heroImageView centerYAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v93[20] = v34;
    v35 = +[NSArray arrayWithObjects:v93 count:21];
    +[NSLayoutConstraint activateConstraints:v35];
  }
  return v4;
}

- (id)_titleLabelFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

- (id)_subtitleLabelFont
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
}

- (void)setImage:(id)a3 title:(id)a4 subtitle:(id)a5 wantsCellDivider:(BOOL)a6
{
  BOOL v6 = a6;
  heroImageView = self->_heroImageView;
  id v11 = a5;
  id v12 = a4;
  [(UIImageView *)heroImageView setImage:a3];
  [(UILabel *)self->_titleLabel setText:v12];

  [(UILabel *)self->_subtitleLabel setAttributedText:v11];
  [(UIView *)self->_divider setHidden:!v6];

  [(COSDiscoverCell *)self layoutSubviews];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)COSDiscoverCell;
  -[COSDiscoverCell setHighlighted:](&v6, "setHighlighted:");
  if (v3) {
    +[UIColor tertiarySystemBackgroundColor];
  }
  else {
  uint64_t v5 = +[UIColor blackColor];
  }
  [(COSDiscoverCell *)self setBackgroundColor:v5];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)COSDiscoverCell;
  v4 = [(COSDiscoverCell *)&v7 preferredLayoutAttributesFittingAttributes:a3];
  -[UIView systemLayoutSizeFittingSize:](self->_trayView, "systemLayoutSizeFittingSize:", self->_preferredWidth + -102.0 + -8.0, UIViewNoIntrinsicMetric);
  [v4 setSize:self->_preferredWidth, fmax(v5, 120.0)];

  return v4;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (UIImageView)heroImageView
{
  return self->_heroImageView;
}

- (void)setHeroImageView:(id)a3
{
}

- (UIView)trayView
{
  return self->_trayView;
}

- (void)setTrayView:(id)a3
{
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

- (UIImageView)subtitleImage
{
  return self->_subtitleImage;
}

- (void)setSubtitleImage:(id)a3
{
}

- (UIView)divider
{
  return self->_divider;
}

- (void)setDivider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divider, 0);
  objc_storeStrong((id *)&self->_subtitleImage, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_trayView, 0);

  objc_storeStrong((id *)&self->_heroImageView, 0);
}

@end