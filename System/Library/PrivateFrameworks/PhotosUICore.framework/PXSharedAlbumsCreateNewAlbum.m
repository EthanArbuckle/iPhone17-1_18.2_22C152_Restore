@interface PXSharedAlbumsCreateNewAlbum
@end

@implementation PXSharedAlbumsCreateNewAlbum

void ___PXSharedAlbumsCreateNewAlbum_block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F38FE8] creationRequestForCloudSharedAlbumWithTitle:*(void *)(a1 + 32)];
  v3 = [v2 placeholderForCreatedCloudSharedAlbum];
  uint64_t v4 = [v3 localIdentifier];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = [MEMORY[0x1E4F8AAB0] sharingFirstName];
  [v2 setCloudOwnerFirstName:v7];

  v8 = [MEMORY[0x1E4F8AAB0] sharingLastName];
  [v2 setCloudOwnerLastName:v8];

  v9 = [MEMORY[0x1E4F8AAB0] sharingDisplayNameIncludingEmail:0 allowsEmail:1];
  [v2 setCloudOwnerFullName:v9];

  v10 = [MEMORY[0x1E4F8AAB0] sharingUsername];
  [v2 setCloudOwnerEmail:v10];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v35 = a1;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v37;
    *(void *)&long long v13 = 138412546;
    long long v34 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "suggestedTransport", v34);
        uint64_t v19 = [v18 addressKind];

        if (v19 == 1)
        {
          v20 = [v17 emailAddressString];
          if (v20)
          {
            v21 = [v17 firstName];
            v22 = [v17 lastName];
            v23 = [v17 displayName];
            v45 = v20;
            v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
            [v2 addInvitationRecordWithFirstName:v21 lastName:v22 fullName:v23 emails:v24 phones:0];

            goto LABEL_12;
          }
          v21 = PLSharedAlbumsGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = *(void *)(v35 + 32);
            *(_DWORD *)buf = v34;
            v42 = v17;
            __int16 v43 = 2112;
            uint64_t v44 = v30;
            v31 = v21;
            v32 = "Will not invite %@ to shared album %@: Empty email address.";
            goto LABEL_19;
          }
          goto LABEL_20;
        }
        v25 = [v17 suggestedTransport];
        uint64_t v26 = [v25 addressKind];

        if (v26 == 2)
        {
          v20 = [v17 phoneNumberString];
          if (v20)
          {
            v21 = [v17 firstName];
            v22 = [v17 lastName];
            v27 = [v17 displayName];
            v40 = v20;
            v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
            [v2 addInvitationRecordWithFirstName:v21 lastName:v22 fullName:v27 emails:0 phones:v28];

LABEL_12:
          }
          else
          {
            v21 = PLSharedAlbumsGetLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              uint64_t v33 = *(void *)(v35 + 32);
              *(_DWORD *)buf = v34;
              v42 = v17;
              __int16 v43 = 2112;
              uint64_t v44 = v33;
              v31 = v21;
              v32 = "Will not invite %@ to shared album %@: Empty phone number.";
LABEL_19:
              _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
            }
          }
LABEL_20:

          goto LABEL_21;
        }
        v20 = PLSharedAlbumsGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = *(void *)(v35 + 32);
          *(_DWORD *)buf = v34;
          v42 = v17;
          __int16 v43 = 2112;
          uint64_t v44 = v29;
          _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "Will not invite %@ to shared album %@: Invalid recipient type.", buf, 0x16u);
        }
LABEL_21:
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v14);
  }

  PXSharedAlbumsRecordRecentInvitationRecipients(*(void **)(v35 + 40));
}

void ___PXSharedAlbumsCreateNewAlbum_block_invoke_329(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  a1[4];
  a1[5];
  a1[6];
  id v5 = v4;
  px_dispatch_on_main_queue();
}

void ___PXSharedAlbumsCreateNewAlbum_block_invoke_2(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 72);
  v3 = PLSharedAlbumsGetLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      int v21 = 138412290;
      v22 = v5;
    }

    v6 = (void *)MEMORY[0x1E4F38EE8];
    v25[0] = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    v8 = [*(id *)(a1 + 40) librarySpecificFetchOptions];
    v9 = [v6 fetchAssetCollectionsWithLocalIdentifiers:v7 options:v8];

    if ([v9 count] == 1)
    {
      v10 = [v9 firstObject];
      id v11 = PLSharedAlbumsGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v10 uuid];
        int v21 = 138543362;
        v22 = v12;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Successfully created shared album with UUID=%{public}@", (uint8_t *)&v21, 0xCu);
      }
      uint64_t v13 = *(void *)(a1 + 56);
      if (!v13) {
        goto LABEL_18;
      }
      uint64_t v14 = *(void (**)(void))(v13 + 16);
    }
    else
    {
      v18 = PLSharedAlbumsGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void **)(a1 + 32);
        int v21 = 138412290;
        v22 = v19;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "Failed to fetch shared album with name '%@' after creation.", (uint8_t *)&v21, 0xCu);
      }

      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXSharedAlbumsErrorDomain" code:-1 userInfo:0];
      uint64_t v20 = *(void *)(a1 + 56);
      if (!v20) {
        goto LABEL_18;
      }
      uint64_t v14 = *(void (**)(void))(v20 + 16);
    }
    v14();
LABEL_18:

    return;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 48);
    int v21 = 138412546;
    v22 = v15;
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Failed to create shared album with name '%@'. Error = %@", (uint8_t *)&v21, 0x16u);
  }

  uint64_t v17 = *(void *)(a1 + 56);
  if (v17) {
    (*(void (**)(uint64_t, void, void))(v17 + 16))(v17, 0, *(void *)(a1 + 48));
  }
}

@end