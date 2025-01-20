@interface HandleSharedLibraryOrInvitationURL
@end

@implementation HandleSharedLibraryOrInvitationURL

uint64_t ___HandleSharedLibraryOrInvitationURL_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void ___HandleSharedLibraryOrInvitationURL_block_invoke_647(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v2 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Handle URL", v5, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    v4 = PXSharedLibraryUserCanceledErrorWithDebugDescription(@"Handle URL");
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

void ___HandleSharedLibraryOrInvitationURL_block_invoke_654(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    v7 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = ___HandleSharedLibraryOrInvitationURL_block_invoke_2;
    v9[3] = &unk_1E5DAF980;
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    id v15 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 80);
    id v16 = *(id *)(a1 + 72);
    id v17 = v6;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v7, v8, v9);
  }
}

void ___HandleSharedLibraryOrInvitationURL_block_invoke_2(uint64_t a1)
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      id v5 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2112;
      v94 = v5;
      _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Did fetch Shared Library: %@ for URL: %@", buf, 0x20u);
    }

    id v6 = *(void **)(a1 + 64);
    v7 = *(void **)(a1 + 72);
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    id v10 = *(void **)(a1 + 96);
    id v11 = *(id *)(a1 + 56);
    id v12 = v8;
    id v13 = v6;
    id v14 = v7;
    id v15 = v9;
    id v82 = v10;
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (v12)
    {
      if (v14)
      {
LABEL_6:
        if (![v15 length])
        {
          v79 = [MEMORY[0x1E4F28B00] currentHandler];
          v80 = objc_msgSend(NSString, "stringWithUTF8String:", "void _HandleFetchedSharedLibraryInvitation(PXSharedLibraryStatusProvider *__strong, __strong id<PXSharedLibrary>, PXSharedLibraryLegacyDevicesFallbackMonitor * _Nullable __strong, __strong id<PXPresentationEnvironment>, NSString *__strong, void (^ _Nullable __strong)(BOOL, NSError * _Nullable __strong))");
          [v79 handleFailureInFunction:v80, @"PXSharedLibraryUtilities.m", 1430, @"Invalid parameter not satisfying: %@", @"senderIdentifier.length" file lineNumber description];
        }
        id v16 = v11;
        id v17 = v15;
        id v18 = PLSharedLibraryGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v17;
          _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Will perform preconditions check for presenting Shared Library invitation", buf, 0xCu);
        }

        v19 = +[PXSharedLibrarySettings sharedInstance];
        v20 = [v16 fetchExiting];

        uint64_t v21 = [v19 simulateErrorType];
        uint64_t v22 = v21;
        if (v20 || v21 == 14)
        {
          v40 = PLSharedLibraryGetLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = &stru_1F00B0030;
            if (v22 == 14) {
              v41 = @"(Simulated)";
            }
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v41;
            _os_log_impl(&dword_1A9AE7000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Failed preconditions check for presenting Shared Library invitation: Shared Library Exiting %{public}@", buf, 0x16u);
          }

          PXLocalizedSharedLibraryString(@"PXSharedLibrary_InvitationAlertTitle_IsExiting");
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          PXLocalizedSharedLibraryString(@"PXSharedLibrary_InvitationAlertMessage_IsExiting");
          id v33 = (id)objc_claimAutoreleasedReturnValue();
          char v29 = 0;
        }
        else
        {
          id v81 = v12;
          id v23 = v14;
          id v24 = v13;
          v25 = [v16 fetchSharedLibrary];
          uint64_t v26 = [v19 simulateErrorType];
          uint64_t v27 = v26;
          if (v25) {
            BOOL v28 = 1;
          }
          else {
            BOOL v28 = v26 == 15;
          }
          char v29 = !v28;
          v30 = PLSharedLibraryGetLog();
          v31 = v30;
          if (v29)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v17;
              _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully passed preconditions check for presenting Shared Library invitation", buf, 0xCu);
            }
            id v32 = 0;
            id v33 = 0;
          }
          else
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v51 = @"(Simulated)";
              if (v27 != 15) {
                v51 = &stru_1F00B0030;
              }
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v51;
              _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed preconditions check for presenting Shared Library invitation: Participates in Shared Library %{public}@", buf, 0x16u);
            }

            PXLocalizedSharedLibraryString(@"PXSharedLibrary_InvitationAlertTitle_HasSharedLibrary_iOS");
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            v31 = [v25 owner];
            if ([v31 isCurrentUser]) {
              v52 = @"PXSharedLibrary_Owner_InvitationAlertMessage_HasSharedLibrary";
            }
            else {
              v52 = @"PXSharedLibrary_Participant_InvitationAlertMessage_HasSharedLibrary";
            }
            PXLocalizedSharedLibraryString(v52);
            id v33 = objc_claimAutoreleasedReturnValue();
          }
          id v13 = v24;
          id v14 = v23;
          id v12 = v81;
        }

        id v53 = v32;
        id v54 = v33;
        if (v29)
        {
          v55 = v82;
          if ([v12 isDeclined])
          {
            v56 = PLSharedLibraryGetLog();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v12;
              _os_log_impl(&dword_1A9AE7000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: Will confirm restore of declined Shared Library invitation: %@", buf, 0x16u);
            }

            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = ___HandleFetchedSharedLibraryInvitation_block_invoke_685;
            v94 = &unk_1E5DAF9F8;
            id v95 = v17;
            id v96 = v12;
            id v97 = v16;
            id v98 = v13;
            id v57 = v14;
            id v99 = v57;
            id v100 = v82;
            v58 = buf;
            v91[0] = MEMORY[0x1E4F143A8];
            v91[1] = 3221225472;
            v91[2] = ___ConfirmRestoringInvitation_block_invoke;
            v91[3] = &unk_1E5DB6ED0;
            id v92 = v58;
            id v59 = (id)[v57 presentAlertWithConfigurationHandler:v91];
          }
          else
          {
            _ViewInvitation(v16, v12, v13, v14, v17, v82);
          }
        }
        else
        {
          v60 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:underlyingError:debugDescription:", @"PXSharedLibraryErrorDomain", -1000, 0, @"%@", v53);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = ___HandleFetchedSharedLibraryInvitation_block_invoke;
          v94 = &unk_1E5DD3280;
          v55 = v82;
          id v61 = v82;
          id v95 = v60;
          id v96 = v61;
          id v62 = v60;
          PXPresentFailureWithLocalizedTitle(v53, v54, 0, v62, v14, buf);
        }
        return;
      }
    }
    else
    {
      v75 = [MEMORY[0x1E4F28B00] currentHandler];
      v76 = objc_msgSend(NSString, "stringWithUTF8String:", "void _HandleFetchedSharedLibraryInvitation(PXSharedLibraryStatusProvider *__strong, __strong id<PXSharedLibrary>, PXSharedLibraryLegacyDevicesFallbackMonitor * _Nullable __strong, __strong id<PXPresentationEnvironment>, NSString *__strong, void (^ _Nullable __strong)(BOOL, NSError * _Nullable __strong))");
      [v75 handleFailureInFunction:v76, @"PXSharedLibraryUtilities.m", 1428, @"Invalid parameter not satisfying: %@", @"invitation" file lineNumber description];

      if (v14) {
        goto LABEL_6;
      }
    }
    v77 = [MEMORY[0x1E4F28B00] currentHandler];
    v78 = objc_msgSend(NSString, "stringWithUTF8String:", "void _HandleFetchedSharedLibraryInvitation(PXSharedLibraryStatusProvider *__strong, __strong id<PXSharedLibrary>, PXSharedLibraryLegacyDevicesFallbackMonitor * _Nullable __strong, __strong id<PXPresentationEnvironment>, NSString *__strong, void (^ _Nullable __strong)(BOOL, NSError * _Nullable __strong))");
    [v77 handleFailureInFunction:v78, @"PXSharedLibraryUtilities.m", 1429, @"Invalid parameter not satisfying: %@", @"presentationEnvironment" file lineNumber description];

    goto LABEL_6;
  }
  if ([*(id *)(a1 + 80) isFailedToURLFetchOwnedSharedLibraryError:*(void *)(a1 + 88)])
  {
    v34 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v35 = *(void *)(a1 + 40);
      v37 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2112;
      v94 = v37;
      _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to URL fetch owned Shared Library: %@ for URL: %@", buf, 0x20u);
    }

    v38 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v39;
      _os_log_impl(&dword_1A9AE7000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: Will navigate to Shared Library preferences", buf, 0xCu);
    }

    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = ___HandleSharedLibraryOrInvitationURL_block_invoke_656;
    v88[3] = &unk_1E5DD2B90;
    id v89 = *(id *)(a1 + 40);
    id v90 = *(id *)(a1 + 96);
    +[PXSystemNavigation navigateToDestination:6 completion:v88];

    return;
  }
  int v42 = [*(id *)(a1 + 80) isSharedLibraryNotFoundError:*(void *)(a1 + 88)];
  v43 = PLSharedLibraryGetLog();
  v44 = v43;
  if (v42)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = *(void *)(a1 + 40);
      uint64_t v46 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v46;
      v47 = "%{public}@: No Shared Library for URL: %@";
      v48 = v44;
      os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
      uint32_t v50 = 22;
