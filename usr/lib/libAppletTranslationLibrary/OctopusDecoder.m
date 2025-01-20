@interface OctopusDecoder
+ (BOOL)isTopUpTransaction:(unsigned __int8)a3;
+ (id)getAAVSAmount:(id)a3;
+ (id)getBaseDate:(id)a3;
+ (id)getLoyaltyBalance:(id)a3;
+ (id)getNegativeValueLimit:(id)a3;
+ (id)getPhysicalID:(id)a3;
+ (id)getPurseBalance:(id)a3;
+ (id)getTransactionTypeModifierStringFromCode:(unsigned __int8)a3;
+ (id)getTransactionTypeStringFromCode:(unsigned __int8)a3 andServiceProviderID:(unsigned __int8)a4;
+ (id)getTransitTransactionTypeNameFromCode:(unsigned __int8)a3 andServiceProvider:(unsigned __int16)a4;
+ (id)injectTLOGAAVS:(id)a3 withAAVSAmount:(id)a4 andBalance:(id)a5;
+ (id)parseTLOGBlock:(id)a3 withBaseDate:(id)a4;
+ (int)filterHistoryEntry:(id)a3;
+ (int)getEnRouteStatus:(id)a3;
+ (int)isDenyListed:(id)a3;
+ (int)isTransitTransactionCode:(unsigned __int8)a3;
@end

@implementation OctopusDecoder

+ (id)getPurseBalance:(id)a3
{
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    v4 = (unsigned int *)[v3 bytes];
    v5 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:bswap32(*v4) exponent:0xFFFFFFFFLL isNegative:0];
  }
  else
  {
    v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Octopus Purse Service to decode did not have 16 bytes; aborting",
        v8,
        2u);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)parseTLOGBlock:(id)a3 withBaseDate:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!+[SlalomUtils isValidFelicaBlock:v6])
  {
    v14 = ATLLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v28 = "Octopus TLOG block to decode did not have 16 bytes; aborting.";
LABEL_16:
      _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
    }
LABEL_17:
    v15 = 0;
    goto LABEL_20;
  }
  if (!v7)
  {
    v14 = ATLLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v28 = "Cannot parse TLOG block without a Base Date";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v35 = v6;
  v8 = (unsigned __int8 *)[v35 bytes];
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1] >> 1;
  unsigned int v33 = *((unsigned __int16 *)v8 + 1);
  signed int v11 = bswap32(*((_DWORD *)v8 + 1)) >> 3;
  unint64_t v12 = +[SlalomUtils readBitsValueFromBuffer:v8 bitPosition:61 length:3];
  [v7 timeIntervalSinceReferenceDate];
  v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v13 + (double)v11];
  v15 = [MEMORY[0x1E4F1CA60] dictionary];
  v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v17 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
  [v16 setTimeZone:v17];

  v18 = [v16 components:252 fromDate:v14];
  [v15 setObject:v18 forKeyedSubscript:@"TransactionTime"];

  v19 = [NSNumber numberWithUnsignedChar:v10];
  [v15 setObject:v19 forKeyedSubscript:@"TypeDetailRaw"];

  unsigned int v34 = v9;
  v20 = [a1 getTransactionTypeStringFromCode:v10 andServiceProviderID:v9];
  [v15 setObject:v20 forKeyedSubscript:@"TypeDetail"];

  if ([a1 isTransitTransactionCode:v10])
  {
    uint64_t v21 = [a1 getTransactionTypeModifierStringFromCode:v10];
    v22 = (void *)v21;
    if (v21)
    {
      v37[0] = v21;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
      [v15 setObject:v23 forKeyedSubscript:@"TypeModifiers"];
    }
  }
  uint64_t v24 = __rev16(v33);
  v25 = [NSNumber numberWithUnsignedLongLong:v12];
  [v15 setObject:v25 forKeyedSubscript:@"AddValueTypeRaw"];

  if (v12 == 4) {
    uint64_t v26 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v26 = MEMORY[0x1E4F1CC28];
  }
  [v15 setObject:v26 forKeyedSubscript:@"AddValueType"];
  if (v33) {
    uint64_t v27 = [a1 isTopUpTransaction:v10];
  }
  else {
    uint64_t v27 = 0;
  }
  v29 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v24 exponent:0xFFFFFFFFLL isNegative:v27];
  [v15 setObject:v29 forKeyedSubscript:@"Amount"];

  v30 = [NSNumber numberWithUnsignedChar:v34];
  [v15 setObject:v30 forKeyedSubscript:@"MerchantCategoryCode"];

  CC_SHA256((const void *)[v35 bytes], 0x10u, buf);
  v31 = [NSNumber numberWithUnsignedInt:bswap32(*(unsigned int *)buf)];
  [v15 setObject:v31 forKeyedSubscript:@"SerialNumber"];

