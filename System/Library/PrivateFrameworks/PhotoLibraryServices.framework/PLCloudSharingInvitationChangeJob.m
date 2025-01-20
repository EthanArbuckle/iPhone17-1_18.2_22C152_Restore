@interface PLCloudSharingInvitationChangeJob
+ (void)resendPendingInvitationWithGUID:(id)a3 albumGUID:(id)a4;
+ (void)saveServerStateLocallyForSharingACLRelationships:(id)a3 changeType:(int64_t)a4 info:(id)a5;
+ (void)saveServerStateLocallyForSharingInvitationRelationships:(id)a3 changeType:(int64_t)a4 info:(id)a5;
+ (void)sendServerPendingInvitationsForAlbumWithGUID:(id)a3;
- (BOOL)shouldArchiveXPCToDisk;
- (NSArray)MSASSharingRelationships;
- (NSDictionary)mstreamdInfoDictionary;
- (NSString)albumGUID;
- (NSString)resendInvitationGUID;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)daemonOperation;
- (int64_t)jobType;
- (int64_t)relationshipChangeType;
- (void)encodeToXPCObject:(id)a3;
- (void)executeSaveServerStateLocallyForSharingACLRelationships;
- (void)executeSaveServerStateLocallyForSharingInvitationRelationships;
- (void)executeSendServerPendingInvitationsForAlbumWithGUID;
- (void)runDaemonSide;
- (void)setAlbumGUID:(id)a3;
- (void)setJobType:(int64_t)a3;
- (void)setMSASSharingRelationships:(id)a3;
- (void)setMstreamdInfoDictionary:(id)a3;
- (void)setRelationshipChangeType:(int64_t)a3;
- (void)setResendInvitationGUID:(id)a3;
@end

@implementation PLCloudSharingInvitationChangeJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mstreamdInfoDictionary, 0);
  objc_storeStrong((id *)&self->_resendInvitationGUID, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_MSASSharingRelationships, 0);
}

- (void)setMstreamdInfoDictionary:(id)a3
{
}

- (NSDictionary)mstreamdInfoDictionary
{
  return self->_mstreamdInfoDictionary;
}

- (void)setJobType:(int64_t)a3
{
  self->_jobType = a3;
}

- (int64_t)jobType
{
  return self->_jobType;
}

- (void)setResendInvitationGUID:(id)a3
{
}

- (NSString)resendInvitationGUID
{
  return self->_resendInvitationGUID;
}

- (void)setAlbumGUID:(id)a3
{
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setRelationshipChangeType:(int64_t)a3
{
  self->_relationshipChangeType = a3;
}

- (int64_t)relationshipChangeType
{
  return self->_relationshipChangeType;
}

- (void)setMSASSharingRelationships:(id)a3
{
}

- (NSArray)MSASSharingRelationships
{
  return self->_MSASSharingRelationships;
}

- (void)executeSendServerPendingInvitationsForAlbumWithGUID
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PLCloudSharingInvitationChangeJob *)self albumGUID];
    v5 = [(PLCloudSharingInvitationChangeJob *)self resendInvitationGUID];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "executeSendServerPendingInvitationsForAlbumWithGUID %@ resendInvitationGUID %@", buf, 0x16u);
  }
  BOOL v6 = [(PLCloudSharingInvitationChangeJob *)self jobType] == 4;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy__76209;
  v21 = __Block_byref_object_dispose__76210;
  id v22 = 0;
  v7 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  v8 = +[PLPhotoSharingHelper sharingPersonID];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__PLCloudSharingInvitationChangeJob_executeSendServerPendingInvitationsForAlbumWithGUID__block_invoke;
  v15[3] = &unk_1E5875318;
  v15[4] = self;
  id v9 = v7;
  BOOL v18 = v6;
  id v16 = v9;
  v17 = buf;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PLCloudSharingInvitationChangeJob_executeSendServerPendingInvitationsForAlbumWithGUID__block_invoke_57;
  v11[3] = &unk_1E5875318;
  v13 = buf;
  v11[4] = self;
  id v10 = v8;
  id v12 = v10;
  BOOL v14 = v6;
  [v9 performBlockAndWait:v15 completionHandler:v11];

  _Block_object_dispose(buf, 8);
}

