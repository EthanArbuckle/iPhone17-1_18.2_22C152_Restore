@interface PHContactsTableViewCell
- (PHContactsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TUFeatureFlags)featureFlags;
- (void)setFeatureFlags:(id)a3;
- (void)setUpBlurredBackground;
@end

@implementation PHContactsTableViewCell

- (PHContactsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PHContactsTableViewCell;
  v4 = [(PHTableViewCell *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(PHContactsTableViewCell *)v4 setUpBlurredBackground];
  return v4;
}

- (TUFeatureFlags)featureFlags
{
  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }

  return featureFlags;
}

- (void)setUpBlurredBackground
{
  v3 = [(PHContactsTableViewCell *)self featureFlags];
  unsigned int v4 = [v3 unknownInitiatorReportEnabled];

  if (v4)
  {
    id v8 = +[UIBackgroundConfiguration listCellConfiguration];
    v5 = +[UIColor whiteColor];
    [v8 setBackgroundColor:v5];

    objc_super v6 = +[UIBlurEffect effectWithStyle:1200];
    v7 = +[UIVibrancyEffect effectForBlurEffect:v6 style:6];
    [v8 setVisualEffect:v7];

    [(PHContactsTableViewCell *)self setBackgroundConfiguration:v8];
  }
}

- (void)setFeatureFlags:(id)a3
{
}

- (void).cxx_destruct
{
}

@end