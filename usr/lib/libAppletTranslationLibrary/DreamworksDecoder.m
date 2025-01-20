@interface DreamworksDecoder
+ (id)getInstance;
- (DreamworksDecoder)init;
- (id)DecodeEndE1TLV:(id *)a3 error:(id *)a4;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withError:(id *)a4;
- (id)getHistory:(id)a3 state:(id)a4 error:(id *)a5;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getState:(id)a3;
- (id)parseEndEvent:(id)a3 withApplet:(id)a4 withError:(id *)a5;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)parseStartEvent:(id)a3 withApplet:(id)a4 withError:(id *)a5;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)resolveTransitModality:(unsigned __int16)a3;
- (void)adjustSN:(id)a3;
- (void)cleanup;
- (void)parseTransit:(id)a3 fileTrans:(id)a4 into:(id)a5;
@end

@implementation DreamworksDecoder

+ (id)getInstance
{
  if (getInstance_onceToken_4 != -1) {
    dispatch_once(&getInstance_onceToken_4, &__block_literal_global_10);
  }
  v2 = (void *)getInstance_inst_3;

  return v2;
}

uint64_t __32__DreamworksDecoder_getInstance__block_invoke()
{
  getInstance_inst_3 = objc_alloc_init(DreamworksDecoder);

  return MEMORY[0x1F41817F8]();
}

- (DreamworksDecoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)DreamworksDecoder;
  v2 = [(DreamworksDecoder *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->decoderState = 0;
    if (+[AppletTranslator isInternalBuild]())
    {
      v4 = +[AppletTranslator userDefaults]();
      v3->debug = [v4 BOOLForKey:@"debug.dreamworks"];
    }
    else
    {
      v3->debug = 0;
    }
  }
  return v3;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Supported";
  v9[1] = @"DelayExpressReentry";
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = &unk_1F24E24D0;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10, v9, 2, a6, a7];

  return v7;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v10 = a3;
  v11 = [MEMORY[0x1E4F1C9B8] dataWithHexString:a4];
  v12 = SelectByNameCmd(v11);

  v13 = [v10 transceiveAndCheckSW:v12 error:a7];
  if (v13)
  {
    v14 = +[DreamworksReaderContext readAllFiles:v10 debug:self->debug error:a7];
    if (v14)
    {
      v15 = [(DreamworksDecoder *)self getAppletStateAndHistory:v14 withError:a7];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)getAppletStateAndHistory:(id)a3 withError:(id *)a4
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(DreamworksDecoder *)self getState:v6];
  uint64_t v8 = [(DreamworksDecoder *)self getHistory:v6 state:v7 error:a4];
  v9 = (void *)v8;
  if (v8)
  {
    v12[0] = @"State";
    v12[1] = @"TransactionHistory";
    v13[0] = v7;
    v13[1] = v8;
    v12[2] = @"ATLInternal";
    v13[2] = v6;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)getState:(id)a3
{
  v30[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1C9D8];
  id v6 = [v4 filePurseInfo];
  uint64_t v7 = DecodeBCD((char *)[v6 bytes], 25, 2);
  id v8 = [v4 filePurseInfo];
  uint64_t v9 = DecodeBCD((char *)[v8 bytes], 27, 1);
  id v10 = [v4 filePurseInfo];
  v24 = [v5 dateWithYear:v7 month:v9 day:DecodeBCD((char *)[v10 bytes], 28, 1)];

  v11 = [v4 filePurseInfo];
  uint64_t v22 = [v11 subdataWithRange:8, 8];

  v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  v13 = [v4 fileTrans];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __30__DreamworksDecoder_getState___block_invoke;
  v25[3] = &unk_1E65AE510;
  v25[4] = self;
  v14 = [v13 firstWhere:v25];

  if (v14 && [v14 isIn]) {
    [v12 addObject:@"TransitMetro"];
  }
  v29[0] = @"Balances";
  v26[0] = @"BalanceCurrency";
  v26[1] = @"BalanceCurrencyExponent";
  v27[0] = @"KRW";
  v27[1] = &unk_1F24E24E8;
  v26[2] = @"Balance";
  v15 = (void *)MEMORY[0x1E4F28C28];
  v16 = [v4 balance:v22];
  v17 = [v15 decimalNumberWithMantissa:[v16 unsignedIntValue] exponent:0 isNegative:0];
  v26[3] = @"BalanceIdentifier";
  v27[2] = v17;
  v27[3] = @"PurseBalance";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v28 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v30[0] = v19;
  v30[1] = @"Taiji";
  v29[1] = @"SP";
  v29[2] = @"SPRaw";
  v30[2] = &unk_1F24E24E8;
  v30[3] = v24;
  v30[4] = v23;
  v29[3] = @"CardExpirationDate";
  v29[4] = @"CardIdentifier";
  v29[5] = @"TransactionInProgress";
  v30[5] = v12;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:6];

  return v20;
}

