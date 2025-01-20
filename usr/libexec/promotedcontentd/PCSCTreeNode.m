@interface PCSCTreeNode
+ (id)_convertOperator:(int64_t)a3;
+ (id)_translateChildNodesToExpressionFormat:(id)a3 dataDictionary:(id)a4 error:(id *)a5;
+ (id)_translateNodeToDataAdaptor:(id)a3 dataDictionary:(id)a4 error:(id *)a5;
+ (id)_translateRootNodeToExpressionFormat:(id)a3 error:(id *)a4;
- (NSDictionary)opTokens;
- (NSDictionary)typeTokens;
- (NSDictionary)value;
- (NSMutableArray)children;
- (PCSCTreeNode)initWithExpression:(id)a3 version:(int64_t)a4 andParent:(id)a5 error:(id *)a6;
- (PCSCTreeNode)parent;
- (id)description;
- (int)level;
- (int64_t)operator;
- (int64_t)type;
- (int64_t)version;
- (void)setChildren:(id)a3;
- (void)setOpTokens:(id)a3;
- (void)setOperator:(int64_t)a3;
- (void)setParent:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setTypeTokens:(id)a3;
- (void)setValue:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PCSCTreeNode

- (PCSCTreeNode)initWithExpression:(id)a3 version:(int64_t)a4 andParent:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v55.receiver = self;
  v55.super_class = (Class)PCSCTreeNode;
  v12 = [(PCSCTreeNode *)&v55 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_53;
  }
  objc_storeWeak((id *)&v12->_parent, v11);
  v13->_version = a4;
  if ([(PCSCTreeNode *)v13 level] >= 6)
  {
    if (!a6) {
      goto LABEL_53;
    }
    uint64_t v14 = -1111;
LABEL_5:
    +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:v14 userInfo:0];
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  opTokens = v13->_opTokens;
  v13->_opTokens = (NSDictionary *)&off_10024B570;

  typeTokens = v13->_typeTokens;
  v13->_typeTokens = (NSDictionary *)&off_10024B598;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a6) {
        goto LABEL_53;
      }
      uint64_t v14 = -1112;
      goto LABEL_5;
    }
    v38 = (NSDictionary *)v10;
    v39 = v13->_typeTokens;
    v40 = [(NSDictionary *)v38 objectForKeyedSubscript:@"type"];
    v41 = [(NSDictionary *)v39 objectForKeyedSubscript:v40];
    -[PCSCTreeNode setType:](v13, "setType:", [v41 integerValue]);

    if ((id)[(PCSCTreeNode *)v13 type] != (id)1)
    {
      if (a6)
      {
        *a6 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1120 userInfo:0];
      }

      goto LABEL_53;
    }
    v42 = APLogForCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = +[APIDAccountProvider privateUserAccount];
      v44 = [v43 iTunesDSID];
      *(_DWORD *)buf = 136643587;
      v57 = "-[PCSCTreeNode initWithExpression:version:andParent:error:]";
      __int16 v58 = 2114;
      v59 = v38;
      __int16 v60 = 2160;
      uint64_t v61 = 1752392040;
      __int16 v62 = 2112;
      v63 = v44;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[%{sensitive}s]: found StatusCondition node: %{public}@. DSID %{mask.hash}@", buf, 0x2Au);
    }
    value = v13->_value;
    v13->_value = v38;
    goto LABEL_30;
  }
  id v49 = v11;
  id v18 = v10;
  v19 = +[NSMutableArray array];
  [(PCSCTreeNode *)v13 setChildren:v19];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  value = (NSDictionary *)v18;
  id v21 = [(NSDictionary *)value countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (!v21) {
    goto LABEL_21;
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v52;
  while (2)
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v52 != v23) {
        objc_enumerationMutation(value);
      }
      v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = v25;
        v27 = [(NSDictionary *)v13->_opTokens objectForKey:v26];
        id v28 = [v27 integerValue];

        if (v28)
        {
          if (![(PCSCTreeNode *)v13 operator])
          {
            [(PCSCTreeNode *)v13 setOperator:v28];
            goto LABEL_19;
          }
          if (a6)
          {
            uint64_t v45 = -1118;
            goto LABEL_44;
          }
        }
        else if (a6)
        {
          uint64_t v45 = -1110;
LABEL_44:
          id v11 = v49;
          *a6 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:v45 userInfo:0];
          v32 = v26;
          goto LABEL_51;
        }
        v32 = v26;
        goto LABEL_50;
      }
      v29 = [PCSCTreeNode alloc];
      id v30 = [(PCSCTreeNode *)v13 version];
      id v50 = 0;
      v26 = [(PCSCTreeNode *)v29 initWithExpression:v25 version:v30 andParent:v13 error:&v50];
      v31 = (PCSCTreeNode *)v50;
      v32 = v31;
      if (v31 || !v26)
      {
        if (a6 && v31) {
          *a6 = v31;
        }

LABEL_50:
        id v11 = v49;
LABEL_51:

        goto LABEL_52;
      }
      v33 = [(PCSCTreeNode *)v13 children];
      [v33 addObject:v26];

