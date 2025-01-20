@interface RMModelStatusBase
+ (BOOL)isSupportedStatusItem:(id)a3 platform:(int64_t)a4 scope:(int64_t)a5;
+ (NSString)statusItemType;
+ (id)stubObjectForStatusItemType:(id)a3;
- (BOOL)isArrayValue;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (id)serializePayloadWithType:(signed __int16)a3;
- (id)serializeWithType:(signed __int16)a3;
@end

@implementation RMModelStatusBase

+ (NSString)statusItemType
{
  return (NSString *)&stru_2708A9900;
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)stubObjectForStatusItemType:(id)a3
{
  id v3 = a3;
  if (+[RMModelClasses classForStatusItemType:v3])
  {
    uint64_t v4 = objc_opt_new();
  }
  else
  {
    uint64_t v4 = +[RMModelStatusDynamic buildWithStatusItemType:v3];
  }
  v5 = (void *)v4;

  return v5;
}

+ (BOOL)isSupportedStatusItem:(id)a3 platform:(int64_t)a4 scope:(int64_t)a5
{
  id v7 = a3;
  v8 = +[RMModelClasses classForStatusItemType:v7];
  if (v8)
  {
    if (([(objc_class *)v8 isSupportedForPlatform:a4 scope:a5] & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    v9 = +[RMModelStatusSchema schemas];
    v10 = [v9 objectForKeyedSubscript:v7];

    if (!v10 || ([v10 isSupportedForPlatform:a4 scope:a5] & 1) == 0)
    {

LABEL_9:
      BOOL v11 = 0;
      goto LABEL_10;
    }
  }
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = objc_opt_new();
  v6 = [(RMModelStatusBase *)self serializePayloadWithType:v3];
  if ([v6 count]) {
    [v5 addEntriesFromDictionary:v6];
  }
  id v7 = (void *)[v5 copy];

  return v7;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  return (id)MEMORY[0x263EFFA78];
}

@end