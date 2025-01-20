@interface ICNote(UI)
+ (NSObject)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:;
+ (id)duplicateNote:()UI isPasswordProtected:removeOriginalNote:;
+ (id)newNoteWithAttributedString:()UI inFolder:error:;
+ (id)newNoteWithString:()UI inFolder:error:;
+ (id)thumbnailImageForAttachment:()UI minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:;
+ (uint64_t)defaultNavigationBarIcon;
+ (uint64_t)lockedNavigationBarIcon;
+ (void)redactNote:()UI;
+ (void)removeUsageOfHashtag:()UI;
- (BOOL)removeHashtag:()UI;
- (BOOL)shouldReleaseTextStorageWhenTurningIntoFault;
- (ICAirDropNoteActivityItemSource)airDropActivityItemSource;
- (ICCalculateAccessibilityController)calculateAccessibilityController;
- (ICCalculateDocumentController)calculateDocumentController;
- (ICCollaborationColorManager)collaborationColorManager;
- (ICDocumentMergeController)documentMergeController;
- (ICTTTextContentStorage)textContentStorageCreateIfNeeded;
- (id)_icaxGalleryViewDescriptionForAttachment:()UI fromAttachments:orInlineAttachments:;
- (id)addHashtagToNoteBody:()UI onlyIfMissing:;
- (id)attachmentActivityItemsForSharing;
- (id)attachmentActivityItemsForSharingForRange:()UI;
- (id)attachmentFromInlineDrawingAttachment:()UI;
- (id)attachmentFromLegacyAttachmentFileWrapper:()UI;
- (id)attachmentFromObject:()UI createIfNecessary:;
- (id)attachmentFromRemoteFileWrapper:()UI;
- (id)attachmentFromStandardFileWrapper:()UI;
- (id)attachmentFromSystemPaperAttachment:()UI;
- (id)attributedStringForUTI:()UI inRange:;
- (id)calculatePreviewBehaviorUserDefaultsKey;
- (id)checklistStyleAccessibilityDescriptionForRange:()UI;
- (id)firstAttachmentInTextStorage;
- (id)folderSystemImageName;
- (id)icaxGalleryViewCustomContentDescription;
- (id)navigationBarIconWithSize:()UI;
- (id)noteActivityItemsForSharingWithNoteExporter:()UI;
- (id)rangesModifiedAfterTimestamp:()UI inTextStorage:;
- (id)searchableItemViewAttributeSet;
- (id)selectedInk;
- (id)textContentStorage;
- (id)textStorage;
- (id)textStorageWithoutCreating;
- (id)thumbnailImageWithMinSize:()UI scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:attachment:;
- (uint64_t)_icaxItemNumberForParagraphAtLocation:()UI withStyle:inAttrString:;
- (uint64_t)addHashtagToNoteBodyIfMissing:()UI;
- (uint64_t)appendAttributedString:()UI error:;
- (uint64_t)appendAttributedString:()UI options:error:;
- (uint64_t)calculatePreviewBehavior;
- (uint64_t)copyValuesToNote:()UI;
- (uint64_t)hasMentionForParticipant:()UI;
- (uint64_t)ic_characterCountIncludingSpaces:()UI;
- (uint64_t)ic_hasLightBackground;
- (uint64_t)ic_lineCount;
- (uint64_t)ic_wordCount;
- (uint64_t)isCalculateMathEnabled;
- (uint64_t)isDrawingStroke;
- (uint64_t)isFastSyncSessionActive;
- (uint64_t)isHandwritingRecognitionEnabled;
- (uint64_t)isHashtagRowAtRange:()UI outRangeForAppending:outIndex:forHashtagAttachment:outHashtagCount:;
- (uint64_t)noteDidClearDecryptedData;
- (uint64_t)noteWillTurnIntoFault;
- (uint64_t)preventLockReason;
- (uint64_t)primaryWritingDirection;
- (uint64_t)saveAfterDelay;
- (uint64_t)setHandwritingRecognitionEnabled:()UI;
- (uint64_t)thumbnailImageWithMinSize:()UI scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:;
- (uint64_t)updateModificationDateAndChangeCount;
- (uint64_t)updateModificationDateAndChangeCountAndSaveAfterDelay;
- (uint64_t)updateModificationDateAndChangeCountAndSaveImmediately;
- (uint64_t)updateThumbnailAttachmentIdentifier;
- (void)_updateTextViewToPaperIfNecessary;
- (void)announceAccessibilitySelectionChangedByMerge;
- (void)announceAccessibilitySelectionChangedByMergeWithSavedSelections:()UI beforeMergeTimestamp:;
- (void)applyOutlineState;
- (void)createMissingAttachmentsInTextStorage;
- (void)discardCalculateDocumentController;
- (void)fetchThumbnailImageWithMinSize:()UI scale:cache:appearanceInfo:cacheKey:processingBlock:completionBlock:;
- (void)filterAttachmentsInTextStorage:()UI range:;
- (void)formatExpressionsInAttributedString:()UI range:textStorageOffset:skipStaleExpressions:;
- (void)markBlockAndInlineAttachmentsForDeletion:()UI inAttributedString:;
- (void)noteDidApplyAttachmentViewTypeToAllAttachments;
- (void)noteDidMergeNoteDocumentWithUserInfo:()UI;
- (void)noteDidReplaceDocument;
- (void)noteWillMergeDocumentWithUserInfo:()UI;
- (void)noteWillReleaseTextStorage;
- (void)notifyTextViewsNoteDidMerge;
- (void)notifyTextViewsNoteWillMerge;
- (void)outlineControllerCollapsedStateDidChange:()UI;
- (void)redactAuthorAttributionsToCurrentUser;
- (void)save;
- (void)saveOutlineState;
- (void)setCalculatePreviewBehavior:()UI;
- (void)setIsDrawingStroke:()UI;
- (void)setIsFastSyncSessionActive:()UI;
- (void)setSelectedInk:()UI;
- (void)textStorage:()UI didProcessEditing:range:changeInLength:;
- (void)textStorage:()UI willProcessEditing:range:changeInLength:;
- (void)textStorageDidChange:()UI;
- (void)textStorageWillChange:()UI;
- (void)updatePKDrawingsWithHandwritingRecognitionEnabled:()UI;
@end

@implementation ICNote(UI)

- (ICCalculateDocumentController)calculateDocumentController
{
  if (ICInternalSettingsIsMathEnabled()
    && ([a1 managedObjectContext],
        v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 concurrencyType],
        v2,
        v3 == 2))
  {
    objc_getAssociatedObject(a1, &calculateDocumentControllerHandle);
    v4 = (ICCalculateDocumentController *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = [[ICCalculateDocumentController alloc] initWithNote:a1];
      objc_setAssociatedObject(a1, &calculateDocumentControllerHandle, v4, (void *)1);
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)checklistStyleAccessibilityDescriptionForRange:()UI
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v7 = a3 + a4;
  v8 = [a1 textStorage];
  unint64_t v9 = [v8 length];

  if (v7 <= v9)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    if (!v4)
    {
      v11 = [a1 textStorage];
      v12 = [v11 string];
      uint64_t v5 = objc_msgSend(v12, "paragraphRangeForRange:", v5, 0);
      uint64_t v4 = v13;
    }
    v14 = [a1 textStorage];
    uint64_t v15 = *MEMORY[0x1E4F83220];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__ICNote_UI__checklistStyleAccessibilityDescriptionForRange___block_invoke;
    v19[3] = &unk_1E5FDA8A8;
    v19[4] = &v24;
    v19[5] = &v20;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, v5, v4, 0, v19);

    if (*((unsigned char *)v21 + 24)) {
      v16 = @"Mixed";
    }
    else {
      v16 = @"On";
    }
    if (*((unsigned char *)v25 + 24)) {
      v17 = v16;
    }
    else {
      v17 = @"Off";
    }
    v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v17 value:v17 table:0 allowSiri:1];
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)textStorageWithoutCreating
{
  v1 = [a1 textContentStorage];
  v2 = [v1 textStorage];

  return v2;
}

- (id)textStorage
{
  v1 = [a1 textContentStorageCreateIfNeeded];
  v2 = [v1 textStorage];

  return v2;
}

