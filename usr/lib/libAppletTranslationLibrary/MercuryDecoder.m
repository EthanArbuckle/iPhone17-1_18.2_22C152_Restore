@interface MercuryDecoder
+ (BOOL)IsIncompatibleApplet:(unsigned int)a3 sw:(unsigned __int16)a4;
+ (BOOL)isSpecialBusErrorFor45299868:(id)a3 state:(id)a4 transaction:(id)a5;
+ (id)DecodeE1TLV:(id *)a3 transactionInfo:(id *)a4 error:(id *)a5;
+ (id)DecodeE456TLV:(id *)a3 currencyExponent:(id)a4 error:(id *)a5;
+ (id)parseActivityTimeout:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 moduleAID:(id)a5 error:(id *)a6;
+ (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (void)ApplyHackFor50863616:(id)a3 historyRecords:(id)a4 transceiver:(id)a5;
+ (void)RemoveMatchedTapIns:(id)a3 transactionsInProgress:(id)a4;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
@end

@implementation MercuryDecoder

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (![v11 length])
  {
    v17 = ATLLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v17, OS_LOG_TYPE_ERROR, "Empty eventData?", buf, 2u);
    }

    uint64_t v18 = [[NSString alloc] initWithFormat:@"Empty eventData?"];
    v19 = (void *)v18;
    if (!a8) {
      goto LABEL_24;
    }
    id v20 = *a8;
    v21 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v22 = *MEMORY[0x1E4F28A50];
      v47[0] = *MEMORY[0x1E4F28568];
      v47[1] = v22;
      v48[0] = v18;
      v48[1] = v20;
      v23 = (void *)MEMORY[0x1E4F1C9E8];
      v24 = v48;
      v25 = v47;
      uint64_t v26 = 2;
    }
    else
    {
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50[0] = v18;
      v23 = (void *)MEMORY[0x1E4F1C9E8];
      v24 = v50;
      v25 = &v49;
      uint64_t v26 = 1;
    }
    v37 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:v26];
    v38 = v21;
    uint64_t v39 = 6;
    goto LABEL_23;
  }
  id v14 = v11;
  uint64_t v15 = *(unsigned __int8 *)[v14 bytes];
  switch(v15)
  {
    case 0x10:
      uint64_t v16 = +[MercuryDecoder parseActivityTimeout:v14 withApplet:v12 error:a8];
      goto LABEL_13;
    case 2:
      uint64_t v16 = +[MercuryDecoder parseEndEvent:v14 withApplet:v12 moduleAID:v13 error:a8];
      goto LABEL_13;
    case 1:
      uint64_t v16 = +[MercuryDecoder parseStartEvent:v14 withApplet:v12 error:a8];
LABEL_13:
      v27 = (void *)v16;
      goto LABEL_25;
  }
  v28 = ATLLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v46 = v15;
    _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x", buf, 8u);
  }

  uint64_t v29 = [[NSString alloc] initWithFormat:@"Invalid event type 0x%x", v15];
  v19 = (void *)v29;
  if (a8)
  {
    id v30 = *a8;
    v31 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v32 = *MEMORY[0x1E4F28A50];
      v41[0] = *MEMORY[0x1E4F28568];
      v41[1] = v32;
      v42[0] = v29;
      v42[1] = v30;
      v33 = (void *)MEMORY[0x1E4F1C9E8];
      v34 = v42;
      v35 = v41;
      uint64_t v36 = 2;
    }
    else
    {
      uint64_t v43 = *MEMORY[0x1E4F28568];
      uint64_t v44 = v29;
      v33 = (void *)MEMORY[0x1E4F1C9E8];
      v34 = &v44;
      v35 = &v43;
      uint64_t v36 = 1;
    }
    v37 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:v36];
    v38 = v31;
    uint64_t v39 = 3;
LABEL_23:
    *a8 = [v38 errorWithDomain:@"ATL" code:v39 userInfo:v37];
  }
LABEL_24:

  v27 = 0;
LABEL_25:

  return v27;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F1C9B8] dataWithHexString:a4];
  id v13 = SelectByNameCmd(v12);

  id v14 = [v10 transceiveAndCheckSW:v13 error:a7];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&getAppletStateAndHistory_withApplet_withPackage_withModule_withError__getE1Cmd length:5 freeWhenDone:0];
    uint64_t v16 = [v10 transceiveAndCheckSW:v15 error:a7];
    v17 = v16;
    if (v16)
    {
      v47[0] = [v16 bytes];
      v47[1] = [v17 length];
      uint64_t v18 = +[MercuryDecoder DecodeE1TLV:v47 transactionInfo:0 error:a7];
      if (v18)
      {
        uint64_t v39 = v14;
        v40 = v17;
        v41 = v15;
        v42 = v13;
        id v43 = v11;
        v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
        char v46 = 0;
        int v45 = 52352;
        id v20 = [MEMORY[0x1E4F1CA58] dataWithBytes:&v45 length:5];
        unsigned __int8 v44 = 1;
        uint64_t v38 = 138412290;
        do
        {
          [v20 replaceBytesInRange:3 withBytes:1 length:&v44];
          v21 = [v10 transceiveAndCheckSW:v20 error:a7];
          if (!v21)
          {
            v31 = 0;
            goto LABEL_30;
          }
          uint64_t v22 = v21;
          if ([v21 length])
          {
            long long v52 = 0uLL;
            *(void *)&long long v52 = [v22 bytes];
            *((void *)&v52 + 1) = [v22 length];
            v23 = [v18 objectForKeyedSubscript:@"CardCurrencyExponent"];
            v24 = +[MercuryDecoder DecodeE456TLV:&v52 currencyExponent:v23 error:a7];

            if (v24)
            {
              [v19 addObject:v24];
            }
            else
            {
              uint64_t v25 = [v22 bytes];
              uint64_t v26 = [v22 length];
              LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[MercuryDecoder getAppletStateAndHistory:withApplet:withPackage:withModule:withError:]", 127, v25, v26, @"Skipping invalid transaction info:", v27, v28, v38);
              if (a7 && *a7)
              {
                uint64_t v29 = ATLLogObject();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  id v30 = *a7;
                  *(_DWORD *)buf = v38;
                  id v51 = v30;
                  _os_log_impl(&dword_1CA552000, v29, OS_LOG_TYPE_ERROR, "Swallowing txn error %@", buf, 0xCu);
                }

                *a7 = 0;
              }
            }
          }
          ++v44;
        }
        while (v44 <= 0xAu);
        uint64_t v32 = [v18 objectForKeyedSubscript:@"TransactionInProgress"];
        +[MercuryDecoder RemoveMatchedTapIns:v19 transactionsInProgress:v32];

        v33 = [v18 objectForKeyedSubscript:@"SPRaw"];
        uint64_t v34 = [v33 unsignedIntegerValue];

        if (v34 == 16) {
          +[MercuryDecoder ApplyHackFor50863616:v18 historyRecords:v19 transceiver:v10];
        }
        if (+[AppletTranslator isInternalBuild]())
        {
          v35 = +[AppletConfigurationData extraDebugScriptForModule:v43];
          if (v35) {
            [v10 applyScript:v35 ignoreSW:1 error:0];
          }
          uint64_t v36 = ATLLogObject();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v52) = v38;
            *(void *)((char *)&v52 + 4) = v35;
            _os_log_impl(&dword_1CA552000, v36, OS_LOG_TYPE_DEFAULT, "Script executed: %@", (uint8_t *)&v52, 0xCu);
          }
        }
        v48[0] = @"State";
        v48[1] = @"TransactionHistory";
        v49[0] = v18;
        v49[1] = v19;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
