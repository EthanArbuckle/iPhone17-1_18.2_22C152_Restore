@interface TSUExtendedAttribute
+ (id)extendedAttributeFromPath:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6;
+ (id)extendedAttributeWithName:(id)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)setAttributeToPath:(id)a3 options:(int)a4 error:(id *)a5;
- (BOOL)setAttributeToPathFileSystemRepresentation:(const char *)a3 options:(int)a4 error:(id *)a5;
- (BOOL)shouldPreserveForIntent:(unsigned int)a3;
- (NSData)value;
- (NSString)name;
- (TSUExtendedAttribute)init;
- (TSUExtendedAttribute)initWithName:(id)a3 value:(id)a4;
- (id)description;
- (id)initFromPath:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6;
- (id)initFromPathFileSystemRepresentation:(const char *)a3 name:(id)a4 forRemoval:(BOOL)a5 options:(int)a6 error:(id *)a7;
- (unint64_t)hash;
@end

@implementation TSUExtendedAttribute

+ (id)extendedAttributeWithName:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithName:v7 value:v6];

  return v8;
}

+ (id)extendedAttributeFromPath:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [objc_alloc((Class)a1) initFromPath:v11 name:v10 options:v7 error:a6];

  return v12;
}

- (TSUExtendedAttribute)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CC928);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    id v11 = "-[TSUExtendedAttribute init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUExtendedAttribute.m";
    __int16 v14 = 1024;
    int v15 = 24;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUExtendedAttribute init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUExtendedAttribute.m"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:24 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUExtendedAttribute init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSUExtendedAttribute)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSUExtendedAttribute;
  id v8 = [(TSUExtendedAttribute *)&v14 init];
  if (v8)
  {
    unsigned int v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    id v11 = (NSData *)[v7 copy];
    value = v8->_value;
    v8->_value = v11;
  }
  return v8;
}

- (id)initFromPath:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = [a3 fileSystemRepresentation];
  if (v11)
  {
    self = (TSUExtendedAttribute *)[(TSUExtendedAttribute *)self initFromPathFileSystemRepresentation:v11 name:v10 forRemoval:0 options:v7 error:a6];
    __int16 v12 = self;
  }
  else if (a6)
  {
    +[NSError tsu_fileReadPOSIXErrorWithNumber:2 userInfo:0];
    __int16 v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v12 = 0;
  }

  return v12;
}

- (id)initFromPathFileSystemRepresentation:(const char *)a3 name:(id)a4 forRemoval:(BOOL)a5 options:(int)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  v13 = (const char *)[v12 UTF8String];
  if (!v13)
  {
    if (a7)
    {
      uint64_t v15 = 22;
LABEL_23:
      +[NSError tsu_fileReadPOSIXErrorWithNumber:v15 userInfo:0];
      objc_super v14 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_30:
    objc_super v14 = 0;
    goto LABEL_31;
  }
  if (!v9)
  {
    v16 = v13;
    ssize_t v17 = getxattr(a3, v13, 0, 0, 0, a6);
    if (!v17)
    {
      id v19 = objc_alloc_init((Class)NSData);
LABEL_20:
      v27 = v19;
      self = [(TSUExtendedAttribute *)self initWithName:v12 value:v19];

      objc_super v14 = self;
      goto LABEL_31;
    }
    size_t v18 = v17;
    if (v17 == -1)
    {
      if (a7)
      {
        uint64_t v15 = *__error();
        goto LABEL_23;
      }
      goto LABEL_30;
    }
    v20 = malloc_type_malloc(v17, 0xBE6614CEuLL);
    if (!v20)
    {
      if (a7)
      {
        uint64_t v15 = 12;
        goto LABEL_23;
      }
      goto LABEL_30;
    }
    v21 = v20;
    ssize_t v22 = getxattr(a3, v16, v20, v18, 0, a6);
    if (v22 != -1)
    {
      if (v22 != v18)
      {
        int v23 = +[TSUAssertionHandler _atomicIncrementAssertCount];
        if (TSUAssertCat_init_token != -1) {
          dispatch_once(&TSUAssertCat_init_token, &stru_1001CC968);
        }
        v24 = TSUAssertCat_log_t;
        if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_100165C24(v23, v24);
        }
        v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUExtendedAttribute initFromPathFileSystemRepresentation:name:forRemoval:options:error:]");
        v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUExtendedAttribute.m"];
        +[TSUAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:80 isFatal:0 description:"Unexpected result."];

        +[TSUAssertionHandler logBacktraceThrottled];
      }
      id v19 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v21 length:v18 freeWhenDone:1];
      goto LABEL_20;
    }
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CC948);
    }
    v28 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
    {
      sub_100165B9C((uint64_t)v16, (uint64_t)a3, v28);
      if (!a7) {
        goto LABEL_29;
      }
    }
    else if (!a7)
    {
LABEL_29:
      free(v21);
      goto LABEL_30;
    }
    *a7 = +[NSError tsu_fileReadPOSIXErrorWithNumber:*__error() userInfo:0];
    goto LABEL_29;
  }
  self = [(TSUExtendedAttribute *)self initWithName:v12 value:0];
  objc_super v14 = self;
