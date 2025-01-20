@interface INPersonHandle
- (id)tu_initUnlabledPersonHandleWithTUHandle:(id)a3 isoCountryCodes:(id)a4;
- (id)tu_normalizedHandleForISOCountryCode:(id)a3;
@end

@implementation INPersonHandle

- (id)tu_initUnlabledPersonHandleWithTUHandle:(id)a3 isoCountryCodes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 type];
  if (v7 == (id)1)
  {
    v9 = [v5 value];
    unsigned __int8 v10 = [v9 _appearsToBePhoneNumber];

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
  if (v7 == (id)2) {
    goto LABEL_5;
  }
  uint64_t v8 = v7 == (id)3;
LABEL_7:
  v13 = [v5 value];
LABEL_8:
  id v15 = [objc_alloc((Class)INPersonHandle) initWithValue:v13 type:v8 label:0];

  return v15;
}

- (id)tu_normalizedHandleForISOCountryCode:(id)a3
{
  id v4 = a3;
  id v5 = [(INPersonHandle *)self value];
  INPersonHandleType v6 = [(INPersonHandle *)self type];
  if (v6 == INPersonHandleTypePhoneNumber)
  {
    uint64_t v7 = +[TUHandle normalizedPhoneNumberHandleForValue:v5 isoCountryCode:v4];
  }
  else
  {
    if (v6 == INPersonHandleTypeEmailAddress) {
      +[TUHandle normalizedEmailAddressHandleForValue:v5];
    }
    else {
    uint64_t v7 = +[TUHandle normalizedHandleWithDestinationID:v5];
    }
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

@end