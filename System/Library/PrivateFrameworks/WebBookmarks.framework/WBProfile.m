@interface WBProfile
+ (NSArray)availableSymbolImageNames;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInserted;
- (BOOL)isSyncable;
- (BOOL)needsSecureDelete;
- (Class)_copyClassIsMutable:(BOOL)a3;
- (NSArray)tabGroups;
- (NSData)startPageSectionsDataRepresentation;
- (NSDictionary)modifiedSettingsFieldsByName;
- (NSString)customFavoritesFolderServerID;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)identifier;
- (NSString)identifierForExtensions;
- (NSString)privacyPreservingDescription;
- (NSString)serverID;
- (NSString)symbolImageName;
- (NSString)title;
- (WBProfile)initWithBookmark:(id)a3;
- (WBProfile)initWithBookmark:(id)a3 kind:(int64_t)a4;
- (WBProfile)initWithTitle:(id)a3 deviceIdentifier:(id)a4;
- (WBProfile)initWithTitle:(id)a3 symbolImageName:(id)a4 favoritesFolderServerID:(id)a5 deviceIdentifier:(id)a6;
- (WBSCRDTPosition)syncPosition;
- (WBSNamedColorOption)color;
- (WBSRecentsStore)recentsStore;
- (WebBookmark)bookmark;
- (id)_copyWithZone:(_NSZone *)a3 isMutable:(BOOL)a4;
- (id)_defaultSettingForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)differenceFromProfile:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)settingForKey:(id)a3;
- (int)databaseIdentifier;
- (int64_t)kind;
- (unint64_t)hash;
- (void)setBookmark:(id)a3;
- (void)setCustomFavoritesFolderServerID:(id)a3;
- (void)setRecentsStore:(id)a3;
@end

@implementation WBProfile

- (NSString)customFavoritesFolderServerID
{
  return [(WebBookmark *)self->_bookmark customFavoritesFolderServerID];
}

- (NSString)identifierForExtensions
{
  if (self->_kind)
  {
    id v2 = [(WebBookmark *)self->_bookmark serverID];
  }
  else
  {
    id v2 = (id)*MEMORY[0x263F66420];
  }
  return (NSString *)v2;
}

- (NSString)identifier
{
  if (self->_kind)
  {
    id v2 = [(WebBookmark *)self->_bookmark UUID];
  }
  else
  {
    id v2 = (id)*MEMORY[0x263F66420];
  }
  return (NSString *)v2;
}

- (WBProfile)initWithBookmark:(id)a3 kind:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBProfile;
  v8 = [(WBProfile *)&v12 init];
  if (v8 && [v7 isFolder] && objc_msgSend(v7, "subtype") == 2)
  {
    objc_storeStrong((id *)&v8->_bookmark, a3);
    v8->_kind = a4;
    if (!a4)
    {
      id titleProvider = v8->_titleProvider;
      v8->_id titleProvider = &__block_literal_global_11;
    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)symbolImageName
{
  id v2 = [(WebBookmark *)self->_bookmark symbolImageName];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [(id)objc_opt_class() availableSymbolImageNames];
    id v4 = [v5 firstObject];
  }
  v6 = [(id)objc_opt_class() availableSymbolImageNames];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    id v8 = v4;
  }
  else
  {
    v9 = [(id)objc_opt_class() availableSymbolImageNames];
    id v8 = [v9 firstObject];
  }
  return (NSString *)v8;
}

+ (NSArray)availableSymbolImageNames
{
  return (NSArray *)[MEMORY[0x263F66288] availableSymbolImageNames];
}

- (BOOL)isDefault
{
  return self->_kind == 0;
}

- (NSString)privacyPreservingDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WBProfile *)self databaseIdentifier];
  int64_t v7 = [(WBProfile *)self kind];
  id v8 = [(WBProfile *)self identifier];
  v9 = [(WBProfile *)self serverID];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; databaseIdentifier = %d; kind = %ld; identifier = %@; serverID = %@>",
    v5,
    self,
    v6,
    v7,
    v8,
  v10 = v9);

  return (NSString *)v10;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)serverID
{
  return [(WebBookmark *)self->_bookmark serverID];
}

- (int)databaseIdentifier
{
  if (self->_kind) {
    return [(WebBookmark *)self->_bookmark identifier];
  }
  else {
    return 0;
  }
}

