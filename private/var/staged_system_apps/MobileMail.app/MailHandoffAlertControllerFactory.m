@interface MailHandoffAlertControllerFactory
+ (id)mailAlertControllerForHandoffError:(id)a3 acknowledgmentObserver:(id)a4;
@end

@implementation MailHandoffAlertControllerFactory

+ (id)mailAlertControllerForHandoffError:(id)a3 acknowledgmentObserver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 mf_mailHandoffActivityType];
  if (v7)
  {
    id v8 = v5;
    id v9 = [v8 mf_activitySource];
    if (v9 == (id)2)
    {
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 localizedStringForKey:@"SIRI_SHORTCUT_FAILED_ERROR_TITLE" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      if (v9 == (id)3)
      {
        v10 = +[NSBundle bundleForClass:objc_opt_class()];
        [v10 localizedStringForKey:@"SELECTED_MESSAGE_NOT_FOUND_ERROR_TITLE" value:&stru_100619928 table:@"Main"];
      }
      else
      {
        v10 = +[NSBundle bundleForClass:objc_opt_class()];
        [v10 localizedStringForKey:@"HANDOFF_FAILED_ERROR_TITLE" value:&stru_100619928 table:@"Main"];
      uint64_t v11 = };
    }
    v13 = (void *)v11;

    id v14 = v8;
    v15 = [v14 domain];
    if ([v15 isEqualToString:MFHandoffErrorDomain])
    {
    }
    else
    {
      v16 = [v14 localizedDescription];

      if (v16)
      {
        v15 = [v14 localizedDescription];
        goto LABEL_23;
      }
    }
    id v17 = [v14 mf_activityErrorReason];
    if (v17 == (id)1) {
      goto LABEL_19;
    }
    if (!v17)
    {
      id v18 = [v14 mf_activitySource];
      if (v18 != (id)3)
      {
        if (v18 == (id)2)
        {
          v19 = +[NSBundle bundleForClass:objc_opt_class()];
          [v19 localizedStringForKey:@"SIRI_SHORTCUT_FAILED_ERROR_BODY" value:&stru_100619928 table:@"Main"];
        }
        else
        {
          v19 = +[NSBundle bundleForClass:objc_opt_class()];
          [v19 localizedStringForKey:@"HANDOFF_FAILED_ERROR_BODY" value:&stru_100619928 table:@"Main"];
        uint64_t v20 = };
        goto LABEL_22;
      }
LABEL_19:
      v19 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v20 = [v19 localizedStringForKey:@"SELECTED_MESSAGE_NOT_FOUND_ERROR_BODY" value:&stru_100619928 table:@"Main"];
LABEL_22:
      v15 = (void *)v20;
    }
LABEL_23:

    v12 = +[UIAlertController alertControllerWithTitle:v13 message:v15 preferredStyle:1];
    if (v6)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10010CE18;
      v26[3] = &unk_100608528;
      id v27 = v6;
      id v28 = v14;
      v21 = objc_retainBlock(v26);
    }
    else
    {
      v21 = 0;
    }
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"OK" value:&stru_100619928 table:@"Main"];
    v24 = +[UIAlertAction actionWithTitle:v23 style:0 handler:v21];

    [v12 addAction:v24];
    goto LABEL_27;
  }
  v12 = 0;
LABEL_27:

  return v12;
}

@end