@interface ICMusicAccountNotificationsSettingsResponse
+ (id)createResponseBodyWithSwitches:(id)a3;
- (BOOL)wasSuccessful;
- (ICMusicAccountNotificationsSettingsResponse)initWithResponseDictionary:(id)a3;
- (NSArray)settingsSwitches;
@end

@implementation ICMusicAccountNotificationsSettingsResponse

- (void).cxx_destruct
{
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (NSArray)settingsSwitches
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(NSDictionary *)self->_responseDictionary objectForKey:@"sections"];
  if (!_NSIsNSArray() || ![v4 count]) {
    goto LABEL_18;
  }
  v5 = [v4 objectAtIndexedSubscript:0];
  int v6 = _NSIsNSDictionary();

  id v7 = 0;
  if (!v6) {
    goto LABEL_19;
  }
  v8 = [v4 objectAtIndexedSubscript:0];
  v9 = [v8 objectForKey:@"sectionId"];

  if (([v9 isEqualToString:@"com.apple.Music.main"] & 1) == 0)
  {

LABEL_18:
    id v7 = 0;
    goto LABEL_19;
  }
  v10 = [v4 objectAtIndexedSubscript:0];
  id v7 = [v10 objectForKey:@"settings"];

  if (v7 && _NSIsNSArray())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v7;
    uint64_t v11 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v16 = [ICMusicAccountNotificationsSettingsSwitch alloc];
            v17 = -[ICMusicAccountNotificationsSettingsSwitch initWithItemResponseDictionary:](v16, "initWithItemResponseDictionary:", v15, (void)v19);
            [v3 addObject:v17];
          }
        }
        uint64_t v12 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
LABEL_19:

  return (NSArray *)v3;
}

- (ICMusicAccountNotificationsSettingsResponse)initWithResponseDictionary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICMusicAccountNotificationsSettingsResponse;
  int v6 = [(ICMusicAccountNotificationsSettingsResponse *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_responseDictionary, a3);
    v7->_wasSuccessful = 0;
    v8 = [v5 objectForKey:@"status"];
    if (_NSIsNSString()) {
      v7->_wasSuccessful = [v8 isEqualToString:@"success"];
    }
  }
  return v7;
}

+ (id)createResponseBodyWithSwitches:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v11 = [v9 identifier];
        [v10 setObject:v11 forKeyedSubscript:ICMusicAccountNotificationsSettingsSwitchIdentifierKey];

        uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isToggled"));
        [v10 setObject:v12 forKeyedSubscript:ICMusicAccountNotificationsSettingsSwitchIsToggledKey];

        [v4 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v4, @"settings", 0);

  return v13;
}

@end