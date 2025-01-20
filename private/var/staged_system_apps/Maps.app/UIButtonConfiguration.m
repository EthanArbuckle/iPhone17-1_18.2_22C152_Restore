@interface UIButtonConfiguration
+ (id)_maps_cardFooterActionButtonConfigurationWithBaseConfiguration:(id)a3;
+ (id)_maps_cardFooterActionButtonConfigurationWithBaseConfiguration:(id)a3 isSecondary:(BOOL)a4;
+ (id)_maps_pillButtonConfigurationWithImage:(BOOL)a3;
+ (id)_maps_pillButtonConfigurationWithImage:(BOOL)a3 scalingImageForDynamicText:(BOOL)a4 scalingTitleForDynamicText:(BOOL)a5;
+ (id)_maps_primaryCardFooterActionButtonConfiguration;
+ (id)_maps_roundPillSymbolButtonConfigurationScalingImageForDynamicText:(BOOL)a3;
+ (id)_maps_secondaryCardFooterActionButtonConfiguration;
@end

@implementation UIButtonConfiguration

+ (id)_maps_primaryCardFooterActionButtonConfiguration
{
  v3 = +[UIButtonConfiguration filledButtonConfiguration];
  v4 = [a1 _maps_cardFooterActionButtonConfigurationWithBaseConfiguration:v3];

  return v4;
}

+ (id)_maps_secondaryCardFooterActionButtonConfiguration
{
  v3 = +[UIButtonConfiguration grayButtonConfiguration];
  v4 = [a1 _maps_cardFooterActionButtonConfigurationWithBaseConfiguration:v3 isSecondary:1];

  return v4;
}

+ (id)_maps_cardFooterActionButtonConfigurationWithBaseConfiguration:(id)a3
{
  return [a1 _maps_cardFooterActionButtonConfigurationWithBaseConfiguration:a3 isSecondary:0];
}

+ (id)_maps_cardFooterActionButtonConfigurationWithBaseConfiguration:(id)a3 isSecondary:(BOOL)a4
{
  id v4 = a3;
  v5 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle3 weight:UIFontWeightBold];
  v6 = +[UIFont _maps_cappedFont:v5 withMaxPoint:34.0];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1006DAFBC;
  v15[3] = &unk_1012E90F0;
  id v16 = v6;
  id v7 = v6;
  [v4 setTitleTextAttributesTransformer:v15];
  [v4 setImagePadding:4.0];
  v8 = [v4 background];
  [v8 setCornerRadius:12.0];

  [v4 setCornerStyle:-1];
  double leading = NSDirectionalEdgeInsetsZero.leading;
  double bottom = NSDirectionalEdgeInsetsZero.bottom;
  double trailing = NSDirectionalEdgeInsetsZero.trailing;
  v12 = [v4 background];
  [v12 setBackgroundInsets:NSDirectionalEdgeInsetsZero.top, leading, bottom, trailing];

  [v4 setContentInsets:12.0, 10.0, 12.0, 10.0];
  [v4 setTitleAlignment:1];
  v13 = +[UIImageSymbolConfiguration configurationWithFont:v7];
  [v4 setPreferredSymbolConfigurationForImage:v13];

  [v4 setTitleLineBreakMode:4];

  return v4;
}

+ (id)_maps_pillButtonConfigurationWithImage:(BOOL)a3
{
  return [a1 _maps_pillButtonConfigurationWithImage:a3 scalingImageForDynamicText:1 scalingTitleForDynamicText:1];
}

+ (id)_maps_pillButtonConfigurationWithImage:(BOOL)a3 scalingImageForDynamicText:(BOOL)a4 scalingTitleForDynamicText:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v8 = +[UIButtonConfiguration grayButtonConfiguration];
  [v8 setCornerStyle:4];
  double v9 = 8.0;
  if (!v7) {
    double v9 = 10.0;
  }
  [v8 setContentInsets:4.0, v9, 4.0, 10.0];
  v10 = +[UIColor secondarySystemFillColor];
  [v8 setBaseBackgroundColor:v10];

  [v8 setImagePadding:4.0];
  if (v6) {
    +[UIFont _maps_fontWithTextStyle:UIFontTextStyleSubheadline weight:0 compatibleWithTraitCollection:UIFontWeightSemibold];
  }
  else {
  v11 = +[UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
  }
  v12 = +[UIImageSymbolConfiguration configurationWithFont:v11 scale:2];
  [v8 setPreferredSymbolConfigurationForImage:v12];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1006DB1C0;
  v14[3] = &unk_1012F5500;
  BOOL v15 = a5;
  [v8 setTitleTextAttributesTransformer:v14];

  return v8;
}

+ (id)_maps_roundPillSymbolButtonConfigurationScalingImageForDynamicText:(BOOL)a3
{
  v3 = [a1 _maps_pillButtonConfigurationWithImage:1 scalingImageForDynamicText:a3 scalingTitleForDynamicText:0];
  [v3 contentInsets];
  double v5 = v4;
  [v3 contentInsets];
  double v7 = v6;
  [v3 contentInsets];
  double v9 = v8;
  [v3 contentInsets];
  [v3 setContentInsets:v5, v7, v9, v10];
  [v3 contentInsets];
  double v12 = 32.0 - v11;
  [v3 contentInsets];
  [v3 setImageReservation:v12 - v13];

  return v3;
}

@end