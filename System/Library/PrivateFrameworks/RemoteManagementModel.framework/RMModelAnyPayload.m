@interface RMModelAnyPayload
+ (id)buildFromDictionary:(id)a3;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSDictionary)dictKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)setDictKeys:(id)a3;
@end

@implementation RMModelAnyPayload

+ (id)buildFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 loadFromDictionary:v3 serializationType:0 error:0];

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  v6 = (NSDictionary *)[a3 copy];
  dictKeys = self->_dictKeys;
  self->_dictKeys = v6;

  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  id v3 = (void *)[(NSDictionary *)self->_dictKeys copy];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMModelAnyPayload;
  v4 = [(RMModelPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_dictKeys copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSDictionary)dictKeys
{
  return self->_dictKeys;
}

- (void)setDictKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end