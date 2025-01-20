@interface PCNativeButtonStyle
- (id)initWithButtonStyle:(id)a3;
@end

@implementation PCNativeButtonStyle

- (id)initWithButtonStyle:(id)a3
{
  id v4 = a3;
  v5 = [(PCNativeButtonStyle *)self init];
  v6 = v5;
  if (v4 && v5)
  {
    id v7 = objc_alloc((Class)PCNativeColor);
    v8 = [v4 color];
    id v9 = [v7 initWithColor:v8];
    [(PCNativeButtonStyle *)v6 setColor:v9];

    id v10 = objc_alloc((Class)PCNativeColor);
    v11 = [v4 highlightedColor];
    id v12 = [v10 initWithColor:v11];
    [(PCNativeButtonStyle *)v6 setHighlightColor:v12];

    id v13 = objc_alloc((Class)PCNativeColor);
    v14 = [v4 disabledColor];
    id v15 = [v13 initWithColor:v14];
    [(PCNativeButtonStyle *)v6 setDisabledColor:v15];

    id v16 = objc_alloc((Class)PCNativeColor);
    v17 = [v4 textColor];
    id v18 = [v16 initWithColor:v17];
    [(PCNativeButtonStyle *)v6 setTextColor:v18];

    [v4 cornerRadius];
    [(PCNativeButtonStyle *)v6 setCornerRadius:v19];
    id v20 = objc_alloc((Class)PCNativeBorderStyle);
    v21 = [v4 borderStyle];
    id v22 = [v20 initWithBorderStyle:v21];
    [(PCNativeButtonStyle *)v6 setBorderStyle:v22];
  }
  return v6;
}

@end