@interface HerculesDecoder
+ (BOOL)canDecodeSPId:(unsigned __int8)a3;
+ (BOOL)didTransactionError:(id *)a3 withTransactionResult:(unsigned __int16 *)a4;
+ (BOOL)getDontWaitForEOT;
+ (BOOL)supportsPlasticCardMode:(unsigned __int8)a3 withTransceiver:(id)a4;
+ (id)addAmount:(id *)a3 withCurrency:(id *)a4 usingAmountKey:(id)a5 usingCurrencyKey:(id)a6 usingExponentKey:(id)a7;
+ (id)calculateTransactionSN:(id *)a3 withDeviceId:(id *)a4 withDeviceSN:(id *)a5;
+ (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
+ (id)getEmReentryDelayMs;
+ (id)getIdentifier:(id *)a3 withInstanceIdentifier:(id *)a4;
+ (id)getRecords:(id)a3 withError:(id *)a4;
+ (id)getServiceProvider:(unsigned __int8)a3;
+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9;
+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
+ (id)getTransactionsFromRecord:(id *)a3 withCityCode:(id)a4 withServerRefreshRequired:(id *)a5 withStateDict:(id)a6 withError:(id *)a7;
+ (id)parseBalanceCollection:(id *)a3 withError:(id *)a4;
+ (id)parseBalanceItem:(id *)a3 withError:(id *)a4;
+ (id)parseDalData:(id)a3 withCityCode:(id)a4 withStateDict:(id)a5 withError:(id *)a6;
+ (id)parseDateAndTime:(id *)a3;
+ (id)parseEvent:(id *)a3 withError:(id *)a4;
+ (id)parseIdentifierCollection:(id *)a3 withError:(id *)a4;
+ (id)parseIdentifierItem:(id *)a3 withError:(id *)a4;
+ (id)parsePurchaseEvent:(id *)a3 withError:(id *)a4;
+ (id)parseSaleEvent:(id *)a3 withError:(id *)a4;
+ (id)parseUseEvent:(id *)a3 withError:(id *)a4;
@end

@implementation HerculesDecoder

+ (BOOL)canDecodeSPId:(unsigned __int8)a3
{
  return a3 == 49;
}

+ (id)getServiceProvider:(unsigned __int8)a3
{
  return @"Hercules";
}

+ (id)getEmReentryDelayMs
{
  return &unk_1F24E1A80;
}

+ (BOOL)getDontWaitForEOT
{
  return 1;
}

+ (BOOL)didTransactionError:(id *)a3 withTransactionResult:(unsigned __int16 *)a4
{
  BOOL v6 = *(unsigned __int16 *)((char *)&a3->var7 + 1) != 19 || a3->var8[1] != 238 || *(_WORD *)&a3->var4[31] != 0x4000;
  if (a4)
  {
    if (v6) {
      __int16 v7 = 0;
    }
    else {
      __int16 v7 = 64;
    }
    if (HIBYTE(a3->var7) == 15) {
      unsigned __int16 v8 = -4096;
    }
    else {
      unsigned __int16 v8 = v7;
    }
    *a4 = v8;
  }
  return v6;
}

+ (BOOL)supportsPlasticCardMode:(unsigned __int8)a3 withTransceiver:(id)a4
{
  uint64_t v10 = 0;
  v4 = +[MifareUtils getMcmDataDal:17987 withTransceiver:a4 withError:&v10];
  uint64_t v5 = v10;
  if ([v4 length] == 2 && v5 == 0)
  {
    unsigned __int16 v8 = [NSNumber numberWithUnsignedShort:[v4 u16BE:0]];
    BOOL v7 = +[HerculesMappings supportsPlasticCardMode:v8];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = 0;
  v9 = +[MifareUtils getMcmDataDal:17987 withTransceiver:v8 withError:&v35];
  id v10 = v35;
  if ([v9 length] != 2 && v10 == 0)
  {
    v12 = ATLLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v9 asHexString];
      *(_DWORD *)buf = 138412290;
      v43 = v13;
      _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_ERROR, "Invalid city code '%@'", buf, 0xCu);
    }
    id v14 = [NSString alloc];
    v15 = [v9 asHexString];
    v16 = (void *)[v14 initWithFormat:@"Invalid city code '%@'", v15];

    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41 = v16;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v10 = [v17 errorWithDomain:@"ATL" code:3 userInfo:v18];
  }
  if (!v10)
  {
    v20 = [NSNumber numberWithUnsignedShort:[v9 u16BE:0]];
    id v34 = 0;
    v21 = +[MifareUtils getMcmDataDal:17734 withTransceiver:v8 withError:&v34];
    id v10 = v34;
    if (![v21 length] && !v10)
    {
      v22 = ATLLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v22, OS_LOG_TYPE_ERROR, "No DAL data for Event File", buf, 2u);
      }

      v23 = (void *)[[NSString alloc] initWithFormat:@"No DAL data for Event File"];
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      v39 = v23;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v10 = [v24 errorWithDomain:@"ATL" code:3 userInfo:v25];
    }
    if (v10)
    {
      if (a7)
      {
        id v10 = v10;
        v19 = 0;
        *a7 = v10;
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_30;
    }
    v26 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    id v33 = 0;
    v27 = +[HerculesDecoder parseDalData:v21 withCityCode:v20 withStateDict:v26 withError:&v33];
    id v28 = v33;
    if (v28)
    {
      id v10 = v28;
      if (a7)
      {
LABEL_23:
        id v10 = v10;
        v19 = 0;
        *a7 = v10;
LABEL_29:

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {
      v29 = [v26 objectForKeyedSubscript:@"Balances"];
      id v32 = 0;
      v30 = +[HerculesMappings addBalancesFromVC:v29 withTransceiver:v8 forCity:v20 withError:&v32];
      id v10 = v32;
      [v26 setObject:v30 forKeyedSubscript:@"Balances"];

      if (!v10)
      {
        v36[0] = @"State";
        v36[1] = @"TransactionHistory";
        v37[0] = v26;
        v37[1] = v27;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
        goto LABEL_29;
      }
      if (a7) {
        goto LABEL_23;
      }
    }
    v19 = 0;
    goto LABEL_29;
  }
  if (a7)
  {
    id v10 = v10;
    v19 = 0;
    *a7 = v10;
  }
  else
  {
    v19 = 0;
  }
LABEL_31:

  return v19;
}

+ (id)getRecords:(id)a3 withError:(id *)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v39 = [v5 bytes];
  uint64_t v40 = [v5 length];
  BOOL v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  id v7 = v5;
  id v8 = (unsigned char *)[v7 bytes];
  id v9 = v7;
  uint64_t v10 = [v9 bytes];
  uint64_t v11 = [v9 length];
  unint64_t v12 = v10 + v11;
  if ((unint64_t)v8 >= v10 + v11)
  {
LABEL_10:
    v16 = [v6 reverseObjectEnumerator];
    v17 = [v16 allObjects];
  }
  else
  {
    v13 = (unsigned char *)(v11 + v10);
    while (1)
    {
      unint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v14 = DERDecodeItemCtx((uint64_t)&v39, &v36);
      if (v14) {
        break;
      }
      if (v36 != 0xE000000000000000)
      {
        id v28 = ATLLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v46 = v36;
          _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_ERROR, "Unexpected event tag 0x%llx", buf, 0xCu);
        }

        id v29 = [NSString alloc];
        uint64_t v30 = [v29 initWithFormat:@"Unexpected event tag 0x%llx", v36];
        v21 = (void *)v30;
        if (a4)
        {
          id v31 = *a4;
          v23 = (void *)MEMORY[0x1E4F28C58];
          if (*a4)
          {
            uint64_t v32 = *MEMORY[0x1E4F28A50];
            v41[0] = *MEMORY[0x1E4F28568];
            v41[1] = v32;
            v42[0] = v30;
            v42[1] = v31;
            v25 = (void *)MEMORY[0x1E4F1C9E8];
            v26 = v42;
            v27 = v41;
LABEL_21:
            uint64_t v33 = 2;
LABEL_25:
            id v34 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v33];
            *a4 = [v23 errorWithDomain:@"ATL" code:3 userInfo:v34];

            goto LABEL_26;
          }
          uint64_t v43 = *MEMORY[0x1E4F28568];
          uint64_t v44 = v30;
          v25 = (void *)MEMORY[0x1E4F1C9E8];
          v26 = &v44;
          v27 = &v43;
LABEL_24:
          uint64_t v33 = 1;
          goto LABEL_25;
        }
        goto LABEL_26;
      }
      v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:v37 - (void)v8 + v38 freeWhenDone:0];
      [v6 addObject:v15];

      id v8 = (unsigned char *)(v37 + v38);
      if (v37 + v38 < v12)
      {
        while (!*v8)
        {
          if ((unint64_t)++v8 >= v12)
          {
            id v8 = v13;
            break;
          }
        }
      }
      uint64_t v39 = (uint64_t)v8;
      uint64_t v40 = v12 - (void)v8;
      if (v12 <= (unint64_t)v8) {
        goto LABEL_10;
      }
    }
    uint64_t v18 = v14;
    v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v46) = v18;
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Failed to decode item %d", buf, 8u);
    }

    uint64_t v20 = [[NSString alloc] initWithFormat:@"Failed to decode item %d", v18];
    v21 = (void *)v20;
    if (a4)
    {
      id v22 = *a4;
      v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        v47[0] = *MEMORY[0x1E4F28568];
        v47[1] = v24;
        v48[0] = v20;
        v48[1] = v22;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = v48;
        v27 = v47;
        goto LABEL_21;
      }
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50[0] = v20;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = v50;
      v27 = &v49;
      goto LABEL_24;
    }
