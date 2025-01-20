@interface NavUserDecisionButtonFactory
+ (id)cancelButton;
+ (id)confirmButton;
@end

@implementation NavUserDecisionButtonFactory

+ (id)cancelButton
{
  v2 = +[BackgroundColorButton buttonWithType:1];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  [v2 setClipsToBounds:1];
  v4 = [v2 layer];
  [v4 setCornerRadius:10.0];

  v5 = [v2 titleLabel];
  [v5 setAdjustsFontSizeToFitWidth:1];

  v6 = [v2 titleLabel];
  [v6 setMinimumScaleFactor:0.5];

  v7 = +[UIFont _maps_boldSystemFontWithFixedSize:22.0];
  v8 = [v2 titleLabel];
  [v8 setFont:v7];

  [v2 setAccessibilityIdentifier:@"CancelButton"];
  v9 = objc_opt_new();
  [v2 setBackgroundImage:v9 forState:0];

  v10 = [v2 theme];
  v11 = [v10 fadedGrayButtonTitleColor:0];
  v12 = [v10 fadedGrayButtonTitleColor:1];
  v13 = [v10 fadedGrayButtonBackgroundColor:0];
  v14 = [v10 fadedGrayButtonBackgroundColor:1];
  [v2 setTitleColor:v11 forState:0];
  [v2 setTitleColor:v12 forState:1];
  [v2 setBackgroundColor:v13 forState:0];
  [v2 setBackgroundColor:v14 forState:1];

  return v2;
}

+ (id)confirmButton
{
  v2 = +[MapsProgressButton buttonWithType:1];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  [v2 setClipsToBounds:1];
  v4 = [v2 layer];
  [v4 setCornerRadius:10.0];

  [v2 setFillStyle:1];
  v5 = [v2 titleLabel];
  [v5 setAdjustsFontSizeToFitWidth:1];

  v6 = [v2 titleLabel];
  [v6 setMinimumScaleFactor:0.5];

  v7 = +[UIFont _maps_boldSystemFontWithFixedSize:22.0];
  v8 = [v2 titleLabel];
  [v8 setFont:v7];

  [v2 setAccessibilityIdentifier:@"ConfirmButton"];
  v9 = +[UIColor whiteColor];
  [v2 setTitleColor:v9 forState:0];

  v10 = [v2 theme];
  v11 = [v10 blueButtonTitleColor:0];
  v12 = [v10 blueButtonTitleColor:1];
  v13 = [v10 blueButtonBackgroundColor:0];
  v14 = [v10 blueButtonBackgroundColor:1];
  [v2 setTitleColor:v11 forState:0];
  [v2 setTitleColor:v12 forState:1];
  [v2 setBackgroundColor:v13 forState:0];
  [v2 setBackgroundColor:v14 forState:1];

  return v2;
}

@end