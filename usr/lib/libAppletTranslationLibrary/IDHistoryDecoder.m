@interface IDHistoryDecoder
+ (id)generateEndEventFromHCI:(id)a3 withTransceiver:(id)a4;
+ (id)getDPAN:(id)a3;
+ (id)getExpirationDate:(id)a3;
+ (id)getTransactionAmount:(id)a3;
+ (id)getTransactionDate:(id)a3;
+ (id)parseIDHistoryBlocks:(id)a3;
+ (unsigned)getHistoryNumber:(id)a3;
+ (unsigned)getTypeOfUse:(id)a3;
@end

@implementation IDHistoryDecoder

+ (id)getTransactionDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    v5 = [v3 decodeBCDAtOffset:13 length:1];
    v6 = [v3 decodeBCDAtOffset:14 length:1];
    v7 = [v3 decodeBCDAtOffset:15 length:1];
    [v4 setDay:([v5 intValue]);
    [v4 setMonth:[v6 intValue]];
    [v4 setYear:((int)[v7 intValue] + 2000)];
  }
  else
  {
    v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction date for ID, invalid block: %@", (uint8_t *)&v10, 0xCu);
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
    id v4 = (unsigned char *)[v3 bytes];
    LOBYTE(v8) = v4[11];
    BYTE1(v8) = v4[10];
    BYTE2(v8) = v4[9];
    v5 = [NSNumber numberWithUnsignedLongLong:DecodeBCD((const unsigned __int8 *)&v8, 3)];
  }
  else
  {
    v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction amount for ID, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (unsigned)getTypeOfUse:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    uint64_t v4 = [v3 bytes];
    int v5 = *(unsigned __int8 *)(v4 + 3);
    if (v5 == 32)
    {
      unsigned __int16 v6 = 18944;
    }
    else if (v5 == 16)
    {
      unsigned __int16 v6 = -4096;
    }
    else
    {
      NSLog(&cfstr_UnknownIdTypeO.isa, *(unsigned __int8 *)(v4 + 3));
      unsigned __int16 v6 = (_WORD)v5 << 8;
    }
  }
  else
  {
    v7 = ATLLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction type of use for ID, invalid block: %@", buf, 0xCu);
    }

    unsigned __int16 v6 = 0;
  }

  return v6;
}

+ (unsigned)getHistoryNumber:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    uint64_t v4 = [v3 bytes];
    unsigned __int16 v5 = *(unsigned __int8 *)(v4 + 2) | (*(unsigned __int8 *)(v4 + 13) << 8);
  }
  else
  {
    unsigned __int16 v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the history number for ID, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    unsigned __int16 v5 = 0;
  }

  return v5;
}

+ (id)getDPAN:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    uint64_t v4 = (char *)[v3 bytes];
    unsigned __int16 v5 = malloc_type_calloc(1uLL, 0x10uLL, 0x65AF33C5uLL);
    unsigned __int16 v6 = v5;
    for (uint64_t i = 15; i != -1; --i)
    {
      char v8 = *v4++;
      *((unsigned char *)v5 + i) = v8;
    }
    id v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:16];
    free(v6);
  }
  else
  {
    uint64_t v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get the DPAN for ID, invalid block: %@", (uint8_t *)&v12, 0xCu);
    }

    id v9 = 0;
  }

  return v9;
}

+ (id)parseIDHistoryBlocks:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = v4;
  if (v4 && [v4 count])
  {
    unsigned __int16 v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = [v5 objectAtIndexedSubscript:0];
    if (+[SlalomUtils isValidFelicaBlock:v7])
    {
      char v8 = [a1 getTransactionDate:v7];
      id v9 = [a1 getTransactionAmount:v7];
      uint64_t v10 = [a1 getHistoryNumber:v7];
      [v6 setObject:v8 forKeyedSubscript:@"NFTransactionDate"];
      [v6 setObject:v9 forKeyedSubscript:@"NFAmount"];
      [v6 setObject:&unk_1F24E1AB0 forKeyedSubscript:@"NFAmountType"];
      [v6 setObject:&unk_1F24E1AC8 forKeyedSubscript:@"NFSectorCombination"];
      uint64_t v11 = [NSNumber numberWithUnsignedInt:v10];
      [v6 setObject:v11 forKeyedSubscript:@"NFHistorySequenceNumber"];

      id v12 = v6;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_TheArrayOfBloc.isa);
    id v12 = 0;
  }

  return v12;
}

