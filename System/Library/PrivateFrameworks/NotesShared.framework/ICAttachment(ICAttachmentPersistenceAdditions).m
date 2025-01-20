@interface ICAttachment(ICAttachmentPersistenceAdditions)
@end

@implementation ICAttachment(ICAttachmentPersistenceAdditions)

- (void)loadFromArchive:()ICAttachmentPersistenceAdditions dataPersister:withIdentifierMap:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Error creating unarchiver: %@", (uint8_t *)&v2, 0xCu);
}

- (void)saveToArchive:()ICAttachmentPersistenceAdditions dataPersister:stripImageMarkupMetadata:error:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Failed to archive PaperKit bundle (%@) at: %@", buf, 0x16u);
}

- (void)saveToArchive:()ICAttachmentPersistenceAdditions dataPersister:stripImageMarkupMetadata:error:.cold.2(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Media (%@) has no data when archiving", buf, 0xCu);
}

- (void)saveToArchive:()ICAttachmentPersistenceAdditions dataPersister:stripImageMarkupMetadata:error:.cold.3(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Media (%@) has no filename when archiving — falling back to identifier", buf, 0xCu);
}

@end