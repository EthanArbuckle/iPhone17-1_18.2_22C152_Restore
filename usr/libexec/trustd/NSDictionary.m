@interface NSDictionary
- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5;
@end

@implementation NSDictionary

- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5
{
  id v8 = a3;
  if (![(NSDictionary *)self writeToURL:v8 error:a5]) {
    goto LABEL_10;
  }
  id v19 = 0;
  id v9 = v8;
  if (sub_100034634((const char *)[v9 fileSystemRepresentation], &v19))
  {
    id v10 = v9;
    if (!chmod((const char *)[v10 fileSystemRepresentation], a4))
    {
      BOOL v17 = 1;
      goto LABEL_11;
    }
    uint64_t v11 = *__error();
    v12 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v10 fileSystemRepresentation];
      v14 = strerror(v11);
      *(_DWORD *)buf = 136315394;
      id v23 = v13;
      __int16 v24 = 2080;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", buf, 0x16u);
    }

    if (a5)
    {
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", @"failed to change permissions of %s: %s", [v10 fileSystemRepresentation], strerror(v11));
      v21 = v15;
      v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v11 userInfo:v16];
    }
    goto LABEL_10;
  }
  if (!a5)
  {
LABEL_10:
    BOOL v17 = 0;
    goto LABEL_11;
  }
  BOOL v17 = 0;
  *a5 = v19;
LABEL_11:

  return v17;
}

@end