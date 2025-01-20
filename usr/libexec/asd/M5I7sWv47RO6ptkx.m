@interface M5I7sWv47RO6ptkx
- (M5I7sWv47RO6ptkx)init;
- (id)WnJ3gJFPRgsreXQi:(id)a3;
@end

@implementation M5I7sWv47RO6ptkx

- (M5I7sWv47RO6ptkx)init
{
  v6.receiver = self;
  v6.super_class = (Class)M5I7sWv47RO6ptkx;
  v2 = [(M5I7sWv47RO6ptkx *)&v6 init];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.asd.statcomputation.emae", 0);
  UQa7uorw6jeKCE2x = v2->UQa7uorw6jeKCE2x;
  v2->UQa7uorw6jeKCE2x = (OS_dispatch_queue *)v3;

  return v2;
}

- (id)WnJ3gJFPRgsreXQi:(id)a3
{
  id v4 = a3;
  v5 = [v4 value];
  if (![v5 length])
  {
    objc_super v6 = +[j7CSI6j8vNYi4bMa sharedInstance];
    uint64_t v7 = [v6 email];

    v5 = (void *)v7;
  }
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  int v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  int v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  int v46 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  if ([v5 length])
  {
    v8 = +[C7RiKwi0qHUD3RW9 sharedInstance];
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100007E38;
    v36[3] = &unk_10065EB68;
    v36[4] = self;
    v38 = &v51;
    v10 = v9;
    v37 = v10;
    [v8 E5J0OeRApCYQUXDZ:v5 completion:v36];
    dispatch_group_enter(v10);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100007EF4;
    v33[3] = &unk_10065EB68;
    v33[4] = self;
    v35 = &v47;
    v11 = v10;
    v34 = v11;
    [v8 U4k02bIWNYQCLSGK:v5 completion:v33];
    dispatch_group_enter(v11);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100007FB0;
    v30[3] = &unk_10065EB90;
    v32 = &v39;
    v12 = v11;
    v31 = v12;
    [v8 YMeSiVAJwqHb7P3U:v5 completion:v30];
    dispatch_group_enter(v12);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100007FC8;
    v27[3] = &unk_10065EB90;
    v29 = &v43;
    v13 = v12;
    v28 = v13;
    [v8 KqWH25SjlYcX4wo6:v5 completion:v27];
    dispatch_time_t v14 = dispatch_time(0, 1800000000);
    if (dispatch_group_wait(v13, v14)) {
      sub_100027C40(-32006);
    }
  }
  v55[0] = &off_100688070;
  id v15 = [v5 length];
  v17 = &off_100688428;
  if (!v15) {
    v17 = &off_100688418;
  }
  v56[0] = v17;
  v55[1] = &off_100688088;
  LODWORD(v16) = *((_DWORD *)v52 + 6);
  v18 = +[NSNumber numberWithFloat:v16];
  v56[1] = v18;
  v55[2] = &off_1006880A0;
  LODWORD(v19) = *((_DWORD *)v48 + 6);
  v20 = +[NSNumber numberWithFloat:v19];
  v56[2] = v20;
  v55[3] = &off_1006880B8;
  LODWORD(v21) = *((_DWORD *)v44 + 6);
  v22 = +[NSNumber numberWithFloat:v21];
  v56[3] = v22;
  v55[4] = &off_1006880D0;
  LODWORD(v23) = *((_DWORD *)v40 + 6);
  v24 = +[NSNumber numberWithFloat:v23];
  v56[4] = v24;
  v25 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v25;
}

- (void).cxx_destruct
{
}

@end