LABEL_26:

    v17 = 0;
  }

  return v17;
}

+ (id)parseDalData:(id)a3 withCityCode:(id)a4 withStateDict:(id)a5 withError:(id *)a6
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v51 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    uint64_t v11 = +[HerculesDecoder getRecords:v9 withError:a6];
    unint64_t v12 = v11;
    if (!*a6)
    {
      if ([v11 count])
      {
        id v49 = v9;
        v50 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v12 count]];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v48 = v12;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v56 objects:v61 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          id v16 = 0;
          uint64_t v17 = *(void *)v57;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v57 != v17) {
                objc_enumerationMutation(v13);
              }
              v19 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              *(void *)buf = 0;
              uint64_t v55 = 0;
              id v20 = v19;
              *(void *)buf = [v20 bytes];
              uint64_t v55 = [v20 length];
              if (v16) {
                v21 = 0;
              }
              else {
                v21 = &v53;
              }
              if (!v16) {
                id v53 = 0;
              }
              if (objc_msgSend(v10, "count", v48)) {
                id v22 = 0;
              }
              else {
                id v22 = v10;
              }
              v23 = +[HerculesDecoder getTransactionsFromRecord:buf withCityCode:v51 withServerRefreshRequired:v21 withStateDict:v22 withError:a6];
              if (!v16) {
                id v16 = v53;
              }
              if (*a6)
              {

                uint64_t v33 = 0;
                unint64_t v12 = v48;
                id v9 = v49;
                id v34 = v50;
                id v35 = v13;
                goto LABEL_44;
              }
              if ([v23 count]) {
                [v50 addObjectsFromArray:v23];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v56 objects:v61 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v16 = 0;
        }

        id v52 = 0;
        v45 = +[HerculesMappings mergeTaps:v50 forCity:v51 outEnRoute:&v52];
        id v35 = v52;

        if (v16) {
          [v10 setObject:v16 forKeyedSubscript:@"ServerRefreshRequired"];
        }
        unint64_t v12 = v48;
        id v9 = v49;
        if (v35)
        {
          id v60 = v35;
          unint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
          [v10 setObject:v46 forKeyedSubscript:@"TransactionInProgress"];
        }
        id v34 = v45;
        uint64_t v33 = v34;
