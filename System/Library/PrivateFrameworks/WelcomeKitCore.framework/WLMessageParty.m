@interface WLMessageParty
+ (id)_guessIccForNumber:(id)a3;
+ (id)_normalize:(id)a3;
- (BOOL)isPhoneNumber;
- (NSString)address;
- (NSString)ccAcNumber;
- (NSString)icc;
- (NSString)np;
- (id)_initWithAddress:(id)a3 addCountryCode:(BOOL)a4 sqlController:(id)a5;
@end

@implementation WLMessageParty

- (id)_initWithAddress:(id)a3 addCountryCode:(BOOL)a4 sqlController:(id)a5
{
  BOOL v6 = a4;
  v8 = (__CFString *)a3;
  id v9 = a5;
  v82.receiver = self;
  v82.super_class = (Class)WLMessageParty;
  v10 = [(WLMessageParty *)&v82 init];
  if (!v10) {
    goto LABEL_47;
  }
  if ([(__CFString *)v8 isEqualToString:@"insert-address-token"])
  {
    _WLLog();

    v8 = &stru_26DF81F20;
  }
  uint64_t v11 = [(__CFString *)v8 length];
  v10->_isPhoneNumber = v11 != 0;
  if (!v11) {
    goto LABEL_46;
  }
  if ([(__CFString *)v8 length])
  {
    uint64_t v12 = 0;
    while (1)
    {
      int v13 = [(__CFString *)v8 characterAtIndex:v12];
      if ((v13 - 97) < 0x1A || (v13 - 64) <= 0x1A) {
        break;
      }
      if (++v12 >= (unint64_t)[(__CFString *)v8 length]) {
        goto LABEL_13;
      }
    }
    v10->_isPhoneNumber = 0;
    goto LABEL_46;
  }
LABEL_13:
  if (!v10->_isPhoneNumber)
  {
LABEL_46:
    objc_storeStrong((id *)&v10->_address, v8);
    icc = v10->_icc;
    v10->_icc = 0;

    np = v10->_np;
    v10->_np = 0;

    objc_storeStrong((id *)&v10->_ccAcNumber, v8);
    goto LABEL_47;
  }
  v15 = [MEMORY[0x263EFF960] currentLocale];
  v16 = [v15 countryCode];

  if (![(__CFString *)v16 length])
  {

    v16 = @"US";
  }
  uint64_t v17 = PNCopyBestGuessNormalizedNumberForCountry();
  if (!v17)
  {
    v68 = v8;
    _WLLog();
    v10->_isPhoneNumber = 0;
    goto LABEL_33;
  }
  v18 = (void *)v17;
  uint64_t v19 = [NSString stringWithUTF8String:v17];
  address = v10->_address;
  v10->_address = (NSString *)v19;

  v72 = v10->_address;
  _WLLog();
  free(v18);
  uint64_t v21 = [(NSString *)v10->_address length];
  v10->_isPhoneNumber = v21 != 0;
  if (!v21)
  {
LABEL_33:
    uint64_t v44 = +[WLMessageParty _normalize:](WLMessageParty, "_normalize:", v8, v68);

    v8 = (__CFString *)v44;
    goto LABEL_45;
  }
  v77 = v9;
  long long v80 = *(_OWORD *)(MEMORY[0x263F36D88] + 32);
  long long v81 = *(_OWORD *)(MEMORY[0x263F36D88] + 48);
  long long v78 = *MEMORY[0x263F36D88];
  long long v79 = *(_OWORD *)(MEMORY[0x263F36D88] + 16);
  [(NSString *)v10->_address UTF8String];
  uint64_t v22 = PNDecomposeForCountry();
  char v76 = v22;
  v75 = v10->_address;
  v23 = [NSNumber numberWithBool:v22];
  v24 = [NSNumber numberWithUnsignedInt:DWORD2(v79)];
  v25 = [NSNumber numberWithUnsignedInt:DWORD2(v80)];
  v74 = [NSNumber numberWithUnsignedInt:DWORD2(v81)];
  v69 = v75;
  v73 = v23;
  _WLLog();

  if (v76)
  {
    ccAcNumber = v10->_ccAcNumber;
    v10->_ccAcNumber = (NSString *)&stru_26DF81F20;

    if (*((void *)&v78 + 1))
    {
      uint64_t v27 = objc_msgSend(NSString, "stringWithUTF8String:", v75, v23, v78, (void)v79, v24, (void)v80, v25, (void)v81, v74);
      v28 = v10->_np;
      v10->_np = (NSString *)v27;
    }
    id v9 = v77;
    if ((void)v79 && DWORD2(v79))
    {
      v29 = v10->_ccAcNumber;
      v30 = (void *)[[NSString alloc] initWithBytes:(void)v79 length:DWORD2(v79) encoding:4];
      uint64_t v31 = [(NSString *)v29 stringByAppendingString:v30];
      v32 = v10->_ccAcNumber;
      v10->_ccAcNumber = (NSString *)v31;
    }
    if ((void)v80 && DWORD2(v80))
    {
      v33 = v10->_ccAcNumber;
      v34 = (void *)[[NSString alloc] initWithBytes:(void)v80 length:DWORD2(v80) encoding:4];
      uint64_t v35 = [(NSString *)v33 stringByAppendingString:v34];
      v36 = v10->_ccAcNumber;
      v10->_ccAcNumber = (NSString *)v35;
    }
    if ((void)v81 && DWORD2(v81))
    {
      v37 = v10->_ccAcNumber;
      v38 = (void *)[[NSString alloc] initWithBytes:(void)v81 length:DWORD2(v81) encoding:4];
      uint64_t v39 = [(NSString *)v37 stringByAppendingString:v38];
      v40 = v10->_ccAcNumber;
      v10->_ccAcNumber = (NSString *)v39;
    }
    v41 = v10->_np;
    v42 = v10->_ccAcNumber;
    if (v41)
    {
      v43 = [(NSString *)v41 stringByAppendingString:v42];
    }
    else
    {
      v43 = v42;
    }
    v45 = v43;
    if ([(__CFString *)v43 length])
    {
      unint64_t v46 = [(NSString *)v10->_address length];
      if (v46 >= [(__CFString *)v45 length])
      {
        uint64_t v47 = [(NSString *)v10->_address length];
        uint64_t v48 = [(__CFString *)v45 length];
        v49 = [(NSString *)v10->_address substringFromIndex:v47 - v48];
        if ([(__CFString *)v49 isEqualToString:v45])
        {
          if (v47 == v48)
          {
            p_icc = (id *)&v10->_icc;
            v50 = v10->_icc;
            v10->_icc = 0;
          }
          else
          {
            uint64_t v57 = [(NSString *)v10->_address substringToIndex:v47 - v48];
            p_icc = (id *)&v10->_icc;
            v50 = v10->_icc;
            v10->_icc = (NSString *)v57;
          }
          id v9 = v77;

          if (*p_icc)
          {
            char v58 = [*p_icc hasPrefix:@"+"];
            id v59 = *p_icc;
            if ((v58 & 1) == 0)
            {
              uint64_t v60 = [@"+" stringByAppendingString:*p_icc];
              id v61 = *p_icc;
              id *p_icc = (id)v60;

              id v59 = *p_icc;
            }
          }
          else
          {
            id v59 = 0;
          }
          if (!v59 && v6)
          {
            uint64_t v62 = [v77 messagePhoneNumberIccForCcAcNumber:v10->_ccAcNumber];
            v63 = v10->_icc;
            v10->_icc = (NSString *)v62;

            id v71 = v10->_icc;
            v73 = (__CFString *)v10->_ccAcNumber;
            _WLLog();
            id v59 = v10->_icc;
            if (v59) {
              goto LABEL_58;
            }
            uint64_t v64 = +[WLMessageParty _guessIccForNumber:](WLMessageParty, "_guessIccForNumber:", v45, v71, v73);
            id v65 = *p_icc;
            id *p_icc = (id)v64;

            id v71 = *p_icc;
            v73 = v45;
            _WLLog();
            id v59 = *p_icc;
          }
          if (!v59)
          {
            v66 = v10->_ccAcNumber;
            goto LABEL_60;
          }
LABEL_58:
          objc_msgSend(v59, "stringByAppendingString:", v10->_ccAcNumber, v71, v73);
          v66 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_60:
          v67 = v10->_address;
          v10->_address = v66;

          v53 = v49;
          goto LABEL_43;
        }

        id v9 = v77;
      }
    }
    _WLLog();
    v10->_isPhoneNumber = 0;
    uint64_t v52 = +[WLMessageParty _normalize:](WLMessageParty, "_normalize:", v8, v45, v8);
    v53 = v8;
    v8 = (__CFString *)v52;
LABEL_43:

    goto LABEL_44;
  }
  v10->_isPhoneNumber = 0;
  v70 = v10->_address;
  _WLLog();
  +[WLMessageParty _normalize:](WLMessageParty, "_normalize:", v8, v70, v23, v78, (void)v79, v24, (void)v80, v25, (void)v81, v74);
  v45 = v8;
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v9 = v77;
LABEL_44:

LABEL_45:
  if (!v10->_isPhoneNumber) {
    goto LABEL_46;
  }
LABEL_47:

  return v10;
}

