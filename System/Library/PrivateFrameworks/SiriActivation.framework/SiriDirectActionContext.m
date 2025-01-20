@interface SiriDirectActionContext
+ (BOOL)supportsSecureCoding;
+ (id)appLaunchDirectActionWithAppBundleId:(id)a3;
+ (id)mapSearchDirectActionWithAppBundleId:(id)a3;
+ (id)mapShareEtaDirectActionWithAppBundleId:(id)a3;
+ (id)messageAmbiguousDirectActionWithAppBundleId:(id)a3;
+ (id)messageComposeDirectActionWithAppBundleId:(id)a3;
+ (id)messageComposeNewThreadDirectActionWithAppBundleId:(id)a3 fullName:(id)a4 phoneOrEmailAddress:(id)a5;
+ (id)messageReadDirectActionWithAppBundleId:(id)a3 conversationGUID:(id)a4;
+ (id)messageReplyDirectActionWithAppBundleId:(id)a3 conversationGUID:(id)a4;
+ (id)musicSearchDirectActionWithAppBundleId:(id)a3;
+ (id)phoneAmbiguousDirectActionWithAppBundleId:(id)a3;
+ (id)phoneCallDirectActionWithAppBundleId:(id)a3;
- (BBBulletin)bulletin;
- (NSDictionary)payload;
- (SiriDirectActionContext)initWithBBBulletin:(id)a3;
- (SiriDirectActionContext)initWithCoder:(id)a3;
- (SiriDirectActionContext)initWithPayload:(id)a3;
- (SiriDirectActionContext)initWithUNNotification:(id)a3;
- (UNNotification)notification;
- (id)_initWithDirectActionEvent:(int64_t)a3 appBundleId:(id)a4 conversationGUID:(id)a5 fullName:(id)a6 phoneOrEmailAddress:(id)a7;
- (id)_intentIdentifiersFromBulletin:(id)a3 notification:(id)a4;
- (id)bundleId;
- (id)description;
- (int64_t)_directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:(id)a3 notification:(id)a4;
- (int64_t)_directActionEventFromContentTypesOfBulletin:(id)a3 notification:(id)a4;
- (int64_t)directActionEvent;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriDirectActionContext

- (SiriDirectActionContext)initWithPayload:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriDirectActionContext;
  v6 = [(SiriDirectActionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_payload, a3);
  }

  return v7;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

- (SiriDirectActionContext)initWithBBBulletin:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriDirectActionContext;
  v6 = [(SiriDirectActionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bulletin, a3);
  }

  return v7;
}

- (SiriDirectActionContext)initWithUNNotification:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriDirectActionContext;
  v6 = [(SiriDirectActionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notification, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SiriContext *)self contextOverride];
  id v5 = [(SiriDirectActionContext *)self payload];
  v6 = [(SiriDirectActionContext *)self bulletin];
  v7 = [(SiriDirectActionContext *)self notification];
  [(SiriDirectActionContext *)self directActionEvent];
  v8 = AFDirectActionEventGetName();
  objc_super v9 = [(SiriDirectActionContext *)self bundleId];
  v10 = [v3 stringWithFormat:@"<SiriDirectActionContext contextOverride:%@, payload:%@, bulletin:%@, notification:%@, directActionEvent:%@, bundleId:%@>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (int64_t)directActionEvent
{
  v3 = [(SiriDirectActionContext *)self payload];

  if (v3)
  {
    v4 = [(SiriDirectActionContext *)self payload];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F4E6C8]];
    uint64_t v6 = [v5 integerValue];
  }
  else
  {
    v8 = [(SiriDirectActionContext *)self bulletin];
    objc_super v9 = [(SiriDirectActionContext *)self notification];
    int64_t v7 = [(SiriDirectActionContext *)self _directActionEventFromContentTypesOfBulletin:v8 notification:v9];

    if (v7) {
      return v7;
    }
    v4 = [(SiriDirectActionContext *)self bulletin];
    id v5 = [(SiriDirectActionContext *)self notification];
    uint64_t v6 = [(SiriDirectActionContext *)self _directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:v4 notification:v5];
  }
  int64_t v7 = v6;

  return v7;
}

