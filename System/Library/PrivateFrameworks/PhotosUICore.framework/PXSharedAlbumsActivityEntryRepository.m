@interface PXSharedAlbumsActivityEntryRepository
- (PXSharedAlbumsActivityEntryRepository)init;
- (PXSharedAlbumsActivityEntryRepository)initWithLogIdentifier:(id)a3;
- (PXSharedAlbumsActivityEntryRepositoryDelegate)delegate;
- (void)_clearPendingNotifications;
- (void)_didFinishPostingNotifications:(id)a3;
- (void)assetsDidChange:(id)a3;
- (void)cloudCommentsDidChange:(id)a3;
- (void)cloudFeedEntriesDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shouldReload:(id)a3;
@end

@implementation PXSharedAlbumsActivityEntryRepository

- (void)setDelegate:(id)a3
{
}

- (PXSharedAlbumsActivityEntryRepository)initWithLogIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntry.m", 740, @"Invalid parameter not satisfying: %@", @"logIdentifier" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PXSharedAlbumsActivityEntryRepository;
  v6 = [(PXSharedAlbumsActivityEntryRepository *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingFeedEntriesChangeNotifications = v6->_pendingFeedEntriesChangeNotifications;
    v6->_pendingFeedEntriesChangeNotifications = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingCommentsChangeNotifications = v6->_pendingCommentsChangeNotifications;
    v6->_pendingCommentsChangeNotifications = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingAssetsChangeNotifications = v6->_pendingAssetsChangeNotifications;
    v6->_pendingAssetsChangeNotifications = v13;

    v15 = [MEMORY[0x1E4F8A6E8] defaultCenter];
    [v15 addCloudFeedEntriesObserver:v6];
    [v15 addCloudCommentsChangeObserver:v6 asset:0];
    [v15 addAssetChangeObserver:v6];
    [v15 addShouldReloadObserver:v6];
    [v15 addObserver:v6 selector:sel__didFinishPostingNotifications_ name:*MEMORY[0x1E4F8AD20] object:0];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingAssetsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingCommentsChangeNotifications, 0);
  objc_storeStrong((id *)&self->_pendingFeedEntriesChangeNotifications, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (PXSharedAlbumsActivityEntryRepositoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSharedAlbumsActivityEntryRepositoryDelegate *)WeakRetained;
}

- (void)_clearPendingNotifications
{
  [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications removeAllObjects];
  [(NSMutableArray *)self->_pendingCommentsChangeNotifications removeAllObjects];
  pendingAssetsChangeNotifications = self->_pendingAssetsChangeNotifications;
  [(NSMutableArray *)pendingAssetsChangeNotifications removeAllObjects];
}

- (void)_didFinishPostingNotifications:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = PLSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    logIdentifier = self->_logIdentifier;
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications count];
    uint64_t v9 = [(NSMutableArray *)self->_pendingCommentsChangeNotifications count];
    uint64_t v10 = [(NSMutableArray *)self->_pendingAssetsChangeNotifications count];
    int v12 = 138544386;
    v13 = logIdentifier;
    __int16 v14 = 2112;
    v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = v10;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[SharedAlbumsActivityEntryRepository - %{public}@] %@ (pendingFeedEntries count: %lu, pendingCommentsChange count: %lu, pendingAssetsChange count: %lu)", (uint8_t *)&v12, 0x34u);
  }
  if ([(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications count]
    || [(NSMutableArray *)self->_pendingCommentsChangeNotifications count]
    || [(NSMutableArray *)self->_pendingAssetsChangeNotifications count])
  {
    [(PXSharedAlbumsActivityEntryRepository *)self _clearPendingNotifications];
    v11 = [(PXSharedAlbumsActivityEntryRepository *)self delegate];
    [v11 activityEntryRepositoryDidChange:self];
  }
}

- (void)shouldReload:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = PLSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    int v7 = 138543362;
    uint64_t v8 = logIdentifier;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityEntryRepository - %{public}@] shouldReload", (uint8_t *)&v7, 0xCu);
  }

  [(PXSharedAlbumsActivityEntryRepository *)self _clearPendingNotifications];
  v6 = [(PXSharedAlbumsActivityEntryRepository *)self delegate];
  [v6 activityEntryRepositoryDidChange:self];
}

- (void)cloudFeedEntriesDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    int v7 = 138543362;
    uint64_t v8 = logIdentifier;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityEntryRepository - %{public}@] cloudFeedEntriesDidChange", (uint8_t *)&v7, 0xCu);
  }

  [(NSMutableArray *)self->_pendingFeedEntriesChangeNotifications addObject:v4];
}

- (void)cloudCommentsDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    int v7 = 138543362;
    uint64_t v8 = logIdentifier;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityEntryRepository - %{public}@] cloudCommentsDidChange", (uint8_t *)&v7, 0xCu);
  }

  [(NSMutableArray *)self->_pendingCommentsChangeNotifications addObject:v4];
}

- (void)assetsDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    int v7 = 138543362;
    uint64_t v8 = logIdentifier;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "[SharedAlbumsActivityEntryRepository - %{public}@] assetsDidChange", (uint8_t *)&v7, 0xCu);
  }

  [(NSMutableArray *)self->_pendingAssetsChangeNotifications addObject:v4];
}

- (PXSharedAlbumsActivityEntryRepository)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedAlbumsActivityEntry.m", 736, @"%s is not available as initializer", "-[PXSharedAlbumsActivityEntryRepository init]");

  abort();
}

@end