+ (id)_guessIccForNumber:(id)a3
{
  id v3 = a3;
  if (_guessIccForNumber__onceToken != -1) {
    dispatch_once(&_guessIccForNumber__onceToken, &__block_literal_global_352);
  }
  if (_guessIccForNumber__icc)
  {
    v4 = [(id)_guessIccForNumber__icc stringByAppendingString:v3];
    long long v13 = *(_OWORD *)(MEMORY[0x263F36D88] + 16);
    long long v14 = *(_OWORD *)(MEMORY[0x263F36D88] + 32);
    long long v15 = *(_OWORD *)(MEMORY[0x263F36D88] + 48);
    id v5 = v4;
    [v5 UTF8String];
    uint64_t v6 = PNDecomposeForCountry();
    v7 = [NSNumber numberWithBool:v6];
    v8 = [NSNumber numberWithUnsignedInt:DWORD2(v13)];
    id v9 = [NSNumber numberWithUnsignedInt:DWORD2(v14)];
    uint64_t v12 = [NSNumber numberWithUnsignedInt:DWORD2(v15)];
    _WLLog();

    if (v6) {
      id v10 = (id)_guessIccForNumber__icc;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __37__WLMessageParty__guessIccForNumber___block_invoke()
{
  v0 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v1 = [v0 countryCode];
  v2 = (void *)_guessIccForNumber__countryCode;
  _guessIccForNumber__countryCode = v1;

  if (![(id)_guessIccForNumber__countryCode length])
  {
    id v3 = (void *)_guessIccForNumber__countryCode;
    _guessIccForNumber__countryCode = @"US";
  }
  uint64_t v4 = _PNCopyInternationalCodeForCountry();
  id v5 = (void *)_guessIccForNumber__icc;
  _guessIccForNumber__icc = v4;

  uint64_t v6 = [(id)_guessIccForNumber__icc length];
  v7 = (void *)_guessIccForNumber__icc;
  if (v6)
  {
    uint64_t v6 = [@"+" stringByAppendingString:_guessIccForNumber__icc];
    v7 = (void *)_guessIccForNumber__icc;
  }
  _guessIccForNumber__icc = v6;

  return _WLLog();
}

+ (id)_normalize:(id)a3
{
  uint64_t v3 = _normalize__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_normalize__onceToken, &__block_literal_global_360);
  }
  int v5 = [v4 hasPrefix:@"+"];
  uint64_t v6 = objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[^0-9]", &stru_26DF81F20, 1024, 0, objc_msgSend(v4, "length"));

  if (v5)
  {
    uint64_t v7 = [@"+" stringByAppendingString:v6];
  }
  else
  {
    if ([v6 hasPrefix:@"0"])
    {
      uint64_t v8 = [v6 substringFromIndex:1];

      uint64_t v6 = (void *)v8;
    }
    uint64_t v7 = [NSString stringWithFormat:@"+%@%@", _normalize__internationalCallingCode, v6];
  }
  id v9 = (void *)v7;

  return v9;
}

void __29__WLMessageParty__normalize___block_invoke()
{
  v0 = [MEMORY[0x263EFF960] currentLocale];
  int v5 = [v0 countryCode];

  if ([(__CFString *)v5 length])
  {
    uint64_t v1 = v5;
  }
  else
  {

    uint64_t v1 = @"US";
  }
  uint64_t v6 = v1;
  uint64_t v2 = _PNCopyInternationalCodeForCountry();
  uint64_t v3 = (void *)_normalize__internationalCallingCode;
  _normalize__internationalCallingCode = v2;

  if (![(id)_normalize__internationalCallingCode length])
  {
    id v4 = (void *)_normalize__internationalCallingCode;
    _normalize__internationalCallingCode = @"1";
  }
  _WLLog();
}

- (BOOL)isPhoneNumber
{
  return self->_isPhoneNumber;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)icc
{
  return self->_icc;
}

- (NSString)np
{
  return self->_np;
}

- (NSString)ccAcNumber
{
  return self->_ccAcNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ccAcNumber, 0);
  objc_storeStrong((id *)&self->_np, 0);
  objc_storeStrong((id *)&self->_icc, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end