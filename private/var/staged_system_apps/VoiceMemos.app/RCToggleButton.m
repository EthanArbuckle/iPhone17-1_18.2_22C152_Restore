@interface RCToggleButton
+ (id)_toggleButtonWithDefaultImage:(id)a3 toggleImage:(id)a4;
+ (id)playbackSettingsButton;
+ (id)transcriptionButton;
- (BOOL)isToggled;
- (RCToggleButton)initWithFrame:(CGRect)a3;
- (UIImage)defaultImage;
- (UIImage)toggleImage;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (unint64_t)accessibilityTraits;
- (void)restyle;
- (void)setDefaultImage:(id)a3;
- (void)setImageSymbolConfiguration:(id)a3;
- (void)setIsToggled:(BOOL)a3;
- (void)setToggleImage:(id)a3;
@end

@implementation RCToggleButton

- (void)setImageSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);

  [(RCToggleButton *)self restyle];
}

+ (id)playbackSettingsButton
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  v3 = [v2 playbackSettingsImage];

  v4 = +[RCToggleButton _toggleButtonWithDefaultImage:v3 toggleImage:v3];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"PLAYBACK_SETTINGS" value:&stru_100228BC8 table:0];

  [v4 setAccessibilityLabel:v6];
  [v4 setLargeContentTitle:v6];
  [v4 setAccessibilityIdentifier:@"Playback Settings button"];

  return v4;
}

+ (id)_toggleButtonWithDefaultImage:(id)a3 toggleImage:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[RCToggleButton buttonWithType:1];
  [v7 setDefaultImage:v6];

  [v7 setToggleImage:v5];

  return v7;
}

- (void)setToggleImage:(id)a3
{
}

- (void)setDefaultImage:(id)a3
{
}

+ (id)transcriptionButton
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  v3 = [v2 transcriptionImage];

  v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v5 = [v4 transcriptionToggleImage];

  id v6 = +[RCToggleButton _toggleButtonWithDefaultImage:v3 toggleImage:v5];
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"TRANSCRIPTION" value:&stru_100228BC8 table:0];

  [v6 setAccessibilityLabel:v8];
  [v6 setLargeContentTitle:v8];
  [v6 setAccessibilityIdentifier:@"Transcription button"];

  return v6;
}

- (RCToggleButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RCToggleButton;
  v3 = -[RCPointerInteractionButton initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003002C;
    v5[3] = &unk_100222C70;
    objc_copyWeak(&v6, &location);
    [(RCToggleButton *)v3 setConfigurationUpdateHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)restyle
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100031BD0;
  v2[3] = &unk_100221278;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (BOOL)isToggled
{
  return self->_isToggled;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (UIImage)defaultImage
{
  return self->_defaultImage;
}

- (void)setIsToggled:(BOOL)a3
{
  self->_isToggled = a3;
  [(RCToggleButton *)self restyle];
}

- (unint64_t)accessibilityTraits
{
  if ([(RCToggleButton *)self isToggled])
  {
    v5.receiver = self;
    v5.super_class = (Class)RCToggleButton;
    return UIAccessibilityTraitSelected | [(RCToggleButton *)&v5 accessibilityTraits];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)RCToggleButton;
    return [(RCToggleButton *)&v4 accessibilityTraits];
  }
}

- (UIImage)toggleImage
{
  return self->_toggleImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleImage, 0);
  objc_storeStrong((id *)&self->_defaultImage, 0);

  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
}

@end