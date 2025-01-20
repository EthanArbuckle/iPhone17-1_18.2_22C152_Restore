@interface PCMotionBundle
+ (BOOL)bundleContentsAreEqualAtURL:(id)a3 andURL:(id)a4;
+ (BOOL)isStringNilOrEmpty:(id)a3;
+ (BOOL)isValidBundleExtension:(id)a3;
+ (BOOL)isValidBundleURL:(id)a3;
+ (BOOL)isValidBundleUTI:(id)a3;
+ (BOOL)isValidProjectFileExtension:(id)a3;
+ (BOOL)isValidProjectFileURL:(id)a3;
+ (BOOL)isValidProjectFileUTI:(id)a3;
+ (BOOL)removeTempBundleDirectory:(id)a3 error:(id *)a4;
+ (NSArray)bundleExtensions;
+ (NSArray)bundleUTIs;
+ (NSArray)projectFileExtensions;
+ (NSArray)projectFileUTIs;
+ (NSArray)projectFolderNames;
+ (NSArray)projectTypeNames;
+ (NSArray)projectTypes;
+ (id)bundleExtensionForProjectType:(int64_t)a3;
+ (id)bundleURLForProjectFileURL:(id)a3;
+ (id)bundleURLInFileURL:(id)a3;
+ (id)bundleUTIForProjectType:(int64_t)a3;
+ (id)compositionProjectFileExtensionForProjectType:(int64_t)a3;
+ (id)compositionProjectFileUTIForProjectType:(int64_t)a3;
+ (id)createTempBundleByCopyingBundleAtURL:(id)a3 error:(id *)a4;
+ (id)createTempBundleWithProjectType:(int64_t)a3 error:(id *)a4;
+ (id)folderNameForProjectType:(int64_t)a3;
+ (id)infoDictionaryAtURL:(id)a3;
+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 identifier:(id)a4 version:(id)a5 projectFilePath:(id)a6 supportsFCPiPad:(BOOL)a7 name:(id)a8 category:(id)a9 theme:(id)a10;
+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 identifier:(id)a4 version:(id)a5 projectFilePath:(id)a6 supportsFCPiPad:(BOOL)a7 name:(id)a8 category:(id)a9 theme:(id)a10 additionalEntries:(id)a11;
+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 version:(id)a4 projectFilePath:(id)a5 supportsFCPiPad:(BOOL)a6 name:(id)a7 category:(id)a8 theme:(id)a9;
+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 version:(id)a4 projectFilePath:(id)a5 supportsFCPiPad:(BOOL)a6 name:(id)a7 category:(id)a8 theme:(id)a9 additionalEntries:(id)a10;
+ (id)infoDictionaryWithDefaults:(id)a3 andOverrides:(id)a4;
+ (id)nilOrNonEmptyString:(id)a3;
+ (id)nilOrNonEmptyString:(id)a3 withFallback1:(id)a4 fallback2:(id)a5;
+ (id)nilOrNonEmptyString:(id)a3 withFallback:(id)a4;
+ (id)projectFileExtensionForProjectType:(int64_t)a3;
+ (id)projectFileUTIForProjectType:(int64_t)a3;
+ (id)projectTypeNameForProjectType:(int64_t)a3;
+ (id)serializeInfoDictionary:(id)a3 error:(id *)a4;
+ (id)urlForInfoDictionaryInBundleURL:(id)a3;
+ (id)urlForLocalizableMediaInBundleURL:(id)a3;
+ (id)urlForLocalizableResourcesInBundleURL:(id)a3;
+ (id)urlForLocalizableThumbnailsInBundleURL:(id)a3;
+ (id)urlForLocalizedInfoStringsInBundleURL:(id)a3 localization:(id)a4;
+ (id)urlForLocalizedResourcesInBundleURL:(id)a3 localization:(id)a4;
+ (id)urlForMediaInBundleURL:(id)a3;
+ (id)urlForProjectFilePath:(id)a3 inBundleURL:(id)a4;
+ (id)urlForResourcesInBundleURL:(id)a3;
+ (id)urlForThumbnailsInBundleURL:(id)a3;
+ (int64_t)compositionTypeForProjectFileExtension:(id)a3;
+ (int64_t)compositionTypeForProjectFileUTI:(id)a3;
+ (int64_t)compositionTypeForProjectType:(int64_t)a3;
+ (int64_t)projectTypeForBundleExtension:(id)a3;
+ (int64_t)projectTypeForBundleUTI:(id)a3;
+ (int64_t)projectTypeForProjectFileExtension:(id)a3;
+ (int64_t)projectTypeForProjectFileUTI:(id)a3;
+ (int64_t)templateTypeForProjectType:(int64_t)a3;
+ (unint64_t)currentBundleVersion;
- (BOOL)isCopyProtected;
- (BOOL)supportsFCPiPad;
- (NSArray)localizations;
- (NSArray)preferredLocalizations;
- (NSArray)versionComponents;
- (NSDictionary)consolidatedLocalizedInfoDictionary;
- (NSDictionary)infoDictionary;
- (NSDictionary)localizedInfoDictionary;
- (NSMutableDictionary)localizedInfoDictionaries;
- (NSNumber)templateFlags;
- (NSString)category;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedCategory;
- (NSString)localizedName;
- (NSString)localizedTheme;
- (NSString)localizedVersion;
- (NSString)name;
- (NSString)projectFilePath;
- (NSString)projectTypeFolderName;
- (NSString)projectTypeName;
- (NSString)relativeInstallationPath;
- (NSString)theme;
- (NSString)version;
- (NSURL)bundleURL;
- (NSURL)localizedLargeThumbnailURL;
- (NSURL)localizedSmallThumbnailURL;
- (NSURL)projectFileURL;
- (PCMotionBundle)initWithURL:(id)a3;
- (id)URLForResource:(id)a3;
- (id)URLForResource:(id)a3 withExtension:(id)a4;
- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5;
- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5 localization:(id)a6;
- (id)URLsForResourcesWithExtension:(id)a3 subdirectory:(id)a4;
- (id)URLsForResourcesWithExtension:(id)a3 subdirectory:(id)a4 localization:(id)a5;
- (id)categoryForLocalization:(id)a3;
- (id)largeThumbnailURLForLocalization:(id)a3;
- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6;
- (id)localizedInfoDictionaryForLocalization:(id)a3;
- (id)localizedInfoDictionaryWithDefaults:(id)a3;
- (id)localizedInfoStringsForLocalization:(id)a3;
- (id)localizedParameterForKey:(id)a3;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6 found:(BOOL *)a7;
- (id)nameForLocalization:(id)a3;
- (id)objectForInfoDictionaryKey:(id)a3 localization:(id)a4;
- (id)smallThumbnailURLForLocalization:(id)a3;
- (id)themeForLocalization:(id)a3;
- (id)versionForComponentAtIndex:(unint64_t)a3;
- (id)versionForLocalization:(id)a3;
- (int64_t)projectType;
- (unint64_t)bundleVersion;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (void)dealloc;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)setBundleURL:(id)a3;
- (void)setConsolidatedLocalizedInfoDictionary:(id)a3;
- (void)setInfoDictionary:(id)a3;
- (void)setLocalizations:(id)a3;
- (void)setLocalizedInfoDictionaries:(id)a3;
- (void)setLocalizedInfoDictionary:(id)a3;
- (void)setPreferredLocalizations:(id)a3;
- (void)setTemplateFlags:(id)a3;
- (void)setVersionComponents:(id)a3;
@end

