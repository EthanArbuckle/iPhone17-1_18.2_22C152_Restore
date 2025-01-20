@interface MifareDecoder
+ (BOOL)didTransactionError:(unsigned __int8)a3 withISOParameters:(id *)a4 withTransactionResult:(unsigned __int16 *)a5;
+ (BOOL)didTransactionError:(unsigned __int8)a3 withParameters:(id *)a4 withTransactionResult:(unsigned __int16 *)a5;
+ (BOOL)getDontWaitForEOT:(unsigned __int8)a3;
+ (id)ParseEndEventShort:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (id)ParseTimeoutEventISO:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (id)ParseTimeoutEventNative:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (id)getAppletStateAndHistory:(unsigned __int8)a3 withTransceiver:(id)a4 withApplet:(id)a5 withPackage:(id)a6 withModule:(id)a7 withError:(id *)a8;
+ (id)getEmReentryDelayMs:(unsigned __int8)a3;
+ (id)getSPID:(id)a3 withApplet:(id)a4 withError:(id *)a5;
+ (id)getServiceProvider:(unsigned __int8)a3;
+ (id)getSubDecoder:(unsigned __int8)a3;
+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (id)parseEndEventISO:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (id)parseStartEventISO:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (id)parseStartEventNative:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (BOOL)supportsPlasticCardMode:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
@end

@implementation MifareDecoder

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ((unint64_t)[v10 length] <= 1)
  {
    v12 = ATLLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v45 = [v10 length];
      _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
    }

    uint64_t v13 = [[NSString alloc] initWithFormat: @"Short eventData? %u", [v10 length]];
    v14 = (void *)v13;
    if (!a8) {
      goto LABEL_33;
    }
    id v15 = *a8;
    v16 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v17 = *MEMORY[0x1E4F28A50];
      v48[0] = *MEMORY[0x1E4F28568];
      v48[1] = v17;
      v49[0] = v13;
      v49[1] = v15;
      v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = v49;
      v20 = v48;
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v51[0] = v13;
      v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = v51;
      v20 = &v50;
      uint64_t v21 = 1;
    }
    v26 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:v21];
    v27 = v16;
    uint64_t v28 = 6;
LABEL_32:
    *a8 = [v27 errorWithDomain:@"ATL" code:v28 userInfo:v26];

LABEL_33:
    v38 = 0;
    goto LABEL_36;
  }
  uint64_t v22 = [v10 u8:0];
  uint64_t v23 = [v10 u8:1];
  uint64_t v24 = v23;
  if (v22 == 16)
  {
    if ((v23 - 3) <= 1)
    {
      uint64_t v25 = +[MifareDecoder ParseTimeoutEventNative:v10 withApplet:v11 error:a8];
      goto LABEL_35;
    }
    if (v23 == 255)
    {
      uint64_t v25 = +[MifareDecoder ParseTimeoutEventISO:v10 withApplet:v11 error:a8];
      goto LABEL_35;
    }
LABEL_25:
    v29 = ATLLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v45 = v22;
      __int16 v46 = 1024;
      int v47 = v24;
      _os_log_impl(&dword_1CA552000, v29, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
    }

    uint64_t v30 = [[NSString alloc] initWithFormat:@"Invalid event type 0x%x version 0x%x", v22, v24];
    v14 = (void *)v30;
    if (!a8) {
      goto LABEL_33;
    }
    id v31 = *a8;
    v32 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v33 = *MEMORY[0x1E4F28A50];
      v40[0] = *MEMORY[0x1E4F28568];
      v40[1] = v33;
      v41[0] = v30;
      v41[1] = v31;
      v34 = (void *)MEMORY[0x1E4F1C9E8];
      v35 = v41;
      v36 = v40;
      uint64_t v37 = 2;
    }
    else
    {
      uint64_t v42 = *MEMORY[0x1E4F28568];
      uint64_t v43 = v30;
      v34 = (void *)MEMORY[0x1E4F1C9E8];
      v35 = &v43;
      v36 = &v42;
      uint64_t v37 = 1;
    }
    v26 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:v37];
    v27 = v32;
    uint64_t v28 = 3;
    goto LABEL_32;
  }
  if (v22 == 2)
  {
    if ((v23 - 3) <= 1)
    {
      uint64_t v25 = +[MifareDecoder parseEndEvent:v10 withApplet:v11 error:a8];
      goto LABEL_35;
    }
    if (v23 == 240)
    {
      uint64_t v25 = +[MifareDecoder ParseEndEventShort:v10 withApplet:v11 error:a8];
      goto LABEL_35;
    }
    if (v23 == 255)
    {
      uint64_t v25 = +[MifareDecoder parseEndEventISO:v10 withApplet:v11 error:a8];
      goto LABEL_35;
    }
    goto LABEL_25;
  }
  if (v22 != 1) {
    goto LABEL_25;
  }
  if ((v23 - 3) > 1)
  {
    if (v23 == 255)
    {
      uint64_t v25 = +[MifareDecoder parseStartEventISO:v10 withApplet:v11 error:a8];
      goto LABEL_35;
    }
    goto LABEL_25;
  }
  uint64_t v25 = +[MifareDecoder parseStartEventNative:v10 withApplet:v11 error:a8];