- (NSString)title
{
  v3 = [(WebBookmark *)self->_bookmark title];
  if ([v3 length])
  {
    unint64_t v4 = [v3 length];
    if (v4 <= *MEMORY[0x263F66500])
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(v3, "substringToIndex:");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_7;
  }
  id titleProvider = (void (**)(void))self->_titleProvider;
  if (titleProvider)
  {
    titleProvider[2]();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    int64_t v7 = v5;
    goto LABEL_8;
  }
  int64_t v7 = &stru_26CC2ED50;
LABEL_8:

  return (NSString *)v7;
}

uint64_t __35__WBProfile_initWithBookmark_kind___block_invoke()
{
  return _WBSLocalizedString();
}

- (NSArray)tabGroups
{
  return self->_tabGroups;
}

- (WBProfile)initWithTitle:(id)a3 symbolImageName:(id)a4 favoritesFolderServerID:(id)a5 deviceIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[WebBookmark alloc] initFolderWithParentID:0 subtype:2 deviceIdentifier:v10 collectionType:1];

  [v14 setTitle:v13];
  [v14 setSymbolImageName:v12];

  [v14 setCustomFavoritesFolderServerID:v11];
  v15 = [(WBProfile *)self initWithBookmark:v14];

  return v15;
}

- (WBProfile)initWithTitle:(id)a3 deviceIdentifier:(id)a4
{
  return [(WBProfile *)self initWithTitle:a3 symbolImageName:0 favoritesFolderServerID:0 deviceIdentifier:a4];
}

- (WBProfile)initWithBookmark:(id)a3
{
  id v4 = a3;
  v5 = [v4 UUID];
  uint64_t v6 = [v5 isEqualToString:*MEMORY[0x263F66420]] ^ 1;

  int64_t v7 = [(WBProfile *)self initWithBookmark:v4 kind:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBProfile *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WBProfile *)v4 identifier];
      uint64_t v6 = [(WBProfile *)self identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(WBProfile *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)differenceFromProfile:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = (id *)a3;
  if (v4 && WBSIsEqual())
  {
    v5 = [(WBProfile *)self title];
    uint64_t v6 = [v4 title];
    int v7 = WBSIsEqual();

    uint64_t v8 = v7 ^ 1u;
    v9 = [(WBProfile *)self symbolImageName];
    id v10 = [v4 symbolImageName];
    int v11 = WBSIsEqual();

    if (!v11) {
      v8 |= 2uLL;
    }
    id v12 = [(WBProfile *)self customFavoritesFolderServerID];
    id v13 = [v4 customFavoritesFolderServerID];
    int v14 = WBSIsEqual();

    if (!v14) {
      v8 |= 4uLL;
    }
    v15 = [(WBProfile *)self color];
    v16 = [v4 color];
    int v17 = WBSIsEqual();

    if (!v17) {
      v8 |= 8uLL;
    }
    v18 = [(WBProfile *)self startPageSectionsDataRepresentation];
    v19 = [v4 startPageSectionsDataRepresentation];
    int v20 = WBSIsEqual();

    if (!v20) {
      v8 |= 0x10uLL;
    }
    v21 = [(WBProfile *)self syncPosition];
    v22 = [v4 syncPosition];
    int v23 = WBSIsEqual();

    if (!v23) {
      v8 |= 0x20uLL;
    }
    v24 = [MEMORY[0x263EFF9C0] set];
    settingsDictionary = self->_settingsDictionary;
    if (settingsDictionary
      && ([(NSMutableDictionary *)settingsDictionary isEqualToDictionary:v4[3]] & 1) == 0)
    {
      uint64_t v42 = v8 | 0x40;
      v43 = v4;
      id v26 = v4[3];
      v27 = (void *)MEMORY[0x263EFFA08];
      v28 = [(NSMutableDictionary *)self->_settingsDictionary allKeys];
      v29 = [v27 setWithArray:v28];
      v30 = [v26 allKeys];
      v31 = [v29 setByAddingObjectsFromArray:v30];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v45 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v44 + 1) + 8 * i);
            v38 = -[NSMutableDictionary objectForKeyedSubscript:](self->_settingsDictionary, "objectForKeyedSubscript:", v37, v42, v43, (void)v44);
            v39 = [v26 objectForKeyedSubscript:v37];
            if ((WBSIsEqual() & 1) == 0) {
              [v24 addObject:v37];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v34);
      }

      uint64_t v8 = v42;
      id v4 = v43;
    }
    v40 = [[WBProfileDifference alloc] initWithResult:v8 settingsKeys:v24];
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (NSString)deviceIdentifier
{
  return [(WebBookmark *)self->_bookmark deviceIdentifier];
}

