@interface WuluDecoder
+ (id)getInstance;
- (BOOL)isMetroEntry:(id)a3 cityCode:(id)a4 setting:(id)a5 error:(id *)a6;
- (WuluDecoder)init;
- (id)DecodeEndE1TLV:(id *)a3 error:(id *)a4;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)adjustHistory:(id)a3;
- (id)findNextCappPuchaseEntry:(id)a3 history:(id)a4;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withError:(id *)a4;
- (id)getHistory:(id)a3 state:(id)a4 error:(id *)a5;
- (id)getState:(id)a3;
- (id)getStationCode:(id)a3 codeSetting:(id)a4 swapByteOrdering:(id)a5 convertFormat:(id)a6 cityCode:(id)a7;
- (id)parseEndEvent:(id)a3 withApplet:(id)a4 withError:(id *)a5;
- (id)parseFile18:(id)a3;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)parseStartEvent:(id)a3 withApplet:(id)a4 withError:(id *)a5;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)resolveTransitModality:(unsigned __int8)a3;
- (id)setTimer:(id)a3 history:(id)a4;
- (unsigned)convertAppletSNtoWalletSN:(unsigned __int16)a3 txnTypeIdentifier:(unsigned int)a4;
- (unsigned)convertWalletSNtoAppletSN:(id)a3;
- (void)addFakeBusTxnGuangdong:(id)a3 history:(id)a4 cityCode:(id)a5;
- (void)adjustState:(id)a3 history:(id)a4 ctx:(id)a5;
- (void)cleanup;
- (void)parseTransit:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 state:(id)a7 into:(id)a8;
- (void)parseTransitApollo:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6;
- (void)parseTransitGalileo:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 state:(id)a7 into:(id)a8;
- (void)parseTransitKepler:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6;
- (void)parseTransitNoLocal:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6;
- (void)parseTransitPioneer:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6;
- (void)parseTransitSettingBased:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 into:(id)a7;
- (void)parseUnreliable1ECities:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 state:(id)a7 into:(id)a8;
- (void)removeDoubleMetroTapGuangdong:(id)a3 history:(id)a4 cityCode:(id)a5;
- (void)removeEnRouteForSingleTapBusGuangdong:(id)a3 transaction:(id)a4 cityCode:(id)a5;
- (void)removeUnreliable1EEntryFlag:(id)a3 ctx:(id)a4;
- (void)setGalileoJinshanMaglevNonlocal:(id)a3 ctx:(id)a4;
- (void)setMetroEntryWithLocalLog:(id)a3 ctx:(id)a4;
@end

@implementation WuluDecoder

+ (id)getInstance
{
  if (getInstance_onceToken != -1) {
    dispatch_once(&getInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)getInstance_inst;

  return v2;
}

uint64_t __26__WuluDecoder_getInstance__block_invoke()
{
  getInstance_inst = objc_alloc_init(WuluDecoder);

  return MEMORY[0x1F41817F8]();
}

- (WuluDecoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)WuluDecoder;
  v2 = [(WuluDecoder *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->decoderState = 0;
    if (+[AppletTranslator isInternalBuild]())
    {
      v4 = +[AppletTranslator userDefaults]();
      v3->debug = [v4 BOOLForKey:@"debug.wulu"];
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
  v10[1] = &unk_1F24E1AE0;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10, v9, 2, a6, a7];

  return v7;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F1C9B8] dataWithHexString:a4];
  v14 = SelectByNameCmd(v13);

  v15 = [v11 transceiveAndCheckSW:v14 error:a7];
  if (v15)
  {
    v16 = +[WuluReaderContext readAllFiles:v11 appletPID:v12 debug:self->debug error:a7];
    if (v16)
    {
      v17 = [(WuluDecoder *)self getAppletStateAndHistory:v16 withError:a7];
      v18 = v17;
      if (v17)
      {
        v19 = [v17 objectForKeyedSubscript:@"TransactionHistory"];
        id v20 = [(WuluDecoder *)self setTimer:v11 history:v19];
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)getAppletStateAndHistory:(id)a3 withError:(id *)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(WuluDecoder *)self getState:v6];
  uint64_t v8 = [(WuluDecoder *)self getHistory:v6 state:v7 error:a4];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(WuluDecoder *)self adjustHistory:v8];

    [(WuluDecoder *)self adjustState:v7 history:v10 ctx:v6];
    v13[0] = @"State";
    v13[1] = @"TransactionHistory";
    v14[0] = v7;
    v14[1] = v10;
    v13[2] = @"ATLInternal";
    v14[2] = v6;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)getState:(id)a3
{
  v43[9] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1C9D8];
  id v5 = [v3 file15];
  uint64_t v6 = DecodeBCD((char *)[v5 bytes], 24, 2);
  id v7 = [v3 file15];
  uint64_t v8 = DecodeBCD((char *)[v7 bytes], 26, 1);
  id v9 = [v3 file15];
  v41 = [v4 dateWithYear:v6 month:v8 day:DecodeBCD((char *)[v9 bytes], 27, 1)];

  v10 = NSNumber;
  id v11 = [v3 file17];
  id v12 = [v10 numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(objc_msgSend(v11, "bytes") + 6)) >> 16];

  v13 = [v3 file15];
  v14 = [v13 subdataWithRange:NSMakeRange(10, 10)];

  v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  v16 = [v3 file1A];
  v17 = [v16 firstWhere:&__block_literal_global_537];

  if (v17)
  {
    id v18 = [v17 data];
    if (*(unsigned char *)([v18 bytes] + 14) == 1)
    {

LABEL_5:
      [v15 addObject:@"TransitMetro"];
      goto LABEL_6;
    }
    id v19 = [v17 data];
    int v20 = *(unsigned __int8 *)([v19 bytes] + 14);

    if (v20 == 3) {
      goto LABEL_5;
    }
  }
LABEL_6:
  v21 = [v3 file1A];
  v22 = [v21 firstWhere:&__block_literal_global_539];

  if (v22
    && ([v22 data],
        id v23 = objc_claimAutoreleasedReturnValue(),
        int v24 = *(unsigned __int8 *)([v23 bytes] + 14),
        v23,
        v24 == 1))
  {
    [v15 addObject:@"TransitBus"];
  }
  else
  {
    v25 = [v3 file1E];
    v26 = [v25 firstWhere:&__block_literal_global_541];

    if (v26)
    {
      id v27 = [v26 data];
      if (*(unsigned char *)[v27 bytes] == 3)
      {
        v28 = [v26 data];
        int v29 = [v28 u8:9];

        if (v29 == 2) {
          [v15 addObject:@"TransitBus"];
        }
      }
      else
      {
      }
    }
  }
  v30 = [v3 file1A];
  v31 = [v30 firstWhere:&__block_literal_global_543];

  if (v31)
  {
    id v32 = [v31 data];
    int v33 = *(unsigned __int8 *)([v32 bytes] + 14);

    if (v33 == 1) {
      [v15 addObject:@"TransitTrain"];
    }
  }
  v34 = [v3 overdraft];
  int v35 = [v34 unsignedIntValue];

  v36 = (void *)MEMORY[0x1E4F28C28];
  if (v35) {
    [v3 overdraft];
  }
  else {
  v37 = [v3 balance];
  }
  v38 = [v36 decimalNumberWithMantissa:[v37 unsignedIntegerValue] exponent:4294967294 isNegative:v35 != 0];

  v42[0] = @"Balance";
  v42[1] = @"SP";
  v43[0] = v38;
  v43[1] = @"UNKNOWN";
  v42[2] = @"SPRaw";
  v42[3] = @"CardExpirationDate";
  v43[2] = v12;
  v43[3] = v41;
  v42[4] = @"CardIdentifier";
  v42[5] = @"CardCurrency";
  v43[4] = v14;
  v43[5] = @"CNY";
  v42[6] = @"CardCurrencyCode";
  v42[7] = @"CardCurrencyExponent";
  v43[6] = &unk_1F24E1AF8;
  v43[7] = &unk_1F24E1B10;
  v42[8] = @"TransactionInProgress";
  v43[8] = v15;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:9];

  return v39;
}

BOOL __24__WuluDecoder_getState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 number] == 1;
}

BOOL __24__WuluDecoder_getState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 number] == 2;
}

BOOL __24__WuluDecoder_getState___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 number] == 1;
}

BOOL __24__WuluDecoder_getState___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 number] == 14;
}

- (id)getHistory:(id)a3 state:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v34 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = [v7 file18];
  v10 = [v8 arrayWithCapacity:[v9 count]];

  id v11 = v7;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [v7 file18];
  uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v46;
    *(void *)&long long v13 = 67109120;
    long long v33 = v13;
    v37 = v10;
    id v38 = v7;
    uint64_t v36 = *(void *)v46;
    int v35 = self;
    do
    {
      uint64_t v16 = 0;
      uint64_t v39 = v14;
      do
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v45 + 1) + 8 * v16);
        id v18 = [v17 data:v33];
        id v19 = [(WuluDecoder *)self parseFile18:v18];

        if (v19)
        {
          int v20 = [v19 objectForKeyedSubscript:@"TypeDetailRaw"];
          if ([v20 unsignedIntegerValue] == 2)
          {
            [v19 setObject:@"TopUp" forKeyedSubscript:@"TypeDetail"];
          }
          else
          {
            id v21 = [v17 data];
            unsigned int v22 = bswap32(*(unsigned __int16 *)[v21 bytes]) >> 16;

            id v23 = [v11 file1E];
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __38__WuluDecoder_getHistory_state_error___block_invoke;
            v43[3] = &__block_descriptor_34_e20_B16__0__WuluRecord_8l;
            __int16 v44 = v22;
            int v24 = [v23 firstWhere:v43];

            [v11 file1A];
            v26 = v25 = v11;
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __38__WuluDecoder_getHistory_state_error___block_invoke_2;
            v41[3] = &__block_descriptor_34_e20_B16__0__WuluRecord_8l;
            __int16 v42 = v22;
            id v27 = [v26 firstWhere:v41];

            if (v24)
            {
              v28 = v25;
              self = v35;
              [(WuluDecoder *)v35 parseTransit:v17 file1E:v24 file1A:v27 ctx:v28 state:v34 into:v19];
            }
            else
            {
              int v29 = ATLLogObject();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA552000, v29, OS_LOG_TYPE_DEBUG, "No matching 0x1E entry found, parsing as basic", buf, 2u);
              }

              self = v35;
            }
            v30 = [v19 objectForKeyedSubscript:@"TypeDetail"];

            uint64_t v15 = v36;
            if (!v30)
            {
              v31 = ATLLogObject();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v33;
                unsigned int v50 = v22;
                _os_log_impl(&dword_1CA552000, v31, OS_LOG_TYPE_DEFAULT, "Transit details were incomplete for SN 0x%x", buf, 8u);
              }

              [v19 setObject:@"Purchase" forKeyedSubscript:@"TypeDetail"];
            }

            v10 = v37;
            id v11 = v38;
            uint64_t v14 = v39;
          }
          [v10 addObject:v19];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v14);
  }

  return v10;
}

BOOL __38__WuluDecoder_getHistory_state_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 associatedSerialNumber] == *(unsigned __int16 *)(a1 + 32);
}

BOOL __38__WuluDecoder_getHistory_state_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 associatedSerialNumber] == *(unsigned __int16 *)(a1 + 32);
}

