@interface UGCPOIEnrichmentHeaderView
- (BOOL)hideSummaryText;
- (MKMapItem)mapItem;
- (UGCPOIEnrichmentHeaderView)initWithFrame:(CGRect)a3;
- (void)_cancelBrandIconDownload;
- (void)_refreshContent;
- (void)_setBrandIcon:(id)a3 fallbackToMapItemIcon:(BOOL)a4;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_startBrandIconDownload;
- (void)_updateIcon;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setHideSummaryText:(BOOL)a3;
- (void)setMapItem:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UGCPOIEnrichmentHeaderView

- (UGCPOIEnrichmentHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UGCPOIEnrichmentHeaderView;
  v3 = -[UGCPOIEnrichmentHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UGCPOIEnrichmentHeaderView *)v3 setAccessibilityIdentifier:@"UGCPOIEnrichmentHeader"];
    [(UGCPOIEnrichmentHeaderView *)v4 _setupSubviews];
    [(UGCPOIEnrichmentHeaderView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)dealloc
{
  [(UGCPOIEnrichmentHeaderView *)self _cancelBrandIconDownload];
  v3.receiver = self;
  v3.super_class = (Class)UGCPOIEnrichmentHeaderView;
  [(UGCPOIEnrichmentHeaderView *)&v3 dealloc];
}

- (void)_setupSubviews
{
  -[UGCPOIEnrichmentHeaderView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 16.0, 0.0, 16.0, 0.0);
  id v3 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectMake(0, y, width, height)];
  headerImageView = self->_headerImageView;
  self->_headerImageView = v7;

  [(UIImageView *)self->_headerImageView setAccessibilityIdentifier:@"HeaderImageView"];
  v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  v11 = +[UGCFontManager poiEnrichmentHeaderViewTitleFont];
  [(UILabel *)self->_titleLabel setFont:v11];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
  v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v12;

  v14 = +[UGCFontManager poiEnrichmentHeaderViewSecondaryTitleFont];
  [(UILabel *)self->_secondaryLabel setFont:v14];

  v15 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_secondaryLabel setTextColor:v15];

  [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
  [(UILabel *)self->_secondaryLabel setTextAlignment:1];
  [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
  [(UGCPOIEnrichmentHeaderView *)self addSubview:self->_headerImageView];
  [(UGCPOIEnrichmentHeaderView *)self addSubview:self->_titleLabel];
  v16 = self->_secondaryLabel;

  [(UGCPOIEnrichmentHeaderView *)self addSubview:v16];
}

- (void)_setupConstraints
{
  id v3 = [objc_alloc((Class)MUSizeLayout) initWithItem:self->_headerImageView size:40.0, 40.0];
  id v4 = objc_alloc((Class)MUStackLayout);
  v5 = [(UGCPOIEnrichmentHeaderView *)self layoutMarginsGuide];
  id v6 = [v4 initWithContainer:v5 axis:1];

  titleLabel = self->_titleLabel;
  v11[0] = self->_headerImageView;
  v11[1] = titleLabel;
  v11[2] = self->_secondaryLabel;
  v8 = +[NSArray arrayWithObjects:v11 count:3];
  [v6 setArrangedLayoutItems:v8];

  [v6 setAlignment:2 forArrangedLayoutItem:self->_headerImageView];
  [v6 setAlignmentBoundsContent:1 forArrangedLayoutItem:self->_headerImageView];
  [v6 setPadding:4.0 forArrangedLayoutItem:self->_titleLabel];
  v10[0] = v3;
  v10[1] = v6;
  v9 = +[NSArray arrayWithObjects:v10 count:2];
  +[NSLayoutConstraint _mapsui_activateLayouts:v9];
}

- (void)setMapItem:(id)a3
{
  v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    [(UGCPOIEnrichmentHeaderView *)self _refreshContent];
    v5 = v6;
  }
}

- (void)setHideSummaryText:(BOOL)a3
{
  if (self->_hideSummaryText != a3)
  {
    self->_hideSummaryText = a3;
    [(UGCPOIEnrichmentHeaderView *)self _refreshContent];
  }
}

