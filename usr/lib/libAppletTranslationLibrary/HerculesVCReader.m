@interface HerculesVCReader
+ (id)getBalanceForPass:(unint64_t)a3 withRiderClass:(unsigned __int8)a4 withTransitSummary:(id)a5 withRTAData:(id)a6 forCity:(id)a7 withError:(id *)a8;
+ (id)getCurrentTransitSummary:(id)a3 withError:(id *)a4;
+ (id)readBalancesFromVC:(id)a3 forCity:(id)a4 withError:(id *)a5;
@end

@implementation HerculesVCReader

+ (id)readBalancesFromVC:(id)a3 forCity:(id)a4 withError:(id *)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v67 = 0;
  v9 = +[MifareUtils getMcmDataDal:21071 withTransceiver:v7 withError:&v67];
  id v10 = v67;
  if (v10)
  {
    id v11 = v10;
    if (a5)
    {
      id v11 = v10;
      id v12 = 0;
      *a5 = v11;
      goto LABEL_53;
    }
    goto LABEL_20;
  }
  if ([v9 length] != 352)
  {
    v15 = ATLLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v9 length];
      *(_DWORD *)buf = 134217984;
      uint64_t v81 = v16;
      _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_ERROR, "Unexpected RTA Data length %lu", buf, 0xCu);
    }

    uint64_t v17 = [[NSString alloc] initWithFormat:@"Unexpected RTA Data length %lu", [v9 length]];
    v18 = (void *)v17;
    if (a5)
    {
      id v19 = *a5;
      v20 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v21 = *MEMORY[0x1E4F28A50];
        v76[0] = *MEMORY[0x1E4F28568];
        v76[1] = v21;
        v77[0] = v17;
        v77[1] = v19;
        v22 = (void *)MEMORY[0x1E4F1C9E8];
        v23 = v77;
        v24 = v76;
        uint64_t v25 = 2;
      }
      else
      {
        uint64_t v78 = *MEMORY[0x1E4F28568];
        uint64_t v79 = v17;
        v22 = (void *)MEMORY[0x1E4F1C9E8];
        v23 = &v79;
        v24 = &v78;
        uint64_t v25 = 1;
      }
      v28 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
      *a5 = [v20 errorWithDomain:@"ATL" code:3 userInfo:v28];
    }
    id v11 = 0;
LABEL_20:
    id v12 = 0;
    goto LABEL_53;
  }
  id v66 = 0;
  v13 = +[MifareUtils getMcmDataDal:21327 withTransceiver:v7 withError:&v66];
  id v14 = v66;
  if (v14)
  {
    id v11 = v14;
    if (a5)
    {
      id v11 = v14;
      id v12 = 0;
      *a5 = v11;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v65 = 0;
    v26 = +[HerculesVCReader getCurrentTransitSummary:v13 withError:&v65];
    id v27 = v65;
    if (v27)
    {
      id v11 = v27;
      if (a5)
      {
        id v11 = v27;
        id v12 = 0;
        *a5 = v11;
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      v62 = v26;
      id v29 = v26;
      uint64_t v30 = *(unsigned char *)([v29 bytes] + 15) & 3;
      if (v30 == 1)
      {
        v31 = (void *)MEMORY[0x1E4F1C9B8];
        id v32 = v9;
        [v31 dataWithReversedBytes:[v32 bytes] length:16];
        id v33 = objc_claimAutoreleasedReturnValue();
        uint64_t v34 = *(unsigned char *)([v33 bytes] + 15) & 3;
        v61 = v33;
        if (v34 == 1)
        {
          v60 = v13;
          uint64_t v35 = [v33 u8:7];
          v63 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
          uint64_t v36 = 0;
          while (1)
          {
            id v64 = 0;
            v37 = +[HerculesVCReader getBalanceForPass:v36 withRiderClass:v35 withTransitSummary:v29 withRTAData:v32 forCity:v8 withError:&v64];
            id v38 = v64;
            id v11 = v38;
            if (v38) {
              break;
            }
            if (v37) {
              [v63 addObject:v37];
            }

            if (++v36 == 6)
            {
              id v12 = v63;
              v63 = v12;
              goto LABEL_43;
            }
          }
          if (a5) {
            *a5 = v38;
          }

          id v12 = 0;
LABEL_43:
          v13 = v60;
        }
        else
        {
          v49 = ATLLogObject();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v81) = v34;
            _os_log_impl(&dword_1CA552000, v49, OS_LOG_TYPE_ERROR, "Unexpected Issue Object data format %hhu", buf, 8u);
          }

          v63 = [NSString initWithFormat:@"Unexpected Issue Object data format %hhu", v34];
          if (a5)
          {
            id v50 = *a5;
            v51 = (void *)MEMORY[0x1E4F28C58];
            if (*a5)
            {
              uint64_t v52 = *MEMORY[0x1E4F28A50];
              v68[0] = *MEMORY[0x1E4F28568];
              v68[1] = v52;
              v69[0] = v63;
              v69[1] = v50;
              v53 = (void *)MEMORY[0x1E4F1C9E8];
              v54 = (void **)v69;
              v55 = v68;
              uint64_t v56 = 2;
            }
            else
            {
              uint64_t v70 = *MEMORY[0x1E4F28568];
              v71 = v63;
              v53 = (void *)MEMORY[0x1E4F1C9E8];
              v54 = &v71;
              v55 = &v70;
              uint64_t v56 = 1;
            }
            v58 = [v53 dictionaryWithObjects:v54 forKeys:v55 count:v56];
            *a5 = [v51 errorWithDomain:@"ATL" code:3 userInfo:v58];
          }
          id v11 = 0;
          id v12 = 0;
        }
        v26 = v62;
      }
      else
      {
        v39 = ATLLogObject();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v81) = v30;
          _os_log_impl(&dword_1CA552000, v39, OS_LOG_TYPE_ERROR, "Unexpected Transit Summary data format %hhu", buf, 8u);
        }

        uint64_t v40 = [[NSString alloc] initWithFormat:@"Unexpected Transit Summary data format %hhu", v30];
        v41 = (void *)v40;
        if (a5)
        {
          id v42 = *a5;
          v43 = (void *)MEMORY[0x1E4F28C58];
          if (*a5)
          {
            uint64_t v44 = *MEMORY[0x1E4F28A50];
            v72[0] = *MEMORY[0x1E4F28568];
            v72[1] = v44;
            v73[0] = v40;
            v73[1] = v42;
            v45 = (void *)MEMORY[0x1E4F1C9E8];
            v46 = v73;
            v47 = v72;
            uint64_t v48 = 2;
          }
          else
          {
            uint64_t v74 = *MEMORY[0x1E4F28568];
            uint64_t v75 = v40;
            v45 = (void *)MEMORY[0x1E4F1C9E8];
            v46 = &v75;
            v47 = &v74;
            uint64_t v48 = 1;
          }
          v57 = [v45 dictionaryWithObjects:v46 forKeys:v47 count:v48];
          *a5 = [v43 errorWithDomain:@"ATL" code:3 userInfo:v57];
        }
        id v11 = 0;
        id v12 = 0;
        v26 = v62;
      }
    }
  }
