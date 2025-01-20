@interface MapsBannerContent
- (MapsBannerContent)initWithHeaderView:(id)a3 iconView:(id)a4 leadingTopView:(id)a5 trailingTopView:(id)a6 bottomView:(id)a7 footerView:(id)a8;
- (NSArray)allViews;
- (NSObject)visibilityFingerprint;
- (UIView)bottomView;
- (UIView)footerView;
- (UIView)headerView;
- (UIView)iconView;
- (UIView)leadingTopView;
- (UIView)trailingTopView;
@end

@implementation MapsBannerContent

- (MapsBannerContent)initWithHeaderView:(id)a3 iconView:(id)a4 leadingTopView:(id)a5 trailingTopView:(id)a6 bottomView:(id)a7 footerView:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MapsBannerContent;
  v18 = [(MapsBannerContent *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_headerView, a3);
    objc_storeStrong((id *)&v19->_iconView, a4);
    objc_storeStrong((id *)&v19->_leadingTopView, a5);
    objc_storeStrong((id *)&v19->_trailingTopView, a6);
    objc_storeStrong((id *)&v19->_bottomView, a7);
    objc_storeStrong((id *)&v19->_footerView, a8);
  }

  return v19;
}

- (NSArray)allViews
{
  v3 = +[NSMutableArray array];
  v4 = v3;
  if (self->_headerView) {
    [v3 addObject:];
  }
  if (self->_iconView) {
    [v4 addObject:];
  }
  [v4 addObject:self->_leadingTopView];
  if (self->_trailingTopView) {
    [v4 addObject:];
  }
  if (self->_bottomView) {
    [v4 addObject:];
  }
  if (self->_footerView) {
    [v4 addObject:];
  }
  id v5 = [v4 copy];

  return (NSArray *)v5;
}

- (NSObject)visibilityFingerprint
{
  v3 = +[NSNumber numberWithBool:[(UIView *)self->_headerView isHidden]];
  v11[0] = v3;
  v4 = +[NSNumber numberWithBool:[(UIView *)self->_iconView isHidden]];
  v11[1] = v4;
  id v5 = +[NSNumber numberWithBool:[(UIView *)self->_leadingTopView isHidden]];
  v11[2] = v5;
  v6 = +[NSNumber numberWithBool:[(UIView *)self->_trailingTopView isHidden]];
  v11[3] = v6;
  v7 = +[NSNumber numberWithBool:[(UIView *)self->_bottomView isHidden]];
  v11[4] = v7;
  v8 = +[NSNumber numberWithBool:[(UIView *)self->_footerView isHidden]];
  v11[5] = v8;
  v9 = +[NSArray arrayWithObjects:v11 count:6];

  return v9;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)iconView
{
  return self->_iconView;
}

- (UIView)leadingTopView
{
  return self->_leadingTopView;
}

- (UIView)trailingTopView
{
  return self->_trailingTopView;
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_trailingTopView, 0);
  objc_storeStrong((id *)&self->_leadingTopView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end