LABEL_35:
  v38 = (void *)v25;
LABEL_36:

  return v38;
}

+ (id)parseStartEventNative:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] == 7)
  {
    uint64_t v9 = [v7 bytes];
    v27[0] = @"EventType";
    v27[1] = @"appletIdentifier";
    v28[0] = @"StartEvent";
    v28[1] = v8;
    v27[2] = @"Version";
    id v10 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + 1)];
    v28[2] = v10;
    v27[3] = @"command";
    id v11 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v9 + 4)) >> 16];
    v28[3] = v11;
    v27[4] = @"selectStatus";
    v12 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + 2)];
    v28[4] = v12;
    v27[5] = @"spIdentifier";
    uint64_t v13 = +[MifareDecoder getServiceProvider:*(unsigned __int8 *)(v9 + 6)];
    v28[5] = v13;
    v28[6] = MEMORY[0x1E4F1CC38];
    v27[6] = @"IgnoreRFEvents";
    v27[7] = @"DontWaitForEOT";
    v14 = [NSNumber numberWithBool:+[MifareDecoder getDontWaitForEOT:](MifareDecoder, "getDontWaitForEOT:", *(unsigned __int8 *)(v9 + 6))];
    v28[7] = v14;
    v28[8] = MEMORY[0x1E4F1CC28];
    v27[8] = @"RequiresPowerCycle";
    v27[9] = @"DelayExpressReentry";
    id v15 = +[MifareDecoder getEmReentryDelayMs:*(unsigned __int8 *)(v9 + 6)];
    v28[9] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:10];
  }
  else
  {
    uint64_t v17 = ATLLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v34 = [v7 length];
      __int16 v35 = 2048;
      uint64_t v36 = 7;
      _os_log_impl(&dword_1CA552000, v17, OS_LOG_TYPE_ERROR, "Start event length %zu (exp) %zu", buf, 0x16u);
    }

    uint64_t v18 = [[NSString alloc] initWithFormat:@"Start event length %zu (exp) %zu", objc_msgSend(v7, "length"), 7];
    id v10 = (void *)v18;
    if (!a5)
    {
      v16 = 0;
      goto LABEL_12;
    }
    id v19 = *a5;
    v20 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v21 = *MEMORY[0x1E4F28A50];
      v29[0] = *MEMORY[0x1E4F28568];
      v29[1] = v21;
      v30[0] = v18;
      v30[1] = v19;
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v23 = v30;
      uint64_t v24 = v29;
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v32 = v18;
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v23 = &v32;
      uint64_t v24 = &v31;
      uint64_t v25 = 1;
    }
    id v11 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
    [v20 errorWithDomain:@"ATL" code:3 userInfo:v11];
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:

  return v16;
}