LABEL_53:

  return v12;
}

+ (id)getCurrentTransitSummary:(id)a3 withError:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 length] == 32)
  {
    id v6 = v5;
    unsigned int v7 = *(unsigned __int8 *)([v6 bytes] + 13);
    unsigned int v8 = v7 >> 4;
    id v9 = v6;
    unsigned int v10 = *(unsigned __int8 *)([v9 bytes] + 29);
    unsigned int v11 = v10 >> 4;
    if (v7 >> 4 <= v10 >> 4) {
      unsigned int v12 = v10 >> 4;
    }
    else {
      unsigned int v12 = v7 >> 4;
    }
    if (v8 >= v10 >> 4) {
      unsigned int v13 = v10 >> 4;
    }
    else {
      unsigned int v13 = v7 >> 4;
    }
    id v14 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v15 = [v9 bytes];
    uint64_t v16 = v15;
    if (v13) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = v12 == 15;
    }
    if (v17)
    {
      if (v7 < 0x10)
      {
LABEL_21:
        v28 = [v14 dataWithReversedBytes:v16 length:16];
        goto LABEL_25;
      }
    }
    else if (v8 >= v11)
    {
      goto LABEL_21;
    }
    uint64_t v16 = v15 + 16;
    goto LABEL_21;
  }
  v18 = ATLLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v36 = [v5 length];
    _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_ERROR, "Unexpected Transit Summary length %lu", buf, 0xCu);
  }

  uint64_t v19 = [[NSString alloc] initWithFormat:@"Unexpected Transit Summary length %lu", [v5 length]];
  v20 = (void *)v19;
  if (a4)
  {
    id v21 = *a4;
    v22 = (void *)MEMORY[0x1E4F28C58];
    if (*a4)
    {
      uint64_t v23 = *MEMORY[0x1E4F28A50];
      v31[0] = *MEMORY[0x1E4F28568];
      v31[1] = v23;
      v32[0] = v19;
      v32[1] = v21;
      v24 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v25 = v32;
      v26 = v31;
      uint64_t v27 = 2;
    }
    else
    {
      uint64_t v33 = *MEMORY[0x1E4F28568];
      uint64_t v34 = v19;
      v24 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v25 = &v34;
      v26 = &v33;
      uint64_t v27 = 1;
    }
    id v29 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:v27];
    *a4 = [v22 errorWithDomain:@"ATL" code:3 userInfo:v29];
  }
  v28 = 0;
LABEL_25:

  return v28;
}

