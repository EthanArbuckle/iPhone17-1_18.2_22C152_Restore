@interface EMVDecoder
+ (BOOL)isArgon:(id)a3;
+ (BOOL)isEMV:(id)a3;
+ (BOOL)isEMVLegacy:(id)a3;
+ (BOOL)isHelium:(id)a3;
+ (BOOL)isLuau:(id)a3;
+ (BOOL)isNeon:(id)a3;
+ (BOOL)isPoke:(id)a3;
+ (BOOL)isXenon:(id)a3;
+ (id)DecodeEndE1TLV:(id *)a3 withModule:(id)a4 withLegacy:(BOOL)a5 withType:(unsigned __int16 *)a6 withTransactionStatus:(BOOL)a7 error:(id *)a8;
+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 withModule:(id)a5 withLegacy:(BOOL)a6 error:(id *)a7;
+ (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
@end

@implementation EMVDecoder

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if ((unint64_t)[v11 length] > 2)
  {
    id v24 = v11;
    uint64_t v25 = *(unsigned __int8 *)[v24 bytes];
    id v26 = v24;
    uint64_t v27 = *(unsigned __int8 *)([v26 bytes] + 1);
    if (v25 == 2)
    {
      if (v27 != 6 && v27 != 1) {
        goto LABEL_22;
      }
      uint64_t v29 = +[EMVDecoder parseEndEvent:v26 withApplet:v12 withModule:v13 withLegacy:v27 == 1 error:a8];
    }
    else
    {
      if (v25 != 1 || (v27 != 6 ? (BOOL v28 = v27 == 1) : (BOOL v28 = 1), !v28))
      {
LABEL_22:
        v32 = ATLLogObject();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          int v50 = v25;
          __int16 v51 = 1024;
          int v52 = v27;
          _os_log_impl(&dword_1CA552000, v32, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
        }

        uint64_t v33 = [[NSString alloc] initWithFormat:@"Invalid event type 0x%x version 0x%x", v25, v27];
        v16 = (void *)v33;
        if (!a8) {
          goto LABEL_32;
        }
        id v34 = *a8;
        v35 = (void *)MEMORY[0x1E4F28C58];
        if (*a8)
        {
          uint64_t v36 = *MEMORY[0x1E4F28A50];
          v45[0] = *MEMORY[0x1E4F28568];
          v45[1] = v36;
          v46[0] = v33;
          v46[1] = v34;
          v37 = (void *)MEMORY[0x1E4F1C9E8];
          v38 = v46;
          v39 = v45;
          uint64_t v40 = 2;
        }
        else
        {
          uint64_t v47 = *MEMORY[0x1E4F28568];
          uint64_t v48 = v33;
          v37 = (void *)MEMORY[0x1E4F1C9E8];
          v38 = &v48;
          v39 = &v47;
          uint64_t v40 = 1;
        }
        v41 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:v40];
        v42 = v35;
        uint64_t v43 = 3;
        goto LABEL_31;
      }
      uint64_t v29 = +[EMVDecoder parseStartEvent:v26 withApplet:v12 error:a8];
    }
    v31 = (void *)v29;
    goto LABEL_33;
  }
  v14 = ATLLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v50 = [v11 length];
    _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
  }

  uint64_t v15 = [[NSString alloc] initWithFormat: @"Short eventData? %u", [v11 length]];
  v16 = (void *)v15;
  if (!a8) {
    goto LABEL_32;
  }
  id v17 = *a8;
  v18 = (void *)MEMORY[0x1E4F28C58];
  if (*a8)
  {
    uint64_t v19 = *MEMORY[0x1E4F28A50];
    v53[0] = *MEMORY[0x1E4F28568];
    v53[1] = v19;
    v54[0] = v15;
    v54[1] = v17;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = v54;
    v22 = v53;
    uint64_t v23 = 2;
  }
  else
  {
    uint64_t v55 = *MEMORY[0x1E4F28568];
    v56[0] = v15;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = v56;
    v22 = &v55;
    uint64_t v23 = 1;
  }
  v41 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:v23];
  v42 = v18;
  uint64_t v43 = 6;
