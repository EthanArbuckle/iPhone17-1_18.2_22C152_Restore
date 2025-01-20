@interface RMModelStatusSoftwareUpdatePendingVersion
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithOsVersion:(id)a3 buildVersion:(id)a4;
+ (id)buildWithOsVersion:(id)a3 buildVersion:(id)a4 targetLocalDateTime:(id)a5;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSDate)statusTargetLocalDateTime;
- (NSString)statusBuildVersion;
- (NSString)statusOsVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusBuildVersion:(id)a3;
- (void)setStatusOsVersion:(id)a3;
- (void)setStatusTargetLocalDateTime:(id)a3;
@end

@implementation RMModelStatusSoftwareUpdatePendingVersion

+ (NSSet)allowedStatusKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"os-version";
  v6[1] = @"build-version";
  v6[2] = @"target-local-date-time";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"softwareupdate.pending-version";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)buildWithOsVersion:(id)a3 buildVersion:(id)a4 targetLocalDateTime:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusOsVersion:v9];

  [v10 setStatusBuildVersion:v8];
  [v10 setStatusTargetLocalDateTime:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithOsVersion:(id)a3 buildVersion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setStatusOsVersion:v6];

  [v7 setStatusBuildVersion:v5];
  return v7;
}

+ (id)supportedOS
{
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = &unk_2708C39C0;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0C18];
  v15[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0C30];
  v15[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v17[0] = v4;
  v16[1] = &unk_2708C39D8;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0C48];
  v14[0] = v5;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0C60];
  v14[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v17[1] = v7;
  v16[2] = &unk_2708C3A08;
  id v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0C78];
  v13[0] = v8;
  id v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0C90];
  v13[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v17[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [v8 allKeys];
  v11 = [v9 setWithArray:v10];

  v12 = +[RMModelStatusSoftwareUpdatePendingVersion allowedStatusKeys];
  [v11 minusSet:v12];

  v13 = (void *)[v11 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v13];

  BOOL v14 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"os-version", @"statusOsVersion", 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, @"build-version", @"statusBuildVersion", 1, 0, a5)&& -[RMModelPayloadBase loadDateFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:](self,
          "loadDateFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:",
          v8,
          @"target-local-date-time",
          @"statusTargetLocalDateTime",
          0,
          0,
          v6,
          a5);

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(RMModelStatusSoftwareUpdatePendingVersion *)self statusOsVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"os-version" value:v6 isRequired:1 defaultValue:0];

  id v7 = [(RMModelStatusSoftwareUpdatePendingVersion *)self statusBuildVersion];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v5 usingKey:@"build-version" value:v7 isRequired:1 defaultValue:0];

  id v8 = [(RMModelStatusSoftwareUpdatePendingVersion *)self statusTargetLocalDateTime];
  [(RMModelPayloadBase *)self serializeDateIntoDictionary:v5 usingKey:@"target-local-date-time" value:v8 isRequired:0 defaultValue:0 serializationType:v3];

  id v9 = (void *)[v5 copy];
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RMModelStatusSoftwareUpdatePendingVersion;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusOsVersion copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusBuildVersion copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSDate *)self->_statusTargetLocalDateTime copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)statusOsVersion
{
  return self->_statusOsVersion;
}

- (void)setStatusOsVersion:(id)a3
{
}

- (NSString)statusBuildVersion
{
  return self->_statusBuildVersion;
}

- (void)setStatusBuildVersion:(id)a3
{
}

- (NSDate)statusTargetLocalDateTime
{
  return self->_statusTargetLocalDateTime;
}

- (void)setStatusTargetLocalDateTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTargetLocalDateTime, 0);
  objc_storeStrong((id *)&self->_statusBuildVersion, 0);
  objc_storeStrong((id *)&self->_statusOsVersion, 0);
}

@end