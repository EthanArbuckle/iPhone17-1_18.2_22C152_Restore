@interface PPSSQLiteComparisonPredicate
+ (id)predicateWithProperty:(id)a3 beginsWithString:(id)a4;
+ (id)predicateWithProperty:(id)a3 containsString:(id)a4;
+ (id)predicateWithProperty:(id)a3 endsWithString:(id)a4;
+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 likePattern:(id)a4;
+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4 escapeCharacter:(id)a5;
+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (PPSSQLiteComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
- (id)_comparisonTypeString;
- (id)description;
- (id)sqlForEntity:(id)a3;
- (id)value;
- (int64_t)comparisonType;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation PPSSQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [[PPSSQLiteComparisonPredicate alloc] initWithProperty:v7 value:v8 comparisonType:a5];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  v4 = [a1 predicateWithProperty:a3 value:a4 comparisonType:1];
  return v4;
}

+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4
{
  v4 = [a1 predicateWithProperty:a3 value:a4 comparisonType:2];
  return v4;
}

+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4
{
  v4 = [a1 predicateWithProperty:a3 value:a4 comparisonType:3];
  return v4;
}

+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4
{
  v4 = [a1 predicateWithProperty:a3 value:a4 comparisonType:4];
  return v4;
}

+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4
{
  v4 = [a1 predicateWithProperty:a3 value:a4 comparisonType:5];
  return v4;
}

+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4
{
  v4 = [a1 predicateWithProperty:a3 value:a4 comparisonType:6];
  return v4;
}

+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4
{
  v4 = [a1 predicateWithProperty:a3 value:a4 comparisonType:7];
  return v4;
}

+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4 escapeCharacter:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [[_PPSSQLiteComparisonPredicateLikeWithEscape alloc] initWithProperty:v7 value:v8 escapeCharacter:v9];

  return v10;
}

+ (id)predicateWithProperty:(id)a3 likePattern:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  uint64_t v8 = [v6 length];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = ___ZL43_stringEscapingGlobPatternsForLikePredicateP8NSString_block_invoke;
  v15 = &unk_265443578;
  v17 = v18;
  id v9 = v7;
  id v16 = v9;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, &v12);

  _Block_object_dispose(v18, 8);
  v10 = +[PPSSQLiteComparisonPredicate predicateWithProperty:v5, v9, @"~", v12, v13, v14, v15 likeValue escapeCharacter];

  return v10;
}