void __88__PLCloudSharingInvitationChangeJob_executeSendServerPendingInvitationsForAlbumWithGUID__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) albumGUID];
  v3 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v2 inLibrary:*(void *)(a1 + 40)];

  v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 invitationRecords];
    *(_DWORD *)buf = 138412546;
    v38 = v3;
    __int16 v39 = 2048;
    uint64_t v40 = [v5 count];
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "found plAlbum %@ with invitationRecods %lu", buf, 0x16u);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v31 = v3;
  BOOL v6 = [v3 invitationRecords];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v12 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v11;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "invitation record %@", buf, 0xCu);
        }

        v13 = [v11 invitationState];
        if ([v13 intValue] == 1)
        {
        }
        else
        {
          int v14 = *(unsigned __int8 *)(a1 + 56);

          if (!v14) {
            continue;
          }
        }
        if (*(unsigned char *)(a1 + 56))
        {
          v15 = [v11 cloudGUID];
          id v16 = [*(id *)(a1 + 32) resendInvitationGUID];
          int v17 = [v15 isEqualToString:v16];

          if (!v17) {
            continue;
          }
        }
        BOOL v18 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "record state is kMSASRelationshipStatePending, will send invitation", buf, 2u);
        }

        id v19 = objc_alloc_init(MEMORY[0x1E4F5C378]);
        v20 = [v11 cloudGUID];
        [v19 setGUID:v20];

        v21 = [v11 inviteeEmails];
        [v19 setEmails:v21];

        id v22 = [v11 inviteePhones];
        [v19 setPhones:v22];

        uint64_t v23 = [v11 inviteeFirstName];
        [v19 setFirstName:v23];

        v24 = [v11 inviteeLastName];
        [v19 setLastName:v24];

        v25 = [v11 inviteeFullName];
        [v19 setFullName:v25];

        v26 = [v11 inviteeHashedPersonID];
        [v19 setPersonID:v26];

        [v19 setState:1];
        v27 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (!v27)
        {
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
          v30 = *(void **)(v29 + 40);
          *(void *)(v29 + 40) = v28;

          v27 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        }
        [v27 addObject:v19];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }
}

void __88__PLCloudSharingInvitationChangeJob_executeSendServerPendingInvitationsForAlbumWithGUID__block_invoke_57(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v3 = PLPhotoSharingGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = objc_opt_class();
      BOOL v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = v5;
      uint64_t v9 = [v7 albumGUID];
      uint64_t v10 = *(void *)(a1 + 40);
      int v18 = 138413058;
      id v19 = v5;
      __int16 v20 = 2112;
      v21 = v6;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@: about to call connection addAccessControlEntries: %@ toAlbumWithGUID: %@ forPersonID %@", (uint8_t *)&v18, 0x2Au);
    }
    v11 = [MEMORY[0x1E4F77A58] sharedConnection];
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v13 = [*(id *)(a1 + 32) albumGUID];
    [v11 addAccessControlEntries:v12 toAlbumWithGUID:v13 personID:*(void *)(a1 + 40)];
    goto LABEL_5;
  }
  if (v4)
  {
    int v18 = 138412290;
    id v19 = (id)objc_opt_class();
    id v14 = v19;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@: no sharing invitations to send", (uint8_t *)&v18, 0xCu);
  }
  if (*(unsigned char *)(a1 + 56))
  {
    v11 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    v15 = objc_opt_class();
    id v16 = *(void **)(a1 + 32);
    id v13 = v15;
    int v17 = [v16 resendInvitationGUID];
    int v18 = 138412546;
    id v19 = v15;
    __int16 v20 = 2112;
    v21 = v17;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "%@: failed to find invitation GUID %@ to resend", (uint8_t *)&v18, 0x16u);

LABEL_5:
LABEL_6:
  }
}

- (void)executeSaveServerStateLocallyForSharingACLRelationships
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(PLCloudSharingInvitationChangeJob *)self MSASSharingRelationships];
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "executeSaveServerStateLocallyForSharingACLRelationships %@", buf, 0xCu);
  }
  v5 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__PLCloudSharingInvitationChangeJob_executeSaveServerStateLocallyForSharingACLRelationships__block_invoke;
  v7[3] = &unk_1E5875E18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 performTransactionAndWait:v7];
}

