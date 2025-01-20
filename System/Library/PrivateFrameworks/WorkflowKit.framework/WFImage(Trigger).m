@interface WFImage(Trigger)
+ (id)triggerConfigurationSymbolNamed:()Trigger hierarchicalColors:;
+ (id)triggerConfigurationSymbolNamed:()Trigger renderingMode:pointSize:;
+ (id)triggerDisplaySymbolNamed:()Trigger hierarchicalColors:;
+ (id)triggerDisplaySymbolNamed:()Trigger renderingMode:;
+ (uint64_t)triggerConfigurationSymbolNamed:()Trigger renderingMode:;
@end

@implementation WFImage(Trigger)

+ (id)triggerConfigurationSymbolNamed:()Trigger hierarchicalColors:
{
  v5 = (void *)MEMORY[0x1E4FB4780];
  id v6 = a3;
  v7 = [v5 configurationWithPointSize:a4 hierarchicalColors:54.0];
  v8 = [MEMORY[0x1E4FB4770] systemImageNamed:v6 configuration:v7 renderingMode:2];

  return v8;
}

+ (id)triggerConfigurationSymbolNamed:()Trigger renderingMode:pointSize:
{
  v7 = (void *)MEMORY[0x1E4FB4780];
  id v8 = a4;
  v9 = [v7 configurationWithPointSize:a1];
  v10 = [MEMORY[0x1E4FB4770] systemImageNamed:v8 configuration:v9 renderingMode:a5];

  return v10;
}

+ (uint64_t)triggerConfigurationSymbolNamed:()Trigger renderingMode:
{
  return objc_msgSend(a1, "triggerConfigurationSymbolNamed:renderingMode:pointSize:", 54.0);
}

+ (id)triggerDisplaySymbolNamed:()Trigger hierarchicalColors:
{
  v5 = (void *)MEMORY[0x1E4FB4780];
  id v6 = a3;
  v7 = [v5 configurationWithPointSize:a4 hierarchicalColors:22.0];
  id v8 = [MEMORY[0x1E4FB4770] systemImageNamed:v6 configuration:v7 renderingMode:2];

  return v8;
}

+ (id)triggerDisplaySymbolNamed:()Trigger renderingMode:
{
  v5 = (void *)MEMORY[0x1E4FB4780];
  id v6 = a3;
  v7 = [v5 configurationWithPointSize:22.0];
  id v8 = [MEMORY[0x1E4FB4770] systemImageNamed:v6 configuration:v7 renderingMode:a4];

  return v8;
}

@end