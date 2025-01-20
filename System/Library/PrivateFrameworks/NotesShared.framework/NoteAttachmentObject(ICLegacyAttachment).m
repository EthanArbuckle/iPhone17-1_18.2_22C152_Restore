@interface NoteAttachmentObject(ICLegacyAttachment)
- (id)cidURL;
- (id)fileURL;
- (id)identifier;
- (id)title;
- (id)typeUTI;
- (uint64_t)isDeletedOrInTrash;
- (uint64_t)isHiddenFromIndexing;
- (void)fileURL;
@end

@implementation NoteAttachmentObject(ICLegacyAttachment)

- (id)identifier
{
  v1 = [a1 contentID];
  v2 = objc_msgSend(v1, "ic_md5");

  return v2;
}

- (id)title
{
  v1 = [a1 fileURL];
  v2 = [v1 lastPathComponent];

  return v2;
}

- (id)fileURL
{
  id v5 = 0;
  v1 = [a1 attachmentDataFileURLWithError:&v5];
  id v2 = v5;
  if (v2)
  {
    v3 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(NoteAttachmentObject(ICLegacyAttachment) *)(uint64_t)v2 fileURL];
    }
  }
  return v1;
}

- (id)typeUTI
{
  id v2 = [a1 fileURL];
  v3 = [a1 mimeType];
  v4 = +[ICLegacyAttachmentUtilities typeUTIFromFileURL:v2 mimeType:v3];

  return v4;
}

- (id)cidURL
{
  id v2 = [a1 contentID];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CB10];
    id v5 = NSString;
    v6 = [a1 contentID];
    v7 = [v5 stringWithFormat:@"cid:%@", v6];
    v8 = [v4 URLWithString:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)isDeletedOrInTrash
{
  if ([a1 isDeleted]) {
    return 1;
  }
  uint64_t v3 = [a1 note];
  uint64_t v4 = [v3 isDeletedOrInTrash];

  return v4;
}

- (uint64_t)isHiddenFromIndexing
{
  id v2 = [a1 note];
  if (v2)
  {
    uint64_t v3 = [a1 note];
    uint64_t v4 = [v3 isHiddenFromIndexing];
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

- (void)fileURL
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Error getting legacy attachment file URL: %@", (uint8_t *)&v2, 0xCu);
}

@end