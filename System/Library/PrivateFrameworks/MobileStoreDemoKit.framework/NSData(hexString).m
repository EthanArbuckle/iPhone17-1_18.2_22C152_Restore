@interface NSData(hexString)
+ (id)dataWithHexString:()hexString;
- (id)hexStringRepresentation;
@end

@implementation NSData(hexString)

+ (id)dataWithHexString:()hexString
{
  id v3 = a3;
  char v13 = 0;
  if ([v3 length])
  {
    v10 = defaultLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[NSData(hexString) dataWithHexString:]((uint64_t)v3, v10);
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
        v8 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v5, (unint64_t)objc_msgSend(v3, "length") >> 1, 1);
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
        if (v6 >= [v3 length]) {
          goto LABEL_7;
        }
      }
      v10 = defaultLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[NSData(hexString) dataWithHexString:v10];
      }
    }
    else
    {
      v10 = defaultLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[NSData(hexString) dataWithHexString:](v3, v10);
      }
    }
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (id)hexStringRepresentation
{
  uint64_t v2 = [a1 length];
  id v3 = [MEMORY[0x263F089D8] stringWithCapacity:2 * v2];
  uint64_t v4 = [a1 bytes];
  if (v2)
  {
    v5 = (unsigned __int8 *)v4;
    do
    {
      unsigned int v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", @"%02lx", v6);
      --v2;
    }
    while (v2);
  }
  return v3;
}

+ (void)dataWithHexString:()hexString .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  unint64_t v4 = (unint64_t)[a1 length] >> 1;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "Unable to malloc bytes of size: %lu", (uint8_t *)&v3, 0xCu);
}

+ (void)dataWithHexString:()hexString .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "String should be all hex digits: %@ (bad digit around %ld)", (uint8_t *)&v3, 0x16u);
}

+ (void)dataWithHexString:()hexString .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "Hex strings should have an even number of digits (%@)", (uint8_t *)&v2, 0xCu);
}

@end