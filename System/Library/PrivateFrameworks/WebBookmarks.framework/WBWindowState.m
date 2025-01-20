@interface WBWindowState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWindowState:(id)a3;
- (BOOL)isFavoritesBarHidden;
- (BOOL)isMinimized;
- (BOOL)isPopupWindow;
- (BOOL)isPrivateWindow;
- (BOOL)isTabBarHidden;
- (BOOL)newlyCreated;
- (BOOL)prefersSidebarVisible;
- (NSDate)dateClosed;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)extraAttributes;
- (NSDictionary)profilesToActiveTabGroups;
- (NSDictionary)tabGroupsToActiveTabs;
- (NSSet)unnamedTabGroupUUIDs;
- (NSString)activeProfileIdentifier;
- (NSString)activeTabGroupUUID;
- (NSString)customUnifiedFieldText;
- (NSString)description;
- (NSString)sceneID;
- (NSString)uuid;
- (WBMutableTabGroup)localTabGroup;
- (WBMutableTabGroup)privateTabGroup;
- (WBWindowState)initWithCoder:(id)a3;
- (WBWindowState)initWithDictionaryRepresentation:(id)a3;
- (WBWindowState)initWithDictionaryRepresentation:(id)a3 localTabGroup:(id)a4 privateTabGroup:(id)a5;
- (WBWindowState)initWithUUID:(id)a3;
- (WBWindowState)initWithUUID:(id)a3 activeTabGroupUUID:(id)a4 localTabGroup:(id)a5 privateTabGroup:(id)a6 sceneID:(id)a7 windowID:(int)a8;
- (WBWindowState)initWithUUID:(id)a3 sceneID:(id)a4;
- (id)activeTabGroupUUIDForProfileWithIdentifier:(id)a3;
- (id)activeTabUUIDForTabGroupWithUUID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localOrUnnamedTabGroupForRestoration:(BOOL)a3 inProfileWithIdentifier:(id)a4 deviceIdentifier:(id)a5;
- (int)identifier;
- (unint64_t)hash;
- (void)addUnnamedTabGroupUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeActiveTabGroupUUIDForProfileWithIdentifier:(id)a3;
- (void)removeActiveTabUUIDForTabGroupWithUUID:(id)a3;
- (void)removeAllActiveTabUUIDs;
- (void)removeUnnamedTabGroupUUID:(id)a3;
- (void)setActiveProfileIdentifier:(id)a3;
- (void)setActiveTabGroupUUID:(id)a3;
- (void)setActiveTabGroupUUID:(id)a3 forProfileWithIdentifier:(id)a4;
- (void)setActiveTabUUID:(id)a3 forTabGroupWithUUID:(id)a4;
- (void)setDateClosed:(id)a3;
- (void)setExtraAttributes:(id)a3;
- (void)setIdentifier:(int)a3;
- (void)setNewlyCreated:(BOOL)a3;
- (void)setPrefersSidebarVisible:(BOOL)a3;
- (void)setSceneID:(id)a3;
- (void)setTabGroupsToActiveTabs:(id)a3;
@end

@implementation WBWindowState

- (NSString)sceneID
{
  return self->_sceneID;
}

- (WBMutableTabGroup)localTabGroup
{
  return self->_localTabGroup;
}

- (WBMutableTabGroup)privateTabGroup
{
  return self->_privateTabGroup;
}

- (void)setSceneID:(id)a3
{
}

- (void)setNewlyCreated:(BOOL)a3
{
  self->_newlyCreated = a3;
}

- (void)setActiveTabGroupUUID:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setExtraAttributes:(id)a3
{
}

- (void)setActiveProfileIdentifier:(id)a3
{
}

