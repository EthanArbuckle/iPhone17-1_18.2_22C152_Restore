@interface DigitDialResultValidator
- (BOOL)_hasMinimumNumberOfDigits:(id)a3 countryCode:(id)a4;
- (BOOL)_isValidExceptionForDevice:(id)a3;
- (BOOL)_isValidExceptionForNetwork:(id)a3;
- (NSString)deviceCountryCode;
- (NSString)networkCountryCode;
- (id)_copyExceptionsForCountryCode:(id)a3;
- (id)validRecognitionResultFromRecognitionResult:(id)a3;
- (unint64_t)indexOfValidPhoneNumber:(id)a3;
- (void)setDeviceCountryCode:(id)a3;
- (void)setNetworkCountryCode:(id)a3;
@end

@implementation DigitDialResultValidator

- (NSString)deviceCountryCode
{
  deviceCountryCode = self->_deviceCountryCode;
  if (!deviceCountryCode)
  {
    TUHomeCountryCode();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceCountryCode;
    self->_deviceCountryCode = v4;

    deviceCountryCode = self->_deviceCountryCode;
  }

  return deviceCountryCode;
}

- (NSString)networkCountryCode
{
  networkCountryCode = self->_networkCountryCode;
  if (!networkCountryCode)
  {
    TUNetworkCountryCode();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_networkCountryCode;
    self->_networkCountryCode = v4;

    networkCountryCode = self->_networkCountryCode;
  }

  return networkCountryCode;
}

- (id)_copyExceptionsForCountryCode:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)[[NSString alloc] initWithFormat:@"Exceptions-%@", v3];
    v6 = VoiceDialBundle();
    v7 = [v6 pathForResource:v5 ofType:@"plist" inDirectory:@"DigitDialExceptions"];

    if (v7) {
      id v3 = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithContentsOfFile:v7];
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  id v8 = v3;

  return v8;
}

- (BOOL)_isValidExceptionForDevice:(id)a3
{
  id v4 = a3;
  deviceExceptions = self->_deviceExceptions;
  if (!deviceExceptions)
  {
    v6 = [(DigitDialResultValidator *)self deviceCountryCode];
    v7 = [(DigitDialResultValidator *)self _copyExceptionsForCountryCode:v6];
    id v8 = self->_deviceExceptions;
    self->_deviceExceptions = v7;

    deviceExceptions = self->_deviceExceptions;
  }
  BOOL v9 = [(NSArray *)deviceExceptions containsObject:v4];

  return v9;
}

- (BOOL)_isValidExceptionForNetwork:(id)a3
{
  id v4 = a3;
  networkExceptions = self->_networkExceptions;
  if (!networkExceptions)
  {
    v6 = [(DigitDialResultValidator *)self networkCountryCode];
    v7 = [(DigitDialResultValidator *)self _copyExceptionsForCountryCode:v6];
    id v8 = self->_networkExceptions;
    self->_networkExceptions = v7;

    networkExceptions = self->_networkExceptions;
  }
  BOOL v9 = [(NSArray *)networkExceptions containsObject:v4];

  return v9;
}

- (BOOL)_hasMinimumNumberOfDigits:(id)a3 countryCode:(id)a4
{
  uint64_t v4 = CFPhoneNumberCreate();
  if (!v4) {
    return 0;
  }
  v5 = (const void *)v4;
  v6 = (void *)CFPhoneNumberCopyUnformattedRepresentation();
  v7 = v6;
  if (v6) {
    BOOL v8 = (unint64_t)[v6 length] > 3;
  }
  else {
    BOOL v8 = 0;
  }
  CFRelease(v5);

  return v8;
}

- (unint64_t)indexOfValidPhoneNumber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (!v5)
  {
    BOOL v9 = 0;
    v10 = 0;
    v11 = 0;
LABEL_24:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  unint64_t v6 = v5;
  unint64_t v7 = 0;
  char v8 = 0;
  BOOL v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = v11;
    v11 = [v4 objectAtIndex:v7];

    uint64_t v13 = [v11 length];
    if (!v13) {
      goto LABEL_18;
    }
    uint64_t v14 = [(DigitDialResultValidator *)self deviceCountryCode];

    if (PNIsValidPhoneNumberForCountry()
      && [(DigitDialResultValidator *)self _hasMinimumNumberOfDigits:v11 countryCode:v14])
    {
      goto LABEL_22;
    }
    if (v9)
    {
      if (v8) {
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v9 = [(DigitDialResultValidator *)self networkCountryCode];
      if ((TUStringsAreEqualOrNil() & 1) == 0)
      {
LABEL_8:
        if (PNIsValidPhoneNumberForCountry()
          && [(DigitDialResultValidator *)self _hasMinimumNumberOfDigits:v11 countryCode:v9])
        {
          goto LABEL_22;
        }
        int v15 = 1;
        goto LABEL_13;
      }
    }
    int v15 = 0;
LABEL_13:
    if ([(DigitDialResultValidator *)self _isValidExceptionForDevice:v11]) {
      goto LABEL_22;
    }
    if (v15)
    {
      LODWORD(v13) = [(DigitDialResultValidator *)self _isValidExceptionForNetwork:v11];
      char v8 = 1;
    }
    else
    {
      LODWORD(v13) = 0;
      char v8 = 0;
    }
    v10 = (void *)v14;
LABEL_18:
    v7 += v13 ^ 1;
  }
  while ((v13 & 1) == 0 && v7 < v6);
  if (!v13) {
    goto LABEL_24;
  }
  uint64_t v14 = (uint64_t)v10;
LABEL_22:
  v10 = (void *)v14;
LABEL_25:

  return v7;
}

- (id)validRecognitionResultFromRecognitionResult:(id)a3
{
  id v9 = 0;
  id v4 = a3;
  DigitDialPhoneNumberFromResult(v4, &v9, 0);
  id v5 = v9;
  if ([(DigitDialResultValidator *)self indexOfValidPhoneNumber:v5] == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (void)setDeviceCountryCode:(id)a3
{
}

- (void)setNetworkCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkCountryCode, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_networkExceptions, 0);

  objc_storeStrong((id *)&self->_deviceExceptions, 0);
}

@end