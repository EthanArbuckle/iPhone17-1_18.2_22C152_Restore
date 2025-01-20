@interface JqjKGcQaKRW9cbQJ
- (JqjKGcQaKRW9cbQJ)init;
- (id)WnJ3gJFPRgsreXQi:(id)a3;
@end

@implementation JqjKGcQaKRW9cbQJ

- (JqjKGcQaKRW9cbQJ)init
{
  v3.receiver = self;
  v3.super_class = (Class)JqjKGcQaKRW9cbQJ;
  return [(JqjKGcQaKRW9cbQJ *)&v3 init];
}

- (id)WnJ3gJFPRgsreXQi:(id)a3
{
  id v3 = a3;
  v4 = [v3 value];
  if (![v4 length])
  {
    v5 = +[FnfDbwO2lFcwJMJU sharedInstance];
    uint64_t v6 = [v5 N6iJbZh5ycxf9a3z];

    v4 = (void *)v6;
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  int v40 = 0;
  if ([v4 length])
  {
    v7 = +[C7RiKwi0qHUD3RW9 sharedInstance];
    v8 = dispatch_group_create();
    uint64_t v36 = 0;
    [v7 A6B42kYrDuXnlUJs:(char *)&v36 + 4 IaS2bByRUGdVAKHz:&v36];
    uint64_t v9 = v36;
    dispatch_group_enter(v8);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001E4E8;
    v33[3] = &unk_10065EB90;
    v35 = &v37;
    v10 = v8;
    v34 = v10;
    [v7 YMeSiVAJwqHb7P3U:v4 completion:v33];
    dispatch_group_enter(v10);
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_10001E500;
    v30 = &unk_10065EB90;
    v32 = &v41;
    v11 = v10;
    v31 = v11;
    [v7 KqWH25SjlYcX4wo6:v4 completion:&v27];
    dispatch_time_t v12 = dispatch_time(0, 1800000000);
    if (dispatch_group_wait(v11, v12)) {
      sub_100027C40(-32002);
    }

    float v13 = (float)SHIDWORD(v9);
    float v14 = (float)(int)v9;
  }
  else
  {
    float v14 = 0.0;
    float v13 = 0.0;
  }
  v45[0] = &off_1006882E0;
  id v15 = [v4 length:v27, v28, v29, v30];
  v17 = &off_100688310;
  if (!v15) {
    v17 = &off_1006882F8;
  }
  v46[0] = v17;
  v45[1] = &off_100688328;
  *(float *)&double v16 = v13;
  v18 = +[NSNumber numberWithFloat:v16];
  v46[1] = v18;
  v45[2] = &off_100688340;
  *(float *)&double v19 = v14;
  v20 = +[NSNumber numberWithFloat:v19];
  v46[2] = v20;
  v45[3] = &off_100688358;
  LODWORD(v21) = *((_DWORD *)v42 + 6);
  v22 = +[NSNumber numberWithFloat:v21];
  v46[3] = v22;
  v45[4] = &off_100688370;
  LODWORD(v23) = *((_DWORD *)v38 + 6);
  v24 = +[NSNumber numberWithFloat:v23];
  v46[4] = v24;
  v25 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v25;
}

@end