+ (id)parseStartEventISO:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] == 10)
  {
    uint64_t v9 = [v7 bytes];
    v27[0] = @"EventType";
    v27[1] = @"appletIdentifier";
    v28[0] = @"StartEvent";
    v28[1] = v8;
    v27[2] = @"Version";
    id v10 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + 1)];
    v28[2] = v10;
    v27[3] = @"command";
    id v11 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)(v9 + 5))];
    v28[3] = v11;
    v27[4] = @"selectStatus";
    v12 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16];
    v28[4] = v12;
    v27[5] = @"spIdentifier";
    uint64_t v13 = +[MifareDecoder getServiceProvider:*(unsigned __int8 *)(v9 + 9)];
    v28[5] = v13;
    v28[6] = MEMORY[0x1E4F1CC38];
    v27[6] = @"IgnoreRFEvents";
    v27[7] = @"DontWaitForEOT";
    v14 = [NSNumber numberWithBool:+[MifareDecoder getDontWaitForEOT:](MifareDecoder, "getDontWaitForEOT:", *(unsigned __int8 *)(v9 + 9))];
    v28[7] = v14;
    v28[8] = MEMORY[0x1E4F1CC28];
    v27[8] = @"RequiresPowerCycle";
    v27[9] = @"DelayExpressReentry";
    id v15 = +[MifareDecoder getEmReentryDelayMs:*(unsigned __int8 *)(v9 + 9)];
    v28[9] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:10];
  }
  else
  {
    uint64_t v17 = ATLLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v34 = [v7 length];
      __int16 v35 = 2048;
      uint64_t v36 = 10;
      _os_log_impl(&dword_1CA552000, v17, OS_LOG_TYPE_ERROR, "Start event length %zu (exp) %zu", buf, 0x16u);
    }

    uint64_t v18 = [[NSString alloc] initWithFormat:@"Start event length %zu (exp) %zu", objc_msgSend(v7, "length"), 10];
    id v10 = (void *)v18;
    if (!a5)
    {
      v16 = 0;
      goto LABEL_12;
    }
    id v19 = *a5;
    v20 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v21 = *MEMORY[0x1E4F28A50];
      v29[0] = *MEMORY[0x1E4F28568];
      v29[1] = v21;
      v30[0] = v18;
      v30[1] = v19;
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v23 = v30;
      uint64_t v24 = v29;
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v32 = v18;
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v23 = &v32;
      uint64_t v24 = &v31;
      uint64_t v25 = 1;
    }
    id v11 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
    [v20 errorWithDomain:@"ATL" code:3 userInfo:v11];
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:

  return v16;
}

+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v7 length] <= 0x2D)
  {
    uint64_t v9 = ATLLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v7 length];
      _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v10 = [[NSString alloc] initWithFormat:@"End event length %zu", [v7 length]];
    id v11 = (void *)v10;
    if (a5)
    {
      id v12 = *a5;
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v14 = *MEMORY[0x1E4F28A50];
        v75[0] = *MEMORY[0x1E4F28568];
        v75[1] = v14;
        v76[0] = v10;
        v76[1] = v12;
        id v15 = (void *)MEMORY[0x1E4F1C9E8];
        v16 = v76;
        uint64_t v17 = v75;
        uint64_t v18 = 2;
      }
      else
      {
        uint64_t v77 = *MEMORY[0x1E4F28568];
        v78[0] = v10;
        id v15 = (void *)MEMORY[0x1E4F1C9E8];
        v16 = v78;
        uint64_t v17 = &v77;
        uint64_t v18 = 1;
      }
      v39 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
      *a5 = [v13 errorWithDomain:@"ATL" code:3 userInfo:v39];
    }
    goto LABEL_29;
  }
  id v19 = v7;
  uint64_t v20 = [v19 bytes];
  id v11 = [v19 subdataWithRange:NSMakeRange(46, [v19 length] - 46)];
  v54[0] = [v11 bytes];
  v54[1] = [v11 length];
  long long buf = 0uLL;
  uint64_t v74 = 0;
  uint64_t v21 = DERDecodeItemCtx((uint64_t)v54, (unint64_t *)&buf);
  if (v21 || (void)buf != 0xE000000000000001)
  {
    uint64_t v33 = ATLLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v71 = 67109376;
      *(_DWORD *)&v71[4] = v21;
      LOWORD(v72[0]) = 2048;
      *(void *)((char *)v72 + 2) = buf;
      _os_log_impl(&dword_1CA552000, v33, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", v71, 0x12u);
    }

    id v34 = [NSString alloc];
    uint64_t v35 = [v34 initWithFormat:@"Failed to decode E1 tag %d or wrong tag 0x%llx", v21, (void)buf];
    v26 = (void *)v35;
    if (!a5) {
      goto LABEL_28;
    }
    id v36 = *a5;
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v37 = *MEMORY[0x1E4F28A50];
      v67[0] = *MEMORY[0x1E4F28568];
      v67[1] = v37;
      v68[0] = v35;
      v68[1] = v36;
      uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v31 = v68;
      uint64_t v32 = v67;
      goto LABEL_20;
    }
    uint64_t v69 = *MEMORY[0x1E4F28568];
    uint64_t v70 = v35;
    uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v31 = &v70;
    uint64_t v32 = &v69;
