@interface NSDictionary
- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5;
@end

@implementation NSDictionary

- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5
{
  id v8 = a3;
  if (![(NSDictionary *)self writeToURL:v8 error:a5]) {
    goto LABEL_12;
  }
  id v9 = v8;
  v10 = (const char *)[v9 fileSystemRepresentation];
  int v11 = open(v10, 0);
  if (v11)
  {
    int v12 = v11;
    if ((fcntl(v11, 64, 4) & 0x80000000) == 0)
    {
      close(v12);
      id v13 = v9;
      if (!chmod((const char *)[v13 fileSystemRepresentation], a4))
      {
        BOOL v24 = 1;
        goto LABEL_13;
      }
      uint64_t v14 = *__error();
      v15 = sub_1000106A0("SecError");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = [v13 fileSystemRepresentation];
        __int16 v34 = 2080;
        v35 = strerror(v14);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", buf, 0x16u);
      }

      if (a5)
      {
        v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", @"failed to change permissions of %s: %s", [v13 fileSystemRepresentation], strerror(v14), NSLocalizedDescriptionKey);
        v32 = v16;
        v17 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v14 userInfo:v17];
      }
      goto LABEL_12;
    }
    uint64_t v25 = *__error();
    NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
    v26 = __error();
    v27 = +[NSString localizedStringWithFormat:@"failed to change protection class of %s: %s", v10, strerror(*v26)];
    *(void *)buf = v27;
    v28 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v38 count:1];
    v29 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v25 userInfo:v28];

    id v23 = v29;
    close(v12);
    if (!a5)
    {
LABEL_12:
      BOOL v24 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v18 = *__error();
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    v19 = __error();
    v20 = +[NSString localizedStringWithFormat:@"failed to open file for protection class change %s: %s", v10, strerror(*v19)];
    v37 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v18 userInfo:v21];

    id v23 = v22;
    if (!a5) {
      goto LABEL_12;
    }
  }
  BOOL v24 = 0;
  *a5 = v23;
LABEL_13:

  return v24;
}

@end