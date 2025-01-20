@interface PLCloudSharedUpdateAlbumMetadataJob
+ (void)updateAlbumMetadata:(id)a3;
- (NSDictionary)metadata;
- (id)_argumentsDictionaryAsData:(id)a3;
- (id)_argumentsDictionaryFromXPCEvent:(id)a3;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)daemonOperation;
- (void)encodeToXPCObject:(id)a3;
- (void)runDaemonSide;
- (void)setMetadata:(id)a3;
@end

@implementation PLCloudSharedUpdateAlbumMetadataJob

- (void).cxx_destruct
{
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (id)_argumentsDictionaryFromXPCEvent:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  size_t length = 0;
  data = xpc_dictionary_get_data(a3, "arguments-dictionary", &length);
  if (data)
  {
    v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
    id v9 = 0;
    v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v9];
    id v6 = v9;
    if (!v5)
    {
      v7 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "ERROR: _argumentsDictionaryFromXPCEvent failed to deserialize arguments dictionary %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "ERROR: _argumentsDictionaryFromXPCEvent failed to get arguments-dictionary from xpc event", buf, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (id)_argumentsDictionaryAsData:(id)a3
{
  id v3 = a3;
  uint64_t v6 = 0;
  v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:&v6];
  if (!v4) {
    NSLog(&cfstr_ErrorArguments_1.isa, v3, v6);
  }

  return v4;
}

- (void)runDaemonSide
{
  id v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudSharedUpdateAlbumMetadataJob runDaemonSide]"];
  v4 = [(id)objc_opt_class() lowPriorityOperationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E5875E18;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 addOperationWithBlock:v6];
}