LABEL_30:

        id v13 = v42;
        id v11 = v43;
        v17 = v40;
        uint64_t v15 = v41;
        id v14 = v39;
      }
      else
      {
        v31 = 0;
      }
    }
    else
    {
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] != 9)
  {
    id v14 = ATLLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v40 = [v7 length];
      __int16 v41 = 2048;
      uint64_t v42 = 9;
      _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_ERROR, "Start event length %zu (exp) %zu", buf, 0x16u);
    }

    uint64_t v15 = [[NSString alloc] initWithFormat:@"Start event length %zu (exp) %zu", objc_msgSend(v7, "length"), 9];
    id v10 = (void *)v15;
    if (a5)
    {
      id v16 = *a5;
      v17 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v18 = *MEMORY[0x1E4F28A50];
        v35[0] = *MEMORY[0x1E4F28568];
        v35[1] = v18;
        v36[0] = v15;
        v36[1] = v16;
        v19 = (void *)MEMORY[0x1E4F1C9E8];
        id v20 = v36;
        v21 = v35;
LABEL_14:
        uint64_t v27 = 2;
LABEL_19:
        id v11 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v27];
        [v17 errorWithDomain:@"ATL" code:3 userInfo:v11];
        id v13 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      uint64_t v37 = *MEMORY[0x1E4F28568];
      uint64_t v38 = v15;
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = &v38;
      v21 = &v37;
LABEL_18:
      uint64_t v27 = 1;
      goto LABEL_19;
    }
LABEL_15:
    id v13 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = [v7 bytes];
  if (*(unsigned char *)(v9 + 1) != 2)
  {
    uint64_t v22 = ATLLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = *(unsigned __int8 *)(v9 + 1);
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v23;
      _os_log_impl(&dword_1CA552000, v22, OS_LOG_TYPE_ERROR, "Start event version %u", buf, 8u);
    }

    uint64_t v24 = [[NSString alloc] initWithFormat:@"Start event version %u", *(unsigned __int8 *)(v9 + 1)];
    id v10 = (void *)v24;
    if (a5)
    {
      id v25 = *a5;
      v17 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v26 = *MEMORY[0x1E4F28A50];
        v31[0] = *MEMORY[0x1E4F28568];
        v31[1] = v26;
        v32[0] = v24;
        v32[1] = v25;
        v19 = (void *)MEMORY[0x1E4F1C9E8];
        id v20 = v32;
        v21 = v31;
        goto LABEL_14;
      }
      uint64_t v33 = *MEMORY[0x1E4F28568];
      uint64_t v34 = v24;
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = &v34;
      v21 = &v33;
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  v29[0] = @"EventType";
  v29[1] = @"appletIdentifier";
  v30[0] = @"StartEvent";
  v30[1] = v8;
  v29[2] = @"Version";
  id v10 = [NSNumber numberWithUnsignedChar:2];
  v30[2] = v10;
  v29[3] = @"command";
  id v11 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)(v9 + 5))];
  v30[3] = v11;
  v29[4] = @"selectStatus";
  id v12 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16];
  v29[5] = @"IgnoreRFEvents";
  v29[6] = @"DontWaitForEOT";
  v30[4] = v12;
  v30[5] = MEMORY[0x1E4F1CC38];
  v30[6] = MEMORY[0x1E4F1CC38];
  v30[7] = MEMORY[0x1E4F1CC38];
  v29[7] = @"RequiresPowerCycle";
  v29[8] = @"DelayExpressReentry";
  v30[8] = &unk_1F24E1DC8;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:9];

LABEL_20:
LABEL_21:

  return v13;
}

+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 moduleAID:(id)a5 error:(id *)a6
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((unint64_t)[v10 length] <= 0x2C)
  {
    id v13 = ATLLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v10 length];
      _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v14 = [[NSString alloc] initWithFormat:@"End event length %zu", [v10 length]];
    uint64_t v15 = (void *)v14;
    if (!a6) {
      goto LABEL_37;
    }
    id v16 = *a6;
    v17 = (void *)MEMORY[0x1E4F28C58];
    if (*a6)
    {
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      v74[0] = *MEMORY[0x1E4F28568];
      v74[1] = v18;
      v75[0] = v14;
      v75[1] = v16;
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = v75;
      v21 = v74;
LABEL_30:
      uint64_t v54 = 2;
LABEL_36:
      v55 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v54];
      *a6 = [v17 errorWithDomain:@"ATL" code:3 userInfo:v55];