LABEL_19:
    }
    id v22 = [(NSDictionary *)value countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_21:

  int64_t operator = v13->_operator;
  if ((unint64_t)(operator - 1) >= 2)
  {
    id v11 = v49;
    if (operator == 3)
    {
      v46 = [(PCSCTreeNode *)v13 children];
      id v47 = [v46 count];

      if (v47 == (id)1) {
        goto LABEL_30;
      }
      if (!a6) {
        goto LABEL_52;
      }
      uint64_t v37 = -1115;
    }
    else
    {
      if (!a6) {
        goto LABEL_52;
      }
      uint64_t v37 = -1110;
    }
LABEL_57:
    *a6 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:v37 userInfo:0];
    goto LABEL_52;
  }
  v35 = [(PCSCTreeNode *)v13 children];
  id v36 = [v35 count];

  id v11 = v49;
  if ((unint64_t)v36 > 1)
  {
LABEL_30:

    v15 = v13;
    goto LABEL_54;
  }
  if (a6)
  {
    uint64_t v37 = -1114;
    goto LABEL_57;
  }
LABEL_52:

LABEL_53:
  v15 = 0;
LABEL_54:

  return v15;
}

- (int)level
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (!WeakRetained) {
    return 0;
  }
  v3 = WeakRetained;
  int v4 = 0;
  do
  {
    ++v4;
    uint64_t v5 = [v3 parent];

    v3 = (void *)v5;
  }
  while (v5);
  return v4;
}

- (id)description
{
  int v3 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100191098;
  v33 = sub_1001910A8;
  v34 = &stru_1002392C0;
  while (v3 < [(PCSCTreeNode *)self level])
  {
    uint64_t v4 = [(id)v30[5] stringByAppendingString:@"  "];
    uint64_t v5 = (void *)v30[5];
    v30[5] = v4;

    ++v3;
  }
  value = self->_value;
  if (value)
  {
    v7 = (void *)v30[5];
    v8 = [(NSDictionary *)value allKeys];
    v9 = [v8 objectAtIndexedSubscript:0];
    id v10 = self->_value;
    id v11 = [(NSDictionary *)v10 allKeys];
    v12 = [v11 objectAtIndexedSubscript:0];
    v13 = [(NSDictionary *)v10 objectForKeyedSubscript:v12];
    uint64_t v14 = +[NSString stringWithFormat:@"%@ : %@", v9, v13];
    uint64_t v15 = [v7 stringByAppendingString:v14];
    v16 = (void *)v30[5];
    v30[5] = v15;
  }
  if (self->_operator)
  {
    v17 = (void *)v30[5];
    opTokens = self->_opTokens;
    v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    v20 = [(NSDictionary *)opTokens allKeysForObject:v19];
    id v21 = [v20 objectAtIndexedSubscript:0];
    id v22 = +[NSString stringWithFormat:@"%@", v21];
    uint64_t v23 = [v17 stringByAppendingString:v22];
    v24 = (void *)v30[5];
    v30[5] = v23;
  }
  children = self->_children;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001910B0;
  v28[3] = &unk_100238FD0;
  v28[4] = &v29;
  [(NSMutableArray *)children enumerateObjectsUsingBlock:v28];
  id v26 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v26;
}

