@interface SSCommandConfiguration
+ (id)commandButtonItemForAddressLocation:(id)a3;
+ (id)commandButtonItemForBirthday:(id)a3;
+ (id)commandButtonItemForEmail:(id)a3;
+ (id)commandButtonItemForPhoneNumber:(id)a3 contact:(id)a4;
+ (id)dialRequestURLWithPhoneNumber:(id)a3 contact:(id)a4;
+ (id)punchoutCommandWithScheme:(id)a3 host:(id)a4 path:(id)a5 queryItems:(id)a6;
+ (id)valueWithPrimaryCommand:(id)a3 copyString:(id)a4 copyTitle:(id)a5 previewCommandConfigurations:(id)a6;
+ (id)valueWithPrimaryCommand:(id)a3 copyString:(id)a4 copyTitle:(id)a5 previewCommandTitle:(id)a6;
- (NSString)symbol;
- (NSString)title;
- (SFCommand)command;
- (SSCommandConfiguration)initWithTitle:(id)a3 symbol:(id)a4 command:(id)a5;
- (id)createSFCommandButtonItem;
- (void)setCommand:(id)a3;
- (void)setSymbol:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SSCommandConfiguration

- (SSCommandConfiguration)initWithTitle:(id)a3 symbol:(id)a4 command:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SSCommandConfiguration;
  v11 = [(SSCommandConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(SSCommandConfiguration *)v11 setTitle:v8];
    [(SSCommandConfiguration *)v12 setCommand:v10];
    [(SSCommandConfiguration *)v12 setSymbol:v9];
  }

  return v12;
}

- (id)createSFCommandButtonItem
{
  v3 = objc_opt_new();
  v4 = [(SSCommandConfiguration *)self command];
  [v3 setCommand:v4];

  v5 = [(SSCommandConfiguration *)self title];
  [v3 setTitle:v5];

  v6 = objc_opt_new();
  v7 = [(SSCommandConfiguration *)self symbol];
  [v6 setSymbolName:v7];

  [v6 setIsTemplate:1];
  [v3 setImage:v6];

  return v3;
}

+ (id)valueWithPrimaryCommand:(id)a3 copyString:(id)a4 copyTitle:(id)a5 previewCommandConfigurations:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = objc_opt_new();
  v25 = v9;
  [v12 setCopyableString:v9];
  v13 = objc_opt_new();
  [v13 setCopyableItem:v12];
  objc_super v14 = objc_opt_new();
  [v14 setCommand:v13];
  if (v10) {
    [v14 setTitle:v10];
  }
  v15 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [*(id *)(*((void *)&v27 + 1) + 8 * i) createSFCommandButtonItem];
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }

  v22 = [v26 createSFCommandButtonItem];
  [v22 setImage:0];
  if (isMacOS())
  {
    [v22 setCommand:0];
  }
  else
  {
    v23 = [v22 command];
    [v22 setCommand:v23];
  }
  [v15 addObject:v14];
  [v22 setPreviewButtonItems:v15];

  return v22;
}

+ (id)valueWithPrimaryCommand:(id)a3 copyString:(id)a4 copyTitle:(id)a5 previewCommandTitle:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [SSCommandConfiguration alloc];
  objc_super v14 = [v12 title];
  v15 = [v12 symbol];
  id v16 = [v12 command];
  uint64_t v17 = [(SSCommandConfiguration *)v13 initWithTitle:v14 symbol:v15 command:v16];

  [(SSCommandConfiguration *)v17 setTitle:v9];
  uint64_t v18 = objc_opt_class();
  v22[0] = v17;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v20 = [v18 valueWithPrimaryCommand:v12 copyString:v11 copyTitle:v10 previewCommandConfigurations:v19];

  return v20;
}

+ (id)punchoutCommandWithScheme:(id)a3 host:(id)a4 path:(id)a5 queryItems:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setScheme:v12];

  [v13 setHost:v11];
  [v13 setPath:v10];

  [v13 setQueryItems:v9];
  objc_super v14 = [v13 URL];
  if (v14)
  {
    v15 = objc_opt_new();
    id v16 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v14];
    [v15 setPunchout:v16];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)dialRequestURLWithPhoneNumber:(id)a3 contact:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FADAB0]);
  id v8 = [v7 telephonyProvider];
  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithProvider:v8];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4FADBD8]) initWithType:2 value:v5];
    [v9 setHandle:v10];

    if ([v6 hasBeenPersisted])
    {
      id v11 = [v6 identifier];
      [v9 setContactIdentifier:v11];
    }
    [v9 setVideo:0];
    [v9 setTtyType:0];
    id v12 = [v9 URL];
  }
  else
  {
    NSLog(&cfstr_Sscontactresul.isa, v7, 0);
    id v12 = 0;
  }

  return v12;
}

