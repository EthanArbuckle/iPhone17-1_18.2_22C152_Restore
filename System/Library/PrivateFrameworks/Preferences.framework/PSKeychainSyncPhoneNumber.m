@interface PSKeychainSyncPhoneNumber
+ (id)phoneNumberWithDigits:(id)a3 countryInfo:(id)a4;
- (KeychainSyncCountryInfo)countryInfo;
- (NSString)digits;
- (id)_stringByAddingDialingPrefixToString:(id)a3;
- (id)formattedAndObfuscatedString;
- (id)formattedString;
- (id)formattedStringWithDialingPrefix;
- (void)setCountryInfo:(id)a3;
- (void)setDigits:(id)a3;
@end

@implementation PSKeychainSyncPhoneNumber

+ (id)phoneNumberWithDigits:(id)a3 countryInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(PSKeychainSyncPhoneNumber);
  [(PSKeychainSyncPhoneNumber *)v7 setDigits:v6];

  [(PSKeychainSyncPhoneNumber *)v7 setCountryInfo:v5];
  return v7;
}

- (id)_stringByAddingDialingPrefixToString:(id)a3
{
  id v4 = a3;
  id v5 = [(PSKeychainSyncPhoneNumber *)self countryInfo];
  id v6 = [v5 dialingPrefix];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = NSString;
    v9 = [(PSKeychainSyncPhoneNumber *)self countryInfo];
    v10 = [v9 dialingPrefix];
    uint64_t v11 = [v8 stringWithFormat:@"+%@ %@", v10, v4];

    id v4 = (id)v11;
  }
  return v4;
}

- (id)formattedString
{
  v3 = [(PSKeychainSyncPhoneNumber *)self digits];
  id v4 = [(PSKeychainSyncPhoneNumber *)self countryInfo];
  id v5 = [v4 countryCode];

  if ([v5 length])
  {
    uint64_t v6 = [v5 lowercaseString];
    uint64_t v7 = [(PSKeychainSyncPhoneNumber *)self digits];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    v8 = (uint64_t (*)(void, NSString *, uint64_t))getCFPhoneNumberCreateSymbolLoc_ptr;
    v20 = getCFPhoneNumberCreateSymbolLoc_ptr;
    if (!getCFPhoneNumberCreateSymbolLoc_ptr)
    {
      v9 = (void *)PhoneNumbersLibrary_0();
      v18[3] = (uint64_t)dlsym(v9, "CFPhoneNumberCreate");
      getCFPhoneNumberCreateSymbolLoc_ptr = (_UNKNOWN *)v18[3];
      v8 = (uint64_t (*)(void, NSString *, uint64_t))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (v8)
    {
      uint64_t v10 = v8(0, v7, v6);
      if (!v10) {
        goto LABEL_10;
      }
      uint64_t v11 = (const void *)v10;
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2020000000;
      v12 = (uint64_t (*)(void, const void *, uint64_t))getCFPhoneNumberCreateStringSymbolLoc_ptr;
      v20 = getCFPhoneNumberCreateStringSymbolLoc_ptr;
      if (!getCFPhoneNumberCreateStringSymbolLoc_ptr)
      {
        v13 = (void *)PhoneNumbersLibrary_0();
        v18[3] = (uint64_t)dlsym(v13, "CFPhoneNumberCreateString");
        getCFPhoneNumberCreateStringSymbolLoc_ptr = (_UNKNOWN *)v18[3];
        v12 = (uint64_t (*)(void, const void *, uint64_t))v18[3];
      }
      _Block_object_dispose(&v17, 8);
      if (v12)
      {
        uint64_t v14 = v12(0, v11, 1);

        CFRelease(v11);
        v3 = (void *)v14;
        goto LABEL_10;
      }
    }
    else
    {
      -[PSContactsAuthorizationLevelController dealloc]();
    }
    v16 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v17, 8);
    _Unwind_Resume(v16);
  }
LABEL_10:

  return v3;
}

- (id)formattedStringWithDialingPrefix
{
  v3 = [(PSKeychainSyncPhoneNumber *)self formattedString];
  id v4 = [(PSKeychainSyncPhoneNumber *)self _stringByAddingDialingPrefixToString:v3];

  return v4;
}

- (id)formattedAndObfuscatedString
{
  v3 = [(PSKeychainSyncPhoneNumber *)self formattedString];
  if ((unint64_t)[v3 length] < 3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = (void *)[v3 mutableCopy];
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 9679);
    uint64_t v6 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    uint64_t v7 = [v4 length];
    if (v7 - 1 >= 0)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      do
      {
        if (objc_msgSend(v6, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", --v8)))
        {
          if (v9 > 1) {
            objc_msgSend(v4, "replaceCharactersInRange:withString:", v8, 1, v5);
          }
          else {
            ++v9;
          }
        }
      }
      while (v8 > 0);
    }
  }
  uint64_t v10 = [(PSKeychainSyncPhoneNumber *)self _stringByAddingDialingPrefixToString:v4];

  return v10;
}

- (NSString)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
}

- (KeychainSyncCountryInfo)countryInfo
{
  return self->_countryInfo;
}

- (void)setCountryInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryInfo, 0);
  objc_storeStrong((id *)&self->_digits, 0);
}

@end