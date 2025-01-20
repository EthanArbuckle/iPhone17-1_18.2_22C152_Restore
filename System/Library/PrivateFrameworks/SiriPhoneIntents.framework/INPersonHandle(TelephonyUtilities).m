@interface INPersonHandle(TelephonyUtilities)
- (id)tu_initUnlabledPersonHandleWithTUHandle:()TelephonyUtilities isoCountryCodes:;
- (id)tu_normalizedHandleForISOCountryCode:()TelephonyUtilities;
@end

@implementation INPersonHandle(TelephonyUtilities)

- (id)tu_initUnlabledPersonHandleWithTUHandle:()TelephonyUtilities isoCountryCodes:
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 type];
  if (v7 == 1)
  {
    v9 = [v5 value];
    char v10 = [v9 _appearsToBePhoneNumber];

    if ((v10 & 1) == 0)
    {
      v14 = [v5 value];
      LODWORD(v8) = [v14 _appearsToBeEmail];

      uint64_t v8 = v8;
      goto LABEL_7;
    }
LABEL_5:
    v11 = [v5 value];
    v12 = [v6 firstObject];
    v13 = TUFormattedPhoneNumber();

    uint64_t v8 = 2;
    goto LABEL_8;
  }
  if (v7 == 2) {
    goto LABEL_5;
  }
  uint64_t v8 = v7 == 3;
LABEL_7:
  v13 = [v5 value];
LABEL_8:
  v15 = (void *)[objc_alloc(MEMORY[0x263F0FD20]) initWithValue:v13 type:v8 label:0];

  return v15;
}

- (id)tu_normalizedHandleForISOCountryCode:()TelephonyUtilities
{
  id v4 = a3;
  id v5 = [a1 value];
  uint64_t v6 = [a1 type];
  if (v6 == 2)
  {
    uint64_t v7 = [MEMORY[0x263F7E248] normalizedPhoneNumberHandleForValue:v5 isoCountryCode:v4];
  }
  else
  {
    if (v6 == 1) {
      [MEMORY[0x263F7E248] normalizedEmailAddressHandleForValue:v5];
    }
    else {
    uint64_t v7 = [MEMORY[0x263F7E248] normalizedHandleWithDestinationID:v5];
    }
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

@end