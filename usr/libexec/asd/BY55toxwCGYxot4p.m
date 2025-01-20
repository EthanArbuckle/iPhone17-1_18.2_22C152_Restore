@interface BY55toxwCGYxot4p
- (BY55toxwCGYxot4p)init;
- (id)WnJ3gJFPRgsreXQi:(id)a3;
@end

@implementation BY55toxwCGYxot4p

- (BY55toxwCGYxot4p)init
{
  v6.receiver = self;
  v6.super_class = (Class)BY55toxwCGYxot4p;
  v2 = [(BY55toxwCGYxot4p *)&v6 init];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.asd.ca.stcq.nae", 0);
  UQa7uorw6jeKCE2x = v2->UQa7uorw6jeKCE2x;
  v2->UQa7uorw6jeKCE2x = (OS_dispatch_queue *)v3;

  return v2;
}

- (id)WnJ3gJFPRgsreXQi:(id)a3
{
  v4 = [a3 value];
  v5 = +[NSMutableDictionary dictionary];
  if (!v4) {
    goto LABEL_9;
  }
  objc_super v6 = [v4 firstName];
  if (!v6)
  {
    objc_super v6 = [v4 lastName];
    if (!v6)
    {
      v16 = [v4 fullName];

      if (v16) {
        goto LABEL_5;
      }
LABEL_9:
      [v5 setObject:&off_1006883B8 forKeyedSubscript:&off_1006883D0];
      [v5 setObject:&off_1006883B8 forKeyedSubscript:&off_1006883E8];
      goto LABEL_10;
    }
  }

LABEL_5:
  v7 = +[C7RiKwi0qHUD3RW9 sharedInstance];
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002C2E4;
  v21[3] = &unk_10065F728;
  v21[4] = self;
  id v9 = v5;
  id v22 = v9;
  v10 = v8;
  v23 = v10;
  [v7 SKiIwgejuzELNOY0:v4 completion:v21];
  dispatch_group_enter(v10);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002C400;
  v18[3] = &unk_10065F728;
  v18[4] = self;
  id v11 = v9;
  id v19 = v11;
  v12 = v10;
  v20 = v12;
  [v7 b8mzIZQ1GCTnhVAP:v4 completion:v18];
  dispatch_time_t v13 = dispatch_time(0, 1800000000);
  if (dispatch_group_wait(v12, v13)) {
    sub_100027C40(-32001);
  }
  v14 = v20;
  id v15 = v11;

LABEL_10:

  return v5;
}

- (void).cxx_destruct
{
}

@end