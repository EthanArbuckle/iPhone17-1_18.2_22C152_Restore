@interface NSObject(SCWAdditions)
+ (uint64_t)scw_object:()SCWAdditions isEqualToObject:;
@end

@implementation NSObject(SCWAdditions)

+ (uint64_t)scw_object:()SCWAdditions isEqualToObject:
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
      v8 = v7;
    }
    else
    {
      if (!v6)
      {
        uint64_t v9 = 0;
        goto LABEL_8;
      }
      v8 = 0;
    }
    uint64_t v9 = [v6 isEqual:v8];
  }
LABEL_8:

  return v9;
}

@end