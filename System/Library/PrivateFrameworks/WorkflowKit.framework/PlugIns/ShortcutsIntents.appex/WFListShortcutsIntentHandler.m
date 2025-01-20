@interface WFListShortcutsIntentHandler
- (WFDatabase)database;
- (WFListShortcutsIntentHandler)init;
- (void)confirmListShortcuts:(id)a3 completion:(id)a4;
- (void)handleListShortcuts:(id)a3 completion:(id)a4;
@end

@implementation WFListShortcutsIntentHandler

- (void).cxx_destruct
{
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)handleListShortcuts:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id))a4;
  id v7 = a3;
  v8 = [(WFListShortcutsIntentHandler *)self database];
  v9 = [v8 sortedVisibleWorkflowsByName];

  v10 = [v7 appTitles];

  v11 = objc_msgSend(v10, "if_map:", &stru_100008410);

  id v12 = [objc_alloc((Class)INListShortcutsIntentResponse) initWithCode:3 userActivity:0];
  v13 = [v9 descriptors];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_10000316C;
  v19 = &unk_100008438;
  id v20 = v11;
  v21 = self;
  id v14 = v11;
  v15 = objc_msgSend(v13, "if_compactMap:", &v16);
  objc_msgSend(v12, "setShortcuts:", v15, v16, v17, v18, v19);

  v6[2](v6, v12);
}

- (void)confirmListShortcuts:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)INListShortcutsIntentResponse) initWithCode:1 userActivity:0];
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (WFListShortcutsIntentHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFListShortcutsIntentHandler;
  v2 = [(WFListShortcutsIntentHandler *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[WFDatabase defaultDatabase];
    database = v2->_database;
    v2->_database = (WFDatabase *)v3;

    id v5 = v2;
  }

  return v2;
}

@end