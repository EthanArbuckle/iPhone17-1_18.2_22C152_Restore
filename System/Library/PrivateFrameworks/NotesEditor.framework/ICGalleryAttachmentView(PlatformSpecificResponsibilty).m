@interface ICGalleryAttachmentView(PlatformSpecificResponsibilty)
@end

@implementation ICGalleryAttachmentView(PlatformSpecificResponsibilty)

- (void)collectionView:()PlatformSpecificResponsibilty cellForItemAtIndexPath:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [a2 subAttachmentItems];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = [v5 count];
  _os_log_error_impl(&dword_20BE60000, a3, OS_LOG_TYPE_ERROR, "Collection view cell out of bounds: %@ (%ld)", (uint8_t *)&v6, 0x16u);
}

@end