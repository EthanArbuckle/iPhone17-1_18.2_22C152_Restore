@interface COSSOSTriggerAnimationCell
+ (double)preferredCellHeight;
- (BOOL)isCrownOrientationOnRightSide;
- (BOOL)isLayoutLeftToRight;
- (COSSOSTriggerAnimationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIView)triggerImageView;
- (void)loadTriggerImageView;
- (void)setTriggerImageView:(id)a3;
- (void)setupConstraints;
@end

@implementation COSSOSTriggerAnimationCell

- (COSSOSTriggerAnimationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)COSSOSTriggerAnimationCell;
  v5 = [(COSSOSTriggerAnimationCell *)&v8 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5) {
    [(COSSOSTriggerAnimationCell *)v5 loadTriggerImageView];
  }
  return v6;
}

+ (double)preferredCellHeight
{
  return 160.0;
}

- (BOOL)isCrownOrientationOnRightSide
{
  v2 = BPSGetActiveSetupCompletedDevice();
  v3 = [v2 valueForProperty:NRDevicePropertyPairingID];
  v4 = [v2 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  id v5 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano" pairingID:v3 pairingDataStore:v4];
  char v6 = [v5 BOOLForKey:@"invertUI"] ^ 1;

  return v6;
}

- (BOOL)isLayoutLeftToRight
{
  v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == 0;

  return v3;
}

- (void)loadTriggerImageView
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  BOOL v3 = (void *)qword_10029AE80;
  uint64_t v15 = qword_10029AE80;
  if (!qword_10029AE80)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100017700;
    v11[3] = &unk_1002436A8;
    v11[4] = &v12;
    sub_100017700((uint64_t)v11);
    BOOL v3 = (void *)v13[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v12, 8);
  BOOL v5 = [(COSSOSTriggerAnimationCell *)self isCrownOrientationOnRightSide];
  BOOL v6 = [(COSSOSTriggerAnimationCell *)self isLayoutLeftToRight];
  v7 = BPSBridgeTintColor();
  objc_super v8 = [v4 getAssetViewForWatchWithCrownOrientationOnRightSide:v5 layoutLeftToRight:v6 tintColor:v7];
  triggerImageView = self->_triggerImageView;
  self->_triggerImageView = v8;

  [(UIView *)self->_triggerImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(COSSOSTriggerAnimationCell *)self contentView];
  [v10 addSubview:self->_triggerImageView];

  [(COSSOSTriggerAnimationCell *)self setupConstraints];
}

- (void)setupConstraints
{
  triggerImageView = self->_triggerImageView;
  if (triggerImageView)
  {
    v23 = [(UIView *)triggerImageView centerYAnchor];
    v24 = [(COSSOSTriggerAnimationCell *)self contentView];
    v22 = [v24 centerYAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v25[0] = v21;
    v20 = [(UIView *)self->_triggerImageView centerXAnchor];
    id v4 = [(COSSOSTriggerAnimationCell *)self contentView];
    BOOL v5 = [v4 centerXAnchor];
    BOOL v6 = [v20 constraintEqualToAnchor:v5];
    v25[1] = v6;
    v7 = [(UIView *)self->_triggerImageView heightAnchor];
    [(UIView *)self->_triggerImageView frame];
    double v9 = v8;
    v10 = +[UIScreen mainScreen];
    [v10 scale];
    uint64_t v12 = [v7 constraintEqualToConstant:v9 * v11];
    v25[2] = v12;
    v13 = [(UIView *)self->_triggerImageView widthAnchor];
    [(UIView *)self->_triggerImageView frame];
    double v15 = v14;
    v16 = +[UIScreen mainScreen];
    [v16 scale];
    v18 = [v13 constraintEqualToConstant:v15 * v17];
    v25[3] = v18;
    v19 = +[NSArray arrayWithObjects:v25 count:4];
    +[NSLayoutConstraint activateConstraints:v19];
  }
}

- (UIView)triggerImageView
{
  return self->_triggerImageView;
}

- (void)setTriggerImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end