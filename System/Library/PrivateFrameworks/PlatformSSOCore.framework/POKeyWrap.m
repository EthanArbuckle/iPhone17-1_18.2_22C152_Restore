@interface POKeyWrap
- (POKeyWrap)init;
- (id)unwrapBlob:(id)a3;
- (id)wrapBlob:(id)a3;
@end

@implementation POKeyWrap

- (POKeyWrap)init
{
  v3.receiver = self;
  v3.super_class = (Class)POKeyWrap;
  return [(POKeyWrap *)&v3 init];
}

- (id)wrapBlob:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 length];
  v5 = (const __SecRandom *)*MEMORY[0x263F17510];
  if (!SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 0x20uLL, bytes) && !SecRandomCopyBytes(v5, 0x10uLL, &v17))
  {
    unsigned int v15 = 72;
    if (aks_wrap_key(bytes, 32, 13, -1, __src, (int *)&v15, 0))
    {
      memset_s(bytes, 0, 32, 0x20uLL);
      id v6 = __22__POKeyWrap_wrapBlob___block_invoke();
    }
    else
    {
      size_t v7 = v15;
      if (v15 < 0x49)
      {
        id v9 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v4 + v15 + 36];
        v10 = (_DWORD *)[v9 mutableBytes];
        _DWORD *v10 = v7;
        v11 = v10 + 1;
        memcpy(v10 + 1, __src, v7);
        *(_OWORD *)((char *)v11 + v7) = v17;
        [v3 bytes];
        int v12 = CCCryptorGCMOneshotEncrypt();
        memset_s(bytes, 0, 32, 0x20uLL);
        if (!v12) {
          goto LABEL_10;
        }
        id v13 = __22__POKeyWrap_wrapBlob___block_invoke_8();
      }
      else
      {
        memset_s(bytes, 0, 32, 0x20uLL);
        id v8 = __22__POKeyWrap_wrapBlob___block_invoke_3();
      }
    }
  }
  id v9 = 0;
LABEL_10:

  return v9;
}

id __22__POKeyWrap_wrapBlob___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with wrap key size"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __22__POKeyWrap_wrapBlob___block_invoke_cold_1();
  }

  return v0;
}

id __22__POKeyWrap_wrapBlob___block_invoke_3()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with wrap key"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __22__POKeyWrap_wrapBlob___block_invoke_8()
{
  v0 = +[POError errorWithCode:-1001 description:@"Crypto error wrapping key"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __22__POKeyWrap_wrapBlob___block_invoke_cold_1();
  }

  return v0;
}

- (id)unwrapBlob:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = [v3 length];
  id v5 = v3;
  id v6 = (unsigned int *)[v5 bytes];

  if (v4 <= 0xF)
  {
    id v7 = __24__POKeyWrap_unwrapBlob___block_invoke();
LABEL_13:
    id v17 = 0;
    goto LABEL_14;
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFCLL) == 0x10)
  {
    id v8 = __24__POKeyWrap_unwrapBlob___block_invoke_17();
    goto LABEL_13;
  }
  unsigned int v11 = *v6;
  v10 = v6 + 1;
  int v9 = v11;
  unint64_t v12 = v4 - 20 - v11;
  if (v4 - 20 < v11)
  {
    id v13 = __24__POKeyWrap_unwrapBlob___block_invoke_23();
    goto LABEL_13;
  }
  int v21 = 32;
  if (aks_unwrap_key(v10, v9, 13, -1, __s, &v21))
  {
    memset_s(__s, 0, 32, 0x20uLL);
    id v14 = __24__POKeyWrap_unwrapBlob___block_invoke_29();
    goto LABEL_13;
  }
  if (v21 != 32)
  {
    memset_s(__s, 0, 32, 0x20uLL);
    id v16 = __24__POKeyWrap_unwrapBlob___block_invoke_33();
    goto LABEL_13;
  }
  if (v12 <= 0xF)
  {
    memset_s(__s, 0, 32, 0x20uLL);
    id v15 = __24__POKeyWrap_unwrapBlob___block_invoke_39();
    goto LABEL_13;
  }
  id v17 = [MEMORY[0x263EFF990] dataWithLength:v12 - 16];
  [v17 mutableBytes];
  int v19 = CCCryptorGCMOneshotDecrypt();
  memset_s(__s, 0, 32, 0x20uLL);
  if (v19) {
    id v20 = __24__POKeyWrap_unwrapBlob___block_invoke_45();
  }
LABEL_14:
  return v17;
}

id __24__POKeyWrap_unwrapBlob___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with unwrap key tag size"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_17()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with unwrap key size data"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_23()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with wrap key data"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_29()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with unwrapping key"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __22__POKeyWrap_wrapBlob___block_invoke_cold_1();
  }

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_33()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with unwrap key size"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_39()
{
  v0 = +[POError errorWithCode:-1001 description:@"Error with unwrap data size"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __24__POKeyWrap_unwrapBlob___block_invoke_45()
{
  v0 = +[POError errorWithCode:-1001 description:@"Crypto error unwrapping key"];
  v1 = PO_LOG_POKeyWrap();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __22__POKeyWrap_wrapBlob___block_invoke_cold_1();
  }

  return v0;
}

void __22__POKeyWrap_wrapBlob___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  v1 = [NSNumber numberWithInt:*(unsigned int *)(v0 + 32)];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);
}

@end