BOOL __30__DreamworksDecoder_getState___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) resolveTransitModality:[a2 vehicleType]];
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 == @"TransitMetro";

  return v3;
}

- (id)getHistory:(id)a3 state:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v7 = [v5 filePurse];
  id v8 = [v6 arrayWithCapacity:[v7 count]];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v30 = v5;
  id obj = [v5 filePurse];
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v34;
    *(void *)&long long v10 = 67109120;
    long long v29 = v10;
LABEL_3:
    uint64_t v13 = 0;
    while (2)
    {
      if (*(void *)v34 != v12) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
      v15 = [MEMORY[0x1E4F1CA60] dictionary:v29];
      int v16 = [v14 trt];
      int v17 = v16;
      BOOL v19 = (v16 == 64 || v16 == 2) && [v14 amount] != 0;
      v20 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:[v14 amount] exponent:0 isNegative:v19];
      [v15 setObject:v20 forKeyedSubscript:@"Amount"];

      v21 = [MEMORY[0x1E4F1C9B8] dataWithLongBE:[v14 idSam]];
      [v15 setObject:v21 forKeyedSubscript:@"TerminalIdentifier"];

      uint64_t v22 = [NSNumber numberWithUnsignedInt:[v14 seqnum]];
      [v15 setObject:v22 forKeyedSubscript:@"SerialNumber"];

      v23 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:[v14 balance] exponent:0 isNegative:0];
      [v15 setObject:v23 forKeyedSubscript:@"FinalBalance"];

      switch(v17)
      {
        case 1:
          [v15 setObject:@"Purchase" forKeyedSubscript:@"TypeDetail"];
          v24 = [v30 fileTrans];
          [(DreamworksDecoder *)self parseTransit:v14 fileTrans:v24 into:v15];

          goto LABEL_23;
        case 2:
          v25 = v15;
          v26 = @"TopUp";
          goto LABEL_22;
        case 3:
          v25 = v15;
          v26 = @"PurchaseRefundReturn";
          goto LABEL_22;
        case 4:
          v25 = v15;
          v26 = @"TopUpCancel";
          goto LABEL_22;
        default:
          if (v17 == 64)
          {
            v25 = v15;
            v26 = @"PurchaseRefund";
LABEL_22:
            [v25 setObject:v26 forKeyedSubscript:@"TypeDetail"];
          }
          else
          {
            v27 = ATLLogObject();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              int v38 = v17;
              _os_log_impl(&dword_1CA552000, v27, OS_LOG_TYPE_ERROR, "TRT not recognized (%d).", buf, 8u);
            }
          }
LABEL_23:
          [v8 addObject:v15];

          if (v11 != ++v13) {
            continue;
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
          if (!v11) {
            goto LABEL_25;
          }
          goto LABEL_3;
      }
    }
  }
LABEL_25:

  [(DreamworksDecoder *)self adjustSN:v8];

  return v8;
}

