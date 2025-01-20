@interface PSFeedback
@end

@implementation PSFeedback

uint64_t __28___PSFeedback_donateToBiome__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

id __28___PSFeedback_donateToBiome__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (v3)
  {
    v4 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __28___PSFeedback_donateToBiome__block_invoke_2_cold_1((uint64_t)v3, v4);
    }
  }

  return v2;
}

void __28___PSFeedback_donateToBiome__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error converting NSDictionary to NSData: %@", (uint8_t *)&v2, 0xCu);
}

@end