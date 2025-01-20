@interface RCPlaybackSettingSwitchCell
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)isSwitchON;
- (NSString)title;
- (RCPlaybackSettingSwitchCell)initWithFrame:(CGRect)a3;
- (UIColor)imageTint;
- (UIImage)image;
- (id)_cellAccessoriesWithSwitchState:(BOOL)a3;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_didToggleSwitch;
- (void)setImage:(id)a3;
- (void)setImageTint:(id)a3;
- (void)setSwitchState:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation RCPlaybackSettingSwitchCell

- (RCPlaybackSettingSwitchCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RCPlaybackSettingSwitchCell;
  v3 = -[RCPlaybackSettingSwitchCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIListContentConfiguration cellConfiguration];
    [(RCPlaybackSettingSwitchCell *)v3 setContentConfiguration:v4];

    v5 = [(RCPlaybackSettingSwitchCell *)v3 _cellAccessoriesWithSwitchState:0];
    [(RCPlaybackSettingSwitchCell *)v3 setAccessories:v5];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(RCPlaybackSettingSwitchCell *)self contentConfiguration];
  [v5 setText:v4];

  [(RCPlaybackSettingSwitchCell *)self setContentConfiguration:v5];
}

- (NSString)title
{
  v2 = [(RCPlaybackSettingSwitchCell *)self contentConfiguration];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(RCPlaybackSettingSwitchCell *)self contentConfiguration];
  [v5 setImage:v4];

  [(RCPlaybackSettingSwitchCell *)self setContentConfiguration:v5];
}

- (UIImage)image
{
  v2 = [(RCPlaybackSettingSwitchCell *)self contentConfiguration];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImageTint:(id)a3
{
  id v4 = a3;
  id v6 = [(RCPlaybackSettingSwitchCell *)self contentConfiguration];
  id v5 = [v6 imageProperties];
  [v5 setTintColor:v4];

  [(RCPlaybackSettingSwitchCell *)self setContentConfiguration:v6];
}

- (UIColor)imageTint
{
  v2 = [(RCPlaybackSettingSwitchCell *)self contentConfiguration];
  v3 = [v2 imageProperties];
  id v4 = [v3 tintColor];

  return (UIColor *)v4;
}

- (BOOL)isSwitchON
{
  return [(UISwitch *)self->_switch isOn];
}

- (void)setSwitchState:(BOOL)a3
{
  id v4 = [(RCPlaybackSettingSwitchCell *)self _cellAccessoriesWithSwitchState:a3];
  [(RCPlaybackSettingSwitchCell *)self setAccessories:v4];
}

- (id)_cellAccessoriesWithSwitchState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = (UISwitch *)objc_alloc_init((Class)UISwitch);
  objc_super v7 = self->_switch;
  self->_switch = v6;

  [(UISwitch *)self->_switch setOn:v3];
  [(UISwitch *)self->_switch addTarget:self action:"_didToggleSwitch" forControlEvents:64];
  [(UISwitch *)self->_switch setIsAccessibilityElement:0];
  id v8 = [objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:self->_switch placement:1];
  [v8 setDisplayedState:0];
  [v5 addObject:v8];
  id v9 = [v5 copy];

  return v9;
}

- (void)_didToggleSwitch
{
  id v3 = [(RCPlaybackSettingCell *)self cellActionsDelegate];
  [v3 didToggleSwitch:self toState:[self->_switch isOn]];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  return [(UISwitch *)self->_switch accessibilityValue];
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)RCPlaybackSettingSwitchCell;
  unint64_t v3 = [(RCPlaybackSettingSwitchCell *)&v5 accessibilityTraits];
  return (unint64_t)[(UISwitch *)self->_switch accessibilityTraits] | v3;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (void).cxx_destruct
{
}

@end