- (void)parseTransit:(id)a3 fileTrans:(id)a4 into:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__DreamworksDecoder_parseTransit_fileTrans_into___block_invoke;
  v20[3] = &unk_1E65AE510;
  id v10 = v8;
  id v21 = v10;
  uint64_t v11 = [a4 filter:v20];
  uint64_t v12 = [v11 count];
  if (v12)
  {
    if (v12 != 1)
    {
      uint64_t v13 = [v11 sortedArrayUsingComparator:&__block_literal_global_549];

      uint64_t v11 = (void *)v13;
    }
    v14 = [v11 lastObject];
    v15 = [v14 datetime];
    [v9 setObject:v15 forKeyedSubscript:@"TransactionTime"];

    int v16 = -[DreamworksDecoder resolveTransitModality:](self, "resolveTransitModality:", [v14 vehicleType]);
    [v9 setObject:v16 forKeyedSubscript:@"TypeDetail"];

    int v17 = [MEMORY[0x1E4F1C9B8] dataWithShortBE:[v14 vehicleType]];
    [v9 setObject:v17 forKeyedSubscript:@"TypeDetailRaw"];

    v18 = [v9 objectForKeyedSubscript:@"TypeDetail"];

    if (v18 == @"TransitMetro")
    {
      BOOL v19 = [[MEMORY[0x1E4F1C9B8] dataWithIntBE:[v14 stationCode]];
      [v9 setObject:v19 forKeyedSubscript:@"EndStation"];
    }
  }
}

BOOL __49__DreamworksDecoder_parseTransit_fileTrans_into___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 seqnum];
  return v3 == [*(id *)(a1 + 32) seqnum];
}

uint64_t __49__DreamworksDecoder_parseTransit_fileTrans_into___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v4 number];
  if (v6 <= [v5 number])
  {
    unsigned int v8 = [v4 number];
    if (v8 >= [v5 number]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)adjustSN:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = NSNumber;
        id v10 = [v8 objectForKeyedSubscript:@"SerialNumber"];
        uint64_t v11 = [v9 numberWithUnsignedInteger:[v10 unsignedIntegerValue] << 8];
        [v8 setObject:v11 forKeyedSubscript:@"SerialNumber"];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if ((unint64_t)[v11 length] > 1)
  {
    id v23 = v11;
    uint64_t v24 = *(unsigned __int8 *)[v23 bytes];
    if (v24 <= 4)
    {
      if (v24 == 1)
      {
        uint64_t v25 = [(DreamworksDecoder *)self parseStartEvent:v23 withApplet:v12 withError:a8];
        goto LABEL_21;
      }
      if (v24 == 2)
      {
        uint64_t v25 = [(DreamworksDecoder *)self parseEndEvent:v23 withApplet:v12 withError:a8];
LABEL_21:
        v28 = (void *)v25;
        goto LABEL_26;
      }
LABEL_29:
      v31 = ATLLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v40) = v24;
        _os_log_impl(&dword_1CA552000, v31, OS_LOG_TYPE_ERROR, "Unknown event type %u", buf, 8u);
      }

      uint64_t v32 = [[NSString alloc] initWithFormat:@"Unknown event type %u", v24];
      long long v15 = (void *)v32;
      if (!a8) {
        goto LABEL_19;
      }
      id v33 = *a8;
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v34 = *MEMORY[0x1E4F28A50];
        v35[0] = *MEMORY[0x1E4F28568];
        v35[1] = v34;
        v36[0] = v32;
        v36[1] = v33;
        BOOL v19 = (void *)MEMORY[0x1E4F1C9E8];
        v20 = v36;
        id v21 = v35;
        goto LABEL_7;
      }
      uint64_t v37 = *MEMORY[0x1E4F28568];
      uint64_t v38 = v32;
      BOOL v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = &v38;
      id v21 = &v37;
LABEL_17:
      uint64_t v22 = 1;
      goto LABEL_18;
    }
    if (v24 == 5)
    {
      v26 = ATLLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        long long v29 = [v23 asHexString];
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v29;
        _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_DEFAULT, "State change event, nothing to do here. %@", buf, 0xCu);
      }
    }
    else
    {
      if (v24 != 18) {
        goto LABEL_29;
      }
      v26 = ATLLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_INFO, "Deselect event, nothing to do here", buf, 2u);
      }
    }

    goto LABEL_25;
  }
  long long v13 = ATLLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v40) = [v11 length];
    _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
  }

  uint64_t v14 = [[NSString alloc] initWithFormat: @"Short eventData? %u", [v11 length]];
  long long v15 = (void *)v14;
  if (!a8) {
    goto LABEL_19;
  }
  id v16 = *a8;
  uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
  if (!*a8)
  {
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v44[0] = v14;
    BOOL v19 = (void *)MEMORY[0x1E4F1C9E8];
    v20 = v44;
    id v21 = &v43;
    goto LABEL_17;
  }
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v41[0] = *MEMORY[0x1E4F28568];
  v41[1] = v18;
  v42[0] = v14;
  v42[1] = v16;
  BOOL v19 = (void *)MEMORY[0x1E4F1C9E8];
  v20 = v42;
  id v21 = v41;