- (id)parseFile18:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  id v7 = (void *)MEMORY[0x1E4F1C9D8];
  id v8 = v5;
  uint64_t v9 = DecodeBCD((const unsigned __int8 *)([v8 bytes] + 16), 2);
  id v10 = v8;
  uint64_t v11 = DecodeBCD((const unsigned __int8 *)([v10 bytes] + 18), 1);
  id v12 = v10;
  uint64_t v13 = DecodeBCD((const unsigned __int8 *)([v12 bytes] + 19), 1);
  id v14 = v12;
  uint64_t v15 = DecodeBCD((const unsigned __int8 *)([v14 bytes] + 20), 1);
  id v16 = v14;
  uint64_t v17 = DecodeBCD((const unsigned __int8 *)([v16 bytes] + 21), 1);
  id v18 = v16;
  id v19 = [v7 dateWithYear:v9 month:v11 day:v13 hour:v15 minute:v17 second:DecodeBCD((const unsigned __int8 *)(objc_msgSend(v18, "bytes") + 22), 1)];
  [v6 setObject:v19 forKeyedSubscript:@"TransactionTime"];

  id v20 = v18;
  uint64_t v21 = *(unsigned __int8 *)([v20 bytes] + 9);
  unsigned int v22 = [NSNumber numberWithUnsignedChar:v21];
  [v6 setObject:v22 forKeyedSubscript:@"TypeDetailRaw"];

  id v23 = v20;
  unsigned int v24 = *(_DWORD *)([v23 bytes] + 5);
  uint64_t v25 = bswap32(v24);
  BOOL v27 = v21 == 2 && v24 != 0;
  v28 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v25 exponent:4294967294 isNegative:v27];
  [v6 setObject:v28 forKeyedSubscript:@"Amount"];

  int v29 = [v23 subdataWithRange:10, 6];
  [v6 setObject:v29 forKeyedSubscript:@"TerminalIdentifier"];

  v30 = NSNumber;
  id v31 = v23;
  id v32 = (unsigned __int16 *)[v31 bytes];

  long long v33 = [[v30 numberWithUnsignedInt:-[WuluDecoder convertAppletSNtoWalletSN:txnTypeIdentifier:](self, "convertAppletSNtoWalletSN:txnTypeIdentifier:", bswap32(*v32) >> 16, v21)];
  [v6 setObject:v33 forKeyedSubscript:@"SerialNumber"];

  return v6;
}

- (void)parseTransit:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 state:(id)a7 into:(id)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v14 = a4;
  id v15 = a5;
  id v44 = a6;
  id v43 = a7;
  id v16 = a8;
  uint64_t v17 = [v14 data];
  id v18 = [v17 subdataWithOffset:32 length:2];

  id v19 = [NSNumber numberWithUnsignedShort:[v18 u16BE:0]];
  [v16 setObject:v19 forKeyedSubscript:@"CityCode"];

  id v20 = [v14 data];
  uint64_t v21 = bswap32(*(_DWORD *)([v20 bytes] + 21));

  unsigned int v22 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v21 exponent:4294967294 isNegative:0];
  [v16 setObject:v22 forKeyedSubscript:@"FinalBalance"];

  id v23 = [v14 data];
  uint64_t v24 = [v23 u8:9];

  uint64_t v25 = [(WuluDecoder *)self resolveTransitModality:v24];
  [v16 setObject:v25 forKeyedSubscript:@"TypeDetail"];

  id v26 = [v14 data];
  int v27 = *(unsigned __int8 *)[v26 bytes];

  if (v27 == 3) {
    [v16 setObject:@"EnRoute" forKeyedSubscript:@"IgnoreReason"];
  }
  v28 = NSNumber;
  int v29 = [v16 objectForKeyedSubscript:@"TypeDetailRaw"];
  v30 = [v28 numberWithInt:[v29 intValue] | (v27 << 8)];
  [v16 setObject:v30 forKeyedSubscript:@"TypeDetailRaw"];

  id v31 = +[AppletConfigurationData getWuluSettings];
  id v32 = [v31 objectForKeyedSubscript:@"cityRules"];
  long long v33 = [v18 asHexString];
  id v34 = [v32 objectForKeyedSubscript:v33];

  if (v34)
  {
    int v35 = [v34 unsignedIntValue];
    switch(v35)
    {
      case 1:
        uint64_t v36 = v45;
        [(WuluDecoder *)self parseTransitKepler:v45 file1E:v14 file1A:v15 into:v16];
        goto LABEL_10;
      case 2:
        uint64_t v36 = v45;
        [(WuluDecoder *)self parseTransitApollo:v45 file1E:v14 file1A:v15 into:v16];
        goto LABEL_10;
      case 3:
        uint64_t v36 = v45;
        [(WuluDecoder *)self parseTransitPioneer:v45 file1E:v14 file1A:v15 into:v16];
        goto LABEL_10;
      case 4:
        v37 = v44;
        uint64_t v36 = v45;
        __int16 v42 = v43;
        [(WuluDecoder *)self parseTransitGalileo:v45 file1E:v14 file1A:v15 ctx:v44 state:v43 into:v16];
        goto LABEL_12;
      case 5:
      case 7:
        v37 = v44;
        uint64_t v36 = v45;
        [(WuluDecoder *)self parseTransitSettingBased:v45 file1E:v14 file1A:v15 ctx:v44 into:v16];
        goto LABEL_11;
      case 6:
        uint64_t v36 = v45;
        [(WuluDecoder *)self parseTransitNoLocal:v45 file1E:v14 file1A:v15 into:v16];
        goto LABEL_10;
      default:
        if (v35 == 99)
        {
          v37 = v44;
          uint64_t v36 = v45;
          __int16 v42 = v43;
          [(WuluDecoder *)self parseUnreliable1ECities:v45 file1E:v14 file1A:v15 ctx:v44 state:v43 into:v16];
          goto LABEL_12;
        }
        id v38 = ATLLogObject();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          goto LABEL_9;
        }
        *(_DWORD *)buf = 138412290;
        long long v47 = v34;
        uint64_t v39 = "Configuration gave us unknown rule type %@";
        v40 = v38;
        os_log_type_t v41 = OS_LOG_TYPE_ERROR;
        break;
    }
  }
  else
  {
    id v38 = ATLLogObject();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    long long v47 = v18;
    uint64_t v39 = "Configuration does not define city rules for city code %@";
    v40 = v38;
    os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_1CA552000, v40, v41, v39, buf, 0xCu);
LABEL_9:

  uint64_t v36 = v45;
LABEL_10:
  v37 = v44;
LABEL_11:
  __int16 v42 = v43;
LABEL_12:
}

- (void)parseTransitApollo:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v8 data];
  int v12 = [v11 u8:9];

  id v13 = [v8 data];
  int v14 = *(unsigned __int8 *)[v13 bytes];

  if (v12 == 2)
  {
    id v15 = [v8 data];
    id v16 = v15;
    uint64_t v17 = 10;
    uint64_t v18 = 2;
LABEL_3:
    id v19 = [v15 subdataWithOffset:v17 length:v18];
    id v20 = @"StartStation";
LABEL_4:
    [v10 setObject:v19 forKeyedSubscript:v20];

LABEL_5:
    goto LABEL_6;
  }
  if (v9 && v12 == 1)
  {
    if ([v9 number] == 1)
    {
      id v21 = [v9 data];
      int v22 = *(unsigned __int8 *)([v21 bytes] + 14);

      BOOL v24 = v14 == 8 && v22 == 2;
      if (v14 == 6 && v22 == 1)
      {
        [v10 setObject:@"EnRoute" forKeyedSubscript:@"IgnoreReason"];
LABEL_23:
        id v15 = [v9 data];
        id v16 = v15;
        uint64_t v17 = 38;
        uint64_t v18 = 5;
        goto LABEL_3;
      }
      if (v14 == 3) {
        goto LABEL_23;
      }
      if (v14 == 4) {
        BOOL v24 = 1;
      }
      if (v24)
      {
        v28 = [v9 data];
        int v29 = [v28 subdataWithOffset:38 length:5];
        [v10 setObject:v29 forKeyedSubscript:@"StartStation"];

        id v16 = [v9 data];
        id v19 = [v16 subdataWithOffset:46 length:5];
        id v20 = @"EndStation";
        goto LABEL_4;
      }
      if (v14 == 8)
      {
        v30 = [v9 data];
        int v31 = [v30 u8:99];

        if (v31)
        {
          [v10 setObject:@"TransitMetroUpgrade" forKeyedSubscript:@"TypeDetail"];
          [v10 removeObjectForKey:@"IgnoreReason"];
        }
        goto LABEL_6;
      }
      id v16 = ATLLogObject();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      int v32 = 67109632;
      int v33 = [v9 associatedSerialNumber];
      __int16 v34 = 1024;
      int v35 = v14;
      __int16 v36 = 1024;
      int v37 = 1;
      uint64_t v25 = "SN 0x%x with type %d but modality %d";
      id v26 = v16;
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      id v16 = ATLLogObject();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      int v32 = 67109632;
      int v33 = [v9 associatedSerialNumber];
      __int16 v34 = 1024;
      int v35 = 1;
      __int16 v36 = 1024;
      int v37 = [v9 number];
      uint64_t v25 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
      id v26 = v16;
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1CA552000, v26, v27, v25, (uint8_t *)&v32, 0x14u);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)parseTransitKepler:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a6;
  id v10 = a4;
  uint64_t v11 = [v10 data];
  int v12 = [v11 u8:9];

  id v13 = [v10 data];

  id v14 = v13;
  int v15 = *(unsigned __int8 *)[v14 bytes];

  if (v8 && v12 == 1)
  {
    if ([v8 number] == 1)
    {
      id v16 = [v8 data];
      int v17 = *(unsigned __int8 *)([v16 bytes] + 14);

      BOOL v18 = v15 == 8;
      if (v17 != 4) {
        BOOL v18 = 0;
      }
      if (v15 == 8 && v17 == 3)
      {
        [v9 setObject:@"EnRoute" forKeyedSubscript:@"IgnoreReason"];
LABEL_14:
        id v23 = [v8 data];
        BOOL v24 = [v23 subdataWithOffset:85 length:1];
        uint64_t v25 = (void *)[v24 mutableCopy];

        id v26 = [v8 data];
        os_log_type_t v27 = [v26 subdataWithOffset:35 length:8];
        [v25 appendData:v27];

        [v9 setObject:v25 forKeyedSubscript:@"StartStation"];
        goto LABEL_15;
      }
      if (v15 == 3) {
        goto LABEL_14;
      }
      if (v15 == 4) {
        BOOL v18 = 1;
      }
      if (v18)
      {
        v28 = [v8 data];
        int v29 = [v28 subdataWithOffset:85 length:1];
        v30 = (void *)[v29 mutableCopy];

        int v31 = [v8 data];
        int v32 = [v31 subdataWithOffset:35 length:8];
        [v30 appendData:v32];

        [v9 setObject:v30 forKeyedSubscript:@"StartStation"];
        int v33 = [v8 data];
        __int16 v34 = [v33 subdataWithOffset:86 length:1];
        int v35 = (void *)[v34 mutableCopy];

        __int16 v36 = [v8 data];
        int v37 = [v36 subdataWithOffset:43 length:8];
        [v35 appendData:v37];

        [v9 setObject:v35 forKeyedSubscript:@"EndStation"];
        goto LABEL_15;
      }
      id v19 = ATLLogObject();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v38 = 67109632;
      int v39 = [v8 associatedSerialNumber];
      __int16 v40 = 1024;
      int v41 = v15;
      __int16 v42 = 1024;
      int v43 = 1;
      id v20 = "SN 0x%x with type %d but modality %d";
      id v21 = v19;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      id v19 = ATLLogObject();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        goto LABEL_15;
      }
      int v38 = 67109632;
      int v39 = [v8 associatedSerialNumber];
      __int16 v40 = 1024;
      int v41 = 1;
      __int16 v42 = 1024;
      int v43 = [v8 number];
      id v20 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
      id v21 = v19;
      os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1CA552000, v21, v22, v20, (uint8_t *)&v38, 0x14u);
    goto LABEL_12;
  }
LABEL_15:
}

