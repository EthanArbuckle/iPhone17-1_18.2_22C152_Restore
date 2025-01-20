@interface DiskImageGraphNodeNative
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)deleteImage;
- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8;
- (NSURL)filePath;
- (id)URL;
- (id)toDIShadowNode;
- (id)toDictionary;
- (void)setFilePath:(id)a3;
@end

@implementation DiskImageGraphNodeNative

- (id)toDIShadowNode
{
  v3 = [DIShadowNode alloc];
  v4 = [(DiskImageGraphNodeNative *)self filePath];
  v5 = [(DIShadowNode *)v3 initWithURL:v4 isCache:[(DiskImageGraphNode *)self isCache]];

  return v5;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  v6 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DiskImageGraphNodeNative;
  if (objc_msgSendSuper2(&v10, "validateWithDictionary:error:", v6, a4))
  {
    BOOL v7 = 0;
    if ([v6 validateAndPopObjectForKey:@"FilePath" className:objc_opt_class() isOptional:0 error:a4])
    {
      if ([v6 count])
      {
        v8 = +[NSString stringWithFormat:@"Validation failed, input contains unexpected data."];
        BOOL v7 = +[DIError failWithPOSIXCode:22 verboseInfo:v8 error:a4];
      }
      else
      {
        BOOL v7 = 1;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (+[DiskImageGraphNodeNative validateWithDictionary:v10 error:a6])
  {
    v19.receiver = self;
    v19.super_class = (Class)DiskImageGraphNodeNative;
    self = [(DiskImageGraphNode *)&v19 initWithDictionary:v10 updateChangesToDict:v8 workDir:v11 error:a6];
    if (!self) {
      goto LABEL_4;
    }
    uint64_t v12 = [v10 objectForKey:@"FilePath"];
    v13 = +[NSURL fileURLWithPath:v12 relativeToURL:v11];
    filePath = self->_filePath;
    self->_filePath = v13;

    v15 = [(DiskImageGraphNodeNative *)self filePath];
    LOBYTE(v12) = [v15 checkResourceIsReachableAndReturnError:a6];

    if ((v12 & 1) == 0)
    {
      v16 = +[DIError nilWithPOSIXCode:2 verboseInfo:@"Image referenced in the pstack is unreachable." error:a6];
    }
    else
    {
LABEL_4:
      v16 = self;
      self = v16;
    }
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DiskImageGraphNodeNative;
  v16 = [(DiskImageGraphNode *)&v19 initWithTag:a4 UUID:a5 parentNode:a6 metadata:a7 isCache:v8];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_filePath, a3);
  }

  return v17;
}

- (void)setFilePath:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_filePath, a3);
  v5 = [(DiskImageGraphNode *)self pstackDict];

  if (v5)
  {
    v6 = [(DiskImageGraphNode *)self pstackDict];
    BOOL v7 = [v8 relativeString];
    [v6 setObject:v7 forKey:@"FilePath"];
  }
}

- (BOOL)deleteImage
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(DiskImageGraphNodeNative *)self filePath];
  id v16 = 0;
  unsigned __int8 v5 = [v3 removeItemAtURL:v4 error:&v16];
  id v6 = v16;

  if ((v5 & 1) == 0)
  {
    int v7 = *__error();
    if (sub_1000D29A0())
    {
      id v8 = sub_1000D2920();
      os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      v9 = [(DiskImageGraphNodeNative *)self filePath];
      id v10 = [v6 description];
      *(_DWORD *)buf = 68158466;
      int v18 = 39;
      __int16 v19 = 2080;
      v20 = "-[DiskImageGraphNodeNative deleteImage]";
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 2112;
      v24 = v10;
      id v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf(__stderrp, "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      uint64_t v12 = sub_1000D2920();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [(DiskImageGraphNodeNative *)self filePath];
        v14 = [v6 description];
        *(_DWORD *)buf = 68158466;
        int v18 = 39;
        __int16 v19 = 2080;
        v20 = "-[DiskImageGraphNodeNative deleteImage]";
        __int16 v21 = 2112;
        v22 = v13;
        __int16 v23 = 2112;
        v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%.*s: Failed to delete %@: %@", buf, 0x26u);
      }
    }
    *__error() = v7;
  }

  return v5;
}

- (id)toDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)DiskImageGraphNodeNative;
  v3 = [(DiskImageGraphNode *)&v8 toDictionary];
  id v4 = [v3 mutableCopy];

  unsigned __int8 v5 = [(DiskImageGraphNodeNative *)self filePath];
  id v6 = [v5 relativePath];
  [v4 setObject:v6 forKeyedSubscript:@"FilePath"];

  return v4;
}

- (id)URL
{
  return self->_filePath;
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
}

@end