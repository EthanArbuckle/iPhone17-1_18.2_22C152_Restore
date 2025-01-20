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
  v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 value:v6];

  return v8;
}

+ (id)extendedAttributeFromPath:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) initFromPath:v11 name:v10 options:v7 error:a6];

  return v12;
}

- (TSUExtendedAttribute)init
{
  v2 = [NSString stringWithUTF8String:"-[TSUExtendedAttribute init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUExtendedAttribute.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:24 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUExtendedAttribute init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSUExtendedAttribute)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSUExtendedAttribute;
  v8 = [(TSUExtendedAttribute *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSData *)v11;
  }
  return v8;
}

- (id)initFromPath:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  uint64_t v11 = [a3 fileSystemRepresentation];
  if (v11)
  {
    self = (TSUExtendedAttribute *)[(TSUExtendedAttribute *)self initFromPathFileSystemRepresentation:v11 name:v10 forRemoval:0 options:v7 error:a6];
    v12 = self;
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
    v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
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
    if (!a7) {
      goto LABEL_21;
    }
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = 22;
LABEL_16:
    objc_msgSend(v15, "tsu_fileReadPOSIXErrorWithNumber:userInfo:", v16, 0);
    objc_super v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v9)
  {
    self = [(TSUExtendedAttribute *)self initWithName:v12 value:0];
    objc_super v14 = self;
    goto LABEL_22;
  }
  v17 = v13;
  ssize_t v18 = getxattr(a3, v13, 0, 0, 0, a6);
  if (v18 == -1)
  {
    if (!a7) {
      goto LABEL_21;
    }
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *__error();
    v15 = v26;
    goto LABEL_16;
  }
  size_t v19 = v18;
  v20 = malloc_type_malloc(v18, 0xB14D187EuLL);
  if (!v20)
  {
    if (a7)
    {
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = 12;
      goto LABEL_16;
    }
LABEL_21:
    objc_super v14 = 0;
    goto LABEL_22;
  }
  v21 = v20;
  ssize_t v22 = getxattr(a3, v17, v20, v19, 0, a6);
  if (v22 == -1)
  {
    if (TSUDefaultCat_init_token == -1)
    {
      if (!a7)
      {
LABEL_20:
        free(v21);
        goto LABEL_21;
      }
    }
    else
    {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_33);
      if (!a7) {
        goto LABEL_20;
      }
    }
    objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v22 != v19)
  {
    v23 = [NSString stringWithUTF8String:"-[TSUExtendedAttribute initFromPathFileSystemRepresentation:name:forRemoval:options:error:]"];
    v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUExtendedAttribute.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:79 isFatal:0 description:"Unexpected result."];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v25 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v21 length:v19 freeWhenDone:1];
  self = [(TSUExtendedAttribute *)self initWithName:v12 value:v25];

  objc_super v14 = self;
LABEL_22:

  return v14;
}

void __91__TSUExtendedAttribute_initFromPathFileSystemRepresentation_name_forRemoval_options_error___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
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
  uint64_t v8 = [a3 fileSystemRepresentation];
  if (v8)
  {
    return [(TSUExtendedAttribute *)self setAttributeToPathFileSystemRepresentation:v8 options:v6 error:a5];
  }
  else
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
}

- (BOOL)setAttributeToPathFileSystemRepresentation:(const char *)a3 options:(int)a4 error:(id *)a5
{
  BOOL v9 = [(NSString *)self->_name UTF8String];
  if (v9)
  {
    id v10 = v9;
    value = self->_value;
    if (!value)
    {
      if (!strcmp(v10, "com.apple.quarantine")) {
        return 1;
      }
      int v13 = removexattr(a3, v10, a4);
LABEL_9:
      if (v13 != -1) {
        return 1;
      }
      if (a5)
      {
        v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v15 = *__error();
        objc_super v14 = v17;
        goto LABEL_13;
      }
      return 0;
    }
    id v12 = [(NSData *)value bytes];
    if (v12)
    {
      int v13 = setxattr(a3, v10, v12, [(NSData *)self->_value length], 0, a4);
      goto LABEL_9;
    }
  }
  if (a5)
  {
    objc_super v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = 22;
LABEL_13:
    objc_msgSend(v14, "tsu_fileReadPOSIXErrorWithNumber:userInfo:", v15, 0);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a5 = v18;
    return result;
  }
  return 0;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSData *)self->_value hash] ^ v3;
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
      char v11 = 0;
    }
    else
    {
      value = self->_value;
      uint64_t v10 = [v6 value];
      if ((unint64_t)value | v10) {
        char v11 = [(NSData *)value isEqual:v10];
      }
      else {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  NSUInteger v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p name='%@' value=%@>", v5, self, self->_name, self->_value];

  return v6;
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