@interface _SFBrowserWindowStateData
- (BOOL)isActiveDocumentValid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInDatabase;
- (BOOL)isTabStateSuccessfullyLoaded;
- (BOOL)needsQuickUpdate;
- (NSString)UUIDString;
- (NSString)activeProfileIdentifier;
- (NSString)sceneID;
- (NSUUID)UUID;
- (_SFBrowserWindowStateData)initWithDictionaryRepresentation:(id)a3;
- (_SFBrowserWindowStateData)initWithSQLiteRow:(id)a3;
- (_SFBrowserWindowStateData)initWithUUIDString:(id)a3 sceneID:(id)a4;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (int64_t)activeDocumentIndex;
- (int64_t)activePrivateDocumentIndex;
- (int64_t)databaseID;
- (int64_t)legacyPlistFileVersion;
- (int64_t)type;
- (void)setActiveDocumentIndex:(int64_t)a3;
- (void)setActivePrivateDocumentIndex:(int64_t)a3;
- (void)setActiveProfileIdentifier:(id)a3;
- (void)setDatabaseID:(int64_t)a3;
- (void)setIsActiveDocumentValid:(BOOL)a3;
- (void)setIsTabStateSuccessfullyLoaded:(BOOL)a3;
- (void)setLegacyPlistFileVersion:(int64_t)a3;
- (void)setNeedsQuickUpdate:(BOOL)a3;
- (void)setSceneID:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUUIDString:(id)a3;
@end

@implementation _SFBrowserWindowStateData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);

  objc_storeStrong((id *)&self->_UUIDString, 0);
}

- (_SFBrowserWindowStateData)initWithUUIDString:(id)a3 sceneID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFBrowserWindowStateData;
  v9 = [(_SFBrowserWindowStateData *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_UUIDString, a3);
    uint64_t v11 = [v8 copy];
    sceneID = v10->_sceneID;
    v10->_sceneID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_activeProfileIdentifier, (id)*MEMORY[0x1E4F980C8]);
    v13 = v10;
  }

  return v10;
}

- (_SFBrowserWindowStateData)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFBrowserWindowStateData;
  v5 = [(_SFBrowserWindowStateData *)&v21 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "safari_numberForKey:", @"SafariStateBrowserWindowDatabaseID");
    id v7 = v6;
    if (v6) {
      uint64_t v8 = [v6 integerValue];
    }
    else {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v5->_databaseID = v8;
    uint64_t v9 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateBrowserWindowUUID");
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v4, "safari_numberForKey:", @"SafariStateActiveDocumentIndex");
    v5->_activeDocumentIndex = [v11 integerValue];

    v12 = objc_msgSend(v4, "safari_numberForKey:", @"SafariStatePrivateActiveDocumentIndex");
    v5->_activePrivateDocumentIndex = [v12 integerValue];

    v13 = objc_msgSend(v4, "safari_numberForKey:", @"SafariStateFileVersion");
    v5->_legacyPlistFileVersion = [v13 integerValue];

    uint64_t v14 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateBrowserSceneIDKey");
    sceneID = v5->_sceneID;
    v5->_sceneID = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateBrowserWindowActiveProfileUUID");
    v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = (void *)*MEMORY[0x1E4F980C8];
    }
    objc_storeStrong((id *)&v5->_activeProfileIdentifier, v18);

    v19 = v5;
  }

  return v5;
}

- (_SFBrowserWindowStateData)initWithSQLiteRow:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFBrowserWindowStateData;
  v5 = [(_SFBrowserWindowStateData *)&v15 init];
  if (v5)
  {
    v5->_databaseID = (int)[v4 intAtIndex:0];
    uint64_t v6 = [v4 stringAtIndex:1];
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v6;

    uint64_t v8 = [v4 stringAtIndex:8];
    sceneID = v5->_sceneID;
    v5->_sceneID = (NSString *)v8;

    v5->_type = (int)[v4 intAtIndex:2];
    v5->_activeDocumentIndex = (int)[v4 intAtIndex:3];
    v5->_activePrivateDocumentIndex = (int)[v4 intAtIndex:4];
    v5->_isActiveDocumentValid = [v4 BOOLAtIndex:5];
    v5->_isTabStateSuccessfullyLoaded = [v4 BOOLAtIndex:6];
    v5->_legacyPlistFileVersion = (int)[v4 intAtIndex:7];
    uint64_t v10 = [v4 stringAtIndex:9];
    uint64_t v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = (void *)*MEMORY[0x1E4F980C8];
    }
    objc_storeStrong((id *)&v5->_activeProfileIdentifier, v12);

    v13 = v5;
  }

  return v5;
}