- (BOOL)needsSecureDelete
{
  return 0;
}

- (void)setCustomFavoritesFolderServerID:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WebBookmark *)self->_bookmark setCustomFavoritesFolderServerID:v4];
}

- (WBSCRDTPosition)syncPosition
{
  id v2 = [(WBProfile *)self bookmark];
  unint64_t v3 = [v2 syncPosition];

  return (WBSCRDTPosition *)v3;
}

- (BOOL)isSyncable
{
  return [(WebBookmark *)self->_bookmark isSyncable];
}

- (BOOL)isInserted
{
  return [(WebBookmark *)self->_bookmark isInserted];
}

- (NSData)startPageSectionsDataRepresentation
{
  return [(WebBookmark *)self->_bookmark startPageSectionsDataRepresentation];
}

- (id)settingForKey:(id)a3
{
  id v4 = a3;
  v5 = [(WBProfile *)self bookmark];
  [v5 lockFields];

  uint64_t v6 = [(NSMutableDictionary *)self->_settingsDictionary objectForKeyedSubscript:v4];
  int v7 = [v6 value];

  uint64_t v8 = [(WBProfile *)self bookmark];
  [v8 unlockFields];

  if (!v7)
  {
    int v7 = [(WBProfile *)self _defaultSettingForKey:v4];
  }

  return v7;
}

- (id)_defaultSettingForKey:(id)a3
{
  uint64_t v3 = _defaultSettingForKey__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_defaultSettingForKey__onceToken, &__block_literal_global_15);
  }
  v5 = [(id)_defaultSettingForKey__defaultSettingValues objectForKeyedSubscript:v4];

  return v5;
}

void __35__WBProfile__defaultSettingForKey___block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F667B8];
  v3[0] = MEMORY[0x263EFFA88];
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)_defaultSettingForKey__defaultSettingValues;
  _defaultSettingForKey__defaultSettingValues = v0;
}

- (NSDictionary)modifiedSettingsFieldsByName
{
  return (NSDictionary *)[(NSMutableDictionary *)self->_settingsDictionary safari_mapAndFilterKeysAndObjectsUsingBlock:&__block_literal_global_19];
}

id __41__WBProfile_modifiedSettingsFieldsByName__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"modified"];
  if ([v4 BOOLValue]) {
    v5 = v3;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (WBSNamedColorOption)color
{
  uint64_t v2 = (void *)MEMORY[0x263F662D0];
  id v3 = [(WBProfile *)self settingForKey:*MEMORY[0x263F664F8]];
  id v4 = [v2 colorWithData:v3];

  return (WBSNamedColorOption *)v4;
}

- (Class)_copyClassIsMutable:(BOOL)a3
{
  id v3 = objc_opt_class();
  return (Class)v3;
}

- (id)_copyWithZone:(_NSZone *)a3 isMutable:(BOOL)a4
{
  int v7 = [(WBProfile *)self _copyClassIsMutable:a4];
  if (a4 || ![(WBProfile *)self isMemberOfClass:v7])
  {
    v9 = (void *)[(WebBookmark *)self->_bookmark copy];
    uint64_t v8 = [[(objc_class *)v7 allocWithZone:a3] initWithBookmark:v9 kind:self->_kind];
    uint64_t v10 = [(NSMutableDictionary *)self->_settingsDictionary safari_mutableDeepCopy];
    settingsDictionary = v8->_settingsDictionary;
    v8->_settingsDictionary = (NSMutableDictionary *)v10;
  }
  else
  {
    uint64_t v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(WBProfile *)self _copyWithZone:a3 isMutable:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [(WBProfile *)self _copyWithZone:a3 isMutable:1];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WBProfile *)self databaseIdentifier];
  int v7 = [(WBProfile *)self title];
  uint64_t v8 = [(WBProfile *)self symbolImageName];
  int64_t v9 = [(WBProfile *)self kind];
  uint64_t v10 = [(WBProfile *)self identifier];
  int v11 = [(WBProfile *)self serverID];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; databaseIdentifier = %d; title = %@; symbolImage = %@; kind = %ld; identifier = %@; serverID = %@>",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
  id v12 = v11);

  return (NSString *)v12;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (WBSRecentsStore)recentsStore
{
  return self->_recentsStore;
}

- (void)setRecentsStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsStore, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_settingsDictionary, 0);
  objc_storeStrong(&self->_titleProvider, 0);
  objc_storeStrong((id *)&self->_tabGroups, 0);
}

@end