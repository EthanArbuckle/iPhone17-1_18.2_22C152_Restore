@interface RMPredicateDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)_buildPredicateFromFormatString:(id)a3 error:(id *)a4;
- (NSArray)properties;
- (NSArray)statusKeyPaths;
- (NSNumber)version;
- (NSPredicate)predicate;
- (RMPredicateDescription)initWithCoder:(id)a3;
- (RMPredicateDescription)initWithFormat:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)description;
- (int64_t)_evaluateVersion1WithStatus:(id)a3 error:(id *)a4;
- (int64_t)_evaluateVersion2WithStatus:(id)a3 properties:(id)a4 error:(id *)a5;
- (int64_t)evaluateWithStatus:(id)a3 properties:(id)a4 error:(id *)a5;
- (void)_buildPredicateWithVisitorFromFormatString:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMPredicateDescription

- (RMPredicateDescription)initWithFormat:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMPredicateDescription;
  v7 = [(RMPredicateDescription *)&v11 init];
  v8 = v7;
  if (v7
    && ![(RMPredicateDescription *)v7 _buildPredicateFromFormatString:v6 error:a4])
  {
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (BOOL)_buildPredicateFromFormatString:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v45[0] = 0;
  v38 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", @"@(status|property|key)\\(([^)]+)\\"), 1, v45);
  id v35 = v45[0];
  if (v38)
  {
    id v33 = [v4 length];
    v37 = [v38 matchesInString:v4 options:0 range:0];
    if ([v37 count])
    {
      v40 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v37 count]);
      v39 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v37 count]);
      v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v37 count]);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v6 = v37;
      id v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (!v7) {
        goto LABEL_18;
      }
      uint64_t v8 = *(void *)v42;
      while (1)
      {
        v9 = 0;
        do
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v9);
          id v11 = [v10 rangeAtIndex:1];
          v13 = objc_msgSend(v4, "substringWithRange:", v11, v12);
          id v14 = [v10 rangeAtIndex:2];
          v16 = objc_msgSend(v4, "substringWithRange:", v14, v15);
          if ([v13 isEqualToString:@"status"])
          {
            [v40 addObject:v16];
            v17 = +[NSString stringWithFormat:@"%@.%@", v13, v16];
            [v5 addObject:v17];
LABEL_12:

            goto LABEL_13;
          }
          if ([v13 isEqualToString:@"property"])
          {
            [v39 addObject:v16];
            v17 = +[NSString stringWithFormat:@"%@.%@", v13, v16];
            [v5 addObject:v17];
            goto LABEL_12;
          }
          if ([v13 isEqualToString:@"key"]) {
            [v5 addObject:v16];
          }
LABEL_13:

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v18 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
        id v7 = v18;
        if (!v18)
        {
LABEL_18:

          v19 = objc_msgSend(v38, "stringByReplacingMatchesInString:options:range:withTemplate:", v4, 0, 0, v33, @"%K");
          v20 = +[NSPredicate predicateWithFormat:v19 argumentArray:v5];
          predicate = self->_predicate;
          self->_predicate = v20;

          v22 = (NSArray *)[v40 copy];
          statusKeyPaths = self->_statusKeyPaths;
          self->_statusKeyPaths = v22;

          v24 = (NSArray *)[v39 copy];
          properties = self->_properties;
          self->_properties = v24;

          version = self->_version;
          self->_version = (NSNumber *)&off_10001E8A8;

          v27 = v37;
          goto LABEL_27;
        }
      }
    }
    [(RMPredicateDescription *)self _buildPredicateWithVisitorFromFormatString:v4];
    v27 = v37;
LABEL_27:

    BOOL v31 = 1;
  }
  else
  {
    v28 = +[RMLog predicateDescription];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1000123C8((uint64_t)v35, v28);
    }

    if (a4)
    {
      v29 = +[RMErrorUtilities createUnableToParsePredicateErrorWithFormat:v4 reason:@"Unable to create predicate regular expression"];
      v30 = v29;
      if (v29) {
        *a4 = v29;
      }
    }
    BOOL v31 = 0;
  }

  return v31;
}