- (ICTTTextContentStorage)textContentStorageCreateIfNeeded
{
  v2 = [a1 textContentStorage];
  if (v2)
  {
    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v4 = [a1 document];
    if (v4)
    {
      uint64_t v5 = [[ICTTTextStorage alloc] initWithDocument:v4];
      [(ICTTTextStorage *)v5 setDelegate:a1];
      v6 = [ICTTTextContentStorage alloc];
      unint64_t v7 = [a1 outlineState];
      v8 = [(ICTTTextContentStorage *)v6 initWithTextStorage:v5 outlineState:v7];

      unint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v10 = [MEMORY[0x1E4F28EA0] ICOutlineControllerCollapsedStateDidChange];
      [v9 addObserver:a1 selector:sel_outlineControllerCollapsedStateDidChange_ name:v10 object:0];

      [a1 setReservedForTextContentStorage:v8];
      uint64_t v3 = v8;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)textContentStorage
{
  objc_opt_class();
  v2 = [a1 reservedForTextContentStorage];
  uint64_t v3 = ICCheckedDynamicCast();

  return v3;
}

- (ICDocumentMergeController)documentMergeController
{
  objc_getAssociatedObject(a1, &documentMergeController_documentMergeControllerHandle);
  v2 = (ICDocumentMergeController *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(ICDocumentMergeController);
    objc_setAssociatedObject(a1, &documentMergeController_documentMergeControllerHandle, v2, (void *)1);
  }
  uint64_t v3 = v2;

  return v3;
}

- (uint64_t)calculatePreviewBehavior
{
  v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  uint64_t v3 = [a1 calculatePreviewBehaviorUserDefaultsKey];
  uint64_t v4 = [v2 integerForKey:v3];

  return v4;
}

- (id)calculatePreviewBehaviorUserDefaultsKey
{
  v1 = NSString;
  v2 = [a1 identifier];
  uint64_t v3 = NSStringFromSelector(sel_calculatePreviewBehavior);
  uint64_t v4 = [v1 stringWithFormat:@"%@--%@", v2, v3];

  return v4;
}

- (uint64_t)noteWillTurnIntoFault
{
  uint64_t result = [a1 shouldReleaseTextStorageWhenTurningIntoFault];
  if (result)
  {
    [a1 setReservedForTextContentStorage:0];
    uint64_t v3 = (void *)MEMORY[0x1E4FBA8A8];
    return [v3 cancelPreviousPerformRequestsWithTarget:a1 selector:sel_save object:0];
  }
  return result;
}

- (BOOL)shouldReleaseTextStorageWhenTurningIntoFault
{
  v2 = [a1 documentWithoutCreating];

  if (v2 && ![a1 shouldReleaseDocumentWhenTurningIntoFault]) {
    return 0;
  }
  uint64_t v3 = [a1 textStorageWithoutCreating];
  if (ICInternalSettingsIsTextKit2Enabled()) {
    [v3 textLayoutManagers];
  }
  else {
  uint64_t v5 = [v3 layoutManagers];
  }
  uint64_t v6 = [v5 count];

  BOOL v4 = v6 == 0;
  return v4;
}

- (id)attachmentFromObject:()UI createIfNecessary:
{
  id v6 = a3;
  if ([(id)objc_opt_class() isInlineAttachment:v6])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v6 attachment], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)v7;
    }
    else
    {
      if ([v6 conformsToProtocol:&unk_1F09A5DB0])
      {
        v8 = [a1 inlineAttachmentWithICTTAttachment:v6];
      }
      else
      {
        v8 = 0;
      }
      v10 = 0;
      if (v8 || !a4) {
        goto LABEL_34;
      }
      id v13 = v6;
      v14 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[ICNote(UI) attachmentFromObject:createIfNecessary:]((uint64_t)v13, a1);
      }

      uint64_t v15 = [v13 attachmentIdentifier];
      if ([v15 length])
      {
        v8 = [a1 addInlineAttachmentWithIdentifier:v15];
        [v8 setNeedsInitialFetchFromCloud:1];
        v16 = [v13 attachmentUTI];
        [v8 setTypeUTI:v16];

        v17 = [v8 typeUTI];

        if (!v17)
        {
          v18 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[ICNote(UI) attachmentFromObject:createIfNecessary:]((uint64_t)v13, a1);
          }

          [v8 setTypeUTI:*MEMORY[0x1E4F83180]];
        }
      }
      else
      {
        uint64_t v22 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[ICNote(UI) attachmentFromObject:createIfNecessary:]((uint64_t)v13, a1);
        }

        v8 = 0;
      }
    }
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a1 _updateTextViewToPaperIfNecessary];
      id v9 = v6;
      v10 = [v9 attachment];
      if (!v10 && a4)
      {
        v10 = [a1 attachmentFromSystemPaperAttachment:v9];
      }
      goto LABEL_16;
    }
    objc_opt_class();
    v19 = ICDynamicCast();
    int v20 = objc_msgSend(v19, "ic_isSystemTextAttachment");

    if (v20)
    {
      id v21 = v6;
      goto LABEL_44;
    }
    if ([v6 conformsToProtocol:&unk_1F09A5DB0])
    {
      id v9 = v6;
      uint64_t v26 = [v9 attachmentIdentifier];
      if (v26
        && (char v27 = (void *)v26,
            [v9 attachmentUTI],
            v28 = objc_claimAutoreleasedReturnValue(),
            v28,
            v27,
            v28))
      {
        v29 = [v9 attachmentIdentifier];
        v10 = [a1 attachmentWithIdentifier:v29];

        if (v10)
        {
LABEL_55:
          v34 = [v9 attachmentUTI];
          [v10 setTypeUTI:v34];

          v35 = [v10 typeUTI];
          int v36 = [v35 isEqualToString:*MEMORY[0x1E4F83090]];

          if (v36) {
            [a1 _updateTextViewToPaperIfNecessary];
          }
          v37 = [v10 typeUTI];

          if (v37) {
            goto LABEL_16;
          }
          v12 = [(id)*MEMORY[0x1E4F44400] identifier];
          [v10 setTypeUTI:v12];
          goto LABEL_9;
        }
        if (a4)
        {
          v30 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            -[ICNote(UI) attachmentFromObject:createIfNecessary:].cold.5();
          }

          v31 = [v9 attachmentIdentifier];
          v10 = [a1 addAttachmentWithIdentifier:v31];

          v32 = [MEMORY[0x1E4F1C9C8] distantPast];
          [v10 setModificationDate:v32];

          v33 = [MEMORY[0x1E4F1C9C8] distantPast];
          [v10 setCreationDate:v33];

          [v10 setNeedsInitialFetchFromCloud:1];
          goto LABEL_55;
        }
      }
      else
      {
        v41 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          -[ICNote(UI) attachmentFromObject:createIfNecessary:].cold.4();
        }

        [MEMORY[0x1E4F837E8] postBasicEvent:20];
      }
    }
    else if (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !+[ICTextAttachment textAttachmentIsContent:v6])
      {
        v8 = 0;
LABEL_33:
        v10 = 0;
        goto LABEL_34;
      }
      id v9 = v6;
      v38 = [v9 fileType];
      int v39 = [v38 isEqualToString:*MEMORY[0x1E4F83098]];

      if (v39)
      {
        v12 = [v9 contents];
        uint64_t v40 = [a1 attachmentFromTableData:v12];
      }
      else
      {
        v42 = [v9 image];

        if (v42)
        {
          v43 = (void *)MEMORY[0x1E4F442D8];
          v44 = [v9 image];
          v45 = objc_msgSend(v43, "typeWithIdentifier:", CGImageGetUTType((CGImageRef)objc_msgSend(v44, "ic_CGImage")));
          int v46 = [v45 conformsToType:*MEMORY[0x1E4F44410]];

          if (v46)
          {
            v47 = [v9 image];
            v48 = UIImageJPEGRepresentation(v47, 1.0);

            v49 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:v48];
            [v49 setPreferredFilename:@"Attachment.jpeg"];
            [v9 setFileWrapper:v49];
          }
        }
        v12 = [v9 fileWrapper];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v40 = [a1 attachmentFromLegacyAttachmentFileWrapper:v12];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v40 = [a1 attachmentFromRemoteFileWrapper:v12];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 && !v12)
            {
              v10 = 0;
              goto LABEL_9;
            }
            uint64_t v40 = [a1 attachmentFromStandardFileWrapper:v12];
          }
        }
      }
      v10 = (void *)v40;
      goto LABEL_9;
    }
    id v21 = 0;
    goto LABEL_44;
  }
  id v9 = v6;
  v10 = [v9 attachment];
  if (v10 || !a4) {
    goto LABEL_16;
  }
  v10 = [a1 attachmentFromInlineDrawingAttachment:v9];
  objc_opt_class();
  v11 = [v10 attachmentModel];
  v12 = ICDynamicCast();

  objc_msgSend(v12, "setHandwritingRecognitionEnabled:", objc_msgSend(a1, "isHandwritingRecognitionEnabled"));
LABEL_9:

LABEL_16:
  v8 = 0;
LABEL_34:
  if (v8) {
    char v23 = v8;
  }
  else {
    char v23 = v10;
  }
  id v21 = v23;
  uint64_t v24 = [v21 note];

  if (v24 != a1) {
    [v21 setNote:a1];
  }
  if (v8)
  {
    [a1 addInlineAttachmentsObject:v8];
  }
  else if (v10)
  {
    [a1 addAttachmentsObject:v10];
  }

LABEL_44:
  return v21;
}

- (void)textStorage:()UI willProcessEditing:range:changeInLength:
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v12 = (void *)MEMORY[0x1E4F28EB8];
  id v13 = a3;
  v14 = [v12 defaultCenter];
  v21[0] = @"kICTTEditedRangeNotificationKey";
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a5, a6);
  v22[0] = v15;
  v21[1] = @"kICTTChangeInLengthNotificationKey";
  v16 = [NSNumber numberWithInteger:a7];
  v22[1] = v16;
  v21[2] = @"kICTTEditedMaskNotificationKey";
  v17 = [NSNumber numberWithUnsignedInteger:a4];
  v22[2] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  [v14 postNotificationName:@"ICTTTextStorageWillProcessEditingNotification" object:v13 userInfo:v18];

  v19 = [a1 managedObjectContext];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__ICNote_UI__textStorage_willProcessEditing_range_changeInLength___block_invoke;
  v20[3] = &unk_1E5FD8DF0;
  v20[4] = a1;
  [v19 performBlockAndWait:v20];
}

- (void)filterAttachmentsInTextStorage:()UI range:
{
  id v8 = a3;
  id v9 = [a1 managedObjectContext];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke;
  v25[3] = &unk_1E5FD8DF0;
  v25[4] = a1;
  [v9 performBlockAndWait:v25];

  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  objc_opt_class();
  v10 = ICDynamicCast();
  [v10 beginSkippingTimestampUpdates];

  uint64_t v11 = *MEMORY[0x1E4FB06B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_2;
  v18[3] = &unk_1E5FDA830;
  v18[4] = a1;
  id v12 = v8;
  id v19 = v12;
  int v20 = &v21;
  objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v11, a4, a5, 0, v18);
  objc_opt_class();
  id v13 = ICDynamicCast();
  [v13 endSkippingTimestampUpdates];

  if (*((unsigned char *)v22 + 24))
  {
    v14 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ICNote(UI) filterAttachmentsInTextStorage:range:](v14);
    }

    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:*MEMORY[0x1E4F83100] object:a1];
  }
  v16 = [a1 managedObjectContext];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__ICNote_UI__filterAttachmentsInTextStorage_range___block_invoke_272;
  v17[3] = &unk_1E5FD8DF0;
  v17[4] = a1;
  [v16 performBlockAndWait:v17];

  _Block_object_dispose(&v21, 8);
}

- (ICCalculateAccessibilityController)calculateAccessibilityController
{
  if (ICInternalSettingsIsMathEnabled())
  {
    objc_getAssociatedObject(a1, &calculateAccessibilityControllerHandle);
    v2 = (ICCalculateAccessibilityController *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v2 = [[ICCalculateAccessibilityController alloc] initWithNote:a1];
      objc_setAssociatedObject(a1, &calculateAccessibilityControllerHandle, v2, (void *)1);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)textStorage:()UI didProcessEditing:range:changeInLength:
{
  id v12 = a3;
  id v13 = [a1 managedObjectContext];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__ICNote_UI__textStorage_didProcessEditing_range_changeInLength___block_invoke;
  v15[3] = &unk_1E5FDA858;
  v15[4] = a1;
  id v16 = v12;
  uint64_t v17 = a5;
  uint64_t v18 = a6;
  uint64_t v19 = a4;
  uint64_t v20 = a7;
  id v14 = v12;
  [v13 performBlockAndWait:v15];
}

- (uint64_t)setHandwritingRecognitionEnabled:()UI
{
  uint64_t result = [a1 isHandwritingRecognitionEnabled];
  if (result != a3)
  {
    id v6 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICNote(UI) setHandwritingRecognitionEnabled:](a3, a1);
    }

    uint64_t v7 = (const void *)kICHandwritingRecognitionEnabledKey;
    id v8 = [NSNumber numberWithBool:a3];
    objc_setAssociatedObject(a1, v7, v8, (void *)1);

    return [a1 updatePKDrawingsWithHandwritingRecognitionEnabled:a3];
  }
  return result;
}

- (void)updatePKDrawingsWithHandwritingRecognitionEnabled:()UI
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__ICNote_UI__updatePKDrawingsWithHandwritingRecognitionEnabled___block_invoke;
  v3[3] = &unk_1E5FDA8D0;
  char v4 = a3;
  v3[4] = v5;
  [a1 enumerateAttachmentsInOrderUsingBlock:v3];
  _Block_object_dispose(v5, 8);
}

- (void)setHandwritingRecognitionEnabled:()UI .cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v3, v4, "Setting handwriting recognition %@ for %@", v5, v6, v7, v8, v9);
}