LABEL_31:
  *a8 = [v42 errorWithDomain:@"ATL" code:v43 userInfo:v41];

LABEL_32:
  v31 = 0;
LABEL_33:

  return v31;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "EMVDecoder doesn't support GetState", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"EMVDecoder doesn't support GetState"];
  v10 = (void *)v9;
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
      v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v22;
      v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v24;
      v16 = &v23;
      uint64_t v17 = 1;
    }
    v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:2 userInfo:v18];
  }
  return 0;
}

+ (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] == 4)
  {
    uint64_t v9 = [v7 bytes];
    v22[0] = @"EventType";
    v22[1] = @"appletIdentifier";
    v23[0] = @"StartEvent";
    v23[1] = v8;
    void v22[2] = @"selectStatus";
    v10 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16];
    v22[3] = @"IgnoreRFEvents";
    v22[4] = @"DontWaitForEOT";
    v23[2] = v10;
    v23[3] = MEMORY[0x1E4F1CC28];
    v23[4] = MEMORY[0x1E4F1CC28];
    v23[5] = MEMORY[0x1E4F1CC28];
    v22[5] = @"RequiresPowerCycle";
    v22[6] = @"DelayExpressReentry";
    v23[6] = &unk_1F24E1C78;
    a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  }
  else
  {
    id v11 = ATLLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v29 = [v7 length];
      __int16 v30 = 2048;
      uint64_t v31 = 4;
      _os_log_impl(&dword_1CA552000, v11, OS_LOG_TYPE_ERROR, "Start event length %zu (exp) %zu", buf, 0x16u);
    }

    uint64_t v12 = [[NSString alloc] initWithFormat:@"Start event length %zu (exp) %zu", objc_msgSend(v7, "length"), 4];
    v10 = (void *)v12;
    if (a5)
    {
      id v13 = *a5;
      v14 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v15 = *MEMORY[0x1E4F28A50];
        v24[0] = *MEMORY[0x1E4F28568];
        v24[1] = v15;
        v25[0] = v12;
        v25[1] = v13;
        v16 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v17 = v25;
        v18 = v24;
        uint64_t v19 = 2;
      }
      else
      {
        uint64_t v26 = *MEMORY[0x1E4F28568];
        uint64_t v27 = v12;
        v16 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v17 = &v27;
        v18 = &v26;
        uint64_t v19 = 1;
      }
      v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
      *a5 = [v14 errorWithDomain:@"ATL" code:3 userInfo:v20];

      a5 = 0;
    }
  }

  return a5;
}

