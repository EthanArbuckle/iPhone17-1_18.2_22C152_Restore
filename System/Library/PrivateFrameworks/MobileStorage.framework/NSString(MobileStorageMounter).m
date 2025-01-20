@interface NSString(MobileStorageMounter)
+ (id)hexStringWithData:()MobileStorageMounter;
- (id)initHexStringWithData:()MobileStorageMounter;
@end

@implementation NSString(MobileStorageMounter)

+ (id)hexStringWithData:()MobileStorageMounter
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initHexStringWithData:v4];

  return v5;
}

- (id)initHexStringWithData:()MobileStorageMounter
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && (uint64_t v6 = [v4 length],
        v7 = (char *)[v5 bytes],
        uint64_t v8 = 2 * v6,
        (v9 = (char *)malloc_type_malloc(2 * v6, 0xFBA8534AuLL)) != 0))
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
        --v6;
      }
      while (v6);
    }
    a1 = (id)[a1 initWithBytesNoCopy:v9 length:v8 encoding:1 freeWhenDone:1];
    id v15 = a1;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

@end