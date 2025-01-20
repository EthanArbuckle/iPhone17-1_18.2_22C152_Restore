@interface UNSNotificationContactService
+ (id)sharedInstance;
- (BOOL)canAddToCuratedContacts:(id)a3 bundleIdentifier:(id)a4;
- (UNSNotificationContactService)initWithResolver:(id)a3;
- (id)_matchForContact:(id)a3 bundleIdentifier:(id)a4;
- (id)curatedContactForContact:(id)a3 bundleIdentifier:(id)a4 keysToFetch:(id)a5;
- (id)curatedContactMatchDetailsForContact:(id)a3 bundleIdentifier:(id)a4;
- (id)newCuratedContactForContact:(id)a3 imageData:(id)a4 bundleIdentifier:(id)a5;
- (id)updateServiceWithContact:(id)a3 bundleIdentifier:(id)a4;
- (void)_setResult:(id)a3 forContact:(id)a4 bundleIdentifier:(id)a5;
- (void)confirmCuratedContactSuggestion:(BOOL)a3 forContact:(id)a4 bundleIdentifier:(id)a5;
- (void)didAddToCuratedContactsForContact:(id)a3 bundleIdentifier:(id)a4 cnContactIdentifier:(id)a5;
@end

@implementation UNSNotificationContactService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

void __47__UNSNotificationContactService_sharedInstance__block_invoke()
{
  v0 = [UNSNotificationContactService alloc];
  v3 = objc_alloc_init(UNSCNContactResolver);
  uint64_t v1 = [(UNSNotificationContactService *)v0 initWithResolver:v3];
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v1;
}

- (UNSNotificationContactService)initWithResolver:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UNSNotificationContactService;
  v6 = [(UNSNotificationContactService *)&v12 init];
  if (v6)
  {
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    resultsByServiceRecord = v6->_resultsByServiceRecord;
    v6->_resultsByServiceRecord = v7;

    [(NSCache *)v6->_resultsByServiceRecord setCountLimit:100];
    objc_storeStrong((id *)&v6->_resolver, a3);
    v9 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    curatedContactStore = v6->_curatedContactStore;
    v6->_curatedContactStore = v9;
  }
  return v6;
}

- (id)updateServiceWithContact:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isCNContactIdentifierSuggested])
  {
    v8 = 0;
  }
  else
  {
    v8 = [v6 cnContactIdentifier];
  }
  resolver = self->_resolver;
  uint64_t v10 = [v6 handleType];
  if (v10 == 1)
  {
    v11 = [v6 handle];
  }
  else
  {
    v11 = 0;
  }
  uint64_t v12 = [v6 handleType];
  if (v12 == 2)
  {
    v13 = [v6 handle];
  }
  else
  {
    v13 = 0;
  }
  v14 = [v6 customIdentifier];
  if ([v6 handleType])
  {
    v15 = [(UNSCNContactResolver *)resolver resultForContactIdentifier:v8 emailAddress:v11 phoneNumber:v13 userIdentifier:v14 username:0 bundleIdentifier:v7];
  }
  else
  {
    [v6 handle];
    v24 = self;
    v17 = v16 = v8;
    v15 = [(UNSCNContactResolver *)resolver resultForContactIdentifier:v16 emailAddress:v11 phoneNumber:v13 userIdentifier:v14 username:v17 bundleIdentifier:v7];

    v8 = v16;
    self = v24;
  }

  if (v12 == 2) {
  if (v10 == 1)
  }

  if (v15 && ([v15 isSuggestedContact] & 1) == 0)
  {
    v18 = (void *)[v6 mutableCopy];
    [v15 cnContactFullname];
    v19 = self;
    v21 = v20 = v8;
    [v18 setCnContactFullname:v21];

    v22 = [v15 cnContactIdentifier];
    [v18 setCnContactIdentifier:v22];

    v8 = v20;
    objc_msgSend(v18, "setCnContactIdentifierSuggested:", objc_msgSend(v15, "isMatchTypeSuggested"));
    [(UNSNotificationContactService *)v19 _setResult:v15 forContact:v18 bundleIdentifier:v7];
  }
  else
  {
    [(UNSNotificationContactService *)self _setResult:0 forContact:v6 bundleIdentifier:v7];
    v18 = 0;
  }

  return v18;
}