LABEL_26:
    uint64_t v38 = 1;
    goto LABEL_27;
  }
  *(void *)v71 = 0;
  v72[0] = 0;
  uint64_t v22 = DERParseSequenceSpec((uint64_t)&buf + 8, (uint64_t)&mifareE1TLVSpec, (char *)v71, 0x10uLL);
  if (!v22)
  {
    *(_WORD *)v65 = -1;
    BOOL v40 = +[MifareDecoder didTransactionError:**(unsigned char **)v71 withParameters:v20 withTransactionResult:v65];
    v59 = @"State";
    v57[0] = @"SP";
    v41 = +[MifareDecoder getServiceProvider:**(unsigned char **)v71];
    v57[1] = @"SPRaw";
    v58[0] = v41;
    uint64_t v42 = [NSNumber numberWithUnsignedChar:**(unsigned char **)v71];
    v58[1] = v42;
    uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
    v60 = v43;
    v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];

    v55[0] = @"EventType";
    v55[1] = @"appletIdentifier";
    v56[0] = @"EndEvent";
    v56[1] = v8;
    v55[2] = @"Version";
    v53 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v20 + 1)];
    v56[2] = v53;
    v55[3] = @"didError";
    v44 = [NSNumber numberWithBool:v40];
    v56[3] = v44;
    v55[4] = @"command";
    int v45 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v20 + 3)) >> 16];
    v56[4] = v45;
    v55[5] = @"status";
    __int16 v46 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v20 + 2)];
    v56[5] = v46;
    v55[6] = @"result";
    int v47 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)v65];
    v56[6] = v47;
    v55[7] = @"informative";
    v48 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v20 + 39)) >> 16];
    v56[7] = v48;
    v56[8] = &unk_1F24E1F78;
    v55[8] = @"type";
    v55[9] = @"tlv";
    v55[10] = @"parsedInfo";
    v56[9] = v11;
    v56[10] = v52;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:11];

    goto LABEL_30;
  }
  uint64_t v23 = v22;
  uint64_t v24 = ATLLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v65 = 67109120;
    int v66 = v23;
    _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v65, 8u);
  }

  uint64_t v25 = [[NSString alloc] initWithFormat:@"Failed to decode E1 contents %d", v23];
  v26 = (void *)v25;
  if (!a5) {
    goto LABEL_28;
  }
  id v27 = *a5;
  uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
  if (!*a5)
  {
    uint64_t v63 = *MEMORY[0x1E4F28568];
    uint64_t v64 = v25;
    uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v31 = &v64;
    uint64_t v32 = &v63;
    goto LABEL_26;
  }
  uint64_t v29 = *MEMORY[0x1E4F28A50];
  v61[0] = *MEMORY[0x1E4F28568];
  v61[1] = v29;
  v62[0] = v25;
  v62[1] = v27;
  uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v31 = v62;
  uint64_t v32 = v61;
LABEL_20:
  uint64_t v38 = 2;
LABEL_27:
  uint64_t v50 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v38];
  *a5 = [v28 errorWithDomain:@"ATL" code:3 userInfo:v50];

LABEL_28:
LABEL_29:
  v49 = 0;
LABEL_30:

  return v49;
}

+ (id)parseEndEventISO:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v7 length] <= 0x30)
  {
    uint64_t v9 = ATLLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v7 length];
      _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v10 = [[NSString alloc] initWithFormat:@"End event length %zu", [v7 length]];
    id v11 = (void *)v10;
    if (a5)
    {
      id v12 = *a5;
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v14 = *MEMORY[0x1E4F28A50];
        v75[0] = *MEMORY[0x1E4F28568];
        v75[1] = v14;
        v76[0] = v10;
        v76[1] = v12;
        id v15 = (void *)MEMORY[0x1E4F1C9E8];
        v16 = v76;
        uint64_t v17 = v75;
        uint64_t v18 = 2;
      }
      else
      {
        uint64_t v77 = *MEMORY[0x1E4F28568];
        v78[0] = v10;
        id v15 = (void *)MEMORY[0x1E4F1C9E8];
        v16 = v78;
        uint64_t v17 = &v77;
        uint64_t v18 = 1;
      }
      v39 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
      *a5 = [v13 errorWithDomain:@"ATL" code:3 userInfo:v39];
    }
    goto LABEL_29;
  }
  id v19 = v7;
  uint64_t v20 = [v19 bytes];
  id v11 = [v19 subdataWithRange:NSMakeRange(49, [v19 length] - 49)];
  v54[0] = [v11 bytes];
  v54[1] = [v11 length];
  long long buf = 0uLL;
  uint64_t v74 = 0;
  uint64_t v21 = DERDecodeItemCtx((uint64_t)v54, (unint64_t *)&buf);
  if (v21 || (void)buf != 0xE000000000000001)
  {
    uint64_t v33 = ATLLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v71 = 67109376;
      *(_DWORD *)&v71[4] = v21;
      LOWORD(v72[0]) = 2048;
      *(void *)((char *)v72 + 2) = buf;
      _os_log_impl(&dword_1CA552000, v33, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", v71, 0x12u);
    }

    id v34 = [NSString alloc];
    uint64_t v35 = [v34 initWithFormat:@"Failed to decode E1 tag %d or wrong tag 0x%llx", v21, (void)buf];
    v26 = (void *)v35;
    if (!a5) {
      goto LABEL_28;
    }
    id v36 = *a5;
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v37 = *MEMORY[0x1E4F28A50];
      v67[0] = *MEMORY[0x1E4F28568];
      v67[1] = v37;
      v68[0] = v35;
      v68[1] = v36;
      uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v31 = v68;
      uint64_t v32 = v67;
      goto LABEL_20;
    }
    uint64_t v69 = *MEMORY[0x1E4F28568];
    uint64_t v70 = v35;
    uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v31 = &v70;
    uint64_t v32 = &v69;
