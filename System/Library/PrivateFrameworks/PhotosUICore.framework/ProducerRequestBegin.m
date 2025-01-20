@interface ProducerRequestBegin
@end

@implementation ProducerRequestBegin

void ___ProducerRequestBegin_block_invoke(uint64_t a1, char a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if ((a2 & 1) == 0 && WeakRetained)
  {
    v6 = PLStoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 136446722;
      uint64_t v9 = v7;
      __int16 v10 = 2048;
      uint64_t v11 = 0x4024000000000000;
      __int16 v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Invalid story component attributes change (%@ -> %@)", (uint8_t *)&v8, 0x20u);
    }
  }
}

@end