+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 withModule:(id)a5 withLegacy:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v63[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ((unint64_t)[v11 length] > 0x29)
  {
    BOOL v52 = v8;
    v53 = a7;
    id v54 = v11;
    id v23 = v11;
    id v24 = (unsigned __int16 *)[v23 bytes];
    uint64_t v25 = (void *)MEMORY[0x1E4F1CA60];
    v58[0] = @"EventType";
    v58[1] = @"appletIdentifier";
    v59[0] = @"EndEvent";
    v59[1] = v12;
    id v55 = v12;
    v58[2] = @"status";
    uint64_t v26 = [NSNumber numberWithUnsignedShort:bswap32(v24[1]) >> 16];
    v59[2] = v26;
    v58[3] = @"command";
    [NSNumber numberWithUnsignedShort:bswap32(v24[2]) >> 16];
    v28 = id v27 = v13;
    v59[3] = v28;
    v58[4] = @"transactionIdentifier";
    uint64_t v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v24 + 3 length:32];
    __int16 v30 = [v29 asHexString];
    v59[4] = v30;
    v58[5] = @"informative";
    uint64_t v31 = [NSNumber numberWithUnsignedShort:bswap32(v24[20]) >> 16];
    v59[5] = v31;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:6];
    v16 = [v25 dictionaryWithDictionary:v32];

    id v13 = v27;
    unsigned __int16 v56 = -1;
    int v33 = v24[1];
    BOOL v34 = v33 != 144;
    if ((unint64_t)[v23 length] < 0x2B) {
      goto LABEL_15;
    }
    v35 = [v23 subdataWithRange:NSMakeRange(42, [v23 length] - 42)];
    *(void *)&long long buf = [v35 bytes];
    *((void *)&buf + 1) = [v35 length];
    uint64_t v36 = +[EMVDecoder DecodeEndE1TLV:&buf withModule:v27 withLegacy:v52 withType:&v56 withTransactionStatus:v33 == 144 error:v53];
    if (!v36)
    {

      id v49 = 0;
      goto LABEL_22;
    }
    v37 = (void *)v36;
    v38 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [v38 setObject:v37 forKeyedSubscript:@"Transaction"];
    [v16 setObject:v35 forKeyedSubscript:@"tlv"];
    [v16 setObject:v38 forKeyedSubscript:@"parsedInfo"];
    v39 = [v37 objectForKeyedSubscript:@"Amount"];

    if (v39)
    {
      uint64_t v40 = [v37 objectForKeyedSubscript:@"Amount"];
      [v16 setObject:v40 forKeyedSubscript:@"amount"];
    }
    v41 = [v37 objectForKeyedSubscript:@"Currency"];

    if (v41)
    {
      v42 = [v37 objectForKeyedSubscript:@"Currency"];
      [v16 setObject:v42 forKeyedSubscript:@"currency"];
    }
    if (v56 - 1 >= 0xFFFE)
    {
LABEL_15:
      unsigned int v44 = bswap32(v24[19]);
      uint64_t v43 = HIWORD(v44);
      BOOL v34 = (v44 & 0xFEFF0000) == 0 || v33 != 144;
    }
    else
    {
      uint64_t v43 = 0xFFFFLL;
    }
    v46 = [NSNumber numberWithBool:v34];
    [v16 setObject:v46 forKeyedSubscript:@"didError"];

    uint64_t v47 = [NSNumber numberWithUnsignedShort:v56];
    [v16 setObject:v47 forKeyedSubscript:@"type"];

    uint64_t v48 = [NSNumber numberWithUnsignedShort:v43];
    [v16 setObject:v48 forKeyedSubscript:@"result"];

    id v49 = v16;
LABEL_22:
    id v11 = v54;
    id v12 = v55;
    goto LABEL_26;
  }
  v14 = ATLLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v11 length];
    _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v15 = [[NSString alloc] initWithFormat:@"End event length %zu", [v11 length]];
  v16 = (void *)v15;
  if (a7)
  {
    id v17 = *a7;
    v18 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      v60[0] = *MEMORY[0x1E4F28568];
      v60[1] = *MEMORY[0x1E4F28A50];
      v61[0] = v15;
      v61[1] = v17;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = v61;
      v21 = v60;
      uint64_t v22 = 2;
    }
    else
    {
      uint64_t v62 = *MEMORY[0x1E4F28568];
      v63[0] = v15;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = v63;
      v21 = &v62;
      uint64_t v22 = 1;
    }
    int v50 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
    *a7 = [v18 errorWithDomain:@"ATL" code:3 userInfo:v50];
  }
  id v49 = 0;
LABEL_26:

  return v49;
}

