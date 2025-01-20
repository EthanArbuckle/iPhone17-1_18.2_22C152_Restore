@interface TRDeviceSetupLegacyAction
- (id)propertyListRepresentation;
@end

@implementation TRDeviceSetupLegacyAction

- (id)propertyListRepresentation
{
  uint64_t v3 = [(TRDeviceSetupAction *)self actionType];
  v4 = (void *)v3;
  v5 = &stru_26C5827A8;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setObject:v6 forKey:@"a"];

  v8 = [(TRDeviceSetupAction *)self parameters];

  if (v8)
  {
    v9 = [(TRDeviceSetupAction *)self parameters];
    [v7 setObject:v9 forKey:@"p"];
  }
  v10 = (void *)[v7 copy];

  return v10;
}

@end