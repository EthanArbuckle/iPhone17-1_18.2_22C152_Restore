@interface NSUserActivity(SynapseExtensions)
- (BOOL)_syIsShowBacklinkIndicatorUserActivity;
- (id)_canonicalURL;
- (id)_linkContextInfo;
- (id)_linkContextPreviewMetadata;
- (id)_syLoggableDescription;
- (id)_syUserInfoDomainIdentifiers;
- (id)_syUserInfoLinkIdentifiers;
- (uint64_t)_syIsBacklinkUserActivity;
- (void)_linkContextInfo;
- (void)set_canonicalURL:()SynapseExtensions;
- (void)set_linkContextInfo:()SynapseExtensions;
- (void)set_linkContextPreviewMetadata:()SynapseExtensions;
@end

@implementation NSUserActivity(SynapseExtensions)

- (id)_canonicalURL
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = [v1 _payloadForIdentifier:@"com.apple.synapse.canonicalURL"];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithDataRepresentation:v2 relativeToURL:0];
  }
  else
  {
    v3 = 0;
  }

  objc_sync_exit(v1);
  return v3;
}

- (void)set_canonicalURL:()SynapseExtensions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  v6 = [v4 dataRepresentation];
  [v5 _setPayload:v6 object:0 identifier:@"com.apple.synapse.canonicalURL"];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v7 = (void *)getUAUserActivityClass_softClass_0;
  uint64_t v22 = getUAUserActivityClass_softClass_0;
  if (!getUAUserActivityClass_softClass_0)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getUAUserActivityClass_block_invoke_0;
    v18[3] = &unk_1E64635F8;
    v18[4] = &v19;
    __getUAUserActivityClass_block_invoke_0((uint64_t)v18);
    v7 = (void *)v20[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v19, 8);
  [v8 observers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "userActivityCanonicalURLWasChanged:", v5, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v5);
}

- (id)_linkContextInfo
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = [v1 _payloadForIdentifier:@"com.apple.synapse.linkContextInfo"];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    id v4 = SYSupportedLinkContextInfoClasses();
    id v10 = 0;
    id v5 = [v3 unarchivedObjectOfClasses:v4 fromData:v2 error:&v10];
    id v6 = v10;

    if (!v5)
    {
      v7 = os_log_create("com.apple.synapse", "");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(NSUserActivity(SynapseExtensions) *)(uint64_t)v6 _linkContextInfo];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  objc_sync_exit(v1);
  return v5;
}

- (void)set_linkContextInfo:()SynapseExtensions
{
  id v5 = a3;
  id v6 = a1;
  objc_sync_enter(v6);
  if (v5)
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke;
    v13[3] = &unk_1E6464830;
    v13[4] = &v14;
    [v5 enumerateKeysAndObjectsUsingBlock:v13];
    if (*((unsigned char *)v15 + 24)
      || ([MEMORY[0x1E4F28B00] currentHandler],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          [v11 handleFailureInMethod:a2 object:v6 file:@"SYNSUserActivityExtensions.m" lineNumber:112 description:@"linkContextInfo contains objects of unsupported classes."], v11, *((unsigned char *)v15 + 24)))
    {
      id v12 = 0;
      v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
      id v8 = v12;
      if (!v7)
      {
        id v9 = os_log_create("com.apple.synapse", "");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          [(NSUserActivity(SynapseExtensions) *)(uint64_t)v8 set_linkContextInfo:v10];
        }
      }
    }
    else
    {
      v7 = 0;
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v7 = 0;
  }
  [v6 _setPayload:v7 object:0 identifier:@"com.apple.synapse.linkContextInfo"];

  objc_sync_exit(v6);
}

- (id)_linkContextPreviewMetadata
{
  id v1 = a1;
  objc_sync_enter(v1);
  v2 = [v1 _payloadForIdentifier:@"com.apple.synapse.linkContextPreviewMetadata"];
  objc_sync_exit(v1);

  return v2;
}

- (void)set_linkContextPreviewMetadata:()SynapseExtensions
{
  id v5 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  [v4 _setPayload:v5 object:0 identifier:@"com.apple.synapse.linkContextPreviewMetadata"];
  objc_sync_exit(v4);
}

- (id)_syUserInfoDomainIdentifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"domainIdentifier"];

  if (v2)
  {
    v5[0] = v2;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)_syUserInfoLinkIdentifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v1 = [a1 userInfo];
  v2 = [v1 objectForKey:@"uuid"];

  if (v2)
  {
    v5[0] = v2;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)_syLoggableDescription
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [a1 activityType];
  id v6 = [a1 title];
  v7 = [a1 userInfo];
  id v8 = [a1 persistentIdentifier];
  id v9 = [a1 _syRelatedUniqueIdentifier];
  uint64_t v10 = [v2 stringWithFormat:@"<%@: %p> type: %@, title: %@, userInfo: %@, persistentIdentifier: %@, relatedUniqueIdentifier: %@", v4, a1, v5, v6, v7, v8, v9];

  return v10;
}

- (uint64_t)_syIsBacklinkUserActivity
{
  id v1 = [a1 activityType];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.notes.activity.show-backlink"];

  return v2;
}

- (BOOL)_syIsShowBacklinkIndicatorUserActivity
{
  if (![a1 _syIsBacklinkUserActivity]) {
    return 0;
  }
  uint64_t v2 = [a1 _syUserInfoDomainIdentifiers];
  uint64_t v3 = [v2 count];

  id v4 = [a1 _syUserInfoLinkIdentifiers];
  uint64_t v5 = [v4 count];

  if (!v3) {
    return 0;
  }
  return v5 != 0;
}

- (void)_linkContextInfo
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C2C5F000, a2, a3, "Error decoding linkContextInfo dictionary: %@", (uint8_t *)&v3);
}

- (void)set_linkContextInfo:()SynapseExtensions .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C2C5F000, a2, a3, "Error encoding linkContextInfo dictionary: %@", (uint8_t *)&v3);
}

@end