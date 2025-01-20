@interface HSSepUtil
+ (id)sharedSingleton;
- (HSSepUtil)init;
- (int)processSepUtilCommand:(id)a3 response:(id *)a4;
@end

@implementation HSSepUtil

+ (id)sharedSingleton
{
  if (qword_100014C58 != -1) {
    dispatch_once(&qword_100014C58, &stru_1000105E0);
  }
  v2 = (void *)qword_100014C60;

  return v2;
}

- (HSSepUtil)init
{
  v3.receiver = self;
  v3.super_class = (Class)HSSepUtil;
  return [(HSSepUtil *)&v3 init];
}

- (int)processSepUtilCommand:(id)a3 response:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    id v7 = [v5 objectForKey:@"CommandData"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 length])
    {
      v8 = +[NSArray arrayWithObjects:@"--restore+art", @"-", 0];
      id v7 = v7;
      id v33 = 0;
      unsigned int v9 = +[HSPipeUtil HSPipeUtilExecCommandWithData:@"/usr/libexec/seputil" options:v8 data:v7 response:a4 error:&v33];
      id v10 = v33;
      if (v9) {
        int v11 = 8;
      }
      else {
        int v11 = 0;
      }
      v12 = v7;
    }
    else
    {
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/HSSepUtil/HSSepUtil.m"];
      v14 = [v13 lastPathComponent];
      v15 = +[NSString stringWithFormat:@"Invalid SEP firmware.\n"];
      int v11 = 4;
      sub_100009790(4, @"[%@:%d] %@\n", v16, v17, v18, v19, v20, v21, (uint64_t)v14);

      v22 = +[NSNumber numberWithInt:4];
      *a4 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v22, @"Status", @"Invalid SEP firmware.", @"Error", &stru_1000108C8, @"Output", 0, @"Data", 0];

      id v10 = 0;
      v12 = 0;
      v8 = 0;
    }
  }
  else
  {
    v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/HSSepUtil/HSSepUtil.m"];
    v25 = [v24 lastPathComponent];
    v32 = +[NSString stringWithFormat:@"Input response dictionary pointer is NULL."];
    sub_100009790(4, @"[%@:%d] %@\n", v26, v27, v28, v29, v30, v31, (uint64_t)v25);

    id v7 = 0;
    id v10 = 0;
    v12 = 0;
    v8 = 0;
    int v11 = 8;
  }

  return v11;
}

@end