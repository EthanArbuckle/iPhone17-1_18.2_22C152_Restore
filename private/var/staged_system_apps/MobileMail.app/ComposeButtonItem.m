@interface ComposeButtonItem
+ (id)composeButtonItemWithTarget:(id)a3;
@end

@implementation ComposeButtonItem

+ (id)composeButtonItemWithTarget:(id)a3
{
  id v4 = a3;
  v5 = +[UIImage systemImageNamed:MFImageGlyphCompose];
  id v6 = [objc_alloc((Class)a1) initWithImage:v5 style:0 target:v4 action:"composeButtonPressed:"];
  [v6 setLongPressTarget:v4 action:"composeButtonLongPressed:"];
  [v6 setSpringLoaded:1];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"COMPOSE_NEW_MESSAGE" value:&stru_100619928 table:@"Main"];
  [v6 setTitle:v8];

  return v6;
}

@end