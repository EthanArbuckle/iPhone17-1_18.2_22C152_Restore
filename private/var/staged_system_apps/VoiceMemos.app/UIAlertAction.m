@interface UIAlertAction
+ (id)recorderMenuActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
@end

@implementation UIAlertAction

+ (id)recorderMenuActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setActionTitle:v9];

  [v10 setActionImage:v8];
  v11 = +[UIAlertAction _actionWithContentViewController:v10 style:0 handler:v7];

  return v11;
}

@end