@interface CuratedCollectionItemAppClipView
- (CuratedCollectionItemAppClipView)initWithFrame:(CGRect)a3;
- (CuratedCollectionItemAppClipViewModel)viewModel;
- (void)_updateFonts;
- (void)_updateFromModel;
- (void)setViewModel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUI;
@end

@implementation CuratedCollectionItemAppClipView

- (CuratedCollectionItemAppClipView)initWithFrame:(CGRect)a3
{
  v51.receiver = self;
  v51.super_class = (Class)CuratedCollectionItemAppClipView;
  v3 = -[CuratedCollectionItemAppClipView initWithFrame:](&v51, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CuratedCollectionItemAppClipView *)v3 setClipsToBounds:1];
    v5 = [(CuratedCollectionItemAppClipView *)v4 layer];
    [v5 setCornerCurve:kCACornerCurveContinuous];

    v6 = [(CuratedCollectionItemAppClipView *)v4 layer];
    [v6 setCornerRadius:10.0];

    [(CuratedCollectionItemAppClipView *)v4 setAccessibilityIdentifier:@"CuratedCollectionItemAppClip"];
    id v7 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v11;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = +[UIColor labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v13];

    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v16];

    [(UILabel *)v4->_subtitleLabel setAccessibilityIdentifier:@"SubtitleLabel"];
    id v17 = objc_alloc((Class)UIStackView);
    v54[0] = v4->_titleLabel;
    v54[1] = v4->_subtitleLabel;
    v18 = +[NSArray arrayWithObjects:v54 count:2];
    v19 = (UIStackView *)[v17 initWithArrangedSubviews:v18];
    titleStackView = v4->_titleStackView;
    v4->_titleStackView = v19;

    [(UIStackView *)v4->_titleStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_titleStackView setAxis:1];
    [(UIStackView *)v4->_titleStackView setAccessibilityIdentifier:@"TitleStackView"];
    v21 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    artworkImageView = v4->_artworkImageView;
    v4->_artworkImageView = v21;

    [(UIImageView *)v4->_artworkImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_artworkImageView setContentMode:2];
    [(UIImageView *)v4->_artworkImageView setAccessibilityIdentifier:@"ArtworkImageView"];
    id v23 = objc_alloc((Class)UIImageView);
    v24 = +[UIImage systemImageNamed:@"appclip"];
    v25 = (UIImageView *)[v23 initWithImage:v24];
    appClipSymbolImageView = v4->_appClipSymbolImageView;
    v4->_appClipSymbolImageView = v25;

    [(UIImageView *)v4->_appClipSymbolImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v27) = 1132134400;
    [(UIImageView *)v4->_appClipSymbolImageView setContentHuggingPriority:0 forAxis:v27];
    LODWORD(v28) = 1144766464;
    [(UIImageView *)v4->_appClipSymbolImageView setContentCompressionResistancePriority:0 forAxis:v28];
    [(UIImageView *)v4->_appClipSymbolImageView setAccessibilityIdentifier:@"AppClipSymbolImageView"];
    id v29 = objc_alloc((Class)UIStackView);
    v53[0] = v4->_artworkImageView;
    v53[1] = v4->_titleStackView;
    v53[2] = v4->_appClipSymbolImageView;
    v30 = +[NSArray arrayWithObjects:v53 count:3];
    v31 = (UIStackView *)[v29 initWithArrangedSubviews:v30];
    contentStackView = v4->_contentStackView;
    v4->_contentStackView = v31;

    [(UIStackView *)v4->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_contentStackView setAlignment:3];
    [(UIStackView *)v4->_contentStackView setSpacing:10.0];
    [(UIStackView *)v4->_contentStackView setAccessibilityIdentifier:@"ContentStackView"];
    [(CuratedCollectionItemAppClipView *)v4 addSubview:v4->_contentStackView];
    v50 = [(UIStackView *)v4->_contentStackView topAnchor];
    v49 = [(CuratedCollectionItemAppClipView *)v4 topAnchor];
    v48 = [v50 constraintEqualToAnchor:v49 constant:12.0];
    v52[0] = v48;
    v47 = [(UIStackView *)v4->_contentStackView leadingAnchor];
    v46 = [(CuratedCollectionItemAppClipView *)v4 leadingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46 constant:16.0];
    v52[1] = v45;
    v44 = [(UIStackView *)v4->_contentStackView trailingAnchor];
    v43 = [(CuratedCollectionItemAppClipView *)v4 trailingAnchor];
    v33 = [v44 constraintEqualToAnchor:v43 constant:-16.0];
    v52[2] = v33;
    v34 = [(UIStackView *)v4->_contentStackView bottomAnchor];
    v35 = [(CuratedCollectionItemAppClipView *)v4 bottomAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:-12.0];
    v52[3] = v36;
    v37 = [(UIImageView *)v4->_artworkImageView widthAnchor];
    v38 = [v37 constraintEqualToConstant:30.0];
    v52[4] = v38;
    v39 = [(UIImageView *)v4->_artworkImageView heightAnchor];
    v40 = [v39 constraintEqualToConstant:30.0];
    v52[5] = v40;
    v41 = +[NSArray arrayWithObjects:v52 count:6];
    +[NSLayoutConstraint activateConstraints:v41];

    [(CuratedCollectionItemAppClipView *)v4 _updateFonts];
    [(CuratedCollectionItemAppClipView *)v4 updateUI];
  }
  return v4;
}

