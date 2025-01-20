@interface ICQMegaBackupManager
@end

@implementation ICQMegaBackupManager

uint64_t __115___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __139___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_entryMethod_deepLinkURL_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _quotaBackupCheckURLForAccount:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 88);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v8 = [MEMORY[0x1E4F290E0] sharedSession];
    uint64_t v9 = *(void *)(a1 + 72);
    id v19 = 0;
    v10 = +[_ICQMegaBackupEligibilityRequest eligibilityRequestWithAccount:v3 deviceBackupUUID:v4 deviceTotalUsedSpaceInBytes:v6 entryMethod:v5 deepLinkURL:v7 requestURL:v2 URLSession:v8 queue:v9 error:&v19];
    id v11 = v19;

    v12 = _ICQGetLogSystem();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        v14 = [v10 bodyJSON];
        *(_DWORD *)buf = 138543362;
        id v21 = v14;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Body JSON for _ICQMegaBackupEligibilityRequest: %{public}@", buf, 0xCu);
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __139___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_entryMethod_deepLinkURL_queue_completion___block_invoke_37;
      v17[3] = &unk_1E6A52190;
      id v18 = *(id *)(a1 + 80);
      [v10 resumeWithCompletionHandler:v17];
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v11;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create eligibility request: %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
  }
  else
  {
    v15 = _ICQGetLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "No URL in bag for quotaBackupCheckURL", buf, 2u);
    }

    uint64_t v16 = *(void *)(a1 + 80);
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_ICQMegaBackupErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void, id))(v16 + 16))(v16, 0, 0, v11);
  }
}

void __139___ICQMegaBackupManager_requestMegaBackupForAccount_deviceBackupUUID_deviceTotalUsedSpaceInBytes_entryMethod_deepLinkURL_queue_completion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Calling completion for request %@ with error: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    [v5 isBackupAllowed];
    [v5 needsTemporaryStorage];
    v8 = [v5 daysUntilExpiration];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __99___ICQMegaBackupManager_updateMegaBackupStatusForAccount_deviceBackupUUID_status_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _updateStatusURLForAccount:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 72);
    id v6 = [MEMORY[0x1E4F290E0] sharedSession];
    uint64_t v7 = *(void *)(a1 + 56);
    id v15 = 0;
    v8 = +[_ICQMegaBackupUpdateStatusRequest updateStatusRequestWithAccount:v3 deviceBackupUUID:v4 status:v5 requestURL:v2 URLSession:v6 queue:v7 error:&v15];
    id v9 = v15;

    if (v8)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __99___ICQMegaBackupManager_updateMegaBackupStatusForAccount_deviceBackupUUID_status_queue_completion___block_invoke_43;
      v13[3] = &unk_1E6A521E0;
      id v14 = *(id *)(a1 + 64);
      [v8 resumeWithCompletionHandler:v13];
    }
    else
    {
      id v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v9;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create update status request: %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    id v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "No URL in bag for updateMegaBackupStatusURL", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 64);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_ICQMegaBackupErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void, id))(v11 + 16))(v11, 0, 0, v9);
  }
}

void __99___ICQMegaBackupManager_updateMegaBackupStatusForAccount_deviceBackupUUID_status_queue_completion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v5;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Calling completion for request %{public}@ with error: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = [v5 expirationDate];
    id v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Received new expiration date %{public}@", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __110___ICQMegaBackupManager_extendExpirationForAccount_deviceBackupUUID_requestedExpirationDate_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _extendExpirationURLForAccount:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [MEMORY[0x1E4F290E0] sharedSession];
    uint64_t v7 = *(void *)(a1 + 64);
    id v16 = 0;
    v8 = +[_ICQMegaBackupExtendExpirationRequest extendExpirationRequestWithAccount:v3 deviceBackupUUID:v4 requestedExpirationDate:v5 requestURL:v2 URLSession:v6 queue:v7 error:&v16];
    id v9 = v16;

    if (v8)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __110___ICQMegaBackupManager_extendExpirationForAccount_deviceBackupUUID_requestedExpirationDate_queue_completion___block_invoke_46;
      v13[3] = &unk_1E6A52230;
      id v15 = *(id *)(a1 + 72);
      id v14 = v8;
      [v14 resumeWithCompletionHandler:v13];
    }
    else
    {
      __int16 v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v9;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create extend expiration date request: %{public}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
  }
  else
  {
    int v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "No URL in bag for extendExpirationDateURL", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 72);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_ICQMegaBackupErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void, id))(v11 + 16))(v11, 0, 0, v9);
  }
}

void __110___ICQMegaBackupManager_extendExpirationForAccount_deviceBackupUUID_requestedExpirationDate_queue_completion___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Calling completion for request %@ with error: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = [v5 isExtensionAllowed];
    id v9 = [*(id *)(a1 + 32) updatedExpirationDate];
    int v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [NSNumber numberWithBool:v8];
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_1D5851000, v10, OS_LOG_TYPE_DEFAULT, "Server says extended expiration date is allowed (%{public}@) and updated expiration date is %{public}@", (uint8_t *)&v12, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end