LABEL_20:

  return v15;
}

+ (id)injectTLOGAAVS:(id)a3 withAAVSAmount:(id)a4 andBalance:(id)a5
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 objectForKeyedSubscript:@"AddValueType"];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    unint64_t v12 = [v7 objectForKeyedSubscript:@"Amount"];
    double v13 = [v7 objectForKeyedSubscript:@"TransactionTime"];
    if ([v12 compare:&unk_1F24E1F48] == 1) {
      [v9 decimalNumberByAdding:v12];
    }
    else {
    uint64_t v15 = [v9 decimalNumberBySubtracting:v12];
    }

    v16 = +[HashHelper hashHelper]();
    -[HashHelper addDictionary:](v16, v7);
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    v18 = -[HashHelper getHash](v17);
    uint64_t v19 = [v18 u32BE:0];

    uint64_t v20 = [v8 BOOLValue];
    v25[0] = @"TopUpAuto";
    v24[0] = @"TypeDetail";
    v24[1] = @"Amount";
    uint64_t v21 = [[MEMORY[0x1E4F28C28] decimalNumberWithMantissa:[v8 unsignedLongLongValue] exponent:0 isNegative:v20];
    v25[1] = v21;
    v25[2] = v13;
    v24[2] = @"TransactionTime";
    v24[3] = @"FinalBalance";
    v25[3] = v15;
    v24[4] = @"SerialNumber";
    v22 = [NSNumber numberWithUnsignedInt:v19];
    v25[4] = v22;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];

    id v9 = (id)v15;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)getLoyaltyBalance:(id)a3
{
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    unint64_t v4 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", [v3 bytes], 52, 18);
    v5 = NSNumber;
    id v6 = [NSNumber numberWithUnsignedLongLong:v4];
    [v6 doubleValue];
    id v8 = [v5 numberWithDouble:v7 / 100.0];
  }
  else
  {
    id v9 = ATLLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_DEFAULT, "Octopus TLOG block to decode did not have 16 bytes; aborting.",
        v11,
        2u);
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)getNegativeValueLimit:(id)a3
{
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    unint64_t v4 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", [v3 bytes], 34, 10);
    v5 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:10 * v4 exponent:0xFFFFFFFFLL isNegative:0];
  }
  else
  {
    id v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Octopus Negative Value Limit data cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v8,
        2u);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)getBaseDate:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3 && [v3 length] == 16)
  {
    int v5 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", [v4 bytes], 80, 16);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    double v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
    [v7 setTimeZone:v8];

    [v6 setCalendar:v7];
    [v6 setYear:2000];
    [v6 setMonth:1];
    [v6 setDay:1];
    id v9 = [v6 date];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    int v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
    [v10 setTimeZone:v11];

    [v10 setDay:v5];
    unint64_t v12 = [v7 dateByAddingComponents:v10 toDate:v9 options:0];
  }
  else
  {
    double v13 = ATLLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_DEFAULT, "Octopus Base Date cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v15,
        2u);
    }

    unint64_t v12 = 0;
  }

  return v12;
}

+ (id)getPhysicalID:(id)a3
{
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    unint64_t v4 = [v3 subdataWithRange:4, 4];
  }
  else
  {
    int v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_DEFAULT, "Octopus Negative Value Limit data cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v7,
        2u);
    }

    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)getAAVSAmount:(id)a3
{
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    unint64_t v4 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", [v3 bytes], 48, 6);
    int v5 = [NSNumber numberWithUnsignedLongLong:50 * v4];
  }
  else
  {
    id v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Octopus AAVS data cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v8,
        2u);
    }

    int v5 = 0;
  }

  return v5;
}

+ (BOOL)isTopUpTransaction:(unsigned __int8)a3
{
  return (a3 < 0x21u) & (0x105647244uLL >> a3);
}

+ (id)getTransactionTypeModifierStringFromCode:(unsigned __int8)a3
{
  id result = 0;
  if ((int)a3 <= 25)
  {
    if (a3 != 2 && a3 != 21) {
      return result;
    }
    return @"FareAdjustment";
  }
  if (a3 == 32) {
    return @"FareRebate";
  }
  if (a3 == 26) {
    return @"FareAdjustment";
  }
  return result;
}