LABEL_37:
      unsigned __int8 v44 = 0;
      goto LABEL_38;
    }
    uint64_t v76 = *MEMORY[0x1E4F28568];
    v77[0] = v14;
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = v77;
    v21 = &v76;
    goto LABEL_35;
  }
  id v22 = v10;
  uint64_t v23 = [v22 bytes];
  uint64_t v24 = v23;
  if (*(unsigned char *)(v23 + 1) != 2)
  {
    uint64_t v49 = ATLLogObject();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      int v50 = *(unsigned __int8 *)(v24 + 1);
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v50;
      _os_log_impl(&dword_1CA552000, v49, OS_LOG_TYPE_ERROR, "End event version %u", (uint8_t *)&buf, 8u);
    }

    uint64_t v51 = [[NSString alloc] initWithFormat:@"End event version %u", *(unsigned __int8 *)(v24 + 1)];
    uint64_t v15 = (void *)v51;
    if (!a6) {
      goto LABEL_37;
    }
    id v52 = *a6;
    v17 = (void *)MEMORY[0x1E4F28C58];
    if (*a6)
    {
      uint64_t v53 = *MEMORY[0x1E4F28A50];
      v70[0] = *MEMORY[0x1E4F28568];
      v70[1] = v53;
      v71[0] = v51;
      v71[1] = v52;
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = v71;
      v21 = v70;
      goto LABEL_30;
    }
    uint64_t v72 = *MEMORY[0x1E4F28568];
    uint64_t v73 = v51;
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = &v73;
    v21 = &v72;
LABEL_35:
    uint64_t v54 = 1;
    goto LABEL_36;
  }
  *(void *)&long long buf = v23 + 44;
  *((void *)&buf + 1) = [v22 length] - 44;
  id v66 = 0;
  id v25 = +[MercuryDecoder DecodeE1TLV:&buf transactionInfo:&v66 error:a6];
  id v26 = v66;
  if (v25)
  {
    id v64 = v12;
    id v65 = v11;
    uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    v63 = v25;
    [v27 setObject:v25 forKeyedSubscript:@"State"];
    if (v26) {
      [v27 setObject:v26 forKeyedSubscript:@"Transaction"];
    }
    v62 = v27;
    uint64_t v28 = bswap32(*(_DWORD *)(v24 + 4));
    uint64_t v29 = bswap32(*(unsigned __int16 *)(v24 + 2)) >> 16;
    BOOL v30 = +[MercuryDecoder IsIncompatibleApplet:v28 sw:v29];
    int v31 = *(unsigned __int16 *)(v24 + 40);
    uint64_t v32 = v26;
    if (v30) {
      __int16 v33 = -4092;
    }
    else {
      __int16 v33 = 64;
    }
    unsigned int v34 = [a1 isSpecialBusErrorFor45299868:v64 state:v63 transaction:v32];
    v59 = (void *)MEMORY[0x1E4F1CA60];
    v67[0] = @"EventType";
    v67[1] = @"appletIdentifier";
    v68[0] = @"EndEvent";
    v68[1] = v65;
    v67[2] = @"Version";
    v61 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v24 + 1)];
    v68[2] = v61;
    v67[3] = @"transactionIdentifier";
    v60 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v24 + 8 length:32];
    uint64_t v35 = [v60 asHexString];
    v58 = (void *)v35;
    if (v31 == 1) {
      __int16 v33 = 0;
    }
    v68[3] = v35;
    v67[4] = @"didError";
    int v36 = v31 == 1 || v30;
    v57 = [NSNumber numberWithInt:v36 | v34];
    v68[4] = v57;
    v67[5] = @"command";
    uint64_t v37 = [NSNumber numberWithUnsignedInt:v28];
    v68[5] = v37;
    v67[6] = @"status";
    uint64_t v38 = [NSNumber numberWithUnsignedShort:v29];
    v68[6] = v38;
    v67[7] = @"result";
    uint64_t v39 = (unsigned __int16)v33 & 0xFFFC;
    id v26 = v32;
    uint64_t v40 = [NSNumber numberWithUnsignedShort:v39];
    v68[7] = v40;
    v67[8] = @"informative";
    __int16 v41 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v24 + 42)) >> 16];
    v68[8] = v41;
    v68[9] = &unk_1F24E1DE0;
    v67[9] = @"type";
    v67[10] = @"tlv";
    uint64_t v42 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&buf];
    v67[11] = @"parsedInfo";
    v68[10] = v42;
    v68[11] = v62;
    uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:12];
    unsigned __int8 v44 = [v59 dictionaryWithDictionary:v43];

    if (v32)
    {
      int v45 = [v32 objectForKeyedSubscript:@"Amount"];

      if (v45)
      {
        char v46 = [v32 objectForKeyedSubscript:@"Amount"];
        [v44 setObject:v46 forKeyedSubscript:@"amount"];
      }
    }
    id v25 = v63;
    v47 = [v63 objectForKeyedSubscript:@"CardCurrency"];

    if (v47)
    {
      v48 = [v63 objectForKeyedSubscript:@"CardCurrency"];
      [v44 setObject:v48 forKeyedSubscript:@"currency"];
    }
    id v12 = v64;
    id v11 = v65;
  }
  else
  {
    unsigned __int8 v44 = 0;
  }

LABEL_38:

  return v44;
}

+ (id)parseActivityTimeout:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] != 11)
  {
    uint64_t v23 = ATLLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      *(void *)v57 = [v7 length];
      *(_WORD *)&v57[8] = 2048;
      uint64_t v58 = 11;
      _os_log_impl(&dword_1CA552000, v23, OS_LOG_TYPE_ERROR, "Activity param length %zu (exp %zu)", buf, 0x16u);
    }

    uint64_t v24 = [[NSString alloc] initWithFormat:@"Activity param length %zu (exp %zu)", objc_msgSend(v7, "length"), 11];
    id v25 = (void *)v24;
    if (!a5) {
      goto LABEL_23;
    }
    id v26 = *a5;
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v28 = *MEMORY[0x1E4F28A50];
      v52[0] = *MEMORY[0x1E4F28568];
      v52[1] = v28;
      v53[0] = v24;
      v53[1] = v26;
      uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v30 = v53;
      int v31 = v52;
LABEL_17:
      uint64_t v37 = 2;
LABEL_22:
      uint64_t v38 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:v37];
      *a5 = [v27 errorWithDomain:@"ATL" code:3 userInfo:v38];

LABEL_23:
      id v22 = 0;
      goto LABEL_24;
    }
    uint64_t v54 = *MEMORY[0x1E4F28568];
    uint64_t v55 = v24;
    uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v30 = &v55;
    int v31 = &v54;