+ (id)DecodeEndE1TLV:(id *)a3 withModule:(id)a4 withLegacy:(BOOL)a5 withType:(unsigned __int16 *)a6 withTransactionStatus:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  v135[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  DERSize v89 = 0;
  uint64_t v90 = 0;
  uint64_t v91 = 0;
  uint64_t v14 = DERDecodeItemCtx((uint64_t)a3, &v89);
  if (v14 || v89 != 0xE000000000000001)
  {
    id v27 = ATLLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v114[0].data) = 67109376;
      HIDWORD(v114[0].data) = v14;
      LOWORD(v114[0].length) = 2048;
      *(DERSize *)((char *)&v114[0].length + 2) = v89;
      _os_log_impl(&dword_1CA552000, v27, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", (uint8_t *)v114, 0x12u);
    }

    id v28 = [NSString alloc];
    uint64_t v29 = [v28 initWithFormat:@"Failed to decode E1 tag %d or wrong tag 0x%llx", v14, v89];
    __int16 v30 = (void *)v29;
    if (!a8) {
      goto LABEL_25;
    }
    id v31 = *a8;
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v33 = *MEMORY[0x1E4F28A50];
      v132[0] = *MEMORY[0x1E4F28568];
      v132[1] = v33;
      v133[0] = v29;
      v133[1] = v31;
      BOOL v34 = (void *)MEMORY[0x1E4F1C9E8];
      v35 = v133;
      uint64_t v36 = v132;
LABEL_15:
      uint64_t v37 = 2;
LABEL_24:
      v42 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:v37];
      *a8 = [v32 errorWithDomain:@"ATL" code:3 userInfo:v42];

      goto LABEL_25;
    }
    uint64_t v134 = *MEMORY[0x1E4F28568];
    v135[0] = v29;
    BOOL v34 = (void *)MEMORY[0x1E4F1C9E8];
    v35 = v135;
    uint64_t v36 = &v134;
