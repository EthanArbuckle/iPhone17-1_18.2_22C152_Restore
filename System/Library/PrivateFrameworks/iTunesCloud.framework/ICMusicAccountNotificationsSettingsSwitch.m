@interface ICMusicAccountNotificationsSettingsSwitch
- (BOOL)hasBeenPreviouslyToggled;
- (BOOL)isToggled;
- (ICMusicAccountNotificationsSettingsSwitch)initWithItemResponseDictionary:(id)a3;
- (ICMusicAccountNotificationsSettingsSwitch)initWithToggleState:(BOOL)a3 hasBeenToggled:(BOOL)a4 identifier:(id)a5;
- (NSDictionary)itemResponseDictionary;
- (NSString)identifier;
- (void)setHasBeenPreviouslyToggled:(BOOL)a3;
- (void)setIsToggled:(BOOL)a3;
@end

@implementation ICMusicAccountNotificationsSettingsSwitch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDictionary, 0);

  objc_storeStrong((id *)&self->_itemResponseDictionary, 0);
}

- (NSDictionary)itemResponseDictionary
{
  return self->_itemResponseDictionary;
}

- (void)setHasBeenPreviouslyToggled:(BOOL)a3
{
  if (self->_valueDictionary)
  {
    id v4 = [NSNumber numberWithBool:a3];
    [(NSMutableDictionary *)self->_valueDictionary setObject:v4 forKeyedSubscript:@"dataUpdated"];
  }
}

- (BOOL)hasBeenPreviouslyToggled
{
  valueDictionary = self->_valueDictionary;
  if (!valueDictionary) {
    return 0;
  }
  v3 = [(NSMutableDictionary *)valueDictionary objectForKey:@"dataUpdated"];
  if (_NSIsNSNumber()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setIsToggled:(BOOL)a3
{
  if (self->_valueDictionary)
  {
    id v4 = [NSNumber numberWithBool:a3];
    [(NSMutableDictionary *)self->_valueDictionary setObject:v4 forKeyedSubscript:ICMusicAccountNotificationsSettingsSwitchIsToggledKey];
  }
}

- (BOOL)isToggled
{
  valueDictionary = self->_valueDictionary;
  if (!valueDictionary) {
    return 0;
  }
  v3 = [(NSMutableDictionary *)valueDictionary objectForKey:ICMusicAccountNotificationsSettingsSwitchIsToggledKey];
  if (_NSIsNSNumber()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSString)identifier
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:ICMusicAccountNotificationsSettingsSwitchIdentifierKey];
  v3 = v2;
  if (v2)
  {
    if (_NSIsNSString()) {
      v2 = v3;
    }
    else {
      v2 = 0;
    }
  }
  char v4 = v2;

  return v4;
}

- (ICMusicAccountNotificationsSettingsSwitch)initWithToggleState:(BOOL)a3 hasBeenToggled:(BOOL)a4 identifier:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ICMusicAccountNotificationsSettingsSwitch;
  v9 = [(ICMusicAccountNotificationsSettingsSwitch *)&v20 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = MEMORY[0x1E4F1CC08];
    v12 = (NSMutableDictionary *)[v10 initWithDictionary:MEMORY[0x1E4F1CC08]];
    v13 = [NSNumber numberWithBool:v6];
    [(NSMutableDictionary *)v12 setObject:v13 forKeyedSubscript:ICMusicAccountNotificationsSettingsSwitchIsToggledKey];

    v14 = [NSNumber numberWithBool:v5];
    [(NSMutableDictionary *)v12 setObject:v14 forKeyedSubscript:@"dataUpdated"];

    v15 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v11];
    [(NSDictionary *)v15 setObject:v8 forKeyedSubscript:ICMusicAccountNotificationsSettingsSwitchIdentifierKey];
    [(NSDictionary *)v15 setObject:v12 forKeyedSubscript:@"value"];
    itemResponseDictionary = v9->_itemResponseDictionary;
    v9->_itemResponseDictionary = v15;
    v17 = v15;

    valueDictionary = v9->_valueDictionary;
    v9->_valueDictionary = v12;
  }
  return v9;
}

- (ICMusicAccountNotificationsSettingsSwitch)initWithItemResponseDictionary:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICMusicAccountNotificationsSettingsSwitch;
  BOOL v6 = [(ICMusicAccountNotificationsSettingsSwitch *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemResponseDictionary, a3);
    id v8 = [(NSDictionary *)v7->_itemResponseDictionary objectForKey:@"value"];
    if (_NSIsNSDictionary())
    {
      uint64_t v9 = [v8 mutableCopy];
      valueDictionary = v7->_valueDictionary;
      v7->_valueDictionary = (NSMutableDictionary *)v9;
    }
  }

  return v7;
}

@end