@interface RMProviderStore
+ (id)storeFromManagementSource:(id)a3;
@end

@implementation RMProviderStore

+ (id)storeFromManagementSource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (int)[v3 enrollmentType];
  int64_t v17 = +[RMStoreHelper storeScope];
  id v16 = objc_alloc((Class)RMProviderStore);
  v15 = [v3 identifier];
  v5 = [v3 name];
  v6 = [v3 storeDescription];
  v7 = [v3 bootstrapURI];
  v8 = [v3 accountIdentifier];
  unsigned __int8 v9 = +[RMStoreHelper isInteractiveStoreType:v4];
  v10 = [v3 personaIdentifier];
  v11 = [v3 personaIdentifier];

  BYTE1(v14) = v10 != 0;
  LOBYTE(v14) = v9;
  id v12 = objc_msgSend(v16, "initWithIdentifier:type:scope:name:description:enrollmentURL:accountIdentifier:defaultToInteractive:dataSeparated:personaIdentifier:", v15, v4, v17, v5, v6, v7, v8, v14, v11);

  return v12;
}

@end