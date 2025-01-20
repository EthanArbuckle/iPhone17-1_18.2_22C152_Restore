@interface UIAlertController
+ (id)rc_OKAlertControllerWithTitle:(id)a3 message:(id)a4 handler:(id)a5;
+ (id)rc_alertControllerWithTitle:(id)a3 message:(id)a4 buttons:(id)a5;
- (void)rc_showInMainWindow;
@end

@implementation UIAlertController

+ (id)rc_OKAlertControllerWithTitle:(id)a3 message:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"OK" value:&stru_100228BC8 table:0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100089884;
  v14[3] = &unk_1002225D8;
  id v15 = v7;
  id v11 = v7;
  v12 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v14];
  [v8 addAction:v12];

  return v8;
}

+ (id)rc_alertControllerWithTitle:(id)a3 message:(id)a4 buttons:(id)a5
{
  id v7 = a5;
  v8 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 objectForKeyedSubscript:@"title"];
        id v15 = [v13 objectForKeyedSubscript:@"style"];
        id v16 = [v15 integerValue];

        v17 = [v13 objectForKeyedSubscript:@"action"];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100089ACC;
        v22[3] = &unk_1002225D8;
        id v23 = v17;
        id v18 = v17;
        v19 = +[UIAlertAction actionWithTitle:v14 style:v16 handler:v22];
        [v8 addAction:v19];
      }
      id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  return v8;
}

- (void)rc_showInMainWindow
{
  v3 = +[UIApplication sharedApplication];
  v4 = [v3 delegate];
  v5 = [v4 window];
  id v9 = [v5 rootViewController];

  v6 = [v9 presentedViewController];
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = v9;
  }
  id v8 = v7;

  [v8 presentViewController:self animated:1 completion:0];
}

@end