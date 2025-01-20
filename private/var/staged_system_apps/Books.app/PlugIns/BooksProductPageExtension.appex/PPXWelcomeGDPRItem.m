@interface PPXWelcomeGDPRItem
- (id)welcomeScreenViewControllerWithCompletion:(id)a3;
@end

@implementation PPXWelcomeGDPRItem

- (id)welcomeScreenViewControllerWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [PPXWelcomeGDPRViewController alloc];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002E50;
  v8[3] = &unk_100031390;
  id v9 = v3;
  id v5 = v3;
  v6 = [(PPXWelcomeGDPRViewController *)v4 initWithCompletion:v8];

  return v6;
}

@end