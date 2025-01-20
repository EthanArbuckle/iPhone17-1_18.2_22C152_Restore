@interface RAPUserInfoSection
- (RAPUserInfoSection)init;
- (id)cellForRowAtIndex:(int64_t)a3;
- (id)footerView;
- (int64_t)rowsCount;
- (void)_footerViewTapped;
@end

@implementation RAPUserInfoSection

- (RAPUserInfoSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)RAPUserInfoSection;
  v2 = [(RAPTablePartSection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[GEOUserAccountInfo primaryICloudAccount];
    account = v2->_account;
    v2->_account = (ACAccount *)v3;
  }
  return v2;
}

- (int64_t)rowsCount
{
  return self->_account != 0;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    v5 = [[RAPDisplayUserContentTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"RAPUserInfoCell"];
    objc_super v6 = self->_cell;
    self->_cell = v5;

    cell = self->_cell;
  }

  return cell;
}

- (id)footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = +[TableViewFooterOptions defaultRAPUserContentOptions];
    v5 = [[TableViewSelectableFooterView alloc] initWithReuseIdentifier:@"RAPUserInfoFooterView" options:v4];
    objc_super v6 = self->_footerView;
    self->_footerView = v5;

    [(TableViewSelectableFooterView *)self->_footerView setTarget:self action:"_footerViewTapped"];
    footerView = self->_footerView;
  }

  return footerView;
}

- (void)_footerViewTapped
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.mapsrap"];
  uint64_t v3 = [(RAPTablePartSection *)self presentingViewController];
  [v4 setPresentingViewController:v3];

  [v4 present];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_cell, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end