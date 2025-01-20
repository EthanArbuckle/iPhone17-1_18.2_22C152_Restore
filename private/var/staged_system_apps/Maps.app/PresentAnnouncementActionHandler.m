@interface PresentAnnouncementActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation PresentAnnouncementActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 announcement];
    unsigned int v9 = [v8 hasTitle];
    if (v9
      && ([v8 title], v22 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v22, "length")))
    {
      v10 = [v8 title];
      int v11 = 0;
      int v12 = 1;
    }
    else
    {
      v4 = +[NSBundle mainBundle];
      v10 = [v4 localizedStringForKey:@"Maps Announcement" value:@"localized string not found" table:0];
      int v12 = 0;
      int v11 = 1;
    }
    v13 = [v8 userMessage];
    v14 = +[UIAlertController alertControllerWithTitle:v10 message:v13 preferredStyle:1];

    if (v11)
    {
    }
    if (v12) {

    }
    if (v9) {
    v15 = [v7 chrome];
    }
    if (([v8 hasButtonOneMessage] & 1) != 0
      || [v8 hasButtonOneAppURI])
    {
      if ([v8 hasButtonOneMessage])
      {
        v16 = [v8 buttonOneMessage];
      }
      else
      {
        v17 = +[NSBundle mainBundle];
        v16 = [v17 localizedStringForKey:@"OK [announcement-alert]" value:@"localized string not found" table:0];
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10058E8E4;
      v26[3] = &unk_1012E9640;
      id v27 = v8;
      id v28 = v15;
      v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v26];
      [v14 addAction:v18];
    }
    if (([v8 hasButtonTwoMessage] & 1) != 0
      || [v8 hasButtonTwoAppURI])
    {
      if ([v8 hasButtonTwoMessage])
      {
        v19 = [v8 buttonTwoMessage];
      }
      else
      {
        v20 = +[NSBundle mainBundle];
        v19 = [v20 localizedStringForKey:@"Dismiss [announcement-alert]" value:@"localized string not found" table:0];
      }
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10058EA1C;
      v23[3] = &unk_1012E9640;
      id v24 = v8;
      id v25 = v15;
      v21 = +[UIAlertAction actionWithTitle:v19 style:1 handler:v23];
      [v14 addAction:v21];
    }
    [v15 presentViewController:v14 animated:1 completion:0];
  }
}

@end