- (void)updateUI
{
  v3 = [(CuratedCollectionItemAppClipView *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2) {
    +[UIColor secondarySystemGroupedBackgroundColor];
  }
  else {
  id v5 = +[UIColor whiteColor];
  }
  [(CuratedCollectionItemAppClipView *)self setBackgroundColor:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CuratedCollectionItemAppClipView;
  [(CuratedCollectionItemAppClipView *)&v17 traitCollectionDidChange:v4];
  id v5 = [(CuratedCollectionItemAppClipView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];
  uint64_t v8 = sub_1000E93B0(v6, v7);

  if (v8) {
    [(CuratedCollectionItemAppClipView *)self _updateFonts];
  }
  v9 = [(CuratedCollectionItemAppClipView *)self traitCollection];
  [v9 displayScale];
  double v11 = v10;
  [v4 displayScale];
  double v13 = v12;

  if (v11 != v13) {
    [(CuratedCollectionItemAppClipView *)self _updateFromModel];
  }
  v14 = [(CuratedCollectionItemAppClipView *)self traitCollection];
  id v15 = [v14 userInterfaceStyle];
  id v16 = [v4 userInterfaceStyle];

  if (v15 != v16) {
    [(CuratedCollectionItemAppClipView *)self updateUI];
  }
}

- (void)_updateFonts
{
  v3 = +[UIFont system17SemiBold];
  [(UILabel *)self->_titleLabel setFont:v3];

  id v4 = +[UIFont system13];
  [(UILabel *)self->_subtitleLabel setFont:v4];

  id v6 = +[UIFont system20Semibold];
  id v5 = +[UIImageSymbolConfiguration configurationWithFont:v6 scale:2];
  [(UIImageView *)self->_appClipSymbolImageView setPreferredSymbolConfiguration:v5];
}

- (void)setViewModel:(id)a3
{
  id v5 = (CuratedCollectionItemAppClipViewModel *)a3;
  id v6 = v5;
  if (self->_viewModel != v5)
  {
    uint64_t v8 = v5;
    unsigned __int8 v7 = -[CuratedCollectionItemAppClipViewModel isEqual:](v5, "isEqual:");
    id v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModel, a3);
      [(CuratedCollectionItemAppClipView *)self _updateFromModel];
      id v6 = v8;
    }
  }
}

- (void)_updateFromModel
{
  v3 = [(CuratedCollectionItemAppClipViewModel *)self->_viewModel title];
  [(UILabel *)self->_titleLabel setText:v3];

  id v4 = [(CuratedCollectionItemAppClipViewModel *)self->_viewModel subtitle];
  [(UILabel *)self->_subtitleLabel setText:v4];

  objc_initWeak(&location, self);
  id v5 = self->_viewModel;
  viewModel = self->_viewModel;
  unsigned __int8 v7 = [(CuratedCollectionItemAppClipView *)self traitCollection];
  [v7 displayScale];
  if (v8 > 0.0)
  {
    v9 = [(CuratedCollectionItemAppClipView *)self traitCollection];
    [v9 displayScale];
  }
  else
  {
    v9 = +[UIScreen mainScreen];
    [v9 scale];
  }
  double v11 = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008F50D8;
  v13[3] = &unk_101300178;
  objc_copyWeak(&v15, &location);
  double v12 = v5;
  v14 = v12;
  -[CuratedCollectionItemAppClipViewModel fetchAppClipIconWithSize:scale:completion:](viewModel, "fetchAppClipIconWithSize:scale:completion:", v13, 30.0, 30.0, v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (CuratedCollectionItemAppClipViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_appClipSymbolImageView, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);

  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end