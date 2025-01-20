@interface UICommand
+ (id)_maps_commandWithEnableFeatureTitle:(id)a3 disableFeatureTitle:(id)a4 action:(SEL)a5;
- (void)_maps_setUseDisableFeatureTitle:(BOOL)a3;
@end

@implementation UICommand

+ (id)_maps_commandWithEnableFeatureTitle:(id)a3 disableFeatureTitle:(id)a4 action:(SEL)a5
{
  v13[0] = @"MapsUICommandEnableTitleKey";
  v13[1] = @"MapsUICommandDisableTitleKey";
  v14[0] = a3;
  v14[1] = a4;
  id v8 = a4;
  id v9 = a3;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  v11 = [a1 commandWithTitle:v9 image:0 action:a5 propertyList:v10];

  return v11;
}

- (void)_maps_setUseDisableFeatureTitle:(BOOL)a3
{
  if (a3)
  {
    id v5 = [(UICommand *)self propertyList];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v5 objectForKeyedSubscript:@"MapsUICommandDisableTitleKey"];
      [(UICommand *)self setTitle:v4];
    }
  }
}

@end