LABEL_26:
    uint64_t v38 = 1;
    goto LABEL_27;
  }
  *(void *)v71 = 0;
  v72[0] = 0;
  uint64_t v22 = DERParseSequenceSpec((uint64_t)&buf + 8, (uint64_t)&mifareE1TLVSpec, (char *)v71, 0x10uLL);
  if (!v22)
  {
    *(_WORD *)v65 = -1;
    BOOL v40 = +[MifareDecoder didTransactionError:**(unsigned char **)v71 withISOParameters:v20 withTransactionResult:v65];
    v59 = @"State";
    v57[0] = @"SP";
    v41 = +[MifareDecoder getServiceProvider:**(unsigned char **)v71];
    v57[1] = @"SPRaw";
    v58[0] = v41;
    uint64_t v42 = [NSNumber numberWithUnsignedChar:**(unsigned char **)v71];
    v58[1] = v42;
    uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
    v60 = v43;
    v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];

    v55[0] = @"EventType";
    v55[1] = @"appletIdentifier";
    v56[0] = @"EndEvent";
    v56[1] = v8;
    v55[2] = @"Version";
    v53 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v20 + 1)];
    v56[2] = v53;
    v55[3] = @"didError";
    v44 = [NSNumber numberWithBool:v40];
    v56[3] = v44;
    v55[4] = @"command";
    int v45 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)(v20 + 4))];
    v56[4] = v45;
    v55[5] = @"status";
    __int16 v46 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v20 + 2)) >> 16];
    v56[5] = v46;
    v55[6] = @"result";
    int v47 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)v65];
    v56[6] = v47;
    v55[7] = @"informative";
    v48 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v20 + 42)) >> 16];
    v56[7] = v48;
    v56[8] = &unk_1F24E1F78;
    v55[8] = @"type";
    v55[9] = @"tlv";
    v55[10] = @"parsedInfo";
    v56[9] = v11;
    v56[10] = v52;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:11];

    goto LABEL_30;
  }
  uint64_t v23 = v22;
  uint64_t v24 = ATLLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v65 = 67109120;
    int v66 = v23;
    _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v65, 8u);
  }

  uint64_t v25 = [[NSString alloc] initWithFormat:@"Failed to decode E1 contents %d", v23];
  v26 = (void *)v25;
  if (!a5) {
    goto LABEL_28;
  }
  id v27 = *a5;
  uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
  if (!*a5)
  {
    uint64_t v63 = *MEMORY[0x1E4F28568];
    uint64_t v64 = v25;
    uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v31 = &v64;
    uint64_t v32 = &v63;
    goto LABEL_26;
  }
  uint64_t v29 = *MEMORY[0x1E4F28A50];
  v61[0] = *MEMORY[0x1E4F28568];
  v61[1] = v29;
  v62[0] = v25;
  v62[1] = v27;
  uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v31 = v62;
  uint64_t v32 = v61;
LABEL_20:
  uint64_t v38 = 2;
LABEL_27:
  uint64_t v50 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v38];
  *a5 = [v28 errorWithDomain:@"ATL" code:3 userInfo:v50];

LABEL_28:
LABEL_29:
  v49 = 0;
LABEL_30:

  return v49;
}