LABEL_21:
    uint64_t v37 = 1;
    goto LABEL_22;
  }
  uint64_t v9 = [v7 bytes];
  uint64_t v10 = v9;
  if (*(unsigned char *)(v9 + 1) != 2)
  {
    uint64_t v32 = ATLLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v33 = *(unsigned __int8 *)(v10 + 1);
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)v57 = v33;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = 2;
      _os_log_impl(&dword_1CA552000, v32, OS_LOG_TYPE_ERROR, "Activity Timeout got vers %u exp %u", buf, 0xEu);
    }

    uint64_t v34 = [[NSString alloc] initWithFormat:@"Activity Timeout got vers %u exp %u", *(unsigned __int8 *)(v10 + 1), 2];
    id v25 = (void *)v34;
    if (!a5) {
      goto LABEL_23;
    }
    id v35 = *a5;
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v36 = *MEMORY[0x1E4F28A50];
      v48[0] = *MEMORY[0x1E4F28568];
      v48[1] = v36;
      v49[0] = v34;
      v49[1] = v35;
      uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v30 = v49;
      int v31 = v48;
      goto LABEL_17;
    }
    uint64_t v50 = *MEMORY[0x1E4F28568];
    uint64_t v51 = v34;
    uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v30 = &v51;
    int v31 = &v50;
    goto LABEL_21;
  }
  uint64_t v11 = bswap32(*(_DWORD *)(v9 + 5));
  uint64_t v12 = bswap32(*(unsigned __int16 *)(v9 + 3)) >> 16;
  BOOL v13 = +[MercuryDecoder IsIncompatibleApplet:v11 sw:v12];
  uint64_t v14 = ATLLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)v57 = v11;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v12;
    LOWORD(v58) = 1024;
    *(_DWORD *)((char *)&v58 + 2) = v13;
    _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_DEFAULT, "Timeout! Last cmd 0x%x sw 0x%x incompatible %d", buf, 0x14u);
  }

  if (v13)
  {
    v46[0] = @"EventType";
    v46[1] = @"appletIdentifier";
    v47[0] = @"EndEvent";
    v47[1] = v8;
    v46[2] = @"Version";
    uint64_t v15 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v10 + 1)];
    void v47[2] = v15;
    v47[3] = MEMORY[0x1E4F1CC38];
    v46[3] = @"didError";
    v46[4] = @"command";
    id v16 = [NSNumber numberWithUnsignedInt:v11];
    v47[4] = v16;
    v46[5] = @"status";
    v17 = [NSNumber numberWithUnsignedShort:v12];
    v47[5] = v17;
    v46[6] = @"TimeOutValue";
    uint64_t v18 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v10 + 9)];
    v47[6] = v18;
    v47[7] = &unk_1F24E1DF8;
    v46[7] = @"result";
    v46[8] = @"type";
    v47[8] = &unk_1F24E1DE0;
    v46[9] = @"parsedInfo";
    unsigned __int8 v44 = @"State";
    uint64_t v42 = @"SPRaw";
    v19 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v10 + 2)];
    uint64_t v43 = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    int v45 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    v47[9] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:10];
  }
  else
  {
    v40[0] = @"EventType";
    v40[1] = @"Result";
    v41[0] = @"ActivityTimeout";
    v41[1] = @"Success";
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  }
LABEL_24:

  return v22;
}

+ (id)DecodeE1TLV:(id *)a3 transactionInfo:(id *)a4 error:(id *)a5
{
  v118[1] = *MEMORY[0x1E4F143B8];
  uint64_t v88 = 0;
  $BE749665CD263385F3F5ED554982D87D v89 = ($BE749665CD263385F3F5ED554982D87D)0;
  uint64_t v8 = DERDecodeItemCtx((uint64_t)a3, (unint64_t *)&v88);
  if (!v8)
  {
    if (v88 != 0xE000000000000001)
    {
      LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[MercuryDecoder DecodeE1TLV:transactionInfo:error:]", 333, (uint64_t)a3->var0, a3->var1, @"Unexpected tag 0x%llx, skipping to contents...", v9, v10, v88);
      $BE749665CD263385F3F5ED554982D87D v89 = *a3;
    }
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    unsigned long long v109 = 0u;
    unsigned long long v110 = 0u;
    unsigned long long v108 = 0u;
    long long buf = 0u;
    memset(v107, 0, sizeof(v107));
    uint64_t v22 = DERParseSequenceSpec((uint64_t)&v89, (uint64_t)&e1ContentSpec, (char *)&buf, 0xA0uLL);
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = ATLLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v98 = 67109120;
        LODWORD(v99) = v23;
        _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v98, 8u);
      }

      uint64_t v25 = [[NSString alloc] initWithFormat:@"Failed to decode E1 contents %d", v23];
      id v26 = (void *)v25;
      if (!a5)
      {
        id v35 = 0;
LABEL_64:

        goto LABEL_65;
      }
      id v27 = *a5;
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v29 = *MEMORY[0x1E4F28A50];
        v102[0] = *MEMORY[0x1E4F28568];
        v102[1] = v29;
        v103[0] = v25;
        v103[1] = v27;
        BOOL v30 = (void *)MEMORY[0x1E4F1C9E8];
        int v31 = v103;
        uint64_t v32 = v102;
        uint64_t v33 = 2;
      }
      else
      {
        uint64_t v104 = *MEMORY[0x1E4F28568];
        uint64_t v105 = v25;
        BOOL v30 = (void *)MEMORY[0x1E4F1C9E8];
        int v31 = &v105;
        uint64_t v32 = &v104;
        uint64_t v33 = 1;
      }
      uint64_t v36 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v33];
      [v28 errorWithDomain:@"ATL" code:3 userInfo:v36];
      id v35 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_63:

      goto LABEL_64;
    }
    id v26 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
    v100[0] = &unk_1F24E1E10;
    v100[1] = &unk_1F24E1E28;
    v101[0] = @"Pioneer";
    v101[1] = @"Galileo";
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:2];
    if (*((void *)&buf + 1)
      && ([NSNumber numberWithUnsignedChar:*(unsigned __int8 *)buf],
          uint64_t v37 = objc_claimAutoreleasedReturnValue(),
          [v36 objectForKeyedSubscript:v37],
          uint64_t v38 = objc_claimAutoreleasedReturnValue(),
          v37,
          v38))
    {
      [v26 setObject:v38 forKeyedSubscript:@"SP"];
      uint64_t v39 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)buf];
      [v26 setObject:v39 forKeyedSubscript:@"SPRaw"];

      if (v107[1])
      {
        uint64_t v40 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:v107];
        [v26 setObject:v40 forKeyedSubscript:@"CardIdentifier"];
      }
      __int16 v87 = 0x7FFF;
      if (!*((void *)&v108 + 1)) {
        goto LABEL_30;
      }
      uint64_t v41 = DecodeBCD((const DERItem *)&v108);
      uint64_t v42 = +[ATLCurrency currencyCodeForNumber:v41 exponentOut:&v87];
      if (v42)
      {
        uint64_t v43 = (void *)v42;
        [v26 setObject:v42 forKeyedSubscript:@"CardCurrency"];
        unsigned __int8 v44 = [NSNumber numberWithShort:v87];
        [v26 setObject:v44 forKeyedSubscript:@"CardCurrencyExponent"];

        int v45 = [NSNumber numberWithUnsignedLongLong:v41];
        [v26 setObject:v45 forKeyedSubscript:@"CardCurrencyCode"];

        if (v87 != 0x7FFF && *((void *)&v109 + 1))
        {
          int S32BE = ReadS32BE((const DERItem *)&v109);
          if (S32BE >= 0) {
            uint64_t v47 = S32BE;
          }
          else {
            uint64_t v47 = -S32BE;
          }
          v48 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v47 exponent:(__int16)-v87 isNegative:S32BE >> 31];
          [v26 setObject:v48 forKeyedSubscript:@"Balance"];
        }
