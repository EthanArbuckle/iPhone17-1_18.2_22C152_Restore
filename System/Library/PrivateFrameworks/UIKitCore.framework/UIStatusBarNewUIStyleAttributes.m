@interface UIStatusBarNewUIStyleAttributes
- (BOOL)isTranslucent;
- (BOOL)isTransparent;
- (BOOL)shouldUseVisualAltitude;
- (Class)foregroundStyleClass;
- (UIStatusBarNewUIStyleAttributes)initWithRequest:(id)a3;
- (UIStatusBarNewUIStyleAttributes)initWithRequest:(id)a3 backgroundColor:(id)a4 foregroundColor:(id)a5;
- (UIStatusBarNewUIStyleAttributes)initWithRequest:(id)a3 backgroundColor:(id)a4 foregroundColor:(id)a5 hasBusyBackground:(BOOL)a6;
- (id)backgroundColorWithTintColor:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)foregroundColor;
- (id)newForegroundStyleWithHeight:(double)a3;
- (int64_t)legibilityStyle;
@end

@implementation UIStatusBarNewUIStyleAttributes

- (UIStatusBarNewUIStyleAttributes)initWithRequest:(id)a3 backgroundColor:(id)a4 foregroundColor:(id)a5 hasBusyBackground:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarNewUIStyleAttributes;
  v13 = [(UIStatusBarStyleAttributes *)&v19 initWithRequest:v10];
  if (v13)
  {
    if (v11
      || ([v10 foregroundColor],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      v14 = (UIColor *)v12;
    }
    else
    {
      v14 = [v10 foregroundColor];
    }
    foregroundColor = v13->_foregroundColor;
    v13->_foregroundColor = v14;
    v17 = v14;

    objc_storeStrong((id *)&v13->_backgroundColor, a4);
    v13->_hasBusyBackground = a6;
  }

  return v13;
}

- (UIStatusBarNewUIStyleAttributes)initWithRequest:(id)a3 backgroundColor:(id)a4 foregroundColor:(id)a5
{
  return [(UIStatusBarNewUIStyleAttributes *)self initWithRequest:a3 backgroundColor:a4 foregroundColor:a5 hasBusyBackground:a4 != 0];
}

- (UIStatusBarNewUIStyleAttributes)initWithRequest:(id)a3
{
  return [(UIStatusBarNewUIStyleAttributes *)self initWithRequest:a3 backgroundColor:0 foregroundColor:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarNewUIStyleAttributes;
  v4 = [(UIStatusBarStyleAttributes *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_backgroundColor);
  objc_storeStrong(v4 + 5, self->_foregroundColor);
  *((unsigned char *)v4 + 48) = self->_hasBusyBackground;
  return v4;
}

- (int64_t)legibilityStyle
{
  if (self->_backgroundColor) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarNewUIStyleAttributes;
  return [(UIStatusBarStyleAttributes *)&v3 legibilityStyle];
}

- (BOOL)isTranslucent
{
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor) {
    return 1;
  }
  [(UIColor *)backgroundColor alphaComponent];
  return v3 < 1.0;
}

- (BOOL)isTransparent
{
  return self->_backgroundColor == 0;
}

- (BOOL)shouldUseVisualAltitude
{
  return 1;
}

- (id)foregroundColor
{
  return self->_foregroundColor;
}

- (id)backgroundColorWithTintColor:(id)a3
{
  return self->_backgroundColor;
}

- (Class)foregroundStyleClass
{
  return (Class)objc_opt_class();
}

- (id)newForegroundStyleWithHeight:(double)a3
{
  id v5 = objc_alloc([(UIStatusBarNewUIStyleAttributes *)self foregroundStyleClass]);
  int64_t v6 = [(UIStatusBarNewUIStyleAttributes *)self legibilityStyle];
  foregroundColor = self->_foregroundColor;
  BOOL hasBusyBackground = self->_hasBusyBackground;
  int64_t v9 = [(UIStatusBarStyleAttributes *)self idiom];
  return (id)[v5 initWithHeight:v6 legibilityStyle:foregroundColor tintColor:hasBusyBackground hasBusyBackground:v9 idiom:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end