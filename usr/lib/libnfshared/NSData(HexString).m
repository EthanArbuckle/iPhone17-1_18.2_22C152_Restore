@interface NSData(HexString)
+ (id)NF_dataWithHexString:()HexString;
- (__CFString)NF_asHexString;
@end

@implementation NSData(HexString)

+ (id)NF_dataWithHexString:()HexString
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 length];
  unint64_t v5 = v4;
  if (!v4 || (v4 & 1) != 0)
  {
    v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v18 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v18)
      {
        v18(4, "%s:%i String is of invalid length=%ld", "+[NSData(HexString) NF_dataWithHexString:]", 18, v5);
        v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v19 = dispatch_get_specific(v16);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v7 = (id)_NFSharedLogClient[(void)v19];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__str = 136446722;
        v27 = "+[NSData(HexString) NF_dataWithHexString:]";
        __int16 v28 = 1024;
        int v29 = 18;
        __int16 v30 = 2048;
        unint64_t v31 = v5;
        _os_log_impl(&dword_1CA51A000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i String is of invalid length=%ld", (uint8_t *)__str, 0x1Cu);
      }
      goto LABEL_27;
    }
    goto LABEL_31;
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v4 >> 1];
  if (!v6)
  {
    v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v21 < 4)
    {
      v22 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v21);
      if (v22)
      {
        v22(3, "%s:%i Memory allocation request failed.", "+[NSData(HexString) NF_dataWithHexString:]", 25);
        v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v23 = dispatch_get_specific(v20);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v24 = (id)_NFSharedLogClient[(void)v23];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__str = 136446466;
        v27 = "+[NSData(HexString) NF_dataWithHexString:]";
        __int16 v28 = 1024;
        int v29 = 25;
        _os_log_impl(&dword_1CA51A000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i Memory allocation request failed.", (uint8_t *)__str, 0x12u);
      }

      v7 = 0;
      goto LABEL_27;
    }
LABEL_31:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v7 = v6;
  v8 = (unsigned char *)[v7 mutableBytes];
  v9 = (unsigned char *)[v3 UTF8String];
  __str[2] = 0;
  unsigned int v10 = *v9;
  if (!*v9)
  {
LABEL_11:
    id v13 = [v7 copy];
    goto LABEL_28;
  }
  v11 = v9 + 2;
  uint64_t v12 = MEMORY[0x1E4F14390];
  id v13 = 0;
  while (1)
  {
    __str[0] = v10;
    uint64_t v14 = *(v11 - 1);
    __str[1] = *(v11 - 1);
    if ((v10 & 0x80) != 0) {
      break;
    }
    if ((*(_DWORD *)(v12 + 4 * v10 + 60) & 0x10000) == 0 || (char)v14 < 0) {
      goto LABEL_28;
    }
    if ((*(_DWORD *)(v12 + 4 * v14 + 60) & 0x10000) == 0) {
      break;
    }
    *v8++ = strtoul(__str, 0, 16);
    unsigned int v15 = *v11;
    v11 += 2;
    unsigned int v10 = v15;
    if (!v15) {
      goto LABEL_11;
    }
  }
LABEL_27:
  id v13 = 0;
LABEL_28:

  return v13;
}

- (__CFString)NF_asHexString
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  if (!v2)
  {
LABEL_14:
    v9 = &stru_1F24CADC0;
    goto LABEL_15;
  }
  uint64_t v3 = v2;
  unint64_t v4 = (char *)malloc_type_calloc(1uLL, (2 * v2) | 1, 0x100004077774924uLL);
  if (!v4)
  {
    unsigned int v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    uint64_t v12 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v12)
    {
      v12(3, "%s:%i Memory allocation request failed.", "-[NSData(HexString) NF_asHexString]", 61);
      unsigned int v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    id v13 = dispatch_get_specific(v10);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    uint64_t v14 = (id)_NFSharedLogClient[(void)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[NSData(HexString) NF_asHexString]";
      __int16 v18 = 1024;
      int v19 = 61;
      _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Memory allocation request failed.", buf, 0x12u);
    }

    goto LABEL_14;
  }
  unint64_t v5 = v4;
  v6 = (unsigned __int8 *)[a1 bytes];
  v7 = v5;
  do
  {
    int v8 = *v6++;
    sprintf(v7, "%02X", v8);
    v7 += 2;
    --v3;
  }
  while (v3);
  v9 = (__CFString *)[[NSString alloc] initWithUTF8String:v5];
  free(v5);
LABEL_15:

  return v9;
}

@end