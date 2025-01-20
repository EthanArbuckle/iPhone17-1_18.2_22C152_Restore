@interface NSDate
+ (void)load;
- (id)tri_memoryFriendlyDescriptionWithLocale:(id)a3;
@end

@implementation NSDate

+ (void)load
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000316C;
  v2[3] = &unk_100004118;
  v2[4] = a1;
  v2[5] = a2;
  if (qword_100008078 != -1) {
    dispatch_once(&qword_100008078, v2);
  }
}

- (id)tri_memoryFriendlyDescriptionWithLocale:(id)a3
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000342C;
  v15[3] = &unk_100004140;
  v15[4] = self;
  id v5 = a3;
  id v16 = v5;
  SEL v17 = a2;
  v6 = objc_retainBlock(v15);
  if (v5) {
    goto LABEL_2;
  }
  [(NSDate *)self timeIntervalSince1970];
  time_t v14 = (uint64_t)v9;
  memset(&v13, 0, sizeof(v13));
  if (!gmtime_r(&v14, &v13)) {
    goto LABEL_2;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)v18 = 0u;
  long long v19 = 0u;
  if (strftime(v18, 0x100uLL, "%Y-%m-%d %H:%M:%S +0000", &v13))
  {
    id v10 = [objc_alloc((Class)NSString) initWithUTF8String:v18];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      ((void (*)(void *))v6[2])(v6);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v12;
  }
  else
  {
LABEL_2:
    v7 = ((void (*)(void *))v6[2])(v6);
  }

  return v7;
}

@end