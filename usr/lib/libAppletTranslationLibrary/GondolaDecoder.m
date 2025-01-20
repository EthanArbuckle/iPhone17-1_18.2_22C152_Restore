@interface GondolaDecoder
+ (BOOL)isCardEffectiveFlag:(id)a3;
+ (BOOL)isCardUsageFlag:(id)a3;
+ (BOOL)isTransactionTypePaymentWithReload:(unint64_t)a3;
+ (id)decodeAutoTopThresholdAmount:(id)a3;
+ (id)decodeAutoTopUpAmount:(id)a3;
+ (id)decodeCardNumberFromBlock0:(id)a3 andBlock1:(id)a4;
+ (id)decodeEnrollmentDateAfterDelivery:(id)a3;
+ (id)decodeHistoryBlock1:(id)a3 andWithBlock2:(id)a4;
+ (id)decodeLastTransactionDate:(id)a3;
+ (id)decodeLoyaltyPointBalancesAndExpiration:(id)a3 withActivationDate:(id)a4;
+ (id)decodeTotalPointsUntil1YearAgo:(id)a3;
+ (id)decodeTotalPointsUntil2YearsAgo:(id)a3;
+ (id)decodeTransactionTopupCategory:(unint64_t)a3;
+ (id)decodeTransactionType:(unint64_t)a3;
+ (id)getPurseBalance:(id)a3;
+ (unint64_t)decodeLastHistoryNumber:(id)a3;
+ (unsigned)decodePointIssuer1AppStatus:(id)a3;
@end

@implementation GondolaDecoder

+ (id)decodeCardNumberFromBlock0:(id)a3 andBlock1:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA58];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 dataWithCapacity:8];
  id v9 = v7;
  uint64_t v10 = [v9 bytes];

  id v11 = v6;
  uint64_t v12 = [v11 bytes];

  [v8 appendBytes:v10 + 12 length:4];
  [v8 appendBytes:v12 length:4];

  return v8;
}

+ (BOOL)isCardUsageFlag:(id)a3
{
  return [a3 readBinaryValueAtBit:111 numberOfBits:2] & 1;
}

+ (BOOL)isCardEffectiveFlag:(id)a3
{
  return [a3 readBinaryValueAtBit:112 numberOfBits:2] & 1;
}

+ (id)decodeEnrollmentDateAfterDelivery:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = NSNumber;
  id v7 = [v4 decodeBCDAtOffset:3 length:1];
  v8 = [v6 numberWithInt:[v7 intValue] + 2000];

  id v9 = [v4 decodeBCDAtOffset:4 length:1];
  uint64_t v10 = [v4 decodeBCDAtOffset:5 length:1];

  [v5 setDay:((int)[v10 intValue])];
  [v5 setMonth:(int)[v9 intValue]];
  [v5 setYear:(int)[v8 intValue]];

  return v5;
}