- (WBWindowState)initWithUUID:(id)a3 activeTabGroupUUID:(id)a4 localTabGroup:(id)a5 privateTabGroup:(id)a6 sceneID:(id)a7 windowID:(int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v35.receiver = self;
  v35.super_class = (Class)WBWindowState;
  v19 = [(WBWindowState *)&v35 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    activeTabGroupUUID = v19->_activeTabGroupUUID;
    v19->_activeTabGroupUUID = (NSString *)v20;

    extraAttributes = v19->_extraAttributes;
    v19->_extraAttributes = (NSDictionary *)MEMORY[0x263EFFA78];

    v19->_identifier = a8;
    objc_storeStrong((id *)&v19->_localTabGroup, a5);
    objc_storeStrong((id *)&v19->_privateTabGroup, a6);
    uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
    profilesToActiveTabGroups = v19->_profilesToActiveTabGroups;
    v19->_profilesToActiveTabGroups = (NSMutableDictionary *)v23;

    uint64_t v25 = [v18 copy];
    sceneID = v19->_sceneID;
    v19->_sceneID = (NSString *)v25;

    uint64_t v27 = [MEMORY[0x263EFF9A0] dictionary];
    tabGroupsToActiveTabs = v19->_tabGroupsToActiveTabs;
    v19->_tabGroupsToActiveTabs = (NSMutableDictionary *)v27;

    uint64_t v29 = [MEMORY[0x263EFF9C0] set];
    unnamedTabGroupUUIDs = v19->_unnamedTabGroupUUIDs;
    v19->_unnamedTabGroupUUIDs = (NSMutableSet *)v29;

    uint64_t v31 = [v14 copy];
    uuid = v19->_uuid;
    v19->_uuid = (NSString *)v31;

    v33 = v19;
  }

  return v19;
}

- (NSString)activeTabGroupUUID
{
  return self->_activeTabGroupUUID;
}

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

- (NSSet)unnamedTabGroupUUIDs
{
  v2 = (void *)[(NSMutableSet *)self->_unnamedTabGroupUUIDs copy];
  return (NSSet *)v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBWindowState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WBWindowState *)v4 uuid];
      v6 = [(WBWindowState *)self uuid];
      char v7 = WBSIsEqual();
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (WBWindowState)initWithUUID:(id)a3
{
  return [(WBWindowState *)self initWithUUID:a3 sceneID:0];
}

- (WBWindowState)initWithUUID:(id)a3 sceneID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[WBMutableTabGroup localTabGroup];
  v9 = +[WBMutableTabGroup privateTabGroup];
  v10 = [v8 uuid];
  v11 = [(WBWindowState *)self initWithUUID:v7 activeTabGroupUUID:v10 localTabGroup:v8 privateTabGroup:v9 sceneID:v6 windowID:0];

  return v11;
}

- (WBWindowState)initWithDictionaryRepresentation:(id)a3 localTabGroup:(id)a4 privateTabGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(v8, "safari_stringForKey:", *MEMORY[0x263F668B8]);
  v12 = objc_msgSend(v8, "safari_stringForKey:", *MEMORY[0x263F668C8]);
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = +[WBMutableTabGroup localTabGroup];
    if (v10) {
      goto LABEL_3;
    }
  }
  id v10 = +[WBMutableTabGroup privateTabGroup];
LABEL_3:
  v13 = [(WBWindowState *)self initWithUUID:v11 activeTabGroupUUID:v12 localTabGroup:v9 privateTabGroup:v10 sceneID:0 windowID:0];
  if (v13)
  {
    uint64_t v14 = [v8 copy];
    extraAttributes = v13->_extraAttributes;
    v13->_extraAttributes = (NSDictionary *)v14;

    id v16 = objc_msgSend(v8, "safari_dictionaryForKey:", *MEMORY[0x263F66910]);
    id v17 = (void *)[v16 mutableCopy];
    id v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      v19 = [MEMORY[0x263EFF9A0] dictionary];
    }
    tabGroupsToActiveTabs = v13->_tabGroupsToActiveTabs;
    v13->_tabGroupsToActiveTabs = v19;

    uint64_t v21 = objc_msgSend(v8, "safari_stringForKey:returningNilIfEmpty:", *MEMORY[0x263F668C0], 1);
    v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = *MEMORY[0x263F66420];
    }
    [(WBWindowState *)v13 setActiveProfileIdentifier:v23];

    v24 = v13;
  }

  return v13;
}