LABEL_30:
        if (*((void *)&v110 + 1))
        {
          uint64_t v49 = [NSNumber numberWithInt:ReadS32BE((const DERItem *)&v110)];
          [v26 setObject:v49 forKeyedSubscript:@"PointBalance"];
        }
        unint64_t v50 = *((void *)&v111 + 1);
        if (*((void *)&v111 + 1))
        {
          unint64_t v51 = *((void *)&v111 + 1) / 3uLL;
          id v52 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*((void *)&v111 + 1) / 3uLL];
          if (v50 >= 3)
          {
            uint64_t v53 = 0;
            if (v51 <= 1) {
              uint64_t v54 = 1;
            }
            else {
              uint64_t v54 = v51;
            }
            do
            {
              uint64_t v55 = DecodeTransactionDetail((unsigned __int8 *)(v111 + v53));
              [v52 addObject:v55];

              v53 += 3;
              --v54;
            }
            while (v54);
          }
          v56 = [MEMORY[0x1E4F1C978] arrayWithArray:v52];
          [v26 setObject:v56 forKeyedSubscript:@"TransactionInProgress"];
        }
        if (*((void *)&v112 + 1))
        {
          v57 = [NSNumber numberWithInt:*(unsigned char *)v112 != 0];
          [v26 setObject:v57 forKeyedSubscript:@"CardDenyListed"];
        }
        if (*((void *)&v113 + 1))
        {
          uint64_t v58 = (void *)MEMORY[0x1E4F1C9D8];
          uint64_t v59 = DecodeBCD((const unsigned __int8 *)v113, 1);
          uint64_t v60 = DecodeBCD((const unsigned __int8 *)(v113 + 1), 1);
          v61 = [v58 dateWithYear:v59 month:v60 day:DecodeBCD((const unsigned __int8 *)(v113 + 2), 1)];
          if ([v61 year] != 99 || objc_msgSend(v61, "month") != 12 || objc_msgSend(v61, "day") != 31)
          {
            [v61 setYear:[v61 year] + 2000];
            [v26 setObject:v61 forKeyedSubscript:@"CardExpirationDate"];
          }
        }
        if (a4 && *((void *)&v114 + 1))
        {
          v62 = [v26 objectForKeyedSubscript:@"CardCurrencyExponent"];
          *a4 = +[MercuryDecoder DecodeE456TLV:&v114 currencyExponent:v62 error:a5];
        }
        id v35 = v26;
        goto LABEL_62;
      }
      uint64_t v76 = ATLLogObject();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v98 = 134217984;
        uint64_t v99 = v41;
        _os_log_impl(&dword_1CA552000, v76, OS_LOG_TYPE_ERROR, "Invalid currency code %llu", v98, 0xCu);
      }

      uint64_t v77 = [[NSString alloc] initWithFormat:@"Invalid currency code %llu", v41];
      v78 = (void *)v77;
      if (a5)
      {
        id v79 = *a5;
        v80 = (void *)MEMORY[0x1E4F28C58];
        if (*a5)
        {
          uint64_t v81 = *MEMORY[0x1E4F28A50];
          v90[0] = *MEMORY[0x1E4F28568];
          v90[1] = v81;
          v91[0] = v77;
          v91[1] = v79;
          v82 = (void *)MEMORY[0x1E4F1C9E8];
          v83 = v91;
          v84 = v90;
          uint64_t v85 = 2;
        }
        else
        {
          uint64_t v92 = *MEMORY[0x1E4F28568];
          uint64_t v93 = v77;
          v82 = (void *)MEMORY[0x1E4F1C9E8];
          v83 = &v93;
          v84 = &v92;
          uint64_t v85 = 1;
        }
        v86 = [v82 dictionaryWithObjects:v83 forKeys:v84 count:v85];
        *a5 = [v80 errorWithDomain:@"ATL" code:3 userInfo:v86];
      }
    }
    else
    {
      v63 = ATLLogObject();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        id v64 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&buf];
        *(_DWORD *)v98 = 138412290;
        uint64_t v99 = (uint64_t)v64;
        _os_log_impl(&dword_1CA552000, v63, OS_LOG_TYPE_ERROR, "Invalid SP identifier %@", v98, 0xCu);
      }
      id v65 = [NSString alloc];
      id v66 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&buf];
      uint64_t v38 = (void *)[v65 initWithFormat:@"Invalid SP identifier %@", v66];

      if (a5)
      {
        id v67 = *a5;
        v68 = (void *)MEMORY[0x1E4F28C58];
        if (*a5)
        {
          uint64_t v69 = *MEMORY[0x1E4F28A50];
          v94[0] = *MEMORY[0x1E4F28568];
          v94[1] = v69;
          v95[0] = v38;
          v95[1] = v67;
          v70 = (void *)MEMORY[0x1E4F1C9E8];
          v71 = (void **)v95;
          uint64_t v72 = v94;
          uint64_t v73 = 2;
        }
        else
        {
          uint64_t v96 = *MEMORY[0x1E4F28568];
          v97 = v38;
          v70 = (void *)MEMORY[0x1E4F1C9E8];
          v71 = &v97;
          uint64_t v72 = &v96;
          uint64_t v73 = 1;
        }
        v74 = [v70 dictionaryWithObjects:v71 forKeys:v72 count:v73];
        *a5 = [v68 errorWithDomain:@"ATL" code:3 userInfo:v74];
      }
    }
    id v35 = 0;
