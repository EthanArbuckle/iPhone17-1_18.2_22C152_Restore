@interface SQLiteComparisonPredicate
+ (id)predicateWithProperty:(id)a3 bitwiseAndValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 bitwiseNotAndValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 collatingStrategy:(int64_t)a6;
- (BOOL)_isCollatingStrategyNoCase;
- (BOOL)forceFalse;
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)_comparisonTypeFormat;
- (id)description;
- (id)value;
- (int64_t)collatingStrategy;
- (int64_t)comparisonType;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation SQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_opt_class();
  BOOL v10 = (objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v8 length] > 0x20;
  id v11 = objc_alloc_init((Class)objc_opt_class());
  *((void *)v11 + 3) = a5;
  id v12 = [v9 copy];

  v13 = (void *)*((void *)v11 + 1);
  *((void *)v11 + 1) = v12;

  if (v10)
  {
    *((unsigned char *)v11 + 16) = 1;
  }
  else if ([v8 conformsToProtocol:&OBJC_PROTOCOL___NSCopying])
  {
    id v14 = [v8 copy];
    v15 = (void *)*((void *)v11 + 4);
    *((void *)v11 + 4) = v14;
  }
  else
  {
    objc_storeStrong((id *)v11 + 4, a4);
  }

  return v11;
}

- (id)SQLForEntityClass:(Class)a3
{
  if (self->_forceFalse)
  {
    v3 = @"(0)";
  }
  else
  {
    v5 = [(objc_class *)a3 disambiguatedSQLForProperty:self->super._property];
    v6 = [(SQLiteComparisonPredicate *)self _comparisonTypeFormat];
    PKStringWithValidatedFormat();
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_comparisonTypeFormat
{
  switch(self->_comparisonType)
  {
    case 1:
      unsigned int v2 = [(SQLiteComparisonPredicate *)self _isCollatingStrategyNoCase];
      v3 = @"(%@ = ?)";
      v4 = @"(%@ = ? COLLATE NOCASE)";
      goto LABEL_9;
    case 2:
      unsigned int v2 = [(SQLiteComparisonPredicate *)self _isCollatingStrategyNoCase];
      v3 = @"(%@ != ?)";
      v4 = @"(%@ != ? COLLATE NOCASE)";
      goto LABEL_9;
    case 3:
      unsigned int v2 = [(SQLiteComparisonPredicate *)self _isCollatingStrategyNoCase];
      v3 = @"(%@ < ?)";
      v4 = @"(%@ < ? COLLATE NOCASE)";
      goto LABEL_9;
    case 4:
      unsigned int v2 = [(SQLiteComparisonPredicate *)self _isCollatingStrategyNoCase];
      v3 = @"(%@ <= ?)";
      v4 = @"(%@ <= ? COLLATE NOCASE)";
      goto LABEL_9;
    case 5:
      unsigned int v2 = [(SQLiteComparisonPredicate *)self _isCollatingStrategyNoCase];
      v3 = @"(%@ > ?)";
      v4 = @"(%@ > ? COLLATE NOCASE)";
      goto LABEL_9;
    case 6:
      unsigned int v2 = [(SQLiteComparisonPredicate *)self _isCollatingStrategyNoCase];
      v3 = @"(%@ >= ?)";
      v4 = @"(%@ >= ? COLLATE NOCASE)";
LABEL_9:
      if (v2) {
        id result = v4;
      }
      else {
        id result = v3;
      }
      break;
    case 7:
      id result = @"(%@ & ?)";
      break;
    case 8:
      id result = @"(NOT %@ & ?)";
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (BOOL)_isCollatingStrategyNoCase
{
  if (self->_collatingStrategy == 1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  if (!self->_forceFalse)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      sqlite3_bind_text(a3, *a4, (const char *)[self->_value UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = (const char *)[self->_value objCType];
        if (!strcmp(v7, "d") || !strcmp(v7, "f"))
        {
          int v8 = *a4;
          [self->_value doubleValue];
          sqlite3_bind_double(a3, v8, v9);
        }
        else
        {
          sqlite3_bind_int64(a3, *a4, (sqlite3_int64)[self->_value longLongValue]);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[self->_value length] <= 0x20)
        {
          sqlite3_bind_blob(a3, *a4, [self->_value bytes], (int)objc_msgSend(self->_value, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        }
        else if (!self->_value)
        {
          sqlite3_bind_null(a3, *a4);
        }
      }
    }
    ++*a4;
  }
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:1];
}

+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:3];
}

- (void).cxx_destruct
{
}

+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:2];
}

+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:6];
}

+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:4];
}

+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:5];
}

+ (id)predicateWithProperty:(id)a3 bitwiseAndValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:7];
}

+ (id)predicateWithProperty:(id)a3 bitwiseNotAndValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:8];
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 collatingStrategy:(int64_t)a6
{
  id result = [a1 predicateWithProperty:a3 value:a4 comparisonType:a5];
  *((void *)result + 5) = a6;
  return result;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  [v3 appendFormat:@"property: %@; ", self->super._property];
  unint64_t comparisonType = self->_comparisonType;
  CFStringRef v5 = @"unknown";
  if (comparisonType <= 8) {
    CFStringRef v5 = off_100733598[comparisonType];
  }
  [v3 appendFormat:@"comparisonType: %@; ", v5];
  [v3 appendFormat:@"value: %@; ", self->_value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t collatingStrategy = self->_collatingStrategy;
    CFStringRef v7 = @"nocase";
    if (collatingStrategy != 1) {
      CFStringRef v7 = @"unknown";
    }
    if (collatingStrategy) {
      CFStringRef v8 = v7;
    }
    else {
      CFStringRef v8 = @"none";
    }
    [v3 appendFormat:@"collatingStrategy: %@; ", v8];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->super._property hash];
  return (unint64_t)[self->_value hash] + v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SQLiteComparisonPredicate;
  if ([(SQLitePropertyPredicate *)&v9 isEqual:v4])
  {
    CFStringRef v5 = v4;
    BOOL v7 = self->_comparisonType == v5[3]
      && ((id value = self->_value, value == (id)v5[4]) || objc_msgSend(value, "isEqual:"))
      && self->_forceFalse == *((unsigned __int8 *)v5 + 16)
      && self->_collatingStrategy == v5[5];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)value
{
  return self->_value;
}

- (int64_t)collatingStrategy
{
  return self->_collatingStrategy;
}

- (BOOL)forceFalse
{
  return self->_forceFalse;
}

@end