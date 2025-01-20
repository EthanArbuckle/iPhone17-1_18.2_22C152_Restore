@interface DIUserDataParams
+ (BOOL)supportsSecureCoding;
- (BOOL)embedWithError:(id *)a3;
- (BOOL)retrieveWithError:(id *)a3;
- (BOOL)supportsPstack;
- (DIUserDataParams)initWithCoder:(id)a3;
- (DIUserDataParams)initWithURL:(id)a3 error:(id *)a4;
- (NSDictionary)userDict;
- (void)encodeWithCoder:(id)a3;
- (void)setUserDict:(id)a3;
@end

@implementation DIUserDataParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIUserDataParams)initWithURL:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)DIUserDataParams;
  v4 = [(DIBaseParams *)&v8 initWithURL:a3 error:a4];
  v5 = v4;
  if (v4)
  {
    userDict = v4->_userDict;
    v4->_userDict = (NSDictionary *)&__NSDictionary0__struct;
  }
  return v5;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (DIUserDataParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DIUserDataParams;
  v5 = [(DIBaseParams *)&v15 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userData"];
    if (v6)
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);
      id v14 = 0;
      uint64_t v10 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v9 fromData:v6 error:&v14];
      id v11 = v14;
      userDict = v5->_userDict;
      v5->_userDict = (NSDictionary *)v10;

      if (!v11) {
        goto LABEL_7;
      }
    }
    else
    {
      id v11 = +[DIError errorWithPOSIXCode:22 verboseInfo:@"Failed serializing user dictionary"];
    }
    [(DIBaseParams *)v5 setDeserializationError:v11];
LABEL_7:
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DIUserDataParams;
  [(DIBaseParams *)&v16 encodeWithCoder:v4];
  v5 = [(DIUserDataParams *)self userDict];
  id v15 = 0;
  v6 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:0 error:&v15];
  id v7 = v15;

  if (v7)
  {
    int v8 = *__error();
    if (sub_1000D29A0())
    {
      uint64_t v14 = 0;
      v9 = sub_1000D2920();
      os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158210;
      int v18 = 36;
      __int16 v19 = 2080;
      v20 = "-[DIUserDataParams encodeWithCoder:]";
      __int16 v21 = 2114;
      id v22 = v7;
      LODWORD(v13) = 28;
      v12 = buf;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf(__stderrp, "%s\n", v10);
        free(v10);
      }
    }
    else
    {
      id v11 = sub_1000D2920();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158210;
        int v18 = 36;
        __int16 v19 = 2080;
        v20 = "-[DIUserDataParams encodeWithCoder:]";
        __int16 v21 = 2114;
        id v22 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%.*s: Error encoding user dictionary: %{public}@", buf, 0x1Cu);
      }
    }
    *__error() = v8;
  }
  [v4 encodeObject:v6 forKey:@"userData" v12 v13 v14];
}

- (BOOL)retrieveWithError:(id *)a3
{
  if (![(DIBaseParams *)self openExistingImageWithFlags:0 error:a3]) {
    return 0;
  }
  int v5 = *__error();
  if (sub_1000D29A0())
  {
    uint64_t v17 = 0;
    v6 = sub_1000D2920();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 38;
    *(_WORD *)v24 = 2080;
    *(void *)&v24[2] = "-[DIUserDataParams retrieveWithError:]";
    *(_WORD *)&v24[10] = 2114;
    *(void *)&v24[12] = self;
    LODWORD(v15) = 28;
    uint64_t v14 = buf;
    id v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    v9 = sub_1000D2920();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 38;
      *(_WORD *)v24 = 2080;
      *(void *)&v24[2] = "-[DIUserDataParams retrieveWithError:]";
      *(_WORD *)&v24[10] = 2114;
      *(void *)&v24[12] = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v5;
  *(void *)buf = 0;
  *(void *)v24 = buf;
  *(void *)&v24[8] = 0x3032000000;
  *(void *)&v24[16] = sub_100031C60;
  v25 = sub_100031C70;
  v26 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if (([*(id *)(*(void *)v24 + 40) connectWithError:a3] & 1) != 0
    && [(DIBaseParams *)self prepareImageWithXpcHandler:*(void *)(*(void *)v24 + 40) fileMode:2 error:a3])
  {
    uint64_t v17 = 0;
    int v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_100031C60;
    __int16 v21 = sub_100031C70;
    id v22 = 0;
    uint64_t v10 = [*(id *)(*(void *)v24 + 40) remoteProxy];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100031C78;
    v16[3] = &unk_100194F08;
    v16[4] = &v17;
    v16[5] = buf;
    [v10 retrieveUserDataWithParams:self reply:v16];

    unsigned __int8 v8 = [*(id *)(*(void *)v24 + 40) completeCommandWithError:a3];
    if (v8)
    {
      id v11 = [(id)v18[5] userDict];
      if (v11)
      {
        v12 = [(id)v18[5] userDict];
      }
      else
      {
        v12 = &__NSDictionary0__struct;
      }
      -[DIUserDataParams setUserDict:](self, "setUserDict:", v12, v14, v15);
      if (v11) {
    }
      }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }
  _Block_object_dispose(buf, 8);

  return v8;
}

- (BOOL)embedWithError:(id *)a3
{
  int v5 = [(DIUserDataParams *)self userDict];
  if (!v5) {
    return +[DIError failWithPOSIXCode:22 verboseInfo:@"userDict cannot be nil or empty" error:a3];
  }
  v6 = [(DIUserDataParams *)self userDict];
  id v7 = [v6 count];

  if (!v7) {
    return +[DIError failWithPOSIXCode:22 verboseInfo:@"userDict cannot be nil or empty" error:a3];
  }
  if (![(DIBaseParams *)self openExistingImageWithFlags:2 error:a3]) {
    return 0;
  }
  int v8 = *__error();
  if (sub_1000D29A0())
  {
    v15[5] = 0;
    v9 = sub_1000D2920();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 35;
    *(_WORD *)uint64_t v17 = 2080;
    *(void *)&v17[2] = "-[DIUserDataParams embedWithError:]";
    *(_WORD *)&v17[10] = 2114;
    *(void *)&v17[12] = self;
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v12 = sub_1000D2920();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 35;
      *(_WORD *)uint64_t v17 = 2080;
      *(void *)&v17[2] = "-[DIUserDataParams embedWithError:]";
      *(_WORD *)&v17[10] = 2114;
      *(void *)&v17[12] = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v8;
  *(void *)buf = 0;
  *(void *)uint64_t v17 = buf;
  *(void *)&v17[8] = 0x3032000000;
  *(void *)&v17[16] = sub_100031C60;
  int v18 = sub_100031C70;
  uint64_t v19 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if (([*(id *)(*(void *)v17 + 40) connectWithError:a3] & 1) != 0
    && [(DIBaseParams *)self prepareImageWithXpcHandler:*(void *)(*(void *)v17 + 40) fileMode:4 error:a3])
  {
    uint64_t v13 = [*(id *)(*(void *)v17 + 40) remoteProxy];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100032100;
    v15[3] = &unk_100194F30;
    v15[4] = buf;
    [v13 embedUserDataWithParams:self reply:v15];

    unsigned __int8 v11 = [*(id *)(*(void *)v17 + 40) completeCommandWithError:a3];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }
  _Block_object_dispose(buf, 8);

  return v11;
}

- (NSDictionary)userDict
{
  return self->_userDict;
}

- (void)setUserDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end