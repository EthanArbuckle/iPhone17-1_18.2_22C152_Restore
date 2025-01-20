@interface _UITextSearchOptions
+ (id)defaultSearchOptions;
- (BOOL)isEqual:(id)a3;
- (int64_t)wordMatchMethod;
- (unint64_t)stringCompareOptions;
- (void)setStringCompareOptions:(unint64_t)a3;
- (void)setWordMatchMethod:(int64_t)a3;
@end

@implementation _UITextSearchOptions

+ (id)defaultSearchOptions
{
  v2 = objc_alloc_init(_UITextSearchOptions);
  [(_UITextSearchOptions *)v2 setWordMatchMethod:0];
  [(_UITextSearchOptions *)v2 setStringCompareOptions:1];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [v5 stringCompareOptions];
    if (v6 == [(_UITextSearchOptions *)self stringCompareOptions])
    {
      uint64_t v7 = [v5 wordMatchMethod];
      BOOL v8 = v7 == [(_UITextSearchOptions *)self wordMatchMethod];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)stringCompareOptions
{
  return self->_stringCompareOptions;
}

- (void)setStringCompareOptions:(unint64_t)a3
{
  self->_stringCompareOptions = a3;
}

- (int64_t)wordMatchMethod
{
  return self->_wordMatchMethod;
}

- (void)setWordMatchMethod:(int64_t)a3
{
  self->_wordMatchMethod = a3;
}

@end