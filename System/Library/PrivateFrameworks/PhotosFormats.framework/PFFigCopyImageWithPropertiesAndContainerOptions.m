@interface PFFigCopyImageWithPropertiesAndContainerOptions
@end

@implementation PFFigCopyImageWithPropertiesAndContainerOptions

uint64_t ___PFFigCopyImageWithPropertiesAndContainerOptions_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = (void (**)(id, void *))*(id *)(a1 + 32);
    v4 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F56010]];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (!v5) {
      goto LABEL_19;
    }
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = *MEMORY[0x1E4F56018];
    *(void *)&long long v6 = 67109120;
    long long v17 = v6;
    uint64_t v18 = *MEMORY[0x1E4F56018];
    uint64_t v19 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v4, "count", v17) < 2)
        {
          v12 = 0;
        }
        else
        {
          v12 = [v11 objectForKeyedSubscript:v9];
          if (!v12) {
            continue;
          }
        }
        v13 = v3[2](v3, v12);
        if (v13)
        {
          int DataFromMetadata = CGImageCreateDataFromMetadata();
          if (DataFromMetadata)
          {
            int v15 = DataFromMetadata;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              int v25 = v15;
              _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Non-success status %d from CGImageCreateDataFromMetadata()", buf, 8u);
            }
          }
          else
          {

            uint64_t v9 = v18;
            uint64_t v8 = v19;
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (!v7)
      {
LABEL_19:

        return 0;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v26 = 0;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected nil container description", v26, 2u);
  }
  return 0xFFFFFFFFLL;
}

@end