LABEL_62:

    goto LABEL_63;
  }
  uint64_t v11 = v8;
  uint64_t v12 = ATLLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v11;
    _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_ERROR, "Failed to decode E1 %d", (uint8_t *)&buf, 8u);
  }

  uint64_t v13 = [[NSString alloc] initWithFormat:@"Failed to decode E1 %d", v11];
  uint64_t v14 = (void *)v13;
  if (a5)
  {
    id v15 = *a5;
    id v16 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v17 = *MEMORY[0x1E4F28A50];
      v115[0] = *MEMORY[0x1E4F28568];
      v115[1] = v17;
      v116[0] = v13;
      v116[1] = v15;
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = v116;
      id v20 = v115;
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v117 = *MEMORY[0x1E4F28568];
      v118[0] = v13;
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = v118;
      id v20 = &v117;
      uint64_t v21 = 1;
    }
    uint64_t v34 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:v21];
    *a5 = [v16 errorWithDomain:@"ATL" code:3 userInfo:v34];
  }
  id v35 = 0;
LABEL_65:

  return v35;
}

+ (id)DecodeE456TLV:(id *)a3 currencyExponent:(id)a4 error:(id *)a5
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unint64_t v52 = 0;
  v53[0] = 0;
  v53[1] = 0;
  uint64_t v8 = DERDecodeItemCtx((uint64_t)a3, &v52);
  if (v8 || v52 + 0x1FFFFFFFFFFFFFF9 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    uint64_t v9 = ATLLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v52;
      _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_ERROR, "Failed to decode E4,E5,E6 %d 0x%llX", buf, 0x12u);
    }

    id v10 = [NSString alloc];
    uint64_t v11 = [v10 initWithFormat:@"Failed to decode E4,E5,E6 %d 0x%llX", v8, v52];
    uint64_t v12 = (void *)v11;
    if (a5)
    {
      id v13 = *a5;
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v15 = *MEMORY[0x1E4F28A50];
        v70[0] = *MEMORY[0x1E4F28568];
        v70[1] = v15;
        v71[0] = v11;
        v71[1] = v13;
        id v16 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v17 = v71;
        uint64_t v18 = v70;
        uint64_t v19 = 2;
      }
      else
      {
        uint64_t v72 = *MEMORY[0x1E4F28568];
        v73[0] = v11;
        id v16 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v17 = v73;
        uint64_t v18 = &v72;
        uint64_t v19 = 1;
      }
      id v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
      *a5 = [v14 errorWithDomain:@"ATL" code:3 userInfo:v20];
    }
    a5 = 0;
    goto LABEL_11;
  }
  unsigned long long v68 = 0u;
  long long v69 = 0u;
  unsigned long long v66 = 0u;
  unsigned long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  unsigned long long v62 = 0u;
  long long v63 = 0u;
  unsigned long long v61 = 0u;
  memset(buf, 0, sizeof(buf));
  uint64_t v22 = DERParseSequenceSpec((uint64_t)v53, (uint64_t)&e456ContentSpec, (char *)buf, 0xB0uLL);
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v58 = 67109120;
      int v59 = v23;
      _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Failed to decode E4,E5,E6 contents %d", v58, 8u);
    }

    uint64_t v25 = [[NSString alloc] initWithFormat:@"Failed to decode E4,E5,E6 contents %d", v23];
    id v26 = (void *)v25;
    if (a5)
    {
      id v27 = *a5;
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v29 = *MEMORY[0x1E4F28A50];
        v54[0] = *MEMORY[0x1E4F28568];
        v54[1] = v29;
        v55[0] = v25;
        v55[1] = v27;
        BOOL v30 = (void *)MEMORY[0x1E4F1C9E8];
        int v31 = v55;
        uint64_t v32 = v54;
        uint64_t v33 = 2;
      }
      else
      {
        uint64_t v56 = *MEMORY[0x1E4F28568];
        uint64_t v57 = v25;
        BOOL v30 = (void *)MEMORY[0x1E4F1C9E8];
        int v31 = &v57;
        uint64_t v32 = &v56;
        uint64_t v33 = 1;
      }
      v48 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v33];
      *a5 = [v28 errorWithDomain:@"ATL" code:3 userInfo:v48];

      a5 = 0;
    }
    goto LABEL_59;
  }
  a5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:11];
  if (*(void *)&buf[8])
  {
    id v34 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v34 setYear:DecodeBCD(*(const unsigned __int8 **)buf, 1)];
    [v34 setMonth:DecodeBCD((const unsigned __int8 *)(*(void *)buf + 1), 1)];
    [v34 setDay:DecodeBCD((const unsigned __int8 *)(*(void *)buf + 2), 1)];
    [v34 setYear:[v34 year] + 2000];
    if (*(void *)&buf[24])
    {
      [v34 setHour:DecodeBCD(*(const unsigned __int8 **)&buf[16], 1)];
      [v34 setMinute:DecodeBCD((const unsigned __int8 *)(*(void *)&buf[16] + 1), 1)];
      [v34 setSecond:DecodeBCD((const unsigned __int8 *)(*(void *)&buf[16] + 2), 1)];
    }
    [a5 setObject:v34 forKeyedSubscript:@"TransactionTime"];
  }
  if (v7 && *((void *)&v61 + 1))
  {
    int S32BE = ReadS32BE((const DERItem *)&v61);
    if (S32BE >= 0) {
      uint64_t v36 = S32BE;
    }
    else {
      uint64_t v36 = -S32BE;
    }
    uint64_t v37 = [[MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v36 exponent:-[v7 shortValue] isNegative:S32BE >> 31];
    [a5 setObject:v37 forKeyedSubscript:@"FinalBalance"];
  }
  if (v7 && *((void *)&v62 + 1))
  {
    int v38 = ReadS32BE((const DERItem *)&v62);
    if (v38 >= 0) {
      uint64_t v39 = v38;
    }
    else {
      uint64_t v39 = -v38;
    }
    uint64_t v40 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v39 exponent:(__int16)-[v7 shortValue] isNegative:v38 >> 31];
    [a5 setObject:v40 forKeyedSubscript:@"Amount"];
  }
  if (*((void *)&v63 + 1))
  {
    uint64_t v41 = DecodeTransactionDetail((unsigned __int8 *)v63);
    [a5 setObject:v41 forKeyedSubscript:@"TypeDetail"];

    uint64_t v42 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v63];
    [a5 setObject:v42 forKeyedSubscript:@"TypeDetailRaw"];
  }
  if (*((void *)&v64 + 1))
  {
    uint64_t v43 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v64];
    if (([v43 isAlLFF] & 1) == 0) {
      [a5 setObject:v43 forKeyedSubscript:@"StartStation"];
    }
  }
  if (*((void *)&v65 + 1))
  {
    unsigned __int8 v44 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v65];
    if (([v44 isAlLFF] & 1) == 0) {
      [a5 setObject:v44 forKeyedSubscript:@"EndStation"];
    }
  }
  if (*((void *)&v66 + 1))
  {
    int v45 = [a5 objectForKeyedSubscript:@"TypeDetailRaw"];
    char v46 = v45;
    if (v45) {
      int v47 = *(unsigned __int8 *)[v45 bytes] << 24;
    }
    else {
      int v47 = -16777216;
    }
    uint64_t v49 = [NSNumber numberWithUnsignedInt:v47 | ReadU16BE((const DERItem *)&v66)];
    [a5 setObject:v49 forKeyedSubscript:@"SerialNumber"];
  }
  if (*((void *)&v67 + 1))
  {
    unint64_t v50 = [NSNumber numberWithInt:ReadS32BE((const DERItem *)&v67)];
    [a5 setObject:v50 forKeyedSubscript:@"PointsBalance"];
  }
  if (*((void *)&v68 + 1))
  {
    unint64_t v51 = [NSNumber numberWithInt:ReadS32BE((const DERItem *)&v68)];
    [a5 setObject:v51 forKeyedSubscript:@"PointsAmount"];
  }
  if (*((void *)&v69 + 1))
  {
    id v26 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v69];
    [a5 setObject:v26 forKeyedSubscript:@"TerminalIdentifier"];
