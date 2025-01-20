@interface ICInlineAttachment(UI)
+ (BOOL)canInsertInlineAttachmentType:()UI intoNote:parentAttachment:;
+ (id)createHashtagAttachmentIfApplicableWithHashtagText:()UI creatingHashtagIfNecessary:note:parentAttachment:;
+ (id)createHashtagAttachmentIfApplicableWithHashtagText:()UI forHashtag:note:parentAttachment:;
+ (id)createInlineAttachmentIfApplicableWithTypeUTI:()UI altText:tokenContentIdentifier:note:parentAttachment:;
+ (id)createMentionAttachmentIfApplicableWithMentionText:()UI userRecordName:note:parentAttachment:;
+ (uint64_t)newLinkAttachmentToNote:()UI fromNote:parentAttachment:;
- (id)uiModel;
- (void)_announceAttachmentChangeWithString:()UI;
- (void)accessibilityAnnounceCreationWithVoiceOver;
- (void)accessibilityAnnounceDeletionWithVoiceOver;
@end

@implementation ICInlineAttachment(UI)

- (id)uiModel
{
  unsigned int v2 = [a1 attachmentType];
  if (v2 > 5) {
    v3 = 0;
  }
  else {
    v3 = (void *)[objc_alloc(*off_1E5FDBF08[v2]) initWithAttachment:a1];
  }
  return v3;
}

+ (id)createHashtagAttachmentIfApplicableWithHashtagText:()UI creatingHashtagIfNecessary:note:parentAttachment:
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([a1 canInsertInlineAttachmentType:1 intoNote:v11 parentAttachment:v12])
  {
    v13 = [MEMORY[0x1E4F29128] UUID];
    v14 = [v13 UUIDString];
    v15 = (void *)[a1 newHashtagAttachmentWithIdentifier:v14 hashtagText:v10 creatingHashtagIfNecessary:a4 note:v11 parentAttachment:v12];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)createHashtagAttachmentIfApplicableWithHashtagText:()UI forHashtag:note:parentAttachment:
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([a1 canInsertInlineAttachmentType:1 intoNote:v10 parentAttachment:v11])
  {
    id v12 = [MEMORY[0x1E4F29128] UUID];
    v13 = [v12 UUIDString];
    v14 = (void *)[a1 newHashtagAttachmentWithIdentifier:v13 forHashtag:v9 note:v10 parentAttachment:v11];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)createMentionAttachmentIfApplicableWithMentionText:()UI userRecordName:note:parentAttachment:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([a1 canInsertInlineAttachmentType:2 intoNote:v12 parentAttachment:v13])
  {
    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    v16 = (void *)[a1 newMentionAttachmentWithIdentifier:v15 mentionText:v10 userRecordName:v11 note:v12 parentAttachment:v13];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (uint64_t)newLinkAttachmentToNote:()UI fromNote:parentAttachment:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 canInsertInlineAttachmentType:3 intoNote:v9 parentAttachment:v10])
  {
    id v11 = [MEMORY[0x1E4F29128] UUID];
    id v12 = [v11 UUIDString];
    uint64_t v13 = [a1 newLinkAttachmentWithIdentifier:v12 toNote:v8 fromNote:v9 parentAttachment:v10];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)createInlineAttachmentIfApplicableWithTypeUTI:()UI altText:tokenContentIdentifier:note:parentAttachment:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([a1 canInsertInlineAttachmentType:0 intoNote:v15 parentAttachment:v16])
  {
    v17 = [MEMORY[0x1E4F29128] UUID];
    v18 = [v17 UUIDString];
    v19 = (void *)[a1 newAttachmentWithIdentifier:v18 typeUTI:v12 altText:v13 tokenContentIdentifier:v14 note:v15 parentAttachment:v16];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)canInsertInlineAttachmentType:()UI intoNote:parentAttachment:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (a3 > 5) {
    id v9 = 0;
  }
  else {
    id v9 = off_1E5FDBF38[a3];
  }
  BOOL v10 = v7 != 0;
  if (!v7)
  {
    id v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_INFO, "Rejected an attempt to insert %@ into a nil note", (uint8_t *)&v18, 0xCu);
    }
  }
  if ([v7 needsInitialFetchFromCloud])
  {
    id v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v7 shortLoggingDescription];
      int v18 = 138412546;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1B08EB000, v12, OS_LOG_TYPE_INFO, "Rejected an attempt to insert %@ into a placeholder note: %@", (uint8_t *)&v18, 0x16u);
    }
    BOOL v10 = 0;
  }
  if (v8 && [v8 needsInitialFetchFromCloud])
  {
    id v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v8 shortLoggingDescription];
      id v16 = [v7 shortLoggingDescription];
      int v18 = 138412802;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1B08EB000, v14, OS_LOG_TYPE_INFO, "Rejected an attempt to insert %@ into a placeholder attachment %@ in note: %@", (uint8_t *)&v18, 0x20u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)accessibilityAnnounceCreationWithVoiceOver
{
  if (![a1 _checkIsVoiceOverRunning]) {
    return;
  }
  if ([a1 isHashtagAttachment])
  {
    unsigned int v2 = (void *)MEMORY[0x1E4F83770];
    v3 = @"Inserted %@";
    goto LABEL_7;
  }
  if ([a1 isMentionAttachment])
  {
    unsigned int v2 = (void *)MEMORY[0x1E4F83770];
    v3 = @"Inserted mention %@";
LABEL_7:
    v4 = [v2 localizedFrameworkStringForKey:v3 value:v3 table:0 allowSiri:1];
    if (v4)
    {
      id v9 = v4;
      v5 = [a1 displayText];

      if (v5)
      {
        v6 = NSString;
        id v7 = [a1 displayText];
        id v8 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7);

        [a1 _announceAttachmentChangeWithString:v8];
      }
      v4 = v9;
    }
    goto LABEL_12;
  }
  v4 = 0;
LABEL_12:
}

- (void)accessibilityAnnounceDeletionWithVoiceOver
{
  if (![a1 _checkIsVoiceOverRunning]) {
    return;
  }
  if ([a1 isHashtagAttachment])
  {
    unsigned int v2 = (void *)MEMORY[0x1E4F83770];
    v3 = @"Deleted %@";
    goto LABEL_7;
  }
  if ([a1 isMentionAttachment])
  {
    unsigned int v2 = (void *)MEMORY[0x1E4F83770];
    v3 = @"Deleted mention %@";
LABEL_7:
    v4 = [v2 localizedFrameworkStringForKey:v3 value:v3 table:0 allowSiri:1];
    if (v4)
    {
      id v9 = v4;
      v5 = [a1 displayText];

      if (v5)
      {
        v6 = NSString;
        id v7 = [a1 displayText];
        id v8 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7);

        [a1 _announceAttachmentChangeWithString:v8];
      }
      v4 = v9;
    }
    goto LABEL_12;
  }
  v4 = 0;
LABEL_12:
}

- (void)_announceAttachmentChangeWithString:()UI
{
  id v4 = a3;
  id v3 = v4;
  dispatchMainAfterDelay();
}

@end