- (id)curatedContactMatchDetailsForContact:(id)a3 bundleIdentifier:(id)a4
{
  v4 = [(UNSNotificationContactService *)self _matchForContact:a3 bundleIdentifier:a4];
  id v5 = v4;
  if (v4 && ([v4 isSuggestedContact] & 1) == 0)
  {
    id v7 = [UNSNotificationContactServiceMatchDetails alloc];
    v8 = [v5 cnContactIdentifier];
    v9 = [v5 cnContactFullname];
    id v6 = -[UNSNotificationContactServiceMatchDetails initWithCnContactIdentifier:cnContactFullname:isSuggestedContact:](v7, "initWithCnContactIdentifier:cnContactFullname:isSuggestedContact:", v8, v9, [v5 isMatchTypeSuggested]);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)curatedContactForContact:(id)a3 bundleIdentifier:(id)a4 keysToFetch:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(UNSNotificationContactService *)self _matchForContact:v8 bundleIdentifier:a4];
  v11 = v10;
  if (v10 && ([v10 isStrongestMatch] & 1) != 0) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v8;
  }
  v13 = [v12 cnContactIdentifier];
  if ([v13 length])
  {
    curatedContactStore = self->_curatedContactStore;
    uint64_t v18 = 0;
    v15 = [(CNContactStore *)curatedContactStore unifiedContactWithIdentifier:v13 keysToFetch:v9 error:&v18];
    if (v18)
    {
      v16 = UNSLogCommunicationNotifications();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[UNSNotificationContactService curatedContactForContact:bundleIdentifier:keysToFetch:]();
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)confirmCuratedContactSuggestion:(BOOL)a3 forContact:(id)a4 bundleIdentifier:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(UNSNotificationContactService *)self _matchForContact:v8 bundleIdentifier:v9];
  v11 = v10;
  if (!v10)
  {
    v13 = UNSLogCommunicationNotifications();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[UNSNotificationContactService confirmCuratedContactSuggestion:forContact:bundleIdentifier:]();
    }
    goto LABEL_8;
  }
  if (![v10 isMatchTypeSuggested])
  {
    v13 = UNSLogCommunicationNotifications();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[UNSNotificationContactService confirmCuratedContactSuggestion:forContact:bundleIdentifier:]();
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v12 = [(UNSCNContactResolver *)self->_resolver confirm:v6 match:v11];
  [(UNSNotificationContactService *)self _setResult:v12 forContact:v8 bundleIdentifier:v9];

LABEL_9:
}

- (BOOL)canAddToCuratedContacts:(id)a3 bundleIdentifier:(id)a4
{
  v4 = [(UNSNotificationContactService *)self _matchForContact:a3 bundleIdentifier:a4];
  char v5 = [v4 isStrongestMatch] ^ 1;

  return v5;
}

- (id)newCuratedContactForContact:(id)a3 imageData:(id)a4 bundleIdentifier:(id)a5
{
  v32[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 displayName];
  if ([v10 length])
  {
    v11 = [MEMORY[0x263EFE9F8] contactWithDisplayName:v10 handleStrings:MEMORY[0x263EFFA68]];
    id v12 = (id)[v11 mutableCopy];
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFEAF0]);
  }
  uint64_t v13 = [v7 handleType];
  if (!v13)
  {
    id v18 = objc_alloc(MEMORY[0x263EFEB50]);
    v19 = [v7 handle];
    v20 = [v7 customIdentifier];
    v21 = [v7 serviceName];
    id v30 = v9;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    v16 = (void *)[v18 initWithUrlString:0 username:v19 userIdentifier:v20 service:v21 displayname:v10 teamIdentifier:0 bundleIdentifiers:v22];

    id v23 = objc_alloc(MEMORY[0x263EFEAD0]);
    v24 = [v16 service];
    v17 = (void *)[v23 initWithLabel:v24 value:v16];

    v29 = v17;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    [v12 setSocialProfiles:v25];
LABEL_10:

    goto LABEL_11;
  }
  if (v13 == 2)
  {
    id v26 = objc_alloc(MEMORY[0x263EFEB28]);
    v27 = [v7 handle];
    v16 = (void *)[v26 initWithStringValue:v27];

    v17 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:0 value:v16];
    v31 = v17;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    [v12 setPhoneNumbers:v25];
    goto LABEL_10;
  }
  if (v13 != 1) {
    goto LABEL_12;
  }
  v14 = (void *)MEMORY[0x263EFEAD0];
  v15 = [v7 handle];
  v16 = [v14 labeledValueWithLabel:0 value:v15];

  v32[0] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  [v12 setEmailAddresses:v17];