LABEL_44:
      }
      else
      {
        unint64_t v36 = ATLLogObject();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA552000, v36, OS_LOG_TYPE_ERROR, "No records", buf, 2u);
        }

        uint64_t v37 = [[NSString alloc] initWithFormat:@"No records"];
        id v16 = (id)v37;
        id v38 = *a6;
        uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
        if (*a6)
        {
          uint64_t v40 = *MEMORY[0x1E4F28A50];
          v62[0] = *MEMORY[0x1E4F28568];
          v62[1] = v40;
          v63[0] = v37;
          v63[1] = v38;
          v41 = (void *)MEMORY[0x1E4F1C9E8];
          v42 = v63;
          uint64_t v43 = v62;
          uint64_t v44 = 2;
        }
        else
        {
          uint64_t v64 = *MEMORY[0x1E4F28568];
          uint64_t v65 = v37;
          v41 = (void *)MEMORY[0x1E4F1C9E8];
          v42 = &v65;
          uint64_t v43 = &v64;
          uint64_t v44 = 1;
        }
        id v34 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:v44];
        [v39 errorWithDomain:@"ATL" code:3 userInfo:v34];
        uint64_t v33 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_48;
    }
LABEL_30:
    uint64_t v33 = 0;
    goto LABEL_49;
  }
  uint64_t v24 = ATLLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "No DAL data", buf, 2u);
  }

  uint64_t v25 = [[NSString alloc] initWithFormat:@"No DAL data"];
  unint64_t v12 = (void *)v25;
  if (!a6) {
    goto LABEL_30;
  }
  id v26 = *a6;
  v27 = (void *)MEMORY[0x1E4F28C58];
  if (*a6)
  {
    uint64_t v28 = *MEMORY[0x1E4F28A50];
    v66[0] = *MEMORY[0x1E4F28568];
    v66[1] = v28;
    v67[0] = v25;
    v67[1] = v26;
    id v29 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v30 = v67;
    id v31 = v66;
    uint64_t v32 = 2;
  }
  else
  {
    uint64_t v68 = *MEMORY[0x1E4F28568];
    v69[0] = v25;
    id v29 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v30 = v69;
    id v31 = &v68;
    uint64_t v32 = 1;
  }
  id v16 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:v32];
  [v27 errorWithDomain:@"ATL" code:3 userInfo:v16];
  uint64_t v33 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

LABEL_49:

  return v33;
}

+ (id)getTransactionsFromRecord:(id *)a3 withCityCode:(id)a4 withServerRefreshRequired:(id *)a5 withStateDict:(id)a6 withError:(id *)a7
{
  v118[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  uint64_t v77 = 0;
  v78[0] = 0;
  v78[1] = 0;
  uint64_t v13 = DERDecodeItemCtx((uint64_t)a3, (unint64_t *)&v77);
  if (v13)
  {
    uint64_t v14 = ATLLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_ERROR, "Failed to decode E0 %d", buf, 8u);
    }

    uint64_t v15 = [[NSString alloc] initWithFormat:@"Failed to decode E0 %d", v13];
    id v16 = (void *)v15;
    if (a7)
    {
      id v17 = *a7;
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v19 = *MEMORY[0x1E4F28A50];
        v115[0] = *MEMORY[0x1E4F28568];
        v115[1] = v19;
        v116[0] = v15;
        v116[1] = v17;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];
      }
      else
      {
        uint64_t v117 = *MEMORY[0x1E4F28568];
        v118[0] = v15;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:&v117 count:1];
      id v34 = };
      *a7 = [v18 errorWithDomain:@"ATL" code:3 userInfo:v34];
    }
LABEL_37:
    id v46 = 0;
    goto LABEL_38;
  }
  if (v77 != 0xE000000000000000)
  {
    v27 = ATLLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v77;
      _os_log_impl(&dword_1CA552000, v27, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx when trying to decode E0", buf, 0xCu);
    }

    id v28 = [NSString alloc];
    uint64_t v68 = v77;
    uint64_t v29 = [v28 initWithFormat:@"Unexpected tag 0x%llx when trying to decode E0"];
    uint64_t v30 = (void *)v29;
    if (a7)
    {
      id v31 = *a7;
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v33 = *MEMORY[0x1E4F28A50];
        v111[0] = *MEMORY[0x1E4F28568];
        v111[1] = v33;
        v112[0] = v29;
        v112[1] = v31;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:2];
      }
      else
      {
        uint64_t v113 = *MEMORY[0x1E4F28568];
        uint64_t v114 = v29;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      uint64_t v43 = };
      *a7 = [v32 errorWithDomain:@"ATL" code:3 userInfo:v43];
    }
    LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[HerculesDecoder getTransactionsFromRecord:withCityCode:withServerRefreshRequired:withStateDict:withError:]", 296, (uint64_t)a3->var0, a3->var1, @"Record data", v44, v45, v68);
    goto LABEL_37;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v108 = 0u;
  long long v106 = 0u;
  memset(v107, 0, sizeof(v107));
  long long v105 = 0u;
  long long v103 = 0u;
  memset(v104, 0, sizeof(v104));
  *(_OWORD *)buf = 0u;
  long long v102 = 0u;
  uint64_t v20 = DERParseSequenceSpec((uint64_t)v78, (uint64_t)&EventContentSpec, (char *)buf, 0xC0uLL);
  if (v20)
  {
    v21 = ATLLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v83 = 67109120;
      *(_DWORD *)&v83[4] = v20;
      _os_log_impl(&dword_1CA552000, v21, OS_LOG_TYPE_ERROR, "Failed to decode E0 contents %d", v83, 8u);
    }

    uint64_t v22 = [[NSString alloc] initWithFormat:@"Failed to decode E0 contents %d", v20];
    id v23 = (id)v22;
    if (a7)
    {
      id v24 = *a7;
      uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v26 = *MEMORY[0x1E4F28A50];
        v97[0] = *MEMORY[0x1E4F28568];
        v97[1] = v26;
        v98[0] = v22;
        v98[1] = v24;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];
      }
      else
      {
        uint64_t v99 = *MEMORY[0x1E4F28568];
        uint64_t v100 = v22;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      }
