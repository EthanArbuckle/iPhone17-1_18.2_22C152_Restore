@interface RMModelStatusAccountListCalDAV
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 visibleName:(id)a6 hostname:(id)a7 port:(id)a8 username:(id)a9 areCalendarsEnabled:(id)a10 areRemindersEnabled:(id)a11;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)statusAreCalendarsEnabled;
- (NSNumber)statusAreRemindersEnabled;
- (NSNumber)statusPort;
- (NSNumber)statusRemoved;
- (NSString)statusDeclarationIdentifier;
- (NSString)statusHostname;
- (NSString)statusIdentifier;
- (NSString)statusUsername;
- (NSString)statusVisibleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusAreCalendarsEnabled:(id)a3;
- (void)setStatusAreRemindersEnabled:(id)a3;
- (void)setStatusDeclarationIdentifier:(id)a3;
- (void)setStatusHostname:(id)a3;
- (void)setStatusIdentifier:(id)a3;
- (void)setStatusPort:(id)a3;
- (void)setStatusRemoved:(id)a3;
- (void)setStatusUsername:(id)a3;
- (void)setStatusVisibleName:(id)a3;
@end

@implementation RMModelStatusAccountListCalDAV

+ (NSSet)allowedStatusKeys
{
  v6[9] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"identifier";
  v6[1] = @"_removed";
  v6[2] = @"declaration-identifier";
  v6[3] = @"visible-name";
  v6[4] = @"hostname";
  v6[5] = @"port";
  v6[6] = @"username";
  v6[7] = @"are-calendars-enabled";
  v6[8] = @"are-reminders-enabled";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:9];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"account.list.caldav";
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 visibleName:(id)a6 hostname:(id)a7 port:(id)a8 username:(id)a9 areCalendarsEnabled:(id)a10 areRemindersEnabled:(id)a11
{
  id v28 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = objc_opt_new();
  [v25 setStatusIdentifier:v24];

  if (v23) {
    id v26 = v23;
  }
  else {
    id v26 = (id)MEMORY[0x263EFFA80];
  }
  [v25 setStatusRemoved:v26];

  [v25 setStatusDeclarationIdentifier:v22];
  [v25 setStatusVisibleName:v21];

  [v25 setStatusHostname:v20];
  [v25 setStatusPort:v19];

  [v25 setStatusUsername:v18];
  [v25 setStatusAreCalendarsEnabled:v17];

  [v25 setStatusAreRemindersEnabled:v28];
  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusIdentifier:v3];

  return v4;
}

