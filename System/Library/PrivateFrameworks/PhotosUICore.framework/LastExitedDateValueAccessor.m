@interface LastExitedDateValueAccessor
@end

@implementation LastExitedDateValueAccessor

void ___LastExitedDateValueAccessor_block_invoke()
{
  v0 = [PXUbiquitousKeyValueStoreValueAccessor alloc];
  id v3 = [MEMORY[0x1E4F29130] defaultStore];
  uint64_t v1 = [(PXUbiquitousKeyValueStoreValueAccessor *)v0 initWithUbiquitousKeyValueStore:v3 key:@"PXForYouLastExitedDateKey" defaultValueFuture:&__block_literal_global_8_225940 valueFilter:&__block_literal_global_12_225941 changeHandler:&__block_literal_global_15_225942];
  v2 = (void *)_LastExitedDateValueAccessor_lastExitedDateAccessor;
  _LastExitedDateValueAccessor_lastExitedDateAccessor = v1;
}

void ___LastExitedDateValueAccessor_block_invoke_4(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  v4 = [v2 defaultCenter];
  v6 = @"PXForYouLastExitedDateKey";
  v7[0] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [v4 postNotificationName:@"PXForYouLastExitedDateChangeNotification" object:0 userInfo:v5];
}

BOOL ___LastExitedDateValueAccessor_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:") == -1;
}

uint64_t ___LastExitedDateValueAccessor_block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

@end