@implementation PCMotionBundle

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PCMotionBundle;
  [(PCMotionBundle *)&v3 dealloc];
}

- (PCMotionBundle)initWithURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PCMotionBundle;
  v4 = [(PCMotionBundle *)&v6 init];
  if (v4) {
    v4->_bundleURL = (NSURL *)[a3 copy];
  }
  return v4;
}

- (NSDictionary)infoDictionary
{
  result = self->_infoDictionary;
  if (!result)
  {
    result = (NSDictionary *)+[PCMotionBundle infoDictionaryAtURL:](PCMotionBundle, "infoDictionaryAtURL:", +[PCMotionBundle urlForInfoDictionaryInBundleURL:self->_bundleURL]);
    self->_infoDictionary = result;
  }
  return result;
}

- (NSDictionary)localizedInfoDictionary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  result = self->_localizedInfoDictionary;
  if (!result)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = [(PCMotionBundle *)self preferredLocalizations];
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(PCMotionBundle *)self localizedInfoStringsForLocalization:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        if (v9) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      result = (NSDictionary *)+[PCMotionBundle infoDictionaryWithDefaults:[(PCMotionBundle *)self infoDictionary] andOverrides:v9];
      self->_localizedInfoDictionary = result;
      if (result) {
        return result;
      }
    }
    else
    {
LABEL_10:
      result = self->_localizedInfoDictionary;
      if (result) {
        return result;
      }
    }
    result = (NSDictionary *)[(NSDictionary *)[(PCMotionBundle *)self infoDictionary] copy];
    self->_localizedInfoDictionary = result;
  }
  return result;
}

- (NSArray)preferredLocalizations
{
  result = self->_preferredLocalizations;
  if (!result)
  {
    v4 = [(PCMotionBundle *)self localizations];
    result = (NSArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "preferredLocalizationsFromArray:", v4), "copy");
    self->_preferredLocalizations = result;
  }
  return result;
}

- (NSArray)localizations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  result = self->_localizations;
  if (!result)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = +[PCMotionBundle urlForResourcesInBundleURL:self->_bundleURL];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 0, 0);
    if (v6)
    {
      uint64_t v7 = v6;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v12, "pathExtension"), "isEqualToString:", @"lproj")) {
              objc_msgSend(v4, "addObject:", objc_msgSend((id)objc_msgSend(v12, "lastPathComponent"), "stringByDeletingPathExtension"));
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
    self->_localizations = (NSArray *)[v4 copy];

    return self->_localizations;
  }
  return result;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(PCMotionBundle *)self preferredLocalizations];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
      char v17 = 0;
      id result = [(PCMotionBundle *)self localizedStringForKey:a3 value:a4 table:a5 localization:v15 found:&v17];
      if (v17) {
        break;
      }
      if (!v12) {
        id v12 = result;
      }
      if (v11 == ++v14)
      {
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v12 = 0;
LABEL_13:
    if (v12) {
      return v12;
    }
    else {
      return &stru_1F119C770;
    }
  }
  return result;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  char v7 = 0;
  return [(PCMotionBundle *)self localizedStringForKey:a3 value:a4 table:a5 localization:a6 found:&v7];
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6 found:(BOOL *)a7
{
  *a7 = 0;
  if (a3)
  {
    if (a5) {
      uint64_t v10 = (__CFString *)a5;
    }
    else {
      uint64_t v10 = @"Localizable";
    }
    id v11 = [(PCMotionBundle *)self URLForResource:v10 withExtension:@"strings" subdirectory:0 localization:a6];
    if (v11
      && (id v12 = +[PCMotionBundle infoDictionaryAtURL:v11]) != 0
      && (id result = (id)[v12 objectForKey:a3]) != 0)
    {
      *a7 = 1;
    }
    else if (+[PCMotionBundle isStringNilOrEmpty:a4])
    {
      return a3;
    }
    else
    {
      return a4;
    }
  }
  else if (a4)
  {
    return a4;
  }
  else
  {
    return &stru_1F119C770;
  }
  return result;
}

- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F119C770];

  return v5;
}

- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F119C770];

  return v6;
}

- (id)URLForResource:(id)a3
{
  return [(PCMotionBundle *)self URLForResource:a3 withExtension:0 subdirectory:0];
}

