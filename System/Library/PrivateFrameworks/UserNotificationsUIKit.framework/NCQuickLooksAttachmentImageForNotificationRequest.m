@interface NCQuickLooksAttachmentImageForNotificationRequest
@end

@implementation NCQuickLooksAttachmentImageForNotificationRequest

void ___NCQuickLooksAttachmentImageForNotificationRequest_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.usernotifications.thumbnailgenerator", 0);
  v1 = (void *)_NCQuickLooksAttachmentImageForNotificationRequest___thumbnailGeneratorTimeoutQueue;
  _NCQuickLooksAttachmentImageForNotificationRequest___thumbnailGeneratorTimeoutQueue = (uint64_t)v0;
}

void ___NCQuickLooksAttachmentImageForNotificationRequest_block_invoke_2(void *a1)
{
  if (!*(void *)(*(void *)(a1[5] + 8) + 40) && !*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v2 = *MEMORY[0x1E4FB3760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D7C04000, v2, OS_LOG_TYPE_DEFAULT, "Thumbnail generation timed out, cancelling generation", v4, 2u);
    }
    v3 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
    [v3 cancelRequest:a1[4]];
  }
}

void ___NCQuickLooksAttachmentImageForNotificationRequest_block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  v8 = *MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "Thumbnail generation completed: representation=%{public}@, error=%{public}@", (uint8_t *)&v11, 0x16u);
  }
}

@end