@interface WBMutableProfile
+ (id)createDefaultProfileWithTabGroups:(id)a3;
- (NSArray)devices;
- (NSDictionary)settingsDictionary;
- (WBMutableProfile)initWithBookmark:(id)a3 kind:(int64_t)a4 tabGroups:(id)a5;
- (WBMutableProfile)initWithBookmark:(id)a3 tabGroups:(id)a4;
- (WBSCRDTPosition)syncPosition;
- (void)markBackgroundImageAsModified;
- (void)mergeWithProfile:(id)a3;
- (void)resumeIncrementingFields:(id)a3;
- (void)setColor:(id)a3;
- (void)setDatabaseIdentifier:(int)a3;
- (void)setDevices:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSetting:(id)a3 forKey:(id)a4;
- (void)setSettingsDictionary:(id)a3;
- (void)setStartPageSectionsDataRepresentation:(id)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setSyncPosition:(id)a3;
- (void)setSyncable:(BOOL)a3;
- (void)setTabGroups:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WBMutableProfile

- (void)setSettingsDictionary:(id)a3
{
  v4 = (NSMutableDictionary *)[a3 mutableCopy];
  settingsDictionary = self->super._settingsDictionary;
  self->super._settingsDictionary = v4;
  MEMORY[0x270F9A758](v4, settingsDictionary);
}

- (WBMutableProfile)initWithBookmark:(id)a3 tabGroups:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 UUID];
  uint64_t v9 = [v8 isEqualToString:*MEMORY[0x263F66420]] ^ 1;

  v10 = [(WBMutableProfile *)self initWithBookmark:v7 kind:v9 tabGroups:v6];
  return v10;
}

- (WBMutableProfile)initWithBookmark:(id)a3 kind:(int64_t)a4 tabGroups:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = [(WBProfile *)self initWithBookmark:a3 kind:a4];
  if (v9)
  {
    uint64_t v10 = [v8 mutableCopy];
    tabGroups = v9->super._tabGroups;
    v9->super._tabGroups = (NSArray *)v10;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = v9->super._tabGroups;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
          v18 = [(WBProfile *)v9 identifier];
          [v17 setProfileIdentifier:v18];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    v19 = v9;
  }

  return v9;
}

- (NSArray)devices
{
  return self->_devices;
}

+ (id)createDefaultProfileWithTabGroups:(id)a3
{
  id v3 = a3;
  v4 = [WebBookmark alloc];
  v5 = NSString;
  id v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v5 stringWithFormat:@"~DefaultProfileDeviceIdentifier-%@", v7];
  id v9 = [(WebBookmark *)v4 initFolderWithParentID:0 subtype:2 deviceIdentifier:v8 collectionType:1];

  uint64_t v10 = *MEMORY[0x263F66420];
  [v9 _setUUID:*MEMORY[0x263F66420]];
  [v9 _setServerID:v10];
  v11 = [[WBMutableProfile alloc] initWithBookmark:v9 kind:0 tabGroups:v3];

  [(WBMutableProfile *)v11 setSyncable:1];
  v12 = [MEMORY[0x263F66288] defaultPersonalProfileSymbolImage];
  [(WBMutableProfile *)v11 setSymbolImageName:v12];

  uint64_t v13 = [MEMORY[0x263F66288] defaultPersonalProfileColor];
  [(WBMutableProfile *)v11 setColor:v13];

  return v11;
}

- (WBSCRDTPosition)syncPosition
{
  v2 = [(WBProfile *)self bookmark];
  id v3 = [v2 syncPosition];

  return (WBSCRDTPosition *)v3;
}

- (void)setSyncPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(WBProfile *)self bookmark];
  [v5 setSyncPosition:v4];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WBProfile *)self bookmark];
  [v5 setTitle:v4];
}

- (void)setDatabaseIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(WBProfile *)self bookmark];
  [v4 _setID:v3];
}

- (void)setSymbolImageName:(id)a3
{
  id v4 = a3;
  id v5 = [(WBProfile *)self bookmark];
  [v5 setSymbolImageName:v4];
}

- (void)setSyncable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WBProfile *)self bookmark];
  [v4 _setSyncable:v3];
}

- (void)setIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WBProfile *)self bookmark];
  [v5 _setUUID:v4];
}

- (void)setTabGroups:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  tabGroups = self->super._tabGroups;
  self->super._tabGroups = v4;
  MEMORY[0x270F9A758](v4, tabGroups);
}

- (void)markBackgroundImageAsModified
{
  BOOL v3 = NSNumber;
  id v7 = [(WBProfile *)self bookmark];
  id v4 = [v7 backgroundImageModifiedState];
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "BOOLValue") ^ 1);
  id v6 = [(WBProfile *)self bookmark];
  [v6 setBackgroundImageModifiedState:v5];
}

- (void)setStartPageSectionsDataRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(WBProfile *)self bookmark];
  [v5 setStartPageSectionsDataRepresentation:v4];
}

- (NSDictionary)settingsDictionary
{
  return (NSDictionary *)self->super._settingsDictionary;
}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBProfile *)self bookmark];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__WBMutableProfile_setSetting_forKey___block_invoke;
  v11[3] = &unk_2643DA608;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 performWithFieldsWriteLock:v11];
}

void __38__WBMutableProfile_setSetting_forKey___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  id v18 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = [v18 value];
  char v7 = [v6 isEqual:*(void *)(a1 + 48)];

  if ((v7 & 1) == 0)
  {
    id v8 = v18;
    if (!v18)
    {
      id v9 = objc_alloc(MEMORY[0x263F66608]);
      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = objc_alloc(MEMORY[0x263F66610]);
      id v12 = [*(id *)(a1 + 32) bookmark];
      id v13 = [v12 deviceIdentifier];
      uint64_t v14 = (void *)[v11 initWithDeviceIdentifier:v13 generation:1];
      uint64_t v15 = [*(id *)(a1 + 32) bookmark];
      uint64_t v16 = [v15 deviceIdentifier];
      id v19 = (id)[v9 initWithValue:v10 generation:v14 deviceIdentifier:v16];

      [*(id *)(*(void *)(a1 + 32) + 24) setObject:v19 forKeyedSubscript:*(void *)(a1 + 40)];
      id v8 = v19;
    }
    id v18 = v8;
    [v8 setValue:*(void *)(a1 + 48)];
    [v18 incrementGenerationIfNeeded];
    [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"modified"];
    v17 = [*(id *)(a1 + 32) bookmark];
    [v17 markAttributesAsModified:0x100000];
  }
}

- (void)resumeIncrementingFields:(id)a3
{
}

uint64_t __45__WBMutableProfile_resumeIncrementingFields___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldIncrementGeneration:1];
}

- (void)setColor:(id)a3
{
  id v4 = [a3 dataRepresentation];
  [(WBMutableProfile *)self setSetting:v4 forKey:*MEMORY[0x263F664F8]];
}

- (void)mergeWithProfile:(id)a3
{
  id v7 = a3;
  if ([v7 isSyncable])
  {
    id v4 = [(WBProfile *)self bookmark];
    id v5 = [v7 bookmark];
    [v4 mergeWithBookmark:v5];

    id v6 = [v7 recentsStore];
    [(WBProfile *)self setRecentsStore:v6];
  }
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end