@interface HPHistoryDecoder
+ ($06D0163FE0D7AFE752A9F21F38483579)getInOutStation:(id)a3;
+ ($391024036B902F3EE9BCB0FBA5EF777F)getCommuterBalance:(id)a3;
+ ($391024036B902F3EE9BCB0FBA5EF777F)getTransactionBalance:(id)a3;
+ ($D5AB1F6BCC7169BA692F6D1C6C8B6B88)getSectorInformation:(id)a3;
+ (BOOL)getGreenCarTicketUsed:(id)a3;
+ (BOOL)getIsDenyListed:(id)a3;
+ (id)_decodeShinkansenTrainDataWithBlock:(id)a3 andBlock:(id)a4;
+ (id)getTransactionDate:(id)a3;
+ (id)parseGreencarBlocks:(id)a3;
+ (id)parseShinkansenBlocks:(id)a3 fromServiceCode:(unsigned __int16)a4;
+ (id)parseSuicaHistoryBlocks:(id)a3 withIDm:(id)a4;
+ (int)getTransactionAmount:(id)a3 withPreviousBlock:(id)a4;
+ (unsigned)getHistoryNumber:(id)a3;
+ (unsigned)getTypeOfUse:(id)a3;
@end

@implementation HPHistoryDecoder

+ (id)getTransactionDate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    unsigned int v4 = bswap32(*(unsigned __int16 *)([v3 bytes] + 4));
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v5 setYear:(v4 >> 25) + 2000];
    [v5 setMonth:(v4 >> 21) & 0xF];
    [v5 setDay:HIWORD(v4) & 0x1F];
  }
  else
  {
    v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction date for Suica, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ ($391024036B902F3EE9BCB0FBA5EF777F)getTransactionBalance:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    unsigned int v4 = (unsigned __int8 *)[v3 bytes];
    unint64_t v5 = (unint64_t)((v4[12] << 16) | (v4[11] << 8) | v4[10]) << 32;
    uint64_t v6 = 1;
  }
  else
  {
    v7 = ATLLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get the transaction balance for Suica, invalid block: %@", (uint8_t *)&v9, 0xCu);
    }

    unint64_t v5 = 0;
    uint64_t v6 = 0;
  }

  return ($391024036B902F3EE9BCB0FBA5EF777F)(v6 | v5);
}

+ ($391024036B902F3EE9BCB0FBA5EF777F)getCommuterBalance:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    unsigned int v4 = (unsigned __int8 *)[v3 bytes];
    unint64_t v5 = (unint64_t)((v4[13] << 16) | (v4[12] << 8) | v4[11]) << 32;
    uint64_t v6 = 1;
  }
  else
  {
    v7 = ATLLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get the commuter balance for Suica, invalid block: %@", (uint8_t *)&v9, 0xCu);
    }

    unint64_t v5 = 0;
    uint64_t v6 = 0;
  }

  return ($391024036B902F3EE9BCB0FBA5EF777F)(v6 | v5);
}

+ (unsigned)getTypeOfUse:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    uint64_t v4 = [v3 bytes];
    unsigned __int16 v5 = *(unsigned __int8 *)(v4 + 3) | ((*(unsigned char *)(v4 + 1) & 0x7F) << 8);
  }
  else
  {
    uint64_t v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get the type of use for Suica, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    unsigned __int16 v5 = 0;
  }

  return v5;
}

+ (int)getTransactionAmount:(id)a3 withPreviousBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!+[SlalomUtils isValidFelicaBlock:v6])
  {
    uint64_t v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      uint64_t v11 = "Failed to get the transaction amount use for Suica, invalid (current) block: %@";
LABEL_8:
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
LABEL_9:

    int v9 = 0;
    goto LABEL_10;
  }
  if (!+[SlalomUtils isValidFelicaBlock:v7])
  {
    uint64_t v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      uint64_t v11 = "Failed to get the transaction amount use for Suica, invalid (previous) block: %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  unint64_t v8 = (unint64_t)[a1 getTransactionBalance:v6] >> 32;
  int v9 = ((unint64_t)[a1 getTransactionBalance:v7] >> 32) - v8;
LABEL_10:

  return v9;
}