- (void)_refreshContent
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    id v4 = [(MKMapItem *)mapItem name];
    [(UILabel *)self->_titleLabel setText:v4];

    if (self->_hideSummaryText)
    {
      [(UILabel *)self->_secondaryLabel setText:0];
    }
    else
    {
      v5 = [(MKMapItem *)self->_mapItem _shortAddress];
      [(UILabel *)self->_secondaryLabel setText:v5];
    }
    [(UGCPOIEnrichmentHeaderView *)self _updateIcon];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UGCPOIEnrichmentHeaderView;
  [(UGCPOIEnrichmentHeaderView *)&v4 layoutSubviews];
  [(UIImageView *)self->_headerImageView setClipsToBounds:1];
  [(UIImageView *)self->_headerImageView bounds];
  [(UIImageView *)self->_headerImageView _setCornerRadius:v3 * 0.5];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UGCPOIEnrichmentHeaderView;
  id v4 = a3;
  [(UGCPOIEnrichmentHeaderView *)&v10 traitCollectionDidChange:v4];
  v5 = [(UGCPOIEnrichmentHeaderView *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (v7 != v9) {
    [(UGCPOIEnrichmentHeaderView *)self _refreshContent];
  }
}

- (void)_updateIcon
{
  double v3 = [(UGCPOIEnrichmentHeaderView *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  double v6 = [(MKMapItem *)self->_mapItem _geoMapItem];
  [v6 _bestAvatarBrandIconURLForSize:1 allowSmaller:v5 * 40.0];
  obj = (NSURL *)objc_claimAutoreleasedReturnValue();

  p_brandIconURL = &self->_brandIconURL;
  double v8 = obj;
  if (obj != self->_brandIconURL)
  {
    if ((-[NSURL isEqual:](obj, "isEqual:") & 1) == 0)
    {
      [(UGCPOIEnrichmentHeaderView *)self _cancelBrandIconDownload];
      objc_storeStrong((id *)p_brandIconURL, obj);
      [(UGCPOIEnrichmentHeaderView *)self _startBrandIconDownload];
    }
    double v8 = *p_brandIconURL;
  }
  if (!v8) {
    [(UGCPOIEnrichmentHeaderView *)self _setBrandIcon:0 fallbackToMapItemIcon:1];
  }
}

- (void)_cancelBrandIconDownload
{
  if (self->_brandIconURL && self->_isDownloadingBrandIcon)
  {
    self->_isDownloadingBrandIcon = 0;
    id v3 = +[MKAppImageManager sharedImageManager];
    [v3 cancelLoadAppImageAtURL:self->_brandIconURL];
  }
}

- (void)_startBrandIconDownload
{
  if (self->_brandIconURL)
  {
    if (!self->_isDownloadingBrandIcon)
    {
      objc_initWeak(&location, self);
      id v3 = self->_brandIconURL;
      self->_isDownloadingBrandIcon = 1;
      [(UGCPOIEnrichmentHeaderView *)self _setBrandIcon:0 fallbackToMapItemIcon:0];
      double v4 = +[MKAppImageManager sharedImageManager];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100B7F75C;
      v6[3] = &unk_101319FB0;
      objc_copyWeak(&v8, &location);
      double v5 = v3;
      double v7 = v5;
      [v4 loadAppImageAtURL:v5 completionHandler:v6];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setBrandIcon:(id)a3 fallbackToMapItemIcon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v10 = v6;
  if (v6)
  {
    id v7 = v6;
  }
  else if (v4)
  {
    mapItem = self->_mapItem;
    double v9 = [(UGCPOIEnrichmentHeaderView *)self traitCollection];
    [v9 displayScale];
    +[MKIconManager imageForMapItem:forScale:fallbackToBundleIcon:](MKIconManager, "imageForMapItem:forScale:fallbackToBundleIcon:", mapItem, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  [(UIImageView *)self->_headerImageView setImage:v7];
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)hideSummaryText
{
  return self->_hideSummaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_brandIconURL, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_headerImageView, 0);
}

@end