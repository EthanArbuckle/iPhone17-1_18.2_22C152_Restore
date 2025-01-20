@interface _DPMLSQLQueryValidator
+ (id)isValidSQLQuery:(id)a3 forNamespaceID:(id)a4 possibleError:(id *)a5;
+ (id)parseQueryPermissionList:(id)a3 error:(id *)a4;
+ (id)sharedInstanceWithError:(id *)a3;
- (NSDictionary)allowList;
- (NSDictionary)blockList;
- (_DPMLSQLQueryValidator)initWithAllowList:(id)a3 blockList:(id)a4;
- (void)setAllowList:(id)a3;
- (void)setBlockList:(id)a3;
@end

@implementation _DPMLSQLQueryValidator

- (_DPMLSQLQueryValidator)initWithAllowList:(id)a3 blockList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DPMLSQLQueryValidator;
  v9 = [(_DPMLSQLQueryValidator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_allowList, a3);
    objc_storeStrong((id *)&v10->_blockList, a4);
  }

  return v10;
}

+ (id)parseQueryPermissionList:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSDictionary dictionaryWithContentsOfURL:v5];
  id v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      v28 = +[_DPMLRuntimeError errorWithCode:300 description:@"Cannot load allow-list from class bundle file"];
      id v29 = *a4;
      *a4 = v28;
    }
    v13 = 0;
    id v14 = 0;
    id v30 = 0;
    goto LABEL_36;
  }
  id v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v9 = [v7 allKeys];
  id v10 = [v9 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (!v10)
  {
    id v11 = 0;
    objc_super v12 = 0;
    v13 = 0;
    id v14 = 0;
    goto LABEL_24;
  }
  v38 = a4;
  id v11 = 0;
  objc_super v12 = 0;
  v13 = 0;
  id v14 = 0;
  uint64_t v15 = *(void *)v51;
  v44 = v9;
  uint64_t v36 = *(void *)v51;
LABEL_4:
  uint64_t v16 = 0;
  v17 = v12;
  id v37 = v10;
LABEL_5:
  if (*(void *)v51 != v15)
  {
    uint64_t v18 = v16;
    objc_enumerationMutation(v9);
    uint64_t v16 = v18;
  }
  uint64_t v40 = v16;
  uint64_t v19 = *(void *)(*((void *)&v50 + 1) + 8 * v16);
  v20 = objc_msgSend(v7, "objectForKey:", v19, v36);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v39 = v19;
    objc_super v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v20 count]);

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v11 = v20;
    id v21 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (!v21) {
      goto LABEL_17;
    }
    id v22 = v21;
    uint64_t v23 = *(void *)v47;
    v42 = v8;
    id v43 = v5;
    v41 = v7;
