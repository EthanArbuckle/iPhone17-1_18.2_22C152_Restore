@interface KCSharingRowMapper
- (Class)model;
- (KCSharingRowMapper)initWithModel:(Class)a3;
- (id)columnNamesWithTableName:(id)a3;
- (id)mapResultRow:(sqlite3_stmt *)a3 startingAt:(unint64_t)a4 error:(id *)a5;
- (unint64_t)columnCount;
@end

@implementation KCSharingRowMapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_boxedAttrs, 0);
}

- (Class)model
{
  return self->_model;
}

- (id)mapResultRow:(sqlite3_stmt *)a3 startingAt:(unint64_t)a4 error:(id *)a5
{
  v9 = [(objc_class *)self->_model databaseItemClass];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v23 = sub_1000F8AE4;
  v24 = &unk_1002F9FA0;
  v25 = self;
  unint64_t v26 = a4;
  uint64_t v10 = sub_10011AD64(0, (uint64_t)v9, dword_10035D2B0, 0);
  uint64_t v11 = 0;
  char v27 = 0;
  do
  {
    uint64_t v12 = (uint64_t)v23((uint64_t)v22, v11, &v27);
    if (v12)
    {
      v13 = (unsigned char *)v12;
      v14 = sub_10011AE7C(0, a3, v12, v11);
      if (!v14)
      {
        if (v10) {
          CFRelease((CFTypeRef)v10);
        }
        goto LABEL_16;
      }
      v15 = v14;
      v16 = *(__CFDictionary **)(v10 + 48);
      v17 = (const void *)sub_100119A68(v13);
      CFDictionarySetValue(v16, v17, v15);
      CFRelease(v15);
    }
    uint64_t v11 = (v11 + 1);
  }
  while (!v27);
  v18 = (const void **)sub_100118974(v9, 9, 0);
  if (v18)
  {
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(v10 + 48), *v18)) {
      *(_DWORD *)(v10 + 40) = 1;
    }
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_10:
    id v19 = (id)v10;
    goto LABEL_11;
  }
LABEL_16:
  if (a5)
  {
    id v21 = 0;
    id v19 = 0;
    *a5 = 0;
  }
  else
  {
    id v19 = 0;
  }
LABEL_11:

  return v19;
}

- (id)columnNamesWithTableName:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = self->_boxedAttrs;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v4)
        {
          uint64_t v12 = [v11 pointerValue];
          id v13 = +[NSString stringWithFormat:@"%@.%@", v4, *v12, (void)v17];
        }
        else
        {
          id v13 = *(id *)[v11 pointerValue];
        }
        v14 = v13;
        [v5 addObject:v13];
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = [v5 copy];

  return v15;
}

- (unint64_t)columnCount
{
  return [(NSArray *)self->_boxedAttrs count];
}

- (KCSharingRowMapper)initWithModel:(Class)a3
{
  v19.receiver = self;
  v19.super_class = (Class)KCSharingRowMapper;
  id v4 = [(KCSharingRowMapper *)&v19 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_model, a3);
    v6 = [(objc_class *)v5->_model requiredAttributeKeys];
    id v7 = +[NSMutableArray array];
    id v8 = [(objc_class *)a3 databaseItemClass];
    uint64_t v9 = v8[2];
    if (v9)
    {
      uint64_t v10 = v8 + 3;
      do
      {
        int v11 = *(_DWORD *)(v9 + 8);
        BOOL v12 = (v11 - 6) < 4 || v11 == 16;
        if (v12
          || (uint64_t v15 = *(void *)(v9 + 16), (v15 & 2) != 0)
          && ((v15 & 0x101) != 0 || [v6 containsObject:*(void *)v9]))
        {
          id v13 = +[NSValue valueWithPointer:v9];
          [v7 addObject:v13];
        }
        uint64_t v14 = *v10++;
        uint64_t v9 = v14;
      }
      while (v14);
    }
    v16 = (NSArray *)[v7 copy];
    boxedAttrs = v5->_boxedAttrs;
    v5->_boxedAttrs = v16;
  }
  return v5;
}

@end