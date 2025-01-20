@interface PCNativeStyle
- (id)initWithStyle:(id)a3;
@end

@implementation PCNativeStyle

- (id)initWithStyle:(id)a3
{
  id v4 = a3;
  v5 = [(PCNativeStyle *)self init];
  v6 = v5;
  if (v4 && v5)
  {
    id v7 = objc_alloc((Class)PCNativeColor);
    v8 = [v4 backgroundColor];
    id v9 = [v7 initWithColor:v8];
    [(PCNativeStyle *)v6 setBackgroundColor:v9];

    id v10 = objc_alloc((Class)PCNativeBorderStyle);
    v11 = [v4 borderStyle];
    id v12 = [v10 initWithBorderStyle:v11];
    [(PCNativeStyle *)v6 setBorderStyle:v12];

    id v13 = objc_alloc((Class)PCNativeButtonStyle);
    v14 = [v4 buttonStyle];
    id v15 = [v13 initWithButtonStyle:v14];
    [(PCNativeStyle *)v6 setButtonStyle:v15];

    id v16 = objc_alloc((Class)PCNativeShadowStyle);
    v17 = [v4 shadowStyle];
    id v18 = [v16 initWithShadowStyle:v17];
    [(PCNativeStyle *)v6 setShadowStyle:v18];

    id v19 = objc_alloc((Class)PCNativeColor);
    v20 = [v4 textColor];
    id v21 = [v19 initWithColor:v20];
    [(PCNativeStyle *)v6 setTextColor:v21];
  }
  return v6;
}

@end