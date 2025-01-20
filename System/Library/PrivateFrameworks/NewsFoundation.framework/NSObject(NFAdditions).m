@interface NSObject(NFAdditions)
+ (uint64_t)nf_compareObject:()NFAdditions toObject:;
+ (uint64_t)nf_object:()NFAdditions isEqualToObject:;
@end

@implementation NSObject(NFAdditions)

+ (uint64_t)nf_compareObject:()NFAdditions toObject:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 0;
  }
  else if (v5)
  {
    if (v6) {
      uint64_t v8 = [v5 compare:v6];
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

+ (uint64_t)nf_object:()NFAdditions isEqualToObject:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    uint64_t v9 = 1;
  }
  else
  {
    if (v5)
    {
      id v6 = v5;
      uint64_t v8 = v7;
    }
    else
    {
      if (!v6)
      {
        uint64_t v9 = 0;
        goto LABEL_8;
      }
      uint64_t v8 = 0;
    }
    uint64_t v9 = [v6 isEqual:v8];
  }
LABEL_8:

  return v9;
}

@end