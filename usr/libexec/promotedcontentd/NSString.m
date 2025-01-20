@interface NSString
- (id)_lowercaseFirstLetterOfString:(BOOL)a3;
- (id)stringByLowercasingFirstLetter;
- (id)stringByUppercasingFirstLetter;
@end

@implementation NSString

- (id)_lowercaseFirstLetterOfString:(BOOL)a3
{
  BOOL v3 = a3;
  NSUInteger v5 = [(NSString *)self length];
  if (v5)
  {
    unint64_t v6 = v5;
    v7 = [(NSString *)self substringToIndex:1];
    v8 = v7;
    if (v3) {
      [v7 lowercaseString];
    }
    else {
    v9 = [v7 uppercaseString];
    }

    if (v6 >= 2)
    {
      v10 = [(NSString *)self substringFromIndex:1];
      uint64_t v11 = [(NSString *)v9 stringByAppendingString:v10];

      v9 = (NSString *)v11;
    }
  }
  else
  {
    v9 = self;
  }

  return v9;
}

- (id)stringByLowercasingFirstLetter
{
  return [(NSString *)self _lowercaseFirstLetterOfString:1];
}

- (id)stringByUppercasingFirstLetter
{
  return [(NSString *)self _lowercaseFirstLetterOfString:0];
}

@end