LABEL_10:
    v24 = 0;
    v25 = v13;
    v26 = v14;
    while (1)
    {
      if (*(void *)v47 != v23) {
        objc_enumerationMutation(v11);
      }
      uint64_t v27 = *(void *)(*((void *)&v46 + 1) + 8 * (void)v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v45 = v26;
      v13 = +[NSRegularExpression regularExpressionWithPattern:v27 options:16 error:&v45];
      id v14 = v45;

      if (!v13)
      {
        v31 = v38;
        if (v38)
        {
          uint64_t v32 = +[_DPMLRuntimeError errorWithCode:300 underlyingError:v14 description:@"Permission list has a malformed regex value"];
          v25 = 0;
          goto LABEL_29;
        }
        v13 = 0;
        goto LABEL_32;
      }
      [v12 addObject:v13];
      v24 = (char *)v24 + 1;
      v25 = v13;
      v26 = v14;
      if (v22 == v24)
      {
        id v22 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
        id v8 = v42;
        id v5 = v43;
        id v7 = v41;
        if (v22) {
          goto LABEL_10;
        }
LABEL_17:

        [v8 setObject:v12 forKey:v39];
        uint64_t v16 = v40 + 1;
        v17 = v12;
        uint64_t v15 = v36;
        v9 = v44;
        if ((id)(v40 + 1) == v37)
        {
          id v10 = [v44 countByEnumeratingWithState:&v50 objects:v55 count:16];
          if (!v10)
          {
LABEL_24:

            id v30 = v8;
            v17 = v12;
            v20 = v11;
            goto LABEL_35;
          }
          goto LABEL_4;
        }
        goto LABEL_5;
      }
    }
    v31 = v38;
    if (v38)
    {
      uint64_t v32 = +[_DPMLRuntimeError errorWithCode:300 description:@"Permission list value has a non-string item"];
      id v14 = v26;
LABEL_29:
      id v7 = v41;
      v9 = v44;
      v33 = *v31;
      *v31 = (void *)v32;

      v13 = v25;
      id v8 = v42;
      id v5 = v43;
      goto LABEL_33;
    }
    v13 = v25;
    id v14 = v26;
LABEL_32:
    id v8 = v42;
    id v5 = v43;
    id v7 = v41;
    v9 = v44;
    goto LABEL_33;
  }
  if (v38)
  {
    uint64_t v35 = +[_DPMLRuntimeError errorWithCode:300 description:@"Permission list has a non-list value"];
    id v11 = *v38;
    id *v38 = (id)v35;
    objc_super v12 = v17;
LABEL_33:

    v17 = v12;
  }

  id v30 = 0;
LABEL_35:

LABEL_36:
  return v30;
}

+ (id)sharedInstanceWithError:(id *)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000175F4;
  block[3] = &unk_1000305F0;
  block[4] = a1;
  if (qword_10003DD10 == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10003DD10, block);
  if (a3) {
LABEL_3:
  }
    objc_storeStrong(a3, (id)qword_10003DD08);
LABEL_4:
  v4 = (void *)qword_10003DD00;
  return v4;
}

+ (id)isValidSQLQuery:(id)a3 forNamespaceID:(id)a4 possibleError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v7 length])
  {
    if (!a5)
    {
LABEL_29:
      v25 = 0;
      goto LABEL_30;
    }
    CFStringRef v26 = @"SQL query needs to be a non-empty string";
LABEL_28:
    uint64_t v27 = +[_DPMLRuntimeError errorWithCode:300 description:v26];
    id v28 = *a5;
    *a5 = v27;

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a5) {
      goto LABEL_29;
    }
    CFStringRef v26 = @"Namespace Identifier needs to be a string";
    goto LABEL_28;
  }
  id v39 = 0;
  v9 = +[_DPMLSQLQueryValidator sharedInstanceWithError:&v39];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 blockList];
    objc_super v12 = [v11 objectForKey:v8];

    if (v12)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v36;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v36 != v16) {
              objc_enumerationMutation(v13);
            }
            if (objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "numberOfMatchesInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length")))
            {
              v25 = +[NSNumber numberWithBool:0];

              objc_super v12 = v13;
              goto LABEL_40;
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v35 objects:v41 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v18 = [v10 allowList];
    uint64_t v19 = [v18 objectForKey:v8];

    if (v19)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v20 = v19;
      id v21 = [v20 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v32;
        while (2)
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v32 != v23) {
              objc_enumerationMutation(v20);
            }
            if (objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)j), "numberOfMatchesInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length", (void)v31)))
            {
              v25 = +[NSNumber numberWithBool:1];

              goto LABEL_39;
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
    }
    v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0, (void)v31);
LABEL_39:
  }
  else
  {
    if (!a5)
    {
      v25 = 0;
      goto LABEL_41;
    }
    id v30 = +[_DPMLRuntimeError errorWithCode:300 underlyingError:v39 description:@"Cannot create SQL query validator"];
    v25 = 0;
    objc_super v12 = *a5;
    *a5 = v30;
  }
LABEL_40:

LABEL_41:
LABEL_30:

  return v25;
}

- (NSDictionary)allowList
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllowList:(id)a3
{
}

- (NSDictionary)blockList
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBlockList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockList, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
}

@end