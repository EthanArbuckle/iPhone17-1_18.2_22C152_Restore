@interface IMCompoundConfigurationPredicate
+ (id)andPredicateWithSubpredicates:(id)a3;
+ (id)orPredicateWithSubpredicates:(id)a3;
- (BOOL)evaluateWithContext:(id)a3;
- (IMCompoundConfigurationPredicate)initWithType:(unint64_t)a3 subpredicates:(id)a4;
- (NSArray)subpredicates;
- (id)description;
- (int64_t)_andScore;
- (int64_t)_orScore;
- (int64_t)score;
- (unint64_t)type;
- (void)setScore:(int64_t)a3;
- (void)setSubpredicates:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation IMCompoundConfigurationPredicate

+ (id)andPredicateWithSubpredicates:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:1 subpredicates:v4];

  return v5;
}

+ (id)orPredicateWithSubpredicates:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithType:0 subpredicates:v4];

  return v5;
}

- (IMCompoundConfigurationPredicate)initWithType:(unint64_t)a3 subpredicates:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IMCompoundConfigurationPredicate;
  v8 = [(IMConfigurationPredicate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_subpredicates, a4);
  }

  return v9;
}

- (id)description
{
  unint64_t v3 = [(IMCompoundConfigurationPredicate *)self type];
  id v4 = @" || ";
  if (v3 == 1) {
    id v4 = @" && ";
  }
  id v5 = v4;
  v6 = [(IMCompoundConfigurationPredicate *)self subpredicates];
  id v7 = [v6 componentsJoinedByString:v5];

  v8 = +[NSString stringWithFormat:@"(%@)", v7];

  return v8;
}

- (BOOL)evaluateWithContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(IMCompoundConfigurationPredicate *)self type];
  if (!v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = [(IMCompoundConfigurationPredicate *)self subpredicates];
    id v12 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (!v12)
    {
LABEL_20:
      BOOL v11 = 0;
LABEL_23:

      goto LABEL_24;
    }
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
LABEL_14:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v18 != v14) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v17 + 1) + 8 * v15) evaluateWithContext:v4]) {
        break;
      }
      if (v13 == (id)++v15)
      {
        id v13 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v13) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
    }
LABEL_22:
    BOOL v11 = 1;
    goto LABEL_23;
  }
  if (v5 == 1)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = [(IMCompoundConfigurationPredicate *)self subpredicates];
    id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v21 + 1) + 8 * v10) evaluateWithContext:v4]) {
          goto LABEL_20;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
          BOOL v11 = 1;
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_23;
        }
      }
    }
    goto LABEL_22;
  }
  BOOL v11 = 0;
LABEL_24:

  return v11;
}

- (int64_t)score
{
  unint64_t v3 = [(IMCompoundConfigurationPredicate *)self type];
  if (v3)
  {
    if (v3 == 1)
    {
      return [(IMCompoundConfigurationPredicate *)self _andScore];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return [(IMCompoundConfigurationPredicate *)self _orScore];
  }
}

- (void)setScore:(int64_t)a3
{
}

- (int64_t)_andScore
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(IMCompoundConfigurationPredicate *)self subpredicates];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 score];
        uint64_t v10 = (char *)[v8 score];
        if ((uint64_t)v9 < 1)
        {
          if ((uint64_t)v10 > (uint64_t)v5) {
            unint64_t v5 = (char *)[v8 score];
          }
        }
        else
        {
          unint64_t v5 = &v5[(void)v10];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return (int64_t)v5;
}

- (int64_t)_orScore
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(IMCompoundConfigurationPredicate *)self subpredicates];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if ((uint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) score] > v5) {
          int64_t v5 = 1;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSArray)subpredicates
{
  return self->_subpredicates;
}

- (void)setSubpredicates:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end