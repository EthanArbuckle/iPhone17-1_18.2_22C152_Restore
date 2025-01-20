@interface COSSoftwareUpdateTitleCell
- (COSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 device:(id)a6;
- (COSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 device:(id)a6 image:(id)a7;
- (NRDevice)device;
- (id)gearBackgroundImage;
- (id)newLearnMoreLabel;
- (id)newSoftwareUpdateAnimatedIconWithFrame:(CGRect)a3;
- (void)updateProgressTintColor;
@end

@implementation COSSoftwareUpdateTitleCell

- (COSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 device:(id)a6
{
  objc_storeStrong((id *)&self->_device, a6);
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v16.receiver = self;
  v16.super_class = (Class)COSSoftwareUpdateTitleCell;
  v14 = [(COSSoftwareUpdateTitleCell *)&v16 initWithStyle:a3 reuseIdentifier:v13 specifier:v12];

  return v14;
}

- (COSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 device:(id)a6 image:(id)a7
{
  objc_storeStrong((id *)&self->_device, a6);
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  v19.receiver = self;
  v19.super_class = (Class)COSSoftwareUpdateTitleCell;
  v17 = [(COSSoftwareUpdateTitleCell *)&v19 initWithStyle:a3 reuseIdentifier:v16 specifier:v15 updateIcon:v14 showLearnMore:0 delegate:0];

  return v17;
}

- (id)gearBackgroundImage
{
  v3 = +[PBBridgeWatchAttributeController sharedDeviceController];
  [v3 setDevice:self->_device];

  v4 = 0;
  if (BPSIsDeviceCompatibleWithVersions()) {
    v4 = @"-v8";
  }
  id v5 = [objc_alloc((Class)BPSWatchView) initWithStyle:8 andVersionModifier:v4];
  v6 = [v5 image];

  return v6;
}

- (id)newSoftwareUpdateAnimatedIconWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [COSSoftwareUpdateAnimatedIcon alloc];

  return -[COSSoftwareUpdateAnimatedIcon initWithFrame:](v7, "initWithFrame:", x, y, width, height);
}

- (void)updateProgressTintColor
{
  if ([(COSSoftwareUpdateTitleCell *)self progressDisplayStyle] == 1) {
    BPSProgressBarTintColor();
  }
  else {
    BPSProgressBarStalledTintColor();
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [(COSSoftwareUpdateTitleCell *)self progressBar];
  [v3 setProgressTintColor:v4];
}

- (id)newLearnMoreLabel
{
  return 0;
}

- (NRDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
}

@end