@interface PLCloudSharedDeleteAlbumsJob
+ (void)deleteLocalAlbumForMSASAlbumGUID:(id)a3 inviterAddress:(id)a4;
+ (void)deleteLocalAlbumsForMSASAlbumGUIDs:(id)a3;
- (NSArray)albumCloudGUIDsToDelete;
- (NSString)inviterAddress;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)daemonOperation;
- (void)encodeToXPCObject:(id)a3;
- (void)runDaemonSide;
- (void)setAlbumCloudGUIDsToDelete:(id)a3;
- (void)setInviterAddress:(id)a3;
@end

@implementation PLCloudSharedDeleteAlbumsJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviterAddress, 0);
  objc_storeStrong((id *)&self->_albumCloudGUIDsToDelete, 0);
}

- (void)setInviterAddress:(id)a3
{
}

- (NSString)inviterAddress
{
  return self->_inviterAddress;
}

- (void)setAlbumCloudGUIDsToDelete:(id)a3
{
}

- (NSArray)albumCloudGUIDsToDelete
{
  return self->_albumCloudGUIDsToDelete;
}

- (void)runDaemonSide
{
  v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudSharedDeleteAlbumsJob runDaemonSide]"];
  v4 = [(id)objc_opt_class() highPriorityOperationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PLCloudSharedDeleteAlbumsJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E5875E18;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 addOperationWithBlock:v6];
}

void __45__PLCloudSharedDeleteAlbumsJob_runDaemonSide__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  v3 = [*(id *)(a1 + 32) transientPhotoLibrary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__PLCloudSharedDeleteAlbumsJob_runDaemonSide__block_invoke_2;
  v6[3] = &unk_1E5875E18;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  [v4 performTransactionAndWait:v6];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)PLCloudSharedDeleteAlbumsJob;
  objc_msgSendSuper2(&v5, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

void __45__PLCloudSharedDeleteAlbumsJob_runDaemonSide__block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = +[PLNotificationManager sharedManager];
  v3 = PLPhotoSharingGetLog();
  v22 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) albumCloudGUIDsToDelete];
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudSharedDeleteAlbumsJob will delete locally shared albums with UUIDS %@", buf, 0xCu);

    v2 = v22;
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [*(id *)(a1 + 32) albumCloudGUIDsToDelete];
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v26;
    uint64_t v23 = *MEMORY[0x1E4F5C3C0];
    *(void *)&long long v6 = 138412290;
    long long v21 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(NSObject **)(*((void *)&v25 + 1) + 8 * i);
        v11 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v10, *(void *)(a1 + 40), v21);
        if (v11)
        {
          v12 = [*(id *)(a1 + 32) inviterAddress];
          if (![v12 length]) {
            goto LABEL_13;
          }
          v13 = [v11 cloudMetadata];
          v14 = [v13 objectForKey:v23];

          if (![v14 length]
            || ([v14 isEqualToString:v12] & 1) != 0)
          {

LABEL_13:
            v15 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = [v11 title];
              v17 = [v11 assets];
              uint64_t v18 = [v17 count];
              *(_DWORD *)buf = 138412802;
              v30 = v16;
              __int16 v31 = 2112;
              v32 = v10;
              __int16 v33 = 2048;
              uint64_t v34 = v18;
              _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "PLCloudSharedDeleteAlbumsJob will delete locally shared album with title %@, UUID %@, and %lu assets", buf, 0x20u);

              v2 = v22;
            }

            [v2 noteDidDeleteSharedAlbum:v11];
            [v11 delete];
            goto LABEL_21;
          }
          v19 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = [v11 cloudGUID];
            *(_DWORD *)buf = 138412802;
            v30 = v14;
            __int16 v31 = 2112;
            v32 = v12;
            __int16 v33 = 2112;
            uint64_t v34 = (uint64_t)v20;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "PLCloudSharedDeleteAlbumsJob persisted inviterAddress %@ does not match current inviterAddress %@, skip deleting the album %@", buf, 0x20u);
          }
        }
        else
        {
          v12 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v30 = v10;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "PLCloudSharedDeleteAlbumsJob did not find locally shared album with uuid %@ to delete", buf, 0xCu);
          }
        }
LABEL_21:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v7);
  }
}

- (int64_t)daemonOperation
{
  return 4;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PLCloudSharedDeleteAlbumsJob;
  v3 = [(PLDaemonJob *)&v8 description];
  id v4 = [(PLCloudSharedDeleteAlbumsJob *)self albumCloudGUIDsToDelete];
  uint64_t v5 = [(PLCloudSharedDeleteAlbumsJob *)self inviterAddress];
  long long v6 = [v3 stringByAppendingFormat:@" albumCloudGUIDsToDelete %@ inviter %@", v4, v5];

  return v6;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLCloudSharedDeleteAlbumsJob;
  id v7 = [(PLCloudSharingJob *)&v11 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7)
  {
    objc_super v8 = PLArrayFromXPCDictionary();
    [v7 setAlbumCloudGUIDsToDelete:v8];

    v9 = PLStringFromXPCDictionary();
    [v7 setInviterAddress:v9];
  }
  return v7;
}

- (void)encodeToXPCObject:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLCloudSharedDeleteAlbumsJob;
  id v4 = a3;
  [(PLDaemonJob *)&v7 encodeToXPCObject:v4];
  uint64_t v5 = [(PLCloudSharedDeleteAlbumsJob *)self albumCloudGUIDsToDelete];
  PLXPCDictionarySetArray();

  id v6 = [(PLCloudSharedDeleteAlbumsJob *)self inviterAddress];
  PLXPCDictionarySetString();
}

+ (void)deleteLocalAlbumForMSASAlbumGUID:(id)a3 inviterAddress:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = objc_opt_new();
  v9[0] = v6;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  [v7 setAlbumCloudGUIDsToDelete:v8];
  [v7 setInviterAddress:v5];

  [v7 runAndWaitForMessageToBeSent];
}

+ (void)deleteLocalAlbumsForMSASAlbumGUIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v3 = objc_opt_new();
    [v3 setAlbumCloudGUIDsToDelete:v4];
    [v3 runAndWaitForMessageToBeSent];
  }
}

@end