+ (id)ParseEndEventShort:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] == 3)
  {
    uint64_t v9 = [v7 bytes];
    v23[0] = @"EndEvent";
    v22[0] = @"EventType";
    v22[1] = @"Version";
    uint64_t v10 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + 1)];
    v22[2] = @"appletIdentifier";
    v22[3] = @"didError";
    v23[1] = v10;
    v23[2] = v8;
    v23[3] = MEMORY[0x1E4F1CC28];
    v23[4] = &unk_1F24E1F90;
    v22[4] = @"result";
    v22[5] = @"type";
    v23[5] = &unk_1F24E1F78;
    a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];
  }
  else
  {
    id v11 = ATLLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v29 = [v7 length];
      _os_log_impl(&dword_1CA552000, v11, OS_LOG_TYPE_ERROR, "End event length %zu", buf, 0xCu);
    }

    uint64_t v12 = [[NSString alloc] initWithFormat:@"End event length %zu", [v7 length]];
    uint64_t v10 = (void *)v12;
    if (a5)
    {
      id v13 = *a5;
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v15 = *MEMORY[0x1E4F28A50];
        v24[0] = *MEMORY[0x1E4F28568];
        v24[1] = v15;
        v25[0] = v12;
        v25[1] = v13;
        v16 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v17 = v25;
        uint64_t v18 = v24;
        uint64_t v19 = 2;
      }
      else
      {
        uint64_t v26 = *MEMORY[0x1E4F28568];
        uint64_t v27 = v12;
        v16 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v17 = &v27;
        uint64_t v18 = &v26;
        uint64_t v19 = 1;
      }
      uint64_t v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
      *a5 = [v14 errorWithDomain:@"ATL" code:3 userInfo:v20];

      a5 = 0;
    }
  }

  return a5;
}

+ (id)ParseTimeoutEventNative:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] == 8)
  {
    uint64_t v9 = [v7 bytes];
    v25[0] = @"EndEvent";
    v24[0] = @"EventType";
    v24[1] = @"Version";
    uint64_t v10 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + 1)];
    v25[1] = v10;
    void v25[2] = v8;
    void v24[2] = @"appletIdentifier";
    v24[3] = @"didError";
    v25[3] = MEMORY[0x1E4F1CC38];
    v24[4] = @"command";
    id v11 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v9 + 4)) >> 16];
    v25[4] = v11;
    v24[5] = @"status";
    uint64_t v12 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + 3)];
    v25[5] = v12;
    v25[6] = &unk_1F24E1FA8;
    v24[6] = @"result";
    v24[7] = @"type";
    v25[7] = &unk_1F24E1F78;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8];
  }
  else
  {
    uint64_t v14 = ATLLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v31 = [v7 length];
      _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_ERROR, "event length %zu", buf, 0xCu);
    }

    uint64_t v15 = [[NSString alloc] initWithFormat:@"event length %zu", [v7 length]];
    uint64_t v10 = (void *)v15;
    if (!a5)
    {
      id v13 = 0;
      goto LABEL_12;
    }
    id v16 = *a5;
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      v26[0] = *MEMORY[0x1E4F28568];
      v26[1] = v18;
      v27[0] = v15;
      v27[1] = v16;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v20 = v27;
      uint64_t v21 = v26;
      uint64_t v22 = 2;
    }
    else
    {
      uint64_t v28 = *MEMORY[0x1E4F28568];
      uint64_t v29 = v15;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v20 = &v29;
      uint64_t v21 = &v28;
      uint64_t v22 = 1;
    }
    id v11 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
    [v17 errorWithDomain:@"ATL" code:3 userInfo:v11];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:

  return v13;
}