+ (id)decodeLastTransactionDate:(id)a3
{
  v3 = NSNumber;
  id v4 = a3;
  id v5 = [v4 decodeBCDAtOffset:11 length:1];
  id v6 = [v3 numberWithInt:[v5 intValue] + 2000];

  id v7 = [v4 decodeBCDAtOffset:12 length:1];
  v8 = [v4 decodeBCDAtOffset:13 length:1];

  id v9 = [[MEMORY[0x1E4F1C9D8] dateWithYear:(int)[v6 intValue] month:(int)[v7 intValue] day:(int)[v8 intValue]];

  return v9;
}

+ (id)decodeHistoryBlock1:(id)a3 andWithBlock2:(id)a4
{
  v61[7] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v55 = [v7 subdataWithRange:0, 13];
  unsigned int v49 = [v7 u16BE:13];

  unint64_t v8 = (unint64_t)[v6 readBinaryValueAtBit:8 numberOfBits:7] >> 1;
  v48 = [a1 decodeTransactionType:v8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  LODWORD(v7) = [v6 readBinaryValueAtBit:14 numberOfBits:7];
  int v10 = [v6 readBinaryValueAtBit:21 numberOfBits:4];
  int v11 = [v6 readBinaryValueAtBit:25 numberOfBits:5];
  int v12 = [v6 readBinaryValueAtBit:30 numberOfBits:5];
  int v13 = [v6 readBinaryValueAtBit:35 numberOfBits:6];
  [v9 setDay:v11];
  [v9 setMonth:v10];
  [v9 setYear:(int)v7 + 2005];
  [v9 setHour:v12];
  [v9 setMinute:v13];
  uint64_t v14 = [v6 readBinaryValueAtBit:41 numberOfBits:18];
  uint64_t v52 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v14 exponent:0 isNegative:0];
  uint64_t v15 = [v6 readBinaryValueAtBit:59 numberOfBits:18];
  uint64_t v51 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v15 exponent:0 isNegative:v8 == 10];
  uint64_t v16 = [v6 readBinaryValueAtBit:77 numberOfBits:17];
  v50 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v16 exponent:0 isNegative:v8 != 5];
  id v45 = a1;
  uint64_t v43 = [v6 readBinaryValueAtBit:94 numberOfBits:4];
  [a1 decodeTransactionTopupCategory:];
  v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:7];
  v18 = [MEMORY[0x1E4F1CA58] dataWithCapacity:32];
  id v19 = v6;
  v20 = (const void *)[v19 bytes];

  id v46 = v18;
  CC_SHA256(v20, 8u, (unsigned __int8 *)[v46 mutableBytes]);
  uint64_t v44 = v15;
  if (v15)
  {
    v60[0] = @"TerminalIdentifier";
    v21 = [v55 asHexString];
    v61[0] = v21;
    v60[1] = @"SerialNumber";
    v22 = [NSNumber numberWithUnsignedShort:v49];
    v61[1] = v22;
    v60[2] = @"TypeDetailRaw";
    v23 = [NSNumber numberWithUnsignedLongLong:v8];
    v61[2] = v23;
    v61[3] = v9;
    v60[3] = @"TransactionTime";
    v60[4] = @"Amount";
    v61[4] = v51;
    v61[5] = v52;
    v60[5] = @"FinalBalance";
    v60[6] = @"TypeDetail";
    v61[6] = v48;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:7];
    [v17 setValuesForKeysWithDictionary:v24];
  }
  v47 = v17;
  v25 = v48;
  v26 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:9];
  if (v16)
  {
    v27 = v53;
    if ([v45 isTransactionTypePaymentWithReload:v8])
    {

      v28 = @"TopUpAuto";
    }
    else
    {
      v28 = v48;
    }
    if (v8 == 6 && !v43)
    {

      v27 = @"Points";
    }
    v58[0] = @"TerminalIdentifier";
    v35 = [v55 asHexString];
    v59[0] = v35;
    v58[1] = @"SerialNumber";
    v36 = [NSNumber numberWithUnsignedShort:v49];
    v59[1] = v36;
    v58[2] = @"TypeDetailRaw";
    v37 = [NSNumber numberWithUnsignedLongLong:v8];
    v59[2] = v37;
    v59[3] = v9;
    v58[3] = @"TransactionTime";
    v58[4] = @"Amount";
    v59[4] = v50;
    v59[5] = v52;
    v58[5] = @"FinalBalance";
    v58[6] = @"AddValueTypeRaw";
    v38 = [NSNumber numberWithUnsignedLongLong:v43];
    v59[6] = v38;
    v59[7] = v27;
    v54 = v27;
    v58[7] = @"AddValueType";
    v58[8] = @"TypeDetail";
    v25 = v28;
    v59[8] = v28;
    unint64_t v34 = 0x1E4F1C000uLL;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:9];
    [v26 setValuesForKeysWithDictionary:v39];

    if (v44)
    {
      v33 = v46;
      v40 = [NSNumber numberWithUnsignedLongLong:bswap64(*objc_msgSend(v46, "bytes"))];
      v32 = v17;
      [v17 setObject:v40 forKey:@"fakeTransactionId"];

      unint64_t v34 = 0x1E4F1C000;
      v29 = (void *)v51;
      v30 = (void *)v52;
      v31 = v54;
    }
    else
    {
      v29 = (void *)v51;
      v30 = (void *)v52;
      v31 = v54;
      v33 = v46;
      v32 = v47;
    }
  }
  else
  {
    v29 = (void *)v51;
    v30 = (void *)v52;
    v31 = v53;
    v33 = v46;
    v32 = v47;
    unint64_t v34 = 0x1E4F1C000;
  }
  v56[0] = @"Charge";
  v56[1] = @"TopUp";
  v57[0] = v32;
  v57[1] = v26;
  v41 = [*(id *)(v34 + 2536) dictionaryWithObjects:v57 forKeys:v56 count:2];

  return v41;
}

+ (unint64_t)decodeLastHistoryNumber:(id)a3
{
  return (unint64_t)*(unsigned __int8 *)([a3 bytes] + 3) >> 6;
}

+ (id)getPurseBalance:(id)a3
{
  uint64_t v3 = *(unsigned int *)[a3 bytes];
  id v4 = (void *)MEMORY[0x1E4F28C28];

  return (id)[v4 decimalNumberWithMantissa:v3 exponent:0 isNegative:0];
}

