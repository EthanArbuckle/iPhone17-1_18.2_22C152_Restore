@interface CopernicusHCEDecoder
+ (BOOL)isCopernicusHCE:(id)a3;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
@end

@implementation CopernicusHCEDecoder

+ (BOOL)isCopernicusHCE:(id)a3
{
  return [a3 isEqualToString:@"A000000704D011500000000003000000"];
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"Supported";
  v10[0] = MEMORY[0x1E4F1CC38];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10, &v9, 1, a6, a7];

  return v7;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "HCE has no history", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"HCE has no history"];
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
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "HCE has no EOT", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"HCE has no EOT"];
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
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ((unint64_t)[v10 length] > 1)
  {
    v22 = (void *)MEMORY[0x1E4F1CA60];
    v27[0] = @"EventType";
    v27[1] = @"appletIdentifier";
    v28[0] = @"EndEvent";
    v28[1] = v11;
    v27[2] = @"didError";
    v27[3] = @"command";
    v28[2] = MEMORY[0x1E4F1CC38];
    v28[3] = &unk_1F24E24A0;
    v27[4] = @"status";
    v27[5] = @"result";
    v28[4] = &unk_1F24E24A0;
    v28[5] = &unk_1F24E24B8;
    v27[6] = @"informative";
    v28[6] = &unk_1F24E24A0;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];
    a8 = [v22 dictionaryWithDictionary:v23];

    if ((unint64_t)[v10 length] < 4) {
      goto LABEL_12;
    }
    uint64_t v24 = [v10 bytes];
    v14 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v24 + 2)) >> 16];
    [a8 setObject:v14 forKeyedSubscript:@"PairingModeBrandCode"];
  }
  else
  {
    v12 = ATLLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v34 = [v10 length];
      _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_ERROR, "Bad length %u", buf, 8u);
    }

    uint64_t v13 = [[NSString alloc] initWithFormat:@"Bad length %u", [v10 length]];
    v14 = (void *)v13;
    if (a8)
    {
      id v15 = *a8;
      v16 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v17 = *MEMORY[0x1E4F28A50];
        v29[0] = *MEMORY[0x1E4F28568];
        v29[1] = v17;
        v30[0] = v13;
        v30[1] = v15;
        v18 = (void *)MEMORY[0x1E4F1C9E8];
        v19 = v30;
        v20 = v29;
        uint64_t v21 = 2;
      }
      else
      {
        uint64_t v31 = *MEMORY[0x1E4F28568];
        uint64_t v32 = v13;
        v18 = (void *)MEMORY[0x1E4F1C9E8];
        v19 = &v32;
        v20 = &v31;
        uint64_t v21 = 1;
      }
      v25 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:v21];
      *a8 = [v16 errorWithDomain:@"ATL" code:3 userInfo:v25];

      a8 = 0;
    }
  }

LABEL_12:

  return a8;
}

@end