- (void)parseTransitPioneer:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a6;
  id v10 = a4;
  uint64_t v11 = [v10 data];
  int v12 = [v11 u8:9];

  id v13 = [v10 data];

  id v14 = v13;
  int v15 = *(unsigned __int8 *)[v14 bytes];

  if (!v8 || v12 != 14 && v12 != 1) {
    goto LABEL_25;
  }
  if ([v8 number] != 1 && objc_msgSend(v8, "number") != 14)
  {
    uint64_t v25 = ATLLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v39 = 67109632;
      int v40 = [v8 associatedSerialNumber];
      __int16 v41 = 1024;
      int v42 = v12;
      __int16 v43 = 1024;
      int v44 = [v8 number];
      id v26 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
      os_log_type_t v27 = v25;
      os_log_type_t v28 = OS_LOG_TYPE_ERROR;
LABEL_23:
      _os_log_impl(&dword_1CA552000, v27, v28, v26, (uint8_t *)&v39, 0x14u);
    }
LABEL_24:

    goto LABEL_25;
  }
  id v16 = [v8 data];
  int v17 = *(unsigned __int8 *)([v16 bytes] + 14);

  BOOL v18 = v15 == 8;
  if (v17 != 4) {
    BOOL v18 = 0;
  }
  if (v15 != 8 || v17 != 3)
  {
    if (v15 == 3) {
      goto LABEL_12;
    }
    if (v15 == 4) {
      BOOL v18 = 1;
    }
    if (v18)
    {
      int v29 = [v8 data];
      v30 = [v29 subdataWithOffset:85 length:1];
      int v31 = (void *)[v30 mutableCopy];

      int v32 = [v8 data];
      int v33 = [v32 subdataWithOffset:35 length:8];
      [v31 appendData:v33];

      [v9 setObject:v31 forKeyedSubscript:@"StartStation"];
      __int16 v34 = [v8 data];
      int v35 = [v34 subdataWithOffset:86 length:1];
      __int16 v36 = (void *)[v35 mutableCopy];

      int v37 = [v8 data];
      int v38 = [v37 subdataWithOffset:43 length:8];
      [v36 appendData:v38];

      [v9 setObject:v36 forKeyedSubscript:@"EndStation"];
      goto LABEL_25;
    }
    uint64_t v25 = ATLLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 67109632;
      int v40 = [v8 associatedSerialNumber];
      __int16 v41 = 1024;
      int v42 = v15;
      __int16 v43 = 1024;
      int v44 = v12;
      id v26 = "SN 0x%x with type %d but modality %d";
      os_log_type_t v27 = v25;
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  [v9 setObject:@"EnRoute" forKeyedSubscript:@"IgnoreReason"];
LABEL_12:
  id v19 = [v8 data];
  id v20 = [v19 subdataWithOffset:85 length:1];
  id v21 = (void *)[v20 mutableCopy];

  os_log_type_t v22 = [v8 data];
  id v23 = [v22 subdataWithOffset:35 length:8];
  [v21 appendData:v23];

  [v9 setObject:v21 forKeyedSubscript:@"StartStation"];
  BOOL v24 = [v8 data];
  LODWORD(v23) = [v24 u8:100];

  if (v23 == 11)
  {
    [v9 setObject:@"TransitMetroUpgrade" forKeyedSubscript:@"TypeDetail"];
    [v9 removeObjectForKey:@"IgnoreReason"];
  }

LABEL_25:
}

- (void)parseTransitGalileo:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 state:(id)a7 into:(id)a8
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a4;
  id v19 = [v16 objectForKeyedSubscript:@"SPRaw"];
  id v20 = [v18 data];
  int v21 = [v20 u8:9];

  os_log_type_t v22 = [v18 data];

  id v23 = v22;
  int v24 = *(unsigned __int8 *)[v23 bytes];

  if (v21 == 1)
  {
    uint64_t v25 = [v17 objectForKeyedSubscript:@"CityCode"];
    char v26 = [v19 isEqualToNumber:v25];

    if (v26)
    {
      if ([v15 localRecordFormat] == 1)
      {
        id v27 = [v13 data];
        unsigned int v28 = bswap32(*(unsigned __int16 *)[v27 bytes]) >> 16;

        int v29 = [v15 localRecords];
        v99[0] = MEMORY[0x1E4F143A8];
        v99[1] = 3221225472;
        v99[2] = __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke;
        v99[3] = &__block_descriptor_34_e20_B16__0__WuluRecord_8l;
        __int16 v100 = v28;
        v30 = [v29 firstWhere:v99];

        int v31 = [v15 localRecords];
        v97[0] = MEMORY[0x1E4F143A8];
        v97[1] = 3221225472;
        v97[2] = __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke_2;
        v97[3] = &unk_1E65ADEA0;
        id v32 = v30;
        id v98 = v32;
        uint64_t v33 = [v31 firstWhere:v97];

        __int16 v34 = [v15 localRecords];
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke_3;
        v95[3] = &unk_1E65ADEA0;
        int v35 = v32;
        v96 = v35;
        uint64_t v36 = [v34 firstWhere:v95];

        if (!v35 || !(v33 | v36))
        {
          int v37 = ATLLogObject();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA552000, v37, OS_LOG_TYPE_ERROR, "Missing mandatory records.", buf, 2u);
          }

          goto LABEL_70;
        }
        int v52 = [v35 sfi];
        v91 = (void *)v36;
        if (v52 == 20)
        {
          [v17 setObject:@"TransitTrain" forKeyedSubscript:@"TypeDetail"];
        }
        else
        {
          if (v52 == 19)
          {
            v53 = @"TransitTrainMaglev";
          }
          else
          {
            if (v52 != 17)
            {
              v77 = ATLLogObject();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              {
                int v78 = [v35 sfi];
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v102 = v78;
                _os_log_impl(&dword_1CA552000, v77, OS_LOG_TYPE_ERROR, "Metro in 1E but local SFI %d not in the list.", buf, 8u);
              }

              goto LABEL_62;
            }
            v53 = @"TransitMetro";
          }
          [v17 setObject:v53 forKeyedSubscript:@"TypeDetail"];
        }
LABEL_62:
        v94 = (void *)v33;
        v79 = [(id)v33 data];
        v80 = [v79 subdataWithOffset:6 length:2];
        uint64_t v81 = [v80 copy];

        v89 = (void *)v81;
        [v17 setObject:v81 forKeyedSubscript:@"StartStation"];
        v82 = NSNumber;
        v83 = [v35 data];
        v84 = [v82 numberWithUnsignedChar:[v83 u8:0]];
        LODWORD(v81) = [&unk_1F24E2560 containsObject:v84];

        if (v81)
        {
          [v17 setObject:@"EnRoute" forKeyedSubscript:@"IgnoreReason"];
          v86 = v89;
          v85 = v91;
        }
        else
        {
          v87 = [v91 data];
          v88 = [v87 subdataWithOffset:6 length:2];
          v86 = (void *)[v88 copy];

          v85 = v91;
          [v17 setObject:v86 forKeyedSubscript:@"EndStation"];
        }

        goto LABEL_70;
      }
      int v35 = ATLLogObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v48 = "Galileo Metro: The local file format is not extended format with associated SN.";
        v49 = v35;
        os_log_type_t v50 = OS_LOG_TYPE_ERROR;
        uint32_t v51 = 2;
LABEL_30:
        _os_log_impl(&dword_1CA552000, v49, v50, v48, buf, v51);
        goto LABEL_70;
      }
      goto LABEL_70;
    }
    if (!v14)
    {
      int v35 = ATLLogObject();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v102 = [v13 number];
        uint64_t v48 = "No 1A associated with this metro transaction, an old transaction, pass. %d";
        v49 = v35;
        os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
        uint32_t v51 = 8;
        goto LABEL_30;
      }
LABEL_70:

      goto LABEL_71;
    }
    int v38 = [v14 number];
    if (v38 != 1)
    {
      if (v38 != 2)
      {
        int v35 = ATLLogObject();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v102 = [v14 associatedSerialNumber];
          *(_WORD *)&v102[4] = 1024;
          *(_DWORD *)&v102[6] = 1;
          __int16 v103 = 1024;
          int v104 = [v14 number];
          uint64_t v48 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
          v49 = v35;
          os_log_type_t v50 = OS_LOG_TYPE_ERROR;
          uint32_t v51 = 20;
          goto LABEL_30;
        }
        goto LABEL_70;
      }
      int v39 = [v16 objectForKeyedSubscript:@"TransactionInProgress"];
      [v39 removeObject:@"TransitBus"];

      int v40 = [v14 data];
      __int16 v41 = [v40 subdataWithOffset:26 length:1];
      int v42 = [v41 u8:0];

      __int16 v43 = @"TransitMetro";
      if (v42 == 34) {
        __int16 v43 = @"TransitTrain";
      }
      if (v42 == 144) {
        int v44 = @"TransitTrainMaglev";
      }
      else {
        int v44 = v43;
      }
      [v17 setObject:v44 forKeyedSubscript:@"TypeDetail"];
      uint64_t v25 = ATLLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = [v14 data];
        long long v46 = [v45 subdataWithOffset:26 length:1];
        *(_DWORD *)buf = 138412290;
        *(void *)v102 = v46;
        _os_log_impl(&dword_1CA552000, v25, OS_LOG_TYPE_DEFAULT, "1A-02 associated with this metro transaction, special type. %@", buf, 0xCu);
      }
    }
    if (v24 == 8 || v24 == 3)
    {
      uint64_t v25 = [v14 data];
      if (*(unsigned char *)([v25 bytes] + 14) == 1)
      {
        int v47 = 1;
      }
      else
      {
        id v54 = [v14 data];
        BOOL v55 = *(unsigned __int8 *)([v54 bytes] + 14) == 3;

        int v47 = v55;
      }
    }
    else
    {
      int v47 = 0;
    }
    switch(v24)
    {
      case 8:
        goto LABEL_40;
      case 4:
        goto LABEL_41;
      case 3:
LABEL_40:

        if (v24 == 8)
        {
LABEL_41:
          uint64_t v25 = [v14 data];
          if (*(unsigned char *)([v25 bytes] + 14) == 2)
          {
            BOOL v56 = 1;
          }
          else
          {
            [v14 data];
            int v92 = v47;
            id v57 = objc_claimAutoreleasedReturnValue();
            BOOL v56 = *(unsigned __int8 *)([v57 bytes] + 14) == 4;

            int v47 = v92;
          }
          goto LABEL_45;
        }
        break;
    }
    BOOL v56 = 0;
LABEL_45:
    if (v24 == 8 || v24 == 4) {

    }
    if (v47)
    {
      v58 = [v14 data];
      v59 = [v58 subdataWithOffset:26 length:1];
      int v35 = [v59 mutableCopy];

      v60 = [v14 data];
      v61 = [v60 subdataWithOffset:42 length:1];
      [v35 appendData:v61];

      [v17 setObject:v35 forKeyedSubscript:@"StartStation"];
      v62 = @"EnRoute";
      v63 = @"IgnoreReason";
      v64 = v17;
    }
    else
    {
      if (!v56)
      {
        int v35 = ATLLogObject();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          int v93 = [v14 associatedSerialNumber];
          id v74 = [v14 data];
          int v75 = *(unsigned __int8 *)([v74 bytes] + 14);
          if (v75 == 1)
          {
            BOOL v76 = 1;
          }
          else
          {
            id v90 = [v14 data];
            BOOL v76 = *(unsigned __int8 *)([v90 bytes] + 14) == 3;
          }
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v102 = v93;
          *(_WORD *)&v102[4] = 1024;
          *(_DWORD *)&v102[6] = v24;
          __int16 v103 = 1024;
          int v104 = v76;
          _os_log_impl(&dword_1CA552000, v35, OS_LOG_TYPE_ERROR, "Galileo Metro: SN 0x%x with type %d, 1A entry type %d", buf, 0x14u);
          if (v75 != 1) {
        }
          }
        goto LABEL_70;
      }
      v65 = [v14 data];
      v66 = [v65 subdataWithOffset:26 length:1];
      v67 = (void *)[v66 mutableCopy];

      v68 = [v14 data];
      v69 = [v68 subdataWithOffset:42 length:1];
      [v67 appendData:v69];

      [v17 setObject:v67 forKeyedSubscript:@"StartStation"];
      v70 = [v14 data];
      v71 = [v70 subdataWithOffset:34 length:1];
      int v35 = [v71 mutableCopy];

      v72 = [v14 data];
      v73 = [v72 subdataWithOffset:50 length:1];
      [v35 appendData:v73];

      v63 = @"EndStation";
      v64 = v17;
      v62 = (__CFString *)v35;
    }
    [v64 setObject:v62 forKeyedSubscript:v63];
    goto LABEL_70;
  }