void __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F38D3B0]();
  id v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [*(id *)(a1 + 32) metadata];
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudSharedUpdateAlbumMetadataJob runDaemonSide %@", buf, 0xCu);
  }
  id v5 = [*(id *)(a1 + 32) transientPhotoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke_37;
  v8[3] = &unk_1E5875E18;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [v6 performTransactionAndWait:v8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PLCloudSharedUpdateAlbumMetadataJob;
  objc_msgSendSuper2(&v7, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

void __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke_37(uint64_t a1)
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) metadata];
  id v3 = [v2 objectForKey:@"album-guid"];
  if (v3)
  {
    v4 = [v2 objectForKey:@"album-relationshipState"];
    id v5 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v3 inLibrary:*(void *)(a1 + 40)];
    if ([v4 intValue] == 1)
    {
      if (v5
        && [(__CFString *)v5 cloudRelationshipStateLocalValue] == 2)
      {
        id v6 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v97 = v5;
          _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "PLCloudSharedUpdateAlbumMetadataJob ignoring pending relationship for already subscribed album %@", buf, 0xCu);
        }

        goto LABEL_75;
      }
      v88 = [MEMORY[0x1E4F1C9C8] date];
    }
    else
    {
      v88 = 0;
    }
    objc_super v7 = v5;
    v85 = v4;
    uint64_t v86 = a1;
    v81 = v5;
    if (!v5)
    {
      v83 = v2;
      objc_super v7 = +[PLGenericAlbum insertNewCloudSharedAlbumWithTitle:0 lastInterestingDate:v88 intoLibrary:*(void *)(a1 + 40)];
      [v7 setCloudGUID:v3];
      int v8 = [v4 intValue];
      id v9 = [NSNumber numberWithBool:v8 == 0];
      [v7 setIsOwned:v9];

      v10 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = @"NO";
        if (!v8) {
          v11 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v97 = v3;
        __int16 v98 = 2112;
        v99 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "inserting shared album with GUID %@ isOwned %@", buf, 0x16u);
      }

      uint64_t v12 = v3;
      uint64_t v13 = +[PLCloudSharedAlbumInvitationRecord cloudSharedAlbumInvitationRecordsWithAlbumGUID:v3 inLibrary:*(void *)(a1 + 40)];
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v92 objects:v112 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v93;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            v18 = v7;
            if (*(void *)v93 != v16) {
              objc_enumerationMutation(v13);
            }
            v19 = *(__CFString **)(*((void *)&v92 + 1) + 8 * i);
            v20 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v97 = v19;
              __int16 v98 = 2112;
              v99 = v12;
              _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Linking invitation record %@ to newly created album with GUID %@", buf, 0x16u);
            }

            v21 = v19;
            objc_super v7 = v18;
            [(__CFString *)v21 setAlbum:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v92 objects:v112 count:16];
        }
        while (v15);
      }

      id v3 = v12;
      v2 = v83;
      v4 = v85;
      id v5 = 0;
    }
    v22 = [v2 objectForKey:@"kPLAlbumOwnerDictionaryKey"];
    v89 = v7;
    v84 = v22;
    if ([(__CFString *)v22 count])
    {
      v23 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v97 = v22;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "found album owner info %@", buf, 0xCu);
      }

      uint64_t v24 = [(__CFString *)v22 objectForKey:@"kPLAlbumOwnerFirstNameKey"];
      if (v24) {
        [v7 setCloudOwnerFirstName:v24];
      }
      uint64_t v25 = [(__CFString *)v22 objectForKey:@"kPLAlbumOwnerLastNameKey"];
      if (v25) {
        [v7 setCloudOwnerLastName:v25];
      }
      v79 = v3;
      uint64_t v26 = [(__CFString *)v22 objectForKey:@"kPLAlbumOwnerEmailKey"];
      if (v26) {
        [v7 setCloudOwnerEmail:v26];
      }
      uint64_t v27 = [(__CFString *)v22 objectForKey:@"kPLAlbumOwnerFullNameKey"];
      if (v27) {
        [v7 setCloudOwnerFullName:v27];
      }
      v73 = (void *)v27;
      uint64_t v28 = [(__CFString *)v22 objectForKey:@"kPLAlbumOwnerHashedPersonIDKey"];
      if (v28) {
        [v7 setCloudOwnerHashedPersonID:v28];
      }
      v72 = (void *)v28;
      v29 = [(__CFString *)v22 objectForKey:@"kPLAlbumOwnerIsWhitelistedKey"];
      v30 = v29;
      if (v29) {
        objc_msgSend(v7, "setCloudOwnerIsWhitelisted:", objc_msgSend(v29, "BOOLValue"));
      }
      v31 = [(__CFString *)v22 objectForKey:@"kPLAlbumOwnerSubscriptionDateKey", v30];
      if (v31) {
        [v7 setCloudSubscriptionDate:v31];
      }
      v74 = (void *)v26;
      v75 = (void *)v25;
      v77 = (void *)v24;
      v32 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v2 objectForKey:@"album-name"];
        v34 = [v7 cloudOwnerFirstName];
        v35 = [v7 cloudOwnerLastName];
        v36 = [v89 cloudOwnerFullName];
        v37 = [v89 cloudOwnerEmail];
        v38 = [v89 cloudOwnerHashedPersonID];
        int v39 = [v89 cloudOwnerIsWhitelisted];
        *(_DWORD *)buf = 138414082;
        v40 = @"NO";
        v97 = v33;
        __int16 v98 = 2112;
        if (v39) {
          v40 = @"YES";
        }
        v99 = v79;
        __int16 v100 = 2112;
        v101 = v34;
        __int16 v102 = 2112;
        v103 = v35;
        __int16 v104 = 2112;
        v105 = v36;
        __int16 v106 = 2112;
        v107 = v37;
        __int16 v108 = 2112;
        v109 = v38;
        __int16 v110 = 2112;
        v111 = v40;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "setting person info for album '%@' (%@): %@, %@, %@, %@, hashedPersonID %@, whitelist: %@", buf, 0x52u);

        objc_super v7 = v89;
      }

      v41 = [*(id *)(v86 + 40) personInfoManager];
      v42 = [v7 cloudOwnerFirstName];
      v43 = [v7 cloudOwnerLastName];
      v44 = [v7 cloudOwnerFullName];
      v45 = [v7 cloudOwnerEmail];
      v46 = [v89 cloudOwnerHashedPersonID];
      [v41 setFirstName:v42 lastName:v43 fullName:v44 email:v45 forPersonID:v46];

      objc_super v7 = v89;
      id v5 = v81;
      v22 = v84;
      id v3 = v79;
    }
    if (v4) {
      [v7 setCloudRelationshipState:v4];
    }
    uint64_t v47 = [v2 objectForKey:@"album-name"];
    if (v47) {
      [v7 setTitle:v47];
    }
    v80 = (void *)v47;
    uint64_t v48 = [v2 objectForKey:@"album-metadata"];
    if (v48) {
      [v7 setCloudMetadata:v48];
    }
    v78 = (void *)v48;
    v49 = [v2 objectForKey:@"album-isPublic"];
    if (v49)
    {
      [v7 setCloudPublicURLEnabled:v49];
      [v7 setCloudPublicURLEnabledLocal:v49];
      v50 = [v2 objectForKey:@"album-publicURLString"];
      if (v50) {
        [v7 setPublicURL:v50];
      }
    }
    int v51 = [v7 cloudRelationshipStateValue];
    v87 = [v2 objectForKey:@"album-allowsMultipleContributors"];
    if (v87)
    {
      v52 = [v7 cloudMultipleContributorsEnabled];
      int v53 = [v52 BOOLValue];

      LODWORD(v52) = [v87 BOOLValue];
      [v7 setCloudMultipleContributorsEnabled:v87];
      [v7 setCloudMultipleContributorsEnabledLocal:v87];
      if (v53 != v52 && v51 == 2)
      {
        v54 = +[PLNotificationManager sharedManager];
        v55 = [v2 objectForKey:@"mstreamd-info"];
        [v54 noteMultipleContributorStatusChangedForAlbum:v7 mstreamdInfo:v55];
      }
    }
    v56 = [v2 objectForKey:@"album-isFamilySharedAlbum"];
    objc_msgSend(v7, "setCloudAlbumSubtype:", objc_msgSend(v56, "BOOLValue"));
    v57 = [v2 objectForKey:@"album-creationDate"];
    if (v57) {
      [v7 setCloudCreationDate:v57];
    }
    char v58 = [v7 isOwnedCloudSharedAlbum];
    v4 = v85;
    if (!v5 && (v58 & 1) == 0 && v51 == 1)
    {
      v59 = v49;
      [v7 setHasUnseenContentBoolValue:1];
      v60 = +[PLNotificationManager sharedManager];
      [v60 noteDidReceiveInvitationForSharedAlbum:v7];

      [v7 updateCloudLastInterestingChangeDateWithDate:v88];
      v61 = [v2 objectForKey:@"album-autoAcceptInvitation"];
      v62 = v61;
      if (v61 && [v61 BOOLValue])
      {
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke_84;
        v90[3] = &unk_1E5873440;
        id v91 = v7;
        +[PLPhotoSharingHelper acceptPendingInvitationForAlbum:v91 completionHandler:v90];
      }
      v49 = v59;
    }
    v63 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = [v7 cloudGUID];
      [v89 title];
      v82 = v49;
      v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v66 = [v89 isOwned];
      [v89 cloudPublicURLEnabled];
      v67 = v76 = v56;
      [v89 cloudRelationshipState];
      v69 = v68 = v3;
      int v70 = [v69 intValue];
      *(_DWORD *)buf = 138413314;
      v97 = v64;
      __int16 v98 = 2112;
      v99 = v65;
      __int16 v100 = 2112;
      v101 = v66;
      __int16 v102 = 2112;
      v103 = v67;
      __int16 v104 = 1024;
      LODWORD(v105) = v70;
      _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_DEFAULT, "PLCloudSharedUpdateAlbumMetadataJob finished processing album GUID:%@ title:%@ isOwned:%@ isPublic:%@ relationshipState:%i", buf, 0x30u);

      id v3 = v68;
      v4 = v85;

      v56 = v76;
      v22 = v84;

      v49 = v82;
      objc_super v7 = v89;
    }

    [v7 persistRecoveryMetadata];
  }
  else
  {
    v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "ERROR: PLCloudSharedUpdateAlbumMetadataJob didn't get an album-guid in arguments, ignoring request", buf, 2u);
    }
  }