LABEL_59:
  }
LABEL_11:

  return a5;
}

+ (void)RemoveMatchedTapIns:(id)a3 transactionsInProgress:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v35 = a4;
  if ([v5 count])
  {
    uint64_t v6 = 0;
    uint64_t v7 = -1;
    do
    {
      uint64_t v8 = [v5 objectAtIndexedSubscript:v6];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"StartStation"];
      id v10 = [v8 objectForKeyedSubscript:@"TypeDetail"];
      uint64_t v11 = [v8 objectForKeyedSubscript:@"Amount"];
      if (v11)
      {
        uint64_t v12 = [v8 objectForKeyedSubscript:@"Amount"];
        id v13 = [MEMORY[0x1E4F28C28] numberWithUnsignedInteger:0];
        int v14 = [v12 isEqual:v13];
      }
      else
      {
        int v14 = 1;
      }

      if (v14)
      {
        if (v9)
        {
          if (v10)
          {
            uint64_t v15 = [v8 objectForKeyedSubscript:@"EndStation"];

            if (!v15)
            {
              if (v6 < 1)
              {
                int v22 = 0;
              }
              else
              {
                uint64_t v16 = v7;
                while (1)
                {
                  uint64_t v17 = [v5 objectAtIndexedSubscript:v16];
                  uint64_t v18 = [v17 objectForKeyedSubscript:@"EndStation"];
                  uint64_t v19 = [v17 objectForKeyedSubscript:@"TypeDetail"];
                  id v20 = v19;
                  if (v18)
                  {
                    if (v19 && [v19 isEqual:v10]) {
                      break;
                    }
                  }

                  unint64_t v21 = v16-- + 1;
                  if (v21 <= 1)
                  {
                    int v22 = 0;
                    goto LABEL_29;
                  }
                }
                id v34 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v17];
                [v34 setObject:v8 forKeyedSubscript:@"MergedStartRecord"];
                uint64_t v32 = [v34 objectForKeyedSubscript:@"StartStation"];

                if (!v32) {
                  [v34 setObject:v9 forKeyedSubscript:@"StartStation"];
                }
                uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
                [v29 setObject:@"Merged" forKeyedSubscript:@"IgnoreReason"];
                uint64_t v33 = [v8 objectForKeyedSubscript:@"SerialNumber"];
                int v31 = [v17 objectForKeyedSubscript:@"SerialNumber"];
                log = ATLLogObject();
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  if (v33) {
                    int v23 = [v33 intValue];
                  }
                  else {
                    int v23 = -1;
                  }
                  if (v31)
                  {
                    int v28 = v23;
                    int v24 = [v31 intValue];
                    int v23 = v28;
                  }
                  else
                  {
                    int v24 = -1;
                  }
                  *(_DWORD *)long long buf = 67109888;
                  int v37 = v6;
                  __int16 v38 = 1024;
                  int v39 = v23;
                  __int16 v40 = 1024;
                  int v41 = v16;
                  __int16 v42 = 1024;
                  int v43 = v24;
                  _os_log_impl(&dword_1CA552000, log, OS_LOG_TYPE_DEFAULT, "Merged events %u (SN 0x%x) --> %u (SN 0x%x)", buf, 0x1Au);
                }

                [v5 setObject:v34 atIndexedSubscript:v16];
                [v5 setObject:v29 atIndexedSubscript:v6];

                int v22 = 1;
              }
LABEL_29:
              if (v35) {
                int v25 = [v35 containsObject:v10];
              }
              else {
                int v25 = 0;
              }
              id v26 = ATLLogObject();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 67109632;
                int v37 = v6;
                __int16 v38 = 1024;
                int v39 = v22;
                __int16 v40 = 1024;
                int v41 = v25;
                _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_DEFAULT, "Tap-In event %d merged %d enRouteEvent %d", buf, 0x14u);
              }

              if (((v22 | v25 ^ 1) & 1) == 0)
              {
                id v27 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
                [v27 setObject:@"EnRoute" forKeyedSubscript:@"IgnoreReason"];
                [v5 setObject:v27 atIndexedSubscript:v6];
              }
            }
          }
        }
      }

      ++v6;
      ++v7;
    }
    while (v6 < (unint64_t)[v5 count]);
  }
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Supported";
  v9[1] = @"DelayExpressReentry";
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = &unk_1F24E1DC8;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10, v9, 2, a6, a7];

  return v7;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Mercury decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"Mercury decoder doesn't expect processEndOfTransaction"];
  id v10 = (void *)v9;
  if (a7)
  {
    id v11 = *a7;
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v21[0] = *MEMORY[0x1E4F28568];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      int v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v22;
      uint64_t v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      int v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v24;
      uint64_t v16 = &v23;
      uint64_t v17 = 1;
    }
    uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

