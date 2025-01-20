@interface WFAttribution
+ (id)platformSpecializedWeatherSourceAttributionURLForTrafficParameter:(id)a3;
+ (id)sharedAttribution;
+ (id)weatherSourceAttributionURLForTrafficParameter:(id)a3;
- (NSString)localizedSourceAttribution;
- (NSString)sourceName;
- (NSURL)sourceAttributionURL;
- (id)sourceAttributionImageForStyle:(unint64_t)a3;
@end

@implementation WFAttribution

+ (id)sharedAttribution
{
  if (sharedAttribution_onceToken != -1) {
    dispatch_once(&sharedAttribution_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)sharedAttribution_attribution;
  return v2;
}

uint64_t __34__WFAttribution_sharedAttribution__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedAttribution_attribution;
  sharedAttribution_attribution = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (NSURL)sourceAttributionURL
{
  v2 = objc_opt_class();
  return (NSURL *)[v2 platformSpecializedWeatherSourceAttributionURLForTrafficParameter:0];
}

- (NSString)localizedSourceAttribution
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WFAttributionSourceLocalizedAttributionString" value:@"Weather Foundation Unlocalized Source Attribution String" table:0];

  return (NSString *)v3;
}

- (NSString)sourceName
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WFAttributionSourceName" value:@"Weather Foundation Unlocalized Source Name" table:0];

  return (NSString *)v3;
}

- (id)sourceAttributionImageForStyle:(unint64_t)a3
{
  if (a3 > 2)
  {
    v7 = 0;
  }
  else
  {
    v3 = off_264432658[a3];
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)getUIImageClass_softClass_0;
    uint64_t v13 = getUIImageClass_softClass_0;
    if (!getUIImageClass_softClass_0)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getUIImageClass_block_invoke_0;
      v9[3] = &unk_2644316A8;
      v9[4] = &v10;
      __getUIImageClass_block_invoke_0((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v5 imageNamed:v3 inBundle:v6];
  }
  return v7;
}

+ (id)weatherSourceAttributionURLForTrafficParameter:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  v3 = (__CFString *)a3;
  v4 = [MEMORY[0x263F08BA0] componentsWithString:@"http://www.weather.com/wx/today/"];
  if (![(__CFString *)v3 length])
  {

    v3 = @"TWC";
  }
  v22 = v3;
  id v5 = (void *)MEMORY[0x263F08BD0];
  v6 = [@"apple_" stringByAppendingString:v3];
  v7 = [v5 queryItemWithName:@"par" value:v6];

  v8 = [MEMORY[0x263EFF960] currentLocale];
  v9 = [v8 objectForKey:*MEMORY[0x263EFF4D0]];
  uint64_t v10 = [v9 uppercaseString];

  v11 = [v8 objectForKey:*MEMORY[0x263EFF508]];
  uint64_t v12 = [v11 lowercaseString];

  uint64_t v13 = [NSString stringWithFormat:@"%@_%@", v12, v10];
  v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"locale" value:v13];
  uint64_t v15 = [v4 queryItems];
  v16 = (void *)v15;
  if (v15) {
    v17 = (void *)v15;
  }
  else {
    v17 = (void *)MEMORY[0x263EFFA68];
  }
  v23[0] = v7;
  v23[1] = v14;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v19 = [v17 arrayByAddingObjectsFromArray:v18];
  [v4 setQueryItems:v19];

  v20 = [v4 URL];

  return v20;
}

+ (id)platformSpecializedWeatherSourceAttributionURLForTrafficParameter:(id)a3
{
  id v4 = a3;
  if (platformSpecializedWeatherSourceAttributionURLForTrafficParameter__onceToken != -1) {
    dispatch_once(&platformSpecializedWeatherSourceAttributionURLForTrafficParameter__onceToken, &__block_literal_global_45);
  }
  id v5 = [getUIApplicationClass() sharedApplication];
  int v6 = [v5 canOpenURL:platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPadURL];

  if (v6)
  {
    v7 = (void *)platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPadURL;
LABEL_7:
    id v10 = v7;
    goto LABEL_9;
  }
  v8 = [getUIApplicationClass() sharedApplication];
  int v9 = [v8 canOpenURL:platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPhoneURL];

  if (v9)
  {
    v7 = (void *)platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPhoneURL;
    goto LABEL_7;
  }
  id v10 = [a1 weatherSourceAttributionURLForTrafficParameter:v4];
LABEL_9:
  v11 = v10;

  return v11;
}

uint64_t __83__WFAttribution_platformSpecializedWeatherSourceAttributionURLForTrafficParameter___block_invoke()
{
  uint64_t v0 = [NSURL URLWithString:@"twcweather://now"];
  uint64_t v1 = (void *)platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPhoneURL;
  platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPhoneURL = v0;

  uint64_t v2 = [NSURL URLWithString:@"twc://now"];
  uint64_t v3 = platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPadURL;
  platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPadURL = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

@end