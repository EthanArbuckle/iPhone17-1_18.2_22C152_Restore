@interface RMModelStatusSoftwareUpdateFailureReason
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithCount:(id)a3;
+ (id)buildWithCount:(id)a3 reason:(id)a4 timestamp:(id)a5;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)statusCount;
- (NSString)statusReason;
- (NSString)statusTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusCount:(id)a3;
- (void)setStatusReason:(id)a3;
- (void)setStatusTimestamp:(id)a3;
@end

@implementation RMModelStatusSoftwareUpdateFailureReason

+ (NSSet)allowedStatusKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"count";
  v6[1] = @"reason";
  v6[2] = @"timestamp";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"softwareupdate.failure-reason";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)buildWithCount:(id)a3 reason:(id)a4 timestamp:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusCount:v9];

  [v10 setStatusReason:v8];
  [v10 setStatusTimestamp:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithCount:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusCount:v3];

  return v4;
}

+ (id)supportedOS
{
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = &unk_2708C38A0;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0A68];
  v15[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0A80];
  v15[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v17[0] = v4;
  v16[1] = &unk_2708C38B8;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0A98];
  v14[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0AB0];
  v14[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v17[1] = v7;
  v16[2] = &unk_2708C38E8;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0AC8];
  v13[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0AE0];
  v13[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v17[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelStatusSoftwareUpdateFailureReason allowedStatusKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"count" forKeyPath:@"statusCount" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"reason" forKeyPath:@"statusReason" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v13 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"timestamp" forKeyPath:@"statusTimestamp" isRequired:0 defaultValue:0 error:a5];
    }
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
  v5 = [(RMModelStatusSoftwareUpdateFailureReason *)self statusCount];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"count" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelStatusSoftwareUpdateFailureReason *)self statusReason];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"reason" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(RMModelStatusSoftwareUpdateFailureReason *)self statusTimestamp];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"timestamp" value:v7 isRequired:0 defaultValue:0];

  id v8 = (void *)[v4 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelStatusSoftwareUpdateFailureReason;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_statusCount copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusReason copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusTimestamp copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSNumber)statusCount
{
  return self->_statusCount;
}

- (void)setStatusCount:(id)a3
{
}

- (NSString)statusReason
{
  return self->_statusReason;
}

- (void)setStatusReason:(id)a3
{
}

- (NSString)statusTimestamp
{
  return self->_statusTimestamp;
}

- (void)setStatusTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTimestamp, 0);
  objc_storeStrong((id *)&self->_statusReason, 0);
  objc_storeStrong((id *)&self->_statusCount, 0);
}

@end