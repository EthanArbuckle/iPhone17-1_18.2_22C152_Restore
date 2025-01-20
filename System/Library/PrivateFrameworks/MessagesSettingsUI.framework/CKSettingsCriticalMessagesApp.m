@interface CKSettingsCriticalMessagesApp
- (CKSettingsCriticalMessagesApp)initWithBundleID:(id)a3 recipients:(id)a4;
- (NSArray)recipients;
- (NSString)activeNumberCountLocalizedString;
- (NSString)bundleID;
- (NSString)displayName;
- (int64_t)_activeNumberCount;
@end

@implementation CKSettingsCriticalMessagesApp

- (CKSettingsCriticalMessagesApp)initWithBundleID:(id)a3 recipients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKSettingsCriticalMessagesApp;
  v8 = [(CKSettingsCriticalMessagesApp *)&v21 init];
  if (!v8)
  {
LABEL_8:
    v17 = v8;
    goto LABEL_9;
  }
  id v20 = 0;
  v9 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v20];
  id v10 = v20;
  v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v9 bundleIdentifier];
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v12;

    v14 = [v9 localizedName];
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      v16 = [v9 localizedShortName];
    }
    displayName = v8->_displayName;
    v8->_displayName = v16;

    objc_storeStrong((id *)&v8->_recipients, a4);
    goto LABEL_8;
  }

  v17 = 0;
LABEL_9:

  return v17;
}

- (int64_t)_activeNumberCount
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_recipients;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isActive", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSString)activeNumberCountLocalizedString
{
  int64_t v2 = [(CKSettingsCriticalMessagesApp *)self _activeNumberCount];
  uint64_t v3 = NSString;
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int64_t v5 = [v4 localizedStringForKey:@"CRITICAL_MESSAGES_PHONE_NUMBER_COUNT" value:&stru_2704C4418 table:@"CriticalMessagesSettings"];
  uint64_t v6 = objc_msgSend(v3, "stringWithFormat:", v5, v2);

  return (NSString *)v6;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end