void __92__PLCloudSharingInvitationChangeJob_executeSaveServerStateLocallyForSharingACLRelationships__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = [*(id *)(a1 + 32) MSASSharingRelationships];
  uint64_t v66 = [obj countByEnumeratingWithState:&v67 objects:v90 count:16];
  if (v66)
  {
    uint64_t v65 = *(void *)v68;
    uint64_t v61 = v1;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v68 != v65) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v67 + 1) + 8 * v2);
        BOOL v4 = [v3 GUID];
        v5 = v4;
        if (v4 && [v4 length])
        {
          v89 = v5;
          id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
          uint64_t v7 = +[PLCloudSharedAlbumInvitationRecord cloudSharedAlbumInvitationRecordsWithGUIDs:v6 inLibrary:*(void *)(v1 + 40)];
          id v8 = [v7 firstObject];

          if ([*(id *)(v1 + 32) relationshipChangeType] == 1
            || [*(id *)(v1 + 32) relationshipChangeType] == 3)
          {
            uint64_t v9 = [v3 albumGUID];
            uint64_t v10 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v9 inLibrary:*(void *)(v1 + 40)];

            if (!v10)
            {
              uint64_t v11 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v12 = [v3 albumGUID];
                *(_DWORD *)buf = 138412290;
                uint64_t v72 = (uint64_t)v12;
                _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "WARNING: couldn't find album with GUID %@ to set sharingRelationship", buf, 0xCu);
              }
            }
            v64 = (void *)v10;
            unsigned int v63 = [v3 state];
            if (v8)
            {
              id v13 = [v8 invitationState];
              uint64_t v62 = (int)[v13 intValue];
            }
            else
            {
              id v19 = [v3 firstName];
              __int16 v20 = [v3 lastName];
              v21 = [v3 fullName];
              __int16 v22 = [v3 emails];
              uint64_t v23 = [v3 phones];
              uint64_t v24 = v1;
              uint64_t v25 = (void *)v23;
              id v8 = +[PLCloudSharedAlbumInvitationRecord insertNewInvitationRecordIntoAlbum:v64 withFirstName:v19 lastName:v20 fullName:v21 emails:v22 phones:v23 inLibrary:*(void *)(v24 + 40)];

              uint64_t v26 = [v3 GUID];
              [v8 setCloudGUID:v26];

              id v13 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "inserting new PLCloudSharedAlbumInvitationRecord", buf, 2u);
              }
              uint64_t v62 = 0x7FFFFFFFFFFFFFFFLL;
              uint64_t v1 = v61;
            }

            v27 = [v3 albumGUID];
            [v8 setAlbumGUID:v27];

            id v28 = [v3 emails];
            uint64_t v29 = [v3 phones];
            [v8 setInviteeEmails:v28 phones:v29];

            v30 = [v3 firstName];
            [v8 setInviteeFirstName:v30];

            v31 = [v3 lastName];
            [v8 setInviteeLastName:v31];

            long long v32 = [v3 personID];
            [v8 setInviteeHashedPersonID:v32];

            long long v33 = [v3 fullName];
            [v8 setInviteeFullName:v33];

            long long v34 = [v3 subscriptionDate];
            [v8 setInviteeSubscriptionDate:v34];

            -[NSObject setIsMine:](v8, "setIsMine:", [v3 isMine]);
            long long v35 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v59 = [v64 title];
              [v64 cloudGUID];
              v58 = v57 = v5;
              v36 = [v8 inviteeFirstName];
              v37 = [v8 inviteeLastName];
              v38 = [v8 inviteeFullName];
              __int16 v39 = [v8 inviteeEmails];
              uint64_t v40 = [v8 inviteePhones];
              uint64_t v41 = [v8 inviteeHashedPersonID];
              int v42 = [v8 isMine];
              *(_DWORD *)buf = 138414338;
              v43 = @"NO";
              if (v42) {
                v43 = @"YES";
              }
              uint64_t v72 = (uint64_t)v59;
              __int16 v73 = 2112;
              v74 = v58;
              __int16 v75 = 2112;
              v76 = v36;
              __int16 v77 = 2112;
              v78 = v37;
              __int16 v79 = 2112;
              v80 = v38;
              __int16 v81 = 2112;
              v82 = v39;
              __int16 v83 = 2112;
              v84 = v40;
              __int16 v85 = 2112;
              v86 = v41;
              __int16 v87 = 2112;
              v88 = v43;
              _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "setting person info for invitation record on album '%@' (%@): %@, %@, %@, %@, %@, hashedPersonID %@ isMine %@", buf, 0x5Cu);

              uint64_t v1 = v61;
              v5 = v57;
            }
            v44 = [*(id *)(v1 + 40) personInfoManager];
            v45 = [v3 firstName];
            v46 = [v3 lastName];
            v47 = [v3 fullName];
            v48 = [v3 email];
            v49 = [v3 personID];
            [v44 setFirstName:v45 lastName:v46 fullName:v47 email:v48 forPersonID:v49];

            v50 = [NSNumber numberWithInt:v63];
            [v8 setInvitationState:v50];

            v51 = [v8 album];

            if (v64 && !v51) {
              [v8 setAlbum:v64];
            }
            v52 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v72 = (uint64_t)v8;
              __int16 v73 = 2112;
              v74 = v3;
              _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEFAULT, "resulting invitation record %@ for MSASSharingRelationship %@", buf, 0x16u);
            }

            v53 = +[PLNotificationManager sharedManager];
            uint64_t v1 = v61;
            v54 = [*(id *)(v61 + 32) mstreamdInfoDictionary];
            [v53 noteInvitationRecordStatusChanged:v8 fromOldState:v62 mstreamdInfo:v54];
          }
          else
          {
            if ([*(id *)(v1 + 32) relationshipChangeType] != 2)
            {
              id v14 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                uint64_t v55 = [*(id *)(v1 + 32) relationshipChangeType];
                *(_DWORD *)buf = 134217984;
                uint64_t v72 = v55;
                _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "ERROR: unknown relationship change type %lld", buf, 0xCu);
              }
              goto LABEL_20;
            }
            [v8 delete];
          }
        }
        else
        {
          if (![v3 state])
          {
            id v8 = [*(id *)(v1 + 40) personInfoManager];
            id v14 = [v3 firstName];
            v15 = [v3 lastName];
            id v16 = [v3 fullName];
            int v17 = [v3 email];
            int v18 = [v3 personID];
            [v8 setFirstName:v14 lastName:v15 fullName:v16 email:v17 forPersonID:v18];

LABEL_20:
            goto LABEL_34;
          }
          id v8 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v72 = (uint64_t)v3;
            _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "found sharingRelationship without GUID: %@. Skipping", buf, 0xCu);
          }
        }
