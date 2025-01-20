@interface PSSearchEntry
+ (id)schemeNameOverride;
+ (void)setSchemeNameOverride:(id)a3;
- (BOOL)_specifier:(id)a3 hasDetailController:(BOOL)a4;
- (BOOL)finishIndexing;
- (BOOL)hasDetailController;
- (BOOL)hasFinishedIndexing;
- (BOOL)hasListController;
- (BOOL)isRootEntry;
- (BOOL)isRootURL;
- (BOOL)isRootUrl;
- (BOOL)isSectionEntry;
- (NSMutableArray)keywords;
- (NSMutableSet)childEntries;
- (NSString)bundleName;
- (NSString)groupName;
- (NSString)identifier;
- (NSString)manifestBundleName;
- (NSString)name;
- (NSString)plistName;
- (NSString)sectionIdentifier;
- (NSURL)url;
- (PSSearchEntry)initWithSpecifier:(id)a3 parent:(id)a4;
- (PSSearchEntry)parentEntry;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)specifier;
- (PSSpecifierAction)action;
- (id)_prefsURLIsRoot:(BOOL *)a3;
- (id)ancestorEntries;
- (id)debugDescription;
- (id)description;
- (id)detailTextWithEffectiveTitle:(id *)a3;
- (id)hierarchyDescription;
- (id)recursiveDescription;
- (id)recursiveDescriptionForLevel:(unint64_t)a3;
- (id)rootEntry;
- (id)sectionEntry;
- (void)setAction:(id)a3;
- (void)setBundleName:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setManifestBundleName:(id)a3;
- (void)setParentEntry:(id)a3;
- (void)setPlistName:(id)a3;
@end

@implementation PSSearchEntry

+ (void)setSchemeNameOverride:(id)a3
{
  if ((id)_schemeNameOverride != a3)
  {
    _schemeNameOverride = [a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

+ (id)schemeNameOverride
{
  if (_schemeNameOverride) {
    return (id)_schemeNameOverride;
  }
  else {
    return @"prefs";
  }
}

- (PSSearchEntry)initWithSpecifier:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PSSearchEntry;
  v9 = [(PSSearchEntry *)&v36 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_specifier, a3);
    objc_storeWeak((id *)&v10->_parentEntry, v8);
    uint64_t v11 = objc_opt_new();
    childEntries = v10->_childEntries;
    v10->_childEntries = (NSMutableSet *)v11;

    v13 = [v7 propertyForKey:@"bundle"];
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v15 = [v8 bundleName];
    }
    bundleName = v10->_bundleName;
    v10->_bundleName = v15;

    v17 = [v7 propertyForKey:@"keywords"];
    v18 = (void *)[v17 mutableCopy];
    v19 = v18;
    if (v18) {
      v20 = v18;
    }
    else {
      v20 = (NSMutableArray *)objc_opt_new();
    }
    keywords = v10->_keywords;
    v10->_keywords = v20;

    uint64_t v22 = [v7 name];
    name = v10->_name;
    v10->_name = (NSString *)v22;

    uint64_t v24 = [v7 identifier];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v24;

    uint64_t v26 = [v7 propertyForKey:@"searchSectionID"];
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = (NSString *)v26;

    v28 = [(PSSpecifier *)v10->_specifier propertyForKey:@"isSection"];
    v10->_isSection = [v28 BOOLValue];

    v29 = (void *)MEMORY[0x1E4F1CB10];
    v30 = [v7 propertyForKey:@"searchURL"];
    uint64_t v31 = [v29 URLWithString:v30];
    url = v10->_url;
    v10->_url = (NSURL *)v31;

    if (v10->_url) {
      v10->_isRootURL = 1;
    }
    uint64_t v33 = [(PSSpecifier *)v10->_specifier propertyForKey:@"searchDetailPath"];
    additionalDetailTextComponents = v10->_additionalDetailTextComponents;
    v10->_additionalDetailTextComponents = (NSArray *)v33;

    v10->_hasDetailController = [(PSSearchEntry *)v10 _specifier:v7 hasDetailController:0];
    v10->_hasListController = [(PSSearchEntry *)v10 _specifier:v7 hasDetailController:1];
  }

  return v10;
}

