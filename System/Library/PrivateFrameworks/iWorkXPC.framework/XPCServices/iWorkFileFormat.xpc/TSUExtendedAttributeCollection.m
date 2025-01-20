@interface TSUExtendedAttributeCollection
+ (BOOL)removeExtraExtendedAttributesAtPath:(id)a3 forIntent:(unsigned int)a4 options:(int)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)setAttributeCollectionToPath:(id)a3 intent:(unsigned int)a4 options:(int)a5 error:(id *)a6;
- (BOOL)setAttributeCollectionToPath:(id)a3 intent:(unsigned int)a4 options:(int)a5 forRemoval:(BOOL)a6 error:(id *)a7;
- (TSUExtendedAttributeCollection)init;
- (TSUExtendedAttributeCollection)initWithAttributes:(id)a3;
- (TSUExtendedAttributeCollection)initWithPath:(id)a3 forRemoval:(BOOL)a4 options:(int)a5 error:(id *)a6;
- (TSUExtendedAttributeCollection)initWithPath:(id)a3 options:(int)a4 error:(id *)a5;
- (id)allAttributes;
- (id)description;
- (id)extendedAttributeForName:(id)a3;
- (unint64_t)hash;
- (void)setExtendedAttributeValue:(id)a3 forName:(id)a4;
@end

@implementation TSUExtendedAttributeCollection

+ (BOOL)removeExtraExtendedAttributesAtPath:(id)a3 forIntent:(unsigned int)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPath:v10 forRemoval:1 options:v7 error:a6];
  v12 = v11;
  if (v11) {
    unsigned __int8 v13 = [v11 setAttributeCollectionToPath:v10 intent:v8 options:v7 forRemoval:1 error:a6];
  }
  else {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (TSUExtendedAttributeCollection)init
{
  return [(TSUExtendedAttributeCollection *)self initWithAttributes:&__NSArray0__struct];
}

- (TSUExtendedAttributeCollection)initWithAttributes:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TSUExtendedAttributeCollection;
  v5 = [(TSUExtendedAttributeCollection *)&v24 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
    attributes = v5->_attributes;
    v5->_attributes = v6;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v4;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v14 = [v13 name];
          v15 = xattr_name_without_flags((const char *)[v14 UTF8String]);

          v16 = v5->_attributes;
          id v17 = [objc_alloc((Class)NSString) initWithUTF8String:v15];
          [(NSMutableDictionary *)v16 setObject:v13 forKeyedSubscript:v17];

          free(v15);
        }
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    id v4 = v19;
  }

  return v5;
}

- (TSUExtendedAttributeCollection)initWithPath:(id)a3 options:(int)a4 error:(id *)a5
{
  return [(TSUExtendedAttributeCollection *)self initWithPath:a3 forRemoval:0 options:*(void *)&a4 error:a5];
}

- (TSUExtendedAttributeCollection)initWithPath:(id)a3 forRemoval:(BOOL)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = (const char *)[v10 fileSystemRepresentation];
  if (!v11)
  {
    if (!a6) {
      goto LABEL_28;
    }
    uint64_t v25 = 2;
LABEL_24:
    +[NSError tsu_fileReadPOSIXErrorWithNumber:v25 userInfo:0];
    v26 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v12 = v11;
  ssize_t v13 = listxattr(v11, 0, 0, v7);
  if (v13 == -1)
  {
    if (!a6) {
      goto LABEL_28;
    }
    uint64_t v25 = *__error();
    goto LABEL_24;
  }
  size_t v14 = v13;
  if (v13 < 1)
  {
    self = [(TSUExtendedAttributeCollection *)self init];
    v26 = self;
    goto LABEL_32;
  }
  v15 = (char *)malloc_type_malloc(v13, 0x100004077774924uLL);
  if (!v15)
  {
    if (a6)
    {
      uint64_t v25 = 12;
      goto LABEL_24;
    }
LABEL_28:
    v26 = 0;
    goto LABEL_32;
  }
  v16 = v15;
  ssize_t v17 = listxattr(v12, v15, v14, v7);
  if (v17 == -1)
  {
    if (a6)
    {
      *a6 = +[NSError tsu_fileReadPOSIXErrorWithNumber:*__error() userInfo:0];
    }
    free(v16);
    goto LABEL_28;
  }
  uint64_t v18 = v17;
  v29 = objc_opt_new();
  if (v18 < 1) {
    goto LABEL_31;
  }
  v28 = v16;
  id v19 = v16;
  while (1)
  {
    id v20 = [objc_alloc((Class)NSString) initWithUTF8String:v19];
    if ([v20 hasPrefix:@"com.apple.security.private."])
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CC988);
      }
      long long v21 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v31 = v20;
        __int16 v32 = 2080;
        v33 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Not reading the %@ xattr on \"%s\"", buf, 0x16u);
      }
      goto LABEL_15;
    }
    id v22 = [[TSUExtendedAttribute alloc] initFromPathFileSystemRepresentation:v12 name:v20 forRemoval:v8 options:v7 error:a6];
    if (!v22) {
      break;
    }
    long long v23 = v22;
    [v29 addObject:v22];