LABEL_7:
  uint64_t v22 = 2;
LABEL_18:
  v27 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
  *a8 = [v17 errorWithDomain:@"ATL" code:6 userInfo:v27];

LABEL_19:
LABEL_25:
  v28 = 0;
LABEL_26:

  return v28;
}

- (id)parseStartEvent:(id)a3 withApplet:(id)a4 withError:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] != 5)
  {
    id v16 = ATLLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v45 = [v8 length];
      __int16 v46 = 2048;
      uint64_t v47 = 5;
      _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_ERROR, "Start event length %u expected %lu", buf, 0x12u);
    }

    uint64_t v17 = [NSString initWithFormat:@"Start event length %u expected %lu", objc_msgSend(v8, "length"), 5];
    uint64_t v14 = v17;
    if (!a5) {
      goto LABEL_29;
    }
    id v18 = *a5;
    BOOL v19 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v20 = *MEMORY[0x1E4F28A50];
      v40[0] = *MEMORY[0x1E4F28568];
      v40[1] = v20;
      v41[0] = v17;
      v41[1] = v18;
      id v21 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v22 = v41;
      id v23 = v40;
LABEL_17:
      uint64_t v29 = 2;
LABEL_27:
      uint64_t v32 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v29];
      *a5 = [v19 errorWithDomain:@"ATL" code:6 userInfo:v32];

      goto LABEL_28;
    }
    uint64_t v42 = *MEMORY[0x1E4F28568];
    uint64_t v43 = v17;
    id v21 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v22 = &v43;
    id v23 = &v42;
LABEL_26:
    uint64_t v29 = 1;
    goto LABEL_27;
  }
  uint64_t v10 = [v8 bytes];
  uint64_t v11 = v10;
  if (*(unsigned char *)(v10 + 1) != 8)
  {
    uint64_t v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = *(unsigned __int8 *)(v11 + 1);
      *(_DWORD *)buf = 67109120;
      int v45 = v25;
      _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Start event got unexpected version 0x%x", buf, 8u);
    }

    uint64_t v26 = [[NSString alloc] initWithFormat:@"Start event got unexpected version 0x%x", *(unsigned __int8 *)(v11 + 1)];
    uint64_t v14 = v26;
    if (!a5) {
      goto LABEL_29;
    }
    id v27 = *a5;
    BOOL v19 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v28 = *MEMORY[0x1E4F28A50];
      v36[0] = *MEMORY[0x1E4F28568];
      v36[1] = v28;
      v37[0] = v26;
      v37[1] = v27;
      id v21 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v22 = v37;
      id v23 = v36;
      goto LABEL_17;
    }
    uint64_t v38 = *MEMORY[0x1E4F28568];
    uint64_t v39 = v26;
    id v21 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v22 = &v39;
    id v23 = &v38;
    goto LABEL_26;
  }
  if (!*(unsigned char *)(v10 + 2))
  {
    uint64_t v14 = ATLLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v15 = "Dropping Start event over contact";
      goto LABEL_21;
    }
LABEL_28:
    a5 = 0;
    goto LABEL_29;
  }
  unint64_t decoderState = self->decoderState;
  long long v13 = ATLLogObject();
  uint64_t v14 = v13;
  if (decoderState == 1)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v15 = "Dropping Start event because already started";
LABEL_21:
      _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_INFO, "Got CL Start Event, setting state to Active", buf, 2u);
  }

  self->unint64_t decoderState = 1;
  +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, self);
  v34[0] = @"EventType";
  v34[1] = @"appletIdentifier";
  v35[0] = @"StartEvent";
  v35[1] = v9;
  v34[2] = @"Version";
  uint64_t v14 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v11 + 1)];
  void v35[2] = v14;
  v34[3] = @"Interface";
  v30 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v11 + 2)];
  v35[3] = v30;
  v34[4] = @"selectStatus";
  v31 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v11 + 3)) >> 16];
  v34[5] = @"IgnoreRFEvents";
  v34[6] = @"DontWaitForEOT";
  v35[4] = v31;
  v35[5] = MEMORY[0x1E4F1CC38];
  v35[6] = MEMORY[0x1E4F1CC38];
  v35[7] = MEMORY[0x1E4F1CC28];
  v34[7] = @"RequiresPowerCycle";
  v34[8] = @"DelayExpressReentry";
  v35[8] = &unk_1F24E24D0;
  a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:9];