- (uint64_t)isHandwritingRecognitionEnabled
{
  v1 = objc_getAssociatedObject(a1, (const void *)kICHandwritingRecognitionEnabledKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)noteDidReplaceDocument
{
  id v4 = [a1 textStorageWithoutCreating];
  uint64_t v2 = [a1 documentWithoutCreating];
  if (v4)
  {
    if (v2)
    {
      uint64_t v3 = [v4 document];

      if (v3 != v2) {
        [v4 replaceWithDocument:v2];
      }
    }
  }
}

- (uint64_t)isFastSyncSessionActive
{
  v1 = objc_getAssociatedObject(a1, (const void *)kICIsFastSyncSessionActive);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIsFastSyncSessionActive:()UI
{
  if ([a1 isFastSyncSessionActive] != a3)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "RealtimeCollaboration");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICNote(UI) setIsFastSyncSessionActive:](a3, a1);
    }

    uint64_t v6 = (const void *)kICIsFastSyncSessionActive;
    uint64_t v7 = [NSNumber numberWithBool:a3];
    objc_setAssociatedObject(a1, v6, v7, (void *)3);
  }
}

- (void)noteWillReleaseTextStorage
{
  id v2 = [a1 textStorageWithoutCreating];
  [v2 setIsZombie:1];
  [a1 discardCalculateDocumentController];
}

- (uint64_t)noteDidClearDecryptedData
{
  id v2 = [a1 textStorageWithoutCreating];
  uint64_t v3 = [v2 styler];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [a1 textStorageWithoutCreating];
    uint64_t v6 = [v5 styler];

    [v6 setNote:0];
  }
  return [a1 setReservedForTextContentStorage:0];
}

- (void)noteWillMergeDocumentWithUserInfo:()UI
{
  id v10 = a3;
  id v4 = [a1 textStorage];
  uint64_t v5 = [v4 mergeableString];
  uint64_t v6 = [v5 timestamp];
  uint64_t v7 = (void *)[v6 copy];

  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:@"BeforeMergeTimestamp"];
  }
  uint64_t v8 = [a1 textStorage];
  uint8_t v9 = [v8 savedSelectionWithSelectionAffinity:0];

  if (v9) {
    [v10 setObject:v9 forKeyedSubscript:@"SavedSelections"];
  }
  [a1 notifyTextViewsNoteWillMerge];
}

- (id)rangesModifiedAfterTimestamp:()UI inTextStorage:
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 array];
  uint8_t v9 = [v6 mergeableString];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__ICNote_UI__rangesModifiedAfterTimestamp_inTextStorage___block_invoke;
  v13[3] = &unk_1E5FDA638;
  id v14 = v8;
  id v10 = v8;
  [v9 enumerateHighlightableRangesModifiedAfter:v7 includingAttributes:1 usingBlock:v13];

  uint64_t v11 = (void *)[v10 copy];
  return v11;
}

- (void)noteDidMergeNoteDocumentWithUserInfo:()UI
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"SavedSelections"];
  id v6 = [a1 textStorage];
  [v6 restoreSelection:v5];

  [a1 notifyTextViewsNoteDidMerge];
  id v7 = [v4 objectForKeyedSubscript:@"BeforeMergeTimestamp"];

  uint64_t v8 = [a1 textStorage];
  uint8_t v9 = [a1 rangesModifiedAfterTimestamp:v7 inTextStorage:v8];

  if ([v9 count])
  {
    objc_opt_class();
    id v10 = [a1 textStorage];
    uint64_t v11 = [v10 styler];
    id v12 = ICDynamicCast();

    id v13 = [v12 authorHighlightsController];
    id v14 = [a1 textStorage];
    uint64_t v15 = objc_msgSend(v14, "ic_range");
    uint64_t v17 = v16;
    uint64_t v18 = [a1 textStorage];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __51__ICNote_UI__noteDidMergeNoteDocumentWithUserInfo___block_invoke;
    v20[3] = &unk_1E5FDA660;
    id v21 = v9;
    id v22 = v12;
    uint64_t v23 = a1;
    id v19 = v12;
    objc_msgSend(v13, "performHighlightUpdatesForRange:inTextStorage:updates:", v15, v17, v18, v20);
  }
  [a1 announceAccessibilitySelectionChangedByMergeWithSavedSelections:v5 beforeMergeTimestamp:v7];
  [a1 applyOutlineState];
}

- (ICCollaborationColorManager)collaborationColorManager
{
  objc_opt_class();
  id v2 = [a1 reservedForCollaborationColorManager];
  ICDynamicCast();
  uint64_t v3 = (ICCollaborationColorManager *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    uint64_t v3 = objc_alloc_init(ICCollaborationColorManager);
    [a1 setReservedForCollaborationColorManager:v3];
  }
  return v3;
}

- (uint64_t)ic_hasLightBackground
{
  char v2 = objc_msgSend(MEMORY[0x1E4FB1E20], "ic_alwaysShowLightContent");
  if ([a1 prefersLightBackground] & 1) != 0 || (v2) {
    return 1;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F83738];
  return [v3 deviceIsVision];
}

- (uint64_t)hasMentionForParticipant:()UI
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v5 = objc_msgSend(v4, "ic_userRecordNameInNote:", a1);
  id v6 = [MEMORY[0x1E4F83410] allUserRecordName];
  id v7 = [a1 textStorage];
  uint64_t v8 = [a1 managedObjectContext];
  uint8_t v9 = [a1 textStorage];
  uint64_t v10 = [v9 length];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__ICNote_UI__hasMentionForParticipant___block_invoke;
  v15[3] = &unk_1E5FDA688;
  id v11 = v5;
  id v16 = v11;
  id v12 = v6;
  id v17 = v12;
  uint64_t v18 = &v19;
  objc_msgSend(v7, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v8, 0, v10, 0, v15);

  uint64_t v13 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)formatExpressionsInAttributedString:()UI range:textStorageOffset:skipStaleExpressions:
{
  id v12 = a3;
  id v13 = [a1 calculateDocumentController];
  objc_msgSend(v13, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v12, a4, a5, a6, a7);
}

- (void)outlineControllerCollapsedStateDidChange:()UI
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 object];

  id v6 = ICDynamicCast();

  id v7 = [v6 textStorage];
  uint64_t v8 = [v7 document];
  uint8_t v9 = [a1 textStorageWithoutCreating];
  uint64_t v10 = [v9 document];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    id v12 = [a1 managedObjectContext];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__ICNote_UI__outlineControllerCollapsedStateDidChange___block_invoke;
    v13[3] = &unk_1E5FD8DF0;
    void v13[4] = a1;
    [v12 performBlockAndWait:v13];
  }
}

- (void)discardCalculateDocumentController
{
}

- (void)setCalculatePreviewBehavior:()UI
{
  uint64_t v5 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  id v6 = [a1 calculatePreviewBehaviorUserDefaultsKey];
  [v5 setInteger:a3 forKey:v6];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICNoteDidChangeCalculatePreviewBehavior" object:a1];
}

- (uint64_t)isCalculateMathEnabled
{
  v1 = [a1 calculateDocumentController];
  uint64_t v2 = [v1 isCalculateMathEnabled];

  return v2;
}

- (uint64_t)primaryWritingDirection
{
  v1 = [a1 textStorage];
  uint64_t v2 = [v1 attribute:*MEMORY[0x1E4F83220] atIndex:0 effectiveRange:0];

  if (v2) {
    uint64_t v3 = [v2 layoutWritingDirection];
  }
  else {
    uint64_t v3 = -1;
  }

  return v3;
}

- (id)noteActivityItemsForSharingWithNoteExporter:()UI
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [[ICNoteTopoTextActivityItemSource alloc] initWithNote:a1];
  if (v4) {
    [v3 addObject:v4];
  }
  id v16 = v4;
  objc_initWeak(&location, a1);
  uint64_t v5 = [ICNoteStringActivityItemSource alloc];
  id v6 = [a1 title];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__ICNote_UI__noteActivityItemsForSharingWithNoteExporter___block_invoke;
  v24[3] = &unk_1E5FDA6B0;
  objc_copyWeak(&v25, &location);
  v24[4] = a1;
  id v17 = [(ICNoteStringActivityItemSource *)v5 initWithTitle:v6 attributedStringCreator:v24];

  if (v17) {
    objc_msgSend(v3, "addObject:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [a1 attachmentActivityItemsForSharing];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [[ICFilterAttachmentActivityItemSource alloc] initAttachmentItem:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        if (v11) {
          [v3 addObject:v11];
        }
        else {
          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"filterAttachmentActivityItemSource" functionName:"-[ICNote(UI) noteActivityItemsForSharingWithNoteExporter:]" simulateCrash:1 showAlert:0 format:@"Failed to create filter attachment activity item source"];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v8);
  }

  id v12 = [[ICNoteHTMLActivityItemSource alloc] initWithNote:a1];
  [v3 addObject:v12];
  if (v18)
  {
    id v13 = [[ICNoteRTFDActivityItemSource alloc] initWithNote:a1 noteExporter:v18];
    [v3 addObject:v13];
  }
  id v14 = (void *)[v3 copy];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v14;
}

- (ICAirDropNoteActivityItemSource)airDropActivityItemSource
{
  objc_initWeak(&location, val);
  uint64_t v2 = [ICAirDropNoteActivityItemSource alloc];
  uint64_t v3 = [val title];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__ICNote_UI__airDropActivityItemSource__block_invoke;
  v6[3] = &unk_1E5FDA6D8;
  objc_copyWeak(&v7, &location);
  id v4 = [(ICAirDropNoteActivityItemSource *)v2 initWithTitle:v3 airDropDocumentCreator:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)attachmentActivityItemsForSharing
{
  uint64_t v2 = [a1 textStorage];
  uint64_t v3 = objc_msgSend(a1, "attachmentActivityItemsForSharingForRange:", 0, objc_msgSend(v2, "length"));

  return v3;
}

- (id)attachmentActivityItemsForSharingForRange:()UI
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ICNote_UI__attachmentActivityItemsForSharingForRange___block_invoke;
  v11[3] = &unk_1E5FDA700;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  id v12 = v7;
  id v8 = v7;
  [a1 enumerateAttachmentsInOrderUsingBlock:v11];
  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

+ (id)newNoteWithAttributedString:()UI inFolder:error:
{
  id v7 = a3;
  id v8 = a4;
  if (!v8) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((folder) != nil)", "+[ICNote(UI) newNoteWithAttributedString:inFolder:error:]", 1, 0, @"Expected non-nil value for '%s'", "folder");
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F83418] newEmptyNoteInFolder:v8];
  if ([v9 appendAttributedString:v7 options:3 error:a5])
  {
    uint64_t v10 = [v9 textStorage];
    id v11 = [v10 styler];

    objc_opt_class();
    ICDynamicCast();
    id v12 = (ICTextController *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      id v12 = objc_alloc_init(ICTextController);
      uint64_t v13 = [v9 textStorage];
      [v13 setStyler:v12];
    }
    uint64_t v14 = [v9 textStorage];
    [v14 beginEditing];

    uint64_t v15 = [v9 textStorage];
    id v16 = [v15 string];
    uint64_t v17 = objc_msgSend(v16, "paragraphRangeForRange:", 0, 0);
    uint64_t v19 = v18;

    long long v20 = [v9 textStorage];
    LODWORD(v16) = -[ICTextController paragraphStyleForRange:inTextView:inTextStorage:](v12, "paragraphStyleForRange:inTextView:inTextStorage:", v17, v19, 0, v20);

    uint64_t v21 = +[ICTextStyle noteDefaultNamedStyle];
    if (v16 == 3)
    {
      uint64_t v22 = v21;
      if (v21 != 3)
      {
        long long v23 = [v9 textStorage];
        -[ICTextController setTextStyle:range:inTextStorage:inTextView:](v12, "setTextStyle:range:inTextStorage:inTextView:", v22, v17, v19, v23, 0);
      }
    }
    char v24 = [v9 textStorage];
    [v24 endEditing];

    id v25 = [v9 textStorage];
    [v25 fixupAfterEditing];

    uint64_t v26 = [v9 textStorage];
    char v27 = [v26 styler];

    if (v27 != v11)
    {
      uint64_t v28 = [v9 textStorage];
      [v28 setStyler:v11];
    }
    [v9 updateChangeCountWithReason:@"Created note from string"];
    id v29 = v9;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

+ (id)newNoteWithString:()UI inFolder:error:
{
  id v7 = a3;
  id v8 = a4;
  if (!v8) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((folder) != nil)", "+[ICNote(UI) newNoteWithString:inFolder:error:]", 1, 0, @"Expected non-nil value for '%s'", "folder");
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F83418] newEmptyNoteInFolder:v8];
  [v9 updateChangeCountWithReason:@"Created note from string"];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_msgSend(MEMORY[0x1E4F834E8], "paragraphStyleNamed:", +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle"));
  [v10 setObject:v11 forKey:*MEMORY[0x1E4F83220]];

  uint64_t v12 = objc_msgSend(v7, "paragraphRangeForRange:", 0, 0);
  uint64_t v14 = v13;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
  objc_msgSend(v15, "setAttributes:range:", v10, v12, v14);
  int v16 = [v9 appendAttributedString:v15 error:a5];
  id v17 = 0;
  if (v16) {
    id v17 = v9;
  }

  return v17;
}