+ (id)decodeTotalPointsUntil1YearAgo:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [a3 s24BE:0];

  return (id)[v3 numberWithInt:v4];
}

+ (id)decodeTotalPointsUntil2YearsAgo:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [a3 s24BE:3];

  return (id)[v3 numberWithInt:v4];
}

+ (unsigned)decodePointIssuer1AppStatus:(id)a3
{
  return *(unsigned char *)([a3 bytes] + 10);
}

+ (id)decodeAutoTopUpAmount:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [a3 readBinaryValueAtBit:34 numberOfBits:17];

  return (id)[v3 numberWithUnsignedLongLong:v4];
}

+ (id)decodeAutoTopThresholdAmount:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [a3 readBinaryValueAtBit:51 numberOfBits:17];

  return (id)[v3 numberWithUnsignedLongLong:v4];
}

+ (id)decodeTransactionTopupCategory:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"Unknown";
  }
  else {
    return off_1E65ADC50[a3 - 1];
  }
}

+ (id)decodeTransactionType:(unint64_t)a3
{
  uint64_t v4 = +[AppletConfigurationData getSlalomSettings];
  id v5 = [v4 objectForKeyedSubscript:@"gondola"];
  id v6 = [v5 objectForKeyedSubscript:@"transactionType"];

  if (!v6
    || (objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3),
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v6 valueForKey:v7],
        unint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (a3 - 1 > 0x25) {
      unint64_t v8 = @"Unknown";
    }
    else {
      unint64_t v8 = off_1E65ADC80[a3 - 1];
    }
  }

  return v8;
}

+ (BOOL)isTransactionTypePaymentWithReload:(unint64_t)a3
{
  return a3 - 7 < 2;
}

+ (id)decodeLoyaltyPointBalancesAndExpiration:(id)a3 withActivationDate:(id)a4
{
  v28[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [a1 decodeTotalPointsUntil1YearAgo:v7];
  id v9 = [a1 decodeTotalPointsUntil2YearsAgo:v7];
  int v10 = [a1 decodeLastTransactionDate:v7];

  if ([v10 year] == 2000)
  {
    int v11 = 0;
  }
  else
  {
    int v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    int v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int v13 = [[MEMORY[0x1E4F1C9D8] dateWithYear:objc_msgSend(v6, "year") + 1 month:objc_msgSend(v6, "month") % 12 + 1 day:1];
    uint64_t v14 = [v12 dateFromComponents:v13];
    uint64_t v15 = [v12 dateFromComponents:v10];
    v22 = v9;
    if ([v15 compare:v14] == 1)
    {
      [v13 setYear:[v10 year]];
      uint64_t v16 = [v12 dateFromComponents:v13];

      v21 = (void *)v16;
      if ([v15 compare:v16] == 1) {
        [v13 setYear:[v13 year] + 1];
      }
      v25[0] = @"BalanceIdentifier";
      v25[1] = @"Balance";
      v26[0] = @"Points2";
      v26[1] = v9;
      v25[2] = @"BalanceCurrency";
      v25[3] = @"BalanceCurrencyExponent";
      v26[2] = @"XXX";
      v26[3] = &unk_1F24E1A68;
      v25[4] = @"BalanceExpirationDate";
      v26[4] = v13;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];
      [v11 addObject:v17];

      v18 = [MEMORY[0x1E4F1C9D8] dateWithYear:objc_msgSend(v13, "year") + 1 month:objc_msgSend(v13, "month") day:objc_msgSend(v13, "day")];
      v23[0] = @"BalanceIdentifier";
      v23[1] = @"Balance";
      v24[0] = @"Points1";
      v24[1] = v8;
      v23[2] = @"BalanceCurrency";
      v23[3] = @"BalanceCurrencyExponent";
      v24[2] = @"XXX";
      v24[3] = &unk_1F24E1A68;
      v23[4] = @"BalanceExpirationDate";
      v24[4] = v18;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
      [v11 addObject:v19];

      uint64_t v14 = v21;
    }
    else
    {
      [v13 setYear:[v13 year] + 1];
      v27[0] = @"BalanceIdentifier";
      v27[1] = @"Balance";
      v28[0] = @"Points1";
      v28[1] = v8;
      v27[2] = @"BalanceCurrency";
      v27[3] = @"BalanceCurrencyExponent";
      v28[2] = @"XXX";
      v28[3] = &unk_1F24E1A68;
      v27[4] = @"BalanceExpirationDate";
      v28[4] = v13;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
      [v11 addObject:v18];
    }

    id v9 = v22;
  }

  return v11;
}

@end