+ (int)isTransitTransactionCode:(unsigned __int8)a3
{
  int result = 1;
  if ((a3 > 0x20u || ((1 << a3) & 0x104BA003ELL) == 0)
    && ((a3 - 100) > 6 || ((1 << (a3 - 100)) & 0x65) == 0))
  {
    return 0;
  }
  return result;
}

+ (id)getTransactionTypeStringFromCode:(unsigned __int8)a3 andServiceProviderID:(unsigned __int8)a4
{
  id v6 = @"Purchase";
  switch(a3)
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 0x11u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x17u:
    case 0x1Au:
    case 0x20u:
      goto LABEL_5;
    case 6u:
      id v6 = @"TopUpContactless";
      goto LABEL_6;
    case 7u:
    case 8u:
    case 0xAu:
    case 0xBu:
    case 0xFu:
    case 0x10u:
      goto LABEL_6;
    case 9u:
    case 0xDu:
    case 0xEu:
    case 0x12u:
    case 0x16u:
    case 0x18u:
      id v6 = @"TopUp";
      goto LABEL_6;
    case 0xCu:
      id v6 = @"TopUpServer";
      goto LABEL_6;
    case 0x19u:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
      goto LABEL_9;
    default:
      if ((a3 - 100) <= 6 && ((1 << (a3 - 100)) & 0x65) != 0)
      {
LABEL_5:
        [a1 getTransitTransactionTypeNameFromCode:v4];
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_9:
        id v6 = @"Unknown";
      }
LABEL_6:
      return v6;
  }
}

+ (id)getTransitTransactionTypeNameFromCode:(unsigned __int8)a3 andServiceProvider:(unsigned __int16)a4
{
  if (a3 == 102 && a4 == 253 || a3 <= 0x1Au && ((1 << a3) & 0x4000018) != 0) {
    return @"TransitBus";
  }
  id result = @"TransitTrain";
  if ((int)a4 <= 199)
  {
    char v5 = a4 - 101;
    if ((a4 - 101) <= 0x39)
    {
      if (((1 << v5) & 0x281040F80000000) != 0) {
        return @"TransitBus";
      }
      if (((1 << v5) & 0x600000000000) != 0) {
        return @"TransitOtherFerry";
      }
      if (a4 == 101) {
        return result;
      }
    }
    switch(a4)
    {
      case 1u:
      case 2u:
        return result;
      case 3u:
        return @"TransitLightRail";
      case 4u:
      case 5u:
      case 7u:
        return @"TransitBus";
      case 6u:
        return @"TransitOtherFerry";
      default:
        return @"Transit";
    }
    return result;
  }
  if ((int)a4 > 248)
  {
    if (a4 != 250)
    {
      if (a4 == 249) {
        return @"TransitLightRail";
      }
      return @"Transit";
    }
    return @"TransitOtherFerry";
  }
  if (a4 != 200 && a4 != 248) {
    return @"Transit";
  }
  return result;
}

+ (int)isDenyListed:(id)a3
{
  return +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", [a3 bytes], 28, 4) != 0;
}

+ (int)getEnRouteStatus:(id)a3
{
  id v3 = a3;
  if (+[SlalomUtils isValidFelicaBlock:v3])
  {
    BOOL v4 = +[SlalomUtils readBitsValueFromBuffer:bitPosition:length:](SlalomUtils, "readBitsValueFromBuffer:bitPosition:length:", [v3 bytes], 15, 1) == 1;
  }
  else
  {
    char v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_DEFAULT, "Octopus Transit Flag data cannot be retrieved; block to decode did not have 16 bytes; aborting.",
        v7,
        2u);
    }

    BOOL v4 = 0;
  }

  return v4;
}

+ (int)filterHistoryEntry:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKeyedSubscript:@"AddValueTypeRaw"];
  if ([v4 intValue] == 4)
  {
    char v5 = [v3 objectForKeyedSubscript:@"MerchantCategoryCode"];
    if ([v5 intValue] == 1)
    {
      id v6 = [v3 objectForKeyedSubscript:@"TypeDetailRaw"];
      if ([v6 intValue] == 18)
      {
        double v7 = [v3 objectForKeyedSubscript:@"Amount"];
        BOOL v8 = [v7 intValue] == 0;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end