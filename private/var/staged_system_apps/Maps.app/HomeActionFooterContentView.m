@interface HomeActionFooterContentView
- (BOOL)_shouldShowShareMylocation;
- (HomeActionFooterContentView)initWithFrame:(CGRect)a3;
- (HomeActionFooterViewModel)viewModel;
- (id)_footerButtonWithTitle:(id)a3;
- (id)_linkButtonWithTitle:(id)a3;
- (void)_markMyLocation:(id)a3;
- (void)_openTermsAndConditions:(id)a3;
- (void)_rebuildContent;
- (void)_reportAProblem:(id)a3;
- (void)_shareMyLocation:(id)a3;
- (void)_updateLayoutMargins;
- (void)_updateRapMenu;
- (void)rebuildContentIfNeeded;
- (void)setViewModel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HomeActionFooterContentView

- (HomeActionFooterContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HomeActionFooterContentView;
  v3 = -[HomeActionFooterContentView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HomeActionFooterContentView *)v3 _mapsui_resetLayoutMargins];
    [(HomeActionFooterContentView *)v4 _rebuildContent];
  }
  return v4;
}

- (void)_rebuildContent
{
  [(UIButton *)self->_shareMyLocationButton removeFromSuperview];
  shareMyLocationButton = self->_shareMyLocationButton;
  self->_shareMyLocationButton = 0;

  [(UIButton *)self->_markMyLocationButton removeFromSuperview];
  markMyLocationButton = self->_markMyLocationButton;
  self->_markMyLocationButton = 0;

  [(UIButton *)self->_rapButton removeFromSuperview];
  rapButton = self->_rapButton;
  self->_rapButton = 0;

  [(UIButton *)self->_termsAndConditionsButton removeFromSuperview];
  termsAndConditionsButton = self->_termsAndConditionsButton;
  self->_termsAndConditionsButton = 0;

  [(MUCompositionalStackLayout *)self->_stackLayout deactivate];
  stackLayout = self->_stackLayout;
  self->_stackLayout = 0;

  v8 = +[NSMutableArray array];
  if ([(HomeActionFooterContentView *)self _shouldShowShareMylocation])
  {
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"[Maps Home] Share My Location" value:@"localized string not found" table:0];
    v11 = [(HomeActionFooterContentView *)self _footerButtonWithTitle:v10];
    v12 = self->_shareMyLocationButton;
    self->_shareMyLocationButton = v11;

    [(UIButton *)self->_shareMyLocationButton addTarget:self action:"_shareMyLocation:" forControlEvents:0x2000];
    [(HomeActionFooterContentView *)self addSubview:self->_shareMyLocationButton];
    [v8 addObject:self->_shareMyLocationButton];
  }
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"[Maps Home] Mark My Location" value:@"localized string not found" table:0];
  v15 = [(HomeActionFooterContentView *)self _footerButtonWithTitle:v14];
  v16 = self->_markMyLocationButton;
  self->_markMyLocationButton = v15;

  [(UIButton *)self->_markMyLocationButton addTarget:self action:"_markMyLocation:" forControlEvents:0x2000];
  [(HomeActionFooterContentView *)self addSubview:self->_markMyLocationButton];
  [v8 addObject:self->_markMyLocationButton];
  if (_MKRAPIsAvailable() && (sub_100521BD0() & 1) == 0)
  {
    v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"[Maps Home] Report an Issue" value:@"localized string not found" table:0];
    v19 = [(HomeActionFooterContentView *)self _footerButtonWithTitle:v18];
    v20 = self->_rapButton;
    self->_rapButton = v19;

    [(HomeActionFooterContentView *)self addSubview:self->_rapButton];
    [v8 addObject:self->_rapButton];
  }
  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"[Maps Home] Terms & Conditions" value:@"localized string not found" table:0];
  v23 = [(HomeActionFooterContentView *)self _linkButtonWithTitle:v22];
  v24 = self->_termsAndConditionsButton;
  self->_termsAndConditionsButton = v23;

  [(UIButton *)self->_termsAndConditionsButton addTarget:self action:"_openTermsAndConditions:" forControlEvents:0x2000];
  [(HomeActionFooterContentView *)self addSubview:self->_termsAndConditionsButton];
  id v25 = [objc_alloc((Class)MUCompositionalStackLayoutGroup) initWithAxis:1];
  [v25 setArrangedLayoutItems:v8];
  [v25 setSpacing:10.0];
  id v26 = [objc_alloc((Class)MUCompositionalStackLayoutGroup) initWithAxis:1];
  v27 = self->_termsAndConditionsButton;
  v34[0] = v25;
  v34[1] = v27;
  v28 = +[NSArray arrayWithObjects:v34 count:2];
  [v26 setArrangedLayoutItems:v28];

  [v26 setDistribution:2];
  LODWORD(v29) = 1112276992;
  [v26 setDistributionFittingSizePriority:v29];
  [v26 setSpacing:16.0];
  [v26 setAlignment:1 forArrangedLayoutItem:self->_termsAndConditionsButton];
  [v26 setAlignmentBoundsContent:1 forArrangedLayoutItem:self->_termsAndConditionsButton];
  id v30 = objc_alloc((Class)MUCompositionalStackLayout);
  v31 = [(HomeActionFooterContentView *)self layoutMarginsGuide];
  v32 = (MUCompositionalStackLayout *)[v30 initWithContainer:v31 group:v26];
  v33 = self->_stackLayout;
  self->_stackLayout = v32;

  [(MUCompositionalStackLayout *)self->_stackLayout activate];
  [(HomeActionFooterContentView *)self _updateRapMenu];
  [(HomeActionFooterContentView *)self _updateLayoutMargins];
}

