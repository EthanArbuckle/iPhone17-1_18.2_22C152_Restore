@interface BaseMifareDecoder
+ (BOOL)canDecodeSPId:(unsigned __int8)a3;
+ (BOOL)didTransactionError:(id *)a3 withTransactionResult:(unsigned __int16 *)a4;
+ (BOOL)getDontWaitForEOT;
+ (BOOL)supportsPlasticCardMode:(unsigned __int8)a3 withTransceiver:(id)a4;
+ (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
+ (id)getEmReentryDelayMs;
+ (id)getServiceProvider:(unsigned __int8)a3;
+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9;
+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
@end

@implementation BaseMifareDecoder

+ (BOOL)canDecodeSPId:(unsigned __int8)a3
{
  return 1;
}

+ (id)getServiceProvider:(unsigned __int8)a3
{
  char v3 = a3 - 48;
  if (a3 - 48) < 7 && ((0x59u >> v3))
  {
    v4 = (void *)*((void *)&off_1E65AE410 + v3);
  }
  else
  {
    v4 = [NSString stringWithFormat:@"%d", a3];
  }

  return v4;
}

+ (id)getEmReentryDelayMs
{
  return &unk_1F24E2488;
}

+ (BOOL)getDontWaitForEOT
{
  return 0;
}

+ (BOOL)didTransactionError:(id *)a3 withTransactionResult:(unsigned __int16 *)a4
{
  BOOL v6 = *(unsigned __int16 *)((char *)&a3->var7 + 1) == 18 && a3->var8[1] == 1
    || *(unsigned __int16 *)((char *)&a3->var7 + 1) == 19 && a3->var8[1] == 238;
  BOOL v7 = *(_WORD *)&a3->var4[31] == 0x4000 && v6;
  if (a4)
  {
    if (v7) {
      __int16 v8 = 64;
    }
    else {
      __int16 v8 = 0;
    }
    if (HIBYTE(a3->var7) == 15) {
      unsigned __int16 v9 = -4096;
    }
    else {
      unsigned __int16 v9 = v8;
    }
    *a4 = v9;
  }
  return !v7;
}

+ (BOOL)supportsPlasticCardMode:(unsigned __int8)a3 withTransceiver:(id)a4
{
  return 0;
}

+ (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  __int16 v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "MIFARE Decoder doesn't support GetState", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"MIFARE Decoder doesn't support GetState"];
  v10 = (void *)v9;
  if (a7)
  {
    id v11 = *a7;
    v12 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v21[0] = *MEMORY[0x1E4F28568];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      v14 = (void *)MEMORY[0x1E4F1C9E8];
      v15 = v22;
      v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      v14 = (void *)MEMORY[0x1E4F1C9E8];
      v15 = v24;
      v16 = &v23;
      uint64_t v17 = 1;
    }
    v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:2 userInfo:v18];
  }
  return 0;
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = ATLLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_ERROR, "MIFARE Decoder doesn't support getServiceProviderData", v21, 2u);
  }

  uint64_t v10 = [[NSString alloc] initWithFormat:@"MIFARE Decoder doesn't support getServiceProviderData"];
  id v11 = (void *)v10;
  if (a9)
  {
    id v12 = *a9;
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    if (*a9)
    {
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      v22[0] = *MEMORY[0x1E4F28568];
      v22[1] = v14;
      v23[0] = v10;
      v23[1] = v12;
      v15 = (void *)MEMORY[0x1E4F1C9E8];
      v16 = v23;
      uint64_t v17 = v22;
      uint64_t v18 = 2;
    }
    else
    {
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v25[0] = v10;
      v15 = (void *)MEMORY[0x1E4F1C9E8];
      v16 = v25;
      uint64_t v17 = &v24;
      uint64_t v18 = 1;
    }
    v19 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
    *a9 = [v13 errorWithDomain:@"ATL" code:2 userInfo:v19];
  }
  return 0;
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  __int16 v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "MIFARE Decoder doesn't support getServiceProviderData", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"MIFARE Decoder doesn't support getServiceProviderData"];
  uint64_t v10 = (void *)v9;
  if (a7)
  {
    id v11 = *a7;
    id v12 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v21[0] = *MEMORY[0x1E4F28568];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      v15 = v22;
      v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      v15 = v24;
      v16 = &v23;
      uint64_t v17 = 1;
    }
    uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:2 userInfo:v18];
  }
  return 0;
}

@end