+ (id)getBalanceForPass:(unint64_t)a3 withRiderClass:(unsigned __int8)a4 withTransitSummary:(id)a5 withRTAData:(id)a6 forCity:(id)a7 withError:(id *)a8
{
  uint64_t v11 = a4;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v13;
  if ((*(char *)([v16 bytes] + 8 - a3) & 0x80000000) == 0
    || (unsigned int v17 = *(unsigned char *)([v16 bytes] + 8 - a3) & 0x3F, v17 == 63))
  {
    v18 = 0;
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1C9B8] dataWithReversedBytes:objc_msgSend(v14, "bytes") + 16 * a3 + 64 length:16];
  id v20 = objc_claimAutoreleasedReturnValue();
  uint64_t v21 = *(unsigned char *)([v20 bytes] + 15) & 3;
  if (v21 != 1)
  {
    id v29 = ATLLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v68 = v21;
      _os_log_impl(&dword_1CA552000, v29, OS_LOG_TYPE_ERROR, "Unexpected Pass Object data format %hhu", buf, 8u);
    }

    uint64_t v30 = [[NSString alloc] initWithFormat:@"Unexpected Pass Object data format %hhu", v21];
    v28 = (void *)v30;
    if (a8)
    {
      id v31 = *a8;
      id v32 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v33 = *MEMORY[0x1E4F28A50];
        v63[0] = *MEMORY[0x1E4F28568];
        v63[1] = v33;
        v64[0] = v30;
        v64[1] = v31;
        uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v35 = v64;
        uint64_t v36 = v63;
        uint64_t v37 = 2;
      }
      else
      {
        uint64_t v65 = *MEMORY[0x1E4F28568];
        uint64_t v66 = v30;
        uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v35 = &v66;
        uint64_t v36 = &v65;
        uint64_t v37 = 1;
      }
      uint64_t v40 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:v37];
      *a8 = [v32 errorWithDomain:@"ATL" code:3 userInfo:v40];
    }
    goto LABEL_21;
  }
  id v22 = v20;
  uint64_t v23 = *(unsigned __int8 *)([v22 bytes] + 14);
  id v24 = v22;
  uint64_t v25 = *(unsigned __int8 *)([v24 bytes] + 9);
  unsigned __int8 v56 = 0;
  id v55 = 0;
  uint64_t v26 = +[HerculesFareTables getProductIDWithTicketType:v25 withOperatorID:v23 withRiderClass:v11 forCity:v15 withProductCategory:&v56 withError:&v55];
  id v27 = v55;
  v28 = v27;
  if (!v27)
  {
    if (v56 == 1)
    {
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v39 = 0;
      id v38 = @"XXX";
    }
    else
    {
      if (v56 != 3)
      {
        v45 = ATLLogObject();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v68 = v56;
          _os_log_impl(&dword_1CA552000, v45, OS_LOG_TYPE_ERROR, "Unexpected product category %d", buf, 8u);
        }

        id v46 = [NSString alloc];
        uint64_t v47 = [v46 initWithFormat:v56];
        v41 = (void *)v47;
        if (!a8)
        {
          v18 = 0;
LABEL_34:

          goto LABEL_35;
        }
        id v48 = *a8;
        v49 = (void *)MEMORY[0x1E4F28C58];
        if (*a8)
        {
          uint64_t v50 = *MEMORY[0x1E4F28A50];
          v59[0] = *MEMORY[0x1E4F28568];
          v59[1] = v50;
          v60[0] = v47;
          v60[1] = v48;
          v51 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v52 = v60;
          v53 = v59;
          uint64_t v54 = 2;
        }
        else
        {
          uint64_t v61 = *MEMORY[0x1E4F28568];
          uint64_t v62 = v47;
          v51 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v52 = &v62;
          v53 = &v61;
          uint64_t v54 = 1;
        }
        id v42 = [v51 dictionaryWithObjects:v52 forKeys:v53 count:v54];
        [v49 errorWithDomain:@"ATL" code:3 userInfo:v42];
        v18 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

        goto LABEL_34;
      }
      unsigned int v17 = bswap32(*(_DWORD *)([v24 bytes] + 10)) >> 13;
      id v38 = @"USD";
      uint64_t v39 = 2;
    }
    v57[0] = @"Balance";
    v58[0] = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v17 exponent:-(int)v39 isNegative:0];
    v58[1] = v38;
    v41 = (void *)v58[0];
    v57[1] = @"BalanceCurrency";
    v57[2] = @"BalanceCurrencyExponent";
    id v42 = [NSNumber numberWithShort:v39];
    v58[2] = v42;
    v57[3] = @"BalanceIdentifier";
    v43 = [MEMORY[0x1E4F1C9B8] dataWithIntBE:v26];
    uint64_t v44 = [v43 asHexString];
    v58[3] = v44;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:4];

    goto LABEL_33;
  }
  if (!a8)
  {
LABEL_21:
    v18 = 0;
    goto LABEL_35;
  }
  v18 = 0;
  *a8 = v27;
LABEL_35:

LABEL_4:

  return v18;
}

@end