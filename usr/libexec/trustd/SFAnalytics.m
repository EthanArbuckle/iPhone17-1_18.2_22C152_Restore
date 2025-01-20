@interface SFAnalytics
- (void)trustd_logDetailedEventforEventNamed:(id)a3 attributesCallback:(id)a4;
- (void)trustd_logDetailedEventforEventNamed:(id)a3 attributesCallback:(id)a4 timestampBucket:(unsigned int)a5;
@end

@implementation SFAnalytics

- (void)trustd_logDetailedEventforEventNamed:(id)a3 attributesCallback:(id)a4 timestampBucket:(unsigned int)a5
{
  id v8 = a3;
  v9 = (void (**)(void))a4;
  id v10 = v8;
  if (qword_10008ABD0)
  {
    sub_100014488((void *)qword_10008ABC8);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = sub_100030AD8;
    v31 = sub_100030AE8;
    id v32 = 0;
    v11 = qword_10008ABD0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008594;
    block[3] = &unk_10007ECB0;
    id v25 = v10;
    v26 = &v27;
    dispatch_sync(v11, block);
    id v12 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v12 = 0;
  }

  id v13 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.security"];
  v14 = +[NSMutableString stringWithString:v10];
  [v14 appendString:@"AnalyticsRate"];
  v15 = [v13 valueForKey:v14];
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v16 = v15;

    id v12 = v16;
  }
  else if (!v12)
  {
    goto LABEL_12;
  }
  uint32_t v17 = arc4random();
  [v12 unsignedIntValue];
  [v12 floatValue];
  if ((float)(4295000000.0 / v18) >= (float)v17)
  {
    v19 = v9[2](v9);
    if (v19)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000212B8;
      v20[3] = &unk_100081120;
      v20[4] = self;
      id v21 = v10;
      id v22 = v19;
      unsigned int v23 = a5;
      sub_10005536C(v20);
    }
  }
LABEL_12:
}

- (void)trustd_logDetailedEventforEventNamed:(id)a3 attributesCallback:(id)a4
{
}

@end