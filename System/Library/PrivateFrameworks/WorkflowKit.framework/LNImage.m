@interface LNImage
@end

@implementation LNImage

void __58__LNImage_Workflow__spotlightIconWithParameterIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v7 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[LNImage(Workflow) spotlightIconWithParameterIdentifier:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to retrieve INImage file URL with error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __41__LNImage_Workflow__contextualActionIcon__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 _imageData];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

void __29__LNImage_Workflow__wf_image__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end