+ (id)getExpirationDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    v4.i32[0] = *(_DWORD *)([v3 bytes] + 12);
    int16x8_t v5 = (int16x8_t)vmovl_u8(v4);
    *(int16x4_t *)v5.i8 = vrev64_s16(*(int16x4_t *)v5.i8);
    unsigned __int32 v9 = vmovn_s16(v5).u32[0];
    unsigned __int16 v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v9 length:4];
  }
  else
  {
    v7 = ATLLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int32 v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get the expiration date for ID, invalid block: %@", (uint8_t *)&v9, 0xCu);
    }

    unsigned __int16 v6 = 0;
  }

  return v6;
}

+ (id)generateEndEventFromHCI:(id)a3 withTransceiver:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    char v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      v38 = "No transceiver provided";
      goto LABEL_29;
    }
LABEL_30:
    v39 = 0;
    goto LABEL_75;
  }
  if (!v6 || ![v6 count])
  {
    char v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      v38 = "HCI Array provided does not contain HCI events";
LABEL_29:
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_DEFAULT, v38, md, 2u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  char v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:&unk_1F24E1AB0 forKeyedSubscript:@"NFServiceProviderID"];
  uint64_t v9 = FelicaGetDataFileSystemCommand(16587, 1);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = [v7 transceiveAndCheckSW:v9 error:0];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = FeliCaGetBlockDataFromGetDataCommand(v11);
      if (!v13)
      {
        v26 = ATLLogObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)md = 138412290;
          uint64_t v76 = 0;
          _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_DEFAULT, "ID block is unexpected (Sercice 40CB block 1): %@", md, 0xCu);
        }
        v39 = 0;
        goto LABEL_73;
      }
      v64 = v12;
      v65 = v10;
      v66 = v13;
      v67 = v7;
      id v62 = a1;
      [a1 getDPAN:];
      id v14 = objc_claimAutoreleasedReturnValue();
      long long v82 = *(_OWORD *)[v14 bytes];
      v15 = [v14 asHexString];
      v68 = v8;
      [v8 setObject:v15 forKeyedSubscript:@"NFDPAN"];

      v70 = [MEMORY[0x1E4F1CA48] array];
      v69 = [MEMORY[0x1E4F1CA48] array];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v63 = v6;
      id v16 = v6;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v71 objects:v81 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v72 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            v22 = [v21 objectForKeyedSubscript:@"EventType"];

            if (v22 == @"TransactionEvent")
            {
              v23 = [v21 objectForKeyedSubscript:@"parsedInfo"];
              v24 = [v23 objectForKeyedSubscript:@"OPWrite"];
              v25 = [v23 objectForKeyedSubscript:@"OPRead"];
              if ([v24 count]) {
                [v70 addObject:v24];
              }
              if ([v25 count]) {
                [v69 addObject:v25];
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v71 objects:v81 count:16];
        }
        while (v18);
      }

      v26 = v70;
      uint64_t v27 = [v70 count];
      if (!v27)
      {
        id v10 = FelicaGetDataFileSystemCommand(16587, 2);

        id v7 = v67;
        char v8 = v68;
        v41 = v66;
        if (v10)
        {
          id v12 = [v67 transceiveAndCheckSW:v10 error:0];

          id v6 = v63;
          if (v12)
          {
            uint64_t v42 = FeliCaGetBlockDataFromGetDataCommand(v12);

            if (!v42)
            {
LABEL_72:
              v60 = [NSNumber numberWithBool:v27 == 0];
              [v8 setObject:v60 forKeyedSubscript:@"readOnly"];

              v39 = v8;
LABEL_73:

              goto LABEL_74;
            }
            v43 = [v62 getExpirationDate:v42];
            long long data = v82;
            __int16 v78 = 0;
            id v44 = v43;
            int v79 = *(_DWORD *)[v44 bytes];
            CC_SHA256(&data, 0x16u, md);
            v45 = [MEMORY[0x1E4F1CA58] dataWithBytes:md length:16];
            v46 = [v45 asHexString];
            [v68 setObject:v46 forKeyedSubscript:@"NFTransactionID"];

            id v7 = v67;
            v26 = v70;

            uint64_t v27 = 0;
            v41 = v42;
LABEL_71:

            goto LABEL_72;
          }
        }
        else
        {
          v58 = ATLLogObject();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)md = 138412290;
            uint64_t v76 = 0;
            _os_log_impl(&dword_1CA552000, v58, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
          }

          id v6 = v63;
        }
        v59 = ATLLogObject();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)md = 138412290;
          uint64_t v76 = 0;
          _os_log_impl(&dword_1CA552000, v59, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
        }

        id v12 = 0;
        goto LABEL_71;
      }
      v28 = FelicaGetDataFileSystemCommand(16527, 0);

      id v7 = v67;
      if (v28)
      {
        v29 = [v67 transceiveAndCheckSW:v28 error:0];

        if (v29)
        {
          v30 = FeliCaGetBlockDataFromGetDataCommand(v29);

          if (v30)
          {
            uint64_t v31 = v27;
            v80 = v30;
            v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
            v33 = +[IDHistoryDecoder parseIDHistoryBlocks:v32];

            [v68 addEntriesFromDictionary:v33];
            id v34 = v30;
            v35 = (unsigned char *)[v34 bytes];
            long long data = v82;
            LOBYTE(v78) = v35[11];
            HIBYTE(v78) = v35[10];
            LOBYTE(v79) = v35[9];
            BYTE1(v79) = v35[15];
            BYTE2(v79) = v35[14];
            HIBYTE(v79) = v35[13];
            CC_SHA256(&data, 0x16u, md);
            v36 = [MEMORY[0x1E4F1CA58] dataWithBytes:md length:16];
            v37 = [v36 asHexString];
            v26 = v70;
            [v68 setObject:v37 forKeyedSubscript:@"NFTransactionID"];

            uint64_t v27 = v31;
            id v6 = v63;
            goto LABEL_53;
          }
LABEL_50:
          id v6 = v63;
          v33 = ATLLogObject();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)md = 138412290;
            uint64_t v76 = 0;
            _os_log_impl(&dword_1CA552000, v33, OS_LOG_TYPE_DEFAULT, "ID block is unexpected (Sercice 408F block 0): %@", md, 0xCu);
          }
          id v34 = 0;
