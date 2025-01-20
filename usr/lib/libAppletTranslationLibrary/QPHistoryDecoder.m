@interface QPHistoryDecoder
+ (id)generateEndEventFromHCI:(id)a3 withTransceiver:(id)a4;
+ (id)getDPAN:(id)a3;
+ (id)getTransactionAmount:(id)a3;
+ (id)getTransactionDate:(id)a3;
+ (id)parseQuickPayHistoryBlocks:(id)a3;
+ (unsigned)getATC:(id)a3;
+ (unsigned)getExpirationDate:(id)a3;
+ (unsigned)getHistoryNumber:(id)a3;
+ (unsigned)getTypeOfUse:(id)a3;
@end

@implementation QPHistoryDecoder

+ (id)getTransactionDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    v5 = [v3 decodeBCDAtOffset:0 length:2];
    v6 = [v3 decodeBCDAtOffset:2 length:1];
    v7 = [v3 decodeBCDAtOffset:3 length:1];
    [v4 setDay:[v7 intValue]];
    [v4 setMonth:[v6 intValue]];
    [v4 setYear:[v5 intValue]];
  }
  else
  {
    v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction date for QuicPay, invalid block: %@", (uint8_t *)&v10, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

+ (id)getTransactionAmount:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    id v4 = (unsigned __int8 *)[v3 bytes];
    v5 = [NSNumber numberWithUnsignedInt:(v4[13] << 16) | (v4[14] << 8) | v4[15]];
  }
  else
  {
    v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction amount for QuicPay, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (unsigned)getTypeOfUse:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    int v4 = *(unsigned __int8 *)([v3 bytes] + 4) >> 4;
    switch(v4)
    {
      case 1:
        LOWORD(v4) = 241;
        break;
      case 2:
        LOWORD(v4) = 240;
        break;
      case 4:
        LOWORD(v4) = 74;
        break;
    }
    unsigned __int16 v6 = (_WORD)v4 << 8;
  }
  else
  {
    v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get the type of use for QuicPay, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    unsigned __int16 v6 = 0;
  }

  return v6;
}

+ (unsigned)getHistoryNumber:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    LODWORD(v4) = bswap32(*(unsigned __int16 *)([v3 bytes] + 11)) >> 16;
  }
  else
  {
    int v4 = ATLLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the hisotry number for QuicPay, invalid block: %@", (uint8_t *)&v6, 0xCu);
    }

    LOWORD(v4) = 0;
  }

  return (unsigned __int16)v4;
}

+ (id)getDPAN:(id)a3
{
  return (id)[a3 subdataWithRange:0, 10];
}

+ (id)parseQuickPayHistoryBlocks:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    int v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = [v5 objectAtIndexedSubscript:0];
    if (+[SlalomUtils isValidFelicaBlock:v7])
    {
      uint64_t v8 = [a1 getTransactionDate:v7];
      id v9 = [a1 getTransactionAmount:v7];
      unsigned int v10 = [a1 getTypeOfUse:v7];
      [v6 setObject:v8 forKeyedSubscript:@"NFTransactionDate"];
      [v6 setObject:v9 forKeyedSubscript:@"NFAmount"];
      [v6 setObject:&unk_1F24E2440 forKeyedSubscript:@"NFAmountType"];
      id v11 = [NSNumber numberWithUnsignedChar:v10 >> 8];
      [v6 setObject:v11 forKeyedSubscript:@"NFTransactionType"];

      [v6 setObject:&unk_1F24E2458 forKeyedSubscript:@"NFSectorCombination"];
      uint64_t v12 = [a1 getHistoryNumber:v7];
      v13 = [NSNumber numberWithUnsignedInt:v12];
      [v6 setObject:v13 forKeyedSubscript:@"NFHistorySequenceNumber"];

      v14 = v6;
    }
    else
    {
      uint64_t v8 = ATLLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_DEFAULT, "the array contains an empty block", v16, 2u);
      }
      v14 = 0;
    }
  }
  else
  {
    int v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "the array of block does not contain block entry", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)generateEndEventFromHCI:(id)a3 withTransceiver:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      v43 = "No transceiver provided";
      goto LABEL_29;
    }
