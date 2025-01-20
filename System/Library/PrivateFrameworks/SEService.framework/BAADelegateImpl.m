@interface BAADelegateImpl
+ (BOOL)isInternal;
+ (int)confirmSigKey:(unsigned int)a3 status:(int)a4;
+ (int)generateSigKey:(unsigned int)a3 keyData:(id *)a4 attestation:(id *)a5 pubKey:(id *)a6;
+ (int)getBlessedUser:(unsigned int *)a3 keybagUUID:(unsigned __int8)a4[16];
+ (int)getSigKeyCertificates:(unsigned int)a3 certificates:(id *)a4;
+ (int)getSigKeyExpDate:(unsigned int)a3 expirationDate:(unint64_t *)a4;
+ (int)setSigKey:(unsigned int)a3 expirationDate:(unint64_t)a4 keyData:(id)a5 certificates:(id)a6;
@end

@implementation BAADelegateImpl

+ (BOOL)isInternal
{
  if (getMGAnswers_onceToken != -1) {
    dispatch_once(&getMGAnswers_onceToken, &__block_literal_global_167);
  }
  return getMGAnswers_cachedIsInternal;
}

+ (int)generateSigKey:(unsigned int)a3 keyData:(id *)a4 attestation:(id *)a5 pubKey:(id *)a6
{
  unsigned int v31 = 0;
  size_t outputStructCnt = 0;
  uint64_t inputStruct = 0;
  if (!a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:]();
    }
    goto LABEL_21;
  }
  if (!a5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:]();
    }
    goto LABEL_21;
  }
  if (!a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:]();
    }
LABEL_21:
    uint64_t v24 = 4294967292;
    goto LABEL_14;
  }
  v10 = (unsigned int *)malloc_type_calloc(0x4000uLL, 1uLL, 0xD72640C9uLL);
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = init();
    if (v12)
    {
      uint64_t v24 = v12;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:]1();
      }
      goto LABEL_13;
    }
    LODWORD(inputStruct) = 1397966179;
    WORD2(inputStruct) = 18;
    unsigned int v31 = a3;
    size_t outputStructCnt = 0x4000;
    uint64_t v13 = IOConnectCallStructMethod(_connect, 0, &inputStruct, 0xCuLL, v11, &outputStructCnt);
    if (v13)
    {
      uint64_t v24 = v13;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:]0();
      }
      goto LABEL_13;
    }
    if (outputStructCnt <= 0xB)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:].cold.5();
      }
    }
    else
    {
      if (outputStructCnt == *v11 + (unint64_t)v11[1] + v11[2] + 12)
      {
        id v14 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v11 + 3);
        if (v14)
        {
          v15 = v14;
          uint64_t v16 = (uint64_t)v11 + *v11 + 12;
          id v17 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:v16 length:v11[1]];
          if (v17)
          {
            v18 = v17;
            id v19 = (id)[MEMORY[0x263EFF8F8] dataWithBytes:v16 + v11[1] length:v11[2]];
            if (v19)
            {
              v20 = v19;
              id v21 = v15;
              *a4 = v21;
              id v22 = v18;
              *a5 = v22;
              id v23 = v20;
              *a6 = v23;

              uint64_t v24 = 0;
LABEL_13:
              free(v11);
              goto LABEL_14;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:].cold.8();
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:].cold.7();
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:].cold.6();
        }
        uint64_t v24 = 4294967291;
        goto LABEL_13;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:].cold.9();
      }
    }
    uint64_t v24 = 4294967290;
    goto LABEL_13;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[BAADelegateImpl generateSigKey:keyData:attestation:pubKey:].cold.4();
  }
  uint64_t v24 = 4294967291;
LABEL_14:
  logCmdCall((uint64_t)"generateSigKey", v24, 0, 0, 0, v25, v26, v27);
  return v24;
}

