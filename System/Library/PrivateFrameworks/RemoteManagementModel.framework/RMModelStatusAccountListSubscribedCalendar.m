@interface RMModelStatusAccountListSubscribedCalendar
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 visibleName:(id)a6 calendarUrl:(id)a7 username:(id)a8 isEnabled:(id)a9;
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)statusIsEnabled;
- (NSNumber)statusRemoved;
- (NSString)statusCalendarUrl;
- (NSString)statusDeclarationIdentifier;
- (NSString)statusIdentifier;
- (NSString)statusUsername;
- (NSString)statusVisibleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setStatusCalendarUrl:(id)a3;
- (void)setStatusDeclarationIdentifier:(id)a3;
- (void)setStatusIdentifier:(id)a3;
- (void)setStatusIsEnabled:(id)a3;
- (void)setStatusRemoved:(id)a3;
- (void)setStatusUsername:(id)a3;
- (void)setStatusVisibleName:(id)a3;
@end

@implementation RMModelStatusAccountListSubscribedCalendar

+ (NSSet)allowedStatusKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"identifier";
  v6[1] = @"_removed";
  v6[2] = @"declaration-identifier";
  v6[3] = @"visible-name";
  v6[4] = @"calendar-url";
  v6[5] = @"username";
  v6[6] = @"is-enabled";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)statusItemType
{
  return @"account.list.subscribed-calendar";
}

- (BOOL)isArrayValue
{
  return 1;
}

+ (id)buildWithIdentifier:(id)a3 removed:(id)a4 declarationIdentifier:(id)a5 visibleName:(id)a6 calendarUrl:(id)a7 username:(id)a8 isEnabled:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  [v22 setStatusIdentifier:v21];

  if (v20) {
    id v23 = v20;
  }
  else {
    id v23 = (id)MEMORY[0x263EFFA80];
  }
  [v22 setStatusRemoved:v23];

  [v22 setStatusDeclarationIdentifier:v19];
  [v22 setStatusVisibleName:v18];

  [v22 setStatusCalendarUrl:v17];
  [v22 setStatusUsername:v16];

  [v22 setStatusIsEnabled:v15];
  return v22;
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
  v20[0] = &unk_2708C2B98;
  id v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF2E0];
  v19[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF2F8];
  v19[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C2BE0;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF310];
  v18[0] = v2;
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF328];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C2BB0;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF340];
  v17[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF358];
  v17[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C2BF8;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF370];
  v16[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF388];
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

  v11 = +[RMModelStatusAccountListSubscribedCalendar allowedStatusKeys];
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
          if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"calendar-url" forKeyPath:@"statusCalendarUrl" isRequired:0 defaultValue:0 error:a5])
          {
            BOOL v13 = 0;
            if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"username" forKeyPath:@"statusUsername" isRequired:0 defaultValue:0 error:a5])
            {
              BOOL v13 = [(RMModelPayloadBase *)self loadBooleanFromDictionary:v7 usingKey:@"is-enabled" forKeyPath:@"statusIsEnabled" isRequired:0 defaultValue:0 error:a5];
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
  v5 = [(RMModelStatusAccountListSubscribedCalendar *)self statusIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"identifier" value:v5 isRequired:1 defaultValue:0];

  v6 = [(RMModelStatusAccountListSubscribedCalendar *)self statusRemoved];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"_removed" value:v6 isRequired:0 defaultValue:MEMORY[0x263EFFA80]];

  id v7 = [(RMModelStatusAccountListSubscribedCalendar *)self statusDeclarationIdentifier];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"declaration-identifier" value:v7 isRequired:0 defaultValue:0];

  v8 = [(RMModelStatusAccountListSubscribedCalendar *)self statusVisibleName];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"visible-name" value:v8 isRequired:0 defaultValue:0];

  v9 = [(RMModelStatusAccountListSubscribedCalendar *)self statusCalendarUrl];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"calendar-url" value:v9 isRequired:0 defaultValue:0];

  v10 = [(RMModelStatusAccountListSubscribedCalendar *)self statusUsername];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"username" value:v10 isRequired:0 defaultValue:0];

  v11 = [(RMModelStatusAccountListSubscribedCalendar *)self statusIsEnabled];
  [(RMModelPayloadBase *)self serializeBooleanIntoDictionary:v4 usingKey:@"is-enabled" value:v11 isRequired:0 defaultValue:0];

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)RMModelStatusAccountListSubscribedCalendar;
  v4 = [(RMModelPayloadBase *)&v20 copyWithZone:a3];
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

  uint64_t v13 = [(NSString *)self->_statusCalendarUrl copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_statusUsername copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_statusIsEnabled copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

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

- (NSString)statusCalendarUrl
{
  return self->_statusCalendarUrl;
}

- (void)setStatusCalendarUrl:(id)a3
{
}

- (NSString)statusUsername
{
  return self->_statusUsername;
}

- (void)setStatusUsername:(id)a3
{
}

- (NSNumber)statusIsEnabled
{
  return self->_statusIsEnabled;
}

- (void)setStatusIsEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusIsEnabled, 0);
  objc_storeStrong((id *)&self->_statusUsername, 0);
  objc_storeStrong((id *)&self->_statusCalendarUrl, 0);
  objc_storeStrong((id *)&self->_statusVisibleName, 0);
  objc_storeStrong((id *)&self->_statusDeclarationIdentifier, 0);
  objc_storeStrong((id *)&self->_statusRemoved, 0);
  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end