- (void)_updateRapMenu
{
  v3 = [(HomeActionFooterContentView *)self viewModel];
  v4 = [v3 delegate];
  id v7 = [v4 homeActionFooterViewUIMenuForRAP:self];

  rapButton = self->_rapButton;
  if (v7)
  {
    [(UIButton *)rapButton setMenu:v7];
    uint64_t v6 = 0x4000;
  }
  else
  {
    [(UIButton *)rapButton setMenu:0];
    uint64_t v6 = 0x2000;
  }
  [(UIButton *)self->_rapButton setShowsMenuAsPrimaryAction:v7 != 0];
  [(UIButton *)self->_rapButton addTarget:self action:"_reportAProblem:" forControlEvents:v6];
}

- (id)_footerButtonWithTitle:(id)a3
{
  id v3 = a3;
  v4 = +[UIButtonConfiguration _mapsui_grayButtonConfiguration];
  v5 = [v4 background];
  [v5 setCornerRadius:8.0];

  uint64_t v6 = +[UIColor quaternarySystemFillColor];
  id v7 = [v4 background];
  [v7 setBackgroundColor:v6];

  [v4 setCornerStyle:-1];
  [v4 setTitle:v3];

  v8 = +[UIButton buttonWithType:0];
  [v8 setConfiguration:v4];

  return v8;
}

- (id)_linkButtonWithTitle:(id)a3
{
  id v3 = a3;
  v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption2];
  v5 = +[UIButtonConfiguration plainButtonConfiguration];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005A6F2C;
  v12[3] = &unk_1012E90F0;
  id v13 = v4;
  id v6 = v4;
  [v5 setTitleTextAttributesTransformer:v12];
  [v5 setTitle:v3];

  id v7 = +[UIImage systemImageNamed:@"chevron.forward"];
  [v5 setImage:v7];

  [v5 setImagePlacement:8];
  v8 = +[UIImageSymbolConfiguration configurationWithFont:v6 scale:1];
  [v5 setPreferredSymbolConfigurationForImage:v8];

  v9 = +[UIColor secondaryLabelColor];
  [v5 setBaseForegroundColor:v9];

  [v5 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
  v10 = +[UIButton buttonWithType:0];
  [v10 setConfiguration:v5];

  return v10;
}

- (void)setViewModel:(id)a3
{
  v5 = (HomeActionFooterViewModel *)a3;
  id v6 = v5;
  if (self->_viewModel != v5)
  {
    v8 = v5;
    unsigned __int8 v7 = -[HomeActionFooterViewModel isEqual:](v5, "isEqual:");
    id v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModel, a3);
      [(HomeActionFooterContentView *)self _updateLayoutMargins];
      [(HomeActionFooterContentView *)self _updateRapMenu];
      id v6 = v8;
    }
  }
}

- (void)rebuildContentIfNeeded
{
  if (_MKRAPIsAvailable())
  {
    if ((sub_100521BD0() ^ (self->_rapButton != 0))) {
      return;
    }
  }
  else if (!self->_rapButton)
  {
    return;
  }

  [(HomeActionFooterContentView *)self _rebuildContent];
}

- (void)_updateLayoutMargins
{
  id v3 = [(MUCompositionalStackLayout *)self->_stackLayout group];
  id v4 = [v3 copy];

  [(HomeActionFooterViewModel *)self->_viewModel topMargin];
  [v4 setInsets:];
  [(MUCompositionalStackLayout *)self->_stackLayout setGroup:v4];
}

- (BOOL)_shouldShowShareMylocation
{
  v2 = +[GEOCountryConfiguration sharedConfiguration];
  id v3 = [v2 countryCode];

  LOBYTE(v2) = [v3 isEqualToString:@"KR"] ^ 1;
  return (char)v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HomeActionFooterContentView;
  id v4 = a3;
  [(HomeActionFooterContentView *)&v9 traitCollectionDidChange:v4];
  v5 = [(HomeActionFooterContentView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  unsigned __int8 v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(HomeActionFooterContentView *)self _rebuildContent];
  }
}

- (void)_shareMyLocation:(id)a3
{
  id v4 = a3;
  v5 = [(HomeActionFooterViewModel *)self->_viewModel delegate];
  id v8 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  [v5 homeActionFooterViewDidTapShareMyLocation:v7];
}

- (void)_markMyLocation:(id)a3
{
  id v4 = a3;
  v5 = [(HomeActionFooterViewModel *)self->_viewModel delegate];
  id v8 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  [v5 homeActionFooterViewDidTapMarkMyLocation:v7];
}

- (void)_reportAProblem:(id)a3
{
  id v4 = a3;
  v5 = [(HomeActionFooterViewModel *)self->_viewModel delegate];
  id v8 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  [v5 homeActionFooterViewDidTapReportAProblem:v7];
}

- (void)_openTermsAndConditions:(id)a3
{
  id v4 = a3;
  v5 = [(HomeActionFooterViewModel *)self->_viewModel delegate];
  id v8 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  [v5 homeActionFooterViewDidTapTermsAndConditions:v7];
}

- (HomeActionFooterViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_stackLayout, 0);
  objc_storeStrong((id *)&self->_termsAndConditionsButton, 0);
  objc_storeStrong((id *)&self->_rapButton, 0);
  objc_storeStrong((id *)&self->_markMyLocationButton, 0);

  objc_storeStrong((id *)&self->_shareMyLocationButton, 0);
}

@end