LABEL_71:
}

BOOL __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 associatedSerialNumber] == *(unsigned __int16 *)(a1 + 32)) {
    BOOL v4 = [v3 number] == 3 || [v3 number] == 6;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 number] == 1 || objc_msgSend(v3, "number") == 4)
  {
    int v4 = [v3 sfi];
    BOOL v5 = v4 == [*(id *)(a1 + 32) sfi];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __64__WuluDecoder_parseTransitGalileo_file1E_file1A_ctx_state_into___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 number] == 2 || objc_msgSend(v3, "number") == 5)
  {
    int v4 = [v3 sfi];
    BOOL v5 = v4 == [*(id *)(a1 + 32) sfi];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)parseTransitSettingBased:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 into:(id)a7
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v13 data];
  int v18 = [v17 u8:9];

  id v19 = [v13 data];
  int v20 = *(unsigned __int8 *)[v19 bytes];

  if (v18 == 1)
  {
    if (v14)
    {
      if ([v14 number] == 1)
      {
        v94 = v16;
        id v97 = v12;
        int v21 = [v13 data];
        os_log_type_t v22 = [v21 subdataWithOffset:32 length:2];

        id v23 = +[AppletConfigurationData getWuluSettings];
        int v24 = [v23 objectForKeyedSubscript:@"defaultLogSettings"];
        uint64_t v25 = [v22 asHexString];
        char v26 = [v24 objectForKeyedSubscript:v25];

        id v27 = (void *)MEMORY[0x1E4F1C9B8];
        v96 = v26;
        unsigned int v28 = [v26 objectForKeyedSubscript:@"metroEntryStationCode"];
        uint64_t v29 = [v27 dataWithHexString:v28];

        id v90 = self;
        int v92 = (void *)v29;
        v30 = [(WuluDecoder *)self getStationCode:v14 codeSetting:v29 swapByteOrdering:@"00" convertFormat:@"00" cityCode:v22];
        id v31 = [v14 data];
        if (*(unsigned char *)([v31 bytes] + 14) == 1)
        {

          id v16 = v94;
LABEL_20:
          id v46 = v30;
          if (v30)
          {
            [v16 setObject:v30 forKeyedSubscript:@"StartStation"];
            id v12 = v97;
          }
          else
          {
            BOOL v55 = ATLLogObject();
            id v12 = v97;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA552000, v55, OS_LOG_TYPE_ERROR, "Failed to get start station code", buf, 2u);
            }
          }
          BOOL v56 = [v16 objectForKeyedSubscript:@"Amount"];
          int v57 = [v56 intValue];

          if (!v57) {
            [v16 setObject:@"EnRoute" forKeyedSubscript:@"IgnoreReason"];
          }
          __int16 v43 = v92;
          goto LABEL_64;
        }
        id v53 = [v14 data];
        int v54 = *(unsigned __int8 *)([v53 bytes] + 14);

        id v16 = v94;
        if (v54 == 3) {
          goto LABEL_20;
        }
        id v58 = [v14 data];
        if (*(unsigned char *)([v58 bytes] + 14) == 2)
        {
        }
        else
        {
          id v59 = [v14 data];
          int v60 = *(unsigned __int8 *)([v59 bytes] + 14);

          if (v60 != 4)
          {
            BOOL v76 = ATLLogObject();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v101 = [v14 associatedSerialNumber];
              *(_WORD *)&v101[4] = 1024;
              *(_DWORD *)&v101[6] = v20;
              __int16 v102 = 1024;
              int v103 = 1;
              _os_log_impl(&dword_1CA552000, v76, OS_LOG_TYPE_DEFAULT, "SN 0x%x with type %d but modality %d", buf, 0x14u);
            }

            __int16 v43 = v92;
            id v12 = v97;
            id v46 = v30;
            goto LABEL_64;
          }
        }
        if (v30)
        {
          [v94 setObject:v30 forKeyedSubscript:@"StartStation"];
        }
        else
        {
          v72 = ATLLogObject();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA552000, v72, OS_LOG_TYPE_ERROR, "Failed to get start station code", buf, 2u);
          }
        }
        id v12 = v97;
        v73 = (void *)MEMORY[0x1E4F1C9B8];
        id v74 = [v96 objectForKeyedSubscript:@"metroExitStationCode"];
        __int16 v43 = [v73 dataWithHexString:v74];

        id v46 = [(WuluDecoder *)v90 getStationCode:v14 codeSetting:v43 swapByteOrdering:@"00" convertFormat:@"00" cityCode:v22];

        if (v46)
        {
          [v94 setObject:v46 forKeyedSubscript:@"EndStation"];
        }
        else
        {
          int v75 = ATLLogObject();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA552000, v75, OS_LOG_TYPE_ERROR, "Failed to get end station code", buf, 2u);
          }

          id v46 = 0;
        }
LABEL_64:

        goto LABEL_65;
      }
      os_log_type_t v22 = ATLLogObject();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_65:

        goto LABEL_66;
      }
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v101 = [v14 associatedSerialNumber];
      *(_WORD *)&v101[4] = 1024;
      *(_DWORD *)&v101[6] = 1;
      __int16 v102 = 1024;
      int v103 = [v14 number];
      uint64_t v48 = "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d";
      v49 = v22;
      os_log_type_t v50 = OS_LOG_TYPE_ERROR;
      uint32_t v51 = 20;
LABEL_16:
      _os_log_impl(&dword_1CA552000, v49, v50, v48, buf, v51);
      goto LABEL_65;
    }
    id v32 = [v15 localRecords];
    uint64_t v33 = [v32 count];

    if (v33 != 3)
    {
      os_log_type_t v22 = ATLLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v52 = [v15 localRecords];
        *(_DWORD *)buf = 134217984;
        *(void *)v101 = [v52 count];
        _os_log_impl(&dword_1CA552000, v22, OS_LOG_TYPE_DEFAULT, "Only %lu records retrived, expecting 3.", buf, 0xCu);
      }
      goto LABEL_65;
    }
    __int16 v34 = [v15 localRecords];
    os_log_type_t v22 = [v34 firstObject];

    if (!v22)
    {
      os_log_type_t v22 = ATLLogObject();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_65;
      }
      *(_WORD *)buf = 0;
      uint64_t v48 = "No local log retrived.";
      v49 = v22;
      os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
      uint32_t v51 = 2;
      goto LABEL_16;
    }
    if ([v15 localRecordFormat] == 1)
    {
      id v35 = [v12 data];
      unsigned int v36 = bswap32(*(unsigned __int16 *)[v35 bytes]);

      if ([v22 associatedSerialNumber] != HIWORD(v36))
      {
        v71 = ATLLogObject();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA552000, v71, OS_LOG_TYPE_DEFAULT, "Local log is not updated in the latest transaction.", buf, 2u);
        }

        goto LABEL_65;
      }
    }
    id v98 = v12;
    int v37 = [v15 file17];
    [v37 subdataWithRange:NSMakeRange(6, 2)];
    int v38 = v95 = v15;

    int v39 = +[AppletConfigurationData getWuluSettings];
    int v40 = [v39 objectForKeyedSubscript:@"localLogSettings"];
    __int16 v41 = [v38 asHexString];
    uint64_t v42 = [v40 objectForKeyedSubscript:v41];

    __int16 v43 = (void *)v42;
    int v44 = v38;
    id v15 = v95;

    id v99 = 0;
    v96 = v44;
    BOOL v45 = [(WuluDecoder *)self isMetroEntry:v95 cityCode:v44 setting:v43 error:&v99];
    id v46 = v99;
    if (v46)
    {
      int v47 = ATLLogObject();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v101 = v96;
        _os_log_impl(&dword_1CA552000, v47, OS_LOG_TYPE_ERROR, "Entry information is not obtained correctly for city %@.", buf, 0xCu);
      }
      id v12 = v98;
      goto LABEL_63;
    }
    BOOL v88 = v45;
    uint64_t v61 = [v43 objectForKeyedSubscript:@"stationCodeSwapByteOrdering"];
    uint64_t v62 = [v43 objectForKeyedSubscript:@"stationCodeConvertFormat"];
    v63 = (void *)MEMORY[0x1E4F1C9B8];
    v89 = v43;
    v64 = [v43 objectForKeyedSubscript:@"metroEntryStationCode"];
    int v93 = [v63 dataWithHexString:v64];

    v65 = [v95 localRecords];
    v66 = [v65 objectAtIndexedSubscript:1];

    if (!v66)
    {
      v91 = (void *)v62;
      int v47 = v61;
      v77 = ATLLogObject();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v77, OS_LOG_TYPE_DEFAULT, "No local entry log retrived.", buf, 2u);
      }
      v66 = 0;
      v68 = v93;
      id v12 = v98;
      id v46 = 0;
      int v78 = v77;
      v67 = v91;
      goto LABEL_62;
    }
    v87 = v61;
    v86 = [(WuluDecoder *)self getStationCode:v66 codeSetting:v93 swapByteOrdering:v61 convertFormat:v62 cityCode:v96];
    [v16 setObject:forKeyedSubscript:];
    v67 = (void *)v62;
    if (v88)
    {
      v68 = v93;
      v69 = [v16 objectForKeyedSubscript:@"Amount"];
      int v70 = [v69 intValue];

      if (!v70) {
        [v16 setObject:@"EnRoute" forKeyedSubscript:@"IgnoreReason"];
      }
    }
    else
    {
      v79 = (void *)MEMORY[0x1E4F1C9B8];
      v80 = [v89 objectForKeyedSubscript:@"metroExitStationCode"];
      v68 = [v79 dataWithHexString:v80];

      uint64_t v81 = [v95 localRecords];
      uint64_t v82 = [v81 objectAtIndexedSubscript:2];

      if (v82)
      {
        v83 = self;
        int v47 = v87;
        uint64_t v84 = [(WuluDecoder *)v83 getStationCode:v82 codeSetting:v68 swapByteOrdering:v87 convertFormat:v67 cityCode:v96];

        [v16 setObject:v84 forKeyedSubscript:@"EndStation"];
        int v78 = (void *)v84;
        v66 = v82;
        id v12 = v98;
        id v46 = 0;
LABEL_62:

        os_log_type_t v22 = v66;
        __int16 v43 = v89;
LABEL_63:

        goto LABEL_64;
      }
      v85 = ATLLogObject();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v85, OS_LOG_TYPE_DEFAULT, "No local exit log retrived.", buf, 2u);
      }

      v66 = 0;
    }
    id v12 = v98;
    id v46 = 0;
    int v78 = v86;
    int v47 = v87;
    goto LABEL_62;
  }
LABEL_66:
}

