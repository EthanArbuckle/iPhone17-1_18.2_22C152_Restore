@interface TPSContentURLController
+ (id)_boardID;
+ (id)_boardIDOrProductHash;
+ (id)_platformString;
+ (id)_productHash;
+ (id)_uiTestLocalBaseURL;
+ (id)_uiTestLocalURLForIdentifier:(id)a3;
+ (id)assetPathFromAssetConfiguration:(id)a3 type:(int64_t)a4;
+ (id)contentRequestURLWithContentMapHash:(id)a3;
+ (id)contentRequestURLWithContentMapHash:(id)a3 variantIdentifiers:(id)a4 useLanguageDefault:(BOOL)a5;
+ (id)defaultHost;
+ (id)defaultHostPath;
+ (id)effectiveHost;
+ (id)languageStringWithLanguageDefault:(BOOL)a3 count:(unint64_t)a4;
+ (id)metaRequestURL;
+ (id)modelQueryItem;
+ (id)platformQueryItem;
+ (id)preferredLocalizations;
+ (id)preferredLocalizationsWithCount:(unint64_t)a3;
+ (id)requestURLForAPI:(id)a3 additionalQueryItems:(id)a4 useLanguageDefault:(BOOL)a5 apiVersion:(id)a6;
+ (id)userGuideURLForIdentifier:(id)a3 version:(id)a4 platformIndependent:(BOOL)a5 subPath:(id)a6;
+ (int64_t)majorVersionForVersionString:(id)a3;
@end

@implementation TPSContentURLController

+ (id)contentRequestURLWithContentMapHash:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() contentRequestURLWithContentMapHash:v3 variantIdentifiers:0 useLanguageDefault:1];

  return v4;
}

+ (id)contentRequestURLWithContentMapHash:(id)a3 variantIdentifiers:(id)a4 useLanguageDefault:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if (v8)
  {
    v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"contentMapHash" value:v8];
    [v10 addObject:v11];
  }
  if ([v9 length])
  {
    v12 = [MEMORY[0x1E4F290C8] queryItemWithName:@"variantId" value:v9];
    [v10 addObject:v12];
  }
  v13 = [a1 requestURLForAPI:@"content/documents" additionalQueryItems:v10 useLanguageDefault:v5 apiVersion:@"v2"];
  v14 = +[TPSLogger default];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_19C8DC000, v14, OS_LOG_TYPE_DEFAULT, "Documents URL %@", (uint8_t *)&v16, 0xCu);
  }

  return v13;
}

