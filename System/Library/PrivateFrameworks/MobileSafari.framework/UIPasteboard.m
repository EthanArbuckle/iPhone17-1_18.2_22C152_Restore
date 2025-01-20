@interface UIPasteboard
@end

@implementation UIPasteboard

void __88__UIPasteboard_MobileSafariFrameworkExtras___safari_copyRichText_withPlainTextFallback___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 length];
  uint64_t v11 = *MEMORY[0x1E4FB06D8];
  v12[0] = *MEMORY[0x1E4FB0750];
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = 0;
  v7 = objc_msgSend(v4, "dataFromRange:documentAttributes:error:", 0, v5, v6, &v10);
  id v8 = v10;

  if (!v7)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __88__UIPasteboard_MobileSafariFrameworkExtras___safari_copyRichText_withPlainTextFallback___block_invoke_cold_1(v9, v8);
    }
  }
  v3[2](v3, v7, v8);
}

void __88__UIPasteboard_MobileSafariFrameworkExtras___safari_copyRichText_withPlainTextFallback___block_invoke_5(uint64_t a1, void (**a2)(void, void, void))
{
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  id v5 = [v3 dataUsingEncoding:4];
  ((void (**)(void, id, void))a2)[2](v4, v5, 0);
}

void __88__UIPasteboard_MobileSafariFrameworkExtras___safari_copyRichText_withPlainTextFallback___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_18C354000, v3, OS_LOG_TYPE_ERROR, "Failed to generate RTF data: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end