LABEL_29:

  return a5;
}

- (id)parseEndEvent:(id)a3 withApplet:(id)a4 withError:(id *)a5
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)[v8 length] <= 8)
  {
    uint64_t v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v8 length];
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_ERROR, "End event length %zu", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v11 = [[NSString alloc] initWithFormat:@"End event length %zu", [v8 length]];
    id v12 = (void *)v11;
    if (!a5) {
      goto LABEL_36;
    }
    id v13 = *a5;
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v15 = *MEMORY[0x1E4F28A50];
      v62[0] = *MEMORY[0x1E4F28568];
      v62[1] = v15;
      v63[0] = v11;
      v63[1] = v13;
      id v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = v63;
      id v18 = v62;
      uint64_t v19 = 2;
    }
    else
    {
      uint64_t v64 = *MEMORY[0x1E4F28568];
      v65[0] = v11;
      id v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = v65;
      id v18 = &v64;
      uint64_t v19 = 1;
    }
    long long v36 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
    uint64_t v37 = v14;
    uint64_t v38 = 3;
LABEL_35:
    *a5 = [v37 errorWithDomain:@"ATL" code:v38 userInfo:v36];

LABEL_36:
    int v45 = 0;
    goto LABEL_39;
  }
  id v20 = v8;
  uint64_t v21 = [v20 bytes];
  uint64_t v22 = v21;
  if (*(unsigned char *)(v21 + 1) != 8)
  {
    uint64_t v26 = ATLLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = *(unsigned __int8 *)(v22 + 1);
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v27;
      _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_ERROR, "End event got unexpected version 0x%x", (uint8_t *)&buf, 8u);
    }

    uint64_t v28 = [[NSString alloc] initWithFormat:@"End event got unexpected version 0x%x", *(unsigned __int8 *)(v22 + 1)];
    id v12 = (void *)v28;
    if (!a5) {
      goto LABEL_36;
    }
    id v29 = *a5;
    v30 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v58[0] = *MEMORY[0x1E4F28568];
      v58[1] = v31;
      v59[0] = v28;
      v59[1] = v29;
      uint64_t v32 = (void *)MEMORY[0x1E4F1C9E8];
      id v33 = v59;
      uint64_t v34 = v58;
      uint64_t v35 = 2;
    }
    else
    {
      uint64_t v60 = *MEMORY[0x1E4F28568];
      uint64_t v61 = v28;
      uint64_t v32 = (void *)MEMORY[0x1E4F1C9E8];
      id v33 = &v61;
      uint64_t v34 = &v60;
      uint64_t v35 = 1;
    }
    long long v36 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:v35];
    uint64_t v37 = v30;
    uint64_t v38 = 6;
    goto LABEL_35;
  }
  if (*(unsigned char *)(v21 + 2) == 1)
  {
    unint64_t decoderState = self->decoderState;
    uint64_t v24 = ATLLogObject();
    int v25 = v24;
    if (decoderState == 1)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1CA552000, v25, OS_LOG_TYPE_DEFAULT, "Got CL End Event, setting state to Idle", (uint8_t *)&buf, 2u);
      }

      self->unint64_t decoderState = 0;
      +[AppletTranslator deregisterForCleanup:]((uint64_t)AppletTranslator, self);
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1CA552000, v25, OS_LOG_TYPE_ERROR, "End event in IDLE state?!", (uint8_t *)&buf, 2u);
      }
    }
  }
  unsigned int v39 = *(_DWORD *)(v22 + 5);
  unsigned int v40 = *(unsigned __int16 *)(v22 + 3);
  if (v40 == 144 || (v40 == 33642 ? (BOOL v41 = (*(_DWORD *)(v22 + 5) & 0xFF00) == 45568) : (BOOL v41 = 0), v41))
  {
    uint64_t v43 = 0;
    uint64_t v42 = 64;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v43 = 1;
  }
  id v12 = [v20 subdataWithRange:9, [v20 length] - 9];
  *(void *)&long long buf = [v12 bytes];
  *((void *)&buf + 1) = [v12 length];
  v44 = [(DreamworksDecoder *)self DecodeEndE1TLV:&buf error:a5];
  if (v44 && !*a5)
  {
    v55[0] = @"EventType";
    v55[1] = @"appletIdentifier";
    v56[0] = @"EndEvent";
    v56[1] = v9;
    v55[2] = @"Version";
    v54 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v22 + 1)];
    v56[2] = v54;
    v55[3] = @"Interface";
    v53 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v22 + 2)];
    v56[3] = v53;
    v55[4] = @"didError";
    v52 = [NSNumber numberWithBool:v43];
    v56[4] = v52;
    v55[5] = @"command";
    __int16 v46 = [NSNumber numberWithUnsignedInt:bswap32(v39)];
    v56[5] = v46;
    v55[6] = @"status";
    uint64_t v47 = [NSNumber numberWithUnsignedShort:bswap32(v40) >> 16];
    v56[6] = v47;
    v55[7] = @"result";
    uint64_t v48 = [NSNumber numberWithUnsignedShort:v42];
    v56[7] = v48;
    v56[8] = &unk_1F24E24E8;
    v55[8] = @"informative";
    v55[9] = @"type";
    v56[9] = &unk_1F24E2500;
    v55[10] = @"ReadOperationInfo";
    v49 = [v44 objectForKeyedSubscript:v43];
    v56[10] = v49;
    v55[11] = @"WriteOperationInfo";
    v50 = [v44 objectForKeyedSubscript:v43];
    v56[11] = v50;
    int v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:12];
  }
  else
  {
    int v45 = 0;
  }