+ ($D5AB1F6BCC7169BA692F6D1C6C8B6B88)getSectorInformation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    uint64_t v4 = [v3 bytes];
    uint64_t v5 = bswap32(*(unsigned __int16 *)(v4 + 6)) >> 16;
    unint64_t v6 = (unint64_t)(*(unsigned char *)(v4 + 15) & 0x30) << 48;
    unint64_t v7 = (unint64_t)(bswap32(*(unsigned __int16 *)(v4 + 8)) >> 16) << 32;
    unint64_t v8 = (unint64_t)(*(unsigned char *)(v4 + 15) & 0xC0) << 16;
  }
  else
  {
    int v9 = ATLLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get the sector information for Suica, invalid block: %@", (uint8_t *)&v11, 0xCu);
    }

    unint64_t v6 = 0;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v5 = 0;
  }

  return ($D5AB1F6BCC7169BA692F6D1C6C8B6B88)(v7 | v5 | v6 | v8);
}

+ (BOOL)getGreenCarTicketUsed:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    BOOL v4 = *(unsigned char *)([v3 bytes] + 15) & 1;
  }
  else
  {
    uint64_t v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get the GreenCar information for Suica, invalid block: %@", (uint8_t *)&v7, 0xCu);
    }

    BOOL v4 = 0;
  }

  return v4;
}

+ ($06D0163FE0D7AFE752A9F21F38483579)getInOutStation:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    BOOL v4 = (unsigned __int8 *)[v3 bytes];
    LODWORD(v5) = *v4 >> 7;
    int v6 = (v4[1] >> 6) & 1;
  }
  else
  {
    uint64_t v5 = ATLLogObject();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1CA552000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Failed to get the In and Out information for Suica, invalid block: %@", (uint8_t *)&v8, 0xCu);
    }

    LOWORD(v6) = 0;
    LOWORD(v5) = 0;
  }

  return ($06D0163FE0D7AFE752A9F21F38483579)(v5 | ((_WORD)v6 << 8));
}

+ (BOOL)getIsDenyListed:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    BOOL v4 = *(char *)([v3 bytes] + 8) < 0;
  }
  else
  {
    uint64_t v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get the denylisted information for Suica, invalid block: %@", (uint8_t *)&v7, 0xCu);
    }

    BOOL v4 = 0;
  }

  return v4;
}

+ (unsigned)getHistoryNumber:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    LODWORD(v4) = bswap32(*(unsigned __int16 *)([v3 bytes] + 13)) >> 16;
  }
  else
  {
    BOOL v4 = ATLLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the history number information for Suica, invalid block: %@", (uint8_t *)&v6, 0xCu);
    }

    LOWORD(v4) = 0;
  }

  return (unsigned __int16)v4;
}

