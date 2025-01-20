@interface STAskForTimeRequestReceivedUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (NSNumber)childDSID;
- (NSString)childName;
- (STAskForTimeRequestReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 childName:(id)a4 childDSID:(id)a5 requestedResourceName:(id)a6;
- (STAskForTimeRequestReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 familyMember:(id)a4 requestedResourceName:(id)a5;
- (STAskForTimeRequestReceivedUserNotificationContext)initWithCoder:(id)a3;
- (void)_fetchAndWriteFamilyPhotoURLIfNeeded:(id)a3;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setChildDSID:(id)a3;
- (void)setChildName:(id)a3;
@end

@implementation STAskForTimeRequestReceivedUserNotificationContext

- (STAskForTimeRequestReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 childName:(id)a4 childDSID:(id)a5 requestedResourceName:(id)a6
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)STAskForTimeRequestReceivedUserNotificationContext;
  v14 = [(STUserNotificationContext *)&v17 initWithIdentifier:a3];
  if (v14)
  {
    v18[0] = v11;
    v18[1] = v13;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [(STUserNotificationContext *)v14 setLocalizedUserNotificationBodyArguments:v15];

    objc_storeStrong((id *)&v14->_childDSID, a5);
    objc_storeStrong((id *)&v14->_childName, a4);
  }

  return v14;
}

- (STAskForTimeRequestReceivedUserNotificationContext)initWithAskForTimeRequestIdentifier:(id)a3 familyMember:(id)a4 requestedResourceName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 firstName];
  id v12 = [v9 dsid];

  id v13 = [(STAskForTimeRequestReceivedUserNotificationContext *)self initWithAskForTimeRequestIdentifier:v10 childName:v11 childDSID:v12 requestedResourceName:v8];
  return v13;
}