+ (id)userGuideURLForIdentifier:(id)a3 version:(id)a4 platformIndependent:(BOOL)a5 subPath:(id)a6
{
  id v9 = a3;
  v10 = (__CFString *)a4;
  id v11 = a6;
  v12 = [MEMORY[0x1E4F1CA48] array];
  v13 = (__CFString *)MGCopyAnswer();
  BOOL v14 = +[TPSCommonDefines isPadUI];
  v15 = @"ios";
  if (v14) {
    v15 = @"ipados";
  }
  int v16 = v15;
  v37 = v11;
  if ([v9 containsString:@"watch"])
  {

    v17 = v10;
    int v16 = @"watchos";
    goto LABEL_8;
  }
  if (([v9 hasPrefix:@"iphone"] & 1) != 0
    || ([v9 hasPrefix:@"ipad"] & 1) != 0)
  {
    v17 = v13;
LABEL_8:
    if (a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ([v11 length])
  {
    uint64_t v32 = [v9 stringByAppendingFormat:@"-%@", v11];

    id v9 = (id)v32;
  }
  if (!a5)
  {
    BOOL v33 = +[TPSCommonDefines isPadUI];
    v34 = @"ipad";
    if (!v33) {
      v34 = @"iphone";
    }
    uint64_t v35 = [v9 stringByAppendingFormat:@"-%@", v34];

    id v9 = (id)v35;
    v17 = v13;
LABEL_9:
    uint64_t v18 = [MEMORY[0x1E4F290C8] queryItemWithName:@"platform" value:v16];
    [v12 addObject:v18];
    v19 = [MEMORY[0x1E4F290C8] queryItemWithName:@"pOSv" value:v17];
    [v12 addObject:v19];

    goto LABEL_10;
  }
  v17 = v13;
LABEL_10:
  v36 = v9;
  v20 = [(id)objc_opt_class() languageStringWithLanguageDefault:1 count:3];
  v21 = [MEMORY[0x1E4F290C8] queryItemWithName:@"locale" value:v20];
  [v12 addObject:v21];
  if (v10) {
    v22 = v10;
  }
  else {
    v22 = @"1000";
  }
  v23 = [MEMORY[0x1E4F290C8] queryItemWithName:@"productVersion" value:v22];
  [v12 addObject:v23];
  v24 = [MEMORY[0x1E4F290C8] queryItemWithName:@"product" value:v9];
  [v12 addObject:v24];
  id v25 = objc_alloc(MEMORY[0x1E4F29088]);
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://cds.apple.com"];
  v26 = v10;
  v28 = v27 = v17;
  v29 = (void *)[v25 initWithURL:v28 resolvingAgainstBaseURL:0];

  [v29 setPath:@"/content/services/book"];
  [v29 setQueryItems:v12];
  v30 = [v29 URL];

  return v30;
}

+ (id)metaRequestURL
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [a1 requestURLForAPI:@"meta" additionalQueryItems:0 useLanguageDefault:1 apiVersion:0];
  id v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "Meta URL %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

+ (id)languageStringWithLanguageDefault:(BOOL)a3 count:(unint64_t)a4
{
  unsigned int v5 = a3;
  v6 = [(id)objc_opt_class() preferredLocalizationsWithCount:a4];
  uint64_t v7 = (void *)[v6 mutableCopy];

  int64_t v8 = [v7 count] - a4;
  if (v5) {
    unsigned int v5 = [v7 containsObject:@"en"] ^ 1;
  }
  if (v8 >= 0) {
    unsigned int v9 = v5;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v8 > 0 || v9 != 0) {
    objc_msgSend(v7, "removeObjectsInRange:", a4 - v9, v8 + v9);
  }
  if (v5) {
    [v7 addObject:@"en"];
  }
  id v11 = [v7 array];
  v12 = [v11 componentsJoinedByString:@","];

  return v12;
}

+ (id)preferredLocalizationsWithCount:(unint64_t)a3
{
  v4 = [MEMORY[0x1E4F1CA70] orderedSet];
  unsigned int v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v7 = [v5 arrayWithArray:v6];

  int64_t v8 = +[TPSDefaultsManager requestLanguage];
  if ([v8 length]) {
    [v7 insertObject:v8 atIndex:0];
  }
  do
  {
    if ([v4 count] >= a3 || !objc_msgSend(v7, "count")) {
      break;
    }
    unsigned int v9 = objc_msgSend(MEMORY[0x1E4F1CA20], "tps_userPreferredLocalizationsForLanguages:", v7);
    if ([v9 count]) {
      [v4 addObjectsFromArray:v9];
    }
    [v7 removeObjectAtIndex:0];
    int v10 = [v4 containsObject:@"en"];
  }
  while (!v10);
  id v11 = (void *)[v4 copy];

  return v11;
}

void __46__TPSContentURLController__uiTestLocalBaseURL__block_invoke()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.tips"];

  v1 = (void *)MGCopyAnswer();
  uint64_t v2 = [v6 URLByAppendingPathComponent:@"UITestOfflineContent" isDirectory:1];
  id v3 = (void *)_uiTestLocalBaseURL_gOfflineContentURL;
  _uiTestLocalBaseURL_gOfflineContentURL = v2;

  uint64_t v4 = [(id)_uiTestLocalBaseURL_gOfflineContentURL URLByAppendingPathComponent:v1 isDirectory:0];
  unsigned int v5 = (void *)_uiTestLocalBaseURL_gOfflineContentURL;
  _uiTestLocalBaseURL_gOfflineContentURL = v4;
}

+ (id)requestURLForAPI:(id)a3 additionalQueryItems:(id)a4 useLanguageDefault:(BOOL)a5 apiVersion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = (__CFString *)a6;
  v13 = +[TPSDefaultsManager requestURL];
  if ([v13 isAbsolutePath])
  {
    BOOL v14 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
    v15 = +[TPSLogger default];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v14;
      _os_log_impl(&dword_19C8DC000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to load content from: Path %@", buf, 0xCu);
    }

    int v16 = [a1 _uiTestLocalURLForIdentifier:v10];
  }
  else
  {
    if (!v13) {
      goto LABEL_9;
    }
    v17 = v12;
    id v18 = v10;
    v19 = [v11 firstObject];
    v20 = [v19 name];
    int v21 = [v20 isEqualToString:@"docId"];

    if (v21)
    {
      v22 = [v11 firstObject];
      uint64_t v23 = [v22 value];

      id v18 = (id)v23;
    }
    uint64_t v24 = [v13 stringByAppendingPathComponent:v18];

    int v16 = [MEMORY[0x1E4F1CB10] URLWithString:v24];

    v13 = (void *)v24;
    v12 = v17;
    if (!v16)
    {
LABEL_9:
      uint64_t v25 = [(id)objc_opt_class() effectiveHost];
      v26 = [@"/" stringByAppendingPathComponent:@"api"];
      v27 = v26;
      v51 = v12;
      if (v12) {
        v28 = v12;
      }
      else {
        v28 = @"v2";
      }
      v29 = [v26 stringByAppendingPathComponent:v28];

      v30 = [v29 stringByAppendingPathComponent:@"tips"];

      uint64_t v31 = [v30 stringByAppendingPathComponent:v10];

      if (v11) {
        [MEMORY[0x1E4F1CA48] arrayWithArray:v11];
      }
      else {
      uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
      }
      uint64_t v33 = [(id)objc_opt_class() modelQueryItem];
      if (v33) {
        [v32 addObject:v33];
      }
      id v47 = v10;
      id v48 = v11;
      uint64_t v34 = [(id)objc_opt_class() platformQueryItem];
      if (v34) {
        [v32 addObject:v34];
      }
      v49 = (void *)v34;
      v50 = (void *)v33;
      uint64_t v35 = [(id)objc_opt_class() languageStringWithLanguageDefault:v7 count:3];
      v36 = [MEMORY[0x1E4F290C8] queryItemWithName:@"lang" value:v35];
      [v32 addObject:v36];
      v37 = +[TPSDefaultsManager requestVersion];
      if (!v37)
      {
        uint64_t v38 = v31;
        v39 = (void *)MGCopyAnswer();
        uint64_t v40 = [a1 majorVersionForVersionString:v39];
        if (v40 <= +[TPSCommonDefines maxRequestVersion]) {
          [NSString stringWithFormat:@"%d.0-%@", v40, v39];
        }
        else {
        v37 = objc_msgSend(NSString, "stringWithFormat:", @"%d.0", +[TPSCommonDefines maxRequestVersion](TPSCommonDefines, "maxRequestVersion"), v46);
        }

        uint64_t v31 = v38;
      }
      v41 = [MEMORY[0x1E4F290C8] queryItemWithName:@"osVersion" value:v37];
      [v32 addObject:v41];
      v42 = (void *)v25;
      v43 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v25 resolvingAgainstBaseURL:0];
      [v43 setPath:v31];
      [v43 setQueryItems:v32];
      [v43 URL];
      int v16 = v44 = (void *)v31;

      v12 = v51;
      id v10 = v47;
      id v11 = v48;
    }
  }

  return v16;
}

