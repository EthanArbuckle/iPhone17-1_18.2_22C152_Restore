@interface NSFileManager
- (int64_t)fileSizeOfURL:(id)a3;
@end

@implementation NSFileManager

- (int64_t)fileSizeOfURL:(id)a3
{
  uint64_t v10 = 0;
  id v11 = 0;
  if (([a3 getResourceValue:&v11 forKey:NSURLFileSizeKey error:&v10] & 1) == 0)
  {
    if (qword_10006EB28 == -1)
    {
      uint64_t v8 = qword_10006EB30;
      if (!os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_ERROR)) {
        return (int64_t)[v11 longLongValue];
      }
    }
    else
    {
      dispatch_once(&qword_10006EB28, &stru_10005CFB0);
      uint64_t v8 = qword_10006EB30;
      if (!os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_ERROR)) {
        return (int64_t)[v11 longLongValue];
      }
    }
    *(_DWORD *)buf = 138543618;
    id v13 = a3;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    v5 = "Failed to get file size for %{public}@. %{public}@";
    v6 = v8;
    uint32_t v7 = 22;
    goto LABEL_11;
  }
  if (!v11)
  {
    if (qword_10006EB28 != -1)
    {
      dispatch_once(&qword_10006EB28, &stru_10005CFB0);
      uint64_t v4 = qword_10006EB30;
      if (!os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_ERROR)) {
        return (int64_t)[v11 longLongValue];
      }
      goto LABEL_5;
    }
    uint64_t v4 = qword_10006EB30;
    if (os_log_type_enabled((os_log_t)qword_10006EB30, OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      *(_DWORD *)buf = 138543362;
      id v13 = a3;
      v5 = "Failed to get file size for %{public}@ with no error";
      v6 = v4;
      uint32_t v7 = 12;
LABEL_11:
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
    }
  }
  return (int64_t)[v11 longLongValue];
}

@end