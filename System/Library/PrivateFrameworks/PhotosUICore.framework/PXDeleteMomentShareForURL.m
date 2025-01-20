@interface PXDeleteMomentShareForURL
@end

@implementation PXDeleteMomentShareForURL

void ___PXDeleteMomentShareForURL_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLSharingGetLog();
  v7 = v6;
  if (a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = objc_msgSend(*(id *)(a1 + 40), "pl_redactedShareURL");
    int v16 = 138412546;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    v19 = v9;
    v10 = "Did %@ moment share for URL: %{public}@";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    v9 = objc_msgSend(*(id *)(a1 + 40), "pl_redactedShareURL");
    int v16 = 138412802;
    uint64_t v17 = v14;
    __int16 v18 = 2114;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v5;
    v10 = "Failed to %@ moment share for URL: %{public}@, error: %@";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
  }
  _os_log_impl(&dword_1A9AE7000, v11, v12, v10, (uint8_t *)&v16, v13);

LABEL_7:
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a2, v5);
  }
}

@end