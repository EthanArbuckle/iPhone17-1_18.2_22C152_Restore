@interface NSString
+ (id)hexStringWithData:(id)a3;
- (id)initHexStringWithData:(id)a3;
@end

@implementation NSString

+ (id)hexStringWithData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initHexStringWithData:v3];

  return v4;
}

- (id)initHexStringWithData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && (id v6 = [v4 length],
        v7 = (char *)[v5 bytes],
        uint64_t v8 = 2 * (void)v6,
        (v9 = (char *)malloc_type_malloc(2 * (void)v6, 0xFBA8534AuLL)) != 0))
  {
    if (v6)
    {
      v10 = v9 + 1;
      do
      {
        if (*v7 <= 0x9Fu) {
          char v11 = 48;
        }
        else {
          char v11 = 55;
        }
        *(v10 - 1) = v11 + (*v7 >> 4);
        char v12 = *v7++;
        unsigned int v13 = v12 & 0xF;
        if (v13 <= 9) {
          char v14 = 48;
        }
        else {
          char v14 = 55;
        }
        unsigned char *v10 = v14 + v13;
        v10 += 2;
        id v6 = (char *)v6 - 1;
      }
      while (v6);
    }
    self = [(NSString *)self initWithBytesNoCopy:v9 length:v8 encoding:1 freeWhenDone:1];
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end