- (void)_buildPredicateWithVisitorFromFormatString:(id)a3
{
  id v14 = a3;
  id v4 = +[NSPredicate predicateWithFormat:v14];
  predicate = self->_predicate;
  self->_predicate = v4;

  statusKeyPaths = self->_statusKeyPaths;
  self->_statusKeyPaths = (NSArray *)&__NSArray0__struct;

  properties = self->_properties;
  self->_properties = (NSArray *)&__NSArray0__struct;

  version = self->_version;
  self->_version = (NSNumber *)&off_10001E890;

  v10 = [[_RMPredicateVisitor alloc] initWithFormat:v14];
  [(NSPredicate *)self->_predicate acceptVisitor:v10 flags:3];
  id v11 = [(_RMPredicateVisitor *)v10 statusKeyPaths];
  uint64_t v12 = [v11 allObjects];
  v13 = self->_statusKeyPaths;
  self->_statusKeyPaths = v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMPredicateDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RMPredicateDescription;
  v5 = [(RMPredicateDescription *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v6;

    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"keyPaths"];
    statusKeyPaths = v5->_statusKeyPaths;
    v5->_statusKeyPaths = (NSArray *)v10;

    if ([v4 containsValueForKey:@"version"])
    {
      uint64_t v12 = objc_opt_class();
      v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
      uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"properties"];
      properties = v5->_properties;
      v5->_properties = (NSArray *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
      version = v5->_version;
      v5->_version = (NSNumber *)v16;
    }
    else
    {
      id v18 = v5->_properties;
      v5->_properties = (NSArray *)&__NSArray0__struct;

      version = v5->_version;
      v5->_version = (NSNumber *)&off_10001E890;
    }

    [(NSPredicate *)v5->_predicate allowEvaluation];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMPredicateDescription *)self predicate];
  [v4 encodeObject:v5 forKey:@"predicate"];

  uint64_t v6 = [(RMPredicateDescription *)self statusKeyPaths];
  [v4 encodeObject:v6 forKey:@"keyPaths"];

  id v7 = [(RMPredicateDescription *)self properties];
  [v4 encodeObject:v7 forKey:@"properties"];

  id v8 = [(RMPredicateDescription *)self version];
  [v4 encodeObject:v8 forKey:@"version"];
}

- (id)description
{
  v2 = [(RMPredicateDescription *)self predicate];
  v3 = [v2 predicateFormat];

  return v3;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(RMPredicateDescription *)self statusKeyPaths];
  uint64_t v6 = [(RMPredicateDescription *)self properties];
  id v7 = [(RMPredicateDescription *)self predicate];
  id v8 = +[NSString stringWithFormat:@"<%@: %p { statusKeyPaths = %@, properties = %@, predicate = %@ }>", v4, self, v5, v6, v7];

  return v8;
}

- (int64_t)evaluateWithStatus:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(RMPredicateDescription *)self version];
  unsigned int v11 = [v10 isEqualToNumber:&off_10001E890];

  if (v11)
  {
    int64_t v12 = [(RMPredicateDescription *)self _evaluateVersion1WithStatus:v8 error:a5];
LABEL_5:
    int64_t v15 = v12;
    goto LABEL_13;
  }
  v13 = [(RMPredicateDescription *)self version];
  unsigned int v14 = [v13 isEqualToNumber:&off_10001E8A8];

  if (v14)
  {
    int64_t v12 = [(RMPredicateDescription *)self _evaluateVersion2WithStatus:v8 properties:v9 error:a5];
    goto LABEL_5;
  }
  uint64_t v16 = +[RMLog predicateDescription];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100012530(self, v16);
  }

  if (a5)
  {
    v17 = [(RMPredicateDescription *)self predicate];
    id v18 = [v17 predicateFormat];
    v19 = +[RMErrorUtilities createUnableToEvaluatePredicateErrorWithFormat:v18 reason:@"Invalid version"];

    if (v19) {
      *a5 = v19;
    }
  }
  int64_t v15 = -1;
LABEL_13:

  return v15;
}

- (int64_t)_evaluateVersion1WithStatus:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(RMPredicateDescription *)self predicate];
  int64_t v7 = [v6 evaluateWithObject:v5];

  return v7;
}

- (int64_t)_evaluateVersion2WithStatus:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = @"status";
  v13[1] = @"property";
  v14[0] = v7;
  v14[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  uint64_t v10 = [(RMPredicateDescription *)self predicate];
  unsigned int v11 = [v10 evaluateWithObject:v9];

  return v11;
}

- (NSArray)statusKeyPaths
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)properties
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSNumber)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_statusKeyPaths, 0);
}

@end