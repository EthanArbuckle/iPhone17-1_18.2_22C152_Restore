@interface NSData
+ (NSData)dataWithHexString:(id)a3;
- (id)hexStringRepresentation;
@end

@implementation NSData

+ (NSData)dataWithHexString:(id)a3
{
  id v3 = a3;
  char v13 = 0;
  if ([v3 length])
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000C95E4((uint64_t)v3, v10);
    }
  }
  else
  {
    v4 = malloc_type_malloc((unint64_t)[v3 length] >> 1, 0x9F7E2380uLL);
    if (v4)
    {
      v5 = v4;
      if (![v3 length])
      {
LABEL_7:
        v8 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v5, (unint64_t)[v3 length] >> 1, 1);
        goto LABEL_8;
      }
      unint64_t v6 = 0;
      v7 = v5;
      while (1)
      {
        __str[0] = [v3 characterAtIndex:v6];
        __str[1] = [v3 characterAtIndex:v6 + 1];
        v11 = 0;
        unsigned char *v7 = strtol(__str, &v11, 16);
        if (v11 != &v13) {
          break;
        }
        ++v7;
        v6 += 2;
        if (v6 >= (unint64_t)[v3 length]) {
          goto LABEL_7;
        }
      }
      v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000C955C((uint64_t)v3, v6, v10);
      }
    }
    else
    {
      v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000C94CC(v3, v10);
      }
    }
  }

  v8 = 0;
LABEL_8:

  return (NSData *)v8;
}

- (id)hexStringRepresentation
{
  NSUInteger v3 = [(NSData *)self length];
  v4 = +[NSMutableString stringWithCapacity:2 * v3];
  v5 = [(NSData *)self bytes];
  if (v3)
  {
    unint64_t v6 = v5;
    do
    {
      unsigned int v7 = *v6++;
      [v4 appendFormat:@"%02lx", v7];
      --v3;
    }
    while (v3);
  }

  return v4;
}

@end