LABEL_62:
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      [v25 errorWithDomain:@"ATL" code:3 userInfo:v54];
      id v46 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

      goto LABEL_68;
    }
    goto LABEL_60;
  }
  if (**(unsigned char **)buf != 1)
  {
    v48 = ATLLogObject();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      int v49 = **(unsigned char **)buf;
      *(_DWORD *)v83 = 67109120;
      *(_DWORD *)&v83[4] = v49;
      _os_log_impl(&dword_1CA552000, v48, OS_LOG_TYPE_ERROR, "Incorrect record version %hhu", v83, 8u);
    }

    id v50 = [NSString alloc];
    uint64_t v51 = [v50 initWithFormat:@"Incorrect record version %hhu", **(unsigned char **)buf];
    id v23 = (id)v51;
    if (a7)
    {
      id v52 = *a7;
      uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v53 = *MEMORY[0x1E4F28A50];
        v93[0] = *MEMORY[0x1E4F28568];
        v93[1] = v53;
        v94[0] = v51;
        v94[1] = v52;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
      }
      else
      {
        uint64_t v95 = *MEMORY[0x1E4F28568];
        uint64_t v96 = v51;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      }
      goto LABEL_62;
    }
    goto LABEL_60;
  }
  if (!v12)
  {
LABEL_28:
    uint64_t v37 = +[HerculesDecoder parseDateAndTime:&v103];
    id v38 = +[HerculesDecoder calculateTransactionSN:&v103 withDeviceId:&v105 withDeviceSN:&v106];
    uint64_t v39 = v38;
    if (a5 && *((void *)&v109 + 1) && *(unsigned char *)v109) {
      *a5 = v38;
    }
    uint64_t v40 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v102];
    if (*((void *)&v104[0] + 1))
    {
      v41 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:v104];
      v42 = +[HerculesMappings getStationCode:v41 withTransitInformation:v40 forCity:v11];
    }
    else
    {
      v42 = 0;
    }
    *(void *)v83 = 0;
    v84 = v83;
    uint64_t v85 = 0x3032000000;
    v86 = __Block_byref_object_copy__0;
    v87 = __Block_byref_object_dispose__0;
    id v88 = [MEMORY[0x1E4F1CA48] array];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __108__HerculesDecoder_getTransactionsFromRecord_withCityCode_withServerRefreshRequired_withStateDict_withError___block_invoke;
    v70[3] = &unk_1E65ADDB8;
    id v23 = v37;
    id v71 = v23;
    id v54 = v39;
    id v72 = v54;
    id v73 = v11;
    id v55 = v40;
    id v74 = v55;
    id v56 = v42;
    id v75 = v56;
    v76 = v83;
    if (DERDecodeSequenceWithBlock((unsigned __int8 **)&v110, (uint64_t)v70))
    {
      long long v57 = ATLLogObject();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v69 = 0;
        _os_log_impl(&dword_1CA552000, v57, OS_LOG_TYPE_ERROR, "Failed to parse event", v69, 2u);
      }

      uint64_t v58 = [[NSString alloc] initWithFormat:@"Failed to parse event"];
      long long v59 = (void *)v58;
      if (a7)
      {
        id v60 = *a7;
        v61 = (void *)MEMORY[0x1E4F28C58];
        if (*a7)
        {
          uint64_t v62 = *MEMORY[0x1E4F28A50];
          v79[0] = *MEMORY[0x1E4F28568];
          v79[1] = v62;
          v80[0] = v58;
          v80[1] = v60;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
        }
        else
        {
          uint64_t v81 = *MEMORY[0x1E4F28568];
          uint64_t v82 = v58;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        v63 = };
        *a7 = [v61 errorWithDomain:@"ATL" code:3 userInfo:v63];
      }
      id v46 = 0;
    }
    else
    {
      id v46 = *((id *)v84 + 5);
    }

    _Block_object_dispose(v83, 8);
    goto LABEL_67;
  }
  id v35 = +[HerculesDecoder parseBalanceCollection:v107 withError:a7];
  if (v35)
  {
    [v12 setObject:v35 forKeyedSubscript:@"Balances"];
    if (*((void *)&v108 + 1))
    {
      unint64_t v36 = [NSNumber numberWithInt:*(unsigned char *)v108 != 0];
      [v12 setObject:v36 forKeyedSubscript:@"CardDenyListed"];
    }
    goto LABEL_28;
  }
  uint64_t v64 = ATLLogObject();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v83 = 0;
    _os_log_impl(&dword_1CA552000, v64, OS_LOG_TYPE_ERROR, "Empty balance array", v83, 2u);
  }

  uint64_t v65 = [[NSString alloc] initWithFormat:@"Empty balance array"];
  id v23 = (id)v65;
  if (a7)
  {
    id v66 = *a7;
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v67 = *MEMORY[0x1E4F28A50];
      v89[0] = *MEMORY[0x1E4F28568];
      v89[1] = v67;
      v90[0] = v65;
      v90[1] = v66;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:2];
    }
    else
    {
      uint64_t v91 = *MEMORY[0x1E4F28568];
      uint64_t v92 = v65;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    }
    goto LABEL_62;
  }
LABEL_60:
  id v46 = 0;
LABEL_68:

LABEL_38:

  return v46;
}

uint64_t __108__HerculesDecoder_getTransactionsFromRecord_withCityCode_withServerRefreshRequired_withStateDict_withError___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  v3 = +[HerculesDecoder parseEvent:a2 withError:&v15];
  id v4 = v15;
  if (v4)
  {
    id v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v6 = 3;
LABEL_16:

    goto LABEL_17;
  }
  if (v3)
  {
    [v3 setObject:a1[4] forKeyedSubscript:@"TransactionTime"];
    [v3 setObject:a1[5] forKeyedSubscript:@"SerialNumber"];
    [v3 setObject:a1[6] forKeyedSubscript:@"CityCode"];
    id v7 = [v3 objectForKeyedSubscript:@"TypeDetail"];
    int v8 = [v7 hasPrefix:@"Transit"];

    if (v8)
    {
      id v9 = +[HerculesMappings getTransitModality:a1[7] forCity:a1[6]];
      [v3 setObject:v9 forKeyedSubscript:@"TypeDetail"];

      if (a1[8])
      {
        id v10 = +[HerculesMappings getStationMode:a1[7] forCity:a1[6]];
        [v3 setObject:a1[8] forKeyedSubscript:v10];
      }
      uint64_t v11 = +[HerculesMappings processEnRouteStatus:v3 forTransitInformation:a1[7] forCity:a1[6]];

      v3 = (void *)v11;
    }
    else
    {
      id v12 = [v3 objectForKeyedSubscript:@"TypeDetail"];
      if ([v12 hasPrefix:@"TopUp"])
      {
        uint64_t v13 = a1[8];

        if (v13) {
          [v3 setObject:a1[8] forKeyedSubscript:@"StartStation"];
        }
      }
      else
      {
      }
    }
    [*(id *)(*(void *)(a1[9] + 8) + 40) addObject:v3];
    uint64_t v6 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = 0;
LABEL_17:

  return v6;
}

