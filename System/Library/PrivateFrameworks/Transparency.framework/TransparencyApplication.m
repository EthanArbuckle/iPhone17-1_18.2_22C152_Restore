@interface TransparencyApplication
+ (id)addApplicationPrefixForIdentifier:(id)a3 uri:(id)a4;
+ (id)applicationIdentifierForValue:(id)a3;
+ (id)applicationPrefixForIdentifier:(id)a3;
+ (id)applicationValueForIdentifier:(id)a3;
+ (id)idsServiceForIdentifier:(id)a3;
+ (id)stripApplicationPrefixForIdentifier:(id)a3 uri:(id)a4;
- (NSString)applicationIdentifier;
- (TransparencyApplication)initWithIdentifier:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
@end

@implementation TransparencyApplication

+ (id)applicationValueForIdentifier:(id)a3
{
  uint64_t v3 = initializeApplicationIdentifierMaps_once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_11);
  }
  v5 = [(id)kApplicationIdentifierMap objectForKeyedSubscript:v4];

  return v5;
}

- (TransparencyApplication)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (initializeApplicationIdentifierMaps_once != -1) {
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_11);
  }
  v6 = [(id)kApplicationIdentifierMap objectForKeyedSubscript:v5];

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)TransparencyApplication;
    v7 = [(TransparencyApplication *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_applicationIdentifier, a3);
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)applicationIdentifierForValue:(id)a3
{
  uint64_t v3 = initializeApplicationIdentifierMaps_once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_11);
  }
  id v5 = [(id)kApplicationEnumMap objectForKeyedSubscript:v4];

  return v5;
}

+ (id)applicationPrefixForIdentifier:(id)a3
{
  uint64_t v3 = initializeApplicationIdentifierMaps_once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_11);
  }
  id v5 = [(id)kApplicationIdentifierToUriPrefixMap objectForKeyedSubscript:v4];

  return v5;
}

+ (id)idsServiceForIdentifier:(id)a3
{
  uint64_t v3 = initializeApplicationIdentifierMaps_once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_11);
  }
  id v5 = [(id)kApplicationIDSServiceMap objectForKeyedSubscript:v4];

  return v5;
}

+ (id)addApplicationPrefixForIdentifier:(id)a3 uri:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() applicationPrefixForIdentifier:v6];

  if ([v5 hasPrefix:v7])
  {
    id v8 = v5;
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"%@://%@", v7, v5];
  }
  v9 = v8;

  return v9;
}

+ (id)stripApplicationPrefixForIdentifier:(id)a3 uri:(id)a4
{
  id v5 = a4;
  id v6 = NSString;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() applicationPrefixForIdentifier:v7];

  v9 = [v6 stringWithFormat:@"%@://", v8];

  if ([v5 hasPrefix:v9])
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v9, "length"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v5;
  }
  objc_super v11 = v10;

  return v11;
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end