- (id)debugDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@:%p; UUID = %@; sceneID = %@>",
               objc_opt_class(),
               self,
               self->_UUIDString,
               self->_sceneID);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SFBrowserWindowStateData *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_databaseID == v5->_databaseID
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && self->_type == v5->_type
        && self->_activeDocumentIndex == v5->_activeDocumentIndex
        && self->_activePrivateDocumentIndex == v5->_activePrivateDocumentIndex
        && self->_isActiveDocumentValid == v5->_isActiveDocumentValid
        && self->_isTabStateSuccessfullyLoaded == v5->_isTabStateSuccessfullyLoaded
        && self->_legacyPlistFileVersion == v5->_legacyPlistFileVersion
        && self->_needsQuickUpdate == v5->_needsQuickUpdate;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSUUID)UUID
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_UUIDString];

  return (NSUUID *)v2;
}

- (void)setUUID:(id)a3
{
  id v6 = a3;
  id v4 = [v6 UUIDString];
  UUIDString = self->_UUIDString;
  self->_UUIDString = v4;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_UUIDString forKeyedSubscript:@"SafariStateBrowserWindowUUID"];
  id v4 = [NSNumber numberWithInteger:self->_activeDocumentIndex];
  [v3 setObject:v4 forKeyedSubscript:@"SafariStateActiveDocumentIndex"];

  v5 = [NSNumber numberWithInteger:self->_activePrivateDocumentIndex];
  [v3 setObject:v5 forKeyedSubscript:@"SafariStatePrivateActiveDocumentIndex"];

  id v6 = [NSNumber numberWithInteger:self->_legacyPlistFileVersion];
  [v3 setObject:v6 forKeyedSubscript:@"SafariStateFileVersion"];

  [v3 setObject:self->_sceneID forKeyedSubscript:@"SafariStateBrowserSceneIDKey"];
  [v3 setObject:self->_activeProfileIdentifier forKeyedSubscript:@"SafariStateBrowserWindowActiveProfileUUID"];
  id v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)isInDatabase
{
  return self->_databaseID != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)activeDocumentIndex
{
  return self->_activeDocumentIndex;
}

- (void)setActiveDocumentIndex:(int64_t)a3
{
  self->_activeDocumentIndex = a3;
}

- (int64_t)activePrivateDocumentIndex
{
  return self->_activePrivateDocumentIndex;
}

- (void)setActivePrivateDocumentIndex:(int64_t)a3
{
  self->_activePrivateDocumentIndex = a3;
}

- (BOOL)isActiveDocumentValid
{
  return self->_isActiveDocumentValid;
}

- (void)setIsActiveDocumentValid:(BOOL)a3
{
  self->_isActiveDocumentValid = a3;
}

- (BOOL)isTabStateSuccessfullyLoaded
{
  return self->_isTabStateSuccessfullyLoaded;
}

- (void)setIsTabStateSuccessfullyLoaded:(BOOL)a3
{
  self->_isTabStateSuccessfullyLoaded = a3;
}

- (int64_t)legacyPlistFileVersion
{
  return self->_legacyPlistFileVersion;
}

- (void)setLegacyPlistFileVersion:(int64_t)a3
{
  self->_legacyPlistFileVersion = a3;
}

- (BOOL)needsQuickUpdate
{
  return self->_needsQuickUpdate;
}

- (void)setNeedsQuickUpdate:(BOOL)a3
{
  self->_needsQuickUpdate = a3;
}

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

- (void)setActiveProfileIdentifier:(id)a3
{
}

@end