@interface NSFileManager
@end

@implementation NSFileManager

void __68__NSFileManager_RCAdditions__rc_moveToTempAndMarkAsPurgeable_error___block_invoke(uint64_t a1)
{
  v2 = (void *)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  id v6 = 0;
  BOOL v3 = _RCCleanUpURL(v1, &v6);
  id v4 = v6;
  if (!v3)
  {
    v5 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__NSFileManager_RCAdditions__rc_moveToTempAndMarkAsPurgeable_error___block_invoke_cold_1(v2, (uint64_t)v4, v5);
    }
  }
}

uint64_t __58__NSFileManager_RCAdditions__rc_cleanUpTemporaryDirectory__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 lastPathComponent];
  uint64_t v3 = [v2 isEqualToString:@"voicememos-purgeable"] ^ 1;

  return v3;
}

uint64_t __58__NSFileManager_RCAdditions__rc_cleanUpAssetsInDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __58__NSFileManager_RCAdditions__rc_cleanUpAssetsInDirectory___block_invoke_cold_1();
  }

  return 1;
}

void __68__NSFileManager_RCAdditions__rc_moveToTempAndMarkAsPurgeable_error___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[NSFileManager(RCAdditions) rc_moveToTempAndMarkAsPurgeable:error:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_4(&dword_1C3964000, a2, a3, "%s -- Failed to mark directory as purgeable, url = %@, error = %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void __58__NSFileManager_RCAdditions__rc_cleanUpAssetsInDirectory___block_invoke_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_1C3964000, v0, v1, "%s -- enumeratorAtURL error %@ url %@", v2);
}

@end