LABEL_23:
    uint64_t v37 = 1;
    goto LABEL_24;
  }
  if (!v91)
  {
    if (!v9)
    {
      a8 = (id *)MEMORY[0x1E4F1CC08];
      goto LABEL_100;
    }
    v38 = ATLLogObject();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v114[0].data) = 0;
      _os_log_impl(&dword_1CA552000, v38, OS_LOG_TYPE_ERROR, "Missing E1 content", (uint8_t *)v114, 2u);
    }

    uint64_t v39 = [[NSString alloc] initWithFormat:@"Missing E1 content"];
    __int16 v30 = (void *)v39;
    if (!a8)
    {
LABEL_25:

      a8 = 0;
      goto LABEL_100;
    }
    id v40 = *a8;
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v41 = *MEMORY[0x1E4F28A50];
      v128[0] = *MEMORY[0x1E4F28568];
      v128[1] = v41;
      v129[0] = v39;
      v129[1] = v40;
      BOOL v34 = (void *)MEMORY[0x1E4F1C9E8];
      v35 = v129;
      uint64_t v36 = v128;
      goto LABEL_15;
    }
    uint64_t v130 = *MEMORY[0x1E4F28568];
    uint64_t v131 = v39;
    BOOL v34 = (void *)MEMORY[0x1E4F1C9E8];
    v35 = &v131;
    uint64_t v36 = &v130;
    goto LABEL_23;
  }
  unsigned long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  unsigned long long v125 = 0u;
  unsigned long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  unsigned long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  unsigned long long v115 = 0u;
  memset(v114, 0, sizeof(v114));
  uint64_t v15 = DERParseSequenceSpec((uint64_t)&v90, (uint64_t)&e1EndEventContentSpec, (char *)v114, 0xF0uLL);
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = ATLLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      int v113 = v16;
      _os_log_impl(&dword_1CA552000, v17, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", buf, 8u);
    }

    uint64_t v18 = [[NSString alloc] initWithFormat:@"Failed to decode E1 contents %d", v16];
    uint64_t v19 = (void *)v18;
    if (!a8) {
      goto LABEL_99;
    }
    id v20 = *a8;
    v21 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v22 = *MEMORY[0x1E4F28A50];
      v108[0] = *MEMORY[0x1E4F28568];
      v108[1] = v22;
      v109[0] = v18;
      v109[1] = v20;
      id v23 = (void *)MEMORY[0x1E4F1C9E8];
      id v24 = v109;
      uint64_t v25 = v108;
      uint64_t v26 = 2;
    }
    else
    {
      uint64_t v110 = *MEMORY[0x1E4F28568];
      uint64_t v111 = v18;
      id v23 = (void *)MEMORY[0x1E4F1C9E8];
      id v24 = &v111;
      uint64_t v25 = &v110;
      uint64_t v26 = 1;
    }
    v64 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:v26];
    *a8 = [v21 errorWithDomain:@"ATL" code:3 userInfo:v64];

    goto LABEL_71;
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:15];
  *(_WORD *)long long buf = 0;
  if (*((void *)&v115 + 1))
  {
    uint64_t v43 = DecodeBCD((const DERItem *)&v115);
    unsigned int v44 = +[ATLCurrency currencyCodeForNumber:v43 exponentOut:buf];
    if (v44)
    {
      [v19 setObject:v44 forKeyedSubscript:@"Currency"];
      v45 = [NSNumber numberWithShort:*(__int16 *)buf];
      [v19 setObject:v45 forKeyedSubscript:@"CurrencyExponent"];

      v46 = [NSNumber numberWithUnsignedLongLong:v43];
      [v19 setObject:v46 forKeyedSubscript:@"CurrencyCode"];
    }
  }
  if (v114[1].length)
  {
    uint64_t v47 = DecodeBCD(&v114[1]);
    uint64_t v48 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v47 exponent:(__int16)-*(_WORD *)buf isNegative:0];
    [v19 setObject:v48 forKeyedSubscript:@"Amount"];
  }
  if (a5 || v114[0].length || !v9)
  {
    if (v114[0].length)
    {
      v59 = [NSNumber numberWithUnsignedShort:ReadU16BE(v114)];
      [v19 setObject:v59 forKeyedSubscript:@"LocalValidation"];
    }
    if (a6 && *((void *)&v116 + 1)) {
      *a6 = *(unsigned __int8 *)v116;
    }
    if (*((void *)&v117 + 1))
    {
      v60 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v117];
      [v19 setObject:v60 forKeyedSubscript:@"MerchantNameAndLocation"];
    }
    if (+[EMVDecoder isArgon:v13])
    {
      if (*((void *)&v126 + 1))
      {
        v61 = [NSNumber numberWithUnsignedShort:ReadU16BE((const DERItem *)&v126)];
        [v19 setObject:v61 forKeyedSubscript:@"MerchantCategoryCode"];
      }
      if (!*((void *)&v127 + 1)) {
        goto LABEL_98;
      }
      uint64_t v62 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v127];
      v63 = @"MCII";
      goto LABEL_97;
    }
    if (+[EMVDecoder isHelium:v13])
    {
      if (*((void *)&v118 + 1))
      {
        v65 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v118];
        [v19 setObject:v65 forKeyedSubscript:@"CDI"];

LABEL_85:
        if (*((void *)&v119 + 1))
        {
          v75 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v119];
          [v19 setObject:v75 forKeyedSubscript:@"AIDPersonalized"];
        }
        if (*((void *)&v120 + 1))
        {
          v76 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v120];
          [v19 setObject:v76 forKeyedSubscript:@"MAID"];
        }
        if (*((void *)&v121 + 1))
        {
          v77 = [NSNumber numberWithUnsignedShort:ReadU16BE((const DERItem *)&v121)];
          [v19 setObject:v77 forKeyedSubscript:@"MSC"];
        }
        if (!*((void *)&v122 + 1)) {
          goto LABEL_98;
        }
        uint64_t v62 = [NSNumber numberWithInt:ReadS32BE((const DERItem *)&v122)];
        v63 = @"TerminalTypeQualifiers";
        goto LABEL_97;
      }
      if (!v9) {
        goto LABEL_85;
      }
      v71 = ATLLogObject();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v88 = 0;
        _os_log_impl(&dword_1CA552000, v71, OS_LOG_TYPE_ERROR, "Missing mandatory CDI tag", v88, 2u);
      }

      uint64_t v72 = [[NSString alloc] initWithFormat:@"Missing mandatory CDI tag"];
      __int16 v51 = (void *)v72;
      if (!a8) {
        goto LABEL_70;
      }
      id v73 = *a8;
      v53 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v74 = *MEMORY[0x1E4F28A50];
        v100[0] = *MEMORY[0x1E4F28568];
        v100[1] = v74;
        v101[0] = v72;
        v101[1] = v73;
        id v55 = (void *)MEMORY[0x1E4F1C9E8];
        unsigned __int16 v56 = v101;
        v57 = v100;
        goto LABEL_40;
      }
      uint64_t v102 = *MEMORY[0x1E4F28568];
      uint64_t v103 = v72;
      id v55 = (void *)MEMORY[0x1E4F1C9E8];
      unsigned __int16 v56 = &v103;
      v57 = &v102;
