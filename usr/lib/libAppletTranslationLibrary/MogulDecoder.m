@interface MogulDecoder
+ (BOOL)isTopUpTransactionType:(unsigned __int8)a3;
+ (id)decodeCardID:(id)a3;
+ (id)decodeCardIssueDate:(id)a3;
+ (id)decodeChargeAmountFlagValue:(id)a3;
+ (id)decodePointsData:(id)a3 andWith:(id)a4;
+ (id)decodeTransactionHistoryEntry:(id)a3;
+ (id)decodeTransactionTypeCode:(unsigned __int8)a3;
+ (id)getPurseBalance:(id)a3;
+ (int)decodeEnableFlag:(id)a3;
+ (unsigned)decodeStatusFlag:(id)a3;
+ (unsigned)decodeTopupFlag:(id)a3;
+ (unsigned)decodeTopupSettings:(id)a3;
@end

@implementation MogulDecoder

+ (id)decodeCardID:(id)a3
{
  return (id)[a3 subdataWithRange:0, 8];
}

+ (unsigned)decodeStatusFlag:(id)a3
{
  return [a3 u8:0];
}

+ (id)decodeCardIssueDate:(id)a3
{
  unsigned int v3 = [a3 u16BE:1];
  uint64_t v4 = (v3 >> 5) & 0xF;
  uint64_t v5 = (v3 >> 9) + 2000;
  uint64_t v6 = v3 & 0x1F;
  v7 = (void *)MEMORY[0x1E4F1C9D8];

  return (id)[v7 dateWithYear:v5 month:v4 day:v6];
}

+ (int)decodeEnableFlag:(id)a3
{
  return [a3 u8:3] == 1;
}

+ (id)decodeTransactionHistoryEntry:(id)a3
{
  v21[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isAll00])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [v4 u8:0];
    unsigned int v7 = [v4 u32BE:1];
    unsigned int v8 = [v4 u32BE:5];
    unsigned int v9 = [v4 u32BE:9];
    uint64_t v10 = [v4 u16BE:13];
    v11 = [MEMORY[0x1E4F1C9D8] dateWithYear:((v9 >> 21) & 0x7F) + 2000 month:(v9 >> 17) & 0xF day:(v9 >> 12) & 0x1F hour:(v9 >> 6) & 0x3F minute:v9 & 0x3F second:0];
    v12 = [a1 decodeTransactionTypeCode:v6];
    unsigned int v13 = [a1 isTopUpTransactionType:v6];
    if (v7) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    v15 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v7 exponent:0 isNegative:v14];
    v16 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v8 exponent:0 isNegative:0];
    v21[0] = v15;
    v20[0] = @"Amount";
    v20[1] = @"TypeDetailRaw";
    v17 = [NSNumber numberWithUnsignedChar:v6];
    v21[1] = v17;
    v21[2] = v11;
    v20[2] = @"TransactionTime";
    v20[3] = @"TypeDetail";
    v21[3] = v12;
    v20[4] = @"SerialNumber";
    v18 = [NSNumber numberWithUnsignedShort:v10];
    v20[5] = @"FinalBalance";
    v21[4] = v18;
    v21[5] = v16;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  }

  return v5;
}

+ (id)decodeTransactionTypeCode:(unsigned __int8)a3
{
  int v3 = a3;
  id v4 = +[AppletConfigurationData getSlalomSettings];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"mogul"];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"transactionType"];

  if (!v6
    || (objc_msgSend(NSString, "stringWithFormat:", @"%d", v3),
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        [v6 valueForKey:v7],
        unsigned int v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (v3 <= 110)
    {
      switch(v3)
      {
        case '[':
        case ']':
          unsigned int v8 = @"CardRead";
          break;
        case '\\':
        case '^':
          goto LABEL_13;
        default:
          if (v3 == 56) {
            goto LABEL_13;
          }
          if (v3 != 71) {
            goto LABEL_19;
          }
          unsigned int v8 = @"Purchase";
          break;
      }
    }
    else
    {
      char v9 = v3 - 111;
      if ((v3 - 111) > 0x16) {
        goto LABEL_19;
      }
      if (((1 << v9) & 0x833) != 0)
      {
LABEL_13:
        unsigned int v8 = @"TopUp";
        goto LABEL_14;
      }
      if (((1 << v9) & 0x500000) != 0)
      {
        unsigned int v8 = @"Points";
        goto LABEL_14;
      }
      if (v3 == 119) {
        unsigned int v8 = @"TopUpAuto";
      }
      else {
LABEL_19:
      }
        unsigned int v8 = @"Unknown";
    }
  }
LABEL_14:

  return v8;
}

+ (id)getPurseBalance:(id)a3
{
  uint64_t v3 = *(unsigned int *)[a3 bytes];
  id v4 = (void *)MEMORY[0x1E4F28C28];

  return (id)[v4 decimalNumberWithMantissa:v3 exponent:0 isNegative:0];
}