- (id)URLForResource:(id)a3 withExtension:(id)a4
{
  return [(PCMotionBundle *)self URLForResource:a3 withExtension:a4 subdirectory:0];
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [(PCMotionBundle *)self preferredLocalizations];
  id result = (id)[(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    id v11 = result;
    uint64_t v12 = *(void *)v15;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v15 != v12) {
        objc_enumerationMutation(v9);
      }
      id result = [(PCMotionBundle *)self URLForResource:a3 withExtension:a4 subdirectory:a5 localization:*(void *)(*((void *)&v14 + 1) + 8 * v13)];
      if (result) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id result = (id)[(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        id v11 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5 localization:(id)a6
{
  id v11 = +[PCMotionBundle urlForResourcesInBundleURL:self->_bundleURL];
  uint64_t v12 = (uint64_t)v11;
  if (a5) {
    uint64_t v12 = [v11 URLByAppendingPathComponent:a5];
  }
  if (a4) {
    a3 = (id)[a3 stringByAppendingPathExtension:a4];
  }
  uint64_t v13 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:a3 relativeToURL:v12];
  if (([v13 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v14 = +[PCMotionBundle urlForLocalizedResourcesInBundleURL:self->_bundleURL localization:a6];
    uint64_t v15 = (uint64_t)v14;
    if (a5) {
      uint64_t v15 = [v14 URLByAppendingPathComponent:a5];
    }
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:a3 relativeToURL:v15];
    if (([v13 checkResourceIsReachableAndReturnError:0] & 1) == 0)
    {
      id v16 = +[PCMotionBundle urlForLocalizableResourcesInBundleURL:self->_bundleURL];
      uint64_t v17 = (uint64_t)v16;
      if (a5) {
        uint64_t v17 = [v16 URLByAppendingPathComponent:a5];
      }
      long long v18 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:a3 relativeToURL:v17];
      if ([v18 checkResourceIsReachableAndReturnError:0]) {
        return v18;
      }
      else {
        return 0;
      }
    }
  }
  return v13;
}

- (id)URLsForResourcesWithExtension:(id)a3 subdirectory:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(PCMotionBundle *)self preferredLocalizations];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [(PCMotionBundle *)self URLsForResourcesWithExtension:a3 subdirectory:a4 localization:*(void *)(*((void *)&v15 + 1) + 8 * v12)];
        if (v13) {
          [v7 addObjectsFromArray:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v7;
}

- (id)URLsForResourcesWithExtension:(id)a3 subdirectory:(id)a4 localization:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v9 = +[PCMotionBundle urlForResourcesInBundleURL:self->_bundleURL];
  uint64_t v10 = (uint64_t)v9;
  if (a4) {
    uint64_t v10 = [v9 URLByAppendingPathComponent:a4];
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v12 = (void *)[v11 contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:0 options:0 error:0];
  if (v12)
  {
    id v13 = v12;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v18, "pathExtension"), "isEqualToString:", a3)) {
            [v8 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v15);
    }
  }
  id v19 = +[PCMotionBundle urlForLocalizedResourcesInBundleURL:self->_bundleURL localization:a5];
  uint64_t v20 = (uint64_t)v19;
  if (a4) {
    uint64_t v20 = [v19 URLByAppendingPathComponent:a4];
  }
  long long v21 = (void *)[v11 contentsOfDirectoryAtURL:v20 includingPropertiesForKeys:0 options:0 error:0];
  if (v21)
  {
    v22 = v21;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          if (objc_msgSend((id)objc_msgSend(v27, "pathExtension"), "isEqualToString:", a3)) {
            [v8 addObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v24);
    }
  }
  return v8;
}

+ (unint64_t)currentBundleVersion
{
  return 1;
}

+ (NSArray)projectTypes
{
  if (projectTypes_onceToken != -1) {
    dispatch_once(&projectTypes_onceToken, &__block_literal_global_58);
  }
  return (NSArray *)projectTypes_projectTypes;
}

void *__30__PCMotionBundle_projectTypes__block_invoke()
{
  id result = &unk_1F11EC6D0;
  projectTypes_projectTypes = (uint64_t)result;
  return result;
}

+ (NSArray)projectTypeNames
{
  if (projectTypeNames_onceToken != -1) {
    dispatch_once(&projectTypeNames_onceToken, &__block_literal_global_28);
  }
  return (NSArray *)projectTypeNames_typeNames;
}

void *__34__PCMotionBundle_projectTypeNames__block_invoke()
{
  id result = &unk_1F11EC6E8;
  projectTypeNames_typeNames = (uint64_t)result;
  return result;
}

+ (NSArray)projectFolderNames
{
  if (projectFolderNames_onceToken != -1) {
    dispatch_once(&projectFolderNames_onceToken, &__block_literal_global_48);
  }
  return (NSArray *)projectFolderNames_folderNames;
}

void *__36__PCMotionBundle_projectFolderNames__block_invoke()
{
  id result = &unk_1F11EC700;
  projectFolderNames_folderNames = (uint64_t)result;
  return result;
}

+ (NSArray)bundleExtensions
{
  if (bundleExtensions_onceToken != -1) {
    dispatch_once(&bundleExtensions_onceToken, &__block_literal_global_68);
  }
  return (NSArray *)bundleExtensions_pathExtensions;
}

void *__34__PCMotionBundle_bundleExtensions__block_invoke()
{
  id result = &unk_1F11EC718;
  bundleExtensions_pathExtensions = (uint64_t)result;
  return result;
}

+ (NSArray)projectFileExtensions
{
  if (projectFileExtensions_onceToken != -1) {
    dispatch_once(&projectFileExtensions_onceToken, &__block_literal_global_88);
  }
  return (NSArray *)projectFileExtensions_pathExtensions;
}

void *__39__PCMotionBundle_projectFileExtensions__block_invoke()
{
  id result = &unk_1F11EC730;
  projectFileExtensions_pathExtensions = (uint64_t)result;
  return result;
}

+ (NSArray)bundleUTIs
{
  if (bundleUTIs_onceToken != -1) {
    dispatch_once(&bundleUTIs_onceToken, &__block_literal_global_105);
  }
  return (NSArray *)bundleUTIs_bundleUTIs;
}

void *__28__PCMotionBundle_bundleUTIs__block_invoke()
{
  id result = &unk_1F11EC748;
  bundleUTIs_bundleUTIs = (uint64_t)result;
  return result;
}

+ (NSArray)projectFileUTIs
{
  if (projectFileUTIs_onceToken != -1) {
    dispatch_once(&projectFileUTIs_onceToken, &__block_literal_global_125);
  }
  return (NSArray *)projectFileUTIs_projectFileUTIs;
}

void *__33__PCMotionBundle_projectFileUTIs__block_invoke()
{
  id result = &unk_1F11EC760;
  projectFileUTIs_projectFileUTIs = (uint64_t)result;
  return result;
}

+ (BOOL)isValidBundleURL:(id)a3
{
  uint64_t v5 = [a3 pathExtension];
  if (v5)
  {
    LODWORD(v5) = [a1 isValidBundleExtension:v5];
    if (v5)
    {
      id v7 = 0;
      LODWORD(v5) = [a3 getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C628] error:0];
      if (v5) {
        LOBYTE(v5) = [v7 BOOLValue];
      }
    }
  }
  return v5;
}

