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
  v11 = (void *)[objc_alloc((Class)a1) initWithPath:v10 forRemoval:1 options:v7 error:a6];
  v12 = v11;
  if (v11) {
    char v13 = [v11 setAttributeCollectionToPath:v10 intent:v8 options:v7 forRemoval:1 error:a6];
  }
  else {
    char v13 = 0;
  }

  return v13;
}

- (TSUExtendedAttributeCollection)init
{
  return [(TSUExtendedAttributeCollection *)self initWithAttributes:MEMORY[0x263EFFA68]];
}

- (TSUExtendedAttributeCollection)initWithAttributes:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TSUExtendedAttributeCollection;
  v5 = [(TSUExtendedAttributeCollection *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    attributes = v5->_attributes;
    v5->_attributes = (NSMutableDictionary *)v6;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          char v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v14 = [v13 name];
          v15 = xattr_name_without_flags((const char *)[v14 UTF8String]);

          v16 = v5->_attributes;
          v17 = (void *)[[NSString alloc] initWithUTF8String:v15];
          [(NSMutableDictionary *)v16 setObject:v13 forKeyedSubscript:v17];

          free(v15);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
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
      goto LABEL_27;
    }
    uint64_t v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = 2;
LABEL_23:
    objc_msgSend(v26, "tsu_fileReadPOSIXErrorWithNumber:userInfo:", v27, 0);
    v29 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v12 = v11;
  ssize_t v13 = listxattr(v11, 0, 0, v7);
  if (v13 == -1)
  {
    if (!a6) {
      goto LABEL_27;
    }
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *__error();
    uint64_t v26 = v28;
    goto LABEL_23;
  }
  size_t v14 = v13;
  if (v13 < 1)
  {
    self = [(TSUExtendedAttributeCollection *)self init];
    v29 = self;
    goto LABEL_30;
  }
  v15 = (char *)malloc_type_malloc(v13, 0x100004077774924uLL);
  if (!v15)
  {
    if (a6)
    {
      uint64_t v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = 12;
      goto LABEL_23;
    }
LABEL_27:
    v29 = 0;
    goto LABEL_30;
  }
  v16 = v15;
  ssize_t v17 = listxattr(v12, v15, v14, v7);
  if (v17 == -1)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    free(v16);
    goto LABEL_27;
  }
  uint64_t v18 = v17;
  v33 = objc_opt_new();
  if (v18 < 1) {
    goto LABEL_29;
  }
  v31 = self;
  unint64_t v19 = 0x263F08000uLL;
  v32 = v16;
  long long v20 = v16;
  while (1)
  {
    long long v21 = (void *)[objc_alloc(*(Class *)(v19 + 2880)) initWithUTF8String:v20];
    if ([v21 hasPrefix:@"com.apple.security.private."])
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_57);
      }
      goto LABEL_13;
    }
    unint64_t v22 = v19;
    id v23 = [[TSUExtendedAttribute alloc] initFromPathFileSystemRepresentation:v12 name:v21 forRemoval:v8 options:v7 error:a6];
    if (!v23) {
      break;
    }
    objc_super v24 = v23;
    [v33 addObject:v23];

    unint64_t v19 = v22;
LABEL_13:
    size_t v25 = strlen(v20);
    v20 += v25 + 1;
    v18 -= v25 + 1;

    if (v18 <= 0)
    {
      self = v31;
      v16 = v32;
      goto LABEL_29;
    }
  }

  self = 0;
  v16 = v32;
LABEL_29:
  free(v16);
  self = [(TSUExtendedAttributeCollection *)self initWithAttributes:v33];

  v29 = self;
LABEL_30:

  return v29;
}

void __72__TSUExtendedAttributeCollection_initWithPath_forRemoval_options_error___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (BOOL)setAttributeCollectionToPath:(id)a3 intent:(unsigned int)a4 options:(int)a5 error:(id *)a6
{
  return [(TSUExtendedAttributeCollection *)self setAttributeCollectionToPath:a3 intent:*(void *)&a4 options:*(void *)&a5 forRemoval:0 error:a6];
}

- (BOOL)setAttributeCollectionToPath:(id)a3 intent:(unsigned int)a4 options:(int)a5 forRemoval:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v13 = [v12 fileSystemRepresentation];
  if (v13)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 1;
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    size_t v25 = __Block_byref_object_copy__15;
    uint64_t v26 = __Block_byref_object_dispose__15;
    id v27 = 0;
    attributes = self->_attributes;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __95__TSUExtendedAttributeCollection_setAttributeCollectionToPath_intent_options_forRemoval_error___block_invoke;
    v18[3] = &unk_264D61DB8;
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
    objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", 2, 0);
    BOOL v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __95__TSUExtendedAttributeCollection_setAttributeCollectionToPath_intent_options_forRemoval_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  int v9 = *(unsigned __int8 *)(a1 + 64);
  int v10 = [v8 shouldPreserveForIntent:*(unsigned int *)(a1 + 56)];
  if (v9)
  {
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(unsigned int *)(a1 + 60);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      id obj = *(id *)(v13 + 40);
      char v14 = [v8 setAttributeToPathFileSystemRepresentation:v11 options:v12 error:&obj];
      objc_storeStrong((id *)(v13 + 40), obj);
      if ((v14 & 1) == 0) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }
  }
  else if (v10)
  {
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(unsigned int *)(a1 + 60);
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    id v20 = *(id *)(v17 + 40);
    char v18 = [v8 setAttributeToPathFileSystemRepresentation:v15 options:v16 error:&v20];
    objc_storeStrong((id *)(v17 + 40), v20);
    if ((v18 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 0;
    }
  }
}

- (id)allAttributes
{
  return (id)[(NSMutableDictionary *)self->_attributes allValues];
}

- (id)extendedAttributeForName:(id)a3
{
  id v4 = (const char *)[a3 UTF8String];
  if (v4)
  {
    v5 = xattr_name_without_flags(v4);
    attributes = self->_attributes;
    id v7 = (void *)[[NSString alloc] initWithUTF8String:v5];
    id v8 = [(NSMutableDictionary *)attributes objectForKeyedSubscript:v7];

    free(v5);
  }
  else
  {
    id v8 = 0;
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
    id v8 = xattr_name_without_flags(v7);
    int v9 = [[TSUExtendedAttribute alloc] initWithName:v6 value:v12];
    attributes = self->_attributes;
    uint64_t v11 = (void *)[[NSString alloc] initWithUTF8String:v8];
    [(NSMutableDictionary *)attributes setObject:v9 forKeyedSubscript:v11];

    free(v8);
  }
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_attributes hash];
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
      char v8 = -[NSMutableDictionary isEqual:](attributes, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(TSUExtendedAttributeCollection *)self allAttributes];
  id v7 = [v3 stringWithFormat:@"<%@: %p attributes='%@'>", v5, self, v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end