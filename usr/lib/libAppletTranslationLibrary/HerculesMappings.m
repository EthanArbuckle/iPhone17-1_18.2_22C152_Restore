@interface HerculesMappings
+ (BOOL)supportsPlasticCardMode:(id)a3;
+ (id)addBalancesFromVC:(id)a3 withTransceiver:(id)a4 forCity:(id)a5 withError:(id *)a6;
+ (id)getStationCode:(id)a3 withTransitInformation:(id)a4 forCity:(id)a5;
+ (id)getStationMode:(id)a3 forCity:(id)a4;
+ (id)getTransitModality:(id)a3 forCity:(id)a4;
+ (id)mergeTaps:(id)a3 forCity:(id)a4 outEnRoute:(id *)a5;
+ (id)processEnRouteStatus:(id)a3 forTransitInformation:(id)a4 forCity:(id)a5;
@end

@implementation HerculesMappings

+ (id)getStationCode:(id)a3 withTransitInformation:(id)a4 forCity:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([a5 intValue] == 5)
  {
    uint64_t v9 = [v8 u8:0];
    uint64_t v10 = [v8 u16BE:1];
    [MEMORY[0x1E4F1CA58] dataWithCapacity:[v7 length] + 3];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v11 appendShortBE:v10];
    [v11 appendByte:v9];
    [v11 appendData:v7];
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

+ (id)getStationMode:(id)a3 forCity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 u8:3];
  int v8 = [v6 intValue];

  uint64_t v9 = @"StartStation";
  if (v8 == 1)
  {
    if (v7 == 2 || v7 == 12) {
      uint64_t v9 = @"EndStation";
    }
  }
  else if (v8 == 7 && [v5 u16BE:1] == 4 && (v7 - 64) < 4u)
  {
    uint64_t v9 = off_1E65AE4A0[(char)(v7 - 64)];
  }

  return v9;
}

+ (id)getTransitModality:(id)a3 forCity:(id)a4
{
  id v5 = a3;
  int v6 = [a4 intValue];
  if (v6 != 1)
  {
    if (v6 == 5)
    {
      LOBYTE(v7) = [v5 u8:0] - 1;
      if (v7 < 4u)
      {
        uint64_t v7 = (char)v7;
        int v8 = off_1E65AE4E8;
        goto LABEL_12;
      }
    }
    else if (v6 == 7)
    {
      LODWORD(v7) = [v5 u8:0] - 2;
      if (v7 < 5)
      {
        uint64_t v7 = (char)v7;
        int v8 = off_1E65AE4C0;
LABEL_12:
        uint64_t v10 = v8[v7];
        goto LABEL_21;
      }
    }
LABEL_20:
    uint64_t v10 = @"Transit";
    goto LABEL_21;
  }
  unsigned int v9 = [v5 u16BE:1];
  if (v9 > 0x3D) {
    goto LABEL_15;
  }
  if (((1 << v9) & 0x2008020000200044) != 0) {
    goto LABEL_17;
  }
  if (((1 << v9) & 0x400038) == 0)
  {
    if (v9 == 23)
    {
      uint64_t v10 = @"PurchaseAdmissionParking";
      goto LABEL_21;
    }
LABEL_15:
    uint64_t v11 = v9 - 81;
    if (v11 <= 0x3C)
    {
      if (((1 << (v9 - 81)) & 0x1000010040100401) != 0) {
        goto LABEL_17;
      }
      if (v11 == 50) {
        goto LABEL_9;
      }
    }
    if (v9 != 71) {
      goto LABEL_20;
    }
LABEL_17:
    uint64_t v10 = @"TransitBus";
    goto LABEL_21;
  }
LABEL_9:
  uint64_t v10 = @"TransitTrain";
LABEL_21:

  return v10;
}