- (BOOL)hasFinishedIndexing
{
  return self->_specifier == 0;
}

- (BOOL)finishIndexing
{
  BOOL v3 = [(PSSearchEntry *)self hasFinishedIndexing];
  if (!v3)
  {
    specifier = self->_specifier;
    self->_specifier = 0;

    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = 0;
  }
  return !v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isRootEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntry);
  BOOL v3 = WeakRetained == 0;

  return v3;
}

- (BOOL)isSectionEntry
{
  return [(PSSearchEntry *)self isRootEntry] || self->_isSection;
}

- (BOOL)_specifier:(id)a3 hasDetailController:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = [v6 properties];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"AppBundleID"];
      if (v9)
      {
        v10 = (void *)v9;
        BOOL v11 = [(PSSearchEntry *)self isSectionEntry];

        if (!v11)
        {
          LOBYTE(v7) = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      v12 = [v8 objectForKeyedSubscript:@"enabled"];
      v13 = v12;
      if (v12 && ![v12 BOOLValue]) {
        goto LABEL_11;
      }
      if (v4)
      {
        v14 = (void *)[v6 detailControllerClass];
        if (v14 == objc_opt_class() || ([v14 isSubclassOfClass:objc_opt_class()] & 1) != 0)
        {
LABEL_11:
          LOBYTE(v7) = 0;
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v15 = [v8 objectForKeyedSubscript:@"pane"];
        if (v15)
        {
          v16 = (void *)v15;
          int v7 = objc_msgSend((id)objc_msgSend(v6, "editPaneClass"), "isSubclassOfClass:", objc_opt_class());

          if (!v7) {
            goto LABEL_24;
          }
        }
      }
      v17 = [v8 objectForKeyedSubscript:@"cell"];
      if (v17) {
        uint64_t v18 = +[PSTableCell cellTypeFromString:v17];
      }
      else {
        uint64_t v18 = [v6 cellType];
      }
      if ((unint64_t)(v18 - 1) > 1)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        v19 = [v8 objectForKeyedSubscript:@"detail"];

        LOBYTE(v7) = 1;
        if (!v19 && !v4)
        {
          v20 = [v8 objectForKeyedSubscript:@"pane"];
          LOBYTE(v7) = v20 == 0;
        }
      }

      goto LABEL_24;
    }
  }
  LOBYTE(v7) = 0;
LABEL_26:

  return v7;
}

- (BOOL)hasDetailController
{
  return self->_hasDetailController;
}

- (BOOL)hasListController
{
  return self->_hasListController;
}

- (void)setAction:(id)a3
{
  v5 = (PSSpecifierAction *)a3;
  action = self->_action;
  p_action = &self->_action;
  if (action != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_action, a3);
    v5 = v8;
  }
}

- (id)sectionEntry
{
  v2 = self;
  if (v2)
  {
    do
    {
      if ([(PSSearchEntry *)v2 isSectionEntry]) {
        break;
      }
      uint64_t v3 = [(PSSearchEntry *)v2 parentEntry];

      v2 = (PSSearchEntry *)v3;
    }
    while (v3);
  }
  return v2;
}

- (id)rootEntry
{
  v2 = self;
  uint64_t v3 = [(PSSearchEntry *)v2 parentEntry];

  if (v3)
  {
    do
    {
      BOOL v4 = [(PSSearchEntry *)v2 parentEntry];

      v5 = [(PSSearchEntry *)v4 parentEntry];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    BOOL v4 = v2;
  }
  return v4;
}

- (id)ancestorEntries
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntry);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    do
    {
      [v3 insertObject:v5 atIndex:0];
      uint64_t v6 = [v5 parentEntry];

      v5 = (void *)v6;
    }
    while (v6);
  }
  return v3;
}

- (NSURL)url
{
  url = self->_url;
  if (!url)
  {
    BOOL v4 = [(PSSearchEntry *)self _prefsURLIsRoot:&self->_isRootURL];
    v5 = self->_url;
    self->_url = v4;

    url = self->_url;
  }
  return url;
}