+ (id)ParseTimeoutEventISO:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] == 11)
  {
    uint64_t v9 = [v7 bytes];
    v25[0] = @"EndEvent";
    v24[0] = @"EventType";
    v24[1] = @"Version";
    uint64_t v10 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + 1)];
    v25[1] = v10;
    void v25[2] = v8;
    void v24[2] = @"appletIdentifier";
    v24[3] = @"didError";
    v25[3] = MEMORY[0x1E4F1CC38];
    v24[4] = @"command";
    id v11 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)(v9 + 5))];
    v25[4] = v11;
    v24[5] = @"status";
    uint64_t v12 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v9 + 3)) >> 16];
    v25[5] = v12;
    v25[6] = &unk_1F24E1FA8;
    v24[6] = @"result";
    v24[7] = @"type";
    v25[7] = &unk_1F24E1F78;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8];
  }
  else
  {
    uint64_t v14 = ATLLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v31 = [v7 length];
      _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_ERROR, "event length %zu", buf, 0xCu);
    }

    uint64_t v15 = [[NSString alloc] initWithFormat:@"event length %zu", [v7 length]];
    uint64_t v10 = (void *)v15;
    if (!a5)
    {
      id v13 = 0;
      goto LABEL_12;
    }
    id v16 = *a5;
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      v26[0] = *MEMORY[0x1E4F28568];
      v26[1] = v18;
      v27[0] = v15;
      v27[1] = v16;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v20 = v27;
      uint64_t v21 = v26;
      uint64_t v22 = 2;
    }
    else
    {
      uint64_t v28 = *MEMORY[0x1E4F28568];
      uint64_t v29 = v15;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v20 = &v29;
      uint64_t v21 = &v28;
      uint64_t v22 = 1;
    }
    id v11 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
    [v17 errorWithDomain:@"ATL" code:3 userInfo:v11];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:

  return v13;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = +[MifareDecoder getSPID:v11 withApplet:v12 withError:a7];
  id v16 = v15;
  if (v15)
  {
    uint64_t v17 = +[MifareDecoder getAppletStateAndHistory:withTransceiver:withApplet:withPackage:withModule:withError:](MifareDecoder, "getAppletStateAndHistory:withTransceiver:withApplet:withPackage:withModule:withError:", [v15 unsignedCharValue], v11, v12, v13, v14, a7);
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = +[TransceiverWrapper withTransceiver:a6];
  id v11 = +[MifareDecoder getSPID:v10 withApplet:v9 withError:a7];

  if (v11)
  {
    v15[0] = @"Supported";
    v15[1] = @"DelayExpressReentry";
    v16[0] = MEMORY[0x1E4F1CC38];
    id v12 = +[MifareDecoder getEmReentryDelayMs:](MifareDecoder, "getEmReentryDelayMs:", [v11 unsignedCharValue]);
    v16[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Mifare decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"Mifare decoder doesn't expect processEndOfTransaction"];
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
      id v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v22;
      id v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      id v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v24;
      id v16 = &v23;
      uint64_t v17 = 1;
    }
    uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

- (BOOL)supportsPlasticCardMode:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6
{
  id v7 = a3;
  uint64_t v14 = 0;
  id v8 = +[MifareDecoder getSPID:v7 withApplet:a4 withError:&v14];
  uint64_t v9 = v8;
  if (v14) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    char v12 = 0;
  }
  else
  {
    id v11 = +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:", [v8 unsignedCharValue]);
    char v12 = [objc_opt_class() supportsPlasticCardMode:[v9 unsignedCharValue] withTransceiver:v7];
  }
  return v12;
}

+ (id)getSPID:(id)a3 withApplet:(id)a4 withError:(id *)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1C9B8] dataWithHexString:a4];
  uint64_t v9 = SelectByNameCmd(v8);

  BOOL v10 = [v7 transceiveAndCheckSW:v9 error:a5];
  if (!v10)
  {
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&getSPID_withApplet_withError__getDataSpid length:6 freeWhenDone:0];
  char v12 = [v7 transceiveAndCheckSW:v11 error:a5];
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_14;
  }
  if ([v12 length] != 1)
  {
    uint64_t v15 = ATLLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_ERROR, "Invalid response length to GET DATA SPID != 1", v27, 2u);
    }

    uint64_t v16 = [[NSString alloc] initWithFormat:@"Invalid response length to GET DATA SPID != 1"];
    uint64_t v17 = (void *)v16;
    if (a5)
    {
      id v18 = *a5;
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v20 = *MEMORY[0x1E4F28A50];
        v28[0] = *MEMORY[0x1E4F28568];
        v28[1] = v20;
        v29[0] = v16;
        v29[1] = v18;
        uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v22 = v29;
        uint64_t v23 = v28;
        uint64_t v24 = 2;
      }
      else
      {
        uint64_t v30 = *MEMORY[0x1E4F28568];
        v31[0] = v16;
        uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v22 = v31;
        uint64_t v23 = &v30;
        uint64_t v24 = 1;
      }
      uint64_t v25 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v24];
      *a5 = [v19 errorWithDomain:@"ATL" code:3 userInfo:v25];
    }
LABEL_14:
    uint64_t v14 = 0;
    goto LABEL_15;
  }
  uint64_t v14 = [NSNumber numberWithUnsignedChar:[v13 u8:0]];
LABEL_15:

LABEL_16:

  return v14;
}