LABEL_39:

  return v45;
}

- (id)DecodeEndE1TLV:(id *)a3 error:(id *)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  uint64_t v49 = 0;
  v50[0] = 0;
  v50[1] = 0;
  uint64_t v6 = DERDecodeItemCtx((uint64_t)a3, (unint64_t *)&v49);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Failed to decode End Event E1 %d", buf, 8u);
    }

    uint64_t v9 = [[NSString alloc] initWithFormat:@"Failed to decode End Event E1 %d", v7];
    uint64_t v10 = (void *)v9;
    if (a4)
    {
      id v11 = *a4;
      id v12 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v13 = *MEMORY[0x1E4F28A50];
        v63[0] = *MEMORY[0x1E4F28568];
        v63[1] = v13;
        v64[0] = v9;
        v64[1] = v11;
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v15 = v64;
        id v16 = v63;
        uint64_t v17 = 2;
      }
      else
      {
        uint64_t v65 = *MEMORY[0x1E4F28568];
        v66[0] = v9;
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v15 = v66;
        id v16 = &v65;
        uint64_t v17 = 1;
      }
      BOOL v41 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
      *a4 = [v12 errorWithDomain:@"ATL" code:3 userInfo:v41];
    }
LABEL_27:
    a4 = 0;
    goto LABEL_28;
  }
  if (v49 != 0xE000000000000001)
  {
    v30 = ATLLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = v49;
      _os_log_impl(&dword_1CA552000, v30, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx", buf, 0xCu);
    }

    id v31 = [NSString alloc];
    uint64_t v48 = v49;
    uint64_t v32 = [v31 initWithFormat:@"Unexpected tag 0x%llx"];
    id v33 = (void *)v32;
    if (a4)
    {
      id v34 = *a4;
      uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v36 = *MEMORY[0x1E4F28A50];
        v59[0] = *MEMORY[0x1E4F28568];
        v59[1] = v36;
        v60[0] = v32;
        v60[1] = v34;
        uint64_t v37 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v38 = v60;
        unsigned int v39 = v59;
        uint64_t v40 = 2;
      }
      else
      {
        uint64_t v61 = *MEMORY[0x1E4F28568];
        uint64_t v62 = v32;
        uint64_t v37 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v38 = &v62;
        unsigned int v39 = &v61;
        uint64_t v40 = 1;
      }
      uint64_t v43 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:v40];
      *a4 = [v35 errorWithDomain:@"ATL" code:3 userInfo:v43];
    }
    LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[DreamworksDecoder DecodeEndE1TLV:error:]", 420, (uint64_t)a3->var0, a3->var1, @"E1 TLV data", v44, v45, v48);
    goto LABEL_27;
  }
  *(_OWORD *)long long buf = 0u;
  DERItem v58 = (DERItem)0;
  uint64_t v18 = DERParseSequenceSpec((uint64_t)v50, (uint64_t)&DreamworksEndEventE1ContentSpec, (char *)buf, 0x20uLL);
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = ATLLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v55 = 67109120;
      int v56 = v19;
      _os_log_impl(&dword_1CA552000, v20, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v55, 8u);
    }

    uint64_t v21 = [[NSString alloc] initWithFormat:@"Failed to decode E1 contents %d", v19];
    uint64_t v22 = (void *)v21;
    if (a4)
    {
      id v23 = *a4;
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v25 = *MEMORY[0x1E4F28A50];
        v51[0] = *MEMORY[0x1E4F28568];
        v51[1] = v25;
        v52[0] = v21;
        v52[1] = v23;
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
        int v27 = v52;
        uint64_t v28 = v51;
        uint64_t v29 = 2;
      }
      else
      {
        uint64_t v53 = *MEMORY[0x1E4F28568];
        uint64_t v54 = v21;
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
        int v27 = &v54;
        uint64_t v28 = &v53;
        uint64_t v29 = 1;
      }
      uint64_t v47 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:v29];
      *a4 = [v24 errorWithDomain:@"ATL" code:3 userInfo:v47];

      a4 = 0;
    }
  }
  else
  {
    a4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    if (!*(void *)&buf[8]) {
      goto LABEL_28;
    }
    uint64_t v42 = [NSNumber numberWithUnsignedInt:ReadS32BE((const DERItem *)buf)];
    [a4 setObject:v42 forKeyedSubscript:@"ReadOperationInfo"];

    uint64_t v22 = [NSNumber numberWithUnsignedInt:ReadS32BE(&v58)];
    [a4 setObject:v22 forKeyedSubscript:@"WriteOperationInfo"];
  }