+ (BOOL)isValidBundleExtension:(id)a3
{
  id v4 = (void *)[a1 bundleExtensions];
  uint64_t v5 = [a3 lowercaseString];

  return [v4 containsObject:v5];
}

+ (BOOL)isValidBundleUTI:(id)a3
{
  id v4 = (void *)[a1 bundleUTIs];
  uint64_t v5 = [a3 lowercaseString];

  return [v4 containsObject:v5];
}

+ (BOOL)isValidProjectFileURL:(id)a3
{
  id v7 = 0;
  LODWORD(v5) = [a3 getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C670] error:0];
  if (v5)
  {
    LODWORD(v5) = [v7 BOOLValue];
    if (v5)
    {
      uint64_t v5 = [a3 pathExtension];
      if (v5) {
        LOBYTE(v5) = [a1 isValidProjectFileExtension:v5];
      }
    }
  }
  return v5;
}

+ (BOOL)isValidProjectFileExtension:(id)a3
{
  id v4 = (void *)[a1 projectFileExtensions];
  uint64_t v5 = [a3 lowercaseString];

  return [v4 containsObject:v5];
}

+ (BOOL)isValidProjectFileUTI:(id)a3
{
  id v4 = (void *)[a1 projectFileUTIs];
  uint64_t v5 = [a3 lowercaseString];

  return [v4 containsObject:v5];
}

+ (BOOL)bundleContentsAreEqualAtURL:(id)a3 andURL:(id)a4
{
  id v7 = (void *)[a3 pathExtension];
  uint64_t v8 = [a4 pathExtension];
  if (![a1 isValidBundleExtension:v7] || objc_msgSend(v7, "caseInsensitiveCompare:", v8)) {
    return 0;
  }
  uint64_t v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v11 = [a3 path];
  uint64_t v12 = [a4 path];

  return [v10 contentsEqualAtPath:v11 andPath:v12];
}