+ (id)parseEvent:(id *)a3 withError:(id *)a4
{
  id v5 = 0;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  switch(a3->var0)
  {
    case 0xE000000000000001:
      id v5 = +[HerculesDecoder parseUseEvent:&a3->var1 withError:a4];
      break;
    case 0xE000000000000002:
      id v5 = +[HerculesDecoder parseSaleEvent:&a3->var1 withError:a4];
      break;
    case 0xE000000000000003:
      id v5 = +[HerculesDecoder parsePurchaseEvent:&a3->var1 withError:a4];
      break;
    case 0xE000000000000004:
      break;
    default:
      if (a3->var0 != 0xE00000000000000ELL)
      {
        uint64_t v6 = ATLLogObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t var0 = a3->var0;
          int v9 = 134217984;
          unint64_t v10 = var0;
          _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Unknown event type 0x%llx", (uint8_t *)&v9, 0xCu);
        }

        id v5 = 0;
      }
      break;
  }

  return v5;
}

+ (id)parseUseEvent:(id *)a3 withError:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  memset(v22, 0, sizeof(v22));
  uint64_t v5 = DERParseSequenceSpec((uint64_t)a3, (uint64_t)&UseEventContentSpec, (char *)v22, 0x20uLL);
  if (!v5)
  {
    id v17 = +[HerculesDecoder parseIdentifierCollection:v22 withError:a4];
    int v9 = v17;
    if (v17)
    {
      uint64_t v18 = Filter(v17, &__block_literal_global);
      uint64_t v19 = Filter(v9, &__block_literal_global_501);
      uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
      [v20 setObject:@"Transit" forKeyedSubscript:@"TypeDetail"];
      if ([v18 count]) {
        [v20 setObject:v18 forKeyedSubscript:@"Amounts"];
      }
      if ([v19 count]) {
        [v20 setObject:v19 forKeyedSubscript:@"CommutePlans"];
      }

      goto LABEL_16;
    }
LABEL_13:
    uint64_t v20 = 0;
    goto LABEL_17;
  }
  uint64_t v6 = v5;
  id v7 = ATLLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v28 = v6;
    _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_ERROR, "Failed to decode use event item contents %d", buf, 8u);
  }

  uint64_t v8 = [[NSString alloc] initWithFormat:@"Failed to decode use event item contents %d", v6];
  int v9 = (void *)v8;
  if (!a4) {
    goto LABEL_13;
  }
  id v10 = *a4;
  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  if (*a4)
  {
    uint64_t v12 = *MEMORY[0x1E4F28A50];
    v23[0] = *MEMORY[0x1E4F28568];
    v23[1] = v12;
    v24[0] = v8;
    v24[1] = v10;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = v24;
    id v15 = v23;
    uint64_t v16 = 2;
  }
  else
  {
    uint64_t v25 = *MEMORY[0x1E4F28568];
    uint64_t v26 = v8;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = &v26;
    id v15 = &v25;
    uint64_t v16 = 1;
  }
  uint64_t v18 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
  [v11 errorWithDomain:@"ATL" code:3 userInfo:v18];
  uint64_t v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:

  return v20;
}

BOOL __43__HerculesDecoder_parseUseEvent_withError___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"AmountIdentifier"];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __43__HerculesDecoder_parseUseEvent_withError___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"CommutePlanIdentifier"];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)parseSaleEvent:(id *)a3 withError:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  memset(v30, 0, sizeof(v30));
  long long v29 = 0u;
  memset(v28, 0, sizeof(v28));
  long long v27 = 0u;
  uint64_t v5 = DERParseSequenceSpec((uint64_t)a3, (uint64_t)&SaleEventContentSpec, (char *)&v27, 0xB0uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = ATLLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v39 = v6;
      _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_ERROR, "Failed to decode sale event item contents %d", buf, 8u);
    }

    uint64_t v8 = [[NSString alloc] initWithFormat:@"Failed to decode sale event item contents %d", v6];
    int v9 = (void *)v8;
    if (a4)
    {
      id v10 = *a4;
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v12 = *MEMORY[0x1E4F28A50];
        v34[0] = *MEMORY[0x1E4F28568];
        v34[1] = v12;
        v35[0] = v8;
        v35[1] = v10;
        uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v14 = v35;
        id v15 = v34;
        uint64_t v16 = 2;
      }
      else
      {
        uint64_t v36 = *MEMORY[0x1E4F28568];
        uint64_t v37 = v8;
        uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v14 = &v37;
        id v15 = &v36;
        uint64_t v16 = 1;
      }
      v21 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
      [v11 errorWithDomain:@"ATL" code:3 userInfo:v21];
      uint64_t v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v25 = 0;
    goto LABEL_13;
  }
  id v17 = +[HerculesDecoder addAmount:v30 withCurrency:&v29 usingAmountKey:@"Amount" usingCurrencyKey:@"AmountCurrency" usingExponentKey:@"AmountCurrencyExponent"];
  int v9 = v17;
  if (!v17) {
    goto LABEL_9;
  }
  uint64_t v18 = [v17 objectForKeyedSubscript:@"Amount"];
  uint64_t v19 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:1 exponent:0 isNegative:1];
  uint64_t v20 = [v18 decimalNumberByMultiplyingBy:v19];
  [v9 setObject:v20 forKeyedSubscript:@"Amount"];

  v21 = +[HerculesDecoder getIdentifier:&v27 withInstanceIdentifier:v28];
  [v9 setObject:v21 forKeyedSubscript:@"AmountIdentifier"];
  uint64_t v22 = (void *)MEMORY[0x1E4F1CA60];
  v32[1] = @"Amounts";
  v33[0] = @"TopUp";
  id v31 = v9;
  v32[0] = @"TypeDetail";
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v33[1] = v23;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  uint64_t v25 = [v22 dictionaryWithDictionary:v24];