LABEL_75:
}

void __52__PLCloudSharedUpdateAlbumMetadataJob_runDaemonSide__block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Automatically accepted invitation for album %@ error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (int64_t)daemonOperation
{
  return 3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PLCloudSharedUpdateAlbumMetadataJob;
  id v3 = [(PLDaemonJob *)&v7 description];
  v4 = [(PLCloudSharedUpdateAlbumMetadataJob *)self metadata];
  uint64_t v5 = [v3 stringByAppendingFormat:@" metadata %@", v4];

  return v5;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLCloudSharedUpdateAlbumMetadataJob;
  id v7 = [(PLCloudSharingJob *)&v13 initFromXPCObject:v6 libraryServicesManager:a4];
  __int16 v8 = v7;
  if (v7)
  {
    id v9 = [v7 _argumentsDictionaryFromXPCEvent:v6];
    if (!v9)
    {
      uint64_t v10 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "ERROR: PLCloudSharedUpdateAlbumMetadataJob couldn't get arguments from xpc event", buf, 2u);
      }
    }
    v11 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "PLCloudSharedUpdateAlbumMetadataJob got arguments dictionary %@", buf, 0xCu);
    }

    [v8 setMetadata:v9];
  }

  return v8;
}

- (void)encodeToXPCObject:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLCloudSharedUpdateAlbumMetadataJob;
  [(PLDaemonJob *)&v10 encodeToXPCObject:v4];
  uint64_t v5 = [(PLCloudSharedUpdateAlbumMetadataJob *)self metadata];
  if ([v5 count])
  {
    id v6 = (void *)MEMORY[0x19F38D3B0]();
    id v7 = [(PLCloudSharedUpdateAlbumMetadataJob *)self _argumentsDictionaryAsData:v5];
    __int16 v8 = v7;
    if (v7)
    {
      id v9 = v7;
      xpc_dictionary_set_data(v4, "arguments-dictionary", (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    }
    else
    {
      NSLog(&cfstr_ErrorPlcloudsh_1.isa);
    }
  }
}

+ (void)updateAlbumMetadata:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 setMetadata:v3];

  [v4 runAndWaitForMessageToBeSent];
}

@end