+ (id)bundleURLForProjectFileURL:(id)a3
{
  uint64_t v5 = (void *)[a3 pathComponents];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  long long v17 = __Block_byref_object_copy__15;
  long long v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  id v19 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = *(void *)"";
  v9[2] = __45__PCMotionBundle_bundleURLForProjectFileURL___block_invoke;
  v9[3] = &unk_1E616BF70;
  v9[4] = a1;
  v9[5] = &v14;
  v9[6] = &v10;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v9];
  uint64_t v6 = (void *)v15[5];
  if (*((unsigned char *)v11 + 24))
  {
    id v7 = v6;
  }
  else
  {

    id v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __45__PCMotionBundle_bundleURLForProjectFileURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) URLByDeletingLastPathComponent];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v6;
  uint64_t result = [*(id *)(a1 + 32) isValidBundleURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (id)bundleURLInFileURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 path];
  uint64_t v5 = (void *)[a1 bundleExtensions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id result = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [v4 rangeOfString:*(void *)(*((void *)&v13 + 1) + 8 * (void)v9) options:1];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = [v4 substringToIndex:v10 + v11];
          return (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:1];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v7 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

+ (id)projectTypeNameForProjectType:(int64_t)a3
{
  id v4 = (void *)[a1 projectTypeNames];
  if ([v4 count] <= (unint64_t)a3) {
    return 0;
  }

  return (id)[v4 objectAtIndexedSubscript:a3];
}

+ (id)folderNameForProjectType:(int64_t)a3
{
  id v4 = (void *)[a1 projectFolderNames];
  if ([v4 count] <= (unint64_t)a3) {
    return 0;
  }

  return (id)[v4 objectAtIndexedSubscript:a3];
}

+ (id)bundleExtensionForProjectType:(int64_t)a3
{
  id v4 = (void *)[a1 bundleExtensions];
  if ([v4 count] <= (unint64_t)a3) {
    return 0;
  }

  return (id)[v4 objectAtIndexedSubscript:a3];
}

+ (int64_t)projectTypeForBundleExtension:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "bundleExtensions"), "count");
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  int64_t v7 = 0;
  while (objc_msgSend((id)objc_msgSend(a1, "bundleExtensionForProjectType:", v7), "caseInsensitiveCompare:", a3))
  {
    if (v6 == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

+ (id)bundleUTIForProjectType:(int64_t)a3
{
  id v4 = (void *)[a1 bundleUTIs];
  if ([v4 count] <= (unint64_t)a3) {
    return 0;
  }

  return (id)[v4 objectAtIndexedSubscript:a3];
}

+ (int64_t)projectTypeForBundleUTI:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "bundleUTIs"), "count");
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  int64_t v7 = 0;
  while (objc_msgSend((id)objc_msgSend(a1, "bundleUTIForProjectType:", v7), "caseInsensitiveCompare:", a3))
  {
    if (v6 == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

+ (id)projectFileExtensionForProjectType:(int64_t)a3
{
  id v4 = (void *)[a1 projectFileExtensions];
  if ([v4 count] <= (unint64_t)a3) {
    return 0;
  }

  return (id)[v4 objectAtIndexedSubscript:a3];
}

+ (int64_t)projectTypeForProjectFileExtension:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "projectFileExtensions"), "count");
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  int64_t v7 = 0;
  while (!v7
       || objc_msgSend((id)objc_msgSend(a1, "projectFileExtensionForProjectType:", v7), "caseInsensitiveCompare:", a3))
  {
    if (v6 == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

+ (id)projectFileUTIForProjectType:(int64_t)a3
{
  id v4 = (void *)[a1 projectFileUTIs];
  if ([v4 count] <= (unint64_t)a3) {
    return 0;
  }

  return (id)[v4 objectAtIndexedSubscript:a3];
}

+ (int64_t)projectTypeForProjectFileUTI:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "projectFileUTIs"), "count");
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  int64_t v7 = 0;
  while (!v7 || objc_msgSend((id)objc_msgSend(a1, "projectFileUTIForProjectType:", v7), "caseInsensitiveCompare:", a3))
  {
    if (v6 == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

+ (int64_t)compositionTypeForProjectType:(int64_t)a3
{
  if ((unint64_t)a3 >= 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

+ (int64_t)templateTypeForProjectType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return qword_1B7E7E048[a3];
  }
}

+ (id)compositionProjectFileExtensionForProjectType:(int64_t)a3
{
  uint64_t v4 = [a1 templateTypeForProjectType:a3];

  return (id)[a1 projectFileExtensionForProjectType:v4];
}

+ (int64_t)compositionTypeForProjectFileExtension:(id)a3
{
  if ([a1 projectTypeForProjectFileExtension:a3] == 1) {
    return 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

+ (id)compositionProjectFileUTIForProjectType:(int64_t)a3
{
  uint64_t v4 = [a1 templateTypeForProjectType:a3];

  return (id)[a1 projectFileUTIForProjectType:v4];
}

+ (int64_t)compositionTypeForProjectFileUTI:(id)a3
{
  if ([a1 projectTypeForProjectFileUTI:a3] == 1) {
    return 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (NSString)identifier
{
  id v2 = [(NSDictionary *)[(PCMotionBundle *)self infoDictionary] objectForKeyedSubscript:@"com.apple.motion.package.identifier"];

  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:v2];
}

- (int64_t)projectType
{
  id v2 = [(NSURL *)[(PCMotionBundle *)self bundleURL] pathExtension];

  return +[PCMotionBundle projectTypeForBundleExtension:v2];
}

- (NSString)projectTypeName
{
  int64_t v2 = [(PCMotionBundle *)self projectType];

  return (NSString *)+[PCMotionBundle projectTypeNameForProjectType:v2];
}

- (NSString)projectTypeFolderName
{
  int64_t v2 = [(PCMotionBundle *)self projectType];

  return (NSString *)+[PCMotionBundle folderNameForProjectType:v2];
}

- (NSString)name
{
  id v2 = [(NSDictionary *)[(PCMotionBundle *)self infoDictionary] objectForKeyedSubscript:@"com.apple.motion.package.name"];

  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:v2];
}

- (NSString)category
{
  id v2 = [(NSDictionary *)[(PCMotionBundle *)self infoDictionary] objectForKeyedSubscript:@"com.apple.motion.package.category"];

  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:v2];
}

- (NSString)theme
{
  id v2 = [(NSDictionary *)[(PCMotionBundle *)self infoDictionary] objectForKeyedSubscript:@"com.apple.motion.package.theme"];

  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:v2];
}

- (NSURL)projectFileURL
{
  if (![(PCMotionBundle *)self projectFilePath]) {
    return 0;
  }
  objc_super v3 = [(NSURL *)[(PCMotionBundle *)self bundleURL] URLByAppendingPathComponent:[(PCMotionBundle *)self projectFilePath]];
  if (([(id)objc_opt_class() isValidProjectFileURL:v3] & 1) == 0) {
    return 0;
  }
  return v3;
}

- (NSString)projectFilePath
{
  id v2 = [(PCMotionBundle *)self infoDictionary];

  return (NSString *)[(NSDictionary *)v2 objectForKeyedSubscript:@"com.apple.motion.package.projectFilePath"];
}

- (NSString)relativeInstallationPath
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(v3, "addObject:", -[PCMotionBundle projectTypeFolderName](self, "projectTypeFolderName"));
  objc_msgSend(v3, "addObject:", -[PCMotionBundle identifier](self, "identifier"));
  [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%lu_%lu", -[PCMotionBundle majorVersion](self, "majorVersion"), -[PCMotionBundle minorVersion](self, "minorVersion"))];
  objc_msgSend(v3, "addObject:", -[NSURL lastPathComponent](-[PCMotionBundle bundleURL](self, "bundleURL"), "lastPathComponent"));
  uint64_t v4 = (NSString *)[v3 componentsJoinedByString:@"/"];

  return v4;
}

- (NSString)version
{
  id v2 = [(NSDictionary *)[(PCMotionBundle *)self infoDictionary] objectForKeyedSubscript:@"com.apple.motion.package.version"];

  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:v2];
}

- (unint64_t)majorVersion
{
  id v2 = [(PCMotionBundle *)self versionForComponentAtIndex:0];

  return [v2 integerValue];
}

- (unint64_t)minorVersion
{
  id v2 = [(PCMotionBundle *)self versionForComponentAtIndex:1];

  return [v2 integerValue];
}

- (NSArray)versionComponents
{
  versionComponents = self->_versionComponents;
  if (!versionComponents)
  {
    versionComponents = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = [(NSString *)[(PCMotionBundle *)self version] componentsSeparatedByString:@"."];
    uint64_t v5 = [(NSArray *)v4 count];
    if (v5)
    {
      uint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        -[NSArray addObject:](versionComponents, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(-[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", i), "integerValue")));
    }
    self->_versionComponents = versionComponents;
  }
  return versionComponents;
}

- (id)versionForComponentAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(PCMotionBundle *)self versionComponents];
  if ([(NSArray *)v4 count] <= a3) {
    return 0;
  }

  return [(NSArray *)v4 objectAtIndexedSubscript:a3];
}

- (unint64_t)bundleVersion
{
  unint64_t result = [(NSDictionary *)[(PCMotionBundle *)self infoDictionary] objectForKeyedSubscript:@"com.apple.motion.package.bundleVersion"];
  if (result)
  {
    return [(id)result unsignedIntegerValue];
  }
  return result;
}

- (BOOL)supportsFCPiPad
{
  id v2 = [(NSDictionary *)[(PCMotionBundle *)self infoDictionary] objectForKeyedSubscript:@"com.apple.motion.package.supportsFCPiPad"];

  return [v2 BOOLValue];
}

- (BOOL)isCopyProtected
{
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", @"com.apple.motion.package.isCopyProtected"), "BOOLValue"))LOBYTE(v3) = 1; {
  else
  }
    return ([(NSNumber *)[(PCMotionBundle *)self templateFlags] unsignedIntValue] >> 3) & 1;
  return v3;
}

- (NSNumber)templateFlags
{
  unint64_t result = self->_templateFlags;
  if (!result)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29250]), "initWithContentsOfURL:", -[PCMotionBundle projectFileURL](self, "projectFileURL"));
    [v4 setDelegate:self];
    [v4 parse];
    if (self->_templateFlagsParseState.foundTemplateFlag) {
      uint64_t templateFlags = self->_templateFlagsParseState.templateFlags;
    }
    else {
      uint64_t templateFlags = 0;
    }

    unint64_t result = (NSNumber *)(id)[NSNumber numberWithUnsignedInt:templateFlags];
    self->_uint64_t templateFlags = result;
  }
  return result;
}

