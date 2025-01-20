@interface NSData
+ (NSData)dataWithHexString:(id)a3;
+ (id)generateRandomBytesOfSize:(unint64_t)a3;
@end

@implementation NSData

+ (id)generateRandomBytesOfSize:(unint64_t)a3
{
  v4 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:");
  if (a3 >= 4)
  {
    unint64_t v5 = a3 >> 2;
    unsigned int v6 = 1;
    do
    {
      uint32_t v9 = 0;
      uint32_t v9 = arc4random();
      [v4 appendBytes:&v9 length:4];
    }
    while (v5 > v6++);
  }

  return v4;
}

+ (NSData)dataWithHexString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  uint64_t v5 = (uint64_t)v4;
  if (v4 && (v4 & 1) == 0)
  {
    id v6 = objc_alloc((Class)NSMutableData);
    if (v5 >= 0) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 + 1;
    }
    id v8 = [v6 initWithLength:v7 >> 1];
    uint32_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = [v10 mutableBytes];
      v12 = [v3 UTF8String];
      __str[2] = 0;
      int v13 = *v12;
      if (!*v12)
      {
LABEL_14:
        id v16 = [v10 copy];
LABEL_25:

        goto LABEL_26;
      }
      v14 = v12 + 2;
      while (1)
      {
        __str[0] = v13;
        uint64_t v15 = *(v14 - 1);
        __str[1] = *(v14 - 1);
        if ((v13 & 0x80) != 0) {
          break;
        }
        id v16 = 0;
        if ((_DefaultRuneLocale.__runetype[v13] & 0x10000) == 0 || (char)v15 < 0) {
          goto LABEL_25;
        }
        if ((_DefaultRuneLocale.__runetype[v15] & 0x10000) == 0) {
          break;
        }
        *v11++ = strtoul(__str, 0, 16);
        int v13 = *v14;
        v14 += 2;
        if (!v13) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B808);
      }
      v18 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_100040650(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    id v16 = 0;
    goto LABEL_25;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B7E8);
  }
  v17 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_100040688((uint64_t)v3, v5, v17);
  }
  id v16 = 0;
LABEL_26:

  return (NSData *)v16;
}

@end