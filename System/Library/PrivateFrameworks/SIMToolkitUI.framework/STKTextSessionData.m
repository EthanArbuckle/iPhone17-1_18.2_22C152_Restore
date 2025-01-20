@interface STKTextSessionData
- (NSString)simLabel;
- (NSString)text;
- (STKTextSessionData)init;
- (STKTextSessionData)initWithText:(id)a3 simLabel:(id)a4;
- (STKTextSessionData)initWithXPCDictionary:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation STKTextSessionData

- (STKTextSessionData)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"STKTextSessionData.m" lineNumber:20 description:@"Unavailable."];

  return 0;
}

- (STKTextSessionData)initWithText:(id)a3 simLabel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STKTextSessionData;
  v8 = [(STKTextSessionData *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    text = v8->_text;
    v8->_text = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    simLabel = v8->_simLabel;
    v8->_simLabel = (NSString *)v11;
  }
  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3 = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
}

- (STKTextSessionData)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = BSDeserializeStringFromXPCDictionaryWithKey();
  id v6 = BSDeserializeStringFromXPCDictionaryWithKey();

  id v7 = [(STKTextSessionData *)self initWithText:v5 simLabel:v6];
  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)simLabel
{
  return self->_simLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simLabel, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end