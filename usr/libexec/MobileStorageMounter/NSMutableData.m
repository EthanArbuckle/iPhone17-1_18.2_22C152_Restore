@interface NSMutableData
+ (NSMutableData)dataWithHexString:(id)a3;
- (id)initDataWithHexString:(id)a3;
@end

@implementation NSMutableData

+ (NSMutableData)dataWithHexString:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableData) initDataWithHexString:v3];

  return (NSMutableData *)v4;
}

- (id)initDataWithHexString:(id)a3
{
  id v4 = a3;
  __int16 v17 = 0;
  if (v4)
  {
    v5 = +[NSCharacterSet alphanumericCharacterSet];
    v6 = [v4 stringByTrimmingCharactersInSet:v5];

    if ([v6 isEqualToString:&stru_10002F6E8])
    {
      if ([v4 length]) {
        id v7 = [objc_alloc((Class)NSString) initWithFormat:@"0%@", v4];
      }
      else {
        id v7 = [v4 copy];
      }
      v9 = v7;
      self = [(NSMutableData *)self init];
      if (self)
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
            [(NSMutableData *)self appendBytes:(char *)&v17 + 1 length:1];
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
        v8 = self;
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
  v14 = v8;

  return v14;
}

@end