+ (id)_convertOperator:(int64_t)a3
{
  if (qword_10028D2A0 != -1) {
    dispatch_once(&qword_10028D2A0, &stru_100238FF0);
  }
  uint64_t v4 = (void *)qword_10028D298;

  return [v4 objectAtIndex:a3];
}

+ (id)_translateNodeToDataAdaptor:(id)a3 dataDictionary:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[NSString stringWithFormat:@"DA%p", v8];
  id v10 = +[NSMutableDictionary dictionary];
  [v10 setObject:@"com.apple.ap.statuscondition" forKey:@"adaptor"];
  id v11 = [v8 value];
  v12 = [v11 objectForKeyedSubscript:@"identifier"];

  v13 = [v8 value];

  uint64_t v14 = [v13 objectForKeyedSubscript:@"bundleID"];

  if (v12
    && v14
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v16 = +[NSMutableDictionary dictionary];
    [v16 setObject:v12 forKey:@"conditionID"];
    [v16 setObject:v14 forKey:@"bundleID"];
    [v10 setObject:v16 forKey:@"inputs"];
    [v7 setObject:v10 forKey:v9];
    id v15 = v9;
  }
  else if (a5)
  {
    +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1113 userInfo:0];
    id v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)_translateRootNodeToExpressionFormat:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 version]);
  [v6 setObject:v8 forKey:@"version"];

  v9 = +[NSMutableArray array];
  id v10 = +[PCSCTreeNode _convertOperator:](PCSCTreeNode, "_convertOperator:", [v5 operator]);
  [v9 addObject:v10];
  uint64_t v11 = [v5 children];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [v5 children];
    id v14 = [v13 count];

    if (v14)
    {
      id v15 = +[PCSCTreeNode _translateChildNodesToExpressionFormat:v5 dataDictionary:v7 error:a4];
      [v9 addObjectsFromArray:v15];

LABEL_6:
      [v6 setObject:v9 forKey:@"expression"];
      [v6 setObject:v7 forKey:@"data"];
      id v18 = +[NSUUID UUID];
      v19 = [v18 UUIDString];
      uint64_t v23 = v19;
      id v20 = [v6 copy];
      id v24 = v20;
      id v21 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

      goto LABEL_8;
    }
  }
  uint64_t v16 = +[PCSCTreeNode _translateNodeToDataAdaptor:v5 dataDictionary:v7 error:a4];
  if (v16)
  {
    v17 = (void *)v16;
    [v6 setObject:v7 forKey:@"data"];
    [v9 addObject:v17];

    goto LABEL_6;
  }
  id v21 = 0;
LABEL_8:

  return v21;
}

+ (id)_translateChildNodesToExpressionFormat:(id)a3 dataDictionary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v19 = v7;
  id obj = [v7 children];
  id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v14 operator])
        {
          id v15 = +[NSMutableArray array];
          uint64_t v16 = +[PCSCTreeNode _convertOperator:](PCSCTreeNode, "_convertOperator:", [v14 operator]);
          [v15 addObject:v16];
          v17 = +[PCSCTreeNode _translateChildNodesToExpressionFormat:v14 dataDictionary:v8 error:a5];
          [v15 addObjectsFromArray:v17];
          [v9 addObject:v15];
        }
        else
        {
          id v15 = +[PCSCTreeNode _translateNodeToDataAdaptor:v14 dataDictionary:v8 error:a5];
          [v9 addObject:v15];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v9;
}

- (PCSCTreeNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (PCSCTreeNode *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSDictionary)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (int64_t)operator
{
  return self->_operator;
}

- (void)setOperator:(int64_t)a3
{
  self->_int64_t operator = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSDictionary)opTokens
{
  return self->_opTokens;
}

- (void)setOpTokens:(id)a3
{
}

- (NSDictionary)typeTokens
{
  return self->_typeTokens;
}

- (void)setTypeTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeTokens, 0);
  objc_storeStrong((id *)&self->_opTokens, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_children, 0);

  objc_destroyWeak((id *)&self->_parent);
}

@end