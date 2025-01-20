@interface DIStatFS
+ (BOOL)supportsSecureCoding;
- (DIStatFS)initWithCoder:(id)a3;
- (DIStatFS)initWithFileDescriptor:(int)a3 error:(id *)a4;
- (NSString)mountedFrom;
- (NSURL)mountedOnURL;
- (unint64_t)blockSize;
- (void)encodeWithCoder:(id)a3;
- (void)logWithHeader:(id)a3;
@end

@implementation DIStatFS

- (DIStatFS)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIStatFS;
  v5 = [(DIStatFS *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mountedOnURL"];
    mountedOnURL = v5->_mountedOnURL;
    v5->_mountedOnURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mountedFrom"];
    mountedFrom = v5->_mountedFrom;
    v5->_mountedFrom = (NSString *)v8;

    v5->_blockSize = (unint64_t)[v4 decodeIntegerForKey:@"blockSize"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(DIStatFS *)self mountedOnURL];
  [v6 encodeObject:v4 forKey:@"mountedOnURL"];

  v5 = [(DIStatFS *)self mountedFrom];
  [v6 encodeObject:v5 forKey:@"mountedFrom"];

  [v6 encodeInteger:-[DIStatFS blockSize](self, "blockSize") forKey:@"blockSize"];
}

- (DIStatFS)initWithFileDescriptor:(int)a3 error:(id *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)DIStatFS;
  id v6 = [(DIStatFS *)&v19 init];
  if (!v6)
  {
LABEL_14:
    v15 = v6;
    goto LABEL_15;
  }
  if ((fstatfs(a3, &v26) & 0x80000000) == 0)
  {
    v7 = +[NSString stringWithUTF8String:v26.f_mntonname];
    uint64_t v8 = +[NSURL fileURLWithPath:v7 isDirectory:1];
    mountedOnURL = v6->_mountedOnURL;
    v6->_mountedOnURL = (NSURL *)v8;

    v6->_blockSize = v26.f_bsize;
    id v10 = +[DIHelpers copyDevicePathWithStatfs:&v26];
    objc_super v11 = v10;
    if ((v26.f_flags & 0x1000) != 0 && [v10 hasPrefix:@"/dev/disk"]) {
      objc_storeStrong((id *)&v6->_mountedFrom, v11);
    }
    int v12 = *__error();
    if (sub_1000D29A0())
    {
      v13 = sub_1000D2920();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      int v21 = 41;
      __int16 v22 = 2080;
      v23 = "-[DIStatFS initWithFileDescriptor:error:]";
      __int16 v24 = 2082;
      f_fstypename = v26.f_fstypename;
      v14 = (char *)_os_log_send_and_compose_impl();

      if (v14)
      {
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }
    else
    {
      v16 = sub_1000D2920();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v21 = 41;
        __int16 v22 = 2080;
        v23 = "-[DIStatFS initWithFileDescriptor:error:]";
        __int16 v24 = 2082;
        f_fstypename = v26.f_fstypename;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%.*s: File system is %{public}s", buf, 0x1Cu);
      }
    }
    *__error() = v12;

    goto LABEL_14;
  }
  v15 = +[DIError nilWithPOSIXCode:*__error() verboseInfo:@"fstatfs failed" error:a4];
LABEL_15:
  v17 = v15;

  return v17;
}

- (void)logWithHeader:(id)a3
{
  id v6 = a3;
  int v20 = *__error();
  if (sub_1000D29A0())
  {
    v7 = sub_1000D2920();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    uint64_t v8 = [(DIStatFS *)self mountedOnURL];
    v9 = [v8 path];
    unsigned int v10 = [(DIStatFS *)self blockSize];
    objc_super v11 = [(DIStatFS *)self mountedFrom];
    if (v11)
    {
      id v4 = [(DIStatFS *)self mountedFrom];
      int v12 = +[NSString stringWithFormat:@"locally mounted from %@", v4];
    }
    else
    {
      int v12 = @"remote mount";
    }
    *(_DWORD *)buf = 68158979;
    int v22 = 26;
    __int16 v23 = 2080;
    __int16 v24 = "-[DIStatFS logWithHeader:]";
    __int16 v25 = 2114;
    id v26 = v6;
    __int16 v27 = 2113;
    v28 = v9;
    __int16 v29 = 1024;
    unsigned int v30 = v10;
    __int16 v31 = 2114;
    v32 = v12;
    objc_super v19 = (char *)_os_log_send_and_compose_impl();
    if (v11)
    {
    }
    if (v19)
    {
      fprintf(__stderrp, "%s\n", v19);
      free(v19);
    }
  }
  else
  {
    v13 = sub_1000D2920();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(DIStatFS *)self mountedOnURL];
      v15 = [v14 path];
      unsigned int v16 = [(DIStatFS *)self blockSize];
      v17 = [(DIStatFS *)self mountedFrom];
      if (v17)
      {
        v3 = [(DIStatFS *)self mountedFrom];
        v18 = +[NSString stringWithFormat:@"locally mounted from %@", v3];
      }
      else
      {
        v18 = @"remote mount";
      }
      *(_DWORD *)buf = 68158979;
      int v22 = 26;
      __int16 v23 = 2080;
      __int16 v24 = "-[DIStatFS logWithHeader:]";
      __int16 v25 = 2114;
      id v26 = v6;
      __int16 v27 = 2113;
      v28 = v15;
      __int16 v29 = 1024;
      unsigned int v30 = v16;
      __int16 v31 = 2114;
      v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%.*s: %{public}@: mounted on %{private}@, %u bytes block size, %{public}@", buf, 0x36u);
      if (v17)
      {
      }
    }
  }
  *__error() = v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)mountedOnURL
{
  return self->_mountedOnURL;
}

- (NSString)mountedFrom
{
  return self->_mountedFrom;
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountedFrom, 0);

  objc_storeStrong((id *)&self->_mountedOnURL, 0);
}

@end