LABEL_31:

  return v14;
}

- (BOOL)shouldPreserveForIntent:(unsigned int)a3
{
  v4 = [(NSString *)self->_name UTF8String];
  if (v4) {
    LOBYTE(v4) = xattr_preserve_for_intent(v4, a3) != 0;
  }
  return (char)v4;
}

- (BOOL)setAttributeToPath:(id)a3 options:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = [a3 fileSystemRepresentation];
  if (v8)
  {
    return [(TSUExtendedAttribute *)self setAttributeToPathFileSystemRepresentation:v8 options:v6 error:a5];
  }
  else
  {
    if (a5)
    {
      *a5 = +[NSError tsu_fileReadPOSIXErrorWithNumber:2 userInfo:0];
    }
    return 0;
  }
}

- (BOOL)setAttributeToPathFileSystemRepresentation:(const char *)a3 options:(int)a4 error:(id *)a5
{
  BOOL v9 = [(NSString *)self->_name UTF8String];
  if (!v9)
  {
LABEL_5:
    if (a5)
    {
      uint64_t v14 = 22;
LABEL_15:
      id v17 = +[NSError tsu_fileReadPOSIXErrorWithNumber:v14 userInfo:0];
      BOOL result = 0;
      *a5 = v17;
      return result;
    }
    return 0;
  }
  id v10 = v9;
  value = self->_value;
  if (value)
  {
    NSUInteger v12 = [(NSData *)value length];
    if (v12)
    {
      v13 = [(NSData *)self->_value bytes];
      if (!v13) {
        goto LABEL_5;
      }
    }
    else
    {
      v13 = "";
    }
    int v15 = setxattr(a3, v10, v13, v12, 0, a4);
  }
  else
  {
    if (!strcmp(v10, "com.apple.quarantine")) {
      return 1;
    }
    int v15 = removexattr(a3, v10, a4);
  }
  if (v15 != -1) {
    return 1;
  }
  if (a5)
  {
    uint64_t v14 = *__error();
    goto LABEL_15;
  }
  return 0;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return (unint64_t)[(NSData *)self->_value hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = TSUDynamicCast(v5, (uint64_t)v4);

  if (v6)
  {
    name = self->_name;
    uint64_t v8 = [v6 name];
    if ((unint64_t)name | v8 && ![(NSString *)name isEqual:v8])
    {
      unsigned __int8 v11 = 0;
    }
    else
    {
      value = self->_value;
      uint64_t v10 = [v6 value];
      if ((unint64_t)value | v10) {
        unsigned __int8 v11 = [(NSData *)value isEqual:v10];
      }
      else {
        unsigned __int8 v11 = 1;
      }
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)description
{
  NSUInteger v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = +[NSString stringWithFormat:@"<%@: %p name='%@' value=%@>", v4, self, self->_name, self->_value];

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end