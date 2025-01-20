@interface RMModelStatusTestDictionaryValue
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithKey1:(id)a3;
+ (id)buildWithKey1:(id)a3 key2:(id)a4;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)statusKey1;
- (NSString)statusKey2;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusKey1:(id)a3;
- (void)setStatusKey2:(id)a3;
@end

@implementation RMModelStatusTestDictionaryValue

+ (NSSet)allowedStatusKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"key1";
  v6[1] = @"key2";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"test.dictionary-value";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)buildWithKey1:(id)a3 key2:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusKey1:v6];

  [v7 setStatusKey2:v5];
  return v7;
}

+ (id)buildRequiredOnlyWithKey1:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusKey1:v3];

  return v4;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C3B40;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0EE8];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0F00];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C3B58;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0F18];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0F30];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C3B70;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0F48];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0F60];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C3B88;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0F78];
  v24[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0F90];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C3BA0;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0FA8];
  v23[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0FC0];
  v23[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C3BB8;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0FD8];
  v22[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0FF0];
  v22[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelStatusTestDictionaryValue allowedStatusKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"key1" forKeyPath:@"statusKey1" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"key2" forKeyPath:@"statusKey2" isRequired:0 defaultValue:0 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  id v5 = [(RMModelStatusTestDictionaryValue *)self statusKey1];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"key1" value:v5 isRequired:1 defaultValue:0];

  id v6 = [(RMModelStatusTestDictionaryValue *)self statusKey2];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"key2" value:v6 isRequired:0 defaultValue:0];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RMModelStatusTestDictionaryValue;
  v4 = [(RMModelPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusKey1 copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusKey2 copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)statusKey1
{
  return self->_statusKey1;
}

- (void)setStatusKey1:(id)a3
{
}

- (NSString)statusKey2
{
  return self->_statusKey2;
}

- (void)setStatusKey2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusKey2, 0);
  objc_storeStrong((id *)&self->_statusKey1, 0);
}

@end