LABEL_55:
      _os_log_impl(&dword_1A9AE7000, v48, v49, v47, buf, v50);
    }
  }
  else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    uint64_t v63 = *(void *)(a1 + 40);
    uint64_t v64 = *(void *)(a1 + 48);
    v65 = *(void **)(a1 + 88);
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v63;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v64;
    *(_WORD *)&buf[22] = 2112;
    v94 = v65;
    v47 = "%{public}@: Failed to fetch Shared Library for URL: %@, error: %@";
    v48 = v44;
    os_log_type_t v49 = OS_LOG_TYPE_ERROR;
    uint32_t v50 = 32;
    goto LABEL_55;
  }

  v66 = *(void **)(a1 + 80);
  uint64_t v67 = *(void *)(a1 + 88);
  id v86 = 0;
  id v87 = 0;
  char v68 = [v66 presentCustomInformationForError:v67 customTitle:&v87 customMessage:&v86];
  id v69 = v87;
  id v70 = v86;
  if ((v68 & 1) == 0)
  {
    uint64_t v71 = PXLocalizedSharedLibraryString(@"PXSharedLibraryFetchInvitationFailureAlertTitle_Transient");

    uint64_t v72 = PXLocalizedSharedLibraryString(@"PXSharedLibraryGenericFailureAlertMessage");

    id v69 = (id)v71;
    id v70 = (id)v72;
  }
  v73 = *(void **)(a1 + 72);
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = ___HandleSharedLibraryOrInvitationURL_block_invoke_657;
  v83[3] = &unk_1E5DD3280;
  v74 = *(void **)(a1 + 88);
  id v85 = *(id *)(a1 + 96);
  id v84 = *(id *)(a1 + 88);
  PXPresentFailureWithLocalizedTitle(v69, v70, 0, v74, v73, v83);
}

void ___HandleSharedLibraryOrInvitationURL_block_invoke_656(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLSharedLibraryGetLog();
  v7 = v6;
  if (a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    int v15 = 138543362;
    uint64_t v16 = v8;
    v9 = "%{public}@: Did navigate to Shared Library preferences";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    int v15 = 138543618;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v5;
    v9 = "%{public}@: Failed to navigate to Shared Library preferences: %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
  }
  _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v15, v12);
LABEL_7:

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, void))(v14 + 16))(v14, 1, 0);
  }
}

uint64_t ___HandleSharedLibraryOrInvitationURL_block_invoke_657(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

@end