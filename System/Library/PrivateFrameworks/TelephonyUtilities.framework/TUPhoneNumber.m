@interface TUPhoneNumber
+ (BOOL)areDigits:(id)a3 equalToDigits:(id)a4 usingCountryCode:(id)a5;
+ (BOOL)supportsSecureCoding;
+ (TUPhoneNumber)phoneNumberWithCFPhoneNumberRef:(__CFPhoneNumber *)a3;
+ (TUPhoneNumber)phoneNumberWithDigits:(id)a3 countryCode:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)countryCode;
- (NSString)digits;
- (NSString)formattedInternationalRepresentation;
- (NSString)formattedRepresentation;
- (NSString)unformattedInternationalRepresentation;
- (TUPhoneNumber)initWithCFPhoneNumberRef:(__CFPhoneNumber *)a3;
- (TUPhoneNumber)initWithCoder:(id)a3;
- (TUPhoneNumber)initWithDigits:(id)a3 countryCode:(id)a4;
- (__CFPhoneNumber)phoneNumberRef;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPhoneNumberRef:(__CFPhoneNumber *)a3;
@end

@implementation TUPhoneNumber

- (TUPhoneNumber)initWithCFPhoneNumberRef:(__CFPhoneNumber *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUPhoneNumber;
  v4 = [(TUPhoneNumber *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      CFRetain(a3);
      v5->_phoneNumberRef = a3;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (TUPhoneNumber)initWithDigits:(id)a3 countryCode:(id)a4
{
  v5 = (const void *)CFPhoneNumberCreate();
  v6 = [(TUPhoneNumber *)self initWithCFPhoneNumberRef:v5];
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

+ (TUPhoneNumber)phoneNumberWithCFPhoneNumberRef:(__CFPhoneNumber *)a3
{
  v3 = [[TUPhoneNumber alloc] initWithCFPhoneNumberRef:a3];

  return v3;
}

+ (TUPhoneNumber)phoneNumberWithDigits:(id)a3 countryCode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [[TUPhoneNumber alloc] initWithDigits:v6 countryCode:v5];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUPhoneNumber)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Digits"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CountryCode"];

  objc_super v7 = [(TUPhoneNumber *)self initWithDigits:v5 countryCode:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TUPhoneNumber *)self digits];
  [v4 encodeObject:v5 forKey:@"Digits"];

  id v6 = [(TUPhoneNumber *)self countryCode];
  [v4 encodeObject:v6 forKey:@"CountryCode"];
}

- (void)dealloc
{
  phoneNumberRef = self->_phoneNumberRef;
  if (phoneNumberRef) {
    CFRelease(phoneNumberRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)TUPhoneNumber;
  [(TUPhoneNumber *)&v4 dealloc];
}

- (NSString)digits
{
  String = (void *)CFPhoneNumberCreateString();

  return (NSString *)String;
}

- (NSString)countryCode
{
  v2 = (void *)CFPhoneNumberCopyISOCountryCode();

  return (NSString *)v2;
}

- (NSString)formattedRepresentation
{
  String = (void *)CFPhoneNumberCreateString();

  return (NSString *)String;
}

- (NSString)formattedInternationalRepresentation
{
  String = (void *)CFPhoneNumberCreateString();

  return (NSString *)String;
}

- (NSString)unformattedInternationalRepresentation
{
  String = (void *)CFPhoneNumberCreateString();

  return (NSString *)String;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(TUPhoneNumber *)self phoneNumberRef];
    id v6 = (const void *)[v4 phoneNumberRef];
    BOOL v7 = 0;
    if (v5 && v6) {
      BOOL v7 = CFEqual(v5, v6) != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)areDigits:(id)a3 equalToDigits:(id)a4 usingCountryCode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a1 phoneNumberWithDigits:a3 countryCode:v8];
  v11 = [a1 phoneNumberWithDigits:v9 countryCode:v8];

  LOBYTE(v9) = [v10 isEqual:v11];
  return (char)v9;
}

- (__CFPhoneNumber)phoneNumberRef
{
  return self->_phoneNumberRef;
}

- (void)setPhoneNumberRef:(__CFPhoneNumber *)a3
{
  self->_phoneNumberRef = a3;
}

@end