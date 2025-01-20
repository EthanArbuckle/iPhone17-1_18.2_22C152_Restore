@interface HDMentalHealthPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (HDMentalHealthPlugin)init;
- (HDMentalHealthPlugin)initWithTypicalDayProvider:(id)a3;
- (NSString)pluginIdentifier;
- (id)demoDataGeneratorClasses;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)taskServerClasses;
@end

@implementation HDMentalHealthPlugin

- (HDMentalHealthPlugin)init
{
  return [(HDMentalHealthPlugin *)self initWithTypicalDayProvider:0];
}

- (HDMentalHealthPlugin)initWithTypicalDayProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMentalHealthPlugin;
  v6 = [(HDMentalHealthPlugin *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_typicalDayProvider, a3);
  }

  return v7;
}

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F54FD0];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  v3 = [a3 behavior];
  char v4 = [v3 isRealityDevice];

  return v4 ^ 1;
}

- (id)extensionForProfile:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = [[HDMHProfileExtension alloc] initWithProfile:v4 typicalDayProvider:self->_typicalDayProvider];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)demoDataGeneratorClasses
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)taskServerClasses
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  void v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  return v2;
}

- (void).cxx_destruct
{
}

@end