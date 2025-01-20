@interface CNContactStore
+ (BOOL)_maps_isAuthorized;
+ (void)promptForContactsAccessIfNeededBeforePerforming:(id)a3;
@end

@implementation CNContactStore

+ (BOOL)_maps_isAuthorized
{
  v2 = (void *)tcc_identity_create();
  if (v2) {
    BOOL v3 = (char *)+[CNContactStore authorizationStatusForEntityType:0]- 3 < (char *)2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (void)promptForContactsAccessIfNeededBeforePerforming:(id)a3
{
  id v4 = a3;
  switch(+[CNContactStore authorizationStatusForEntityType:0])
  {
    case 0:
      id v5 = objc_alloc_init((Class)CNContactStore);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1008D73D4;
      v32[3] = &unk_1012FFBC8;
      id v34 = a1;
      id v33 = v4;
      [v5 requestAccessForEntityType:0 completionHandler:v32];

      break;
    case 1:
      (*((void (**)(id, void))v4 + 2))(v4, 0);
      break;
    case 2:
      v6 = +[UIApplication _maps_keyMapsWindow];
      v7 = [v6 windowScene];

      if (v7)
      {
        uint64_t v26 = 0;
        v27 = &v26;
        uint64_t v28 = 0x3032000000;
        v29 = sub_1001040D4;
        v30 = sub_1001048E8;
        id v31 = [objc_alloc((Class)UIWindow) initWithWindowScene:v7];
        id v8 = objc_alloc_init((Class)UIViewController);
        [(id)v27[5] setRootViewController:v8];

        [(id)v27[5] setWindowLevel:UIWindowLevelAlert + 1.0];
        v9 = +[NSBundle mainBundle];
        v10 = [v9 localizedStringForKey:@"'%@' Would Like to Access Your Contacts" value:@"localized string not found" table:0];

        v11 = +[NSBundle mainBundle];
        v12 = [v11 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12);
        v14 = +[NSBundle mainBundle];
        v15 = [v14 objectForInfoDictionaryKey:@"NSContactsUsageDescription"];
        v16 = +[UIAlertController alertControllerWithTitle:v13 message:v15 preferredStyle:1];

        v17 = +[NSBundle mainBundle];
        v18 = [v17 localizedStringForKey:@"Cancel" value:@"localized string not found" table:0];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1008D74D4;
        v25[3] = &unk_1012FFBF0;
        v25[4] = &v26;
        v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v25];

        [v16 addAction:v19];
        v20 = +[NSBundle mainBundle];
        v21 = [v20 localizedStringForKey:@"[Contacts permission prompt] Settings" value:@"localized string not found" table:0];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1008D74E8;
        v24[3] = &unk_1012FFBF0;
        v24[4] = &v26;
        v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v24];

        [v16 addAction:v22];
        [v16 setPreferredAction:v22];
        [(id)v27[5] makeKeyAndVisible];
        v23 = [(id)v27[5] rootViewController];
        [v23 presentViewController:v16 animated:1 completion:0];

        _Block_object_dispose(&v26, 8);
      }
      (*((void (**)(id, void))v4 + 2))(v4, 0);

      break;
    case 3:
    case 4:
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
      break;
    default:
      break;
  }
}

@end