LABEL_30:
    v44 = 0;
    goto LABEL_65;
  }
  if (!v6 || ![v6 count])
  {
    uint64_t v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      v43 = "HCI Array provided does not contain HCI events";
LABEL_29:
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_DEFAULT, v43, md, 2u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:&unk_1F24E2470 forKeyedSubscript:@"NFServiceProviderID"];
  uint64_t v9 = FelicaGetDataFileSystemCommand(13771, 4);
  if (v9)
  {
    unsigned int v10 = v9;
    id v11 = [v7 transceiveAndCheckSW:v9 error:0];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = FeliCaGetBlockDataFromGetDataCommand(v11);
      if (v13)
      {
        v14 = (void *)v13;
        v62 = v10;
        v60 = v12;
        id v15 = [a1 getDPAN:v13];
        uint64_t v57 = *(void *)([v15 bytes] + 2);
        v16 = [v15 asHexString];
        v63 = v8;
        [v8 setObject:v16 forKeyedSubscript:@"NFDPAN"];

        id v58 = a1;
        v61 = v14;
        __int16 v56 = [a1 getExpirationDate:v14];

        v65 = [MEMORY[0x1E4F1CA48] array];
        v64 = [MEMORY[0x1E4F1CA48] array];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v59 = v6;
        id v17 = v6;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v66 objects:v77 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v67 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              v23 = [v22 objectForKeyedSubscript:@"EventType"];

              if (v23 == @"TransactionEvent")
              {
                v24 = [v22 objectForKeyedSubscript:@"parsedInfo"];
                v25 = [v24 objectForKeyedSubscript:@"OPWrite"];
                v26 = [v24 objectForKeyedSubscript:@"OPRead"];
                if ([v25 count]) {
                  [v65 addObject:v25];
                }
                if ([v26 count]) {
                  [v64 addObject:v26];
                }
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v66 objects:v77 count:16];
          }
          while (v19);
        }

        uint64_t v27 = [v65 count];
        if (v27)
        {
          unsigned int v10 = FelicaGetDataFileSystemCommand(13839, 0);

          if (v10)
          {
            v28 = [v7 transceiveAndCheckSW:v10 error:0];

            uint64_t v8 = v63;
            if (v28)
            {
              v29 = FeliCaGetBlockDataFromGetDataCommand(v28);

              if (v29)
              {
                id v30 = v29;
                uint64_t v31 = [v30 bytes];
                __int16 v32 = *(_WORD *)(v31 + 13);
                uint64_t v33 = v27;
                char v34 = *(unsigned char *)(v31 + 15);
                int v35 = *(_DWORD *)v31;
                id v76 = v30;
                v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
                v37 = +[QPHistoryDecoder parseQuickPayHistoryBlocks:v36];

                [v63 addEntriesFromDictionary:v37];
                uint64_t data = v57;
                __int16 v73 = v32;
                char v74 = v34;
                int v75 = v35;
                uint64_t v8 = v63;
                CC_SHA256(&data, 0xFu, md);
                v38 = [MEMORY[0x1E4F1CA58] dataWithBytes:md length:32];
                v39 = [v38 asHexString];
                [v63 setObject:v39 forKeyedSubscript:@"NFTransactionID"];

                unsigned int v40 = [v58 getTypeOfUse:v30];
                LOBYTE(v39) = v40;
                v41 = [NSNumber numberWithUnsignedChar:v40 >> 8];
                [v63 setObject:v41 forKeyedSubscript:@"NFTransactionType"];

                uint64_t v27 = v33;
                v42 = [NSNumber numberWithUnsignedChar:v39];
                [v63 setObject:v42 forKeyedSubscript:@"NFSectorCombination"];

LABEL_44:
                id v6 = v59;
LABEL_63:
                v54 = [NSNumber numberWithBool:v27 == 0];
                [v8 setObject:v54 forKeyedSubscript:@"readOnly"];

                v44 = v8;
                goto LABEL_64;
              }
LABEL_51:
              id v6 = v59;
              v50 = ATLLogObject();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)md = 138412290;
                *(void *)&md[4] = 0;
                v51 = "QP block is unexpected (Sercice 360F block 0): %@";
LABEL_61:
                _os_log_impl(&dword_1CA552000, v50, OS_LOG_TYPE_DEFAULT, v51, md, 0xCu);
                goto LABEL_62;
              }
              goto LABEL_62;
            }
          }
          else
          {
            v48 = ATLLogObject();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)md = 138412290;
              *(void *)&md[4] = 0;
              _os_log_impl(&dword_1CA552000, v48, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
            }

            uint64_t v8 = v63;
          }
          v49 = ATLLogObject();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)md = 138412290;
            *(void *)&md[4] = 0;
            _os_log_impl(&dword_1CA552000, v49, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
          }

          v28 = 0;
          goto LABEL_51;
        }
        unsigned int v10 = FelicaGetDataFileSystemCommand(13771, 6);

        if (v10)
        {
          v28 = [v7 transceiveAndCheckSW:v10 error:0];

          if (v28)
          {
            FeliCaGetBlockDataFromGetDataCommand(v28);
            id v30 = (id)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              uint64_t data = v57;
              __int16 v47 = [v58 getATC:v30];
              LOBYTE(v73) = HIBYTE(v47);
              HIBYTE(v73) = v47;
              char v74 = HIBYTE(v56);
              LOBYTE(v75) = v56;
              *(_OWORD *)md = 0u;
              long long v71 = 0u;
              CC_SHA256(&data, 0xCu, md);
              v37 = [MEMORY[0x1E4F1CA58] dataWithBytes:md length:32];
              v38 = [v37 asHexString];
              uint64_t v8 = v63;
              [v63 setObject:v38 forKeyedSubscript:@"NFTransactionID"];
              goto LABEL_44;
            }
LABEL_59:
            id v6 = v59;
            uint64_t v8 = v63;
            v50 = ATLLogObject();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)md = 138412290;
              *(void *)&md[4] = 0;
              v51 = "QP block is unexpected (Sercice 408C block 0): %@";
              goto LABEL_61;
            }