+ (int)setSigKey:(unsigned int)a3 expirationDate:(unint64_t)a4 keyData:(id)a5 certificates:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = v9;
  id v12 = v10;
  uint64_t v13 = (char *)malloc_type_calloc(0x4000uLL, 1uLL, 0xE63C3C98uLL);
  if (!v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl setSigKey:expirationDate:keyData:certificates:]();
    }
    uint64_t v26 = 4294967291;
    goto LABEL_32;
  }
  id v14 = v13;
  uint64_t v15 = init();
  if (v15)
  {
    uint64_t v26 = v15;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl setSigKey:expirationDate:keyData:certificates:].cold.7();
    }
    goto LABEL_31;
  }
  *(_DWORD *)id v14 = 1397966179;
  *((_WORD *)v14 + 2) = 19;
  *((_DWORD *)v14 + 2) = a3;
  *(void *)(v14 + 12) = a4;
  uint64_t v16 = v14 + 28;
  if (v11)
  {
    if ((unint64_t)[v11 length] >= 0x3FE5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl setSigKey:expirationDate:keyData:certificates:].cold.6();
      }
      uint64_t v26 = 4294967292;
      goto LABEL_31;
    }
    *((_DWORD *)v14 + 5) = [v11 length];
    objc_msgSend(v11, "getBytes:length:", v14 + 28, objc_msgSend(v11, "length"));
    v16 += [v11 length];
  }
  else
  {
    *((_DWORD *)v14 + 5) = 0;
  }
  if (![v12 count])
  {
    *((_DWORD *)v14 + 6) = 0;
    goto LABEL_20;
  }
  *((_DWORD *)v14 + 6) = [v12 count];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v32 = v12;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v18) {
    goto LABEL_18;
  }
  uint64_t v19 = v18;
  v20 = v14 + 0x4000;
  uint64_t v21 = *(void *)v34;
  while (2)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v34 != v21) {
        objc_enumerationMutation(v17);
      }
      id v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[BAADelegateImpl setSigKey:expirationDate:keyData:certificates:].cold.5();
        }
        goto LABEL_30;
      }
      if ((unint64_t)(v20 - v16) <= 3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[BAADelegateImpl setSigKey:expirationDate:keyData:certificates:]();
        }
        goto LABEL_30;
      }
      *(_DWORD *)uint64_t v16 = [v23 length];
      uint64_t v24 = v16 + 4;
      if ([v23 length] > (unint64_t)(v20 - v24))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[BAADelegateImpl setSigKey:expirationDate:keyData:certificates:].cold.4();
        }
LABEL_30:

        uint64_t v26 = 4294967292;
        id v12 = v32;
        goto LABEL_31;
      }
      objc_msgSend(v23, "getBytes:length:", v24, objc_msgSend(v23, "length"));
      uint64_t v16 = &v24[[v23 length]];
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_18:

  id v12 = v32;
LABEL_20:
  uint64_t v25 = IOConnectCallStructMethod(_connect, 0, v14, v16 - v14, 0, 0);
  uint64_t v26 = 0;
  if (v25)
  {
    uint64_t v27 = v25;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl setSigKey:expirationDate:keyData:certificates:]();
    }
    uint64_t v26 = v27;
  }
LABEL_31:
  free(v14);
LABEL_32:
  logCmdCall((uint64_t)"setSigKey", v26, 0, 0, 0, v28, v29, v30);

  return v26;
}

+ (int)getSigKeyExpDate:(unsigned int)a3 expirationDate:(unint64_t *)a4
{
  unsigned int v16 = 0;
  unint64_t outputStruct = 0;
  uint64_t inputStruct = 0;
  size_t v13 = 0;
  if (a4)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v11 = v6;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl getSigKeyExpDate:expirationDate:].cold.4();
      }
    }
    else
    {
      LODWORD(inputStruct) = 1397966179;
      WORD2(inputStruct) = 20;
      unsigned int v16 = a3;
      size_t v13 = 8;
      uint64_t v7 = IOConnectCallStructMethod(_connect, 0, &inputStruct, 0xCuLL, &outputStruct, &v13);
      if (v7)
      {
        uint64_t v11 = v7;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[BAADelegateImpl getSigKeyExpDate:expirationDate:]();
        }
      }
      else if (v13 == 8)
      {
        uint64_t v11 = 0;
        *a4 = outputStruct;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[BAADelegateImpl getSigKeyExpDate:expirationDate:]();
        }
        uint64_t v11 = 4294967290;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl getSigKeyExpDate:expirationDate:]();
    }
    uint64_t v11 = 4294967292;
  }
  logCmdCall((uint64_t)"getSigKeyExpDate", v11, 0, 0, 0, v8, v9, v10);
  return v11;
}