- (void)parseTransitNoLocal:(id)a3 file1E:(id)a4 file1A:(id)a5 into:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [v9 data];
  int v13 = [v12 u8:9];

  id v14 = [v9 data];
  int v15 = *(unsigned __int8 *)[v14 bytes];

  if (v10 && v13 == 1)
  {
    if ([v10 number] != 1)
    {
      id v17 = ATLLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        int v50 = [v10 associatedSerialNumber];
        __int16 v51 = 1024;
        int v52 = 1;
        __int16 v53 = 1024;
        int v54 = [v10 number];
        _os_log_impl(&dword_1CA552000, v17, OS_LOG_TYPE_ERROR, "Inconsistency in SN 0x%x b/t modality %d in 0x1E and file 0x1A record %d", buf, 0x14u);
      }
      goto LABEL_19;
    }
    id v16 = [v9 data];
    id v17 = [v16 subdataWithOffset:32 length:2];

    int v18 = +[AppletConfigurationData getWuluSettings];
    id v19 = [v18 objectForKeyedSubscript:@"defaultLogSettings"];
    int v20 = [v17 asHexString];
    int v21 = [v19 objectForKeyedSubscript:v20];

    os_log_type_t v22 = (void *)MEMORY[0x1E4F1C9B8];
    id v23 = [v21 objectForKeyedSubscript:@"metroEntryStationCode"];
    uint64_t v24 = [v22 dataWithHexString:v23];

    uint64_t v48 = (void *)v24;
    uint64_t v25 = [(WuluDecoder *)self getStationCode:v10 codeSetting:v24 swapByteOrdering:@"00" convertFormat:@"00" cityCode:v17];
    id v26 = [v10 data];
    if (*(unsigned char *)([v26 bytes] + 14) == 1)
    {
    }
    else
    {
      int v47 = self;
      id v27 = [v10 data];
      unsigned int v28 = v21;
      int v29 = *(unsigned __int8 *)([v27 bytes] + 14);

      BOOL v30 = v29 == 3;
      int v21 = v28;
      if (!v30)
      {
        id v35 = [v10 data];
        if (*(unsigned char *)([v35 bytes] + 14) == 2)
        {

          unint64_t v36 = 0x1E4F1C000;
        }
        else
        {
          id v37 = [v10 data];
          int v38 = *(unsigned __int8 *)([v37 bytes] + 14);

          BOOL v30 = v38 == 4;
          int v21 = v28;
          unint64_t v36 = 0x1E4F1C000uLL;
          if (!v30)
          {
            BOOL v45 = ATLLogObject();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              int v50 = [v10 associatedSerialNumber];
              __int16 v51 = 1024;
              int v52 = v15;
              __int16 v53 = 1024;
              int v54 = 1;
              _os_log_impl(&dword_1CA552000, v45, OS_LOG_TYPE_DEFAULT, "SN 0x%x with type %d but modality %d", buf, 0x14u);
            }

            goto LABEL_17;
          }
        }
        if (v25)
        {
          [v11 setObject:v25 forKeyedSubscript:@"StartStation"];
          int v39 = v48;
        }
        else
        {
          int v40 = ATLLogObject();
          int v39 = v48;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_ERROR, "Failed to get start station code", buf, 2u);
          }
        }
        __int16 v41 = *(void **)(v36 + 2488);
        uint64_t v42 = [v21 objectForKeyedSubscript:@"metroExitStationCode"];
        __int16 v34 = [v41 dataWithHexString:v42];

        uint64_t v43 = [(WuluDecoder *)v47 getStationCode:v10 codeSetting:v34 swapByteOrdering:@"00" convertFormat:@"00" cityCode:v17];

        if (v43)
        {
          [v11 setObject:v43 forKeyedSubscript:@"EndStation"];
          uint64_t v25 = (void *)v43;
        }
        else
        {
          int v44 = ATLLogObject();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA552000, v44, OS_LOG_TYPE_ERROR, "Failed to get end station code", buf, 2u);
          }

          uint64_t v25 = 0;
        }
        goto LABEL_18;
      }
    }
    if (v25)
    {
      [v11 setObject:v25 forKeyedSubscript:@"StartStation"];
    }
    else
    {
      id v31 = ATLLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v31, OS_LOG_TYPE_ERROR, "Failed to get start station code", buf, 2u);
      }
    }
    id v32 = [v11 objectForKeyedSubscript:@"Amount"];
    int v33 = [v32 intValue];

    if (!v33) {
      [v11 setObject:@"EnRoute" forKeyedSubscript:@"IgnoreReason"];
    }
LABEL_17:
    __int16 v34 = v48;
LABEL_18:

LABEL_19:
  }
}

- (void)parseUnreliable1ECities:(id)a3 file1E:(id)a4 file1A:(id)a5 ctx:(id)a6 state:(id)a7 into:(id)a8
{
  id v8 = a8;
  [v8 setObject:@"Purchase" forKeyedSubscript:@"TypeDetail"];
  [v8 removeObjectForKey:@"IgnoreReason"];
}

- (id)getStationCode:(id)a3 codeSetting:(id)a4 swapByteOrdering:(id)a5 convertFormat:(id)a6 cityCode:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unsigned int v16 = [v12 u8:0];
  unsigned int v17 = [v12 u8:1];
  int v18 = [v11 data];
  unint64_t v19 = [v18 length];

  if (v19 >= v17 + (unint64_t)v16)
  {
    os_log_type_t v22 = [v11 data];
    int v21 = [v22 subdataWithRange:v16, v17];

    if ([v13 isEqualToString:@"01"])
    {
      id v23 = (void *)MEMORY[0x1E4F1C9B8];
      id v24 = v21;
      int v21 = [v23 dataWithReversedBytes:[v24 bytes] length:v17];
    }
    if ([v14 isEqualToString:@"01"])
    {
      id v41 = v13;
      id v25 = v15;
      MEMORY[0x1F4188790]();
      id v27 = (char *)&v40 - v26;
      if (v17)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          int v29 = [v21 encodeBCDAtOffset:i length:1];
          v27[i] = [v29 unsignedCharValue];
        }
      }
LABEL_18:
      uint64_t v34 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v27 length:v17];

      int v21 = (void *)v34;
      id v15 = v25;
      id v13 = v41;
      goto LABEL_22;
    }
    if ([v14 isEqualToString:@"03"])
    {
      BOOL v30 = [v21 encodeBCD];
    }
    else
    {
      if ([v14 isEqualToString:@"02"])
      {
        id v41 = v13;
        id v25 = v15;
        MEMORY[0x1F4188790]();
        id v27 = (char *)&v40 - v31;
        if (v17)
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            int v33 = [v21 decodeBCDAtOffset:j length:1];
            v27[j] = [v33 unsignedCharValue];
          }
        }
        goto LABEL_18;
      }
      if (![v14 isEqualToString:@"04"]) {
        goto LABEL_22;
      }
      BOOL v30 = [v21 decodeBCD];
    }
    id v35 = v30;
    uint64_t v36 = [v30 unsignedLongValue];

    id v37 = [MEMORY[0x1E4F1C9B8] dataWithLongBE:v36];
    uint64_t v38 = [v37 subdataWithOffset:8 - v17 length:v17];

    int v21 = (void *)v38;
    goto LABEL_22;
  }
  int v20 = ATLLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v15;
    _os_log_impl(&dword_1CA552000, v20, OS_LOG_TYPE_ERROR, "City %@ local log's station code offset too big.", buf, 0xCu);
  }

  int v21 = 0;
LABEL_22:

  return v21;
}

- (void)adjustState:(id)a3 history:(id)a4 ctx:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = [v8 objectAtIndexedSubscript:0];
    id v11 = (void *)MEMORY[0x1E4F1C9B8];
    id v12 = [v10 objectForKeyedSubscript:@"CityCode"];
    id v13 = [v11 dataWithShortBE:[v12 unsignedShortValue]];
    id v14 = [v13 asHexString];

    id v15 = +[AppletConfigurationData getWuluSettings];
    unsigned int v16 = [v15 objectForKeyedSubscript:@"cityRules"];
    unsigned int v17 = [v16 objectForKeyedSubscript:v14];

    [(WuluDecoder *)self removeEnRouteForSingleTapBusGuangdong:v18 transaction:v10 cityCode:v17];
  }
  [(WuluDecoder *)self removeUnreliable1EEntryFlag:v18 ctx:v9];
  [(WuluDecoder *)self setMetroEntryWithLocalLog:v18 ctx:v9];
  [(WuluDecoder *)self setGalileoJinshanMaglevNonlocal:v18 ctx:v9];
}

- (void)removeEnRouteForSingleTapBusGuangdong:(id)a3 transaction:(id)a4 cityCode:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    if ([v8 unsignedIntValue] == 1)
    {
      id v10 = [v7 objectForKeyedSubscript:@"TypeDetail"];

      if (v10 == @"TransitBus")
      {
        id v11 = [v7 objectForKeyedSubscript:@"IgnoreReason"];

        if (!v11)
        {
          id v12 = [v13 objectForKeyedSubscript:@"TransactionInProgress"];
          [v12 removeObject:@"TransitBus"];
        }
      }
    }
  }
}

- (void)setMetroEntryWithLocalLog:(id)a3 ctx:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"TransactionInProgress"];
  if (([v8 containsObject:@"TransitMetro"] & 1) == 0)
  {
    id v9 = [v6 objectForKeyedSubscript:@"SPRaw"];
    id v10 = [MEMORY[0x1E4F1C9B8] dataWithShortBE:[v9 unsignedShortValue]];
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithHexString:@"2900"];
    int v12 = [v10 isEqualToData:v11];

    if (v12)
    {
      id v13 = [v7 localRecords];
      id v14 = [v13 filter:&__block_literal_global_583];

      if (v14 && [v14 count])
      {
        BOOL v30 = v10;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (!v16) {
          goto LABEL_19;
        }
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        while (1)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v15);
            }
            int v20 = [*(id *)(*((void *)&v32 + 1) + 8 * i) sfi];
            switch(v20)
            {
              case 17:
                int v21 = @"TransitMetro";
                break;
              case 20:
                int v21 = @"TransitTrain";
                break;
              case 19:
                int v21 = @"TransitTrainMaglev";
                break;
              default:
                continue;
            }
            [v8 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v38 count:16];
          if (!v17)
          {
LABEL_19:

            id v10 = v30;
            goto LABEL_28;
          }
        }
      }
    }
    else
    {
      os_log_type_t v22 = v9;
      id v23 = +[AppletConfigurationData getWuluSettings];
      id v24 = [v23 objectForKeyedSubscript:@"localLogSettings"];
      id v25 = [v10 asHexString];
      uint64_t v26 = [v24 objectForKeyedSubscript:v25];

      id v31 = 0;
      BOOL v27 = [(WuluDecoder *)self isMetroEntry:v7 cityCode:v10 setting:v26 error:&v31];
      id v28 = v31;
      if (v28)
      {
        int v29 = ATLLogObject();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v10;
          _os_log_impl(&dword_1CA552000, v29, OS_LOG_TYPE_ERROR, "Entry information is not obtained correctly for city %@.", buf, 0xCu);
        }

        id v9 = v22;
      }
      else
      {
        id v9 = v22;
        if (v27) {
          [v8 addObject:@"TransitMetro"];
        }
      }
    }
LABEL_28:
  }
}

