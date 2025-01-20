@interface CKSettingsCriticalMessagesAppRecipient
- (BOOL)isActive;
- (CKSettingsCriticalMessagesAppRecipient)initWithRecipient:(id)a3 isActive:(BOOL)a4;
- (IMBackgroundMessageRecipient)recipient;
- (NSNumber)literalNumber;
- (NSString)formattedPhoneNumber;
- (NSString)numberRepresentation;
- (id)_formattedPhoneNumberForNumber:(id)a3;
- (id)getIMRecipient;
- (id)number;
- (void)setActive:(BOOL)a3;
- (void)setLiteralNumber:(id)a3;
- (void)setNumberRepresentation:(id)a3;
- (void)updateActive:(BOOL)a3;
@end

@implementation CKSettingsCriticalMessagesAppRecipient

- (CKSettingsCriticalMessagesAppRecipient)initWithRecipient:(id)a3 isActive:(BOOL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKSettingsCriticalMessagesAppRecipient;
  v8 = [(CKSettingsCriticalMessagesAppRecipient *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recipient, a3);
    v9->_isActive = a4;
    v10 = [v7 phoneNumber];
    uint64_t v11 = [(CKSettingsCriticalMessagesAppRecipient *)v9 _formattedPhoneNumberForNumber:v10];
    formattedPhoneNumber = v9->_formattedPhoneNumber;
    v9->_formattedPhoneNumber = (NSString *)v11;
  }
  return v9;
}

- (id)_formattedPhoneNumberForNumber:(id)a3
{
  id v3 = a3;
  if (!sCountryCode)
  {
    v4 = [MEMORY[0x263EFF960] currentLocale];
    v5 = [v4 objectForKey:*MEMORY[0x263EFF4D0]];
    uint64_t v6 = [v5 lowercaseString];
    id v7 = (void *)sCountryCode;
    sCountryCode = v6;
  }
  uint64_t v8 = CFPhoneNumberCreate();
  if (v8)
  {
    v9 = (const void *)v8;
    uint64_t String = CFPhoneNumberCreateString();
    if (String)
    {
      uint64_t v11 = (void *)String;
      CFRelease(v9);
LABEL_7:
      id v12 = [NSString stringWithFormat:@"+%@", v11];

      goto LABEL_9;
    }
    uint64_t v11 = (void *)CFPhoneNumberCreateString();
    CFRelease(v9);
    if (v11) {
      goto LABEL_7;
    }
  }
  id v12 = v3;
LABEL_9:

  return v12;
}

- (void)updateActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (id)number
{
  literalNumber = self->_literalNumber;
  if (!literalNumber)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v4 setNumberStyle:1];
    v5 = [(IMBackgroundMessageRecipient *)self->_recipient phoneNumber];
    uint64_t v6 = [v4 numberFromString:v5];
    id v7 = self->_literalNumber;
    self->_literalNumber = v6;

    literalNumber = self->_literalNumber;
  }
  return literalNumber;
}

- (id)getIMRecipient
{
  return self->_recipient;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSString)formattedPhoneNumber
{
  return self->_formattedPhoneNumber;
}

- (IMBackgroundMessageRecipient)recipient
{
  return self->_recipient;
}

- (NSNumber)literalNumber
{
  return self->_literalNumber;
}

- (void)setLiteralNumber:(id)a3
{
}

- (NSString)numberRepresentation
{
  return self->_numberRepresentation;
}

- (void)setNumberRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberRepresentation, 0);
  objc_storeStrong((id *)&self->_literalNumber, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_formattedPhoneNumber, 0);
}

@end