@interface StringComparisonByChars
+ (id)stringComparisonByCharsWithString1:(id)a3 string2:(id)a4 reference:(id)a5;
- (StringComparisonByChars)initWithString1:(id)a3 string2:(id)a4 reference:(id)a5;
@end

@implementation StringComparisonByChars

+ (id)stringComparisonByCharsWithString1:(id)a3 string2:(id)a4 reference:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithString1:v10 string2:v9 reference:v8];

  return v11;
}

- (StringComparisonByChars)initWithString1:(id)a3 string2:(id)a4 reference:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)StringComparisonByChars;
  id v10 = [(ObjectComparisonByTokens *)&v19 initWithObj1:v8 obj2:v9 reference:a5];
  unint64_t v11 = [v8 length];
  unint64_t v12 = [v9 length];
  if (v11 >= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v11;
  }
  if (v13)
  {
    unint64_t v14 = 0;
    do
    {
      -[ObjectComparisonByTokens incrementTokensWith:](v10, "incrementTokensWith:", [v8 characterAtIndex:v14] == objc_msgSend(v9, "characterAtIndex:", v14));
      ++v14;
      unint64_t v15 = [v8 length];
      unint64_t v16 = [v9 length];
      if (v15 >= v16) {
        unint64_t v17 = v16;
      }
      else {
        unint64_t v17 = v15;
      }
    }
    while (v14 < v17);
  }
  [(ObjectComparisonByTokens *)v10 accountForadditionalLength];

  return v10;
}

@end