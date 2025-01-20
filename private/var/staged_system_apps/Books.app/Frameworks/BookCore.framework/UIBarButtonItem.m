@interface UIBarButtonItem
+ (id)bc_readingExperienceBarItem:(id)a3 target:(id)a4 action:(SEL)a5;
@end

@implementation UIBarButtonItem

+ (id)bc_readingExperienceBarItem:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v7 = a4;
  v8 = +[UIImage systemImageNamed:a3];
  v9 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:17.0];
  v10 = [v8 imageWithConfiguration:v9];

  v11 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:2 scale:17.0];
  v12 = [v8 imageWithConfiguration:v11];

  id v13 = [objc_alloc((Class)objc_opt_class()) initWithImage:v10 landscapeImagePhone:v12 style:0 target:v7 action:a5];

  return v13;
}

@end