uint64_t __45__WuluDecoder_setMetroEntryWithLocalLog_ctx___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 number] == 3 || objc_msgSend(v2, "number") == 6)
  {
    id v3 = NSNumber;
    int v4 = [v2 data];
    BOOL v5 = [v3 numberWithUnsignedChar:[v4 u8:0]];
    uint64_t v6 = [&unk_1F24E2578 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setGalileoJinshanMaglevNonlocal:(id)a3 ctx:(id)a4
{
  id v21 = a3;
  BOOL v5 = [a4 file1A];
  uint64_t v6 = [v5 firstWhere:&__block_literal_global_588];

  id v7 = [v6 data];
  id v8 = [v7 subdataWithOffset:15 length:2];
  id v9 = [v8 asHexString];
  int v10 = [v9 isEqualToString:@"2900"];

  if (v10)
  {
    id v11 = [v6 data];
    if (*(unsigned char *)([v11 bytes] + 14) == 1)
    {

LABEL_5:
      id v14 = [v21 objectForKeyedSubscript:@"TransactionInProgress"];
      [v14 removeObject:@"TransitBus"];

      id v15 = [v6 data];
      uint64_t v16 = [v15 subdataWithOffset:26 length:1];
      int v17 = [v16 u8:0];

      if (v17 == 34)
      {
        uint64_t v18 = [v21 objectForKeyedSubscript:@"TransactionInProgress"];
        unint64_t v19 = v18;
        int v20 = @"TransitTrain";
      }
      else
      {
        uint64_t v18 = [v21 objectForKeyedSubscript:@"TransactionInProgress"];
        if (v17 == 144)
        {
          unint64_t v19 = v18;
          int v20 = @"TransitTrainMaglev";
        }
        else
        {
          unint64_t v19 = v18;
          int v20 = @"TransitMetro";
        }
      }
      [v18 addObject:v20];

      goto LABEL_11;
    }
    id v12 = [v6 data];
    int v13 = *(unsigned __int8 *)([v12 bytes] + 14);

    if (v13 == 3) {
      goto LABEL_5;
    }
  }
LABEL_11:
}

BOOL __51__WuluDecoder_setGalileoJinshanMaglevNonlocal_ctx___block_invoke(uint64_t a1, void *a2)
{
  return [a2 number] == 2;
}

- (void)removeUnreliable1EEntryFlag:(id)a3 ctx:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 file1E];
  uint64_t v40 = [v7 firstWhere:&__block_literal_global_590];

  uint64_t v39 = v5;
  uint64_t v42 = [v5 objectForKeyedSubscript:@"TransactionInProgress"];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithArray:];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v44 = *(void *)v50;
    id v41 = v8;
    do
    {
      uint64_t v11 = 0;
      uint64_t v43 = v10;
      do
      {
        if (*(void *)v50 != v44) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
        if ([v12 isEqualToString:@"TransitMetro"])
        {
          int v13 = 1;
        }
        else
        {
          if (([v12 isEqualToString:@"TransitBus"] & 1) == 0)
          {
            id v15 = ATLLogObject();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              int v54 = v12;
              _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_DEFAULT, "Unreliable city only has bus and metro, skip processing for type %@.", buf, 0xCu);
            }
            goto LABEL_35;
          }
          int v13 = 2;
        }
        id v14 = [v6 file1A];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke_592;
        v47[3] = &__block_descriptor_36_e20_B16__0__WuluRecord_8l;
        int v48 = v13;
        id v15 = [v14 firstWhere:v47];

        if (!v15) {
          goto LABEL_30;
        }
        id v16 = [v15 data];
        if (*(unsigned char *)([v16 bytes] + 14) != 1)
        {
          id v17 = [v15 data];
          if (*(unsigned char *)([v17 bytes] + 14) != 3)
          {
            id v35 = [v15 data];
            int v36 = *(unsigned __int8 *)([v35 bytes] + 14);

            if (v36 != 1)
            {
LABEL_30:
              if ([v12 isEqualToString:@"TransitMetro"]) {
                goto LABEL_35;
              }
              id v19 = v40;
              if (v19)
              {
LABEL_17:
                id v20 = v6;
                id v21 = [v19 data];
                os_log_type_t v22 = [v21 subdataWithOffset:32 length:2];

                id v23 = +[AppletConfigurationData getWuluSettings];
                id v24 = [v23 objectForKeyedSubscript:@"cityRules"];
                id v25 = [v22 asHexString];
                uint64_t v26 = [v24 objectForKeyedSubscript:v25];

                if ([v26 intValue] == 99)
                {
                  BOOL v27 = ATLLogObject();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    int v54 = v12;
                    __int16 v55 = 2112;
                    BOOL v56 = v22;
                    _os_log_impl(&dword_1CA552000, v27, OS_LOG_TYPE_DEFAULT, "%@ entry flag removed as city code %@ in unreliable 1E city list.", buf, 0x16u);
                  }

                  [v42 removeObject:v12];
                }

                id v6 = v20;
                id v8 = v41;
                uint64_t v10 = v43;
                goto LABEL_35;
              }
              goto LABEL_32;
            }
            goto LABEL_15;
          }
        }
LABEL_15:
        if ([v15 associatedSerialNumber])
        {
          uint64_t v18 = [v6 file1E];
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke_594;
          v45[3] = &unk_1E65ADEA0;
          id v46 = v15;
          id v19 = [v18 firstWhere:v45];

          if (v19) {
            goto LABEL_17;
          }
LABEL_32:
          id v37 = ATLLogObject();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            int v38 = [v15 associatedSerialNumber];
            *(_DWORD *)buf = 138412546;
            int v54 = v12;
            __int16 v55 = 1024;
            LODWORD(v56) = v38;
            _os_log_impl(&dword_1CA552000, v37, OS_LOG_TYPE_DEFAULT, "Associated 1E record for %@ with associated SN = %u cannot be found, remove the entry flag.", buf, 0x12u);
          }

          [v42 removeObject:v12];
          goto LABEL_35;
        }
        id v28 = [v15 data];
        int v29 = [v28 subdataWithOffset:15 length:2];

        BOOL v30 = +[AppletConfigurationData getWuluSettings];
        id v31 = [v30 objectForKeyedSubscript:@"cityRules"];
        long long v32 = [v29 asHexString];
        long long v33 = [v31 objectForKeyedSubscript:v32];

        if ([v33 intValue] == 99)
        {
          long long v34 = ATLLogObject();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            int v54 = v12;
            __int16 v55 = 2112;
            BOOL v56 = v29;
            _os_log_impl(&dword_1CA552000, v34, OS_LOG_TYPE_DEFAULT, "%@ entry flag removed as city code %@ in unreliable city list and 1A's associated SN is 0.", buf, 0x16u);
          }

          [v42 removeObject:v12];
        }

        uint64_t v10 = v43;
LABEL_35:

        ++v11;
      }
      while (v10 != v11);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v10);
  }
}

BOOL __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke(uint64_t a1, void *a2)
{
  return [a2 number] == 1;
}

BOOL __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke_592(uint64_t a1, void *a2)
{
  return *(_DWORD *)(a1 + 32) == [a2 number];
}

BOOL __47__WuluDecoder_removeUnreliable1EEntryFlag_ctx___block_invoke_594(uint64_t a1, void *a2)
{
  int v3 = [a2 associatedSerialNumber];
  return v3 == [*(id *)(a1 + 32) associatedSerialNumber];
}

- (id)adjustHistory:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1E4F1C9B8];
        id v12 = [v10 objectForKeyedSubscript:@"CityCode"];
        int v13 = [v11 dataWithShortBE:[v12 unsignedShortValue]];
        id v14 = [v13 asHexString];

        id v15 = +[AppletConfigurationData getWuluSettings];
        id v16 = [v15 objectForKeyedSubscript:@"cityRules"];
        id v17 = [v16 objectForKeyedSubscript:v14];

        [(WuluDecoder *)self removeDoubleMetroTapGuangdong:v10 history:v5 cityCode:v17];
        [(WuluDecoder *)self addFakeBusTxnGuangdong:v10 history:v5 cityCode:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void)removeDoubleMetroTapGuangdong:(id)a3 history:(id)a4 cityCode:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10 && [v10 unsignedIntValue] == 1)
  {
    id v12 = [v8 objectForKeyedSubscript:@"Amount"];
    if ([v12 intValue])
    {
    }
    else
    {
      int v13 = [v8 objectForKeyedSubscript:@"TypeDetail"];

      if (v13 == @"TransitMetro")
      {
        id v14 = [v8 objectForKeyedSubscript:@"TypeDetailRaw"];
        unsigned __int8 v15 = (unsigned __int16)[v14 intValue] >> 8;

        id v16 = [(WuluDecoder *)self findNextCappPuchaseEntry:v8 history:v9];
        id v17 = v16;
        if (v16)
        {
          uint64_t v18 = [v16 objectForKeyedSubscript:@"TypeDetailRaw"];
          __int16 v19 = [v18 intValue];

          long long v20 = [v17 objectForKeyedSubscript:@"TypeDetail"];
          if (v20 == @"TransitMetro" && (v19 & 0xFF00) == 0x300 && ((int v21 = v15, v15 == 3) || v15 == 6))
          {
            long long v22 = [v8 objectForKeyedSubscript:@"CityCode"];
            long long v23 = [v17 objectForKeyedSubscript:@"CityCode"];
            int v24 = [v22 isEqualToNumber:v23];

            if (v24)
            {
              [v9 removeObject:v8];
              uint64_t v25 = ATLLogObject();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v26 = [v8 objectForKeyedSubscript:@"SerialNumber"];
                int v27 = 138412802;
                id v28 = v26;
                __int16 v29 = 1024;
                int v30 = v21;
                __int16 v31 = 1024;
                int v32 = 3;
                _os_log_impl(&dword_1CA552000, v25, OS_LOG_TYPE_DEFAULT, "SN %@ with type=%d, next transaction type=%d, both modality are metro, remove this transaction.", (uint8_t *)&v27, 0x18u);
              }
            }
          }
          else
          {
          }
        }
      }
    }
  }
}

- (void)addFakeBusTxnGuangdong:(id)a3 history:(id)a4 cityCode:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    if ([v10 unsignedIntValue] == 1)
    {
      id v12 = [v8 objectForKeyedSubscript:@"TypeDetailRaw"];
      __int16 v13 = [v12 intValue];

      if ((v13 & 0xFF00) == 0x300)
      {
        id v14 = [v8 objectForKeyedSubscript:@"TypeDetail"];

        if (v14 == @"TransitBus")
        {
          unsigned __int8 v15 = [(WuluDecoder *)self findNextCappPuchaseEntry:v8 history:v9];
          id v16 = v15;
          if (v15)
          {
            id v17 = [v15 objectForKeyedSubscript:@"TypeDetailRaw"];
            __int16 v18 = [v17 intValue];

            __int16 v19 = [v16 objectForKeyedSubscript:@"TypeDetail"];

            if (v19 != @"TransitBus" || (v18 & 0xFF00) == 0x300)
            {
              long long v20 = (void *)[v8 mutableCopy];
              [v20 removeObjectForKey:@"IgnoreReason"];
              int v21 = NSNumber;
              long long v22 = [v20 objectForKeyedSubscript:@"SerialNumber"];
              long long v23 = [v21 numberWithInt:[v22 intValue] + 1];
              [v20 setObject:v23 forKeyedSubscript:@"SerialNumber"];

              [v9 insertObject:v20 atIndex:[v9 indexOfObject:v8]];
              int v24 = ATLLogObject();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v25 = [v8 objectForKeyedSubscript:@"SerialNumber"];
                uint64_t v26 = [v16 objectForKeyedSubscript:@"SerialNumber"];
                int v27 = 138412546;
                id v28 = v25;
                __int16 v29 = 2112;
                int v30 = v26;
                _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_DEFAULT, "SN %@, previous transaction != bus or is an entry at %@, add a fake tap-out.", (uint8_t *)&v27, 0x16u);
              }
            }
          }
        }
      }
    }
  }
}

- (id)findNextCappPuchaseEntry:(id)a3 history:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 objectForKeyedSubscript:@"SerialNumber"];
  __int16 v8 = [(WuluDecoder *)self convertWalletSNtoAppletSN:v7] + 1;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__WuluDecoder_findNextCappPuchaseEntry_history___block_invoke;
  v11[3] = &unk_1E65ADEE8;
  v11[4] = self;
  __int16 v12 = v8;
  id v9 = [v6 firstWhere:v11];

  return v9;
}