- (uint64_t)appendAttributedString:()UI error:
{
  return [a1 appendAttributedString:a3 options:0 error:a4];
}

- (uint64_t)appendAttributedString:()UI options:error:
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [a1 textStorage];
  char v10 = objc_msgSend(a1, "allowsNewTextLength:", objc_msgSend(v8, "length") + objc_msgSend(v9, "length"));

  if (v10)
  {
    id v11 = [a1 textStorage];
    uint64_t v12 = [v11 styler];

    if (v12)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = objc_alloc_init(ICTextController);
      id v17 = [a1 textStorage];
      [v17 setStyler:v13];
    }
    uint64_t v18 = [a1 textStorage];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __51__ICNote_UI__appendAttributedString_options_error___block_invoke;
    v28[3] = &unk_1E5FD91D0;
    v28[4] = a1;
    id v29 = v8;
    [v18 editWithAttributeOptions:a4 usingBlock:v28];

    uint64_t v19 = [a1 textStorage];
    [v19 fixupAfterEditing];

    if (v13)
    {
      long long v20 = [a1 textStorage];
      uint64_t v21 = [v20 styler];

      if (v21 == v13)
      {
        uint64_t v22 = [a1 textStorage];
        [v22 setStyler:0];
      }
    }
    [a1 updateModificationDateAndChangeCount];
    long long v23 = [MEMORY[0x1E4F83428] sharedContext];
    id v27 = 0;
    uint64_t v16 = [v23 save:&v27];
    id v24 = v27;

    if ((v16 & 1) == 0)
    {
      if (a5)
      {
        *a5 = v24;
      }
      else
      {
        id v25 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[ICNote(UI) appendAttributedString:options:error:]();
        }
      }
    }

    goto LABEL_18;
  }
  if (a5)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F83668];
    uint64_t v30 = *MEMORY[0x1E4F83680];
    v31[0] = @"Note length exceeded.";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    [v14 errorWithDomain:v15 code:204 userInfo:v13];
    uint64_t v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v16 = 0;
LABEL_19:

  return v16;
}

- (id)attributedStringForUTI:()UI inRange:
{
  id v8 = a3;
  char v9 = [v8 conformsToType:*MEMORY[0x1E4F44470]];
  char v10 = [a1 textStorage];
  id v11 = v10;
  if (v10)
  {
    if (v9)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v12 = [v10 styler];
      objc_opt_class();
      uint64_t v15 = ICDynamicCast();
      uint64_t v16 = v15;
      if (v15) {
        id v17 = v15;
      }
      else {
        id v17 = objc_alloc_init(ICTextController);
      }
      uint64_t v13 = v17;

      [v11 setStyler:v13];
      -[ICTTTextController styleText:inRange:fixModelAttributes:](v13, "styleText:inRange:fixModelAttributes:", v11, a4, a5, 0);
    }
    uint64_t v18 = [v8 identifier];
    uint64_t v19 = objc_msgSend(v11, "filteredAttributedStringForUTI:range:", v18, a4, a5);

    if ((v9 & 1) == 0)
    {
      long long v20 = [v11 styler];

      if (v20 != v12) {
        [v11 setStyler:v12];
      }
    }
    id v14 = v19;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (uint64_t)preventLockReason
{
  uint64_t v2 = [a1 account];
  int v3 = [v2 canPasswordProtectNotes];

  if (!v3) {
    return 6;
  }
  if ([a1 isSystemPaper]) {
    return 4;
  }
  if ([a1 isSharedViaICloud]) {
    return 5;
  }
  if ([a1 hasTags]) {
    return 3;
  }
  if ([a1 containsAttachmentsUnsupportedInPasswordProtection]) {
    return 2;
  }
  return 0;
}

+ (id)duplicateNote:()UI isPasswordProtected:removeOriginalNote:
{
  id v8 = a3;
  char v9 = [v8 folder];
  if (v9)
  {
    char v10 = [a1 duplicateNote:v8 intoFolder:v9 isPasswordProtected:a4 removeOriginalNote:a5];
  }
  else
  {
    id v11 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ICNote(UI) duplicateNote:isPasswordProtected:removeOriginalNote:](v8);
    }

    char v10 = 0;
  }

  return v10;
}

+ (NSObject)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = os_log_create("com.apple.notes", "Move");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v9 shortLoggingDescription];
    uint64_t v13 = [v10 shortLoggingDescription];
    id v14 = [NSNumber numberWithBool:a5];
    uint64_t v15 = [NSNumber numberWithBool:a6];
    int v42 = 138413570;
    v43 = v12;
    __int16 v44 = 2112;
    v45 = v13;
    __int16 v46 = 2112;
    v47 = v14;
    __int16 v48 = 2112;
    __int16 v50 = 2080;
    v49 = v15;
    v51 = "+[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:]";
    __int16 v52 = 1024;
    int v53 = 748;
    _os_log_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEFAULT, "Duplicating note… {originalNote: %@, folder: %@, isPasswordProtected: %@, removingOriginalNote: %@}%s:%d", (uint8_t *)&v42, 0x3Au);
  }
  if (a5 && [v9 preventLockReason])
  {
    uint64_t v16 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:].cold.5(v9);
    }
    id v17 = 0;
    uint64_t v18 = v16;
    goto LABEL_33;
  }
  uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v20 = *MEMORY[0x1E4F1BE28];
  uint64_t v21 = [v9 managedObjectContext];
  uint64_t v18 = [v19 addObserverForName:v20 object:v21 queue:0 usingBlock:&__block_literal_global_24];

  uint64_t v22 = [MEMORY[0x1E4F832F8] sharedState];
  [v22 beginBlockingDeauthentication];

  [v9 persistPendingChangesRecursively];
  [v9 mergeUnappliedEncryptedRecordRecursively];
  long long v23 = [v9 managedObjectContext];
  [v23 refreshAllObjects];

  uint64_t v16 = [MEMORY[0x1E4F83418] newEmptyNoteInFolder:v10];
  if (!a5)
  {
    if ([v9 copyValuesToNote:v16]) {
      goto LABEL_16;
    }
LABEL_27:
    int v39 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:].cold.4();
    }
    goto LABEL_31;
  }
  char v24 = [v9 isPasswordProtected];
  [v16 setIsPasswordProtected:1];
  if (v24)
  {
    id v25 = [v16 cryptoStrategy];
    [v25 initializeCryptoPropertiesFromObject:v9];
  }
  else
  {
    [v16 initializeCryptoProperties];
  }
  if (([v9 copyValuesToNote:v16] & 1) == 0) {
    goto LABEL_27;
  }
  [v16 setSnippet:0];
LABEL_16:
  uint64_t v26 = [v16 noteData];
  [v26 setNeedsToBeSaved:1];

  id v27 = [v16 noteData];
  char v28 = [v27 saveNoteDataIfNeeded];

  if ((v28 & 1) == 0)
  {
    int v39 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:]();
    }
LABEL_31:

    [MEMORY[0x1E4F83418] deleteNote:v16];
    uint64_t v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 removeObserver:v18];

    v38 = [MEMORY[0x1E4F832F8] sharedState];
    [v38 endBlockingDeauthentication];
LABEL_32:

    id v17 = 0;
    goto LABEL_33;
  }
  [v16 updateChangeCountWithReason:@"Duplicated note"];
  if ([v16 wantsUserSpecificRecord]) {
    [v16 updateUserSpecificChangeCountWithReason:@"Duplicated note"];
  }
  id v29 = [MEMORY[0x1E4F832F8] sharedState];
  [v29 endBlockingDeauthentication];

  if (a6)
  {
    if ([v9 isPasswordProtected])
    {
      uint64_t v30 = [MEMORY[0x1E4F832F8] sharedState];
      [v30 setCachedMainKey:0 forObject:v9];
    }
    [MEMORY[0x1E4F833A0] changeLinkDestinationFromNote:v9 toNote:v16];
    [v9 markForDeletion];
    [v9 updateChangeCountWithReason:@"Duplicated note"];
    [MEMORY[0x1E4F83418] redactNote:v9];
    [MEMORY[0x1E4F83418] deleteNote:v9];
    v31 = [v9 account];
    v32 = [v31 trashFolder];
    [v9 setFolder:v32];

    v33 = [MEMORY[0x1E4F1C9C8] now];
    [v9 setFolderModificationDate:v33];

    [v9 updateChangeCountWithReason:@"Duplicated note"];
  }
  v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v34 removeObserver:v18];

  v35 = [v9 managedObjectContext];
  char v36 = objc_msgSend(v35, "ic_saveWithLogDescription:", @"Duplicated note");

  v37 = os_log_create("com.apple.notes", "Move");
  v38 = v37;
  if ((v36 & 1) == 0)
  {
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:]();
    }

    goto LABEL_32;
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    +[ICNote(UI) duplicateNote:intoFolder:isPasswordProtected:removeOriginalNote:]();
  }

  uint64_t v16 = v16;
  id v17 = v16;
LABEL_33:

  return v17;
}