+ (BOOL)IsIncompatibleApplet:(unsigned int)a3 sw:(unsigned __int16)a4
{
  if ((a3 & 0xFFFFFBFF) == 0xA40000 && a4 == 27266) {
    return 1;
  }
  BOOL v6 = a3 == 11572480 && a4 == 27266;
  BOOL v8 = a3 != -2142240510 && a3 != 11568384 || a4 == 36864;
  BOOL result = 1;
  if (v8)
  {
    BOOL v10 = a3 == 8912896 && a4 != 36864;
    return v6 || v10;
  }
  return result;
}

+ (void)ApplyHackFor50863616:(id)a3 historyRecords:(id)a4 transceiver:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  *(_DWORD *)((char *)v61 + 3) = 17826304;
  v61[0] = 41984;
  char v60 = 40;
  int v59 = 10137600;
  id v58 = 0;
  BOOL v10 = [v9 transceiveBytesAndCheckSW:v61 length:7 error:&v58];
  id v11 = v58;
  uint64_t v12 = v11;
  if (!v10 || v11)
  {
    id v18 = v8;
    uint64_t v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v63 = v12;
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Failed to select ADF: %@", buf, 0xCu);
    }

    id v8 = v18;
    goto LABEL_20;
  }
  id v57 = 0;
  uint64_t v13 = [v9 transceiveBytesAndCheckSW:&v59 length:5 error:&v57];
  uint64_t v12 = v57;

  if (!v13 || v12)
  {
    id v20 = ATLLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v63 = v12;
      _os_log_impl(&dword_1CA552000, v20, OS_LOG_TYPE_ERROR, "Failed to read 0xA8: %@", buf, 0xCu);
    }

    goto LABEL_19;
  }
  if ([v13 length] != 40)
  {
    uint64_t v12 = ATLLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v21 = [v13 length];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v63) = v21;
      _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_ERROR, "Ignoring wrong length on A8 %u", buf, 8u);
    }
    goto LABEL_19;
  }
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = ATLLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = *(unsigned __int8 *)(v14 + 15);
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v63) = v16;
    _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_DEFAULT, "Station status byte is 0x%02X", buf, 8u);
  }

  if (*(unsigned char *)(v14 + 15) == 1)
  {
    uint64_t v17 = [v7 objectForKeyedSubscript:@"TransactionInProgress"];
    uint64_t v12 = [v17 mutableCopy];

    if (([v12 containsObject:@"TransitMetro"] & 1) == 0)
    {
      if (!v12)
      {
        uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      }
      [v12 addObject:@"TransitMetro"];
      [v7 setObject:v12 forKeyedSubscript:@"TransactionInProgress"];
    }
LABEL_19:
    BOOL v10 = v13;
    goto LABEL_20;
  }
  uint64_t v22 = DecodeBCD((char *)(v14 + 16), 0, 1);
  uint64_t v23 = DecodeBCD((char *)(v14 + 16), 1, 1);
  uint64_t v24 = DecodeBCD((char *)(v14 + 16), 2, 1);
  uint64_t v52 = DecodeBCD((char *)(v14 + 16), 3, 1);
  uint64_t v50 = DecodeBCD((char *)(v14 + 16), 4, 1);
  if (![v8 count]) {
    goto LABEL_21;
  }
  uint64_t v47 = v14;
  v48 = v13;
  id v49 = v7;
  uint64_t v25 = 0;
  unsigned int v26 = 0;
  uint64_t v27 = v22 + 2000;
  while (1)
  {
    uint64_t v12 = [v8 objectAtIndexedSubscript:v25];
    int v28 = [v12 objectForKeyedSubscript:@"TransactionTime"];
    uint64_t v29 = v28;
    if (v28)
    {
      if ([v28 year] == v27
        && [v29 month] == v23
        && [v29 day] == v24
        && [v29 hour] == v52
        && [v29 minute] == v50)
      {
        break;
      }
    }

    uint64_t v25 = ++v26;
    if ([v8 count] <= (unint64_t)v26)
    {
      uint64_t v13 = v48;
      id v7 = v49;
      goto LABEL_21;
    }
  }
  id v46 = v9;
  id v30 = [v12 mutableCopy];
  int v31 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v14 + 5 length:2];
  [v30 setObject:v31 forKeyedSubscript:@"StartStation"];

  uint64_t v32 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v47 + 21 length:2];
  [v30 setObject:v32 forKeyedSubscript:@"EndStation"];

  id v51 = v8;
  [v8 setObject:v30 atIndexedSubscript:v25];
  uint64_t v33 = ATLLogObject();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v63) = v26;
    _os_log_impl(&dword_1CA552000, v33, OS_LOG_TYPE_DEFAULT, "Modified record %u", buf, 8u);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v34 = v30;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v53 objects:v68 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v54 != v37) {
          objc_enumerationMutation(v34);
        }
        int v39 = *(NSObject **)(*((void *)&v53 + 1) + 8 * i);
        __int16 v40 = [v12 objectForKeyedSubscript:v39];
        int v41 = [v34 objectForKeyedSubscript:v39];
        char v42 = [v40 isEqual:v41];

        if ((v42 & 1) == 0)
        {
          int v43 = ATLLogObject();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v44 = [v12 objectForKeyedSubscript:v39];
            int v45 = [v34 objectForKeyedSubscript:v39];
            *(_DWORD *)long long buf = 138412802;
            long long v63 = v39;
            __int16 v64 = 2112;
            long long v65 = v44;
            __int16 v66 = 2112;
            unsigned long long v67 = v45;
            _os_log_impl(&dword_1CA552000, v43, OS_LOG_TYPE_DEFAULT, "%@ changed %@ -> %@", buf, 0x20u);
          }
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v53 objects:v68 count:16];
    }
    while (v36);
  }

  BOOL v10 = v48;
  id v7 = v49;
  id v8 = v51;
  id v9 = v46;
LABEL_20:

  uint64_t v13 = v10;
LABEL_21:
}

+ (BOOL)isSpecialBusErrorFor45299868:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v7 = a4;
  if ([a3 isEqualToString:@"9156000014020001"])
  {
    id v8 = [v7 objectForKeyedSubscript:@"TransactionInProgress"];
    char v9 = [v8 containsObject:@"TransitBus"];
    if (a5) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v9;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end