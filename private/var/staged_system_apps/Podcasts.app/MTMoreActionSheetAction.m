@interface MTMoreActionSheetAction
+ (id)action;
+ (id)moreIcon;
- (MTMoreActionSheetAction)init;
@end

@implementation MTMoreActionSheetAction

+ (id)action
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (MTMoreActionSheetAction)init
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"MORE_ACTIONS" value:&stru_10056A8A0 table:0];
  v12.receiver = self;
  v12.super_class = (Class)MTMoreActionSheetAction;
  v5 = [(IMAction *)&v12 initWithTitle:v4 icon:0];

  if (v5)
  {
    objc_initWeak(&location, v5);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100060590;
    v9[3] = &unk_10054D478;
    objc_copyWeak(&v10, &location);
    [(IMAction *)v5 setActionBlock:v9];
    [(IMAction *)v5 setConditionBlock:&stru_10054D4B8];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100060628;
    v7[3] = &unk_10054D4E0;
    objc_copyWeak(&v8, &location);
    [(IMAction *)v5 setButtonBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v5;
}

+ (id)moreIcon
{
  if (qword_10060A5E8 != -1) {
    dispatch_once(&qword_10060A5E8, &stru_10054D520);
  }
  id v2 = (void *)qword_10060A5E0;

  return v2;
}

@end