+ (id)getSubDecoder:(unsigned __int8)a3
{
  if (getSubDecoder__currentSPId != a3)
  {
    __int16 v3 = a3;
    BOOL v4 = +[HerculesDecoder canDecodeSPId:](HerculesDecoder, "canDecodeSPId:");
    v5 = off_1E65ADA48;
    if (v4) {
      v5 = off_1E65ADA50;
    }
    id v6 = objc_alloc_init(*v5);
    id v7 = (void *)getSubDecoder__currentSubDecoder;
    getSubDecoder__currentSubDecoder = (uint64_t)v6;

    getSubDecoder__currentSPId = v3;
  }
  id v8 = (void *)getSubDecoder__currentSubDecoder;

  return v8;
}

+ (id)getServiceProvider:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  BOOL v4 = +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:");
  v5 = [(id)objc_opt_class() getServiceProvider:v3];

  return v5;
}

+ (id)getEmReentryDelayMs:(unsigned __int8)a3
{
  uint64_t v3 = +[MifareDecoder getSubDecoder:a3];
  BOOL v4 = [(id)objc_opt_class() getEmReentryDelayMs];

  return v4;
}

+ (BOOL)getDontWaitForEOT:(unsigned __int8)a3
{
  uint64_t v3 = +[MifareDecoder getSubDecoder:a3];
  char v4 = [(id)objc_opt_class() getDontWaitForEOT];

  return v4;
}

+ (BOOL)didTransactionError:(unsigned __int8)a3 withISOParameters:(id *)a4 withTransactionResult:(unsigned __int16 *)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v6, 0, sizeof(v6));
  *(_WORD *)&v6[37] = a4->var5;
  __int16 v7 = *(_WORD *)a4->var8;
  unsigned __int8 v8 = a4->var8[2];
  return +[MifareDecoder didTransactionError:a3 withParameters:v6 withTransactionResult:a5];
}

+ (BOOL)didTransactionError:(unsigned __int8)a3 withParameters:(id *)a4 withTransactionResult:(unsigned __int16 *)a5
{
  __int16 v7 = +[MifareDecoder getSubDecoder:a3];
  LOBYTE(a5) = [(id)objc_opt_class() didTransactionError:a4 withTransactionResult:a5];

  return (char)a5;
}

+ (id)getAppletStateAndHistory:(unsigned __int8)a3 withTransceiver:(id)a4 withApplet:(id)a5 withPackage:(id)a6 withModule:(id)a7 withError:(id *)a8
{
  uint64_t v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  uint64_t v17 = +[MifareDecoder getSubDecoder:v12];
  id v18 = [(id)objc_opt_class() getAppletStateAndHistory:v16 withApplet:v15 withPackage:v14 withModule:v13 withError:a8];

  return v18;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  id v14 = a9;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v36 = 0;
  uint64_t v21 = +[MifareDecoder getSPID:v20 withApplet:v15 withError:&v36];
  id v22 = v36;
  if (v22 || !v21)
  {
    uint64_t v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Service Provider Opaque Data for Mifare not supported when SPID not available.", buf, 2u);
    }

    uint64_t v25 = [[NSString alloc] initWithFormat:@"Service Provider Opaque Data for Mifare not supported when SPID not available."];
    uint64_t v23 = (void *)v25;
    if (a9)
    {
      id v26 = *a9;
      id v34 = (void *)MEMORY[0x1E4F28C58];
      if (*a9)
      {
        uint64_t v27 = *MEMORY[0x1E4F28A50];
        v37[0] = *MEMORY[0x1E4F28568];
        v37[1] = v27;
        v38[0] = v25;
        v38[1] = v26;
        uint64_t v28 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v29 = v38;
        uint64_t v30 = v37;
        uint64_t v31 = 2;
      }
      else
      {
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v40[0] = v25;
        uint64_t v28 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v29 = v40;
        uint64_t v30 = &v39;
        uint64_t v31 = 1;
      }
      uint64_t v32 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:v31];
      *a9 = [v34 errorWithDomain:@"ATL" code:2 userInfo:v32];

      id v14 = 0;
    }
  }
  else
  {
    uint64_t v23 = +[MifareDecoder getSubDecoder:](MifareDecoder, "getSubDecoder:", [v21 unsignedCharValue]);
    id v14 = [(id)objc_opt_class() getServiceProviderData:v15 withPackage:v16 withModule:v17 withPublicKey:v18 withEncryptionScheme:v19 withTransceiver:v20 withError:a9];
  }

  return v14;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  return [(MifareDecoder *)self getServiceProviderData:a3 withPackage:a4 withModule:a5 withPublicKey:0 withEncryptionScheme:0 withTransceiver:a6 withError:a7];
}

@end