+ (id)predicateWithProperty:(id)a3 beginsWithString:(id)a4
{
  id v5 = a3;
  id v6 = NSString;
  id v7 = _stringEscapingSpecialCharactersForLikePredicate((NSString *)a4);
  uint64_t v8 = [v6 stringWithFormat:@"%@%%", v7];

  id v9 = +[PPSSQLiteComparisonPredicate predicateWithProperty:v5 likeValue:v8 escapeCharacter:@"~"];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 endsWithString:(id)a4
{
  id v5 = a3;
  id v6 = NSString;
  id v7 = _stringEscapingSpecialCharactersForLikePredicate((NSString *)a4);
  uint64_t v8 = [v6 stringWithFormat:@"%%%@", v7];

  id v9 = +[PPSSQLiteComparisonPredicate predicateWithProperty:v5 likeValue:v8 escapeCharacter:@"~"];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 containsString:(id)a4
{
  id v5 = a3;
  id v6 = NSString;
  id v7 = _stringEscapingSpecialCharactersForLikePredicate((NSString *)a4);
  uint64_t v8 = [v6 stringWithFormat:@"%%%@%%", v7];

  id v9 = +[PPSSQLiteComparisonPredicate predicateWithProperty:v5 likeValue:v8 escapeCharacter:@"~"];

  return v9;
}

- (unint64_t)hash
{
  v3 = [(PPSSQLitePropertyPredicate *)self property];
  uint64_t v4 = [v3 hash];
  id v5 = [(PPSSQLiteComparisonPredicate *)self value];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSSQLiteComparisonPredicate;
  if ([(PPSSQLitePropertyPredicate *)&v12 isEqual:v4]
    && (int64_t v5 = [(PPSSQLiteComparisonPredicate *)self comparisonType],
        v5 == [v4 comparisonType]))
  {
    unint64_t v6 = [(PPSSQLiteComparisonPredicate *)self value];
    id v7 = [v4 value];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      uint64_t v8 = [(PPSSQLiteComparisonPredicate *)self value];
      id v9 = [v4 value];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  id v7 = [(PPSSQLiteComparisonPredicate *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v9 = *a4;
    id v10 = [(PPSSQLiteComparisonPredicate *)self value];
    uint64_t v11 = [v10 UTF8String];
    if (v11) {
      objc_super v12 = (const char *)v11;
    }
    else {
      objc_super v12 = "";
    }
    sqlite3_bind_text(a3, v9, v12, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_18;
  }
  uint64_t v13 = [(PPSSQLiteComparisonPredicate *)self value];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  v15 = [(PPSSQLiteComparisonPredicate *)self value];
  id v16 = v15;
  if (v14)
  {
    id v17 = v15;
    v18 = (const char *)[v17 objCType];

    if (!strcmp(v18, "d") || !strcmp(v18, "f"))
    {
      int v25 = *a4;
      id v10 = [(PPSSQLiteComparisonPredicate *)self value];
      [v10 doubleValue];
      sqlite3_bind_double(a3, v25, v26);
    }
    else
    {
      int v19 = *a4;
      id v10 = [(PPSSQLiteComparisonPredicate *)self value];
      sqlite3_bind_int64(a3, v19, [v10 longLongValue]);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();

  if (v20)
  {
    int v21 = *a4;
    id v10 = [(PPSSQLiteComparisonPredicate *)self value];
    uint64_t v22 = [v10 bytes];
    if (v22) {
      v23 = (const char *)v22;
    }
    else {
      v23 = "";
    }
    v24 = [(PPSSQLiteComparisonPredicate *)self value];
    sqlite3_bind_blob(a3, v21, v23, [v24 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_18;
  }
  v27 = [(PPSSQLiteComparisonPredicate *)self value];
  objc_opt_class();
  char v28 = objc_opt_isKindOfClass();

  if (v28)
  {
    int v29 = *a4;
    id v10 = [(PPSSQLiteComparisonPredicate *)self value];
    [v10 timeIntervalSinceReferenceDate];
    sqlite3_bind_double(a3, v29, v30);
LABEL_18:

    goto LABEL_19;
  }
  v31 = [(PPSSQLiteComparisonPredicate *)self value];

  if (!v31) {
    sqlite3_bind_null(a3, *a4);
  }
LABEL_19:
  ++*a4;
}

- (id)sqlForEntity:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PPSSQLitePropertyPredicate *)self property];
  unint64_t v6 = [v4 disambiguatedSQLForProperty:v5 shouldEscape:1];

  id v7 = NSString;
  uint64_t v8 = [(PPSSQLiteComparisonPredicate *)self _comparisonTypeString];
  int v9 = [v7 stringWithFormat:@"(%@ %@ ?)", v6, v8];

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(PPSSQLitePropertyPredicate *)self property];
  int64_t v5 = [(PPSSQLiteComparisonPredicate *)self _comparisonTypeString];
  unint64_t v6 = [v3 stringWithFormat:@"'%@' %@ %@", v4, v5, self->_value];

  return v6;
}

- (PPSSQLiteComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PPSSQLiteComparisonPredicate;
  id v10 = [(PPSSQLiteComparisonPredicate *)&v17 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_comparisonType = a5;
    uint64_t v12 = [v8 copy];
    property = v11->super._property;
    v11->super._property = (NSString *)v12;

    if ([v9 conformsToProtocol:&unk_270715960]) {
      id v14 = (id)[v9 copy];
    }
    else {
      id v14 = v9;
    }
    id value = v11->_value;
    v11->_id value = v14;
  }
  return v11;
}

- (id)_comparisonTypeString
{
  int64_t v2 = [(PPSSQLiteComparisonPredicate *)self comparisonType];
  if ((unint64_t)(v2 - 1) > 6) {
    return 0;
  }
  else {
    return off_265443598[v2 - 1];
  }
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end