@interface PCNativeButton
- (id)initWithButton:(id)a3;
@end

@implementation PCNativeButton

- (id)initWithButton:(id)a3
{
  id v4 = a3;
  v5 = [(PCNativeButton *)self init];
  v6 = v5;
  if (v4 && v5)
  {
    -[PCNativeButton setType:](v5, "setType:", (int)[v4 predefined]);
    v7 = [v4 text];
    [(PCNativeButton *)v6 setText:v7];

    v8 = [v4 accessText];
    [(PCNativeButton *)v6 setAccessibleText:v8];

    id v9 = objc_alloc((Class)PCNativeButtonStyle);
    v10 = [v4 buttonStyle];
    id v11 = [v9 initWithButtonStyle:v10];
    [(PCNativeButton *)v6 setStyle:v11];
  }
  return v6;
}

@end