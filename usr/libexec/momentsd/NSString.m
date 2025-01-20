@interface NSString
- (id)mask;
- (unint64_t)associatedEventPermission;
@end

@implementation NSString

- (unint64_t)associatedEventPermission
{
  if ([(NSString *)self isEqualToString:MOEventBundleSourceTypeContact[0]]) {
    return 10;
  }
  if ([(NSString *)self isEqualToString:MOEventBundleSourceTypeMedia[0]]) {
    return 4;
  }
  if ([(NSString *)self isEqualToString:MOEventBundleSourceTypePeopleContext[0]]) {
    return 23;
  }
  if ([(NSString *)self isEqualToString:MOEventBundleSourceTypePhoto[0]]) {
    return 5;
  }
  if ([(NSString *)self isEqualToString:MOEventBundleSourceTypeThirdPartyMedia[0]]) {
    return 4;
  }
  if ([(NSString *)self isEqualToString:MOEventBundleSourceTypeStateOfMind[0]]) {
    return 24;
  }
  if ([(NSString *)self isEqualToString:MOEventBundleSourceTypeVisitLocation[0]]) {
    return 1;
  }
  if ([(NSString *)self isEqualToString:MOEventBundleSourceTypeActivity]) {
    return 2;
  }
  return 0;
}

- (id)mask
{
  if ([(NSString *)self length])
  {
    if ((id)[(NSString *)self length] == (id)1)
    {
      v3 = @"*";
    }
    else
    {
      if ((id)[(NSString *)self length] == (id)2)
      {
        v4 = [(NSString *)self substringToIndex:1];
        v3 = +[NSString stringWithFormat:@"%@*", v4];
      }
      else
      {
        unint64_t v5 = (unint64_t)((double)[(NSString *)self length] * 0.499999);
        NSUInteger v6 = [(NSString *)self length];
        if ((v6 - v5) >> 1 <= 1) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = (v6 - v5) >> 1;
        }
        NSUInteger v8 = [(NSString *)self length];
        v4 = [(NSString *)self substringToIndex:v7];
        v9 = [&stru_1002D2AC8 stringByPaddingToLength:v5 withString:@"*" startingAtIndex:0];
        v10 = [(NSString *)self substringFromIndex:(char *)[(NSString *)self length] + v5 - v8 + v7];
        v3 = +[NSString stringWithFormat:@"%@%@%@", v4, v9, v10];
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end