LABEL_53:

          id v10 = FelicaGetDataFileSystemCommand(16524, 0);

          if (v10)
          {
            id v12 = [v67 transceiveAndCheckSW:v10 error:0];

            if (v12)
            {
              uint64_t v49 = FeliCaGetBlockDataFromGetDataCommand(v12);

              if (v49)
              {
                v41 = v49;
                unsigned int v50 = [v62 getTypeOfUse:v49];
                unsigned __int8 v51 = v50;
                [NSNumber numberWithUnsignedChar:v50 >> 8];
                v52 = v10;
                v54 = uint64_t v53 = v27;
                char v8 = v68;
                [v68 setObject:v54 forKeyedSubscript:@"NFTransactionType"];

                uint64_t v27 = v53;
                id v10 = v52;
                v55 = [NSNumber numberWithUnsignedChar:v51];
                [v68 setObject:v55 forKeyedSubscript:@"NFSectorCombination"];

                goto LABEL_71;
              }
LABEL_63:
              char v8 = v68;
              v41 = ATLLogObject();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)md = 138412290;
                uint64_t v76 = 0;
                _os_log_impl(&dword_1CA552000, v41, OS_LOG_TYPE_DEFAULT, "ID block is unexpected (Sercice 408C block 0): %@", md, 0xCu);
              }
              goto LABEL_71;
            }
          }
          else
          {
            v56 = ATLLogObject();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)md = 138412290;
              uint64_t v76 = 0;
              _os_log_impl(&dword_1CA552000, v56, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
            }
          }
          v57 = ATLLogObject();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)md = 138412290;
            uint64_t v76 = 0;
            _os_log_impl(&dword_1CA552000, v57, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
          }

          id v12 = 0;
          goto LABEL_63;
        }
      }
      else
      {
        v47 = ATLLogObject();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)md = 138412290;
          uint64_t v76 = 0;
          _os_log_impl(&dword_1CA552000, v47, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
        }
      }
      v48 = ATLLogObject();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)md = 138412290;
        uint64_t v76 = 0;
        _os_log_impl(&dword_1CA552000, v48, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
      }

      v29 = 0;
      goto LABEL_50;
    }
    v40 = ATLLogObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)md = 138412290;
      uint64_t v76 = 0;
      _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_DEFAULT, "GET DATA response from transceiver was nil: %@", md, 0xCu);
    }
  }
  else
  {
    id v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)md = 138412290;
      uint64_t v76 = 0;
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_DEFAULT, "GET DATA Command was nil: %@", md, 0xCu);
    }
  }
  v39 = 0;
LABEL_74:

LABEL_75:

  return v39;
}

@end