+ (void)redactNote:()UI
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 mergeableString];
  uint64_t v5 = [v3 textStorage];
  uint64_t v6 = objc_msgSend(v5, "ic_range");
  objc_msgSend(v4, "replaceCharactersInRange:withString:", v6, v7, &stru_1F0973378);

  [v3 setTitle:0];
  [v3 setSnippet:0];
  [v3 setReplicaIDToUserIDDictData:0];
  [v3 setReplicaIDToNotesVersionData:0];
  [v3 setActivityEventsData:0];
  [v3 setOutlineStateData:0];
  uint64_t v54 = v3;
  id v8 = [v3 attachments];
  id v9 = (void *)[v8 copy];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v9;
  uint64_t v57 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v67;
    v60 = (void *)*MEMORY[0x1E4F44460];
    *(void *)&long long v10 = 138412802;
    long long v53 = v10;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v67 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "mergeableData", v53);

        if (v13)
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
          [v12 setMergeableData:v14];
        }
        [v12 setTitle:0];
        [v12 setHandwritingSummary:0];
        [v12 setImageClassificationSummary:0];
        [v12 setOcrSummary:0];
        uint64_t v15 = [v12 previewImages];
        uint64_t v16 = (void *)[v15 copy];

        if (v16)
        {
          v58 = v16;
          uint64_t v59 = i;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v62 objects:v73 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v63 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void **)(*((void *)&v62 + 1) + 8 * j);
                [v22 invalidateOrientedImage];
                DeviceRGB = CGColorSpaceCreateDeviceRGB();
                [v22 width];
                size_t v25 = (unint64_t)v24;
                [v22 height];
                id v27 = CGBitmapContextCreate(0, v25, (unint64_t)v26, 8uLL, 0, DeviceRGB, 2u);
                *(_OWORD *)components = xmmword_1B0B98918;
                *(_OWORD *)&components[2] = unk_1B0B98928;
                char v28 = CGColorCreate(DeviceRGB, components);
                CGContextSetFillColorWithColor(v27, v28);
                CGColorRelease(v28);
                CGColorSpaceRelease(DeviceRGB);
                [v22 width];
                CGFloat v30 = v29;
                [v22 height];
                v76.size.height = v31;
                v76.origin.x = 0.0;
                v76.origin.y = 0.0;
                v76.size.width = v30;
                CGContextFillRect(v27, v76);
                Image = CGBitmapContextCreateImage(v27);
                v33 = [v60 identifier];
                v34 = ICDataFromCGImage();

                CGImageRelease(Image);
                CGContextRelease(v27);
                [v22 width];
                double v36 = v35;
                [v22 height];
                double v38 = v37;
                [v22 scale];
                if (objc_msgSend(v22, "setImageData:withSize:scale:appearanceType:", v34, 0, v36, v38, v39))
                {
                  [v12 updateChangeCountWithReason:@"Redacted note"];
                }
                else
                {
                  uint64_t v40 = os_log_create("com.apple.notes", "PreviewGeneration");
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                    +[ICNote(UI) redactNote:](v70, v12, &v71, v40);
                  }
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v62 objects:v73 count:16];
            }
            while (v19);
          }

          uint64_t v16 = v58;
          uint64_t i = v59;
        }
        v41 = [v12 media];

        if (v41)
        {
          int v42 = [v12 media];
          int v43 = [v42 hasFile];

          if (v43)
          {
            __int16 v44 = [v12 media];
            id v45 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
            id v61 = 0;
            char v46 = [v44 writeData:v45 error:&v61];
            id v47 = v61;

            if ((v46 & 1) == 0)
            {
              __int16 v48 = os_log_create("com.apple.notes", "Media");
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                v49 = [v12 media];
                __int16 v50 = [v49 identifier];
                v51 = [v54 identifier];
                LODWORD(components[0]) = v53;
                *(void *)((char *)components + 4) = v50;
                WORD2(components[1]) = 2112;
                *(void *)((char *)&components[1] + 6) = v51;
                HIWORD(components[2]) = 2112;
                *(void *)&components[3] = v47;
                _os_log_error_impl(&dword_1B08EB000, v48, OS_LOG_TYPE_ERROR, "Error redacting media %@ for note %@ error: %@", (uint8_t *)components, 0x20u);
              }
            }
          }
        }
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v57);
  }

  __int16 v52 = [v54 managedObjectContext];
  [v52 setShouldPerformSecureOperation:1];
}

- (void)redactAuthorAttributionsToCurrentUser
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F0A20EF0;
  objc_msgSendSuper2(&v3, sel_redactAuthorAttributionsToCurrentUser);
  uint64_t v2 = [a1 textStorage];
  [v2 redactAuthorAttributionsToCurrentUser];
}

- (void)_updateTextViewToPaperIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "textStorage", 0);
  uint64_t v2 = [v1 textViews];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (+[ICSystemPaperTextAttachment isEnabled]
          && ([v7 isPaperEnabled] & 1) == 0)
        {
          [v7 setPaperEnabled:1];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)attachmentFromInlineDrawingAttachment:()UI
{
  uint64_t v4 = *MEMORY[0x1E4F83060];
  id v5 = a3;
  uint64_t v6 = [a1 addAttachmentWithUTI:v4];
  uint64_t v7 = [v6 attachmentModel];
  long long v8 = [v5 contents];

  [v7 mergeWithMergeableData:v8];
  [v6 updateChangeCountWithReason:@"Created attachment from inline drawing"];
  return v6;
}

- (id)attachmentFromSystemPaperAttachment:()UI
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F09BCDE0])
  {
    id v5 = [v4 _paperIdentifier];
    uint64_t v6 = [a1 addSystemPaperAttachmentWithIdentifier:v5];
    [v6 updateChangeCountWithReason:@"Created attachment from System Paper"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)attachmentFromStandardFileWrapper:()UI
{
  v1 = objc_msgSend(a1, "addAttachmentWithFileWrapper:");
  [v1 updateChangeCountWithReason:@"Created attachment from file wrapper"];
  uint64_t v2 = [v1 media];
  [v2 updateChangeCountWithReason:@"Created attachment from file wrapper"];

  return v1;
}

- (id)attachmentFromLegacyAttachmentFileWrapper:()UI
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F832A0];
  uint64_t v6 = [v4 attachmentIdentifier];
  uint64_t v7 = [a1 managedObjectContext];
  long long v8 = [v5 attachmentWithIdentifier:v6 context:v7];

  if (!v8)
  {
    long long v9 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICNote(UI) attachmentFromLegacyAttachmentFileWrapper:](v4);
    }
  }
  return v8;
}

- (id)attachmentFromRemoteFileWrapper:()UI
{
  id v4 = [a3 remoteURL];
  id v5 = [a1 addAttachmentWithRemoteFileURL:v4];

  uint64_t v6 = [MEMORY[0x1E4F83498] sharedDownloader];
  [v6 downloadRemoteFileForAttachment:v5];

  [v5 updateChangeCountWithReason:@"Created attachment from remote file wrapper"];
  return v5;
}

- (uint64_t)updateThumbnailAttachmentIdentifier
{
  uint64_t v2 = [a1 thumbnailAttachmentIdentifier];
  if (v2 || ([a1 isPasswordProtected] & 1) != 0)
  {
  }
  else if (([a1 isDeletedOrInTrash] & 1) == 0)
  {
    id v4 = [a1 attachments];
    id v5 = [v4 objectsPassingTest:&__block_literal_global_245];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v13 = 0;
      id v14 = &v13;
      uint64_t v15 = 0x3032000000;
      uint64_t v16 = __Block_byref_object_copy__20;
      id v17 = __Block_byref_object_dispose__20;
      id v18 = 0;
      uint64_t v7 = [a1 textStorage];
      uint64_t v8 = [v7 length];
      uint64_t v9 = *MEMORY[0x1E4FB06B8];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__ICNote_UI__updateThumbnailAttachmentIdentifier__block_invoke_246;
      v12[3] = &unk_1E5FDA768;
      v12[4] = a1;
      v12[5] = &v13;
      objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v12);
      if (v14[5])
      {
        long long v10 = [a1 thumbnailAttachmentIdentifier];
        char v11 = [v10 isEqualToString:v14[5]];

        if ((v11 & 1) == 0)
        {
          [a1 setThumbnailAttachmentIdentifier:v14[5]];

          _Block_object_dispose(&v13, 8);
          return 1;
        }
      }

      _Block_object_dispose(&v13, 8);
    }
  }
  return 0;
}

- (uint64_t)thumbnailImageWithMinSize:()UI scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:
{
  return objc_msgSend(a1, "thumbnailImageWithMinSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:attachment:", 0);
}

- (id)thumbnailImageWithMinSize:()UI scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:attachment:
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__20;
  uint64_t v20 = __Block_byref_object_dispose__20;
  id v21 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __140__ICNote_UI__thumbnailImageWithMinSize_scale_appearanceType_requireAppearance_imageScaling_showAsFileIcon_isMovie_movieDuration_attachment___block_invoke;
  v14[3] = &unk_1E5FDA790;
  v14[4] = &v16;
  *(double *)&v14[5] = a2;
  *(double *)&v14[6] = a3;
  *(double *)&v14[7] = a4;
  char v15 = a7;
  v14[8] = a6;
  v14[9] = a8;
  v14[10] = a9;
  v14[11] = a10;
  v14[12] = a11;
  v14[13] = a12;
  [a1 enumerateAttachmentsInOrderUsingBlock:v14];
  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

+ (id)thumbnailImageForAttachment:()UI minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:
{
  id v14 = 0;
  int v9 = objc_msgSend(a3, "thumbnailImage:minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:", &v14, a9);
  id v10 = v14;
  char v11 = v10;
  if (!v9) {
    id v10 = 0;
  }
  id v12 = v10;

  return v12;
}

- (void)fetchThumbnailImageWithMinSize:()UI scale:cache:appearanceInfo:cacheKey:processingBlock:completionBlock:
{
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  uint64_t v41 = 0;
  int v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  long long v23 = [a1 thumbnailAttachmentIdentifier];
  if (v23)
  {
    double v24 = [a1 attachmentWithIdentifier:v23];
    size_t v25 = [v24 attachmentModel];
    int v26 = [v25 showThumbnailInNoteList];

    if (v26)
    {
      id v27 = [v24 attachmentModel];
      char v28 = [v27 genericListThumbnailCreator];
      char v29 = objc_msgSend(v24, "fetchThumbnailImageWithMinSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:", v19, v18, v20, v21, v22, v28, a2, a3, a4, 0);
      *((unsigned char *)v42 + 24) = v29;
    }
    else
    {
      [a1 setThumbnailAttachmentIdentifier:0];
    }
  }
  if (!*((unsigned char *)v42 + 24) && ([a1 isPasswordProtected] & 1) == 0)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __113__ICNote_UI__fetchThumbnailImageWithMinSize_scale_cache_appearanceInfo_cacheKey_processingBlock_completionBlock___block_invoke;
    v30[3] = &unk_1E5FDA7B8;
    double v37 = &v41;
    double v38 = a2;
    double v39 = a3;
    double v40 = a4;
    id v31 = v19;
    id v32 = v18;
    id v33 = v20;
    id v35 = v21;
    id v36 = v22;
    v34 = a1;
    [a1 enumerateAttachmentsInOrderUsingBlock:v30];
  }
  _Block_object_dispose(&v41, 8);
}

