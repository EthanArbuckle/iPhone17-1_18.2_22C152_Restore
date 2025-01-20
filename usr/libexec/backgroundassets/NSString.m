@interface NSString
- (id)_baassets_stringByRemovingLastIdentifierComponent;
- (id)_baassets_validUTI;
- (id)_baassets_validUTIWithWildcard;
@end

@implementation NSString

- (id)_baassets_stringByRemovingLastIdentifierComponent
{
  id v3 = [(NSString *)self rangeOfString:@"." options:4];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = &stru_10005DEF8;
  }
  else
  {
    v4 = [(NSString *)self substringToIndex:v3];
  }

  return v4;
}

- (id)_baassets_validUTI
{
  id v3 = +[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-."];
  v4 = [v3 invertedSet];

  v5 = [(NSString *)self stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (id)_baassets_validUTIWithWildcard
{
  id v3 = +[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-.*"];
  v4 = [v3 invertedSet];

  v5 = [(NSString *)self stringByTrimmingCharactersInSet:v4];

  return v5;
}

@end