- (BOOL)isRootUrl
{
  if (!self->_url)
  {
    uint64_t v3 = [(PSSearchEntry *)self _prefsURLIsRoot:&self->_isRootURL];
    url = self->_url;
    self->_url = v3;
  }
  return self->_isRootURL;
}

- (id)_prefsURLIsRoot:(BOOL *)a3
{
  [(PSSearchEntry *)self hasFinishedIndexing];
  v5 = [(PSSearchEntry *)self ancestorEntries];
  uint64_t v6 = [v5 arrayByAddingObject:self];

  int v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = +[PSSearchEntry schemeNameOverride];
  if ([v7 hasDetailController])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28E78];
    v10 = [v7 identifier];
    BOOL v11 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    v12 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v11];
    v13 = [v9 stringWithFormat:@"%@:root=%@", v8, v12];

    uint64_t v14 = [v6 count];
    uint64_t v15 = v14 - 1;
    if (v14 != 1)
    {
      v16 = objc_msgSend(v6, "subarrayWithRange:", 1, v15);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __33__PSSearchEntry__prefsURLIsRoot___block_invoke;
      v25[3] = &unk_1E5C5F0E8;
      uint64_t v27 = v15;
      id v26 = v13;
      [v16 enumerateObjectsUsingBlock:v25];
    }
    v17 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
  }
  else
  {
    if (a3) {
      *a3 = 1;
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = NSString;
    v20 = [v7 identifier];
    v21 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    uint64_t v22 = [v20 stringByAddingPercentEncodingWithAllowedCharacters:v21];
    v23 = [v19 stringWithFormat:@"%@:root=ROOT#%@", v8, v22];
    v17 = [v18 URLWithString:v23];
  }
  return v17;
}

void __33__PSSearchEntry__prefsURLIsRoot___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 identifier];
  int v7 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  id v11 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v7];

  int v8 = [v5 hasDetailController];
  if (a3 || (*(void *)(a1 + 40) > 1uLL ? (char v9 = 1) : (char v9 = v8), (v9 & 1) == 0))
  {
    if (*(void *)(a1 + 40) - (unint64_t)(v8 ^ 1u) <= a3) {
      v10 = @"#%@";
    }
    else {
      v10 = @"/%@";
    }
  }
  else
  {
    v10 = @"&path=%@";
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", v10, v11);
}

- (id)detailTextWithEffectiveTitle:(id *)a3
{
  uint64_t v5 = PSLocaleLanguageDirection();
  uint64_t v6 = @"→";
  if (v5 == 2) {
    uint64_t v6 = @"←";
  }
  int v7 = [NSString stringWithFormat:@" %@ ", v6];
  int v8 = [MEMORY[0x1E4F1CA48] array];
  char v9 = v8;
  if (v5 == 2) {
    [v8 addObject:@"\u200F"];
  }
  v10 = [(PSSearchEntry *)self ancestorEntries];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__PSSearchEntry_detailTextWithEffectiveTitle___block_invoke;
  v20[3] = &unk_1E5C5F110;
  id v11 = v9;
  id v21 = v11;
  [v10 enumerateObjectsWithOptions:0 usingBlock:v20];

  [v11 addObjectsFromArray:self->_additionalDetailTextComponents];
  v12 = [(PSSearchEntry *)self groupName];
  if ([v12 length])
  {
    v13 = PSSearchFormattedString(v12);
    objc_msgSend(v11, "insertObject:atIndex:", v13, objc_msgSend(v11, "count"));
  }
  uint64_t v14 = [(PSSearchEntry *)self name];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    if (a3)
    {
      *a3 = [(PSSearchEntry *)self name];
    }
  }
  else if ([v11 count])
  {
    uint64_t v16 = [v11 count];
    uint64_t v17 = v16 - 1;
    if (v16 != 0x8000000000000000)
    {
      if (a3)
      {
        *a3 = [v11 objectAtIndexedSubscript:v17];
      }
      [v11 removeObjectAtIndex:v17];
    }
  }
  uint64_t v18 = [v11 componentsJoinedByString:v7];

  return v18;
}