- (BOOL)isEqualToWindowState:(id)a3
{
  id v4 = a3;
  if (![(WBWindowState *)self isEqual:v4]) {
    goto LABEL_10;
  }
  v5 = [(WBWindowState *)self localTabGroup];
  id v6 = [v4 localTabGroup];
  int v7 = WBSIsEqual();

  if (!v7) {
    goto LABEL_10;
  }
  id v8 = [(WBWindowState *)self privateTabGroup];
  id v9 = [v4 privateTabGroup];
  int v10 = WBSIsEqual();

  if (!v10) {
    goto LABEL_10;
  }
  v11 = [(WBWindowState *)self dateClosed];
  v12 = [v4 dateClosed];
  int v13 = WBSIsEqual();

  if (!v13) {
    goto LABEL_10;
  }
  uint64_t v14 = [(WBWindowState *)self extraAttributes];
  id v15 = [v4 extraAttributes];
  int v16 = WBSIsEqual();

  if (!v16) {
    goto LABEL_10;
  }
  id v17 = [(WBWindowState *)self tabGroupsToActiveTabs];
  id v18 = [v4 tabGroupsToActiveTabs];
  int v19 = WBSIsEqual();

  if (!v19) {
    goto LABEL_10;
  }
  uint64_t v20 = [(WBWindowState *)self activeProfileIdentifier];
  uint64_t v21 = [v4 activeProfileIdentifier];
  int v22 = WBSIsEqual();

  if (!v22) {
    goto LABEL_10;
  }
  uint64_t v23 = [(WBWindowState *)self profilesToActiveTabGroups];
  v24 = [v4 profilesToActiveTabGroups];
  int v25 = WBSIsEqual();

  if (v25)
  {
    v26 = [(WBWindowState *)self unnamedTabGroupUUIDs];
    uint64_t v27 = [v4 unnamedTabGroupUUIDs];
    char v28 = WBSIsEqual();
  }
  else
  {
LABEL_10:
    char v28 = 0;
  }

  return v28;
}

- (unint64_t)hash
{
  v2 = [(WBWindowState *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[WBTabGroup mutableCopyWithZone:](self->_localTabGroup, "mutableCopyWithZone:");
  id v6 = [(WBTabGroup *)self->_privateTabGroup mutableCopyWithZone:a3];
  int v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:", self->_uuid, self->_activeTabGroupUUID, v5, v6, self->_sceneID, self->_identifier);
  [v7 setDateClosed:self->_dateClosed];
  id v8 = (void *)[(NSDictionary *)self->_extraAttributes copy];
  [v7 setExtraAttributes:v8];

  id v9 = (void *)[(NSMutableDictionary *)self->_tabGroupsToActiveTabs copy];
  [v7 setTabGroupsToActiveTabs:v9];

  int v10 = (void *)[(NSString *)self->_activeProfileIdentifier copy];
  [v7 setActiveProfileIdentifier:v10];

  uint64_t v11 = [(NSMutableDictionary *)self->_profilesToActiveTabGroups mutableCopy];
  v12 = (void *)v7[2];
  v7[2] = v11;

  uint64_t v13 = [(NSMutableSet *)self->_unnamedTabGroupUUIDs mutableCopy];
  uint64_t v14 = (void *)v7[3];
  v7[3] = v13;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBWindowState)initWithCoder:(id)a3
{
  v38[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v34 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F668C8]];
  v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"dateClosed"];
  id v4 = (void *)MEMORY[0x263EFFA08];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  v38[3] = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
  id v6 = [v4 setWithArray:v5];
  uint64_t v31 = [v3 decodeObjectOfClasses:v6 forKey:@"extraAttributes"];

  unsigned int v30 = [v3 decodeIntForKey:@"identifier"];
  int v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"localTabGroup"];
  id v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"privateTabGroup"];
  uint64_t v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sceneID"];
  id v9 = (void *)MEMORY[0x263EFFA08];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
  uint64_t v11 = [v9 setWithArray:v10];
  char v28 = [v3 decodeObjectOfClasses:v11 forKey:*MEMORY[0x263F66910]];

  int v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F668B8]];
  uint64_t v27 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F668C0]];
  v12 = (void *)MEMORY[0x263EFFA08];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  uint64_t v14 = [v12 setWithArray:v13];
  v26 = [v3 decodeObjectOfClasses:v14 forKey:*MEMORY[0x263F66900]];

  id v15 = (void *)MEMORY[0x263EFFA08];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  int v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  id v17 = [v15 setWithArray:v16];
  id v18 = [v3 decodeObjectOfClasses:v17 forKey:*MEMORY[0x263F66918]];

  int v19 = [(WBWindowState *)self initWithUUID:v25 activeTabGroupUUID:v34 localTabGroup:v7 privateTabGroup:v8 sceneID:v29 windowID:v30];
  [(WBWindowState *)v19 setDateClosed:v32];
  [(WBWindowState *)v19 setExtraAttributes:v31];
  [(WBWindowState *)v19 setTabGroupsToActiveTabs:v28];
  [(WBWindowState *)v19 setActiveProfileIdentifier:v27];
  uint64_t v20 = [v26 mutableCopy];
  profilesToActiveTabGroups = v19->_profilesToActiveTabGroups;
  v19->_profilesToActiveTabGroups = (NSMutableDictionary *)v20;

  uint64_t v22 = [v18 mutableCopy];
  unnamedTabGroupUUIDs = v19->_unnamedTabGroupUUIDs;
  v19->_unnamedTabGroupUUIDs = (NSMutableSet *)v22;

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  activeTabGroupUUID = self->_activeTabGroupUUID;
  uint64_t v5 = *MEMORY[0x263F668C8];
  id v7 = a3;
  [v7 encodeObject:activeTabGroupUUID forKey:v5];
  [v7 encodeObject:self->_dateClosed forKey:@"dateClosed"];
  [v7 encodeObject:self->_extraAttributes forKey:@"extraAttributes"];
  [v7 encodeInt:self->_identifier forKey:@"identifier"];
  [v7 encodeObject:self->_localTabGroup forKey:@"localTabGroup"];
  [v7 encodeObject:self->_privateTabGroup forKey:@"privateTabGroup"];
  [v7 encodeObject:self->_sceneID forKey:@"sceneID"];
  uint64_t v6 = *MEMORY[0x263F66910];
  [v7 encodeObject:self->_tabGroupsToActiveTabs forKey:*MEMORY[0x263F66910]];
  [v7 encodeObject:self->_uuid forKey:*MEMORY[0x263F668B8]];
  [v7 encodeObject:self->_activeProfileIdentifier forKey:*MEMORY[0x263F668C0]];
  [v7 encodeObject:self->_profilesToActiveTabGroups forKey:v6];
  [v7 encodeObject:self->_unnamedTabGroupUUIDs forKey:*MEMORY[0x263F66918]];
}

