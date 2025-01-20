@interface _UIPrototypingSettingsManager
+ (id)sharedManager;
- (NSArray)allSettings;
- (NSMutableDictionary)storedSettings;
- (_UIPrototypingSettingsManager)init;
- (id)settingOfType:(int64_t)a3 withName:(id)a4;
- (void)deleteAllStoredSettings;
- (void)setStoredSettings:(id)a3;
- (void)synchronizeStoredSettings;
@end

@implementation _UIPrototypingSettingsManager

+ (id)sharedManager
{
  if (qword_1EB264A08 != -1) {
    dispatch_once(&qword_1EB264A08, &__block_literal_global_594);
  }
  v2 = (void *)_MergedGlobals_1282;
  return v2;
}

- (_UIPrototypingSettingsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPrototypingSettingsManager;
  v2 = [(_UIPrototypingSettingsManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storedSettings = v2->_storedSettings;
    v2->_storedSettings = (NSMutableDictionary *)v3;

    [(_UIPrototypingSettingsManager *)v2 synchronizeStoredSettings];
  }
  return v2;
}

- (id)settingOfType:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  v7 = [(_UIPrototypingSettingsManager *)self storedSettings];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    v8 = objc_alloc_init(_UIPrototypingValue);
    [(_UIPrototypingValue *)v8 setType:a3];
    [(_UIPrototypingValue *)v8 setName:v6];
    v9 = [(_UIPrototypingSettingsManager *)self storedSettings];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  return v8;
}

- (NSArray)allSettings
{
  v2 = [(_UIPrototypingSettingsManager *)self storedSettings];
  uint64_t v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (void)synchronizeStoredSettings
{
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = [v3 valueForKey:@"_UIKitStoredPrototypingValues"];

  if (v4)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58___UIPrototypingSettingsManager_synchronizeStoredSettings__block_invoke;
    v14[3] = &unk_1E52ED238;
    v14[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v14];
  }
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(_UIPrototypingSettingsManager *)self storedSettings];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __58___UIPrototypingSettingsManager_synchronizeStoredSettings__block_invoke_2;
  v12 = &unk_1E530CC70;
  id v13 = v5;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:&v9];

  v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", v9, v10, v11, v12);
  [v8 setObject:v7 forKey:@"_UIKitStoredPrototypingValues"];
}

- (void)deleteAllStoredSettings
{
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObjectForKey:@"_UIKitStoredPrototypingValues"];

  id v4 = [(_UIPrototypingSettingsManager *)self storedSettings];
  [v4 removeAllObjects];
}

- (NSMutableDictionary)storedSettings
{
  return self->_storedSettings;
}

- (void)setStoredSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end