@interface UIKeyCommand
+ (id)_maps_commandWithEnableFeatureTitle:(id)a3 disableFeatureTitle:(id)a4 action:(SEL)a5 input:(id)a6 modifierFlags:(int64_t)a7;
- (NSIndexPath)cell_IndexPath;
@end

@implementation UIKeyCommand

+ (id)_maps_commandWithEnableFeatureTitle:(id)a3 disableFeatureTitle:(id)a4 action:(SEL)a5 input:(id)a6 modifierFlags:(int64_t)a7
{
  v18[0] = @"MapsUICommandEnableTitleKey";
  v18[1] = @"MapsUICommandDisableTitleKey";
  v19[0] = a3;
  v19[1] = a4;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  v16 = [a1 commandWithTitle:v14 image:0 action:a5 input:v12 modifierFlags:a7 propertyList:v15];

  return v16;
}

- (NSIndexPath)cell_IndexPath
{
  v3 = [(UIKeyCommand *)self propertyList];
  v4 = [v3 objectForKeyedSubscript:@"row"];

  v5 = [(UIKeyCommand *)self propertyList];
  v6 = [v5 objectForKeyedSubscript:@"section"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = v6;
    id v8 = [v4 integerValue];
    id v9 = [v7 integerValue];

    v10 = +[NSIndexPath indexPathForRow:v8 inSection:v9];
  }
  else
  {
    v10 = 0;
  }

  return (NSIndexPath *)v10;
}

@end