LABEL_28:

  return a4;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Dreamworks decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"Dreamworks decoder doesn't expect processEndOfTransaction"];
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
      uint64_t v15 = v22;
      id v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v24;
      id v16 = &v23;
      uint64_t v17 = 1;
    }
    uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  id v10 = a3;
  id v11 = +[TransceiverWrapper withTransceiver:a8];
  id v12 = [MEMORY[0x1E4F1C9B8] dataWithHexString:v10];

  uint64_t v13 = SelectByNameCmd(v12);

  uint64_t v14 = [v11 transceiveAndCheckSW:v13 error:a9];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithIntBE:2163278080];
    id v16 = [MEMORY[0x1E4F1C9B8] dataWithIntBE:12582912];
    uint64_t v17 = [v11 transceiveAndGetAllData:v15 withGetMoreData:v16 withMoreDataSW:24832 withError:a9];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  return [(DreamworksDecoder *)self getServiceProviderData:a3 withPackage:a4 withModule:a5 withPublicKey:0 withEncryptionScheme:0 withTransceiver:a6 withError:a7];
}

- (id)resolveTransitModality:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AppletConfigurationData getDreamworksSettings];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"dreamworksMetroTypes"];

  uint64_t v6 = [NSNumber numberWithUnsignedShort:v3];
  char v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v8 = @"TransitMetro";
  }
  else
  {
    uint64_t v9 = +[AppletConfigurationData getDreamworksSettings];
    id v10 = [v9 objectForKeyedSubscript:@"dreamworksBusTypeRanges"];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      id v8 = @"TransitBus";
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v17 = [v16 objectAtIndexedSubscript:0];
          if ([v17 unsignedIntValue] <= v3)
          {
            uint64_t v18 = [v16 objectAtIndexedSubscript:1];
            unsigned int v19 = [v18 unsignedIntValue];

            if (v19 >= v3) {
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }
    id v8 = @"Transit";
LABEL_14:
  }
  return v8;
}

- (void)cleanup
{
  uint64_t v3 = ATLLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1CA552000, v3, OS_LOG_TYPE_INFO, "cleanup", v4, 2u);
  }

  self->unint64_t decoderState = 0;
}

@end