+ (id)assetPathFromAssetConfiguration:(id)a3 type:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [v6 identifierForType:a4];
  if (!v7)
  {
    BOOL v14 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = +[TPSDefaultsManager assetURL];
  if (v8)
  {
    unsigned int v9 = (void *)v8;
    id v10 = [v6 cacheIdentifierForType:a4];
    id v11 = [v9 stringByAppendingPathComponent:@"asset"];

    v12 = [v11 stringByAppendingPathComponent:v10];

    v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
  }
  else
  {
    v15 = [v6 assets];
    id v10 = [v15 baseURL];

    v12 = +[TPSDefaultsManager assetRequestHostURL];
    if (v12)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CB10] URLWithString:v12];

      id v10 = (void *)v16;
    }
    v17 = +[TPSDefaultsManager requestURL];
    if ([v17 isAbsolutePath])
    {
      id v18 = [a1 _uiTestLocalBaseURL];
      v19 = [v18 URLByAppendingPathComponent:v7 isDirectory:0];

      BOOL v14 = [v19 absoluteString];
      v20 = +[TPSLogger default];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        uint64_t v25 = v14;
        _os_log_impl(&dword_19C8DC000, v20, OS_LOG_TYPE_DEFAULT, "Generated loaded assets URL %@", (uint8_t *)&v24, 0xCu);
      }

      goto LABEL_15;
    }
    int v21 = [@"v2" stringByAppendingPathComponent:@"tips"];
    uint64_t v22 = [v21 stringByAppendingPathComponent:v7];

    v13 = [v10 URLByAppendingPathComponent:v22];

    v12 = (void *)v22;
  }

  BOOL v14 = [v13 absoluteString];
  v17 = +[TPSLogger default];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    uint64_t v25 = v14;
    _os_log_impl(&dword_19C8DC000, v17, OS_LOG_TYPE_DEFAULT, "Generated asset URL %@", (uint8_t *)&v24, 0xCu);
  }
  id v10 = v13;
