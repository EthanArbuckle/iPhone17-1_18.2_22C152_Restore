@interface UIStatusBarLocationItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (id)_imageName;
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
@end

@implementation UIStatusBarLocationItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  int v5 = (*(unsigned __int8 *)([a3 rawData] + 2529) >> 3) & 3;
  BOOL result = self->_iconType != v5;
  self->_iconType = v5;
  return result;
}

- (id)_imageName
{
  if (self->_iconType == 1) {
    return @"Geofence";
  }
  else {
    return @"Location";
  }
}

- (id)contentsImage
{
  v3 = [(UIStatusBarLocationItemView *)self _imageName];
  v4 = [(UIStatusBarItemView *)self imageWithShadowNamed:v3];

  return v4;
}

- (id)accessibilityHUDRepresentation
{
  v3 = [UIAccessibilityHUDItem alloc];
  v4 = [(UIStatusBarItemView *)self foregroundStyle];
  int v5 = [(UIStatusBarLocationItemView *)self _imageName];
  v6 = [v4 accessibilityHUDImageNamed:v5];
  v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v3, "initWithTitle:image:imageInsets:scaleImage:", 0, v6, 1, 0.0, 0.0, 0.0, 0.0);

  return v7;
}

@end