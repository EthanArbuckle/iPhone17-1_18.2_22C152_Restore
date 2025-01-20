@interface RefineMapItemActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation RefineMapItemActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    v8 = [v6 chrome];
    v9 = [v8 currentTraits];

    [v9 setSource:1];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1009BAC84;
    v10[3] = &unk_1012EB600;
    id v11 = v6;
    [v7 resolveMapItemWithTraits:v9 completion:v10];
  }
}

@end