LABEL_12:
LABEL_13:

  return v25;
}

+ (id)parsePurchaseEvent:(id *)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  memset(v26, 0, sizeof(v26));
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
  uint64_t v5 = DERParseSequenceSpec((uint64_t)a3, (uint64_t)&PurchaseEventContentSpec, (char *)&v23, 0x90uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = ATLLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v35 = v6;
      _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_ERROR, "Failed to decode purchase event item contents %d", buf, 8u);
    }

    uint64_t v8 = [[NSString alloc] initWithFormat:v7, v6];
    int v9 = (void *)v8;
    if (a4)
    {
      id v10 = *a4;
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v12 = *MEMORY[0x1E4F28A50];
        v30[0] = *MEMORY[0x1E4F28568];
        v30[1] = v12;
        v31[0] = v8;
        v31[1] = v10;
        uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v14 = v31;
        id v15 = v30;
        uint64_t v16 = 2;
      }
      else
      {
        uint64_t v32 = *MEMORY[0x1E4F28568];
        uint64_t v33 = v8;
        uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v14 = &v33;
        id v15 = &v32;
        uint64_t v16 = 1;
      }
      id v17 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
      [v11 errorWithDomain:@"ATL" code:3 userInfo:v17];
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_9:
    v21 = 0;
    goto LABEL_13;
  }
  int v9 = +[HerculesDecoder addAmount:v26 withCurrency:&v25 usingAmountKey:@"Amount" usingCurrencyKey:@"AmountCurrency" usingExponentKey:@"AmountCurrencyExponent"];
  if (!v9) {
    goto LABEL_9;
  }
  id v17 = +[HerculesDecoder getIdentifier:&v23 withInstanceIdentifier:v24];
  [v9 setObject:v17 forKeyedSubscript:@"AmountIdentifier"];
  uint64_t v18 = (void *)MEMORY[0x1E4F1CA60];
  v28[1] = @"Amounts";
  v29[0] = @"Purchase";
  v28[0] = @"TypeDetail";
  long long v27 = v9;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v29[1] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  v21 = [v18 dictionaryWithDictionary:v20];

LABEL_12:
LABEL_13:

  return v21;
}

+ (id)parseBalanceCollection:(id *)a3 withError:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  if (a3 && a3->var1)
  {
    *(void *)buf = 0;
    long long v25 = buf;
    uint64_t v26 = 0x3032000000;
    long long v27 = __Block_byref_object_copy__0;
    int v28 = __Block_byref_object_dispose__0;
    id v29 = [MEMORY[0x1E4F1CA48] array];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __52__HerculesDecoder_parseBalanceCollection_withError___block_invoke;
    v23[3] = &unk_1E65ADE00;
    v23[4] = buf;
    if (DERDecodeSequenceWithBlock((unsigned __int8 **)a3, (uint64_t)v23))
    {
      uint64_t v6 = ATLLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_ERROR, "Failed to parse balance item", v22, 2u);
      }

      uint64_t v7 = [[NSString alloc] initWithFormat:@"Failed to parse balance item"];
      uint64_t v8 = (void *)v7;
      if (a4)
      {
        id v9 = *a4;
        id v10 = (void *)MEMORY[0x1E4F28C58];
        if (*a4)
        {
          uint64_t v11 = *MEMORY[0x1E4F28A50];
          v30[0] = *MEMORY[0x1E4F28568];
          v30[1] = v11;
          v31[0] = v7;
          v31[1] = v9;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
        }
        else
        {
          uint64_t v32 = *MEMORY[0x1E4F28568];
          uint64_t v33 = v7;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        uint64_t v12 = };
        *a4 = [v10 errorWithDomain:@"ATL" code:3 userInfo:v12];
      }
      id v19 = 0;
    }
    else
    {
      id v19 = *((id *)v25 + 5);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v13 = ATLLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_ERROR, "Missing or zero length balance collection", buf, 2u);
    }

    uint64_t v14 = [[NSString alloc] initWithFormat:@"Missing or zero length balance collection"];
    id v15 = (void *)v14;
    if (a4)
    {
      id v16 = *a4;
      id v17 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v18 = *MEMORY[0x1E4F28A50];
        v34[0] = *MEMORY[0x1E4F28568];
        v34[1] = v18;
        v35[0] = v14;
        v35[1] = v16;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      }
      else
      {
        uint64_t v36 = *MEMORY[0x1E4F28568];
        v37[0] = v14;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      uint64_t v20 = };
      *a4 = [v17 errorWithDomain:@"ATL" code:3 userInfo:v20];
    }
    id v19 = 0;
  }

  return v19;
}

uint64_t __52__HerculesDecoder_parseBalanceCollection_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  BOOL v3 = +[HerculesDecoder parseBalanceItem:a2 withError:&v8];
  id v4 = v8;
  if (v3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v5 = 3;
  }

  return v5;
}