BOOL __48__WuluDecoder_findNextCappPuchaseEntry_history___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 objectForKeyedSubscript:@"SerialNumber"];
  int v4 = [v3 intValue];
  BOOL v5 = v4 == [*(id *)(a1 + 32) convertAppletSNtoWalletSN:*(unsigned __int16 *)(a1 + 40) txnTypeIdentifier:9];

  return v5;
}

- (id)resolveTransitModality:(unsigned __int8)a3
{
  if ((a3 - 1) > 0xD) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E65ADF08 + (char)(a3 - 1));
  }
}

- (BOOL)isMetroEntry:(id)a3 cityCode:(id)a4 setting:(id)a5 error:(id *)a6
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = v11;
  if (v11)
  {
    id v73 = v9;
    __int16 v13 = (void *)MEMORY[0x1E4F1C9B8];
    id v14 = [v11 objectForKeyedSubscript:@"localRecordSfi"];
    unsigned __int8 v15 = [v13 dataWithHexString:v14];
    uint64_t v16 = [v15 u8:0];

    id v17 = (void *)MEMORY[0x1E4F1C9B8];
    __int16 v18 = [v12 objectForKeyedSubscript:@"localRecordId"];
    __int16 v19 = [v17 dataWithHexString:v18];
    uint64_t v20 = [v19 u8:0];

    int v21 = (void *)MEMORY[0x1E4F1C9B8];
    long long v22 = [v12 objectForKeyedSubscript:@"metroInStationOffset"];
    long long v23 = [v21 dataWithHexString:v22];
    uint64_t v24 = [v23 u8:0];

    uint64_t v25 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v26 = [v12 objectForKeyedSubscript:@"metroInStationValue"];
    int v27 = [v25 dataWithHexString:v26];
    int v28 = [v27 u8:0];

    __int16 v29 = ATLLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v79 = v10;
      __int16 v80 = 1024;
      int v81 = v16;
      __int16 v82 = 1024;
      int v83 = v20;
      _os_log_impl(&dword_1CA552000, v29, OS_LOG_TYPE_DEFAULT, "City %@ local record %02X(%02X) is being checked for enroute.", buf, 0x18u);
    }

    int v30 = [v9 localRecords];
    uint64_t v31 = [v30 firstObject];

    if (v31)
    {
      if ([v31 sfi] == v16
        && [v31 number] == v20)
      {
        int v32 = [v31 data];
        unint64_t v33 = [v32 length];

        if (v33 >= v24)
        {
          uint64_t v39 = [v31 data];
          BOOL v70 = [v39 u8:v24] == v28;
        }
        else
        {
          long long v34 = ATLLogObject();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            id v35 = [v31 data];
            uint64_t v36 = [v35 length];
            *(_DWORD *)buf = 138413314;
            id v79 = v10;
            __int16 v80 = 1024;
            int v81 = v16;
            __int16 v82 = 1024;
            int v83 = v20;
            __int16 v84 = 2048;
            *(void *)v85 = v36;
            *(_WORD *)&v85[8] = 1024;
            int v86 = v24;
            _os_log_impl(&dword_1CA552000, v34, OS_LOG_TYPE_ERROR, "City %@ local record %02X(%02X) was expected but not enough data provided. (actual length = %lu, expected minimum %u).", buf, 0x28u);
          }
          id v37 = [NSString alloc];
          int v38 = [v31 data];
          uint64_t v39 = (void *)[[v37 initWithFormat:@"City %@ local record %02X(%02X) was expected but not enough data provided. (actual length = %lu, expected minimum %u).", v10, v16, v20, [v38 length], v24];

          if (a6)
          {
            id v40 = *a6;
            id v41 = (void *)MEMORY[0x1E4F28C58];
            if (*a6)
            {
              uint64_t v42 = *MEMORY[0x1E4F28A50];
              v74[0] = *MEMORY[0x1E4F28568];
              v74[1] = v42;
              v75[0] = v39;
              v75[1] = v40;
              uint64_t v43 = (void *)MEMORY[0x1E4F1C9E8];
              uint64_t v44 = (void **)v75;
              BOOL v45 = v74;
              uint64_t v46 = 2;
            }
            else
            {
              uint64_t v76 = *MEMORY[0x1E4F28568];
              v77 = v39;
              uint64_t v43 = (void *)MEMORY[0x1E4F1C9E8];
              uint64_t v44 = &v77;
              BOOL v45 = &v76;
              uint64_t v46 = 1;
            }
            v71 = [v43 dictionaryWithObjects:v44 forKeys:v45 count:v46];
            id v9 = v73;
            goto LABEL_36;
          }
          BOOL v70 = 0;
        }
        id v9 = v73;
        goto LABEL_38;
      }
      BOOL v56 = ATLLogObject();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        int v57 = [v31 sfi];
        int v58 = [v31 number];
        *(_DWORD *)buf = 138413314;
        id v79 = v10;
        __int16 v80 = 1024;
        int v81 = v16;
        __int16 v82 = 1024;
        int v83 = v20;
        __int16 v84 = 1024;
        *(_DWORD *)v85 = v57;
        *(_WORD *)&v85[4] = 1024;
        *(_DWORD *)&v85[6] = v58;
        _os_log_impl(&dword_1CA552000, v56, OS_LOG_TYPE_ERROR, "City %@ local record %02X(%02X) was expected but got %02X(%02X)", buf, 0x24u);
      }

      uint64_t v59 = [[NSString alloc] initWithFormat:@"City %@ local record %02X(%02X) was expected but got %02X(%02X)", v10, v16, v20, [v31 sfi], [v31 number]];
      uint64_t v39 = (void *)v59;
      if (!a6) {
        goto LABEL_37;
      }
      id v60 = *a6;
      id v41 = (void *)MEMORY[0x1E4F28C58];
      if (*a6)
      {
        uint64_t v61 = *MEMORY[0x1E4F28A50];
        v87[0] = *MEMORY[0x1E4F28568];
        v87[1] = v61;
        v88[0] = v59;
        v88[1] = v60;
        uint64_t v62 = (void *)MEMORY[0x1E4F1C9E8];
        v63 = v88;
        v64 = v87;
LABEL_28:
        uint64_t v69 = 2;
LABEL_35:
        v71 = [v62 dictionaryWithObjects:v63 forKeys:v64 count:v69];
LABEL_36:
        *a6 = [v41 errorWithDomain:@"ATL" code:8 userInfo:v71];

LABEL_37:
        BOOL v70 = 0;
LABEL_38:

        goto LABEL_39;
      }
      uint64_t v89 = *MEMORY[0x1E4F28568];
      uint64_t v90 = v59;
      uint64_t v62 = (void *)MEMORY[0x1E4F1C9E8];
      v63 = &v90;
      v64 = &v89;
    }
    else
    {
      v65 = ATLLogObject();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v79 = v10;
        _os_log_impl(&dword_1CA552000, v65, OS_LOG_TYPE_ERROR, "City %@ local record is missing.", buf, 0xCu);
      }

      uint64_t v66 = [[NSString alloc] initWithFormat:@"City %@ local record is missing.", v10];
      uint64_t v39 = (void *)v66;
      if (!a6) {
        goto LABEL_37;
      }
      id v67 = *a6;
      id v41 = (void *)MEMORY[0x1E4F28C58];
      if (*a6)
      {
        uint64_t v68 = *MEMORY[0x1E4F28A50];
        v91[0] = *MEMORY[0x1E4F28568];
        v91[1] = v68;
        v92[0] = v66;
        v92[1] = v67;
        uint64_t v62 = (void *)MEMORY[0x1E4F1C9E8];
        v63 = v92;
        v64 = v91;
        goto LABEL_28;
      }
      uint64_t v93 = *MEMORY[0x1E4F28568];
      uint64_t v94 = v66;
      uint64_t v62 = (void *)MEMORY[0x1E4F1C9E8];
      v63 = &v94;
      v64 = &v93;
    }
    uint64_t v69 = 1;
    goto LABEL_35;
  }
  int v47 = ATLLogObject();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v47, OS_LOG_TYPE_ERROR, "No setting.", buf, 2u);
  }

  uint64_t v48 = [[NSString alloc] initWithFormat:@"No setting."];
  uint64_t v31 = (void *)v48;
  if (a6)
  {
    id v49 = *a6;
    long long v50 = (void *)MEMORY[0x1E4F28C58];
    if (*a6)
    {
      uint64_t v51 = *MEMORY[0x1E4F28A50];
      v95[0] = *MEMORY[0x1E4F28568];
      v95[1] = v51;
      v96[0] = v48;
      v96[1] = v49;
      long long v52 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v53 = v96;
      int v54 = v95;
      uint64_t v55 = 2;
    }
    else
    {
      uint64_t v97 = *MEMORY[0x1E4F28568];
      v98[0] = v48;
      long long v52 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v53 = v98;
      int v54 = &v97;
      uint64_t v55 = 1;
    }
    uint64_t v39 = [v52 dictionaryWithObjects:v53 forKeys:v54 count:v55];
    [v50 errorWithDomain:@"ATL" code:8 userInfo:v39];
    BOOL v70 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  BOOL v70 = 0;
LABEL_39:

  return v70;
}

- (unsigned)convertWalletSNtoAppletSN:(id)a3
{
  return [a3 intValue] >> 1;
}

- (unsigned)convertAppletSNtoWalletSN:(unsigned __int16)a3 txnTypeIdentifier:(unsigned int)a4
{
  return (2 * a3) | (a4 << 17);
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if ((unint64_t)[v11 length] > 1)
  {
    id v23 = v11;
    uint64_t v24 = *(unsigned __int8 *)[v23 bytes];
    switch(v24)
    {
      case 0x12:
        uint64_t v26 = ATLLogObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_DEFAULT, "Deselect event, nothing to do here", buf, 2u);
        }

        goto LABEL_26;
      case 2:
        uint64_t v25 = [(WuluDecoder *)self parseEndEvent:v23 withApplet:v12 withError:a8];
        break;
      case 1:
        uint64_t v25 = [(WuluDecoder *)self parseStartEvent:v23 withApplet:v12 withError:a8];
        break;
      default:
        int v28 = ATLLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v43 = v24;
          _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_ERROR, "Unknown event type %u", buf, 8u);
        }

        uint64_t v29 = [[NSString alloc] initWithFormat:@"Unknown event type %u", v24];
        unsigned __int8 v15 = (void *)v29;
        if (!a8) {
          goto LABEL_25;
        }
        id v30 = *a8;
        id v17 = (void *)MEMORY[0x1E4F28C58];
        if (*a8)
        {
          uint64_t v31 = *MEMORY[0x1E4F28A50];
          v34[0] = *MEMORY[0x1E4F28568];
          v34[1] = v31;
          v35[0] = v29;
          v35[1] = v30;
          __int16 v19 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v20 = v35;
          int v21 = v34;
          goto LABEL_7;
        }
        uint64_t v36 = *MEMORY[0x1E4F28568];
        uint64_t v37 = v29;
        __int16 v19 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v20 = &v37;
        int v21 = &v36;
LABEL_23:
        uint64_t v22 = 1;
        goto LABEL_24;
    }
    int v27 = (void *)v25;
    goto LABEL_27;
  }
  __int16 v13 = ATLLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v43 = [v11 length];
    _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
  }

  uint64_t v14 = [[NSString alloc] initWithFormat:@"Short eventData? %u", objc_msgSend(v11, "length")];
  unsigned __int8 v15 = (void *)v14;
  if (!a8) {
    goto LABEL_25;
  }
  id v16 = *a8;
  id v17 = (void *)MEMORY[0x1E4F28C58];
  if (!*a8)
  {
    uint64_t v40 = *MEMORY[0x1E4F28568];
    uint64_t v41 = v14;
    __int16 v19 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v20 = &v41;
    int v21 = &v40;
    goto LABEL_23;
  }
  uint64_t v18 = *MEMORY[0x1E4F28A50];
  v38[0] = *MEMORY[0x1E4F28568];
  v38[1] = v18;
  v39[0] = v14;
  v39[1] = v16;
  __int16 v19 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v20 = v39;
  int v21 = v38;