+ (id)decodePointsData:(id)a3 andWith:(id)a4
{
  id v5 = a4;
  char v6 = [a3 u8:0];
  unsigned int v7 = 0;
  if (v6)
  {
    unsigned int v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    uint64_t v8 = 0;
    char v9 = 1;
    do
    {
      uint64_t v10 = objc_opt_new();
      v11 = [NSNumber numberWithInt:[v5 s24BE:v8]];
      [v10 setBalance:v11];

      unsigned int v12 = [v5 u16BE:v8 + 3];
      unsigned int v13 = [MEMORY[0x1E4F1C9D8] dateWithYear:(v12 >> 9) + 2000 month:(v12 >> 5) & 0xF day:v12 & 0x1F];
      [v13 setHour:23];
      [v13 setMinute:59];
      [v13 setSecond:59];
      [v10 setExpiration:v13];
      int v14 = v9 & 1;
      if (v9) {
        v15 = @"Points1";
      }
      else {
        v15 = @"Points2";
      }
      [v10 setName:v15];
      [v7 addObject:v10];

      char v9 = 0;
      v8 += 5;
    }
    while (v14);
  }

  return v7;
}

+ (id)decodeChargeAmountFlagValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 u8:6];
  int v5 = [v3 u8:5];

  char v6 = 0;
  if (v5 && v4)
  {
    unsigned int v7 = +[AppletConfigurationData getSlalomSettings];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"mogul"];
    char v9 = [v8 objectForKeyedSubscript:@"rechargeAmountCodes"];

    if (v9
      && (objc_msgSend(NSString, "stringWithFormat:", @"%d", v4),
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v9 valueForKey:v10],
          v11 = objc_claimAutoreleasedReturnValue(),
          v10,
          v11))
    {
      char v6 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:[v11 unsignedLongValue] exponent:0 isNegative:0];
    }
    else
    {
      switch((int)v4)
      {
        case 1:
        case 11:
        case 21:
        case 31:
        case 41:
        case 51:
        case 61:
        case 71:
        case 81:
        case 91:
        case 101:
        case 111:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 5000;
          goto LABEL_17;
        case 2:
        case 12:
        case 22:
        case 32:
        case 42:
        case 52:
        case 62:
        case 72:
        case 82:
        case 92:
        case 102:
        case 112:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 6000;
          goto LABEL_17;
        case 3:
        case 13:
        case 23:
        case 33:
        case 43:
        case 53:
        case 63:
        case 73:
        case 83:
        case 93:
        case 103:
        case 113:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 7000;
          goto LABEL_17;
        case 4:
        case 14:
        case 24:
        case 34:
        case 44:
        case 54:
        case 64:
        case 74:
        case 84:
        case 94:
        case 104:
        case 114:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 8000;
          goto LABEL_17;
        case 5:
        case 15:
        case 25:
        case 35:
        case 45:
        case 55:
        case 65:
        case 75:
        case 85:
        case 95:
        case 105:
        case 115:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 9000;
          goto LABEL_17;
        case 6:
        case 16:
        case 26:
        case 36:
        case 46:
        case 56:
        case 66:
        case 76:
        case 86:
        case 96:
        case 106:
        case 116:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 10000;
          goto LABEL_17;
        case 7:
        case 17:
        case 27:
        case 37:
        case 47:
        case 57:
        case 67:
        case 77:
        case 87:
        case 97:
        case 107:
        case 117:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 15000;
          goto LABEL_17;
        case 8:
        case 18:
        case 28:
        case 38:
        case 48:
        case 58:
        case 68:
        case 78:
        case 88:
        case 98:
        case 108:
        case 118:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 20000;
          goto LABEL_17;
        case 9:
        case 19:
        case 29:
        case 39:
        case 49:
        case 59:
        case 69:
        case 79:
        case 89:
        case 99:
        case 109:
        case 119:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 25000;
          goto LABEL_17;
        case 10:
        case 20:
        case 30:
        case 40:
        case 50:
        case 60:
        case 70:
        case 80:
        case 90:
        case 100:
        case 110:
        case 120:
          unsigned int v12 = (void *)MEMORY[0x1E4F28C28];
          uint64_t v13 = 30000;
LABEL_17:
          char v6 = [v12 decimalNumberWithMantissa:v13 exponent:0 isNegative:0];
          break;
        default:
          char v6 = 0;
          break;
      }
    }
  }

  return v6;
}

+ (unsigned)decodeTopupFlag:(id)a3
{
  return [a3 u8:5];
}

+ (unsigned)decodeTopupSettings:(id)a3
{
  return [a3 u8:6];
}

+ (BOOL)isTopUpTransactionType:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v4 = +[AppletConfigurationData getSlalomSettings];
  int v5 = [v4 objectForKeyedSubscript:@"mogul"];
  char v6 = [v5 objectForKeyedSubscript:@"topupCodes"];

  if (v6
    && (objc_msgSend(NSString, "stringWithFormat:", @"%d", v3),
        unsigned int v7 = objc_claimAutoreleasedReturnValue(),
        [v6 valueForKey:v7],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    char v9 = [v8 BOOLValue];
  }
  else
  {
    char v9 = 1;
    if (v3 - 92 > 0x29 || ((1 << (v3 - 92)) & 0x28049980005) == 0) {
      char v9 = v3 == 56;
    }
  }

  return v9;
}

@end