+ (id)commandButtonItemForPhoneNumber:(id)a3 contact:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = [(id)objc_opt_class() dialRequestURLWithPhoneNumber:v5 contact:v6];

  if (v8)
  {
    v34[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    [v7 setUrls:v9];

    id v10 = objc_opt_new();
    [v10 setPunchout:v7];
    uint64_t v32 = v7;
    v31 = [[SSCommandConfiguration alloc] initWithTitle:v5 symbol:@"phone" command:v10];
    id v11 = [SSCommandConfiguration alloc];
    id v12 = NSString;
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v14 = [v13 localizedStringForKey:@"MENU_COMMAND_CALL_PHONE_NUMBER" value:&stru_1F1824018 table:@"SpotlightServices"];
    v15 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v5);
    id v16 = [(SSCommandConfiguration *)v11 initWithTitle:v15 symbol:@"phone" command:v10];

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = [v5 stringByRemovingWhitespace];
    uint64_t v19 = [v17 punchoutCommandWithScheme:@"im" host:0 path:v18 queryItems:0];

    v20 = [SSCommandConfiguration alloc];
    v21 = NSString;
    v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"MENU_COMMAND_MESSAGE_PHONE_NUMBER" value:&stru_1F1824018 table:@"SpotlightServices"];
    v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v5);
    v25 = [(SSCommandConfiguration *)v20 initWithTitle:v24 symbol:@"message" command:v19];

    uint64_t v26 = objc_opt_class();
    v33[0] = v16;
    v33[1] = v25;
    long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    long long v28 = (void *)v26;
    id v7 = v32;
    long long v29 = [v28 valueWithPrimaryCommand:v31 copyString:v5 copyTitle:0 previewCommandConfigurations:v27];
  }
  else
  {
    id v10 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SSCommandConfiguration commandButtonItemForPhoneNumber:contact:]((uint64_t)v5, v10);
    }
    long long v29 = 0;
  }

  return v29;
}

+ (id)commandButtonItemForEmail:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() punchoutCommandWithScheme:@"mailto" host:0 path:v3 queryItems:0];
  id v5 = (void *)[(id)objc_opt_new() initWithTitle:v3 symbol:@"envelope" command:v4];
  id v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"MENU_COMMAND_SEND_EMAIL" value:&stru_1F1824018 table:@"SpotlightServices"];
  id v9 = [v6 valueWithPrimaryCommand:v5 copyString:v3 copyTitle:0 previewCommandTitle:v8];

  return v9;
}

+ (id)commandButtonItemForAddressLocation:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"q" value:v3];
  v14[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v7 = [v4 punchoutCommandWithScheme:@"maps" host:0 path:0 queryItems:v6];

  id v8 = (void *)[(id)objc_opt_new() initWithTitle:v3 symbol:@"location" command:v7];
  id v9 = objc_opt_class();
  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"MENU_COMMAND_OPEN_ADDRESS_IN_MAPS" value:&stru_1F1824018 table:@"SpotlightServices"];
  id v12 = [v9 valueWithPrimaryCommand:v8 copyString:v3 copyTitle:0 previewCommandTitle:v11];

  return v12;
}

+ (id)commandButtonItemForBirthday:(id)a3
{
  id v3 = a3;
  v4 = +[SSDateFormatManager stringFromBirthdayComponents:v3];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = +[SSDateFormatManager nextUpcomingDateForDateComponents:v3 fromDate:v5];

  id v7 = (void *)MEMORY[0x1E4F28ED0];
  [v6 timeIntervalSinceReferenceDate];
  id v9 = [v7 numberWithInteger:(uint64_t)v8];
  id v10 = objc_opt_class();
  id v11 = [v9 stringValue];
  id v12 = [v10 punchoutCommandWithScheme:@"calshow" host:0 path:v11 queryItems:0];

  v13 = (void *)[(id)objc_opt_new() initWithTitle:v4 symbol:@"calendar" command:v12];
  objc_super v14 = objc_opt_class();
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v16 = [v15 localizedStringForKey:@"MENU_COMMAND_SHOW_IN_CALENDAR" value:&stru_1F1824018 table:@"SpotlightServices"];
  uint64_t v17 = [v14 valueWithPrimaryCommand:v13 copyString:v4 copyTitle:0 previewCommandTitle:v16];

  return v17;
}

- (SFCommand)command
{
  return (SFCommand *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCommand:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)symbol
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSymbol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

+ (void)commandButtonItemForPhoneNumber:(uint64_t)a1 contact:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "Failed to generate dialRequestURL for phoneNumber: %@", (uint8_t *)&v2, 0xCu);
}

@end