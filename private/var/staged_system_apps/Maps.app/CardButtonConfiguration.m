@interface CardButtonConfiguration
+ (CardButtonConfiguration)addRoute;
+ (CardButtonConfiguration)close;
+ (CardButtonConfiguration)customRouteCloseLoop;
+ (CardButtonConfiguration)customRouteOutAndBack;
+ (CardButtonConfiguration)customRouteReverse;
+ (CardButtonConfiguration)edit;
+ (CardButtonConfiguration)ttr;
+ (id)withType:(unint64_t)a3;
- (BOOL)blurred;
- (CardButtonConfiguration)init;
- (NSString)systemImageName;
- (NSString)toolTip;
- (UIColor)hoverBackgroundColor;
- (UIColor)tintColor;
- (UIEdgeInsets)insets;
- (id)withBlurred:(BOOL)a3;
- (id)withInsets:(UIEdgeInsets)a3;
- (id)withSystemImageNamed:(id)a3;
- (id)withTintColor:(id)a3;
- (id)withToolTip:(id)a3;
- (id)withType:(unint64_t)a3;
- (unint64_t)type;
- (void)setBlurred:(BOOL)a3;
- (void)setHoverBackgroundColor:(id)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setSystemImageName:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setToolTip:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation CardButtonConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_toolTip, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);

  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)toolTip
{
  return self->_toolTip;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CardButtonConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)CardButtonConfiguration;
  UIEdgeInsets result = [(CardButtonConfiguration *)&v4 init];
  if (result)
  {
    CGFloat v3 = *(double *)&qword_1015F3528;
    *(void *)&result->_insets.double top = qword_1015F3528;
    result->_insets.double left = v3;
    result->_insets.double bottom = v3;
    result->_insets.double right = v3;
  }
  return result;
}

- (UIColor)hoverBackgroundColor
{
  return self->_hoverBackgroundColor;
}

- (BOOL)blurred
{
  return self->_blurred;
}

+ (id)withType:(unint64_t)a3
{
  objc_super v4 = objc_opt_new();
  [v4 setType:a3];

  return v4;
}

+ (CardButtonConfiguration)close
{
  return (CardButtonConfiguration *)_[a1 withType:0];
}

+ (CardButtonConfiguration)edit
{
  return (CardButtonConfiguration *)_[a1 withType:4];
}

+ (CardButtonConfiguration)addRoute
{
  return (CardButtonConfiguration *)_[a1 withType:7];
}

+ (CardButtonConfiguration)ttr
{
  return (CardButtonConfiguration *)_[a1 withType:8];
}

+ (CardButtonConfiguration)customRouteReverse
{
  return (CardButtonConfiguration *)_[a1 withType:9];
}

+ (CardButtonConfiguration)customRouteOutAndBack
{
  return (CardButtonConfiguration *)_[a1 withType:11];
}

+ (CardButtonConfiguration)customRouteCloseLoop
{
  return (CardButtonConfiguration *)_[a1 withType:10];
}

- (id)withType:(unint64_t)a3
{
  return self;
}

- (id)withBlurred:(BOOL)a3
{
  return self;
}

- (id)withTintColor:(id)a3
{
  return self;
}

- (id)withInsets:(UIEdgeInsets)a3
{
  return self;
}

- (id)withSystemImageNamed:(id)a3
{
  id v4 = [a3 copy];
  [(CardButtonConfiguration *)self setSystemImageName:v4];

  return self;
}

- (id)withToolTip:(id)a3
{
  id v4 = [a3 copy];
  [(CardButtonConfiguration *)self setToolTip:v4];

  return self;
}

- (void)setBlurred:(BOOL)a3
{
  self->_blurred = a3;
}

- (void)setTintColor:(id)a3
{
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (void)setSystemImageName:(id)a3
{
}

- (void)setToolTip:(id)a3
{
}

- (void)setHoverBackgroundColor:(id)a3
{
}

@end