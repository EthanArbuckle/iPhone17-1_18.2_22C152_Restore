@interface SSSQLiteComparisonPredicate
+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4;
+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)_comparisonTypeString;
- (id)value;
- (int64_t)comparisonType;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
- (void)dealloc;
@end

@implementation SSSQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  v8 = objc_alloc_init((Class)objc_opt_class());
  v8[2] = a5;
  v8[1] = [a3 copy];
  if ([a4 conformsToProtocol:&unk_1EF9AC4F0]) {
    id v9 = (id)[a4 copy];
  }
  else {
    id v9 = a4;
  }
  v8[3] = v9;
  return v8;
}

+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4
{
  v6 = (void *)[objc_alloc(NSNumber) initWithLongLong:a4];
  v7 = (void *)[a1 predicateWithProperty:a3 equalToValue:v6];

  return v7;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 value:a4 comparisonType:1];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteComparisonPredicate;
  [(SSSQLitePropertyPredicate *)&v3 dealloc];
}

- (id)SQLForEntityClass:(Class)a3
{
  uint64_t v4 = [(objc_class *)a3 disambiguatedSQLForProperty:[(SSSQLitePropertyPredicate *)self property]];
  return (id)[NSString stringWithFormat:@"%@ %@ ?", v4, -[SSSQLiteComparisonPredicate _comparisonTypeString](self, "_comparisonTypeString")];
}

- (id)_comparisonTypeString
{
  int64_t v4 = [(SSSQLiteComparisonPredicate *)self comparisonType];
  if ((unint64_t)(v4 - 1) < 7) {
    return off_1E5BAD010[v4 - 1];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSSQLitePredicate.m", 182, @"Invalid comparison type: %ld", self->_comparisonType);
  return 0;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
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
      v8 = (const char *)[self->_value objCType];
      if (!strcmp(v8, "d") || !strcmp(v8, "f"))
      {
        int v9 = *a4;
        [self->_value doubleValue];
        sqlite3_bind_double(a3, v9, v10);
      }
      else
      {
        sqlite3_bind_int64(a3, *a4, [self->_value longLongValue]);
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSSQLitePredicate.m", 145, @"Unsupported predicate value: %@", self->_value);
    }
  }
  ++*a4;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(SSSQLitePropertyPredicate *)self property] hash];
  return objc_msgSend(-[SSSQLiteComparisonPredicate value](self, "value"), "hash") + v3;
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SSSQLiteComparisonPredicate;
  unsigned int v5 = -[SSSQLitePropertyPredicate isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    int64_t v6 = [(SSSQLiteComparisonPredicate *)self comparisonType];
    if (v6 == [a3 comparisonType])
    {
      id v7 = [(SSSQLiteComparisonPredicate *)self value];
      if (v7 == (id)[a3 value]) {
        LOBYTE(v5) = 1;
      }
      else {
        LOBYTE(v5) = objc_msgSend(-[SSSQLiteComparisonPredicate value](self, "value"), "isEqual:", objc_msgSend(a3, "value"));
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)value
{
  return self->_value;
}

@end