LABEL_62:

            id v30 = 0;
            goto LABEL_63;
          }
        }
        else
        {
          v52 = ATLLogObject();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)md = 138412290;
            *(void *)&md[4] = 0;
            _os_log_impl(&dword_1CA552000, v52, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
          }
        }
        v53 = ATLLogObject();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)md = 138412290;
          *(void *)&md[4] = 0;
          _os_log_impl(&dword_1CA552000, v53, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
        }

        v28 = 0;
        goto LABEL_59;
      }
      v46 = ATLLogObject();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)md = 138412290;
        *(void *)&md[4] = 0;
        _os_log_impl(&dword_1CA552000, v46, OS_LOG_TYPE_DEFAULT, "QP block is unexpected (Sercice 35CB block 4): %@", md, 0xCu);
      }
    }
    else
    {
      v45 = ATLLogObject();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)md = 138412290;
        *(void *)&md[4] = 0;
        _os_log_impl(&dword_1CA552000, v45, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
      }
    }
  }
  else
  {
    unsigned int v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)md = 138412290;
      *(void *)&md[4] = 0;
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
    }
  }
  v44 = 0;
LABEL_64:

LABEL_65:

  return v44;
}

+ (unsigned)getATC:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    LODWORD(v4) = bswap32(*(unsigned __int16 *)([v3 bytes] + 4)) >> 16;
  }
  else
  {
    id v4 = ATLLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the ATC for QuicPay, invalid block: %@", (uint8_t *)&v6, 0xCu);
    }

    LOWORD(v4) = 0;
  }

  return (unsigned __int16)v4;
}

+ (unsigned)getExpirationDate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    LODWORD(v4) = bswap32(*(unsigned __int16 *)([v3 bytes] + 13)) >> 16;
  }
  else
  {
    id v4 = ATLLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the expiration date for QuicPay, invalid block: %@", (uint8_t *)&v6, 0xCu);
    }

    LOWORD(v4) = 0;
  }

  return (unsigned __int16)v4;
}

@end