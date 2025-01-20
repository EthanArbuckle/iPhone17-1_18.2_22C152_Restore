@interface ActionValidationController
+ (void)presentAttributedString:(id)a3 inWindow:(id)a4;
+ (void)presentCollectionSavedValidationActionWithName:(id)a3 inWindow:(id)a4;
+ (void)presentDefaultValidationActionWithTitle:(id)a3 inWindow:(id)a4;
+ (void)presentString:(id)a3 withFont:(id)a4 inWindow:(id)a5;
@end

@implementation ActionValidationController

+ (void)presentAttributedString:(id)a3 inWindow:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = a3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 keyboardHeight];
      double v8 = v7 * -0.5;
    }
    else
    {
      double v8 = -0.0;
    }
    v9 = [[MessageView alloc] initWithTitle:v6];

    [(MessageView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v9];
    v10 = [(MessageView *)v9 offsetConstraint];
    [v10 setConstant:v8];

    v25 = [(MessageView *)v9 topAnchor];
    v24 = [v5 topAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v28[0] = v23;
    v22 = [(MessageView *)v9 bottomAnchor];
    v21 = [v5 bottomAnchor];
    v11 = [v22 constraintEqualToAnchor:v21];
    v28[1] = v11;
    v12 = [(MessageView *)v9 leadingAnchor];
    v13 = [v5 leadingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v28[2] = v14;
    v15 = [(MessageView *)v9 trailingAnchor];
    v16 = [v5 trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v28[3] = v17;
    v18 = +[NSArray arrayWithObjects:v28 count:4];
    +[NSLayoutConstraint activateConstraints:v18];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1007D0BE4;
    v26[3] = &unk_1012F9170;
    v27 = v9;
    v19 = v9;
    id v20 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v26 block:1.15000001];
  }
}

+ (void)presentString:(id)a3 withFont:(id)a4 inWindow:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v14 = NSFontAttributeName;
  id v15 = v9;
  v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  id v13 = [v11 initWithString:v10 attributes:v12];
  [a1 presentAttributedString:v13 inWindow:v8];
}

+ (void)presentDefaultValidationActionWithTitle:(id)a3 inWindow:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UIFont system17SemiBold];
  [a1 presentString:v7 withFont:v8 inWindow:v6];
}

+ (void)presentCollectionSavedValidationActionWithName:(id)a3 inWindow:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSMutableAttributedString);
  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"[Collection] Saved to %@" value:@"localized string not found" table:0];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v6);
  NSAttributedStringKey v22 = NSFontAttributeName;
  id v11 = +[UIFont system17];
  v23 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v13 = [v7 initWithString:v10 attributes:v12];

  NSAttributedStringKey v14 = [v13 string];
  id v15 = [v14 rangeOfString:v6];
  uint64_t v17 = v16;

  NSAttributedStringKey v20 = NSFontAttributeName;
  v18 = +[UIFont system20Bold];
  v21 = v18;
  v19 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [v13 addAttributes:v19 range:v15];

  +[ActionValidationController presentAttributedString:v13 inWindow:v5];
}

@end