+ (id)parseSuicaHistoryBlocks:(id)a3 withIDm:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v7 || [v7 length] != 8)
  {
    NSLog(&cfstr_IdmNotProvided.isa, v8);
LABEL_14:
    v40 = 0;
    goto LABEL_15;
  }
  if (!v6 || ![v6 count])
  {
    NSLog(&cfstr_TheArrayOfBloc.isa);
    goto LABEL_14;
  }
  v42 = [MEMORY[0x1E4F1CA60] dictionary];
  v45 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    unint64_t v9 = 0;
    int v10 = 0;
    id v43 = a1;
    id v44 = v8;
    v46 = v6;
    do
    {
      int v47 = v10;
      int v11 = [MEMORY[0x1E4F1CA60] dictionary];
      id v12 = [v6 objectAtIndexedSubscript:v9];
      uint64_t v13 = [a1 getTransactionDate:v12];
      unsigned int v14 = [a1 getTypeOfUse:v12];
      uint64_t v15 = [a1 getSectorInformation:v12];
      unint64_t v16 = (unint64_t)[a1 getTransactionBalance:v12] >> 32;
      unsigned int v50 = 0;
      unint64_t v17 = v9 + 1;
      if (v17 >= [v6 count])
      {
        *(void *)md = 0;
        uint64_t v52 = 0;
        [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:md length:16 freeWhenDone:0];
      }
      else
      {
        [v46 objectAtIndexedSubscript:v17];
      v18 = };
      unsigned int v50 = [a1 getTransactionAmount:v12 withPreviousBlock:v18];

      [v11 setObject:v13 forKeyedSubscript:@"NFTransactionDate"];
      v19 = [NSNumber numberWithUnsignedInt:v16];
      [v11 setObject:v19 forKeyedSubscript:@"NFBalance"];

      v20 = [NSNumber numberWithInt:v50];
      [v11 setObject:v20 forKeyedSubscript:@"NFAmount"];

      [v11 setObject:&unk_1F24E1F18 forKeyedSubscript:@"NFAmountType"];
      v21 = [NSNumber numberWithUnsignedChar:v14 >> 8];
      [v11 setObject:v21 forKeyedSubscript:@"NFTransactionType"];

      v22 = [NSNumber numberWithUnsignedChar:v14];
      [v11 setObject:v22 forKeyedSubscript:@"NFSectorCombination"];

      v49[0] = BYTE1(v15);
      v49[1] = v15;
      v49[2] = BYTE2(v15);
      v23 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v49 length:3];
      [v11 setObject:v23 forKeyedSubscript:@"NFStartStationData"];

      v24 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v15];
      [v11 setObject:v24 forKeyedSubscript:@"NFStartStation"];

      v25 = [NSNumber numberWithUnsignedChar:BYTE2(v15)];
      [v11 setObject:v25 forKeyedSubscript:@"NFStartStationExt"];

      v48[0] = BYTE5(v15);
      v48[1] = BYTE4(v15);
      v48[2] = BYTE6(v15);
      v26 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v48 length:3];
      [v11 setObject:v26 forKeyedSubscript:@"NFEndStationData"];

      v27 = [NSNumber numberWithUnsignedShort:WORD2(v15)];
      [v11 setObject:v27 forKeyedSubscript:@"NFEndStation"];

      v28 = [NSNumber numberWithUnsignedChar:BYTE6(v15)];
      [v11 setObject:v28 forKeyedSubscript:@"NFEndStationExt"];

      uint64_t data = 0;
      uint64_t v54 = 0;
      uint64_t v8 = v44;
      uint64_t data = *(void *)[v44 bytes];
      LODWORD(v54) = bswap32(v50);
      id v29 = v12;
      uint64_t v30 = [v29 bytes];
      WORD2(v54) = *(_WORD *)(v30 + 4);
      CC_SHA256(&data, 0xDu, md);
      v31 = [MEMORY[0x1E4F1CA58] dataWithBytes:md length:16];
      [v31 increaseLengthBy:16];
      v32 = [v31 asHexString];
      [v11 setObject:v32 forKeyedSubscript:@"NFTransactionID"];

      v33 = [NSNumber numberWithUnsignedInteger:bswap32(*(unsigned __int16 *)(v30 + 13)) >> 16];
      [v11 setObject:v33 forKeyedSubscript:@"NFHistorySequenceNumber"];

      unint64_t v34 = +[SlalomUtils readBitsValueFromBuffer:v30 + 1 bitPosition:7 length:1];
      v35 = [NSNumber numberWithUnsignedLongLong:v34];
      [v11 setObject:v35 forKeyedSubscript:@"NFSFBreakdown"];

      unint64_t v36 = +[SlalomUtils readBitsValueFromBuffer:v30 bitPosition:0 length:7];
      v37 = [NSNumber numberWithUnsignedLongLong:v36];
      [v11 setObject:v37 forKeyedSubscript:@"NFDeviceCode"];

      unint64_t v38 = +[SlalomUtils readBitsValueFromBuffer:v30 + 2 bitPosition:0 length:7];
      v39 = [NSNumber numberWithUnsignedLongLong:v38];
      [v11 setObject:v39 forKeyedSubscript:@"NFPaymentType"];

      [v45 addObject:v11];
      int v10 = v47 + 1;
      unint64_t v9 = (unsigned __int16)(v47 + 1);
      id v6 = v46;
      a1 = v43;
    }
    while ([v46 count] > v9);
  }
  v40 = v42;
  [v42 setObject:v45 forKeyedSubscript:@"NFHistoryRecords"];