- (id)bundleId
{
  v3 = [(SiriDirectActionContext *)self payload];

  if (v3)
  {
    v4 = [(SiriDirectActionContext *)self payload];
    uint64_t v5 = [v4 valueForKey:@"SBSAssistantActivationContextBundleID"];
  }
  else
  {
    uint64_t v6 = [(SiriDirectActionContext *)self bulletin];

    if (v6)
    {
      v4 = [(SiriDirectActionContext *)self bulletin];
      uint64_t v5 = [v4 sectionID];
    }
    else
    {
      int64_t v7 = [(SiriDirectActionContext *)self notification];

      if (!v7) {
        goto LABEL_8;
      }
      v4 = [(SiriDirectActionContext *)self notification];
      uint64_t v5 = [v4 sourceIdentifier];
    }
  }
  int64_t v7 = (void *)v5;

LABEL_8:
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriDirectActionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SiriDirectActionContext;
  uint64_t v5 = [(SiriContext *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"payload"];
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bulletin"];
    bulletin = v5->_bulletin;
    v5->_bulletin = (BBBulletin *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notification"];
    notification = v5->_notification;
    v5->_notification = (UNNotification *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SiriDirectActionContext;
  id v4 = a3;
  [(SiriContext *)&v8 encodeWithCoder:v4];
  uint64_t v5 = [(SiriDirectActionContext *)self payload];
  [v4 encodeObject:v5 forKey:@"payload"];

  uint64_t v6 = [(SiriDirectActionContext *)self bulletin];
  [v4 encodeObject:v6 forKey:@"bulletin"];

  uint64_t v7 = [(SiriDirectActionContext *)self notification];
  [v4 encodeObject:v7 forKey:@"notification"];
}

- (id)_intentIdentifiersFromBulletin:(id)a3 notification:(id)a4
{
  if (a3) {
    [a3 intentIDs];
  }
  else {
  id v4 = [a4 intentIdentifiers];
  }
  return v4;
}

- (int64_t)_directActionEventFromContentTypesOfBulletin:(id)a3 notification:(id)a4
{
  v29[6] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F50C78];
  v28[0] = *MEMORY[0x1E4F50C68];
  v28[1] = v6;
  v29[0] = &unk_1F337C5A8;
  v29[1] = &unk_1F337C5A8;
  uint64_t v7 = *MEMORY[0x1E4F50C40];
  v28[2] = *MEMORY[0x1E4F50C50];
  v28[3] = v7;
  v29[2] = &unk_1F337C5C0;
  v29[3] = &unk_1F337C5D8;
  uint64_t v8 = *MEMORY[0x1E4F50C90];
  v28[4] = *MEMORY[0x1E4F50C80];
  v28[5] = v8;
  v29[4] = &unk_1F337C5D8;
  v29[5] = &unk_1F337C5F0;
  objc_super v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a3;
  v11 = [v9 dictionaryWithObjects:v29 forKeys:v28 count:6];
  uint64_t v12 = [v10 contentType];

  v13 = [v11 objectForKeyedSubscript:v12];
  if (v13)
  {
    uint64_t v14 = v13;
    int64_t v15 = [v13 integerValue];
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F44740];
    v26[0] = *MEMORY[0x1E4F44728];
    v26[1] = v16;
    v27[0] = &unk_1F337C5A8;
    v27[1] = &unk_1F337C5A8;
    uint64_t v17 = *MEMORY[0x1E4F44708];
    v26[2] = *MEMORY[0x1E4F44718];
    v26[3] = v17;
    v27[2] = &unk_1F337C5C0;
    v27[3] = &unk_1F337C5D8;
    uint64_t v18 = *MEMORY[0x1E4F44760];
    v26[4] = *MEMORY[0x1E4F44748];
    v26[5] = v18;
    v27[4] = &unk_1F337C5D8;
    v27[5] = &unk_1F337C5F0;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];
    v20 = [v5 request];
    v21 = [v20 content];
    v22 = [v21 contentType];

    v23 = [v19 objectForKeyedSubscript:v22];
    uint64_t v14 = v23;
    if (v23)
    {
      int64_t v15 = [v23 integerValue];
    }
    else
    {
      if ([v12 length] || objc_msgSend(v22, "length"))
      {
        v24 = *MEMORY[0x1E4F4E360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
          -[SiriDirectActionContext _directActionEventFromContentTypesOfBulletin:notification:]((uint64_t)v12, (uint64_t)v22, v24);
        }
      }
      int64_t v15 = 0;
    }
  }
  return v15;
}

- (int64_t)_directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:(id)a3 notification:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SiriDirectActionContext *)self bundleId];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [(SiriDirectActionContext *)self bundleId];
    uint64_t v8 = [v7 caseInsensitiveCompare:@"com.apple.MobileSMS"];

    if (!v8) {
      return 4;
    }
  }
  uint64_t v9 = [(SiriDirectActionContext *)self bundleId];
  if (v9
    && (id v10 = (void *)v9,
        [(SiriDirectActionContext *)self bundleId],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 caseInsensitiveCompare:@"com.apple.Home"],
        v11,
        v10,
        !v12))
  {
    uint64_t v29 = [(SiriDirectActionContext *)self bulletin];
    v30 = [(SiriDirectActionContext *)self notification];
    v31 = [(SiriDirectActionContext *)self _intentIdentifiersFromBulletin:v29 notification:v30];

    LOBYTE(v29) = [v31 containsObject:*MEMORY[0x1E4F301F0]];
    if (v29) {
      return 16;
    }
  }
  else
  {
    uint64_t v13 = [(SiriDirectActionContext *)self bundleId];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      int64_t v15 = [(SiriDirectActionContext *)self bundleId];
      uint64_t v16 = [v15 caseInsensitiveCompare:@"com.apple.shortcuts"];

      if (!v16) {
        return 17;
      }
    }
    uint64_t v17 = [(SiriDirectActionContext *)self bulletin];
    uint64_t v18 = [(SiriDirectActionContext *)self notification];
    v19 = [(SiriDirectActionContext *)self _intentIdentifiersFromBulletin:v17 notification:v18];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v34;
      uint64_t v24 = *MEMORY[0x1E4F30208];
      uint64_t v25 = *MEMORY[0x1E4F30200];
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ((objc_msgSend(v27, "containsString:", v24, (void)v33) & 1) != 0
            || ([v27 containsString:v25] & 1) != 0)
          {

            return 4;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
  }
  v32 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    -[SiriDirectActionContext _directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:notification:](v32, self);
  }
  return 0;
}

