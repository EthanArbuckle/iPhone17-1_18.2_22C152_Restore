@interface VUILibraryFamilyMembersDataSource
- (NSArray)familyMembers;
- (VUILibraryFamilyMembersDataSource)init;
- (VUIMediaAPIClient)mediaClient;
- (void)_orderFamilyMembersByFirstName;
- (void)setFamilyMembers:(id)a3;
- (void)setMediaClient:(id)a3;
- (void)startFetch;
@end

@implementation VUILibraryFamilyMembersDataSource

- (VUILibraryFamilyMembersDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUILibraryFamilyMembersDataSource;
  v2 = [(VUILibraryFamilyMembersDataSource *)&v6 init];
  if (v2)
  {
    +[VUIMediaAPIClient initializeWithAppleTVClientIdentifier];
    uint64_t v3 = +[VUIMediaAPIClient sharedInstance];
    mediaClient = v2->_mediaClient;
    v2->_mediaClient = (VUIMediaAPIClient *)v3;
  }
  return v2;
}

- (void)startFetch
{
  uint64_t v3 = +[VUIMediaAPIRequestFactory familyMembersRequest];
  objc_initWeak(&location, self);
  v4 = [(VUILibraryFamilyMembersDataSource *)self mediaClient];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke;
  v5[3] = &unk_1E6DF4FD0;
  objc_copyWeak(&v6, &location);
  [v4 fetchContentForUrl:v3 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    VUIDefaultLogObject();
    v9 = (VUIFamilyMembersRequestResponseParser *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR)) {
      __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke_cold_1((uint64_t)v6, &v9->super);
    }
  }
  else
  {
    v9 = objc_alloc_init(VUIFamilyMembersRequestResponseParser);
    v10 = [(VUIFamilyMembersRequestResponseParser *)v9 parseAMSURLResult:v5];
    [WeakRetained setFamilyMembers:v10];
    [WeakRetained _orderFamilyMembersByFirstName];
  }
  [WeakRetained setHasCompletedInitialFetch:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v13 = __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke_3;
  v14 = &unk_1E6DF4A30;
  objc_copyWeak(&v15, v7);
  v11 = v12;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v13((uint64_t)v11);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }

  objc_destroyWeak(&v15);
}

void __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 dataSourceDidFinishFetching:WeakRetained];
  }
}

- (void)_orderFamilyMembersByFirstName
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUILibraryFamilyMembersDataSource *)self familyMembers];
  v4 = (void *)[v3 mutableCopy];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"firstName" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 sortUsingDescriptors:v6];

  v7 = (void *)[v4 copy];
  [(VUILibraryFamilyMembersDataSource *)self setFamilyMembers:v7];
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
}

- (VUIMediaAPIClient)mediaClient
{
  return self->_mediaClient;
}

- (void)setMediaClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaClient, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
}

void __47__VUILibraryFamilyMembersDataSource_startFetch__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Fetching family members failed with error:%@", (uint8_t *)&v2, 0xCu);
}

@end