LABEL_7:
  uint64_t v22 = 2;
LABEL_24:
  int v32 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
  *a8 = [v17 errorWithDomain:@"ATL" code:6 userInfo:v32];

LABEL_25:
LABEL_26:
  int v27 = 0;
LABEL_27:

  return v27;
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

    uint64_t v17 = [[NSString alloc] initWithFormat:@"Start event length %u expected %lu", objc_msgSend(v8, "length"), 5];
    uint64_t v14 = v17;
    if (!a5) {
      goto LABEL_29;
    }
    id v18 = *a5;
    __int16 v19 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v20 = *MEMORY[0x1E4F28A50];
      v40[0] = *MEMORY[0x1E4F28568];
      v40[1] = v20;
      v41[0] = v17;
      v41[1] = v18;
      int v21 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v22 = v41;
      id v23 = v40;
LABEL_17:
      uint64_t v29 = 2;
LABEL_27:
      int v32 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v29];
      *a5 = [v19 errorWithDomain:@"ATL" code:6 userInfo:v32];

      goto LABEL_28;
    }
    uint64_t v42 = *MEMORY[0x1E4F28568];
    uint64_t v43 = v17;
    int v21 = (void *)MEMORY[0x1E4F1C9E8];
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
    __int16 v19 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v28 = *MEMORY[0x1E4F28A50];
      v36[0] = *MEMORY[0x1E4F28568];
      v36[1] = v28;
      v37[0] = v26;
      v37[1] = v27;
      int v21 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v22 = v37;
      id v23 = v36;
      goto LABEL_17;
    }
    uint64_t v38 = *MEMORY[0x1E4F28568];
    uint64_t v39 = v26;
    int v21 = (void *)MEMORY[0x1E4F1C9E8];
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
      unsigned __int8 v15 = "Dropping Start event over contact";
      goto LABEL_21;
    }
LABEL_28:
    a5 = 0;
    goto LABEL_29;
  }
  unint64_t decoderState = self->decoderState;
  __int16 v13 = ATLLogObject();
  uint64_t v14 = v13;
  if (decoderState == 1)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v15 = "Dropping Start event because already started";
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
  void v34[2] = @"Version";
  uint64_t v14 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v11 + 1)];
  void v35[2] = v14;
  v34[3] = @"Interface";
  id v30 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v11 + 2)];
  v35[3] = v30;
  v34[4] = @"selectStatus";
  uint64_t v31 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v11 + 3)) >> 16];
  v34[5] = @"IgnoreRFEvents";
  v34[6] = @"DontWaitForEOT";
  v35[4] = v31;
  v35[5] = MEMORY[0x1E4F1CC38];
  v35[6] = MEMORY[0x1E4F1CC38];
  v35[7] = MEMORY[0x1E4F1CC28];
  v34[7] = @"RequiresPowerCycle";
  v34[8] = @"DelayExpressReentry";
  v35[8] = &unk_1F24E1AE0;
  a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:9];

LABEL_29:

  return a5;
}

- (id)parseEndEvent:(id)a3 withApplet:(id)a4 withError:(id *)a5
{
  v62[1] = *MEMORY[0x1E4F143B8];
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
      goto LABEL_29;
    }
    id v13 = *a5;
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v15 = *MEMORY[0x1E4F28A50];
      v59[0] = *MEMORY[0x1E4F28568];
      v59[1] = v15;
      v60[0] = v11;
      v60[1] = v13;
      id v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = v60;
      id v18 = v59;
      uint64_t v19 = 2;
    }
    else
    {
      uint64_t v61 = *MEMORY[0x1E4F28568];
      v62[0] = v11;
      id v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = v62;
      id v18 = &v61;
      uint64_t v19 = 1;
    }
    uint64_t v36 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
    uint64_t v37 = v14;
    uint64_t v38 = 3;
LABEL_28:
    *a5 = [v37 errorWithDomain:@"ATL" code:v38 userInfo:v36];

LABEL_29:
    uint64_t v42 = 0;
    goto LABEL_32;
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
      goto LABEL_29;
    }
    id v29 = *a5;
    id v30 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v55[0] = *MEMORY[0x1E4F28568];
      v55[1] = v31;
      v56[0] = v28;
      v56[1] = v29;
      int v32 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v33 = v56;
      long long v34 = v55;
      uint64_t v35 = 2;
    }
    else
    {
      uint64_t v57 = *MEMORY[0x1E4F28568];
      uint64_t v58 = v28;
      int v32 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v33 = &v58;
      long long v34 = &v57;
      uint64_t v35 = 1;
    }
    uint64_t v36 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:v35];
    uint64_t v37 = v30;
    uint64_t v38 = 6;
    goto LABEL_28;
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
  id v12 = [v20 subdataWithRange:9, [v20 length] - 9];
  *(void *)&long long buf = [v12 bytes];
  *((void *)&buf + 1) = [v12 length];
  uint64_t v41 = [(WuluDecoder *)self DecodeEndE1TLV:&buf error:a5];
  if (v41 && !*a5)
  {
    v52[0] = @"EventType";
    v52[1] = @"appletIdentifier";
    v53[0] = @"EndEvent";
    v53[1] = v9;
    v52[2] = @"Version";
    uint64_t v51 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v22 + 1)];
    v53[2] = v51;
    v52[3] = @"Interface";
    long long v50 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v22 + 2)];
    v53[3] = v50;
    v52[4] = @"didError";
    id v49 = [NSNumber numberWithBool:v40 != 144];
    v53[4] = v49;
    v52[5] = @"command";
    uint64_t v43 = [NSNumber numberWithUnsignedInt:bswap32(v39)];
    v53[5] = v43;
    v52[6] = @"status";
    uint64_t v44 = [NSNumber numberWithUnsignedShort:__rev16(v40)];
    v53[6] = v44;
    v52[7] = @"result";
    int v45 = [NSNumber numberWithUnsignedShort:(v40 == 144) << 6];
    v53[7] = v45;
    v53[8] = &unk_1F24E1BA0;
    v52[8] = @"informative";
    v52[9] = @"type";
    v53[9] = &unk_1F24E1BB8;
    v52[10] = @"ReadOperationInfo";
    __int16 v46 = [v41 objectForKeyedSubscript:];
    v53[10] = v46;
    v52[11] = @"WriteOperationInfo";
    uint64_t v47 = [v41 objectForKeyedSubscript:];
    v53[11] = v47;
    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:12];
  }
  else
  {
    uint64_t v42 = 0;
  }

LABEL_32:

  return v42;
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
      uint64_t v41 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
      *a4 = [v12 errorWithDomain:@"ATL" code:3 userInfo:v41];
    }
LABEL_27:
    a4 = 0;
    goto LABEL_28;
  }
  if (v49 != 0xE000000000000001)
  {
    id v30 = ATLLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = v49;
      _os_log_impl(&dword_1CA552000, v30, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx", buf, 0xCu);
    }

    id v31 = [NSString alloc];
    uint64_t v48 = v49;
    uint64_t v32 = [v31 initWithFormat:@"Unexpected tag 0x%llx"];
    unint64_t v33 = (void *)v32;
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
    LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[WuluDecoder DecodeEndE1TLV:error:]", 1387, (uint64_t)a3->var0, a3->var1, @"E1 TLV data", v44, v45, v48);
    goto LABEL_27;
  }
  *(_OWORD *)long long buf = 0u;
  DERItem v58 = (DERItem)0;
  uint64_t v18 = DERParseSequenceSpec((uint64_t)v50, (uint64_t)&EndEventE1ContentSpec, (char *)buf, 0x20uLL);
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = ATLLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v55 = 67109120;
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
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Wulu decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"Wulu decoder doesn't expect processEndOfTransaction"];
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

- (id)setTimer:(id)a3 history:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v6)
  {
    id v25 = 0;
    goto LABEL_35;
  }
  uint64_t v8 = [v6 count];
  if (!v8)
  {
    id v11 = ATLLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA552000, v11, OS_LOG_TYPE_DEFAULT, "No history found.", buf, 2u);
    }
    id v25 = 0;
    goto LABEL_34;
  }
  unint64_t v9 = v8;
  uint64_t v10 = [v7 objectAtIndexedSubscript:0];
  id v11 = [v10 objectForKeyedSubscript:@"CityCode"];

  if (!v11)
  {
    uint64_t v13 = ATLLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_DEFAULT, "No city code in the last history record.", buf, 2u);
    }
    id v25 = 0;
    goto LABEL_33;
  }
  id v12 = [v7 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"TerminalIdentifier"];

  if (v9 < 2)
  {
LABEL_9:
    uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithShortBE:(unsigned __int16)-[NSObject intValue](v11, "intValue")];
    uint64_t v18 = +[AppletConfigurationData getWuluSettings];
    uint64_t v19 = [v18 objectForKeyedSubscript:@"timerScript"];
    id v20 = [v15 asHexString];
    uint64_t v17 = [v19 objectForKeyedSubscript:v20];

    if (v17) {
      goto LABEL_13;
    }
    uint64_t v21 = ATLLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v35) = [v11 intValue];
      _os_log_impl(&dword_1CA552000, v21, OS_LOG_TYPE_DEFAULT, "No available timer for %02X, use the default one.", buf, 8u);
    }

    uint64_t v22 = +[AppletConfigurationData getWuluSettings];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"timerScript"];
    uint64_t v17 = [v23 objectForKeyedSubscript:@"default"];

    if (v17)
    {
LABEL_13:
      if ([v17 count] == 3)
      {
        uint64_t v24 = ATLLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v35 = v11;
          _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_DEFAULT, "Set timer for city code = %@.", buf, 0xCu);
        }

        id v33 = 0;
        [v5 applyScript:v17 error:&v33];
        id v25 = v33;
        goto LABEL_32;
      }
    }
    uint64_t v26 = ATLLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = [v17 count];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v35) = v27;
      uint64_t v28 = "No available timer or timers count %u != 3";
      uint64_t v29 = v26;
      os_log_type_t v30 = OS_LOG_TYPE_ERROR;
      uint32_t v31 = 8;
LABEL_30:
      _os_log_impl(&dword_1CA552000, v29, v30, v28, buf, v31);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  uint64_t v14 = [v7 objectAtIndexedSubscript:1];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"CityCode"];

  id v16 = [v7 objectAtIndexedSubscript:1];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"TerminalIdentifier"];

  if (v17)
  {
    if ([v15 isEqualToNumber:v11]
      && ([v13 isEqualToData:v17] & 1) == 0)
    {
      uint64_t v26 = ATLLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v35 = v11;
        uint64_t v28 = "Same city city code = %@ and same on terminal, ignore the timer set.";
        uint64_t v29 = v26;
        os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
        uint32_t v31 = 12;
        goto LABEL_30;
      }
      goto LABEL_31;
    }

    goto LABEL_9;
  }
  uint64_t v26 = ATLLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    uint64_t v28 = "No terminal id in transaction.";
    uint64_t v29 = v26;
    os_log_type_t v30 = OS_LOG_TYPE_ERROR;
    uint32_t v31 = 2;
    goto LABEL_30;
  }
LABEL_31:

  id v25 = 0;
LABEL_32:

LABEL_33:
LABEL_34:

LABEL_35:

  return v25;
}

- (void)cleanup
{
  self->unint64_t decoderState = 0;
}

@end