@interface ML3MultiUserDaemonAccountChangeOperation
@end

@implementation ML3MultiUserDaemonAccountChangeOperation

void __52___ML3MultiUserDaemonAccountChangeOperation_execute__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) finish];
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Active account changed - Database path change is complete: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

@end