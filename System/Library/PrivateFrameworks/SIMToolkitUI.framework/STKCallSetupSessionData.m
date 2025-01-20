@interface STKCallSetupSessionData
- (BOOL)isHighPriority;
- (NSString)phoneNumber;
- (STKCallSetupSessionData)initWithText:(id)a3 simLabel:(id)a4 phoneNumber:(id)a5;
- (STKCallSetupSessionData)initWithXPCDictionary:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation STKCallSetupSessionData

- (STKCallSetupSessionData)initWithText:(id)a3 simLabel:(id)a4 phoneNumber:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)STKCallSetupSessionData;
  v10 = [(STKTextSessionData *)&v13 initWithText:a3 simLabel:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_phoneNumber, a5);
  }

  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STKCallSetupSessionData;
  id v4 = a3;
  [(STKTextSessionData *)&v5 encodeWithXPCDictionary:v4];
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(v4, "_callPriority", self->_isHighPriority);
}

- (STKCallSetupSessionData)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STKCallSetupSessionData;
  objc_super v5 = [(STKTextSessionData *)&v10 initWithXPCDictionary:v4];
  if (v5
    && (v5->_isHighPriority = xpc_dictionary_get_BOOL(v4, "_callPriority"),
        BSDeserializeStringFromXPCDictionaryWithKey(),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        phoneNumber = v5->_phoneNumber,
        v5->_phoneNumber = (NSString *)v6,
        phoneNumber,
        !v5->_phoneNumber))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (BOOL)isHighPriority
{
  return self->_isHighPriority;
}

- (void).cxx_destruct
{
}

@end