void __46__PSSearchEntry_detailTextWithEffectiveTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 name];
  if (![v4 length]) {
    goto LABEL_10;
  }
  if (![v3 isSectionEntry]) {
    goto LABEL_8;
  }
  uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
  if ((objc_msgSend(v5, "sf_isInternalInstall") & 1) == 0)
  {

LABEL_8:
LABEL_9:
    int v8 = *(void **)(a1 + 32);
    BOOL v4 = [v3 name];
    char v9 = PSSearchFormattedString(v4);
    [v8 addObject:v9];

LABEL_10:
    goto LABEL_11;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PSSearchShowSectionInDetailText", @"com.apple.Preferences", &keyExistsAndHasValidFormat);
  int v7 = keyExistsAndHasValidFormat;

  if (!v7 || AppBooleanValue) {
    goto LABEL_9;
  }
LABEL_11:
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)PSSearchEntry;
  id v3 = [(PSSearchEntry *)&v9 description];
  BOOL v4 = [(PSSearchEntry *)self hierarchyDescription];
  uint64_t v5 = [v3 stringByAppendingFormat:@" %@", v4];

  uint64_t v6 = [(PSSearchEntry *)self identifier];
  int v7 = [v5 stringByAppendingFormat:@"\nID: %@, bundle: %@, sectionEntry: %d, rootEntry: %d", v6, self->_bundleName, -[PSSearchEntry isSectionEntry](self, "isSectionEntry"), -[PSSearchEntry isRootEntry](self, "isRootEntry")];

  return v7;
}

- (id)recursiveDescription
{
  return [(PSSearchEntry *)self recursiveDescriptionForLevel:0];
}

- (id)recursiveDescriptionForLevel:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [v5 appendString:@"    "];
      --v6;
    }
    while (v6);
  }
  int v7 = (void *)MEMORY[0x1E4F28E78];
  int v8 = [(PSSearchEntry *)self name];
  objc_super v9 = [v7 stringWithFormat:@"%@%@", v5, v8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [(PSSearchEntry *)self childEntries];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    unint64_t v14 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) recursiveDescriptionForLevel:v14];
        [v9 appendFormat:@"\n%@", v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)debugDescription
{
  id v3 = [(PSSearchEntry *)self description];
  BOOL v4 = [(PSSpecifier *)self->_specifier debugDescription];
  uint64_t v5 = [v3 stringByAppendingFormat:@"\nspecifier: %@", v4];

  return v5;
}

- (id)hierarchyDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  BOOL v4 = [(PSSearchEntry *)self ancestorEntries];
  uint64_t v5 = [v4 arrayByAddingObject:self];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__PSSearchEntry_hierarchyDescription__block_invoke;
  v9[3] = &unk_1E5C5F110;
  id v10 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v9];
  int v7 = [NSString stringWithString:v6];

  return v7;
}

void __37__PSSearchEntry_hierarchyDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    BOOL v4 = @" > ";
  }
  else {
    BOOL v4 = &stru_1EFB51FD0;
  }
  id v5 = [a2 name];
  [v3 appendFormat:@"%@%@", v4, v5];
}

- (PSSearchEntry)parentEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntry);
  return (PSSearchEntry *)WeakRetained;
}

- (void)setParentEntry:(id)a3
{
}

- (NSMutableSet)childEntries
{
  return self->_childEntries;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (BOOL)isRootURL
{
  return self->_isRootURL;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)plistName
{
  return self->_plistName;
}

- (void)setPlistName:(id)a3
{
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (NSString)manifestBundleName
{
  return self->_manifestBundleName;
}

- (void)setManifestBundleName:(id)a3
{
}

- (NSMutableArray)keywords
{
  return self->_keywords;
}

- (PSSpecifierAction)action
{
  return self->_action;
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_manifestBundleName, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_plistName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_childEntries, 0);
  objc_destroyWeak((id *)&self->_parentEntry);
  objc_storeStrong((id *)&self->_additionalDetailTextComponents, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end