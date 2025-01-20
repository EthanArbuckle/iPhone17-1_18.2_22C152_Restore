@interface RAPSendingTitleView
+ (id)localizedSendingTitle;
- (RAPSendingTitleView)initWithFrame:(CGRect)a3;
@end

@implementation RAPSendingTitleView

+ (id)localizedSendingTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Sending... [Report a Problem]" value:@"localized string not found" table:0];

  return v3;
}

- (RAPSendingTitleView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)RAPSendingTitleView;
  v3 = -[RAPSendingTitleView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init((Class)UILabel);
    v5 = [(id)objc_opt_class() localizedSendingTitle];
    [v4 setText:v5];

    v6 = +[UIFont boldSystemFontOfSize:17.0];
    [v4 setFont:v6];

    [v4 setNumberOfLines:1];
    [v4 setLineBreakMode:4];
    [(RAPSendingTitleView *)v3 addSubview:v4];
    id v7 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v7 startAnimating];
    [(RAPSendingTitleView *)v3 addSubview:v7];
    v8 = _NSDictionaryOfVariableBindings(@"label, spinner", v4, v7, 0);
    +[UIView _maps_setDoesNotTranslateAutoresizingConstraintsForViewsDictionary:v8];
    id v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=0)-[spinner]-(>=0)-|", 0, 0, v8);
    [v9 addObjectsFromArray:v10];

    v11 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=0)-[label]-(>=0)-|", 0, 0, v8);
    [v9 addObjectsFromArray:v11];

    v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|[spinner]-[label]|", 0, 0, v8);
    [v9 addObjectsFromArray:v12];

    +[NSLayoutConstraint activateConstraints:v9];
  }
  return v3;
}

@end