+ (id)supportedOS
{
  v21[4] = *MEMORY[0x263EF8340];
  v20[0] = &unk_2708C2850;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEDA0];
  v19[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEDB8];
  v19[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C2898;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEDD0];
  v18[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEDE8];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C2868;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEE00];
  v17[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEE18];
  v17[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C28B0;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEE30];
  v16[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BEE48];
  v16[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [v7 allKeys];
  v10 = [v8 setWithArray:v9];

  v11 = +[RMModelStatusAccountListCalDAV allowedStatusKeys];
  [v10 minusSet:v11];

  v12 = (void *)[v10 copy];
  [(RMModelPayloadBase *)self setUnknownPayloadKeys:v12];

  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"identifier" forKeyPath:@"statusIdentifier" isRequired:1 defaultValue:0 error:a5])
  {
    BOOL v13 = 0;
    if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"_removed" forKeyPath:@"statusRemoved" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:a5])
    {
      BOOL v13 = 0;
      if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"declaration-identifier" forKeyPath:@"statusDeclarationIdentifier" isRequired:0 defaultValue:0 error:a5])
      {
        BOOL v13 = 0;
        if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"visible-name" forKeyPath:@"statusVisibleName" isRequired:0 defaultValue:0 error:a5])
        {
          BOOL v13 = 0;
          if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"hostname" forKeyPath:@"statusHostname" isRequired:0 defaultValue:0 error:a5])
          {
            BOOL v13 = 0;
            if ([(RMModelPayloadBase *)self loadIntegerFromDictionary:v7 usingKey:@"port" forKeyPath:@"statusPort" isRequired:0 defaultValue:0 error:a5])
            {
              BOOL v13 = 0;
              if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"username" forKeyPath:@"statusUsername" isRequired:0 defaultValue:0 error:a5])
              {
                BOOL v13 = 0;
                if ([(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"are-calendars-enabled" forKeyPath:@"statusAreCalendarsEnabled" isRequired:0 defaultValue:0 error:a5])
                {
                  BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"are-reminders-enabled" forKeyPath:@"statusAreRemindersEnabled" isRequired:0 defaultValue:0 error:a5];
                }
              }
            }
          }
        }
      }
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
  v5 = [(RMModelStatusAccountListCalDAV *)self statusIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"identifier" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelStatusAccountListCalDAV *)self statusRemoved];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"_removed" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v7 = [(RMModelStatusAccountListCalDAV *)self statusDeclarationIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"declaration-identifier" value:v7 isRequired:0 defaultValue:0];

  v8 = [(RMModelStatusAccountListCalDAV *)self statusVisibleName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"visible-name" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelStatusAccountListCalDAV *)self statusHostname];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"hostname" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelStatusAccountListCalDAV *)self statusPort];
  [(RMModelPayloadBase *)self serializeIntegerIntoDictionary:v4 usingKey:@"port" value:v10 isRequired:0 defaultValue:0];

  v11 = [(RMModelStatusAccountListCalDAV *)self statusUsername];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"username" value:v11 isRequired:0 defaultValue:0];

  v12 = [(RMModelStatusAccountListCalDAV *)self statusAreCalendarsEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"are-calendars-enabled" value:v12 isRequired:0 defaultValue:0];

  BOOL v13 = [(RMModelStatusAccountListCalDAV *)self statusAreRemindersEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"are-reminders-enabled" value:v13 isRequired:0 defaultValue:0];

  v14 = (void *)[v4 copy];
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)RMModelStatusAccountListCalDAV;
  v4 = [(RMModelPayloadBase *)&v24 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusIdentifier copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_statusRemoved copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusDeclarationIdentifier copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusVisibleName copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_statusHostname copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_statusPort copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_statusUsername copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_statusAreCalendarsEnabled copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_statusAreRemindersEnabled copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
}

- (NSNumber)statusRemoved
{
  return self->_statusRemoved;
}

- (void)setStatusRemoved:(id)a3
{
}

- (NSString)statusDeclarationIdentifier
{
  return self->_statusDeclarationIdentifier;
}

- (void)setStatusDeclarationIdentifier:(id)a3
{
}

- (NSString)statusVisibleName
{
  return self->_statusVisibleName;
}

- (void)setStatusVisibleName:(id)a3
{
}

- (NSString)statusHostname
{
  return self->_statusHostname;
}

- (void)setStatusHostname:(id)a3
{
}

- (NSNumber)statusPort
{
  return self->_statusPort;
}

- (void)setStatusPort:(id)a3
{
}

- (NSString)statusUsername
{
  return self->_statusUsername;
}

- (void)setStatusUsername:(id)a3
{
}

- (NSNumber)statusAreCalendarsEnabled
{
  return self->_statusAreCalendarsEnabled;
}

- (void)setStatusAreCalendarsEnabled:(id)a3
{
}

- (NSNumber)statusAreRemindersEnabled
{
  return self->_statusAreRemindersEnabled;
}

- (void)setStatusAreRemindersEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusAreRemindersEnabled, 0);
  objc_storeStrong((id *)&self->_statusAreCalendarsEnabled, 0);
  objc_storeStrong((id *)&self->_statusUsername, 0);
  objc_storeStrong((id *)&self->_statusPort, 0);
  objc_storeStrong((id *)&self->_statusHostname, 0);
  objc_storeStrong((id *)&self->_statusVisibleName, 0);
  objc_storeStrong((id *)&self->_statusDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end