LABEL_34:

        ++v2;
      }
      while (v66 != v2);
      uint64_t v56 = [obj countByEnumeratingWithState:&v67 objects:v90 count:16];
      uint64_t v66 = v56;
    }
    while (v56);
  }
}

- (void)executeSaveServerStateLocallyForSharingInvitationRelationships
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(PLCloudSharingInvitationChangeJob *)self MSASSharingRelationships];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "executeSaveServerStateLocallyForSharingRelationships %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)runDaemonSide
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = self;
    id v4 = v11;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);
  }
  int v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudSharingInvitationChangeJob runDaemonSide]"];
  id v6 = [(id)objc_opt_class() highPriorityOperationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PLCloudSharingInvitationChangeJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E5875E18;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 addOperationWithBlock:v8];
}

void __50__PLCloudSharingInvitationChangeJob_runDaemonSide__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v3 = [*(id *)(a1 + 32) jobType];
  if ((unint64_t)(v3 - 3) < 2)
  {
    [*(id *)(a1 + 32) executeSendServerPendingInvitationsForAlbumWithGUID];
  }
  else if (v3 == 2)
  {
    [*(id *)(a1 + 32) executeSaveServerStateLocallyForSharingInvitationRelationships];
  }
  else if (v3 == 1)
  {
    [*(id *)(a1 + 32) executeSaveServerStateLocallyForSharingACLRelationships];
  }
  else
  {
    id v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Error: unknown job type for %@", buf, 0xCu);
    }
  }
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)PLCloudSharingInvitationChangeJob;
  objc_msgSendSuper2(&v6, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

- (BOOL)shouldArchiveXPCToDisk
{
  uint64_t v2 = [(PLCloudSharingInvitationChangeJob *)self mstreamdInfoDictionary];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)daemonOperation
{
  return 7;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(PLCloudSharingInvitationChangeJob *)self MSASSharingRelationships];
  int64_t v6 = [(PLCloudSharingInvitationChangeJob *)self relationshipChangeType];
  id v7 = [(PLCloudSharingInvitationChangeJob *)self albumGUID];
  uint64_t v8 = [(PLCloudSharingInvitationChangeJob *)self resendInvitationGUID];
  uint64_t v9 = [(PLCloudSharingInvitationChangeJob *)self mstreamdInfoDictionary];
  uint64_t v10 = [v3 stringWithFormat:@"%@ (MSASSharingRelationships=%@ relationshipChangeType=%lld albumGUID=%@ resendInvitationGUID=%@ mstreamdInfo=%@) ", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLCloudSharingInvitationChangeJob;
  id v7 = [(PLCloudSharingJob *)&v18 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7)
  {
    uint64_t v8 = PLDataFromXPCDictionary();
    uint64_t v9 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    __int16 v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    id v13 = objc_msgSend(v9, "pl_safeUnarchiveObjectFromData:classes:", v8, v12);

    if (v13) {
      [v7 setMSASSharingRelationships:v13];
    }
    objc_msgSend(v7, "setRelationshipChangeType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyRelationshipChangeType));
    uint64_t v14 = PLStringFromXPCDictionary();
    [v7 setAlbumGUID:v14];

    v15 = PLStringFromXPCDictionary();
    [v7 setResendInvitationGUID:v15];

    id v16 = PLDictionaryFromXPCDictionary();
    [v7 setMstreamdInfoDictionary:v16];

    objc_msgSend(v7, "setJobType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyJobType));
  }

  return v7;
}

- (void)encodeToXPCObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PLCloudSharingInvitationChangeJob;
  id v4 = a3;
  [(PLDaemonJob *)&v14 encodeToXPCObject:v4];
  uint64_t v5 = (void *)MEMORY[0x1E4F28DB0];
  id v6 = [(PLCloudSharingInvitationChangeJob *)self MSASSharingRelationships];
  id v13 = 0;
  id v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v13];
  id v8 = v13;

  if (!v7)
  {
    uint64_t v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Failed to archive msASRelationshipsData, error: %@", buf, 0xCu);
    }
  }
  PLXPCDictionarySetData();
  xpc_dictionary_set_int64(v4, (const char *)propertyKeyRelationshipChangeType, [(PLCloudSharingInvitationChangeJob *)self relationshipChangeType]);
  uint64_t v10 = [(PLCloudSharingInvitationChangeJob *)self albumGUID];
  PLXPCDictionarySetString();

  uint64_t v11 = [(PLCloudSharingInvitationChangeJob *)self resendInvitationGUID];
  PLXPCDictionarySetString();

  __int16 v12 = [(PLCloudSharingInvitationChangeJob *)self mstreamdInfoDictionary];
  PLXPCDictionarySetDictionary();

  xpc_dictionary_set_int64(v4, (const char *)propertyKeyJobType, [(PLCloudSharingInvitationChangeJob *)self jobType]);
}