+ (id)parseBalanceItem:(id *)a3 withError:(id *)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  if (a3->var0 == 0xE000000000000005)
  {
    memset(v41, 0, sizeof(v41));
    long long v39 = 0u;
    long long v40 = 0u;
    *(_OWORD *)id v38 = 0u;
    uint64_t v6 = DERParseSequenceSpec((uint64_t)&a3->var1, (uint64_t)&BalanceItemContentSpec, (char *)v38, 0x70uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = ATLLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v37 = v7;
        _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Failed to decode balance item contents %d", buf, 8u);
      }

      uint64_t v9 = [[NSString alloc] initWithFormat:@"Failed to decode balance item contents %d", v7];
      id v10 = (void *)v9;
      if (a4)
      {
        id v11 = *a4;
        uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
        if (*a4)
        {
          uint64_t v13 = *MEMORY[0x1E4F28A50];
          v32[0] = *MEMORY[0x1E4F28568];
          v32[1] = v13;
          v33[0] = v9;
          v33[1] = v11;
          uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
          id v15 = v33;
          id v16 = v32;
          uint64_t v17 = 2;
        }
        else
        {
          uint64_t v34 = *MEMORY[0x1E4F28568];
          uint64_t v35 = v9;
          uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
          id v15 = &v35;
          id v16 = &v34;
          uint64_t v17 = 1;
        }
        uint64_t v30 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
        *a4 = [v12 errorWithDomain:@"ATL" code:3 userInfo:v30];

        a4 = 0;
      }
    }
    else
    {
      a4 = +[HerculesDecoder addAmount:v41 withCurrency:&v40 usingAmountKey:@"Balance" usingCurrencyKey:@"BalanceCurrency" usingExponentKey:@"BalanceCurrencyExponent"];
      id v10 = +[HerculesDecoder getIdentifier:v38 withInstanceIdentifier:&v39];
      [a4 setObject:v10 forKeyedSubscript:@"BalanceIdentifier"];
    }
  }
  else
  {
    uint64_t v18 = ATLLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unint64_t var0 = a3->var0;
      *(_DWORD *)id v38 = 134217984;
      *(void *)&v38[4] = var0;
      _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx for balance item", v38, 0xCu);
    }

    uint64_t v20 = [[NSString alloc] initWithFormat:@"Unexpected tag 0x%llx for balance item", a3->var0];
    v21 = (void *)v20;
    if (a4)
    {
      id v22 = *a4;
      long long v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        v42[0] = *MEMORY[0x1E4F28568];
        v42[1] = v24;
        v43[0] = v20;
        v43[1] = v22;
        long long v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = v43;
        long long v27 = v42;
        uint64_t v28 = 2;
      }
      else
      {
        uint64_t v44 = *MEMORY[0x1E4F28568];
        v45[0] = v20;
        long long v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = v45;
        long long v27 = &v44;
        uint64_t v28 = 1;
      }
      id v29 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v28];
      *a4 = [v23 errorWithDomain:@"ATL" code:3 userInfo:v29];
    }
    a4 = 0;
  }

  return a4;
}

+ (id)parseIdentifierCollection:(id *)a3 withError:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  if (a3 && a3->var1)
  {
    *(void *)buf = 0;
    long long v25 = buf;
    uint64_t v26 = 0x3032000000;
    long long v27 = __Block_byref_object_copy__0;
    uint64_t v28 = __Block_byref_object_dispose__0;
    id v29 = [MEMORY[0x1E4F1CA48] array];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __55__HerculesDecoder_parseIdentifierCollection_withError___block_invoke;
    v23[3] = &unk_1E65ADE00;
    v23[4] = buf;
    if (DERDecodeSequenceWithBlock((unsigned __int8 **)a3, (uint64_t)v23))
    {
      uint64_t v6 = ATLLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v22 = 0;
        _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_ERROR, "Failed to parse identifier item", v22, 2u);
      }

      uint64_t v7 = [[NSString alloc] initWithFormat:@"Failed to parse identifier item"];
      id v8 = (void *)v7;
      if (a4)
      {
        id v9 = *a4;
        id v10 = (void *)MEMORY[0x1E4F28C58];
        if (*a4)
        {
          uint64_t v11 = *MEMORY[0x1E4F28A50];
          v30[0] = *MEMORY[0x1E4F28568];
          v30[1] = v11;
          v31[0] = v7;
          v31[1] = v9;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
        }
        else
        {
          uint64_t v32 = *MEMORY[0x1E4F28568];
          uint64_t v33 = v7;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        uint64_t v12 = };
        *a4 = [v10 errorWithDomain:@"ATL" code:3 userInfo:v12];
      }
      id v19 = 0;
    }
    else
    {
      id v19 = *((id *)v25 + 5);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v13 = ATLLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_ERROR, "Missing or zero length identifier collection", buf, 2u);
    }

    uint64_t v14 = [[NSString alloc] initWithFormat:@"Missing or zero length identifier collection"];
    id v15 = (void *)v14;
    if (a4)
    {
      id v16 = *a4;
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v18 = *MEMORY[0x1E4F28A50];
        v34[0] = *MEMORY[0x1E4F28568];
        v34[1] = v18;
        v35[0] = v14;
        v35[1] = v16;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      }
      else
      {
        uint64_t v36 = *MEMORY[0x1E4F28568];
        v37[0] = v14;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      uint64_t v20 = };
      *a4 = [v17 errorWithDomain:@"ATL" code:3 userInfo:v20];
    }
    id v19 = 0;
  }

  return v19;
}

uint64_t __55__HerculesDecoder_parseIdentifierCollection_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  BOOL v3 = +[HerculesDecoder parseIdentifierItem:a2 withError:&v8];
  id v4 = v8;
  if (v4)
  {
    uint64_t v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v6 = 3;
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)parseIdentifierItem:(id *)a3 withError:(id *)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  if (a3->var0 == 0xE000000000000006)
  {
    long long v45 = 0u;
    long long v43 = 0u;
    memset(v44, 0, sizeof(v44));
    *(_OWORD *)v41 = 0u;
    memset(v42, 0, sizeof(v42));
    uint64_t v6 = DERParseSequenceSpec((uint64_t)&a3->var1, (uint64_t)&IdItemContentSpec, (char *)v41, 0xA0uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = ATLLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v40 = v7;
        _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Failed to decode id item contents %d", buf, 8u);
      }

      uint64_t v9 = [[NSString alloc] initWithFormat:@"Failed to decode id item contents %d", v7];
      id v10 = (void *)v9;
      if (a4)
      {
        id v11 = *a4;
        uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
        if (*a4)
        {
          uint64_t v13 = *MEMORY[0x1E4F28A50];
          v35[0] = *MEMORY[0x1E4F28568];
          v35[1] = v13;
          v36[0] = v9;
          v36[1] = v11;
          uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
          id v15 = v36;
          id v16 = v35;
          uint64_t v17 = 2;
        }
        else
        {
          uint64_t v37 = *MEMORY[0x1E4F28568];
          uint64_t v38 = v9;
          uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
          id v15 = &v38;
          id v16 = &v37;
          uint64_t v17 = 1;
        }
        uint64_t v32 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
        *a4 = [v12 errorWithDomain:@"ATL" code:3 userInfo:v32];

        a4 = 0;
      }
    }
    else
    {
      id v10 = +[HerculesDecoder getIdentifier:v41 withInstanceIdentifier:v42];
      if (*((void *)&v44[0] + 1))
      {
        id v29 = +[HerculesDecoder addAmount:v44 withCurrency:&v43 usingAmountKey:@"Amount" usingCurrencyKey:@"AmountCurrency" usingExponentKey:@"AmountCurrencyExponent"];
        a4 = v29;
        uint64_t v30 = @"AmountIdentifier";
      }
      else
      {
        a4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        if (*((void *)&v45 + 1))
        {
          uint64_t v33 = +[HerculesDecoder parseDateAndTime:&v45];
          [a4 setObject:v33 forKeyedSubscript:@"CommutePlanExpirationDate"];
        }
        uint64_t v30 = @"CommutePlanIdentifier";
        id v29 = a4;
      }
      [v29 setObject:v10 forKeyedSubscript:v30];
    }
  }
  else
  {
    uint64_t v18 = ATLLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unint64_t var0 = a3->var0;
      *(_DWORD *)v41 = 134217984;
      *(void *)&_OWORD v41[4] = var0;
      _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx for identifier item", v41, 0xCu);
    }

    uint64_t v20 = [[NSString alloc] initWithFormat:@"Unexpected tag 0x%llx for identifier item", a3->var0];
    v21 = (void *)v20;
    if (a4)
    {
      id v22 = *a4;
      long long v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        v46[0] = *MEMORY[0x1E4F28568];
        v46[1] = v24;
        v47[0] = v20;
        v47[1] = v22;
        long long v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = v47;
        long long v27 = v46;
        uint64_t v28 = 2;
      }
      else
      {
        uint64_t v48 = *MEMORY[0x1E4F28568];
        v49[0] = v20;
        long long v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = v49;
        long long v27 = &v48;
        uint64_t v28 = 1;
      }
      id v31 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v28];
      *a4 = [v23 errorWithDomain:@"ATL" code:3 userInfo:v31];
    }
    a4 = 0;
  }

  return a4;
}