- (void)noteDidApplyAttachmentViewTypeToAllAttachments
{
  v1 = [a1 textStorage];
  unsigned int v27 = [v1 wantsUndoCommands];
  char v29 = v1;
  [v1 setWantsUndoCommands:0];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3010000000;
  double v37 = &unk_1B0BF84BB;
  long long v38 = xmmword_1B0B987A0;
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [v1 length];
  uint64_t v5 = *MEMORY[0x1E4FB06B8];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __60__ICNote_UI__noteDidApplyAttachmentViewTypeToAllAttachments__block_invoke;
  v30[3] = &unk_1E5FDA7E0;
  id v6 = v2;
  id v31 = v6;
  id v7 = v3;
  id v32 = v7;
  id v33 = &v34;
  objc_msgSend(v29, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v30);
  [v29 beginEditing];
  if ([a1 attachmentViewType] == 1 && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    size_t v25 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v26 = 0;
    for (unint64_t i = 0; i < objc_msgSend(v7, "count", v25) - 1; ++i)
    {
      int v9 = [v6 objectAtIndexedSubscript:i];
      id v10 = [v6 objectAtIndexedSubscript:i + 1];
      if ([v9 supportsMultipleThumbnailsOnSameLine])
      {
        uint64_t v11 = objc_opt_class();
        if (v11 == objc_opt_class())
        {
          id v12 = [v7 objectAtIndexedSubscript:i];
          uint64_t v13 = [v12 rangeValue];
          uint64_t v15 = v14;

          uint64_t v16 = [v7 objectAtIndexedSubscript:i + 1];
          uint64_t v17 = [v16 rangeValue];

          if (v17 - (v13 + v15) == 1)
          {
            id v18 = [v29 string];
            uint64_t v19 = v13 - v26 + v15;
            id v20 = objc_msgSend(v18, "substringWithRange:", v19, 1);
            id v21 = [v20 componentsSeparatedByCharactersInSet:v25];
            uint64_t v22 = [v21 count];

            if (v22 == 2)
            {
              objc_msgSend(v29, "replaceCharactersInRange:withString:", v19, 1, &stru_1F0973378);
              ++v26;
            }
          }
        }
      }
    }
    v35[5] -= v26;
  }
  objc_msgSend(v29, "edited:range:changeInLength:", 1, v35[4], v35[5], 0);
  [v29 endEditing];
  [v29 setWantsUndoCommands:v27];
  long long v23 = [a1 noteData];
  [v23 setNeedsToBeSaved:1];

  double v24 = [a1 noteData];
  [v24 saveNoteDataIfNeeded];

  _Block_object_dispose(&v34, 8);
}

- (uint64_t)copyValuesToNote:()UI
{
  id v4 = a3;
  uint64_t v5 = [v4 managedObjectContext];
  [v5 refreshObject:v4 mergeChanges:1];

  id v6 = [a1 creationDate];
  [v4 setCreationDate:v6];

  id v7 = [a1 modificationDate];
  [v4 setModificationDate:v7];

  uint64_t v8 = [a1 snippet];
  [v4 setSnippet:v8];

  int v9 = [a1 title];
  [v4 setTitle:v9];

  objc_msgSend(v4, "setAttachmentViewType:", objc_msgSend(a1, "attachmentViewType"));
  objc_msgSend(v4, "setPaperStyleType:", objc_msgSend(a1, "paperStyleType"));
  objc_msgSend(v4, "setIsPinned:", objc_msgSend(a1, "isPinned"));
  objc_msgSend(v4, "setPreferredBackgroundType:", objc_msgSend(a1, "preferredBackgroundType"));
  id v10 = [a1 replicaIDToUserIDDictData];
  [v4 setReplicaIDToUserIDDictData:v10];

  uint64_t v11 = [a1 replicaIDToNotesVersionData];
  [v4 setReplicaIDToNotesVersionData:v11];

  id v12 = [a1 activityEventsData];
  [v4 setActivityEventsData:v12];

  uint64_t v13 = [a1 outlineStateData];
  [v4 setOutlineStateData:v13];

  objc_msgSend(v4, "setIsSystemPaper:", objc_msgSend(a1, "isSystemPaper"));
  uint64_t v14 = [a1 hostApplicationIdentifier];
  [v4 setHostApplicationIdentifier:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F83350]);
  uint64_t v16 = [a1 identifier];
  uint64_t v17 = (void *)[v15 initWithObjectIdentifier:v16 forPasteboard:0];

  id v18 = [a1 textStorage];
  uint64_t v19 = [v18 mergeableString];
  id v20 = [v19 attributedString];
  id v21 = [v4 managedObjectContext];
  id v32 = 0;
  uint64_t v22 = objc_msgSend(v20, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, v17, v21, &v32);
  id v23 = v32;

  double v24 = [a1 noteData];
  size_t v25 = [v24 data];

  if (v25 && !v22)
  {
    uint64_t v26 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ICNote(UI) copyValuesToNote:](a1);
    }
LABEL_11:
    uint64_t v29 = 0;
    unsigned int v27 = v26;
    id v28 = v23;
    goto LABEL_12;
  }
  if (!v22)
  {
    uint64_t v26 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ICNote(UI) copyValuesToNote:]();
    }
    goto LABEL_11;
  }
  id v31 = v23;
  unsigned int v27 = objc_msgSend(MEMORY[0x1E4F28B18], "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:error:", v22, v17, v4, &v31);
  id v28 = v31;

  if (v27)
  {
    uint64_t v26 = [v4 textStorage];
    if ([v26 wantsUndoCommands])
    {
      [v26 setWantsUndoCommands:0];
      -[NSObject replaceCharactersInRange:withAttributedString:](v26, "replaceCharactersInRange:withAttributedString:", 0, [v26 length], v27);
      uint64_t v29 = 1;
      [v26 setWantsUndoCommands:1];
    }
    else
    {
      -[NSObject replaceCharactersInRange:withAttributedString:](v26, "replaceCharactersInRange:withAttributedString:", 0, [v26 length], v27);
      uint64_t v29 = 1;
    }
  }
  else
  {
    if (!v28)
    {
      uint64_t v29 = 0;
      goto LABEL_13;
    }
    uint64_t v26 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ICNote(UI) copyValuesToNote:](v28);
    }

    uint64_t v29 = 0;
  }
LABEL_12:

LABEL_13:
  [v17 deleteDataFiles];

  return v29;
}

- (void)save
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v2, v3, "Cannot save %@ because mergeable string has error %@", v4, v5, v6, v7, v8);
}

- (void)saveOutlineState
{
  id v9 = [a1 outlineState];
  id v2 = objc_alloc(MEMORY[0x1E4F83448]);
  uint64_t v3 = [a1 textContentStorage];
  uint64_t v4 = [v3 outlineController];
  uint64_t v5 = [v4 collapsedUUIDs];
  uint64_t v6 = (void *)[v2 initWithCollapsedUUIDs:v5];

  if ([v9 mergeWithState:v6])
  {
    uint64_t v7 = [v9 data];
    [a1 setOutlineStateData:v7];

    [a1 updateUserSpecificChangeCountWithReason:@"Updated outline state"];
    uint8_t v8 = [a1 managedObjectContext];
    objc_msgSend(v8, "ic_saveWithLogDescription:", @"Updated outline state");
  }
}

- (void)applyOutlineState
{
  id v5 = [a1 outlineState];
  id v2 = [v5 collapsedUUIDs];
  uint64_t v3 = [a1 textContentStorage];
  uint64_t v4 = [v3 outlineController];
  [v4 setCollapsedUUIDs:v2];
}

- (uint64_t)saveAfterDelay
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a1 selector:sel_save object:0];
  int v2 = [a1 isFastSyncSessionActive];
  double v3 = 0.1;
  if (!v2) {
    double v3 = 2.0;
  }
  return [a1 performSelector:sel_save withObject:0 afterDelay:v3];
}

- (uint64_t)updateModificationDateAndChangeCount
{
  if ((ICInternalSettingsGetBundleBoolSettingValue() & 1) == 0)
  {
    int v2 = [MEMORY[0x1E4F1C9C8] date];
    [a1 setModificationDate:v2];

    if ([a1 isSharedViaICloud])
    {
      double v3 = [a1 modificationDate];
      uint64_t v4 = [a1 lastViewedModificationDate];
      int v5 = objc_msgSend(v3, "ic_isLaterThanDate:", v4);

      if (v5)
      {
        uint64_t v6 = [a1 modificationDate];
        [a1 setLastViewedModificationDate:v6];

        [a1 setNeedsToSaveLastViewedTimestamp:1];
        [a1 updateUserSpecificChangeCountWithReason:@"Updated modification date"];
      }
    }
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F83418];
  uint8_t v8 = [a1 identifier];
  [v7 setDidShowExceededStorageQuotaAlert:0 forNoteWithIdentifier:v8];

  return [a1 updateChangeCountWithReason:@"Updated modification date"];
}

- (uint64_t)updateModificationDateAndChangeCountAndSaveAfterDelay
{
  [a1 updateModificationDateAndChangeCount];
  return [a1 saveAfterDelay];
}

- (uint64_t)updateModificationDateAndChangeCountAndSaveImmediately
{
  [a1 updateModificationDateAndChangeCount];
  return [a1 save];
}

