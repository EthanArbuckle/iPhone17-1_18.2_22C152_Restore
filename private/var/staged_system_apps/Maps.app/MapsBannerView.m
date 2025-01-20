@interface MapsBannerView
- (BNBannerSource)target;
- (BOOL)aperturePresentation;
- (BannerItem)item;
- (MapsBannerContentView)contentView;
- (MapsBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5;
- (double)bannerAccessoryViewLeadingInset;
- (double)bannerAccessoryViewTrailingInset;
@end

@implementation MapsBannerView

- (MapsBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)MapsBannerView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v13 = -[MapsBannerView initWithFrame:](&v38, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v13)
  {
    id v36 = v9;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [(MapsBannerView *)v13 setAccessibilityIdentifier:v15];

    id v37 = v8;
    objc_storeWeak((id *)&v13->_target, v8);
    objc_storeStrong((id *)&v13->_item, a4);
    v13->_aperturePresentation = v5;
    v16 = -[MapsBannerContentView initWithFrame:]([MapsBannerContentView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    contentView = v13->_contentView;
    v13->_contentView = v16;

    [(MapsBannerContentView *)v13->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsBannerView *)v13 addSubview:v13->_contentView];
    v34 = [(MapsBannerContentView *)v13->_contentView leadingAnchor];
    v18 = [(MapsBannerView *)v13 leadingAnchor];
    v19 = [v34 constraintEqualToAnchor:v18 constant:20.0];
    v41[0] = v19;
    v20 = [(MapsBannerView *)v13 trailingAnchor];
    v21 = [(MapsBannerContentView *)v13->_contentView trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:20.0];
    v41[1] = v22;
    v23 = [(MapsBannerView *)v13 bottomAnchor];
    [(MapsBannerContentView *)v13->_contentView bottomAnchor];
    v24 = BOOL v33 = v5;
    v25 = [v23 constraintEqualToAnchor:v24 constant:17.0];
    v41[2] = v25;
    v35 = +[NSArray arrayWithObjects:v41 count:3];

    v26 = [(MapsBannerContentView *)v13->_contentView topAnchor];
    if (v33)
    {
      v27 = [(MapsBannerView *)v13 SBUISA_systemApertureObstructedAreaLayoutGuide];
      v28 = [v27 bottomAnchor];
      v29 = [v26 constraintEqualToAnchor:v28];
      v40 = v29;
      v30 = +[NSArray arrayWithObjects:&v40 count:1];
      v31 = [v35 arrayByAddingObjectsFromArray:v30];
    }
    else
    {
      v27 = [(MapsBannerView *)v13 topAnchor];
      v28 = [v26 constraintEqualToAnchor:v27 constant:22.0];
      v39 = v28;
      v29 = +[NSArray arrayWithObjects:&v39 count:1];
      v30 = v35;
      v31 = [v35 arrayByAddingObjectsFromArray:v29];
    }

    +[NSLayoutConstraint activateConstraints:v31];
    id v9 = v36;
    id v8 = v37;
  }

  return v13;
}

- (double)bannerAccessoryViewLeadingInset
{
  if (qword_101610930 != -1) {
    dispatch_once(&qword_101610930, &stru_10131A138);
  }
  return *(double *)&qword_101610928;
}

- (double)bannerAccessoryViewTrailingInset
{
  if (qword_101610940 != -1) {
    dispatch_once(&qword_101610940, &stru_10131A158);
  }
  return *(double *)&qword_101610938;
}

- (BNBannerSource)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (BNBannerSource *)WeakRetained;
}

- (BannerItem)item
{
  return self->_item;
}

- (BOOL)aperturePresentation
{
  return self->_aperturePresentation;
}

- (MapsBannerContentView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_item, 0);

  objc_destroyWeak((id *)&self->_target);
}

@end