- (WBWindowState)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x263F668B8]);
  if ([v5 length])
  {
    uint64_t v6 = objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x263F668C8]);
    id v7 = [WBMutableTabGroup alloc];
    id v8 = objc_msgSend(v4, "safari_dictionaryForKey:", @"localTabGroup");
    id v9 = [(WBTabGroup *)v7 initWithDictionaryRepresentation:v8];

    int v10 = [WBMutableTabGroup alloc];
    uint64_t v11 = objc_msgSend(v4, "safari_dictionaryForKey:", @"privateTabGroup");
    v12 = [(WBTabGroup *)v10 initWithDictionaryRepresentation:v11];

    uint64_t v13 = 0;
    if (v9 && v12)
    {
      if (![v6 length])
      {
        uint64_t v14 = [(WBTabGroup *)v9 uuid];

        uint64_t v6 = (void *)v14;
      }
      id v15 = objc_msgSend(v4, "safari_stringForKey:", @"sceneID");
      if (![v15 length])
      {

        id v15 = 0;
      }
      int v16 = objc_msgSend(v4, "safari_numberForKey:", @"identifier");
      uint64_t v17 = [v16 intValue];

      self = [(WBWindowState *)self initWithUUID:v5 activeTabGroupUUID:v6 localTabGroup:v9 privateTabGroup:v12 sceneID:v15 windowID:v17];
      if (self)
      {
        objc_msgSend(v4, "safari_dictionaryForKey:", @"extraAttributes");
        id v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        extraAttributes = self->_extraAttributes;
        self->_extraAttributes = v18;

        uint64_t v20 = objc_msgSend(v4, "safari_dictionaryForKey:", *MEMORY[0x263F66910]);
        uint64_t v21 = (void *)[v20 mutableCopy];
        uint64_t v22 = v21;
        if (v21)
        {
          uint64_t v23 = v21;
        }
        else
        {
          uint64_t v23 = [MEMORY[0x263EFF9C0] set];
        }
        tabGroupsToActiveTabs = self->_tabGroupsToActiveTabs;
        self->_tabGroupsToActiveTabs = v23;

        int v25 = objc_msgSend(v4, "safari_dateForKey:", @"dateClosed");
        [v25 timeIntervalSinceNow];
        v43 = v25;
        if (v26 >= 0.0) {
          uint64_t v27 = 0;
        }
        else {
          uint64_t v27 = v25;
        }
        objc_storeStrong((id *)&self->_dateClosed, v27);
        objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x263F668C0]);
        char v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        activeProfileIdentifier = self->_activeProfileIdentifier;
        self->_activeProfileIdentifier = v28;

        unsigned int v30 = objc_msgSend(v4, "safari_dictionaryForKey:", *MEMORY[0x263F66900]);
        uint64_t v31 = (void *)[v30 mutableCopy];
        v32 = v31;
        if (v31)
        {
          v33 = v31;
          profilesToActiveTabGroups = self->_profilesToActiveTabGroups;
          self->_profilesToActiveTabGroups = v33;
          unint64_t v35 = 0x263EFF000;
        }
        else
        {
          unint64_t v35 = 0x263EFF000uLL;
          v36 = [MEMORY[0x263EFF9C0] set];
          profilesToActiveTabGroups = self->_profilesToActiveTabGroups;
          self->_profilesToActiveTabGroups = v36;
        }

        v37 = *(void **)(v35 + 2496);
        v38 = objc_msgSend(v4, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), *MEMORY[0x263F66918]);
        v39 = [v37 setWithArray:v38];
        unnamedTabGroupUUIDs = self->_unnamedTabGroupUUIDs;
        self->_unnamedTabGroupUUIDs = v39;

        v41 = self;
      }

      uint64_t v13 = self;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (NSDictionary)dictionaryRepresentation
{
  v24[12] = *MEMORY[0x263EF8340];
  uuid = self->_uuid;
  uint64_t v4 = *MEMORY[0x263F668C8];
  v23[0] = *MEMORY[0x263F668B8];
  v23[1] = v4;
  activeTabGroupUUID = self->_activeTabGroupUUID;
  v24[0] = uuid;
  v24[1] = activeTabGroupUUID;
  v23[2] = @"localTabGroup";
  uint64_t v6 = [(WBTabGroup *)self->_localTabGroup dictionaryRepresentation];
  v24[2] = v6;
  v23[3] = @"privateTabGroup";
  uint64_t v7 = [(WBTabGroup *)self->_privateTabGroup dictionaryRepresentation];
  id v8 = (void *)v7;
  sceneID = &stru_26CC2ED50;
  if (self->_sceneID) {
    sceneID = (__CFString *)self->_sceneID;
  }
  v24[3] = v7;
  v24[4] = sceneID;
  v23[4] = @"sceneID";
  v23[5] = @"identifier";
  int v10 = [NSNumber numberWithInt:self->_identifier];
  dateClosed = self->_dateClosed;
  extraAttributes = self->_extraAttributes;
  v24[5] = v10;
  v24[6] = extraAttributes;
  v23[6] = @"extraAttributes";
  v23[7] = @"dateClosed";
  uint64_t v13 = dateClosed;
  if (!dateClosed)
  {
    uint64_t v13 = [MEMORY[0x263EFF910] distantFuture];
  }
  uint64_t v14 = *MEMORY[0x263F66910];
  tabGroupsToActiveTabs = self->_tabGroupsToActiveTabs;
  profilesToActiveTabGroups = self->_profilesToActiveTabGroups;
  v24[7] = v13;
  v24[8] = tabGroupsToActiveTabs;
  uint64_t v17 = *MEMORY[0x263F668C0];
  v23[8] = v14;
  v23[9] = v17;
  uint64_t v18 = *MEMORY[0x263F66900];
  v24[9] = self->_activeProfileIdentifier;
  v24[10] = profilesToActiveTabGroups;
  uint64_t v19 = *MEMORY[0x263F66918];
  v23[10] = v18;
  v23[11] = v19;
  uint64_t v20 = [(NSMutableSet *)self->_unnamedTabGroupUUIDs allObjects];
  v24[11] = v20;
  uint64_t v21 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:12];

  if (!dateClosed) {
  return (NSDictionary *)v21;
  }
}

