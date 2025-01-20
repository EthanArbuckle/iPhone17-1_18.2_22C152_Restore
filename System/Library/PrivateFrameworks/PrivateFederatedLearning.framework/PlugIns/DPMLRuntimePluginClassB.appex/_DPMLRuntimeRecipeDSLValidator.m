@interface _DPMLRuntimeRecipeDSLValidator
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateSQLQuery:(id)a3 forTemplate:(id)a4;
- (BOOL)validateBMDSLMapOp:(id)a3 error:(id *)a4;
- (BOOL)validateGraph:(id)a3 error:(id *)a4;
- (BOOL)validateOpClass:(id)a3 error:(id *)a4;
- (NSDictionary)validOpClassTransforms;
- (NSSet)validOpClasses;
- (NSSet)validOpSQLTransformTemplates;
- (_DPMLRuntimeRecipeDSLValidator)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setValidOpClassTransforms:(id)a3;
- (void)setValidOpClasses:(id)a3;
- (void)setValidOpSQLTransformTemplates:(id)a3;
@end

@implementation _DPMLRuntimeRecipeDSLValidator

- (_DPMLRuntimeRecipeDSLValidator)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_DPMLRuntimeRecipeDSLValidator;
  v5 = [(_DPMLRuntimeRecipeDSLValidator *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"validOpClasses"];
    validOpClasses = v5->_validOpClasses;
    v5->_validOpClasses = (NSSet *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"validOpClassTransforms"];
    validOpClassTransforms = v5->_validOpClassTransforms;
    v5->_validOpClassTransforms = (NSDictionary *)v13;

    uint64_t v15 = objc_opt_class();
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"validOpSQLTransformTemplates"];
    validOpSQLTransformTemplates = v5->_validOpSQLTransformTemplates;
    v5->_validOpSQLTransformTemplates = (NSSet *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_DPMLRuntimeRecipeDSLValidator *)self validOpClasses];
  [v4 encodeObject:v5 forKey:@"validOpClasses"];

  uint64_t v6 = [(_DPMLRuntimeRecipeDSLValidator *)self validOpClassTransforms];
  [v4 encodeObject:v6 forKey:@"validOpClassTransforms"];

  id v7 = [(_DPMLRuntimeRecipeDSLValidator *)self validOpSQLTransformTemplates];
  [v4 encodeObject:v7 forKey:@"validOpSQLTransformTemplates"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)validateGraph:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(_DPMLRuntimeRecipeDSLValidator *)self validateOpClass:v6 error:a4]
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     || [(_DPMLRuntimeRecipeDSLValidator *)self validateBMDSLMapOp:v6 error:a4]))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = objc_msgSend(v6, "upstreams", 0);
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          if (![(_DPMLRuntimeRecipeDSLValidator *)self validateGraph:*(void *)(*((void *)&v14 + 1) + 8 * i) error:a4])
          {
            BOOL v12 = 0;
            goto LABEL_15;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_15:
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)validateOpClass:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(_DPMLRuntimeRecipeDSLValidator *)self validOpClasses];
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  unsigned __int8 v10 = [v7 containsObject:v9];

  if (a4 && (v10 & 1) == 0)
  {
    uint64_t v11 = +[NSString stringWithFormat:@"Graph Validation failed. Not explicitly allowed Class %@", objc_opt_class()];
    *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v11];
  }
  return v10;
}

- (BOOL)validateBMDSLMapOp:(id)a3 error:(id *)a4
{
  id v6 = [a3 transform];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [(_DPMLRuntimeRecipeDSLValidator *)self validOpClassTransforms];
    id v9 = [v8 allKeys];
    unsigned __int8 v10 = [v7 className];
    unsigned __int8 v11 = [v9 containsObject:v10];

    if (v11)
    {
      BOOL v12 = [v7 className];
      uint64_t v13 = [(_DPMLRuntimeRecipeDSLValidator *)self validOpClassTransforms];
      long long v14 = [v13 objectForKeyedSubscript:v12];
      long long v15 = [v7 transformName];
      unsigned __int8 v16 = [v14 containsObject:v15];

      if (v16)
      {
        LODWORD(a4) = 0;
LABEL_15:

LABEL_16:
        LOBYTE(a4) = a4 == 0;
        goto LABEL_17;
      }
      if (!a4)
      {
LABEL_14:
        LODWORD(a4) = 1;
        goto LABEL_15;
      }
      long long v17 = [v7 transformName];
      v18 = [v7 className];
      v19 = +[NSString stringWithFormat:@"Graph Validation failed. Not explicitly allowed Class Transform method %@ for Class Transform %@", v17, v18];
      *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v19];
    }
    else
    {
      if (!a4)
      {
        LODWORD(a4) = 1;
        goto LABEL_16;
      }
      BOOL v12 = [v7 className];
      long long v17 = +[NSString stringWithFormat:@"Graph Validation failed. Not explicitly allowed Class Transform %@", v12];
      *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v17];
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LOBYTE(a4) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v6;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id obj = [(_DPMLRuntimeRecipeDSLValidator *)self validOpSQLTransformTemplates];
      id v22 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v35;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v35 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v27 = objc_opt_class();
            v28 = [v21 SQL];
            LOBYTE(v26) = [v27 validateSQLQuery:v28 forTemplate:v26];

            if (v26)
            {
              LOBYTE(a4) = 1;

              goto LABEL_34;
            }
          }
          id v23 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      if (a4)
      {
        id obja = [v21 SQL];
        v29 = +[NSString stringWithFormat:@"Graph Validation failed. No explicitly allowed SQL template found for SQL transform query: %@", obja];
        *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v29];

        LOBYTE(a4) = 0;
      }
LABEL_34:
    }
    else if (a4)
    {
      v30 = [v6 description];
      v31 = +[NSString stringWithFormat:@"Graph Validation failed. Not explicitly allowed Transform %@", v30];
      *a4 = +[_DPMLRuntimeError errorWithCode:100 description:v31];

      LOBYTE(a4) = 0;
    }
  }
LABEL_17:

  return (char)a4;
}

+ (BOOL)validateSQLQuery:(id)a3 forTemplate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v12 = 0;
  id v7 = +[NSRegularExpression regularExpressionWithPattern:v6 options:0 error:&v12];
  id v8 = v12;
  if (v8)
  {
    id v9 = +[_PFLLog extension];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000200CC((uint64_t)v6, (uint64_t)v8, v9);
    }

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = objc_msgSend(v7, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")) != 0;
  }

  return v10;
}

- (NSSet)validOpClasses
{
  return self->_validOpClasses;
}

- (void)setValidOpClasses:(id)a3
{
}

- (NSDictionary)validOpClassTransforms
{
  return self->_validOpClassTransforms;
}

- (void)setValidOpClassTransforms:(id)a3
{
}

- (NSSet)validOpSQLTransformTemplates
{
  return self->_validOpSQLTransformTemplates;
}

- (void)setValidOpSQLTransformTemplates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validOpSQLTransformTemplates, 0);
  objc_storeStrong((id *)&self->_validOpClassTransforms, 0);
  objc_storeStrong((id *)&self->_validOpClasses, 0);
}

@end