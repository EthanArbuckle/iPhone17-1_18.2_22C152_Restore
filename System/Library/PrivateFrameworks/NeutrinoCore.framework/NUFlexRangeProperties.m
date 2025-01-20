@interface NUFlexRangeProperties
@end

@implementation NUFlexRangeProperties

id __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [NSString stringWithFormat:@"%@:%@", @"HDRToneMap", a2];
  v4 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 32), 0, v3);
  v5 = v4;
  if (v4) {
    v6 = (void *)CGImageMetadataTagCopyValue(v4);
  }
  else {
    v6 = 0;
  }

  return v6;
}

float __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v4 floatValue];
    float v6 = v5;
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
    }
    v7 = (void *)_NULogger;
    float v6 = 0.0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      id v9 = v3;
      v10 = v7;
      uint64_t v11 = [v9 UTF8String];
      id v12 = [v4 description];
      int v13 = 136315394;
      uint64_t v14 = v11;
      __int16 v15 = 2080;
      uint64_t v16 = [v12 UTF8String];
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Invalid '%s' tag value: %s", (uint8_t *)&v13, 0x16u);
    }
  }

  return v6;
}

uint64_t __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_378(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  float v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      a3 = [v6 BOOLValue];
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
      }
      v7 = (void *)_NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        id v9 = v5;
        v10 = v7;
        uint64_t v11 = [v9 UTF8String];
        id v12 = [v6 description];
        int v13 = 136315394;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        uint64_t v16 = [v12 UTF8String];
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Invalid '%s' tag value: %s", (uint8_t *)&v13, 0x16u);
      }
    }
  }

  return a3;
}

id __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_380(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
    }
    float v6 = (void *)_NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      id v8 = v3;
      id v9 = v6;
      uint64_t v10 = [v8 UTF8String];
      id v11 = [v4 description];
      int v12 = 136315394;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      uint64_t v15 = [v11 UTF8String];
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Invalid '%s' tag value: %s", (uint8_t *)&v12, 0x16u);
    }
    id v5 = 0;
  }

  return v5;
}

float __65___NUFlexRangeProperties_flexRangePropertiesWithGainMapMetadata___block_invoke_383(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = [NSString stringWithFormat:@"%@[%lu].%@", @"ChannelMetadata", a3, a2];
  float v5 = (*(float (**)(void))(*(void *)(a1 + 32) + 16))();

  return v5;
}

@end