@interface NSString(RCAdditions)
+ (id)rc_string:()RCAdditions;
+ (id)stringWithValue:()RCAdditions;
+ (uint64_t)rc_string:()RCAdditions isEqualToString:;
- (id)rc_numberFollowingString:()RCAdditions;
- (uint64_t)range;
@end

@implementation NSString(RCAdditions)

+ (uint64_t)rc_string:()RCAdditions isEqualToString:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

+ (id)rc_string:()RCAdditions
{
  v3 = a3;
  v4 = objc_opt_new();
  v3[2](v3, v4);

  id v5 = (void *)[v4 copy];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  uint64_t v8 = v7;

  return v8;
}

- (uint64_t)range
{
  return 0;
}

+ (id)stringWithValue:()RCAdditions
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = RCDynamicCast(v4, (uint64_t)v3);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    v9 = RCDynamicCast(v8, (uint64_t)v3);
    v10 = v9;
    if (v9)
    {
      id v7 = [v9 stringValue];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)rc_numberFollowingString:()RCAdditions
{
  uint64_t v4 = [NSString stringWithFormat:@"%@(\\d*)", a3];
  id v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v4 options:1 error:0];
  id v6 = objc_msgSend(v5, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  if ([v6 numberOfRanges])
  {
    uint64_t v7 = [v6 rangeAtIndex:1];
    v9 = objc_msgSend(a1, "substringWithRange:", v7, v8);
    id v10 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v10 setNumberStyle:1];
    v11 = [v10 numberFromString:v9];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end