@interface PromotedIAPManager
+ (id)sharedInstance;
- (PromotedIAPManager)init;
- (void)getInfoInternalForApp:(id)a3 completionHandler:(id)a4;
- (void)getOrderForIAPsInApp:(id)a3 completionHandler:(id)a4;
- (void)getVisibilityForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5;
- (void)removeOverridesForApp:(id)a3 completionHandler:(id)a4;
- (void)setOrderForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5;
- (void)setVisibility:(int64_t)a3 forIAP:(id)a4 app:(id)a5 completionHandler:(id)a6;
@end

@implementation PromotedIAPManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018C584;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401FC8 != -1) {
    dispatch_once(&qword_100401FC8, block);
  }
  v2 = (void *)qword_100401FC0;

  return v2;
}

- (PromotedIAPManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PromotedIAPManager;
  v2 = [(PromotedIAPManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PromotedIAPDatabase);
    database = v2->_database;
    v2->_database = v3;
  }
  return v2;
}

- (void)getOrderForIAPsInApp:(id)a3 completionHandler:(id)a4
{
}

- (void)setOrderForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5
{
}

- (void)getVisibilityForIAPs:(id)a3 app:(id)a4 completionHandler:(id)a5
{
}

- (void)setVisibility:(int64_t)a3 forIAP:(id)a4 app:(id)a5 completionHandler:(id)a6
{
}

- (void)getInfoInternalForApp:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  dispatch_group_enter(v8);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_10018C8D4;
  v27[4] = sub_10018C8E4;
  id v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_10018C8D4;
  v25[4] = sub_10018C8E4;
  id v26 = 0;
  database = self->_database;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10018C8EC;
  v22[3] = &unk_1003A86C0;
  v24 = v27;
  v10 = v8;
  v23 = v10;
  [(PromotedIAPDatabase *)database getOrderForIAPsInApp:v6 completionHandler:v22];
  v11 = self->_database;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10018C93C;
  v19[3] = &unk_1003A86E8;
  v21 = v25;
  v12 = v10;
  v20 = v12;
  [(PromotedIAPDatabase *)v11 getVisibilityForAllIAPsInApp:v6 completionHandler:v19];
  v13 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018C98C;
  block[3] = &unk_1003A8710;
  id v16 = v7;
  v17 = v25;
  v18 = v27;
  id v14 = v7;
  dispatch_group_notify(v12, v13, block);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

- (void)removeOverridesForApp:(id)a3 completionHandler:(id)a4
{
}

- (void).cxx_destruct
{
}

@end