- (uint64_t)isDrawingStroke
{
  v1 = objc_getAssociatedObject(a1, (const void *)kICIsDrawingStrokeKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIsDrawingStroke:()UI
{
  if ([a1 isDrawingStroke] != a3)
  {
    int v5 = (const void *)kICIsDrawingStrokeKey;
    id v6 = [NSNumber numberWithBool:a3];
    objc_setAssociatedObject(a1, v5, v6, (void *)1);
  }
}

- (void)createMissingAttachmentsInTextStorage
{
  id v3 = [a1 textStorage];
  uint64_t v2 = [a1 textStorage];
  objc_msgSend(a1, "filterAttachmentsInTextStorage:range:", v3, 0, objc_msgSend(v2, "length"));
}

- (void)textStorageWillChange:()UI
{
  uint64_t v2 = [a1 managedObjectContext];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__ICNote_UI__textStorageWillChange___block_invoke;
  v3[3] = &unk_1E5FD8DF0;
  v3[4] = a1;
  [v2 performBlockAndWait:v3];
}

- (void)textStorageDidChange:()UI
{
  uint64_t v2 = [a1 managedObjectContext];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__ICNote_UI__textStorageDidChange___block_invoke;
  v3[3] = &unk_1E5FD8DF0;
  v3[4] = a1;
  [v2 performBlockAndWait:v3];
}

- (void)markBlockAndInlineAttachmentsForDeletion:()UI inAttributedString:
{
  uint64_t v6 = *MEMORY[0x1E4FB06B8];
  id v7 = a4;
  uint64_t v8 = [v7 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__ICNote_UI__markBlockAndInlineAttachmentsForDeletion_inAttributedString___block_invoke;
  v9[3] = &unk_1E5FDA880;
  v9[4] = a1;
  char v10 = a3;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v8, 0, v9);
}

- (void)notifyTextViewsNoteWillMerge
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(a1, "textStorage", 0, 0);
  id v3 = [v2 textViews];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = ICProtocolCast();
        id v9 = [a1 textStorage];
        [v8 textStorageWillPerformMerge:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)notifyTextViewsNoteDidMerge
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(a1, "textStorage", 0, 0);
  id v3 = [v2 textViews];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = ICProtocolCast();
        id v9 = [a1 textStorage];
        [v8 textStorageDidPerformMerge:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)announceAccessibilitySelectionChangedByMergeWithSavedSelections:()UI beforeMergeTimestamp:
{
  id v16 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread]
    && ICAccessibilityNeedsAccessibilityElements())
  {
    if ([v16 count] != 2) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"savedSelections.count == 2" functionName:"-[ICNote(UI) announceAccessibilitySelectionChangedByMergeWithSavedSelections:beforeMergeTimestamp:]" simulateCrash:1 showAlert:0 format:@"Expected 2 arrays from -savedSelectionWithSelectionAffinity:"];
    }
    if ([v16 count] == 2)
    {
      uint64_t v7 = [v16 objectAtIndexedSubscript:0];
      uint64_t v8 = [v16 objectAtIndexedSubscript:1];
      uint64_t v9 = [v7 count];
      if (v9 != [v8 count]) {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"textViews.count == selections.count" functionName:"-[ICNote(UI) announceAccessibilitySelectionChangedByMergeWithSavedSelections:beforeMergeTimestamp:]" simulateCrash:1 showAlert:0 format:@"Expected same count for textViews and selections"];
      }
      uint64_t v10 = [v7 count];
      if (v10 == [v8 count])
      {
        long long v11 = [a1 textStorage];
        long long v12 = [v11 mergeableString];

        if ([v7 count])
        {
          unint64_t v13 = 0;
          do
          {
            objc_opt_class();
            uint64_t v14 = [v8 objectAtIndexedSubscript:v13];
            uint64_t v15 = ICCheckedDynamicCast();

            if ([v12 selection:v15 wasModifiedAfter:v6]) {
              [a1 announceAccessibilitySelectionChangedByMerge];
            }

            ++v13;
          }
          while (v13 < [v7 count]);
        }
      }
    }
  }
}

- (void)announceAccessibilitySelectionChangedByMerge
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  obuint64_t j = v2;
  if (!announceAccessibilitySelectionChangedByMerge_lastAnnouncementDate
    || (objc_msgSend(v2, "timeIntervalSinceDate:"), id v3 = obj, v4 > 1.0))
  {
    uint64_t v5 = [a1 textStorage];
    id v6 = [v5 textViews];
    uint64_t v7 = [v6 anyObject];

    int v8 = [v7 isFirstResponder];
    [v7 selectedRange];
    if (v9)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F83770];
      long long v11 = @"Selection changed by remote edit";
    }
    else
    {
      if (!v8)
      {
        long long v12 = 0;
        goto LABEL_9;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F83770];
      long long v11 = @"Insertion point changed by remote edit";
    }
    long long v12 = [v10 localizedFrameworkStringForKey:v11 value:v11 table:0 allowSiri:1];
LABEL_9:
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    objc_storeStrong((id *)&announceAccessibilitySelectionChangedByMerge_lastAnnouncementDate, obj);

    id v3 = obj;
  }
}

- (id)selectedInk
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 selectedInkIdentifier];
  uint64_t v3 = [a1 selectedInkColorString];
  double v4 = (void *)v3;
  uint64_t v5 = 0;
  if (v2 && v3)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "ic_colorFromString:", v3);
    if (v6)
    {
      uint64_t v5 = [MEMORY[0x1E4F38E10] inkWithIdentifier:v2 color:v6 weight:-1.0];
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        uint64_t v10 = v4;
        _os_log_impl(&dword_1B08EB000, v7, OS_LOG_TYPE_DEFAULT, "Could not create ink color from serialized color string: %@", (uint8_t *)&v9, 0xCu);
      }

      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (void)setSelectedInk:()UI
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  [a1 setSelectedInkIdentifier:v5];

  id v7 = [v4 color];

  id v6 = objc_msgSend(v7, "ic_colorString");
  [a1 setSelectedInkColorString:v6];
}

- (id)firstAttachmentInTextStorage
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__20;
  int v8 = __Block_byref_object_dispose__20;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__ICNote_UI__firstAttachmentInTextStorage__block_invoke;
  v3[3] = &unk_1E5FDA808;
  v3[4] = &v4;
  [a1 enumerateAttachmentsInOrderUsingBlock:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)addHashtagToNoteBodyIfMissing:()UI
{
  return [a1 addHashtagToNoteBody:a3 onlyIfMissing:1];
}

- (id)addHashtagToNoteBody:()UI onlyIfMissing:
{
  id v6 = a3;
  if (([a1 isNewNoteWithHashtagsInsertedIntoBody] & 1) == 0) {
    objc_msgSend(a1, "setIsNewNoteWithHashtagsInsertedIntoBody:", objc_msgSend(a1, "isEmpty"));
  }
  if (!a4
    || ([v6 standardizedContent],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [a1 anyVisibleInstanceOfHashtag:v7],
        int v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    id v9 = (void *)MEMORY[0x1E4F833A0];
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    int v8 = (void *)[v9 newHashtagAttachmentWithIdentifier:v11 forHashtag:v6 note:a1 parentAttachment:0];

    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3010000000;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    id v33 = &unk_1B0BF84BB;
    long long v12 = [a1 textStorage];
    uint64_t v34 = [v12 length];
    uint64_t v35 = 0;

    uint64_t v26 = 0;
    unsigned int v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 1;
    unint64_t v13 = [a1 textStorage];
    uint64_t v14 = [a1 managedObjectContext];
    uint64_t v15 = [a1 textStorage];
    uint64_t v16 = objc_msgSend(v15, "ic_range");
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __49__ICNote_UI__addHashtagToNoteBody_onlyIfMissing___block_invoke;
    v25[3] = &unk_1E5FDA8F8;
    v25[4] = a1;
    void v25[5] = &v30;
    v25[6] = &v26;
    objc_msgSend(v13, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v14, v16, v17, 0, v25);

    id v18 = +[ICInlineTextAttachment textAttachmentWithAttachment:v8];
    id v19 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    if (*((unsigned char *)v27 + 24)) {
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n\n"];
    }
    else {
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    }
    [v19 appendAttributedString:v20];

    id v21 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v18];
    [v19 appendAttributedString:v21];

    uint64_t v22 = [a1 textStorage];
    objc_msgSend(v22, "replaceCharactersInRange:withAttributedString:", v31[4], v31[5], v19);

    id v23 = [a1 textStorage];
    [v23 fixupAfterEditing];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
  }

  return v8;
}

- (BOOL)removeHashtag:()UI
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v36 = [MEMORY[0x1E4F1CA80] set];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v5 = [a1 visibleInlineAttachments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  char v35 = 0;
  uint64_t v8 = *(void *)v46;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v46 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      int v11 = [v10 attachmentType];
      long long v12 = [v10 tokenContentIdentifier];
      unint64_t v13 = [v4 standardizedContent];
      int v14 = [v12 isEqualToString:v13];

      if (v11 == 1 && v14 != 0)
      {
        uint64_t v16 = [v10 parentAttachment];

        if (v16)
        {
          uint64_t v17 = [v4 displayText];
          id v18 = objc_msgSend(v17, "ic_withHashtagPrefix");

          id v19 = [v10 parentAttachment];
          id v20 = [v19 attachmentModel];
          [v20 replaceChildInlineAttachment:v10 withText:v18];

          [v36 addObject:v10];
        }
        else
        {
          [v36 addObject:v10];
          char v35 = 1;
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v45 objects:v50 count:16];
  }
  while (v7);

  if (v35)
  {
    id v21 = [a1 textStorage];
    uint64_t v22 = [v21 length];

    id v23 = [a1 textStorage];
    [v23 beginEditing];

    double v24 = [a1 textStorage];
    size_t v25 = [a1 managedObjectContext];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __28__ICNote_UI__removeHashtag___block_invoke;
    v41[3] = &unk_1E5FDA920;
    id v42 = v4;
    uint64_t v43 = a1;
    id v44 = v36;
    objc_msgSend(v24, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v25, 0, v22, 0, v41);

    uint64_t v26 = [a1 textStorage];
    [v26 endEditing];

    uint64_t v5 = v42;
LABEL_17:
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v27 = v36;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(v27);
        }
        [MEMORY[0x1E4F833A0] deleteAttachment:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v29);
  }

  if ([a1 isEmpty]) {
    [MEMORY[0x1E4F83418] deleteEmptyNote:a1];
  }
  BOOL v32 = [v27 count] != 0;

  return v32;
}

+ (void)removeUsageOfHashtag:()UI
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  uint64_t v5 = (void *)MEMORY[0x1E4F83418];
  uint64_t v6 = [v3 standardizedContent];
  uint64_t v7 = [v5 notesContainingHashtagWithStandarizedContent:v6 context:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        objc_opt_class();
        int v14 = objc_msgSend(v4, "objectWithID:", v13, (void)v16);
        uint64_t v15 = ICCheckedDynamicCast();

        [v15 removeHashtag:v3];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (uint64_t)isHashtagRowAtRange:()UI outRangeForAppending:outIndex:forHashtagAttachment:outHashtagCount:
{
  id v14 = a7;
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v31 = 0;
  BOOL v32 = &v31;
  uint64_t v33 = 0x3010000000;
  uint64_t v34 = &unk_1B0BF84BB;
  long long v35 = xmmword_1B0B987A0;
  uint64_t v15 = [a1 textStorage];
  long long v16 = [a1 managedObjectContext];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__ICNote_UI__isHashtagRowAtRange_outRangeForAppending_outIndex_forHashtagAttachment_outHashtagCount___block_invoke;
  v25[3] = &unk_1E5FDA948;
  id v27 = &v44;
  uint64_t v28 = &v31;
  uint64_t v29 = &v36;
  id v17 = v14;
  id v26 = v17;
  uint64_t v30 = &v40;
  objc_msgSend(v15, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v16, a3, a4, 0, v25);

  if (!*((unsigned char *)v45 + 24)) {
    goto LABEL_12;
  }
  long long v18 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  long long v19 = objc_msgSend(NSString, "ic_attachmentCharacterString");
  [v18 addCharactersInString:v19];

  [v18 invert];
  id v20 = [a1 textStorage];
  uint64_t v21 = [v20 string];
  uint64_t v22 = objc_msgSend(v21, "substringWithRange:", a3, a4);

  if ([v22 rangeOfCharacterFromSet:v18] != 0x7FFFFFFFFFFFFFFFLL) {
    *((unsigned char *)v45 + 24) = 0;
  }

  if (*((unsigned char *)v45 + 24))
  {
    if (a5)
    {
      *a5 = v32[5] + v32[4];
      a5[1] = 0;
    }
    if (a8) {
      *a8 = v37[3];
    }
    if (a6) {
      *a6 = v41[3];
    }
    uint64_t v23 = 1;
  }
  else
  {
LABEL_12:
    uint64_t v23 = 0;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v23;
}

- (id)folderSystemImageName
{
  id v1 = [a1 folder];
  uint64_t v2 = [v1 systemImageName];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F83380] defaultSystemImageName];
  }
  uint64_t v5 = v4;

  return v5;
}