LABEL_15:

  return v40;
}

+ (id)parseGreencarBlocks:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3 || ![v3 count])
  {
    id v11 = 0;
    goto LABEL_18;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [v4 objectAtIndexedSubscript:0];
  if (+[SlalomUtils isValidFelicaBlock:v6])
  {
    if (![v6 isAll00])
    {
      uint64_t v12 = [v6 bytes];
      uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:2];
      if (([v13 isAll00] & 1) == 0) {
        [v5 setObject:v13 forKeyedSubscript:@"NFStartStationData"];
      }
      unsigned int v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 + 2 length:2];

      if (([v14 isAll00] & 1) == 0) {
        [v5 setObject:v14 forKeyedSubscript:@"NFEndStationData"];
      }
      unsigned int v15 = +[SlalomUtils readUInt16FromBytes:v12 + 4];
      id v16 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v16 setYear:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v15, 7, 9)+ 2000]];
      [v16 setMonth:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v15, 4, 5)];
      [v16 setDay:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v15, 5, 0)];
      [v5 setObject:v16 forKeyedSubscript:@"NFPurchaseDate"];
      uint64_t v17 = +[SlalomUtils readUInt24FromBytes:v12 + 6];
      v18 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 6, 13)];
      [v5 setObject:v18 forKeyedSubscript:@"NFMinuteSold"];

      v19 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 5, 19)];
      [v5 setObject:v19 forKeyedSubscript:@"NFHourSold"];

      v20 = [NSNumber numberWithUnsignedShort:10 * *(unsigned __int8 *)(v12 + 9)];
      [v5 setObject:v20 forKeyedSubscript:@"NFFare"];

      v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 + 12 length:2];
      [v5 setObject:v21 forKeyedSubscript:@"NFRefundStation"];

      uint64_t v22 = +[SlalomUtils readUInt16FromBytes:v12 + 14];
      v23 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 1, 0)];
      [v5 setObject:v23 forKeyedSubscript:@"NFTicketUsed"];

      v24 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 6, 5)];
      [v5 setObject:v24 forKeyedSubscript:@"NFRefundDay"];

      v25 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 6, 11)];
      [v5 setObject:v25 forKeyedSubscript:@"NFRefundMonth"];

      id v11 = v5;
      goto LABEL_17;
    }
    id v7 = ATLLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      uint64_t v8 = "Shinkansen information are all zeros, filtering";
      unint64_t v9 = v7;
      uint32_t v10 = 2;
LABEL_10:
      _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v27, v10);
    }
  }
  else
  {
    id v7 = ATLLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      v28 = v6;
      uint64_t v8 = "Failed to get the GreenCar information for Suica, invalid block: %@";
      unint64_t v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_10;
    }
  }

  id v11 = 0;
LABEL_17:

LABEL_18:

  return v11;
}