LABEL_11:

LABEL_12:
  if (v8) {
    [v12 setImageData:v8];
  }

  return v12;
}

- (void)didAddToCuratedContactsForContact:(id)a3 bundleIdentifier:(id)a4 cnContactIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(UNSNotificationContactService *)self _matchForContact:v8 bundleIdentifier:v9];
  if ([v11 isMatchTypeSuggested]) {
    id v12 = [(UNSCNContactResolver *)self->_resolver confirm:0 match:v11];
  }
  uint64_t v13 = [(UNSCNContactResolver *)self->_resolver resultForContactIdentifier:v10 emailAddress:0 phoneNumber:0 userIdentifier:0 username:0 bundleIdentifier:v9];
  if (!v13)
  {
    v14 = UNSLogCommunicationNotifications();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[UNSNotificationContactService didAddToCuratedContactsForContact:bundleIdentifier:cnContactIdentifier:]();
    }
  }
  [(UNSNotificationContactService *)self _setResult:v13 forContact:v8 bundleIdentifier:v9];
}

- (id)_matchForContact:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(UNSNotificationContactServiceRecord);
  [(UNSNotificationContactServiceRecord *)v8 setContact:v6];
  [(UNSNotificationContactServiceRecord *)v8 setBundleIdentifier:v7];
  id v9 = self;
  objc_sync_enter(v9);
  id v10 = [(NSCache *)v9->_resultsByServiceRecord objectForKey:v8];
  objc_sync_exit(v9);

  return v10;
}

- (void)_setResult:(id)a3 forContact:(id)a4 bundleIdentifier:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(UNSNotificationContactServiceRecord);
  [(UNSNotificationContactServiceRecord *)v10 setContact:v8];
  [(UNSNotificationContactServiceRecord *)v10 setBundleIdentifier:v9];
  v11 = self;
  objc_sync_enter(v11);
  resultsByServiceRecord = v11->_resultsByServiceRecord;
  if (v13) {
    [(NSCache *)resultsByServiceRecord setObject:v13 forKey:v10];
  }
  else {
    [(NSCache *)resultsByServiceRecord removeObjectForKey:v10];
  }
  objc_sync_exit(v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedContactStore, 0);
  objc_storeStrong((id *)&self->_resolver, 0);

  objc_storeStrong((id *)&self->_resultsByServiceRecord, 0);
}

- (void)curatedContactForContact:bundleIdentifier:keysToFetch:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260AF7000, v0, v1, "Contact service unable to fetch contact for identifier", v2, v3, v4, v5, v6);
}

- (void)confirmCuratedContactSuggestion:forContact:bundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260AF7000, v0, v1, "Contact service unable to confirm contact. Result not found.", v2, v3, v4, v5, v6);
}

- (void)confirmCuratedContactSuggestion:forContact:bundleIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260AF7000, v0, v1, "Contact service unable to confirm an already confirmed contact", v2, v3, v4, v5, v6);
}

- (void)didAddToCuratedContactsForContact:bundleIdentifier:cnContactIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260AF7000, v0, v1, "Contact service can't resolve newly created contact", v2, v3, v4, v5, v6);
}

@end