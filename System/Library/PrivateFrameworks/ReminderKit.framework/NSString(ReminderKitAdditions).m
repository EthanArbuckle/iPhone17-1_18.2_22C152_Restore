@interface NSString(ReminderKitAdditions)
+ (uint64_t)rem_isFirstString:()ReminderKitAdditions equalToSecondString:;
- (BOOL)rem_hasPrefixCaseInsensitive:()ReminderKitAdditions;
- (id)rem_addingMailto;
- (id)rem_addingTel;
- (id)rem_removingMailto;
- (id)rem_removingTel;
- (uint64_t)rem_hasMailto;
- (uint64_t)rem_hasTel;
@end

@implementation NSString(ReminderKitAdditions)

- (BOOL)rem_hasPrefixCaseInsensitive:()ReminderKitAdditions
{
  return [a1 rangeOfString:a3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)rem_hasMailto
{
  return objc_msgSend(a1, "rem_hasPrefixCaseInsensitive:", @"mailto:");
}

- (id)rem_addingMailto
{
  if (objc_msgSend(a1, "rem_hasMailto"))
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [@"mailto:" stringByAppendingString:a1];
  }

  return v2;
}

- (id)rem_removingMailto
{
  id v1 = a1;
  if (objc_msgSend(v1, "rem_hasMailto"))
  {
    uint64_t v2 = [v1 substringFromIndex:7];

    id v1 = (id)v2;
  }

  return v1;
}

- (uint64_t)rem_hasTel
{
  return objc_msgSend(a1, "rem_hasPrefixCaseInsensitive:", @"tel:");
}

- (id)rem_addingTel
{
  if (objc_msgSend(a1, "rem_hasTel"))
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [@"tel:" stringByAppendingString:a1];
  }

  return v2;
}

- (id)rem_removingTel
{
  id v1 = a1;
  if (objc_msgSend(v1, "rem_hasTel"))
  {
    uint64_t v2 = [v1 substringFromIndex:4];

    id v1 = (id)v2;
  }

  return v1;
}

+ (uint64_t)rem_isFirstString:()ReminderKitAdditions equalToSecondString:
{
  unint64_t v5 = a3;
  unint64_t v6 = a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [(id)v5 isEqualToString:v6];
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

@end