+ (uint64_t)defaultNavigationBarIcon
{
  return [MEMORY[0x1E4FB1818] imageNamed:@"NavigationBarIcons/Note"];
}

+ (uint64_t)lockedNavigationBarIcon
{
  return [MEMORY[0x1E4FB1818] imageNamed:@"NavigationBarIcons/LockedNote"];
}

- (id)navigationBarIconWithSize:()UI
{
  if ([a1 isPasswordProtected])
  {
    uint64_t v6 = [(id)objc_opt_class() lockedNavigationBarIcon];
  }
  else
  {
    id v7 = -[ICThumbnailConfiguration initForNoteNavigationBarIconWithNote:preferredSize:]([ICThumbnailConfiguration alloc], "initForNoteNavigationBarIconWithNote:preferredSize:", a1, a2, a3);
    id v8 = +[ICThumbnailService sharedThumbnailService];
    uint64_t v9 = [v8 thumbnailWithConfiguration:v7];
    uint64_t v10 = [v9 image];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [(id)objc_opt_class() defaultNavigationBarIcon];
    }
    uint64_t v6 = v12;
  }
  return v6;
}

- (id)icaxGalleryViewCustomContentDescription
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v3 = [a1 attachments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v51 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v9 = [v8 identifier];
        [v2 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v11 = [a1 inlineAttachments];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        id v17 = [v16 identifier];
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v13);
  }

  long long v18 = [a1 textStorage];
  long long v19 = [v18 attributedString];
  id v20 = objc_msgSend(v19, "ic_attributedSubstringUntilLine:", 13);
  uint64_t v21 = (void *)[v20 mutableCopy];

  uint64_t v22 = *MEMORY[0x1E4FB06B8];
  uint64_t v23 = objc_msgSend(v21, "ic_range");
  uint64_t v25 = v24;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __53__ICNote_UI__icaxGalleryViewCustomContentDescription__block_invoke;
  v44[3] = &unk_1E5FDA970;
  v44[4] = a1;
  v44[5] = v2;
  v44[6] = v10;
  id v26 = v21;
  id v45 = v26;
  objc_msgSend(v26, "enumerateAttribute:inRange:options:usingBlock:", v22, v23, v25, 2, v44);
  uint64_t v27 = *MEMORY[0x1E4F83220];
  uint64_t v28 = objc_msgSend(v26, "ic_range");
  uint64_t v30 = v29;
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  uint64_t v40 = __53__ICNote_UI__icaxGalleryViewCustomContentDescription__block_invoke_2;
  uint64_t v41 = &unk_1E5FDA998;
  uint64_t v42 = a1;
  id v43 = v26;
  id v31 = v26;
  objc_msgSend(v31, "enumerateAttribute:inRange:options:usingBlock:", v27, v28, v30, 2, &v38);
  BOOL v32 = objc_msgSend(v31, "string", v38, v39, v40, v41, v42);
  uint64_t v33 = objc_msgSend(v32, "ic_stringByRemovingWhitespaceOnlyLines");
  uint64_t v34 = [v33 stringByReplacingOccurrencesOfString:@"\n", @", " withString];

  if ([v34 length]) {
    long long v35 = v34;
  }
  else {
    long long v35 = 0;
  }
  id v36 = v35;

  return v36;
}

- (id)_icaxGalleryViewDescriptionForAttachment:()UI fromAttachments:orInlineAttachments:
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  uint64_t v10 = ICDynamicCast();
  objc_opt_class();
  uint64_t v11 = ICDynamicCast();

  if (v10)
  {
    uint64_t v12 = [v10 attachmentIdentifier];
    uint64_t v13 = [v7 objectForKeyedSubscript:v12];

    if (!v13)
    {
      uint64_t v14 = [v10 attachmentIdentifier];
      uint64_t v15 = [v8 objectForKeyedSubscript:v14];

      if (v15)
      {
        long long v16 = [v15 altText];
      }
      else
      {
        long long v16 = 0;
      }

      uint64_t v13 = 0;
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if (v11)
  {
    uint64_t v13 = [v11 attachment];
    if (v13)
    {
LABEL_7:
      long long v16 = [v13 accessibilityDescriptionForType];
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  long long v16 = 0;
LABEL_12:

  return v16;
}

- (uint64_t)_icaxItemNumberForParagraphAtLocation:()UI withStyle:inAttrString:
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  if ([v7 startingItemNumber]) {
    uint64_t v9 = [v7 startingItemNumber];
  }
  else {
    uint64_t v9 = 1;
  }
  uint64_t v24 = v9;
  uint64_t v10 = objc_msgSend(v8, "ic_attributedSubstringFromRange:", 0, a3);
  uint64_t v11 = *MEMORY[0x1E4F83220];
  uint64_t v12 = objc_msgSend(v10, "ic_range");
  uint64_t v14 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__ICNote_UI___icaxItemNumberForParagraphAtLocation_withStyle_inAttrString___block_invoke;
  v18[3] = &unk_1E5FDA9C0;
  id v15 = v7;
  id v19 = v15;
  id v20 = &v21;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, v12, v14, 2, v18);
  uint64_t v16 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v16;
}

- (uint64_t)ic_lineCount
{
  uint64_t v2 = [a1 attributedString];
  id v3 = [v2 string];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [a1 attributedString];
  uint64_t v6 = [v5 string];
  id v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v8 = [v6 componentsSeparatedByCharactersInSet:v7];
  uint64_t v9 = [v8 count];

  return v9;
}

- (uint64_t)ic_wordCount
{
  uint64_t v2 = [a1 attributedString];
  id v3 = [v2 string];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [a1 attributedString];
  uint64_t v6 = [v5 string];
  id v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v8 = [v6 componentsSeparatedByCharactersInSet:v7];
  uint64_t v9 = objc_msgSend(v8, "ic_compactMap:", &__block_literal_global_367);
  uint64_t v10 = [v9 count];

  return v10;
}

- (uint64_t)ic_characterCountIncludingSpaces:()UI
{
  uint64_t v5 = [a1 attributedString];
  uint64_t v6 = [v5 string];
  uint64_t v7 = [v6 length];

  if (!v7) {
    return 0;
  }
  id v8 = [a1 attributedString];
  uint64_t v9 = [v8 string];

  if (a3)
  {
    uint64_t v10 = [v9 length];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v12 = objc_msgSend(v9, "ic_stringByReplacingCharactersInSet:withString:", v11, &stru_1F0973378);
    uint64_t v10 = [v12 length];
  }
  return v10;
}

- (id)searchableItemViewAttributeSet
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v2 = [a1 attachments];
    id v3 = [v2 allObjects];
    uint64_t v4 = [v3 firstObject];
    uint64_t v5 = [v4 previewImages];
    uint64_t v6 = [v5 allObjects];
    uint64_t v7 = [v6 firstObject];

    id v8 = [v7 previewImageURL];
    uint64_t v9 = [MEMORY[0x1E4F83908] makeNoteSearchResultViewWithNote:a1 attachmentURL:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (void)setIsFastSyncSessionActive:()UI .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v3, v4, "Setting isFastSyncSessionActive (%@) for note: %@", v5, v6, v7, v8, v9);
}

- (void)appendAttributedString:()UI options:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = "-[ICNote(UI) appendAttributedString:options:error:]";
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B08EB000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to append attributed string: %@", (uint8_t *)&v1, 0x16u);
}

+ (void)duplicateNote:()UI isPasswordProtected:removeOriginalNote:.cold.1(void *a1)
{
  int v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v2, v3, "Cannot duplicate note without folder {originalNote: %@}", v4, v5, v6, v7, v8);
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v3, v4, "Saved after duplicating note {originalNote: %@, duplicatedNote: %@}", v5, v6, v7, v8, v9);
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v3, v4, "Failed to save after duplicating note {originalNote: %@, duplicatedNote: %@}", v5, v6, v7, v8, v9);
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.3()
{
  OUTLINED_FUNCTION_2_1();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v3, v4, "Failed to save note data — deleting duplicated note {originalNote: %@, duplicatedNote: %@}", v5, v6, v7, v8, v9);
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.4()
{
  OUTLINED_FUNCTION_2_1();
  [v1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() shortLoggingDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v3, v4, "Failed to copy note values — deleting duplicated note {originalNote: %@, duplicatedNote: %@}", v5, v6, v7, v8, v9);
}

+ (void)duplicateNote:()UI intoFolder:isPasswordProtected:removeOriginalNote:.cold.5(void *a1)
{
  uint64_t v2 = [a1 shortLoggingDescription];
  [a1 preventLockReason];
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v3, v4, "Cannot password-protect note {originalNote: %@, reason: %@}", v5, v6, v7, v8, 2u);
}

+ (void)redactNote:()UI .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1B08EB000, a4, OS_LOG_TYPE_ERROR, "Error redacting preview images for attachment %@", a1, 0xCu);
}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v3, v4, "Found an inline attachment (%@) in text of note (%@) that doesn't have an identifier", v5, v6, v7, v8, 2u);
}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v3, v4, "Found an inline attachment (%@) in text of note (%@) that doesn't have a typeUTI", v5, v6, v7, v8, 2u);
}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v3, v4, "Trying to get an inline attachment (%@) that we haven't downloaded yet for a note (%@). Creating a temporary one.", v5, v6, v7, v8, 2u);
}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.4()
{
  OUTLINED_FUNCTION_2_1();
  [v1 attachmentIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v3, v4, "Trying to get an attachment (%@) without an identifier or type for a note (%@)", v5, v6, v7, v8, v9);
}

- (void)attachmentFromObject:()UI createIfNecessary:.cold.5()
{
  OUTLINED_FUNCTION_2_1();
  [v1 attachmentIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5() identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v3, v4, "Trying to get an attachment (%@) that we haven't downloaded yet for a note (%@). Creating a temporary one.", v5, v6, v7, v8, v9);
}

- (void)attachmentFromLegacyAttachmentFileWrapper:()UI .cold.1(void *a1)
{
  id v1 = [a1 attachmentIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v2, v3, "Found a legacy attachment file wrapper for an attachment that hasn't been imported yet: %@'", v4, v5, v6, v7, v8);
}

- (void)copyValuesToNote:()UI .cold.1(void *a1)
{
  id v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v2, v3, "Cannot copy data from note that has non-nil data %@", v4, v5, v6, v7, v8);
}

- (void)copyValuesToNote:()UI .cold.2()
{
  OUTLINED_FUNCTION_2_1();
  id v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v2, v3, "Failed to archive source note (%@): %@", v4, v5, v6, v7, v8);
}

- (void)copyValuesToNote:()UI .cold.3(void *a1)
{
  id v1 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B08EB000, v2, v3, "Error copying values to note %@", v4, v5, v6, v7, v8);
}

- (void)filterAttachmentsInTextStorage:()UI range:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Attachments exceeded", v1, 2u);
}

@end