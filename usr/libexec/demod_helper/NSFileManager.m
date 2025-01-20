@interface NSFileManager
- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6;
@end

@implementation NSFileManager

- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5 correctOwnership:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  v14 = (const char *)[v13 UTF8String];
  id v15 = v11;
  if (copyfile(v14, (const char *)[v15 UTF8String], 0, 0x1008000u))
  {
    v18 = sub_100027250();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100033400((uint64_t)v13, (uint64_t)v15, v18);
    }
    id v20 = 0;
    v17 = 0;
    goto LABEL_20;
  }
  if (!v12)
  {
    v17 = 0;
    if (v6) {
      goto LABEL_5;
    }
LABEL_9:
    id v20 = 0;
    BOOL v21 = 1;
    goto LABEL_10;
  }
  v16 = +[NSURL fileURLWithString:v15];
  v17 = [v16 fileHash];

  if (([v17 isEqualToData:v12] & 1) == 0)
  {
    v18 = sub_100027250();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v31 = v13;
      __int16 v32 = 2114;
      v33 = v17;
      __int16 v34 = 2114;
      id v35 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "File has been changed after device manifest generation: %{public}@ - Current hash:  %{public}@ - Expected hash:  %{public}@", buf, 0x20u);
    }
    id v20 = 0;
    goto LABEL_20;
  }
  if (!v6) {
    goto LABEL_9;
  }
LABEL_5:
  v28[0] = NSFileOwnerAccountName;
  v28[1] = NSFileGroupOwnerAccountName;
  v29[0] = @"mobile";
  v29[1] = @"mobile";
  v18 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  id v27 = 0;
  unsigned __int8 v19 = [(NSFileManager *)self setAttributes:v18 ofItemAtPath:v15 error:&v27];
  id v20 = v27;
  if ((v19 & 1) == 0)
  {
    v23 = sub_100027250();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100033388((uint64_t)v13, v23);
    }

LABEL_20:
    if (![(NSFileManager *)self fileExistsAtPath:v15])
    {
      BOOL v21 = 0;
      goto LABEL_10;
    }
    id v26 = v20;
    unsigned __int8 v24 = [(NSFileManager *)self removeItemAtPath:v15 error:&v26];
    id v25 = v26;

    if (v24)
    {
      BOOL v21 = 0;
      id v20 = v25;
      goto LABEL_10;
    }
    v18 = sub_100027250();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000332D4((uint64_t)v15, v25, v18);
    }
    BOOL v21 = 0;
    id v20 = v25;
    goto LABEL_7;
  }
  BOOL v21 = 1;
LABEL_7:

LABEL_10:
  return v21;
}

@end