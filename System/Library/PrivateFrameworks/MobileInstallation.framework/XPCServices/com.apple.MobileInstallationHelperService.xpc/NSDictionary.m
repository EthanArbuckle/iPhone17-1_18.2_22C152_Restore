@interface NSDictionary
+ (id)MI_dictionaryByMergingDictionaries:(id)a3;
+ (id)MI_dictionaryWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (BOOL)MI_writeToURL:(id)a3 format:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6;
@end

@implementation NSDictionary

+ (id)MI_dictionaryWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v16 = 0;
  v7 = +[NSData dataWithContentsOfURL:a3 options:2 error:&v16];
  id v8 = v16;
  if (v7)
  {
    id v15 = 0;
    v9 = +[NSPropertyListSerialization propertyListWithData:v7 options:a4 format:0 error:&v15];
    id v10 = v15;

    objc_opt_class();
    id v11 = v9;
    id v12 = 0;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }

    if (v12)
    {
      id v13 = v11;
      id v8 = v10;
      id v11 = v13;
      if (!a5) {
        goto LABEL_12;
      }
    }
    else
    {
      id v8 = +[NSError errorWithDomain:NSCocoaErrorDomain code:2048 userInfo:0];

      id v13 = 0;
      if (!a5) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    id v13 = 0;
    id v11 = 0;
    if (!a5) {
      goto LABEL_12;
    }
  }
  if (!v13) {
    *a5 = v8;
  }
LABEL_12:

  return v13;
}

+ (id)MI_dictionaryByMergingDictionaries:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addEntriesFromDictionary:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v10 = [v4 copy];
  return v10;
}

- (BOOL)MI_writeToURL:(id)a3 format:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v18 = 0;
  id v11 = +[NSPropertyListSerialization dataWithPropertyList:self format:a4 options:0 error:&v18];
  id v12 = v18;
  long long v13 = v12;
  if (v11)
  {
    id v17 = v12;
    unsigned __int8 v14 = [v11 writeToURL:v10 options:a5 error:&v17];
    id v15 = v17;

    long long v13 = v15;
    if (!a6) {
      goto LABEL_7;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
    if (!a6) {
      goto LABEL_7;
    }
  }
  if ((v14 & 1) == 0) {
    *a6 = v13;
  }
LABEL_7:

  return v14;
}

- (BOOL)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v16 = 0;
  v9 = +[NSPropertyListSerialization dataWithPropertyList:self format:a4 options:0 error:&v16];
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    id v15 = v10;
    unsigned __int8 v12 = objc_msgSend(v9, "MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:", v8, &v15);
    id v13 = v15;

    id v11 = v13;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if ((v12 & 1) == 0) {
    *a5 = v11;
  }
LABEL_7:

  return v12;
}

@end