LABEL_15:

LABEL_16:
  return v14;
}

+ (id)_uiTestLocalURLForIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [a1 _uiTestLocalBaseURL];
  id v6 = [NSString stringWithFormat:@"%@.json", v4];

  BOOL v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:0];

  return v7;
}

+ (id)_uiTestLocalBaseURL
{
  if (_uiTestLocalBaseURL_predicate != -1) {
    dispatch_once(&_uiTestLocalBaseURL_predicate, &__block_literal_global);
  }
  uint64_t v2 = (void *)_uiTestLocalBaseURL_gOfflineContentURL;
  return v2;
}

+ (id)preferredLocalizations
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 preferredLocalizationsWithCount:3];
}

+ (id)defaultHostPath
{
  return @"https://ipcdn.apple.com/";
}

+ (int64_t)majorVersionForVersionString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  id v4 = [v3 firstObject];
  int64_t v5 = [v4 integerValue];

  return v5;
}

+ (id)modelQueryItem
{
  uint64_t v2 = (void *)MGCopyAnswer();
  uint64_t v3 = +[TPSDefaultsManager requestModel];
  id v4 = (void *)v3;
  if (v3) {
    int64_t v5 = (void *)v3;
  }
  else {
    int64_t v5 = v2;
  }
  id v6 = v5;

  if (!v6
    || ([MEMORY[0x1E4F290C8] queryItemWithName:@"model" value:v6],
        (BOOL v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v8 = MGCopyAnswer();
    if (!v8
      || (unsigned int v9 = (void *)v8,
          [MEMORY[0x1E4F290C8] queryItemWithName:@"deviceClass" value:v8],
          BOOL v7 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v7))
    {
      id v10 = (void *)MEMORY[0x1E4F290C8];
      id v11 = +[TPSCommonDefines deviceFamily];
      BOOL v7 = [v10 queryItemWithName:@"deviceFamily" value:v11];
    }
  }

  return v7;
}

+ (id)platformQueryItem
{
  uint64_t v2 = [a1 _platformString];
  uint64_t v3 = +[TPSDefaultsManager requestPlatform];
  id v4 = (void *)v3;
  if (v3) {
    int64_t v5 = (void *)v3;
  }
  else {
    int64_t v5 = v2;
  }
  id v6 = v5;

  if (v6)
  {
    BOOL v7 = [MEMORY[0x1E4F290C8] queryItemWithName:@"platform" value:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)defaultHost
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = [a1 defaultHostPath];
  id v4 = [v2 URLWithString:v3];

  return v4;
}

+ (id)effectiveHost
{
  uint64_t v3 = +[TPSDefaultsManager requestHostURL];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [a1 defaultHostPath];
  }
  id v6 = v5;

  BOOL v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];

  return v7;
}

+ (id)_platformString
{
  uint64_t v2 = +[TPSDefaultsManager platform];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = @"ios";
  }

  return v4;
}

+ (id)_boardIDOrProductHash
{
  uint64_t v3 = [a1 _boardID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [a1 _productHash];
  }
  id v6 = v5;

  return v6;
}

+ (id)_boardID
{
  return 0;
}

+ (id)_productHash
{
  id v2 = (id) MGCopyAnswer();
  uint64_t v3 = (unsigned __int8 *)[v2 bytes];
  if (v3)
  {
    uint64_t v4 = [v2 length];
    for (i = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * v4];
    {
      unsigned int v6 = *v3++;
      objc_msgSend(i, "appendFormat:", @"%02lx", v6);
    }
    uint64_t v3 = [NSString stringWithString:i];
  }
  return v3;
}

@end