+ (id)parseShinkansenBlocks:(id)a3 fromServiceCode:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    id v9 = [v7 objectAtIndexedSubscript:0];
    if (+[SlalomUtils isValidFelicaBlock:v9])
    {
      if ([v9 isAll00])
      {
        uint32_t v10 = ATLLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v11 = "Shinkansen information are all zeros, filtering";
          uint64_t v12 = v10;
          uint32_t v13 = 2;
LABEL_13:
          _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
LABEL_14:

        unsigned int v14 = 0;
LABEL_44:

        goto LABEL_45;
      }
      if (v4 != 6475)
      {
        id v9 = v9;
        v46 = (unsigned __int8 *)[v9 bytes];
        if (!v46) {
          goto LABEL_43;
        }
        int v47 = v46;
        v48 = [NSNumber numberWithInt:*v46];
        [v8 setObject:v48 forKeyedSubscript:@"NFTicketSelected"];

        if ((unint64_t)[v9 length] < 9) {
          goto LABEL_43;
        }
        unsigned int v49 = v47[8];
        unsigned int v50 = [NSNumber numberWithInt:(v49 >> 4) & 1];
        [v8 setObject:v50 forKeyedSubscript:@"NFNotifyOnLowBalance"];

        id v23 = [NSNumber numberWithInt:(v49 >> 5) & 1];
        [v8 setObject:v23 forKeyedSubscript:@"NFAllowBalanceUsageForCommute"];
LABEL_42:

LABEL_43:
        unsigned int v14 = v8;
        goto LABEL_44;
      }
      if ([v7 count] == 8)
      {
        id v53 = a1;
        id v15 = v9;
        uint64_t v16 = [v15 bytes];
        unsigned int v17 = +[SlalomUtils readUInt16FromBytes:v16];
        id v18 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        [v18 setYear:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 7, 9)+ 2000]];
        [v18 setMonth:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 4, 5)];
        [v18 setDay:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v17, 5, 0)];
        [v8 setObject:v18 forKeyedSubscript:@"NFExpressTicketDate"];
        v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v16 + 2 length:3];
        [v8 setObject:v19 forKeyedSubscript:@"NFExpressTicketNumber"];

        unsigned int v20 = +[SlalomUtils readUInt16FromBytes:v16 + 11];
        id v21 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);

        [v21 setYear:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v20, 7, 9)+ 2000];
        [v21 setMonth:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v20, 4, 5)];
        [v21 setDay:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v20, 5, 0)];
        [v8 setObject:v21 forKeyedSubscript:@"NFIssueDate"];
        unsigned int v22 = +[SlalomUtils readUInt16FromBytes:v16 + 13];
        id v23 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);

        [v23 setYear:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 7, 9)+ 2000]];
        [v23 setMonth:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 4, 5)];
        [v23 setDay:[+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v22, 5, 0)];
        [v8 setObject:v23 forKeyedSubscript:@"NFValidityStartDate"];
        v24 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v16 + 15)];
        [v8 setObject:v24 forKeyedSubscript:@"NFValidityTerm"];

        v25 = [v7 objectAtIndexedSubscript:5];

        id v9 = v25;
        uint64_t v26 = [v9 bytes];
        uint64_t v54 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v26 length:2];
        int v27 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v26 + 2 length:2];
        uint64_t v55 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v26 + 4 length:2];
        uint64_t v56 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v26 + 6 length:2];
        unint64_t v28 = +[SlalomUtils readNumberFromBytes:v26 + 8 numberOfBytes:6];
        uint64_t v29 = [NSNumber numberWithUnsignedLongLong:10* +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v28, 12, 12)];
        [v8 setObject:v29 forKeyedSubscript:@"NFExpressFareC"];

        uint64_t v30 = [NSNumber numberWithUnsignedLongLong:10* +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v28, 12, 12)];
        [v8 setObject:v30 forKeyedSubscript:@"NFExpressFareB"];

        v31 = [NSNumber numberWithUnsignedLongLong:10* +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v28, 12, 24)];
        [v8 setObject:v31 forKeyedSubscript:@"NFExpressFareA"];

        v32 = [NSNumber numberWithUnsignedLongLong:10* +[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v28, 12, 36)];
        [v8 setObject:v32 forKeyedSubscript:@"NFExpressFare"];

        unsigned __int16 v33 = +[SlalomUtils readUInt16FromBytes:v26 + 14];
        unint64_t v34 = [NSNumber numberWithUnsignedInteger:2 * ((5 * v33) & 0x7FFF)];
        [v8 setObject:v34 forKeyedSubscript:@"NFTotalFare"];

        v35 = [MEMORY[0x1E4F1CA48] array];
        if (v54 && v27 && ([v54 isAll00] & 1) == 0 && (objc_msgSend(v27, "isAll00") & 1) == 0)
        {
          unint64_t v36 = [v7 objectAtIndexedSubscript:1];
          v37 = [v7 objectAtIndexedSubscript:2];
          unint64_t v38 = [v53 _decodeShinkansenTrainDataWithBlock:v36 andBlock:v37];

          if (!v38)
          {
            unint64_t v38 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          [v38 setObject:v54 forKey:@"NFStartStationData"];
          [v38 setObject:v27 forKey:@"NFEndStationData"];
          [v35 addObject:v38];
        }
        v39 = v55;
        v40 = (void *)v56;
        if (v27 && v55 && ([v27 isAll00] & 1) == 0 && (objc_msgSend(v55, "isAll00") & 1) == 0)
        {
          uint64_t v52 = [v7 objectAtIndexedSubscript:3];
          v41 = [v7 objectAtIndexedSubscript:4];
          v42 = [v53 _decodeShinkansenTrainDataWithBlock:v52 andBlock:v41];

          if (!v42)
          {
            v42 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          [v42 setObject:v27 forKey:@"NFStartStationData"];
          [v42 setObject:v55 forKey:@"NFEndStationData"];
          [v35 addObject:v42];

          v40 = (void *)v56;
        }
        if (v55 && v40 && ([v55 isAll00] & 1) == 0 && (objc_msgSend(v40, "isAll00") & 1) == 0)
        {
          id v43 = [v7 objectAtIndexedSubscript:6];
          id v44 = [v7 objectAtIndexedSubscript:7];
          v45 = [v53 _decodeShinkansenTrainDataWithBlock:v43 andBlock:v44];

          if (!v45)
          {
            v45 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          [v45 setObject:v55 forKey:@"NFStartStationData"];
          v40 = (void *)v56;
          [v45 setObject:v56 forKey:@"NFEndStationData"];
          [v35 addObject:v45];

          v39 = v55;
        }
        [v8 setObject:v35 forKeyedSubscript:@"NFTrains"];

        goto LABEL_42;
      }
      uint32_t v10 = ATLLogObject();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v58 = [v7 count];
      id v11 = "Shinkansen1 missing blocks, bailing out. Expecting 8 got %lu";
    }
    else
    {
      uint32_t v10 = ATLLogObject();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v58 = (uint64_t)v9;
      id v11 = "Failed to get the shinkansen information for Suica, invalid block: %@";
    }
    uint64_t v12 = v10;
    uint32_t v13 = 12;
    goto LABEL_13;
  }
  uint64_t v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_DEFAULT, "Bailing out for Shinkansen Service, not enough blocks", buf, 2u);
  }
  unsigned int v14 = 0;