- (NSString)localizedVersion
{
  BOOL v3 = [(NSDictionary *)[(PCMotionBundle *)self consolidatedLocalizedInfoDictionary] objectForKeyedSubscript:@"CFBundleShortVersionString"];
  if (!+[PCMotionBundle isStringNilOrEmpty:v3]) {
    return v3;
  }

  return [(PCMotionBundle *)self version];
}

- (id)versionForLocalization:(id)a3
{
  id v4 = [(PCMotionBundle *)self objectForInfoDictionaryKey:@"CFBundleShortVersionString" localization:a3];
  if (!+[PCMotionBundle isStringNilOrEmpty:v4]) {
    return v4;
  }

  return [(PCMotionBundle *)self version];
}

- (NSString)localizedName
{
  BOOL v3 = [(NSDictionary *)[(PCMotionBundle *)self consolidatedLocalizedInfoDictionary] objectForKeyedSubscript:@"com.apple.motion.package.name"];
  if (!+[PCMotionBundle isStringNilOrEmpty:v3]) {
    return v3;
  }
  id v4 = [(NSURL *)[(PCMotionBundle *)self bundleURL] lastPathComponent];

  return [(NSString *)v4 stringByDeletingPathExtension];
}

- (id)nameForLocalization:(id)a3
{
  id v4 = [(PCMotionBundle *)self objectForInfoDictionaryKey:@"com.apple.motion.package.name" localization:a3];
  if (!+[PCMotionBundle isStringNilOrEmpty:v4]) {
    return v4;
  }
  uint64_t v5 = [(NSURL *)[(PCMotionBundle *)self bundleURL] lastPathComponent];

  return [(NSString *)v5 stringByDeletingPathExtension];
}

- (NSString)localizedCategory
{
  id v2 = [(PCMotionBundle *)self consolidatedLocalizedInfoDictionary];

  return (NSString *)[(NSDictionary *)v2 objectForKeyedSubscript:@"com.apple.motion.package.category"];
}

- (id)categoryForLocalization:(id)a3
{
  return [(PCMotionBundle *)self objectForInfoDictionaryKey:@"com.apple.motion.package.category" localization:a3];
}

- (NSString)localizedTheme
{
  id v2 = [(PCMotionBundle *)self consolidatedLocalizedInfoDictionary];

  return (NSString *)[(NSDictionary *)v2 objectForKeyedSubscript:@"com.apple.motion.package.theme"];
}

- (id)themeForLocalization:(id)a3
{
  return [(PCMotionBundle *)self objectForInfoDictionaryKey:@"com.apple.motion.package.theme" localization:a3];
}

- (NSURL)localizedSmallThumbnailURL
{
  return (NSURL *)[(PCMotionBundle *)self URLForResource:@"Thumbnail/small" withExtension:@"png"];
}

- (id)smallThumbnailURLForLocalization:(id)a3
{
  return [(PCMotionBundle *)self URLForResource:@"small" withExtension:@"png" subdirectory:@"Thumbnail" localization:a3];
}

- (NSURL)localizedLargeThumbnailURL
{
  return (NSURL *)[(PCMotionBundle *)self URLForResource:@"Thumbnail/large" withExtension:@"png"];
}

- (id)largeThumbnailURLForLocalization:(id)a3
{
  return [(PCMotionBundle *)self URLForResource:@"large" withExtension:@"png" subdirectory:@"Thumbnail" localization:a3];
}

+ (id)infoDictionaryAtURL:(id)a3
{
  if (![a3 checkResourceIsReachableAndReturnError:0]) {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F98];

  return (id)[v5 propertyListWithData:v4 options:0 format:0 error:0];
}

- (NSDictionary)consolidatedLocalizedInfoDictionary
{
  unint64_t result = self->_consolidatedLocalizedInfoDictionary;
  if (!result)
  {
    unint64_t result = (NSDictionary *)[(PCMotionBundle *)self localizedInfoDictionaryWithDefaults:[(PCMotionBundle *)self infoDictionary]];
    self->_consolidatedLocalizedInfoDictionary = result;
  }
  return result;
}

- (NSMutableDictionary)localizedInfoDictionaries
{
  unint64_t result = self->_localizedInfoDictionaries;
  if (!result)
  {
    unint64_t result = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_localizedInfoDictionaries = result;
  }
  return result;
}

- (id)localizedInfoDictionaryForLocalization:(id)a3
{
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_localizedInfoDictionaries, "objectForKeyedSubscript:"))
  {
    localizedInfoDictionaries = self->_localizedInfoDictionaries;
    return (id)[(NSMutableDictionary *)localizedInfoDictionaries objectForKeyedSubscript:a3];
  }
  else
  {
    id v7 = [(PCMotionBundle *)self localizedInfoStringsForLocalization:a3];
    if (v7)
    {
      id v8 = +[PCMotionBundle infoDictionaryWithDefaults:[(PCMotionBundle *)self infoDictionary] andOverrides:v7];
      [(NSMutableDictionary *)[(PCMotionBundle *)self localizedInfoDictionaries] setObject:v8 forKeyedSubscript:a3];
      return v8;
    }
    else
    {
      return [(PCMotionBundle *)self infoDictionary];
    }
  }
}

+ (id)infoDictionaryWithDefaults:(id)a3 andOverrides:(id)a4
{
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v6 addEntriesFromDictionary:a3];
  [v6 addEntriesFromDictionary:a4];
  return v6;
}

- (id)localizedInfoDictionaryWithDefaults:(id)a3
{
  uint64_t v4 = [(PCMotionBundle *)self localizedInfoDictionary];

  return +[PCMotionBundle infoDictionaryWithDefaults:a3 andOverrides:v4];
}

- (id)localizedInfoStringsForLocalization:(id)a3
{
  id v3 = +[PCMotionBundle urlForLocalizedInfoStringsInBundleURL:self->_bundleURL localization:a3];
  if (![v3 checkResourceIsReachableAndReturnError:0]) {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F98];

  return (id)[v5 propertyListWithData:v4 options:0 format:0 error:0];
}

- (id)objectForInfoDictionaryKey:(id)a3 localization:(id)a4
{
  id result = (id)objc_msgSend(-[PCMotionBundle localizedInfoDictionaryForLocalization:](self, "localizedInfoDictionaryForLocalization:", a4), "objectForKeyedSubscript:", a3);
  if (!result)
  {
    id v7 = [(PCMotionBundle *)self infoDictionary];
    return [(NSDictionary *)v7 objectForKeyedSubscript:a3];
  }
  return result;
}

