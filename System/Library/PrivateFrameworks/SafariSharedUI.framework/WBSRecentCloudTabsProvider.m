@interface WBSRecentCloudTabsProvider
- (NSSet)recentItems;
- (NSString)activeProfileIdentifier;
- (WBSCloudTabDeviceProvider)cloudTabDeviceProvider;
- (WBSRecentCloudTabsProvider)initWithCloudTabDeviceProvider:(id)a3;
- (WBSRecentsStore)recentsStore;
- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4;
- (void)setActiveProfileIdentifier:(id)a3;
- (void)setCloudTabDeviceProvider:(id)a3;
- (void)setRecentsStore:(id)a3;
@end

@implementation WBSRecentCloudTabsProvider

- (WBSRecentCloudTabsProvider)initWithCloudTabDeviceProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSRecentCloudTabsProvider;
  v6 = [(WBSRecentCloudTabsProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cloudTabDeviceProvider, a3);
    [(WBSCloudTabDeviceProvider *)v7->_cloudTabDeviceProvider addCloudTabsObserver:v7];
    v8 = v7;
  }

  return v7;
}

- (NSSet)recentItems
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_activeProfileIdentifier length])
  {
    v3 = [(WBSCloudTabDeviceProvider *)self->_cloudTabDeviceProvider syncedRemoteCloudTabDevicesForProfileWithIdentifier:self->_activeProfileIdentifier];
    id v32 = [MEMORY[0x1E4F1CA80] set];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v3;
    uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v39;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v39 != v27) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v38 + 1) + 8 * v4);
          id v5 = [v33 deviceTypeIdentifier];
          v29 = v5;
          uint64_t v30 = v4;
          if ([v5 length])
          {
            v6 = [MEMORY[0x1E4F6F260] symbolForTypeIdentifier:v5 error:0];
            v7 = v6;
            if (v6)
            {
              v8 = (void *)MEMORY[0x1E4F42A80];
              v9 = [v6 name];
              objc_super v10 = [v8 _systemImageNamed:v9];
            }
            else
            {
              objc_super v10 = 0;
            }
          }
          else
          {
            objc_super v10 = 0;
          }
          v11 = [v33 tabs];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v31 = v11;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v35 != v14) {
                  objc_enumerationMutation(v31);
                }
                v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                v17 = [WBSRecentItem alloc];
                v18 = [v16 uuidString];
                v19 = [v16 url];
                v20 = [MEMORY[0x1E4F1C9C8] date];
                v21 = [(WBSRecentItem *)v17 initWithIdentifier:v18 url:v19 date:v20];

                [(WBSRecentItem *)v21 setDevice:v33];
                [(WBSRecentItem *)v21 setCloudTab:v16];
                v22 = [v16 title];
                [(WBSRecentItem *)v21 setTitle:v22];

                [(WBSRecentItem *)v21 setIcon:v10];
                v23 = (void *)MEMORY[0x1E4F1C9C8];
                [v16 lastViewedTime];
                v24 = objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
                [(WBSRecentItem *)v21 setDate:v24];

                [v32 addObject:v21];
              }
              uint64_t v13 = [v31 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v13);
          }

          uint64_t v4 = v30 + 1;
        }
        while (v30 + 1 != v28);
        uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v28);
    }
  }
  else
  {
    id v32 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v32;
}

- (void)setActiveProfileIdentifier:(id)a3
{
  id v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    uint64_t v4 = (NSString *)[v7 copy];
    activeProfileIdentifier = self->_activeProfileIdentifier;
    self->_activeProfileIdentifier = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsStore);
    [WeakRetained ingestRecentItemsFromProvider:self];
  }
}

- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4
{
  if (WBSIsEqual())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsStore);
    [WeakRetained ingestRecentItemsFromProvider:self];
  }
}

- (void)setRecentsStore:(id)a3
{
}

- (void)setCloudTabDeviceProvider:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cloudTabDeviceProvider, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsStore);
    [WeakRetained ingestRecentItemsFromProvider:self];
  }
}

- (WBSRecentsStore)recentsStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsStore);
  return (WBSRecentsStore *)WeakRetained;
}

- (WBSCloudTabDeviceProvider)cloudTabDeviceProvider
{
  return self->_cloudTabDeviceProvider;
}

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudTabDeviceProvider, 0);
  objc_destroyWeak((id *)&self->_recentsStore);
}

@end