+ (id)messageAmbiguousDirectActionWithAppBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:1 appBundleId:v3 conversationGUID:0 fullName:0 phoneOrEmailAddress:0];

  return v4;
}

+ (id)messageComposeDirectActionWithAppBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:2 appBundleId:v3 conversationGUID:0 fullName:0 phoneOrEmailAddress:0];

  return v4;
}

+ (id)messageComposeNewThreadDirectActionWithAppBundleId:(id)a3 fullName:(id)a4 phoneOrEmailAddress:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:3 appBundleId:v9 conversationGUID:0 fullName:v8 phoneOrEmailAddress:v7];

  return v10;
}

+ (id)messageReadDirectActionWithAppBundleId:(id)a3 conversationGUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:4 appBundleId:v6 conversationGUID:v5 fullName:0 phoneOrEmailAddress:0];

  return v7;
}

+ (id)messageReplyDirectActionWithAppBundleId:(id)a3 conversationGUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:5 appBundleId:v6 conversationGUID:v5 fullName:0 phoneOrEmailAddress:0];

  return v7;
}

+ (id)mapSearchDirectActionWithAppBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:6 appBundleId:v3 conversationGUID:0 fullName:0 phoneOrEmailAddress:0];

  return v4;
}

+ (id)mapShareEtaDirectActionWithAppBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:18 appBundleId:v3 conversationGUID:0 fullName:0 phoneOrEmailAddress:0];

  return v4;
}

+ (id)musicSearchDirectActionWithAppBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:7 appBundleId:v3 conversationGUID:0 fullName:0 phoneOrEmailAddress:0];

  return v4;
}

+ (id)phoneAmbiguousDirectActionWithAppBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:12 appBundleId:v3 conversationGUID:0 fullName:0 phoneOrEmailAddress:0];

  return v4;
}

+ (id)phoneCallDirectActionWithAppBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:13 appBundleId:v3 conversationGUID:0 fullName:0 phoneOrEmailAddress:0];

  return v4;
}

+ (id)appLaunchDirectActionWithAppBundleId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDirectActionEvent:15 appBundleId:v3 conversationGUID:0 fullName:0 phoneOrEmailAddress:0];

  return v4;
}

- (id)_initWithDirectActionEvent:(int64_t)a3 appBundleId:(id)a4 conversationGUID:(id)a5 fullName:(id)a6 phoneOrEmailAddress:(id)a7
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  int64_t v15 = (void *)MEMORY[0x1E4F1CA60];
  v23[0] = *MEMORY[0x1E4F4E6C8];
  uint64_t v16 = (void *)MEMORY[0x1E4F28ED0];
  id v17 = a4;
  uint64_t v18 = [v16 numberWithInteger:a3];
  v23[1] = @"SBSAssistantActivationContextBundleID";
  v24[0] = v18;
  v24[1] = v17;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  id v20 = [v15 dictionaryWithDictionary:v19];

  if ([v12 length]) {
    [v20 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F4E6D0]];
  }
  if ([v13 length]) {
    [v20 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F4E6D8]];
  }
  if ([v14 length]) {
    [v20 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F4E6E0]];
  }
  uint64_t v21 = [(SiriDirectActionContext *)self initWithPayload:v20];

  return v21;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)_directActionEventFromContentTypesOfBulletin:(os_log_t)log notification:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  id v4 = "-[SiriDirectActionContext _directActionEventFromContentTypesOfBulletin:notification:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1D9588000, log, OS_LOG_TYPE_ERROR, "%s Couldn't determine direct action from bulletin content \"%@\" or notification content \"%@\".", (uint8_t *)&v3, 0x20u);
}

- (void)_directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:(void *)a1 notification:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  id v4 = [a2 bundleId];
  __int16 v5 = [a2 bulletin];
  uint64_t v6 = [a2 notification];
  __int16 v7 = [a2 _intentIdentifiersFromBulletin:v5 notification:v6];
  int v8 = 136315650;
  uint64_t v9 = "-[SiriDirectActionContext _directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:notification:]";
  __int16 v10 = 2112;
  v11 = v4;
  __int16 v12 = 2112;
  id v13 = v7;
  _os_log_error_impl(&dword_1D9588000, v3, OS_LOG_TYPE_ERROR, "%s Couldn't determine direct action from bundleId: \"%@\" and intent identifiers: \"%@\"", (uint8_t *)&v8, 0x20u);
}

@end