- (NSDictionary)tabGroupsToActiveTabs
{
  v2 = (void *)[(NSMutableDictionary *)self->_tabGroupsToActiveTabs copy];
  return (NSDictionary *)v2;
}

- (void)setActiveTabUUID:(id)a3 forTabGroupWithUUID:(id)a4
{
}

- (NSDictionary)profilesToActiveTabGroups
{
  v2 = (void *)[(NSMutableDictionary *)self->_profilesToActiveTabGroups copy];
  return (NSDictionary *)v2;
}

- (id)localOrUnnamedTabGroupForRestoration:(BOOL)a3 inProfileWithIdentifier:(id)a4 deviceIdentifier:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (WBSIsEqual())
  {
    localTabGroup = self->_localTabGroup;
LABEL_6:
    uint64_t v14 = localTabGroup;
    goto LABEL_11;
  }
  unnamedTabGroupForRestoration = self->_unnamedTabGroupForRestoration;
  if (unnamedTabGroupForRestoration)
  {
    v12 = [(WBTabGroup *)unnamedTabGroupForRestoration profileIdentifier];
    int v13 = WBSIsEqual();

    if (v13)
    {
      localTabGroup = self->_unnamedTabGroupForRestoration;
      goto LABEL_6;
    }
  }
  if (!v6
    || ([(NSMutableSet *)self->_unnamedTabGroupUUIDs anyObject],
        (id v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v16 = [MEMORY[0x263F08C38] UUID];
    id v15 = [v16 UUIDString];

    [(NSMutableSet *)self->_unnamedTabGroupUUIDs addObject:v15];
  }
  uint64_t v17 = +[WBMutableTabGroup unnamedTabGroupWithUUID:v15 profileIdentifier:v8 deviceIdentifier:v9];
  uint64_t v18 = self->_unnamedTabGroupForRestoration;
  self->_unnamedTabGroupForRestoration = v17;

  uint64_t v14 = self->_unnamedTabGroupForRestoration;
LABEL_11:

  return v14;
}

- (NSString)customUnifiedFieldText
{
  return (NSString *)[(NSDictionary *)self->_extraAttributes safari_stringForKey:*MEMORY[0x263F668D0]];
}

- (BOOL)isFavoritesBarHidden
{
  return [(NSDictionary *)self->_extraAttributes safari_BOOLForKey:*MEMORY[0x263F668D8]];
}

- (BOOL)isMinimized
{
  return [(NSDictionary *)self->_extraAttributes safari_BOOLForKey:*MEMORY[0x263F668F0]];
}

- (BOOL)isPopupWindow
{
  return [(NSDictionary *)self->_extraAttributes safari_BOOLForKey:*MEMORY[0x263F668E0]];
}

- (BOOL)prefersSidebarVisible
{
  return [(NSDictionary *)self->_extraAttributes safari_BOOLForKey:*MEMORY[0x263F668F8]];
}

- (void)setPrefersSidebarVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = (id)[(NSDictionary *)self->_extraAttributes mutableCopy];
  uint64_t v5 = [NSNumber numberWithBool:v3];
  [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x263F668F8]];

  BOOL v6 = (NSDictionary *)[v8 copy];
  extraAttributes = self->_extraAttributes;
  self->_extraAttributes = v6;
}