+ (int)getSigKeyCertificates:(unsigned int)a3 certificates:(id *)a4
{
  unsigned int v19 = 0;
  size_t outputStructCnt = 0;
  uint64_t inputStruct = 0;
  id v16 = 0;
  if (a4)
  {
    uint64_t v6 = malloc_type_calloc(0x4000uLL, 1uLL, 0x7CCF5ECFuLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = init();
      if (v8)
      {
        uint64_t CertificatesFromBuffer = v8;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          +[BAADelegateImpl getSigKeyCertificates:certificates:].cold.5();
        }
      }
      else
      {
        LODWORD(inputStruct) = 1397966179;
        WORD2(inputStruct) = 25;
        unsigned int v19 = a3;
        size_t outputStructCnt = 0x4000;
        uint64_t v9 = IOConnectCallStructMethod(_connect, 0, &inputStruct, 0xCuLL, v7, &outputStructCnt);
        if (v9)
        {
          uint64_t CertificatesFromBuffer = v9;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            +[BAADelegateImpl getSigKeyCertificates:certificates:].cold.4();
          }
        }
        else
        {
          int v15 = 0;
          uint64_t CertificatesFromBuffer = getCertificatesFromBuffer((int *)v7, (unint64_t)v7 + outputStructCnt, &v16, &v15);
          if (CertificatesFromBuffer)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              +[BAADelegateImpl getSigKeyCertificates:certificates:]();
            }
            if (v16) {
              CFRelease(v16);
            }
          }
          else
          {
            *a4 = v16;
          }
        }
      }
      free(v7);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl getSigKeyCertificates:certificates:]();
      }
      uint64_t CertificatesFromBuffer = 4294967291;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl getSigKeyCertificates:certificates:]();
    }
    uint64_t CertificatesFromBuffer = 4294967292;
  }
  logCmdCall((uint64_t)"getSigKeyCertificates", CertificatesFromBuffer, 0, 0, 0, v11, v12, v13);
  return CertificatesFromBuffer;
}

+ (int)confirmSigKey:(unsigned int)a3 status:(int)a4
{
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  uint64_t v6 = init();
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl confirmSigKey:status:]();
    }
  }
  else
  {
    LODWORD(v13) = 1397966179;
    WORD2(v13) = 21;
    unint64_t v14 = __PAIR64__(a4, a3);
    uint64_t v7 = IOConnectCallStructMethod(_connect, 0, &v13, 0x10uLL, 0, 0);
    if (v7)
    {
      uint64_t v12 = v7;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl confirmSigKey:status:]();
      }
      uint64_t v6 = v12;
    }
  }
  logCmdCall((uint64_t)"confirmSigKey", v6, 0, 0, 0, v8, v9, v10);
  return v6;
}

+ (int)getBlessedUser:(unsigned int *)a3 keybagUUID:(unsigned __int8)a4[16]
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t inputStruct = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  size_t v13 = 0;
  if (!a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl getBlessedUser:keybagUUID:]();
    }
    goto LABEL_12;
  }
  if (!a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl getBlessedUser:keybagUUID:]();
    }
LABEL_12:
    uint64_t v11 = 4294967292;
    goto LABEL_7;
  }
  uint64_t v6 = init();
  if (v6)
  {
    uint64_t v11 = v6;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BAADelegateImpl getBlessedUser:keybagUUID:].cold.5();
    }
  }
  else
  {
    LODWORD(inputStruct) = 1397966179;
    WORD2(inputStruct) = 24;
    size_t v13 = 20;
    uint64_t v7 = IOConnectCallStructMethod(_connect, 0, &inputStruct, 8uLL, outputStruct, &v13);
    if (v7)
    {
      uint64_t v11 = v7;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl getBlessedUser:keybagUUID:].cold.4();
      }
    }
    else if (v13 == 20)
    {
      uint64_t v11 = 0;
      *a3 = *(_DWORD *)outputStruct;
      *(_OWORD *)a4 = *(_OWORD *)&outputStruct[4];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BAADelegateImpl getBlessedUser:keybagUUID:]();
      }
      uint64_t v11 = 4294967290;
    }
  }
LABEL_7:
  logCmdCall((uint64_t)"getBlessedUser", v11, 0, 0, 0, v8, v9, v10);
  return v11;
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)generateSigKey:keyData:attestation:pubKey:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)setSigKey:expirationDate:keyData:certificates:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)setSigKey:expirationDate:keyData:certificates:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)setSigKey:expirationDate:keyData:certificates:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)setSigKey:expirationDate:keyData:certificates:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)setSigKey:expirationDate:keyData:certificates:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)setSigKey:expirationDate:keyData:certificates:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)setSigKey:expirationDate:keyData:certificates:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getSigKeyExpDate:expirationDate:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getSigKeyExpDate:expirationDate:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getSigKeyExpDate:expirationDate:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getSigKeyExpDate:expirationDate:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getSigKeyCertificates:certificates:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getSigKeyCertificates:certificates:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getSigKeyCertificates:certificates:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getSigKeyCertificates:certificates:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getSigKeyCertificates:certificates:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)confirmSigKey:status:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)confirmSigKey:status:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getBlessedUser:keybagUUID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getBlessedUser:keybagUUID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getBlessedUser:keybagUUID:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getBlessedUser:keybagUUID:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

+ (void)getBlessedUser:keybagUUID:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2146ED000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

@end