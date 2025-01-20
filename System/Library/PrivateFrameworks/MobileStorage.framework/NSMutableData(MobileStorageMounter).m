@interface NSMutableData(MobileStorageMounter)
+ (id)dataWithHexString:()MobileStorageMounter;
- (id)initDataWithHexString:()MobileStorageMounter;
@end

@implementation NSMutableData(MobileStorageMounter)

+ (id)dataWithHexString:()MobileStorageMounter
{
  v3 = (objc_class *)MEMORY[0x263EFF990];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initDataWithHexString:v4];

  return v5;
}

- (id)initDataWithHexString:()MobileStorageMounter
{
  id v4 = a3;
  __int16 v17 = 0;
  if (v4)
  {
    v5 = [MEMORY[0x263F08708] alphanumericCharacterSet];
    v6 = [v4 stringByTrimmingCharactersInSet:v5];

    if ([v6 isEqualToString:&stru_26CE685F8])
    {
      if ([v4 length]) {
        uint64_t v7 = [[NSString alloc] initWithFormat:@"0%@", v4];
      }
      else {
        uint64_t v7 = [v4 copy];
      }
      v9 = (void *)v7;
      a1 = (id)[a1 init];
      if (a1)
      {
        if ((int)[v9 length] >= 2)
        {
          uint64_t v10 = 0;
          uint64_t v11 = 1;
          do
          {
            __str[0] = [v9 characterAtIndex:v11 - 1];
            __str[1] = [v9 characterAtIndex:v11];
            HIBYTE(v17) = strtol(__str, 0, 16);
            [a1 appendBytes:(char *)&v17 + 1 length:1];
            ++v10;
            int v12 = [v9 length];
            if (v12 >= 0) {
              int v13 = v12;
            }
            else {
              int v13 = v12 + 1;
            }
            v11 += 2;
          }
          while (v10 < v13 >> 1);
        }
        v8 = a1;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v6 = 0;
  }
  id v14 = v8;

  return v14;
}

@end