LABEL_68:
      uint64_t v58 = 1;
      goto LABEL_69;
    }
    if (+[EMVDecoder isNeon:v13])
    {
      if (*((void *)&v123 + 1))
      {
        v66 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v123];
        [v19 setObject:v66 forKeyedSubscript:@"IssuerApplicationData"];
      }
      if (*((void *)&v124 + 1))
      {
        v67 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v124];
        [v19 setObject:v67 forKeyedSubscript:@"MobileCVMResults"];
      }
      if (!*((void *)&v125 + 1)) {
        goto LABEL_98;
      }
      uint64_t v62 = [NSNumber numberWithInt:ReadS32BE((const DERItem *)&v125)];
      v63 = @"EnhancedContactlessReaderCapabilities";
      goto LABEL_97;
    }
    if (+[EMVDecoder isXenon:v13])
    {
      if (*((void *)&v122 + 1))
      {
        v69 = [NSNumber numberWithInt:ReadS32BE((const DERItem *)&v122)];
        [v19 setObject:v69 forKeyedSubscript:@"TerminalTypeQualifiers"];
      }
      if (*((void *)&v126 + 1))
      {
        v70 = [NSNumber numberWithUnsignedShort:ReadU16BE((const DERItem *)&v126)];
        [v19 setObject:v70 forKeyedSubscript:@"MerchantCategoryCode"];
      }
    }
    else
    {
      if (!+[EMVDecoder isLuau:v13])
      {
LABEL_98:
        a8 = v19;
        goto LABEL_99;
      }
      if (*((void *)&v118 + 1))
      {
        v78 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v118];
        [v19 setObject:v78 forKeyedSubscript:@"CDI"];

        if (!*((void *)&v123 + 1))
        {
          if (!v9) {
            goto LABEL_98;
          }
          v84 = ATLLogObject();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v88 = 0;
            _os_log_impl(&dword_1CA552000, v84, OS_LOG_TYPE_ERROR, "Missing mandatory IAD tag", v88, 2u);
          }

          uint64_t v85 = [[NSString alloc] initWithFormat:@"Missing mandatory IAD tag"];
          __int16 v51 = (void *)v85;
          if (!a8) {
            goto LABEL_70;
          }
          id v86 = *a8;
          v53 = (void *)MEMORY[0x1E4F28C58];
          if (*a8)
          {
            uint64_t v87 = *MEMORY[0x1E4F28A50];
            v92[0] = *MEMORY[0x1E4F28568];
            v92[1] = v87;
            v93[0] = v85;
            v93[1] = v86;
            id v55 = (void *)MEMORY[0x1E4F1C9E8];
            unsigned __int16 v56 = v93;
            v57 = v92;
            goto LABEL_40;
          }
          uint64_t v94 = *MEMORY[0x1E4F28568];
          uint64_t v95 = v85;
          id v55 = (void *)MEMORY[0x1E4F1C9E8];
          unsigned __int16 v56 = &v95;
          v57 = &v94;
          goto LABEL_68;
        }
        goto LABEL_96;
      }
      if (v9)
      {
        v80 = ATLLogObject();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v88 = 0;
          _os_log_impl(&dword_1CA552000, v80, OS_LOG_TYPE_ERROR, "Missing mandatory CVS tag", v88, 2u);
        }

        uint64_t v81 = [[NSString alloc] initWithFormat:@"Missing mandatory CVS tag"];
        __int16 v51 = (void *)v81;
        if (!a8) {
          goto LABEL_70;
        }
        id v82 = *a8;
        v53 = (void *)MEMORY[0x1E4F28C58];
        if (*a8)
        {
          uint64_t v83 = *MEMORY[0x1E4F28A50];
          v96[0] = *MEMORY[0x1E4F28568];
          v96[1] = v83;
          v97[0] = v81;
          v97[1] = v82;
          id v55 = (void *)MEMORY[0x1E4F1C9E8];
          unsigned __int16 v56 = v97;
          v57 = v96;
          goto LABEL_40;
        }
        uint64_t v98 = *MEMORY[0x1E4F28568];
        uint64_t v99 = v81;
        id v55 = (void *)MEMORY[0x1E4F1C9E8];
        unsigned __int16 v56 = &v99;
        v57 = &v98;
        goto LABEL_68;
      }
    }
    if (!*((void *)&v123 + 1)) {
      goto LABEL_98;
    }
