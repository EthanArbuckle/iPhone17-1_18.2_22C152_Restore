@interface NSString(TSUPersonNameComponents)
+ (id)tsu_localizedDisplayNameWithPersonNameComponents:()TSUPersonNameComponents;
@end

@implementation NSString(TSUPersonNameComponents)

+ (id)tsu_localizedDisplayNameWithPersonNameComponents:()TSUPersonNameComponents
{
  id v3 = a3;
  if (!v3)
  {
    v9 = 0;
    goto LABEL_17;
  }
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_206);
  }
  v4 = [v3 givenName];
  uint64_t v5 = [v4 length];
  v6 = [v3 familyName];
  uint64_t v7 = [v6 length];
  if (v5 && v7)
  {
    if ((objc_msgSend(v4, "tsu_isCJKString") & 1) != 0 || objc_msgSend(v6, "tsu_isCJKString"))
    {
      id v8 = [v6 stringByAppendingString:v4];
    }
    else
    {
      id v8 = [NSString stringWithFormat:@"%@ %@", v4, v6];
    }
  }
  else if (v5)
  {
    id v8 = v4;
  }
  else
  {
    if (!v7)
    {
      v9 = 0;
      goto LABEL_16;
    }
    id v8 = v6;
  }
  v9 = v8;
LABEL_16:

LABEL_17:
  return v9;
}

@end