+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 version:(id)a4 projectFilePath:(id)a5 supportsFCPiPad:(BOOL)a6 name:(id)a7 category:(id)a8 theme:(id)a9
{
  return (id)[a1 infoDictionaryWithBundleVersion:a3 version:a4 projectFilePath:a5 supportsFCPiPad:a6 name:a7 category:a8 theme:a9 additionalEntries:MEMORY[0x1E4F1CC08]];
}

+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 identifier:(id)a4 version:(id)a5 projectFilePath:(id)a6 supportsFCPiPad:(BOOL)a7 name:(id)a8 category:(id)a9 theme:(id)a10
{
  return (id)[a1 infoDictionaryWithBundleVersion:a3 identifier:a4 version:a5 projectFilePath:a6 supportsFCPiPad:a7 name:a8 category:a9 theme:a10 additionalEntries:MEMORY[0x1E4F1CC08]];
}

+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 version:(id)a4 projectFilePath:(id)a5 supportsFCPiPad:(BOOL)a6 name:(id)a7 category:(id)a8 theme:(id)a9 additionalEntries:(id)a10
{
  return (id)[a1 infoDictionaryWithBundleVersion:a3 identifier:0 version:a4 projectFilePath:a5 supportsFCPiPad:a6 name:a7 category:a8 theme:a9 additionalEntries:a10];
}

+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 identifier:(id)a4 version:(id)a5 projectFilePath:(id)a6 supportsFCPiPad:(BOOL)a7 name:(id)a8 category:(id)a9 theme:(id)a10 additionalEntries:(id)a11
{
  BOOL v12 = a7;
  v25[9] = *MEMORY[0x1E4F143B8];
  id v16 = +[PCMotionBundle nilOrNonEmptyString:a4];
  v24[0] = @"com.apple.motion.package.bundleVersion";
  v25[0] = [NSNumber numberWithUnsignedInteger:a3];
  v24[1] = @"com.apple.motion.package.identifier";
  if (!v16) {
    id v16 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  }
  if (!a5) {
    a5 = &stru_1F119C770;
  }
  v25[1] = v16;
  v25[2] = a5;
  v24[2] = @"com.apple.motion.package.version";
  v24[3] = @"com.apple.motion.package.projectFilePath";
  if (a6) {
    long long v17 = (__CFString *)a6;
  }
  else {
    long long v17 = &stru_1F119C770;
  }
  v25[3] = v17;
  v24[4] = @"com.apple.motion.package.supportsFCPiPad";
  v25[4] = [NSNumber numberWithBool:v12];
  v25[5] = a5;
  v24[5] = @"CFBundleShortVersionString";
  v24[6] = @"com.apple.motion.package.name";
  if (a8) {
    uint64_t v18 = (__CFString *)a8;
  }
  else {
    uint64_t v18 = &stru_1F119C770;
  }
  if (a9) {
    id v19 = (__CFString *)a9;
  }
  else {
    id v19 = &stru_1F119C770;
  }
  v25[6] = v18;
  v25[7] = v19;
  v24[7] = @"com.apple.motion.package.category";
  v24[8] = @"com.apple.motion.package.theme";
  if (a10) {
    uint64_t v20 = (__CFString *)a10;
  }
  else {
    uint64_t v20 = &stru_1F119C770;
  }
  v25[8] = v20;
  long long v21 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:9];
  if ([a11 count]) {
    return (id)[a1 infoDictionaryWithDefaults:v21 andOverrides:a11];
  }
  return v21;
}

+ (id)serializeInfoDictionary:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:100 options:0 error:a4];
}

+ (id)urlForProjectFilePath:(id)a3 inBundleURL:(id)a4
{
  return (id)[a4 URLByAppendingPathComponent:a3];
}

+ (id)urlForInfoDictionaryInBundleURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Contents/Info.plist"];
}

+ (id)urlForResourcesInBundleURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Contents/Resources" isDirectory:1];
}

+ (id)urlForLocalizedResourcesInBundleURL:(id)a3 localization:(id)a4
{
  id v5 = +[PCMotionBundle urlForResourcesInBundleURL:a3];
  uint64_t v6 = [a4 stringByAppendingPathExtension:@"lproj"];

  return (id)[v5 URLByAppendingPathComponent:v6 isDirectory:1];
}

+ (id)urlForLocalizedInfoStringsInBundleURL:(id)a3 localization:(id)a4
{
  uint64_t v4 = (void *)[a1 urlForLocalizedResourcesInBundleURL:a3 localization:a4];

  return (id)[v4 URLByAppendingPathComponent:@"InfoPlist.strings"];
}

+ (id)urlForLocalizableResourcesInBundleURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Contents/Resources/Base.lproj" isDirectory:1];
}

+ (id)urlForMediaInBundleURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Contents/Resources/Media" isDirectory:1];
}

+ (id)urlForLocalizableMediaInBundleURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Contents/Resources/Base.lproj/Media" isDirectory:1];
}

+ (id)urlForThumbnailsInBundleURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Contents/Resources/Thumbnail" isDirectory:1];
}

+ (id)urlForLocalizableThumbnailsInBundleURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Contents/Resources/Base.lproj/Thumbnail" isDirectory:1];
}

- (id)localizedParameterForKey:(id)a3
{
  id v4 = [(NSDictionary *)[(PCMotionBundle *)self consolidatedLocalizedInfoDictionary] objectForKeyedSubscript:@"com.apple.motion.package.publishedParameters"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return (id)[v4 objectForKeyedSubscript:a3];
}

+ (id)createTempBundleWithProjectType:(int64_t)a3 error:(id *)a4
{
  v22[3] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(a1);
  id v7 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", @"."), 1, a4);
  if (!v8)
  {
LABEL_13:
    long long v15 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = [a1 bundleExtensionForProjectType:a3];
  uint64_t v10 = objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), "stringByAppendingPathExtension:", v9), 1);
  v22[0] = [a1 urlForThumbnailsInBundleURL:v10];
  v22[1] = [a1 urlForMediaInBundleURL:v10];
  v22[2] = [a1 urlForLocalizableResourcesInBundleURL:v10];
  uint64_t v11 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