- (STAskForTimeRequestReceivedUserNotificationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STAskForTimeRequestReceivedUserNotificationContext;
  v5 = [(STUserNotificationContext *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"childDSID"];
    childDSID = v5->_childDSID;
    v5->_childDSID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"childName"];
    childName = v5->_childName;
    v5->_childName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STAskForTimeRequestReceivedUserNotificationContext;
  id v4 = a3;
  [(STUserNotificationContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_childDSID, @"childDSID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_childName forKey:@"childName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC6F40;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  v10.receiver = self;
  v10.super_class = (Class)STAskForTimeRequestReceivedUserNotificationContext;
  id v8 = v7;
  id v9 = v6;
  [(STUserNotificationContext *)&v10 customizeNotificationContent:v9 withCompletionBlock:v11];
}

void __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(id *a1)
{
  v2 = [NSString localizedUserNotificationStringForKey:@"AskForTimeRequestReceivedNotificationTitle" arguments:0];
  [a1[4] setTitle:v2];

  v3 = NSString;
  id v4 = [a1[5] localizedUserNotificationBodyArguments];
  objc_super v5 = [v3 localizedUserNotificationStringForKey:@"AskForTimeRequestReceivedNotificationBody" arguments:v4];
  [a1[4] setBody:v5];

  [a1[4] setCategoryIdentifier:@"com.apple.screentime.ask-request"];
  id v6 = [a1[5] childDSID];
  id v7 = [a1[5] identifier];
  id v8 = v6;
  id v9 = v7;
  objc_super v10 = objc_opt_new();
  [v10 setScheme:@"prefs"];
  if (v8)
  {
    objc_super v11 = [NSString stringWithFormat:@"%@&path=CHILD_%@", @"root=SCREEN_TIME", v8];
    [v10 setPath:v11];

    if (v9)
    {
      id v12 = [NSString stringWithFormat:@"ASK_%@", v9];
      [v10 setFragment:v12];
    }
  }
  else
  {
    [v10 setPath:@"root=SCREEN_TIME"];
  }
  id v13 = [v10 URL];

  [a1[4] setDefaultActionURL:v13];
  [a1[4] setInterruptionLevel:2];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke_2;
  v15[3] = &unk_1E6BC7118;
  id v14 = a1[5];
  id v16 = a1[4];
  id v17 = a1[6];
  [v14 _fetchAndWriteFamilyPhotoURLIfNeeded:v15];
}

uint64_t __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = a2;
    id v4 = [v3 lastPathComponent];
    objc_super v5 = [v4 stringByDeletingPathExtension];

    id v6 = (void *)MEMORY[0x1E4F445F0];
    uint64_t v14 = *MEMORY[0x1E4F446B0];
    v15[0] = MEMORY[0x1E4F1CC38];
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = 0;
    id v8 = [v6 attachmentWithIdentifier:v5 URL:v3 options:v7 error:&v12];

    id v9 = v12;
    if (v8)
    {
      id v13 = v8;
      objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      [*(id *)(a1 + 32) setAttachments:v10];
    }
    else
    {
      objc_super v10 = +[STLog ask];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke_2_cold_1();
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchAndWriteFamilyPhotoURLIfNeeded:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  objc_super v5 = [(STAskForTimeRequestReceivedUserNotificationContext *)self childDSID];
  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"remotemanagement-%@", v5];
    id v7 = +[STLocations familyPhotosCacheDirectory];
    id v8 = [v7 URLByAppendingPathComponent:v6 isDirectory:0];
    id v9 = [v8 URLByAppendingPathExtension:@"png"];

    if ([v9 checkResourceIsReachableAndReturnError:0])
    {
      v4[2](v4, v9);
    }
    else
    {
      objc_super v10 = +[STLog ask];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[STAskForTimeRequestReceivedUserNotificationContext _fetchAndWriteFamilyPhotoURLIfNeeded:]();
      }

      objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F61860]) initWithFamilyMemberDSID:v5 size:1 localFallback:1];
      [v11 setBackgroundType:1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke;
      v12[3] = &unk_1E6BC7140;
      id v13 = v5;
      id v16 = v4;
      id v14 = v7;
      id v15 = v9;
      [v11 startRequestWithCompletionHandler:v12];
    }
  }
  else
  {
    v4[2](v4, 0);
  }
}

void __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[STLog ask];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_3((uint64_t)a1, (uint64_t)v7, v8);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v10 = a1[5];
    id v20 = 0;
    int v11 = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v20];
    id v12 = v20;

    if (v11)
    {
      uint64_t v13 = a1[6];
      id v19 = v12;
      int v14 = [v6 writeToURL:v13 options:1 error:&v19];
      id v15 = v19;

      if (v14)
      {
        id v16 = *(void (**)(void))(a1[7] + 16);
      }
      else
      {
        v18 = +[STLog ask];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_1();
        }

        id v16 = *(void (**)(void))(a1[7] + 16);
      }
      v16();
    }
    else
    {
      id v17 = +[STLog ask];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_2();
      }

      (*(void (**)(void))(a1[7] + 16))();
      id v15 = v12;
    }
  }
}

- (NSString)childName
{
  return self->_childName;
}

- (void)setChildName:(id)a3
{
}

- (NSNumber)childDSID
{
  return self->_childDSID;
}

- (void)setChildDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childDSID, 0);
  objc_storeStrong((id *)&self->_childName, 0);
}

void __103__STAskForTimeRequestReceivedUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Could not create thumbnail attachment: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_fetchAndWriteFamilyPhotoURLIfNeeded:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEBUG, "Fetching photo for %@", v1, 0xCu);
}

void __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Could not write family photo data: %{public}@", v2, v3, v4, v5, v6);
}

void __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Could not create family photo directory: %{public}@", v2, v3, v4, v5, v6);
}

void __91__STAskForTimeRequestReceivedUserNotificationContext__fetchAndWriteFamilyPhotoURLIfNeeded___block_invoke_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Could not fetch family photo for %@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end