@interface HSPipeUtil
+ (int)HSPipeUtilExecCommand:(id)a3 options:(id)a4 response:(id *)a5 error:(id *)a6;
+ (int)HSPipeUtilExecCommandWithData:(id)a3 options:(id)a4 data:(id)a5 response:(id *)a6 error:(id *)a7;
@end

@implementation HSPipeUtil

+ (int)HSPipeUtilExecCommandWithData:(id)a3 options:(id)a4 data:(id)a5 response:(id *)a6 error:(id *)a7
{
  id v9 = a3;
  id v10 = a4;
  id v58 = a5;
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
  v12 = [v11 lastPathComponent];
  v54 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Enter %s at line %d\n", "+[HSPipeUtil HSPipeUtilExecCommandWithData:options:data:response:error:]", 289);
  sub_100009790(2, @"[%@:%d] %@\n", v13, v14, v15, v16, v17, v18, (uint64_t)v12);

  v62 = v10;
  id v19 = [v10 count];
  int v20 = (int)v19;
  uint64_t v57 = (void)v19 << 32;
  v21 = (const char **)malloc_type_malloc((((void)v19 << 32) + 0x200000000) >> 29, 0x50040EE9192B6uLL);
  id v59 = v9;
  *v21 = (const char *)[v59 UTF8String];
  v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
  v23 = [v22 lastPathComponent];
  v55 = +[NSString stringWithFormat:@"argv[0] = %s\n", *v21, 289, v54];
  sub_100009790(2, @"[%@:%d] %@\n", v24, v25, v26, v27, v28, v29, (uint64_t)v23);

  if (v20 >= 1)
  {
    uint64_t v30 = 1;
    do
    {
      id v31 = [v10 objectAtIndex:v30 - 1];
      v21[v30] = (const char *)[v31 UTF8String];

      v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
      v33 = [v32 lastPathComponent];
      v55 = +[NSString stringWithFormat:@"argv[%d] = %s\n", v30, v21[v30], v55];
      sub_100009790(2, @"[%@:%d] %@\n", v34, v35, v36, v37, v38, v39, (uint64_t)v33);

      ++v30;
    }
    while (v20 + 1 != v30);
  }
  *(const char **)((char *)v21 + (((uint64_t)&_mh_execute_header + v57) >> 29)) = 0;
  id v40 = v58;
  int v41 = sub_100003E18(v21, (char *)[v40 bytes], (int64_t)[v40 length], a6, a7);
  v42 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
  v43 = [v42 lastPathComponent];
  BOOL v44 = v41 == 0;
  uint64_t v45 = 7;
  if (v41) {
    int v46 = 7;
  }
  else {
    int v46 = 0;
  }
  if (v44) {
    uint64_t v45 = 0;
  }
  v56 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Exit %s at line %d, success = %d\n", "+[HSPipeUtil HSPipeUtilExecCommandWithData:options:data:response:error:]", 307, v45);
  sub_100009790(2, @"[%@:%d] %@\n", v47, v48, v49, v50, v51, v52, (uint64_t)v43);

  free(v21);
  return v46;
}

+ (int)HSPipeUtilExecCommand:(id)a3 options:(id)a4 response:(id *)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
  v11 = [v10 lastPathComponent];
  uint64_t v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Enter %s at line %d\n", "+[HSPipeUtil HSPipeUtilExecCommand:options:response:error:]", 319);
  sub_100009790(2, @"[%@:%d] %@\n", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

  id v18 = [v9 count];
  int v19 = (int)v18;
  uint64_t v20 = (void)v18 << 32;
  v21 = (const char **)malloc_type_malloc((((void)v18 << 32) + 0x200000000) >> 29, 0x50040EE9192B6uLL);
  id v22 = v8;
  *v21 = (const char *)[v22 UTF8String];
  if (v19 >= 1)
  {
    uint64_t v23 = 0;
    uint64_t v24 = (v19 + 1) - 1;
    do
    {
      id v25 = [v9 objectAtIndex:v23];
      v21[v23 + 1] = (const char *)[v25 UTF8String];

      ++v23;
    }
    while (v24 != v23);
  }
  *(const char **)((char *)v21 + (((uint64_t)&_mh_execute_header + v20) >> 29)) = 0;
  int v26 = sub_1000049CC(v21, a5, a6);
  uint64_t v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"];
  uint64_t v28 = [v27 lastPathComponent];
  BOOL v29 = v26 == 0;
  uint64_t v30 = 7;
  if (v26) {
    int v31 = 7;
  }
  else {
    int v31 = 0;
  }
  if (v29) {
    uint64_t v30 = 0;
  }
  id v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Exit %s at line %d, success = %d\n", "+[HSPipeUtil HSPipeUtilExecCommand:options:response:error:]", 335, v30);
  sub_100009790(2, @"[%@:%d] %@\n", v32, v33, v34, v35, v36, v37, (uint64_t)v28);

  free(v21);
  return v31;
}

@end