LABEL_15:
    size_t v24 = strlen(v19);
    v19 += v24 + 1;
    v18 -= v24 + 1;

    if (v18 <= 0) {
      goto LABEL_30;
    }
  }

  self = 0;
LABEL_30:
  v16 = v28;
LABEL_31:
  free(v16);
  self = [(TSUExtendedAttributeCollection *)self initWithAttributes:v29];

  v26 = self;
LABEL_32:

  return v26;
}

- (BOOL)setAttributeCollectionToPath:(id)a3 intent:(unsigned int)a4 options:(int)a5 error:(id *)a6
{
  return [(TSUExtendedAttributeCollection *)self setAttributeCollectionToPath:a3 intent:*(void *)&a4 options:*(void *)&a5 forRemoval:0 error:a6];
}

- (BOOL)setAttributeCollectionToPath:(id)a3 intent:(unsigned int)a4 options:(int)a5 forRemoval:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = [v12 fileSystemRepresentation];
  if (v13)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 1;
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = sub_10008A8CC;
    v26 = sub_10008A8DC;
    id v27 = 0;
    attributes = self->_attributes;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10008A8E4;
    v18[3] = &unk_1001CC9B0;
    BOOL v21 = a6;
    v18[5] = &v28;
    v18[6] = v13;
    unsigned int v19 = a4;
    int v20 = a5;
    v18[4] = &v22;
    [(NSMutableDictionary *)attributes enumerateKeysAndObjectsUsingBlock:v18];
    int v15 = *((unsigned __int8 *)v29 + 24);
    if (a7 && !*((unsigned char *)v29 + 24))
    {
      *a7 = (id) v23[5];
      int v15 = *((unsigned __int8 *)v29 + 24);
    }
    BOOL v16 = v15 != 0;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else if (a7)
  {
    +[NSError tsu_fileReadPOSIXErrorWithNumber:2 userInfo:0];
    BOOL v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)allAttributes
{
  return [(NSMutableDictionary *)self->_attributes allValues];
}

- (id)extendedAttributeForName:(id)a3
{
  id v4 = (const char *)[a3 UTF8String];
  if (v4)
  {
    v5 = xattr_name_without_flags(v4);
    attributes = self->_attributes;
    id v7 = [objc_alloc((Class)NSString) initWithUTF8String:v5];
    BOOL v8 = [(NSMutableDictionary *)attributes objectForKeyedSubscript:v7];

    free(v5);
  }
  else
  {
    BOOL v8 = 0;
  }
  return v8;
}

- (void)setExtendedAttributeValue:(id)a3 forName:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = (const char *)[v6 UTF8String];
  if (v7)
  {
    BOOL v8 = xattr_name_without_flags(v7);
    id v9 = [[TSUExtendedAttribute alloc] initWithName:v6 value:v12];
    attributes = self->_attributes;
    id v11 = [objc_alloc((Class)NSString) initWithUTF8String:v8];
    [(NSMutableDictionary *)attributes setObject:v9 forKeyedSubscript:v11];

    free(v8);
  }
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableDictionary *)self->_attributes hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = TSUDynamicCast(v5, (uint64_t)v4);

  if (v6)
  {
    attributes = self->_attributes;
    if ((unint64_t)attributes | v6[1]) {
      unsigned __int8 v8 = -[NSMutableDictionary isEqual:](attributes, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(TSUExtendedAttributeCollection *)self allAttributes];
  id v6 = +[NSString stringWithFormat:@"<%@: %p attributes='%@'>", v4, self, v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end