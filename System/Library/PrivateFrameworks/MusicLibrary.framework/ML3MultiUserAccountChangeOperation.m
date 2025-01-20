@interface ML3MultiUserAccountChangeOperation
@end

@implementation ML3MultiUserAccountChangeOperation

void __46___ML3MultiUserAccountChangeOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "_ML3MultiUserAccountChangeOperation %p - Finished operation", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) finishWithError:v4];
}

@end