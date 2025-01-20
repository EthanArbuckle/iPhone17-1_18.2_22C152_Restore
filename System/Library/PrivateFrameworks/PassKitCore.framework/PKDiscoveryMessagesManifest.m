@interface PKDiscoveryMessagesManifest
- (NSArray)engagementMessages;
- (NSArray)notifications;
- (PKDiscoveryMessagesManifest)initWithDictionary:(id)a3;
- (int64_t)version;
@end

@implementation PKDiscoveryMessagesManifest

- (PKDiscoveryMessagesManifest)initWithDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKDiscoveryMessagesManifest;
  v5 = [(PKDiscoveryMessagesManifest *)&v36 init];
  if (v5)
  {
    v5->_version = [v4 PKIntegerForKey:@"version"];
    v6 = [v4 PKArrayForKey:@"engagementMessages"];
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v33;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [[PKDiscoveryEngagementMessage alloc] initWithDictionary:*(void *)(*((void *)&v32 + 1) + 8 * v12)];
            if (v13) {
              [v7 addObject:v13];
            }

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v10);
      }

      uint64_t v14 = [v7 copy];
      engagementMessages = v5->_engagementMessages;
      v5->_engagementMessages = (NSArray *)v14;
    }
    v16 = [v4 PKArrayForKey:@"notifications"];
    if (v16)
    {
      v27 = v6;
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [[PKDiscoveryNotification alloc] initWithDictionary:*(void *)(*((void *)&v28 + 1) + 8 * v22)];
            if (v23) {
              [v17 addObject:v23];
            }

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v20);
      }

      uint64_t v24 = [v17 copy];
      notifications = v5->_notifications;
      v5->_notifications = (NSArray *)v24;

      v6 = v27;
    }
  }
  return v5;
}

- (int64_t)version
{
  return self->_version;
}

- (NSArray)engagementMessages
{
  return self->_engagementMessages;
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_engagementMessages, 0);
}

@end