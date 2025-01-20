@interface PXDeleteMomentShares
@end

@implementation PXDeleteMomentShares

uint64_t ___PXDeleteMomentShares_block_invoke_453(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [MEMORY[0x1E4F391B8] expungeMomentShares:v1];
  }
  else {
    return [MEMORY[0x1E4F391B8] trashMomentShares:v1];
  }
}

void ___PXDeleteMomentShares_block_invoke_2_454(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = PLSharingGetLog();
  v7 = v6;
  if (a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    int v17 = 138412546;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    v10 = "Did %@ moment share(s) with uuids: %@";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v14 = a1[4];
    uint64_t v15 = a1[5];
    int v17 = 138412802;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    __int16 v21 = 2112;
    id v22 = v5;
    v10 = "Failed to %@ moment share(s) with uuids: %@, error: %@";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
  }
  _os_log_impl(&dword_1A9AE7000, v11, v12, v10, (uint8_t *)&v17, v13);
LABEL_7:

  uint64_t v16 = a1[6];
  if (v16) {
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);
  }
}

id ___PXDeleteMomentShares_block_invoke_2(int a1, id a2)
{
  return a2;
}

uint64_t ___PXDeleteMomentShares_block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

@end