LABEL_4:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v11);
      }
      if (![v7 createDirectoryAtURL:*(void *)(*((void *)&v17 + 1) + 8 * v14) withIntermediateDirectories:1 attributes:0 error:a4])goto LABEL_13; {
      if (v12 == ++v14)
      }
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(a1, "infoDictionaryWithBundleVersion:version:projectFilePath:supportsFCPiPad:name:category:theme:", objc_msgSend(a1, "currentBundleVersion"), &stru_1F119C770, &stru_1F119C770, 0, &stru_1F119C770, &stru_1F119C770, &stru_1F119C770), "writeToURL:error:", objc_msgSend(a1, "urlForInfoDictionaryInBundleURL:", v10), a4))long long v15 = (void *)v10; {
  else
  }
    long long v15 = 0;
LABEL_14:
  objc_sync_exit(a1);
  return v15;
}

+ (id)createTempBundleByCopyingBundleAtURL:(id)a3 error:(id *)a4
{
  objc_sync_enter(a1);
  id v7 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", @"."), 1, a4);
  if (v8)
  {
    uint64_t v9 = [a3 pathExtension];
    uint64_t v10 = objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), "stringByAppendingPathExtension:", v9), 1);
    if ([v7 copyItemAtURL:a3 toURL:v10 error:a4]) {
      uint64_t v11 = (void *)v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  objc_sync_exit(a1);
  return v11;
}

+ (BOOL)removeTempBundleDirectory:(id)a3 error:(id *)a4
{
  LOBYTE(a4) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", objc_msgSend(a3, "URLByDeletingLastPathComponent"), a4);
  objc_sync_exit(a1);
  return (char)a4;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  if ([a4 isEqualToString:@"template"]) {
    self->_templateFlagsParseState.foundTemplate = 1;
  }
  if ([a4 isEqualToString:@"flags"]
    && self->_templateFlagsParseState.foundTemplate)
  {
    self->_templateFlagsParseState.foundTemplateFlag = 1;
  }
  if ([a4 isEqualToString:@"scene"])
  {
    self->_templateFlagsParseState.success = 1;
    [a3 abortParsing];
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if ([a4 isEqualToString:@"flags"]
    && self->_templateFlagsParseState.foundTemplateFlag)
  {
    self->_templateFlagsParseState.success = 1;
    [a3 abortParsing];
  }
  if ([a4 isEqualToString:@"template"])
  {
    self->_templateFlagsParseState.success = 1;
    [a3 abortParsing];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  if (self->_templateFlagsParseState.foundTemplateFlag)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v6 setNumberStyle:1];
    self->_templateFlagsParseState.uint64_t templateFlags = objc_msgSend((id)objc_msgSend(v6, "numberFromString:", a4), "unsignedIntValue");
  }
}

+ (BOOL)isStringNilOrEmpty:(id)a3
{
  if (a3) {
    return [a3 isAllWhitespaceAndNewline];
  }
  else {
    return 1;
  }
}

+ (id)nilOrNonEmptyString:(id)a3
{
  if (objc_msgSend(a1, "isStringNilOrEmpty:")) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)nilOrNonEmptyString:(id)a3 withFallback:(id)a4
{
  id result = (id)[a1 nilOrNonEmptyString:a3];
  if (!result)
  {
    return (id)[a1 nilOrNonEmptyString:a4];
  }
  return result;
}

+ (id)nilOrNonEmptyString:(id)a3 withFallback1:(id)a4 fallback2:(id)a5
{
  uint64_t v7 = [a1 nilOrNonEmptyString:a3 withFallback:a4];

  return (id)[a1 nilOrNonEmptyString:v7 withFallback:a5];
}

- (NSString)description
{
  v18.receiver = self;
  v18.super_class = (Class)PCMotionBundle;
  long long v17 = [(PCMotionBundle *)&v18 description];
  uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), "localeIdentifier");
  uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "localizations");
  uint64_t v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "preferredLocalizations");
  uint64_t v13 = [(PCMotionBundle *)self localizations];
  uint64_t v12 = [(PCMotionBundle *)self preferredLocalizations];
  uint64_t v11 = [(PCMotionBundle *)self projectFilePath];
  uint64_t v10 = [(PCMotionBundle *)self projectTypeName];
  uint64_t v9 = [(PCMotionBundle *)self identifier];
  id v8 = [(PCMotionBundle *)self version];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PCMotionBundle majorVersion](self, "majorVersion"));
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PCMotionBundle minorVersion](self, "minorVersion"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PCMotionBundle bundleVersion](self, "bundleVersion"));
  if ([(PCMotionBundle *)self supportsFCPiPad]) {
    id v6 = @"Y";
  }
  else {
    id v6 = @"N";
  }
  return -[NSString stringByAppendingFormat:](v17, "stringByAppendingFormat:", @"\nCurrent Locale: %@\nApplication supported localizations: %@\nApplication preferred localizations: %@\nlocalizations: %@\npreferred localizations: %@\nprojectFilePath: %@\nprojectType: %@\nidentifier: %@\nversion: '%@' (Maj: %@ Min: %@)\nbundleVersion: %@\nsupportsFCPiPad: %@\nlocalizedVersion: %@\nlocalizedName: %@\nlocalizedCategory: %@\nlocalizedTheme: %@\nlocalizedSmallThumbnailURL: %@\nlocalizedLargeThumbnailURL: %@", v16, v15, v14, v13, v12, v11, v10, v9, v8, v3, v4, v5, v6, [(PCMotionBundle *)self localizedVersion], [(PCMotionBundle *)self localizedName], [(PCMotionBundle *)self localizedCategory],
           [(PCMotionBundle *)self localizedTheme],
           [(PCMotionBundle *)self localizedSmallThumbnailURL],
           [(PCMotionBundle *)self localizedLargeThumbnailURL]);
}

- (void)setInfoDictionary:(id)a3
{
}

- (void)setLocalizedInfoDictionary:(id)a3
{
}

- (void)setPreferredLocalizations:(id)a3
{
}

- (void)setLocalizations:(id)a3
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
}

- (void)setConsolidatedLocalizedInfoDictionary:(id)a3
{
}

- (void)setVersionComponents:(id)a3
{
}

- (void)setTemplateFlags:(id)a3
{
}

- (void)setLocalizedInfoDictionaries:(id)a3
{
}

@end