+ (id)processEnRouteStatus:(id)a3 forTransitInformation:(id)a4 forCity:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v8 u8:3];
  int v11 = [v9 intValue];

  if (v11 == 1)
  {
    switch(v10)
    {
      case 1:
      case 11:
        goto LABEL_8;
      case 2:
      case 12:
        goto LABEL_9;
      case 9:
        goto LABEL_11;
      default:
        break;
    }
  }
  else if (v11 == 7 && [v8 u16BE:1] == 4)
  {
    if ((v10 - 63) > 4)
    {
      if ((v10 - 61) > 1) {
        goto LABEL_14;
      }
LABEL_11:
      v12 = @"Cancel";
    }
    else
    {
      if (((1 << (v10 - 63)) & 0x16) == 0)
      {
LABEL_8:
        [v7 setObject:@"Start" forKeyedSubscript:@"InternalEnRouteStatus"];
        v12 = @"EnRoute";
        v13 = @"IgnoreReason";
LABEL_13:
        [v7 setObject:v12 forKeyedSubscript:v13];
        goto LABEL_14;
      }
LABEL_9:
      v12 = @"End";
    }
    v13 = @"InternalEnRouteStatus";
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

+ (id)mergeTaps:(id)a3 forCity:(id)a4 outEnRoute:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v6 = 0;
    char v7 = 1;
    do
    {
      id v8 = [v5 objectAtIndexedSubscript:v6];
      id v9 = [v8 objectForKeyedSubscript:@"InternalEnRouteStatus"];
      if (v9)
      {
        if ((v7 & 1) != 0
          && (([@"Start" isEqualToString:v9] & 1) != 0
           || [@"Transfer" isEqualToString:v9]))
        {
          *a5 = [v8 objectForKeyedSubscript:@"TypeDetail"];
        }
        if ([@"End" isEqualToString:v9])
        {
          uint64_t v10 = v6 + 1;
          if (v6 + 1 < (unint64_t)[v5 count])
          {
            while (1)
            {
              int v11 = [v5 objectAtIndexedSubscript:v10];
              uint64_t v12 = [v11 objectForKeyedSubscript:@"InternalEnRouteStatus"];
              if (v12) {
                break;
              }

              if (++v10 >= (unint64_t)[v5 count])
              {
                char v7 = 0;
                uint64_t v10 = v6;
                goto LABEL_15;
              }
            }
            v13 = (void *)v12;
            if (([@"End" isEqualToString:v12] & 1) == 0
              && ([@"Cancel" isEqualToString:v13] & 1) == 0)
            {
              v14 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
              [v14 setObject:@"Merged" forKeyedSubscript:@"IgnoreReason"];
              [v5 setObject:v14 atIndexedSubscript:v10];
              [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
              v23 = v22 = v14;
              uint64_t v15 = [v14 objectForKeyedSubscript:@"StartStation"];
              if (v15) {
                [v23 setObject:v15 forKeyedSubscript:@"StartStation"];
              }
              v21 = (void *)v15;
              [v23 setObject:v22 forKeyedSubscript:@"MergedStartRecord"];
              [v5 setObject:v23 atIndexedSubscript:v6];
              v16 = ATLLogObject();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                v17 = [v22 objectForKeyedSubscript:@"SerialNumber"];
                uint64_t v18 = [v23 objectForKeyedSubscript:@"SerialNumber"];
                *(_DWORD *)buf = 67109890;
                int v26 = v10;
                __int16 v27 = 2112;
                v28 = v17;
                __int16 v29 = 1024;
                int v30 = v6;
                __int16 v31 = 2112;
                uint64_t v32 = v18;
                v19 = (void *)v18;
                _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_DEFAULT, "Merged events %u (SN %@) --> %u (SN %@)", buf, 0x22u);
              }
            }

            char v7 = 0;
            goto LABEL_15;
          }
        }
        char v7 = 0;
      }
      uint64_t v10 = v6;
LABEL_15:

      uint64_t v6 = v10 + 1;
    }
    while (v10 + 1 < (unint64_t)[v5 count]);
  }

  return v5;
}

+ (id)addBalancesFromVC:(id)a3 withTransceiver:(id)a4 forCity:(id)a5 withError:(id *)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v11 intValue] | 4) == 5)
  {
    id v47 = 0;
    uint64_t v12 = +[HerculesVCReader readBalancesFromVC:v10 forCity:v11 withError:&v47];
    id v13 = v47;
    if (v13 && +[AppletTranslator isInternalBuild]())
    {
      id v14 = 0;
      if (a6) {
        *a6 = v13;
      }
    }
    else
    {
      id v37 = v11;
      id v38 = v10;
      uint64_t v15 = (void *)[v9 mutableCopy];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = v12;
      uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v44;
        id v39 = v9;
        v40 = v15;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v44 != v18) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __72__HerculesMappings_addBalancesFromVC_withTransceiver_forCity_withError___block_invoke;
            v42[3] = &unk_1E65AE480;
            v42[4] = v20;
            v21 = Find(v9, v42);
            if (v21)
            {
              if (+[AppletTranslator isInternalBuild]() && ([v20 isEqual:v21] & 1) == 0)
              {
                v24 = ATLLogObject();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v53 = v20;
                  __int16 v54 = 2112;
                  v55 = v21;
                  _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Found a balance discrepancy %@ %@", buf, 0x16u);
                }

                uint64_t v26 = [[NSString alloc] initWithFormat:@"Found a balance discrepancy %@ %@", v20, v21];
                __int16 v27 = (void *)v26;
                id v11 = v37;
                id v10 = v38;
                if (a6)
                {
                  id v28 = *a6;
                  __int16 v29 = (void *)MEMORY[0x1E4F28C58];
                  if (*a6)
                  {
                    uint64_t v30 = *MEMORY[0x1E4F28A50];
                    v48[0] = *MEMORY[0x1E4F28568];
                    v48[1] = v30;
                    v49[0] = v26;
                    v49[1] = v28;
                    __int16 v31 = (void *)MEMORY[0x1E4F1C9E8];
                    uint64_t v32 = v49;
                    uint64_t v33 = v48;
                    uint64_t v34 = 2;
                  }
                  else
                  {
                    uint64_t v50 = *MEMORY[0x1E4F28568];
                    uint64_t v51 = v26;
                    __int16 v31 = (void *)MEMORY[0x1E4F1C9E8];
                    uint64_t v32 = &v51;
                    uint64_t v33 = &v50;
                    uint64_t v34 = 1;
                  }
                  v35 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];
                  *a6 = [v29 errorWithDomain:@"ATL" code:3 userInfo:v35];

                  uint64_t v15 = v40;
                }

                id v14 = 0;
                id v9 = v39;
                goto LABEL_31;
              }
            }
            else
            {
              v22 = ATLLogObject();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = [v20 objectForKeyedSubscript:@"BalanceIdentifier"];
                *(_DWORD *)buf = 138412290;
                v53 = v23;
                _os_log_impl(&dword_1CA552000, v22, OS_LOG_TYPE_DEFAULT, "Adding missing balance %@", buf, 0xCu);

                id v9 = v39;
              }

              uint64_t v15 = v40;
              [v40 addObject:v20];
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v14 = v15;
      id v11 = v37;
      id v10 = v38;
LABEL_31:
    }
  }
  else
  {
    id v14 = v9;
  }

  return v14;
}

uint64_t __72__HerculesMappings_addBalancesFromVC_withTransceiver_forCity_withError___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"BalanceIdentifier"];
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"BalanceIdentifier"];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (BOOL)supportsPlasticCardMode:(id)a3
{
  return [a3 intValue] == 7;
}

@end