@interface SFPasswordManagerURL
+ (id)passwordManagerURL;
+ (id)passwordManagerURLForFamilySharingGroupSetup;
+ (id)passwordManagerURLForSharingGroupWithGroupID:(id)a3;
+ (id)passwordManagerURLWithParameters:(id)a3;
+ (id)passwordManagerURLWithPrefsURL:(id)a3;
@end

@implementation SFPasswordManagerURL

+ (id)passwordManagerURL
{
  return (id)[MEMORY[0x263F662F8] passwordManagerURL];
}

+ (id)passwordManagerURLWithPrefsURL:(id)a3
{
  return (id)[MEMORY[0x263F662F8] passwordManagerURLWithPrefsURL:a3];
}

+ (id)passwordManagerURLWithParameters:(id)a3
{
  return (id)[MEMORY[0x263F662F8] passwordManagerURLWithDictionary:a3];
}

+ (id)passwordManagerURLForSharingGroupWithGroupID:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F662F8];
  uint64_t v9 = *MEMORY[0x263F664A0];
  v10[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v3 passwordManagerURLWithDictionary:v6];

  return v7;
}

+ (id)passwordManagerURLForFamilySharingGroupSetup
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F662F8];
  uint64_t v6 = *MEMORY[0x263F66490];
  v7[0] = *MEMORY[0x263F664B0];
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v2 passwordManagerURLWithDictionary:v3];

  return v4;
}

@end