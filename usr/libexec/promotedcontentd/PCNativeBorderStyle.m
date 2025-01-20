@interface PCNativeBorderStyle
- (id)initWithBorderStyle:(id)a3;
@end

@implementation PCNativeBorderStyle

- (id)initWithBorderStyle:(id)a3
{
  id v4 = a3;
  v5 = [(PCNativeBorderStyle *)self init];
  v6 = v5;
  if (v4 && v5)
  {
    id v7 = objc_alloc((Class)PCNativeColor);
    v8 = [v4 color];
    id v9 = [v7 initWithColor:v8];
    [(PCNativeBorderStyle *)v6 setColor:v9];

    [v4 width];
    [(PCNativeBorderStyle *)v6 setWidth:v10];
    [v4 cornerRadius];
    [(PCNativeBorderStyle *)v6 setCornerRadius:v11];
  }

  return v6;
}

@end