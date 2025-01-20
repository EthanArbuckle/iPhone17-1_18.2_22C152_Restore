@interface NSData(MIBUExtension)
+ (id)dataWithHexString:()MIBUExtension;
+ (id)generateRandomBytesOfSize:()MIBUExtension;
@end

@implementation NSData(MIBUExtension)

+ (id)generateRandomBytesOfSize:()MIBUExtension
{
  v4 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:");
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

+ (id)dataWithHexString:()MIBUExtension
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  uint64_t v5 = v4;
  if (v4 && (v4 & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x263EFF990]);
    if (v5 >= 0) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 + 1;
    }
    v8 = (void *)[v6 initWithLength:v7 >> 1];
    uint32_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = (unsigned char *)[v10 mutableBytes];
      v12 = (unsigned char *)[v3 UTF8String];
      __str[2] = 0;
      unsigned int v13 = *v12;
      if (!*v12)
      {
LABEL_14:
        v17 = (void *)[v10 copy];
LABEL_25:

        goto LABEL_26;
      }
      v14 = v12 + 2;
      uint64_t v15 = MEMORY[0x263EF8318];
      while (1)
      {
        __str[0] = v13;
        uint64_t v16 = *(v14 - 1);
        __str[1] = *(v14 - 1);
        if ((v13 & 0x80) != 0) {
          break;
        }
        v17 = 0;
        if ((*(_DWORD *)(v15 + 4 * v13 + 60) & 0x10000) == 0 || (char)v16 < 0) {
          goto LABEL_25;
        }
        if ((*(_DWORD *)(v15 + 4 * v16 + 60) & 0x10000) == 0) {
          break;
        }
        *v11++ = strtoul(__str, 0, 16);
        unsigned int v13 = *v14;
        v14 += 2;
        if (!v13) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_5_1);
      }
      v19 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        +[NSData(MIBUExtension) dataWithHexString:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    v17 = 0;
    goto LABEL_25;
  }
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_1);
  }
  v18 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
    +[NSData(MIBUExtension) dataWithHexString:v18];
  }
  v17 = 0;
LABEL_26:

  return v17;
}

+ (void)dataWithHexString:()MIBUExtension .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)dataWithHexString:()MIBUExtension .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2309BC000, log, OS_LOG_TYPE_ERROR, "String %{public}@ is of invalid length=%ld", (uint8_t *)&v3, 0x16u);
}

@end