@interface MRUnarchiveObjectForKey
@end

@implementation MRUnarchiveObjectForKey

id ___MRUnarchiveObjectForKey_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = MSVPropertyListDataClasses();
  v5 = [v4 setByAddingObjectsFromSet:*(void *)(a1 + 32)];

  id v10 = 0;
  v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v5 fromData:v3 error:&v10];

  id v7 = v10;
  if (v7)
  {
    v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ___MRUnarchiveObjectForKey_block_invoke_cold_1();
    }
  }

  return v6;
}

void ___MRUnarchiveObjectForKey_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRSerializationUtility] unarchive failed with error: %@", v2, v3, v4, v5, v6);
}

@end