+ (id)getIdentifier:(id *)a3 withInstanceIdentifier:(id *)a4
{
  if (a4->var1)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:a3];
    uint64_t v7 = [v6 asHexString];
    id v8 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:a4];
    uint64_t v9 = [v8 asHexString];
    id v10 = [v5 stringWithFormat:@"%@-%@", v7, v9];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:a3];
    id v10 = [v6 asHexString];
  }

  return v10;
}

+ (id)parseDateAndTime:(id *)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9D8];
  uint64_t v5 = DecodeBCD((const unsigned __int8 *)a3->var0, 1) + 2000;
  uint64_t v6 = DecodeBCD((const unsigned __int8 *)a3->var0 + 1, 1);
  uint64_t v7 = DecodeBCD((const unsigned __int8 *)a3->var0 + 2, 1);
  uint64_t v8 = DecodeBCD((const unsigned __int8 *)a3->var0 + 3, 1);
  uint64_t v9 = DecodeBCD((const unsigned __int8 *)a3->var0 + 4, 1);
  uint64_t v10 = DecodeBCD((const unsigned __int8 *)a3->var0 + 5, 1);

  return (id)[v4 dateWithYear:v5 month:v6 day:v7 hour:v8 minute:v9 second:v10];
}

+ (id)addAmount:(id *)a3 withCurrency:(id *)a4 usingAmountKey:(id)a5 usingCurrencyKey:(id)a6 usingExponentKey:(id)a7
{
  _OWORD v26[3] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (a3->var1)
  {
    __int16 v24 = 0;
    if (a4->var1
      && (+[ATLCurrency currencyCodeForNumber:DecodeBCD((const DERItem *)a4) exponentOut:&v24], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v15 = (__CFString *)v14;
      id v16 = [NSNumber numberWithShort:v24];
    }
    else
    {
      id v15 = @"XXX";
      id v16 = &unk_1F24E1A98;
    }
    int S32BE = ReadS32BE((const DERItem *)a3);
    if (S32BE >= 0) {
      uint64_t v18 = S32BE;
    }
    else {
      uint64_t v18 = -S32BE;
    }
    id v19 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v18 exponent:(__int16)-v24 isNegative:S32BE >> 31];
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA60];
    v25[0] = v11;
    v25[1] = v12;
    v26[0] = v19;
    v26[1] = v15;
    v25[2] = v13;
    v26[2] = v16;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    id v22 = [v20 dictionaryWithDictionary:v21];
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

+ (id)calculateTransactionSN:(id *)a3 withDeviceId:(id *)a4 withDeviceSN:(id *)a5
{
  +[HashHelper hashHelper]();
  uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addData:withLength:](v8, a3->var0, a3->var1);
  uint64_t v9 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addData:withLength:](v9, a4->var0, a4->var1);
  uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addData:withLength:](v10, a5->var0, a5->var1);
  id v11 = (char *)objc_claimAutoreleasedReturnValue();
  id v12 = -[HashHelper getHash](v11);

  id v13 = [NSNumber numberWithUnsignedInt:[v12 u32BE:0]];

  return v13;
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = ATLLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_ERROR, "MIFARE Hercules Decoder doesn't support getServiceProviderData", v21, 2u);
  }

  uint64_t v10 = [[NSString alloc] initWithFormat:@"MIFARE Hercules Decoder doesn't support getServiceProviderData"];
  id v11 = (void *)v10;
  if (a9)
  {
    id v12 = *a9;
    id v13 = (void *)MEMORY[0x1E4F28C58];
    if (*a9)
    {
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      v22[0] = *MEMORY[0x1E4F28568];
      v22[1] = v14;
      v23[0] = v10;
      v23[1] = v12;
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      id v16 = v23;
      uint64_t v17 = v22;
      uint64_t v18 = 2;
    }
    else
    {
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v25[0] = v10;
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      id v16 = v25;
      uint64_t v17 = &v24;
      uint64_t v18 = 1;
    }
    id v19 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
    *a9 = [v13 errorWithDomain:@"ATL" code:2 userInfo:v19];
  }
  return 0;
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "MIFARE Hercules Decoder doesn't support getServiceProviderData", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"MIFARE Hercules Decoder doesn't support getServiceProviderData"];
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
      id v15 = v22;
      id v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = v24;
      id v16 = &v23;
      uint64_t v17 = 1;
    }
    uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:2 userInfo:v18];
  }
  return 0;
}

@end