LABEL_45:

  return v14;
}

+ (id)_decodeShinkansenTrainDataWithBlock:(id)a3 andBlock:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!+[SlalomUtils isValidFelicaBlock:v5])
  {
    unsigned __int16 v33 = ATLLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v5;
      unint64_t v34 = "Failed to get the denylisted information for Suica, invalid (block1) block: %@";
LABEL_16:
      _os_log_impl(&dword_1CA552000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
    }
LABEL_17:

LABEL_18:
    id v32 = 0;
    goto LABEL_26;
  }
  if (!+[SlalomUtils isValidFelicaBlock:v6])
  {
    unsigned __int16 v33 = ATLLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v6;
      unint64_t v34 = "Failed to get the denylisted information for Suica, invalid (block2) block: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if [v5 isAll00] && (objc_msgSend(v6, "isAll00")) {
    goto LABEL_18;
  }
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = (void *)[v5 mutableCopy];
  uint64_t v9 = [v6 bytes];
  [v8 appendBytes:v9 length:6];
  [v7 setObject:v8 forKeyedSubscript:@"NFTrainName"];
  unint64_t v10 = +[SlalomUtils readNumberFromBytes:v9 + 6 numberOfBytes:8];
  id v11 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 6, 0)];
  [v7 setObject:v11 forKeyedSubscript:@"NFArrivalMinute"];

  uint64_t v12 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 5, 6)];
  [v7 setObject:v12 forKeyedSubscript:@"NFArrivalHour"];

  uint32_t v13 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 6, 11)];
  [v7 setObject:v13 forKeyedSubscript:@"NFDepartureMinute"];

  unsigned int v14 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 5, 17)];
  [v7 setObject:v14 forKeyedSubscript:@"NFDepartureHour"];

  id v15 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 20, 22)];
  [v7 setObject:v15 forKeyedSubscript:@"NFPBCode"];

  uint64_t v16 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 1, 42)];
  [v7 setObject:v16 forKeyedSubscript:@"NFReissue"];

  unsigned int v17 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 3, 43)];
  [v7 setObject:v17 forKeyedSubscript:@"NFCarId"];

  id v18 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 1, 46)];
  [v7 setObject:v18 forKeyedSubscript:@"NFSmoking"];

  v19 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 5, 47)];
  [v7 setObject:v19 forKeyedSubscript:@"NFCarNumber"];

  unsigned int v20 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 3, 52)];
  [v7 setObject:v20 forKeyedSubscript:@"NFSeatType"];

  id v21 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 1, 55)];
  [v7 setObject:v21 forKeyedSubscript:@"NFChild"];

  unsigned int v22 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 2, 56)];
  [v7 setObject:v22 forKeyedSubscript:@"NFGreenCar"];

  id v23 = [NSNumber numberWithUnsignedLongLong:+[SlalomUtils getBitsFrom:numberOfBits:startingFrom:](SlalomUtils, "getBitsFrom:numberOfBits:startingFrom:", v10, 6, 58)];
  [v7 setObject:v23 forKeyedSubscript:@"NFSeatNumber"];

  unsigned int v24 = +[SlalomUtils readUInt16FromBytes:v9 + 14];
  v25 = [NSNumber numberWithUnsignedShort:10 * (v24 >> 6)];
  [v7 setObject:v25 forKeyedSubscript:@"NFGreenCarFare"];

  uint64_t v26 = [v7 objectForKeyedSubscript:@"NFDepartureHour"];
  if (![v26 isEqualToNumber:&unk_1F24E1F30])
  {
LABEL_23:

    goto LABEL_24;
  }
  int v27 = [v7 objectForKeyedSubscript:@"NFDepartureMinute"];
  if (![v27 isEqualToNumber:&unk_1F24E1F30])
  {
LABEL_22:

    goto LABEL_23;
  }
  unint64_t v28 = [v7 objectForKeyedSubscript:@"NFArrivalHour"];
  if (![v28 isEqualToNumber:&unk_1F24E1F30])
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v29 = [v7 objectForKeyedSubscript:@"NFArrivalMinute"];
  if (![v29 isEqualToNumber:&unk_1F24E1F30])
  {
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v30 = [v7 objectForKeyedSubscript:@"NFPBCode"];
  if (![v30 isEqualToNumber:&unk_1F24E1F30])
  {

    goto LABEL_20;
  }
  v31 = [v7 objectForKeyedSubscript:@"NFCarId"];
  char v36 = [v31 isEqualToNumber:&unk_1F24E1F30];

  if ((v36 & 1) == 0)
  {
LABEL_24:
    id v32 = v7;
    goto LABEL_25;
  }
  id v32 = 0;
LABEL_25:

LABEL_26:

  return v32;
}

@end