+ (void)resendPendingInvitationWithGUID:(id)a3 albumGUID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    uint64_t v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      uint64_t v11 = "%@ : cannot resend invitation with nil invitation GUID";
      __int16 v12 = v9;
      uint32_t v13 = 12;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v6)
  {
    uint64_t v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2112;
      id v17 = v5;
      id v10 = v15;
      uint64_t v11 = "%@ : cannot resend invitation %@ with nil album GUID";
      __int16 v12 = v9;
      uint32_t v13 = 22;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v8 = objc_alloc_init((Class)objc_opt_class());
  [v8 setJobType:4];
  [v8 setAlbumGUID:v7];
  [v8 setResendInvitationGUID:v5];
  [v8 setMstreamdInfoDictionary:0];
  [v8 run];

LABEL_10:
}

+ (void)sendServerPendingInvitationsForAlbumWithGUID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setJobType:3];
  [v4 setAlbumGUID:v3];

  [v4 setMstreamdInfoDictionary:0];
  [v4 run];
}

+ (void)saveServerStateLocallyForSharingInvitationRelationships:(id)a3 changeType:(int64_t)a4 info:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)objc_opt_class());
  [v9 setJobType:2];
  [v9 setMSASSharingRelationships:v8];

  [v9 setRelationshipChangeType:a4];
  [v9 setMstreamdInfoDictionary:v7];

  [v9 runAndWaitForMessageToBeSent];
}

+ (void)saveServerStateLocallyForSharingACLRelationships:(id)a3 changeType:(int64_t)a4 info:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)objc_opt_class());
  [v9 setJobType:1];
  [v9 setMSASSharingRelationships:v8];

  [v9 setRelationshipChangeType:a4];
  [v9 setMstreamdInfoDictionary:v7];

  [v9 runAndWaitForMessageToBeSent];
}

@end