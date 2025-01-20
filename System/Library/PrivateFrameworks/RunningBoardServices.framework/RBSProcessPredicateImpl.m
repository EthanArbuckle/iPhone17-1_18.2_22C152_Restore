@interface RBSProcessPredicateImpl
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)matchesProcess:(id)a3;
- (NSString)description;
- (id)processIdentifier;
- (id)processIdentifiers;
- (id)processPredicate;
- (unint64_t)hash;
@end

@implementation RBSProcessPredicateImpl

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (NSString)description
{
  id v2 = [NSString alloc];
  v3 = [(id)objc_opt_class() description];
  v4 = (void *)[v2 initWithFormat:@"<%@>", v3];

  return (NSString *)v4;
}

- (unint64_t)hash
{
  id v2 = objc_opt_class();
  return [v2 hash];
}

- (id)processIdentifiers
{
  id v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  uint64_t v5 = [(RBSProcessPredicateImpl *)v4 processIdentifiers];
  if (v5)
  {
    id v6 = (id)v5;
  }
  else
  {
    v7 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    v9 = v8;

    v10 = [(RBSProcessPredicateImpl *)v9 processIdentifiers];
    v11 = v10;
    if (v10)
    {
      id v6 = v10;
    }
    else
    {
      v12 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      v14 = v13;

      v15 = [(RBSProcessPredicateImpl *)v14 processIdentifiers];
      v16 = v15;
      if (v15)
      {
        id v6 = v15;
      }
      else
      {
        v17 = v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v18 = v17;
        }
        else {
          v18 = 0;
        }
        v19 = v18;

        id v6 = [(RBSProcessPredicateImpl *)v19 processIdentifiers];
      }
    }

    if (v6) {
      goto LABEL_23;
    }
    v4 = [(RBSProcessPredicateImpl *)v7 processIdentifier];
    if (v4)
    {
      v21 = (void *)MEMORY[0x1E4F1CAD0];
      v22 = +[RBSProcessIdentifier identifierForIdentifier:v4];
      id v6 = [v21 setWithObject:v22];
    }
    else
    {
      id v6 = 0;
    }
  }

LABEL_23:
  return v6;
}

- (id)processIdentifier
{
  id v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  uint64_t v5 = [(RBSProcessPredicateImpl *)v4 identifier];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    v10 = v9;

    v11 = [(RBSProcessPredicateImpl *)v10 processIdentifier];
    v12 = v11;
    if (v11)
    {
      id v7 = v11;
    }
    else
    {
      v13 = v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
      v15 = v14;

      v16 = [(RBSProcessPredicateImpl *)v15 processIdentifier];
      v17 = v16;
      if (v16)
      {
        id v7 = v16;
      }
      else
      {
        v18 = v13;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
        v20 = v19;

        v21 = [(RBSProcessPredicateImpl *)v20 processIdentifier];
        v22 = v21;
        if (v21)
        {
          id v7 = v21;
        }
        else
        {
          v23 = v18;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v24 = v23;
          }
          else {
            v24 = 0;
          }
          v25 = v24;

          id v7 = [(RBSProcessPredicateImpl *)v25 processIdentifier];
        }
      }
    }
  }

  return v7;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:self];
}

- (BOOL)matchesProcess:(id)a3
{
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_3(v3);
  return 0;
}

@end