- (BOOL)isPrivateWindow
{
  return [(NSDictionary *)self->_extraAttributes safari_BOOLForKey:*MEMORY[0x263F668E8]];
}

- (BOOL)isTabBarHidden
{
  return [(NSDictionary *)self->_extraAttributes safari_BOOLForKey:*MEMORY[0x263F66908]];
}

- (id)activeTabUUIDForTabGroupWithUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_tabGroupsToActiveTabs objectForKeyedSubscript:a3];
}

- (void)removeActiveTabUUIDForTabGroupWithUUID:(id)a3
{
}

- (void)removeAllActiveTabUUIDs
{
}

- (void)addUnnamedTabGroupUUID:(id)a3
{
}

- (void)removeUnnamedTabGroupUUID:(id)a3
{
}

- (id)activeTabGroupUUIDForProfileWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_profilesToActiveTabGroups objectForKeyedSubscript:a3];
}

- (void)removeActiveTabGroupUUIDForProfileWithIdentifier:(id)a3
{
}

- (void)setActiveTabGroupUUID:(id)a3 forProfileWithIdentifier:(id)a4
{
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [(WBWindowState *)self activeTabGroupUUID];
  uint64_t v7 = [(WBWindowState *)self identifier];
  id v8 = [(WBWindowState *)self sceneID];
  id v9 = [(WBWindowState *)self uuid];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; activeTabGroupUUID = %@; identifier = %d; sceneID = %@; uuid = %@>",
    v5,
    self,
    v6,
    v7,
    v8,
  int v10 = v9);

  return (NSString *)v10;
}

- (NSDate)dateClosed
{
  return self->_dateClosed;
}

- (void)setDateClosed:(id)a3
{
}

- (NSDictionary)extraAttributes
{
  return self->_extraAttributes;
}

- (void)setTabGroupsToActiveTabs:(id)a3
{
}

- (BOOL)newlyCreated
{
  return self->_newlyCreated;
}

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_privateTabGroup, 0);
  objc_storeStrong((id *)&self->_localTabGroup, 0);
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_dateClosed, 0);
  objc_storeStrong((id *)&self->_activeTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_unnamedTabGroupForRestoration, 0);
  objc_storeStrong((id *)&self->_unnamedTabGroupUUIDs, 0);
  objc_storeStrong((id *)&self->_profilesToActiveTabGroups, 0);
  objc_storeStrong((id *)&self->_tabGroupsToActiveTabs, 0);
}

@end