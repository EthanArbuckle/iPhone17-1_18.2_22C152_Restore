@interface PAS
@end

@implementation PAS

void ___PAS_sqlite3_bind_nsstring_block_invoke(uint64_t a1)
{
}

uint64_t ___PAS_sqlite3_column_nsdata_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a2 length:a3];
    }
    else
    {
      uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
      id v4 = &unk_1EC36FFC0;
      *(void *)(v3 + 40) = &unk_1EC36FFC0;
    }
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

void ___PAS_sqlite3_bind_nsdata_block_invoke(uint64_t a1)
{
}

void ___PAS_sqlite3_column_nssecurecoding_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2 && a3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
    v5 = (void *)MEMORY[0x1A62450A0]();
    uint64_t v6 = *(void *)(a1 + 32);
    id v11 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v4 error:&v11];
    id v8 = v11;
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Can not unarchive data: %@", buf, 0xCu);
    }
  }
}

@end