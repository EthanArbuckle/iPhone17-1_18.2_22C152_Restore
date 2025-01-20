@interface MailMenuCommandCollection
+ (id)_gatherShortcuts;
- (MailMenuCommandCollection)init;
@end

@implementation MailMenuCommandCollection

- (MailMenuCommandCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)MailMenuCommandCollection;
  v2 = [(MailMenuCommandCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MailMenuCommandCollection _gatherShortcuts];
    shortcuts = v2->shortcuts;
    v2->shortcuts = (NSDictionary *)v3;
  }
  return v2;
}

+ (id)_gatherShortcuts
{
  v22 = objc_opt_new();
  v21 = objc_opt_new();
  v20 = objc_opt_new();
  v19 = objc_opt_new();
  v25 = objc_opt_new();
  v24 = objc_opt_new();
  v23 = objc_opt_new();
  v2 = objc_opt_new();
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002A9A8;
  v27[3] = &unk_100608930;
  id v3 = v22;
  id v28 = v3;
  id v4 = v21;
  id v29 = v4;
  id v5 = v20;
  id v30 = v5;
  id v6 = v19;
  id v31 = v6;
  id v7 = v25;
  id v32 = v7;
  id v8 = v24;
  id v33 = v8;
  id v9 = v23;
  id v34 = v9;
  id v26 = v2;
  id v35 = v26;
  v10 = objc_retainBlock(v27);
  v11 = +[MailScene menuCommands];
  ((void (*)(void *, void *))v10[2])(v10, v11);

  v12 = +[MailMainScene menuCommands];
  ((void (*)(void *, void *))v10[2])(v10, v12);

  v13 = +[DockContainerViewController menuCommands];
  ((void (*)(void *, void *))v10[2])(v10, v13);

  v14 = +[MailSplitViewController menuCommands];
  ((void (*)(void *, void *))v10[2])(v10, v14);

  v15 = +[MFComposeWebView menuCommands];
  ((void (*)(void *, void *))v10[2])(v10, v15);

  v16 = +[MFMailComposeController menuCommands];
  ((void (*)(void *, void *))v10[2])(v10, v16);

  v36[0] = &off_10062A878;
  v36[1] = &off_10062A890;
  v37[0] = v3;
  v37[1] = v4;
  v36[2] = &off_10062A8A8;
  v36[3] = &off_10062A8C0;
  v37[2] = v5;
  v37[3] = v6;
  v36[4] = &off_10062A8D8;
  v36[5] = &off_10062A8F0;
  v37[4] = v7;
  v37[5] = v8;
  v36[6] = &off_10062A908;
  v36[7] = &off_10062A920;
  v37[6] = v9;
  v37[7] = v26;
  v17 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:8];

  return v17;
}

- (void).cxx_destruct
{
}

@end