LABEL_96:
    uint64_t v62 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v123];
    v63 = @"IssuerApplicationData";
LABEL_97:
    [v19 setObject:v62 forKeyedSubscript:v63];

    goto LABEL_98;
  }
  id v49 = ATLLogObject();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v88 = 0;
    _os_log_impl(&dword_1CA552000, v49, OS_LOG_TYPE_ERROR, "Missing mandatory local validation tag", v88, 2u);
  }

  uint64_t v50 = [[NSString alloc] initWithFormat:@"Missing mandatory local validation tag"];
  __int16 v51 = (void *)v50;
  if (!a8) {
    goto LABEL_70;
  }
  id v52 = *a8;
  v53 = (void *)MEMORY[0x1E4F28C58];
  if (!*a8)
  {
    uint64_t v106 = *MEMORY[0x1E4F28568];
    uint64_t v107 = v50;
    id v55 = (void *)MEMORY[0x1E4F1C9E8];
    unsigned __int16 v56 = &v107;
    v57 = &v106;
    goto LABEL_68;
  }
  uint64_t v54 = *MEMORY[0x1E4F28A50];
  v104[0] = *MEMORY[0x1E4F28568];
  v104[1] = v54;
  v105[0] = v50;
  v105[1] = v52;
  id v55 = (void *)MEMORY[0x1E4F1C9E8];
  unsigned __int16 v56 = v105;
  v57 = v104;
LABEL_40:
  uint64_t v58 = 2;
LABEL_69:
  v68 = [v55 dictionaryWithObjects:v56 forKeys:v57 count:v58];
  *a8 = [v53 errorWithDomain:@"ATL" code:3 userInfo:v68];

LABEL_70:
LABEL_71:
  a8 = 0;
LABEL_99:

LABEL_100:

  return a8;
}

+ (BOOL)isEMV:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[EMVDecoder isArgon:v3]
    || +[EMVDecoder isHelium:v3]
    || +[EMVDecoder isNeon:v3]
    || +[EMVDecoder isXenon:v3]
    || +[EMVDecoder isLuau:v3]
    || +[EMVDecoder isPoke:v3]
    || +[EMVDecoder isEMVLegacy:v3];

  return v4;
}

+ (BOOL)isArgon:(id)a3
{
  return [&unk_1F24E2590 containsObject:a3];
}

+ (BOOL)isHelium:(id)a3
{
  return [&unk_1F24E25A8 containsObject:a3];
}

+ (BOOL)isNeon:(id)a3
{
  return [&unk_1F24E25C0 containsObject:a3];
}

+ (BOOL)isXenon:(id)a3
{
  return [&unk_1F24E25D8 containsObject:a3];
}

+ (BOOL)isLuau:(id)a3
{
  return [&unk_1F24E25F0 containsObject:a3];
}

+ (BOOL)isPoke:(id)a3
{
  return [&unk_1F24E2608 containsObject:a3];
}

+ (BOOL)isEMVLegacy:(id)a3
{
  return [&unk_1F24E2620 containsObject:a3];
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Supported";
  v9[1] = @"DelayExpressReentry";
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = &unk_1F24E1C78;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10, v9, 2, a6, a7];

  return v7;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  BOOL v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "EMV decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"EMV decoder doesn't expect processEndOfTransaction"];
  v10 = (void *)v9;
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
      uint64_t v15 = v22;
      uint64_t v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v24;
      uint64_t v16 = &v23;
      uint64_t v17 = 1;
    }
    uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

@end