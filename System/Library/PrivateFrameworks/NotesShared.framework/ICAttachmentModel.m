@interface ICAttachmentModel
+ (Class)modelClassForAttachmentType:(signed __int16)a3;
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
+ (void)deletePreviewItemHardLinkURLs;
- (AVAsset)asset;
- (BOOL)canConvertToHTMLForSharing;
- (BOOL)canMarkup;
- (BOOL)canSaveURL;
- (BOOL)canSaveURLWithOtherAttachments;
- (BOOL)hasDeepLink;
- (BOOL)hasPreviews;
- (BOOL)hasThumbnailImage;
- (BOOL)hidesSubAttachmentsInAttachmentBrowser;
- (BOOL)isGeneratingPreviews;
- (BOOL)isIncludedInGenericAttachmentCount;
- (BOOL)isMergeableDataDirty;
- (BOOL)isReadyToPresent;
- (BOOL)mergeWithMergeableData:(id)a3;
- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4;
- (BOOL)needsFullSizePreview;
- (BOOL)preferLocalPreviewImages;
- (BOOL)previewGenerationOperationCancelled;
- (BOOL)previewsSupportMultipleAppearances;
- (BOOL)providesStandaloneTitleForNote;
- (BOOL)providesTextContentInNote;
- (BOOL)requiresPostProcessing;
- (BOOL)shouldCropImage;
- (BOOL)shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:(id)a3;
- (BOOL)shouldShowInContentInfoText;
- (BOOL)shouldSyncPreviewImageToCloud:(id)a3;
- (BOOL)shouldUsePlaceholderBoundsIfNecessary;
- (BOOL)showThumbnailInNoteList;
- (BOOL)supportsImageClassification;
- (BOOL)supportsOCR;
- (BOOL)supportsQuickLook;
- (BOOL)usesChildAttachment:(id)a3;
- (CGAffineTransform)previewImageOrientationTransform;
- (CGSize)intrinsicContentSize;
- (ICAttachment)attachment;
- (ICAttachmentModel)initWithAttachment:(id)a3;
- (NSString)hardLinkVersion;
- (NSString)placeholderImageSystemName;
- (NSString)previewImageTypeUTI;
- (NSURL)saveURL;
- (NSUUID)currentReplicaID;
- (double)placeholderHeight;
- (double)placeholderWidth;
- (id)additionalIndexableTextContentInNote;
- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4;
- (id)correctedHardlinkURLFileExtensionForExtension:(id)a3;
- (id)dataForQuickLook;
- (id)dataForTypeIdentifier:(id)a3;
- (id)fileURLForTypeIdentifier:(id)a3;
- (id)generateHardLinkURLIfNecessaryForURL:(id)a3;
- (id)generateHardLinkURLIfNecessaryForURL:(id)a3 withFileName:(id)a4;
- (id)generateTemporaryURLWithExtension:(id)a3;
- (id)hardLinkFolderURL;
- (id)localizedFallbackSubtitleIOS;
- (id)localizedFallbackSubtitleMac;
- (id)localizedFallbackTitle;
- (id)mergeableDataForCopying;
- (id)mergeableDataForCopying:(id *)a3;
- (id)previewItemTitle;
- (id)previewItemURL;
- (id)providerFileTypes;
- (id)searchableTextContent;
- (id)searchableTextContentForLocation;
- (id)searchableTextContentInNote;
- (id)standaloneTitleForNote;
- (id)textContentInNote;
- (id)titleForSubAttachment:(id)a3;
- (int64_t)previewImageOrientation;
- (signed)sectionForSubAttachments;
- (void)addMergeableDataToCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5;
- (void)assetWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteChildAttachments;
- (void)mergeMergeableDataFromCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5;
- (void)setGeneratingPreviews:(BOOL)a3;
- (void)setHasDeepLink:(BOOL)a3;
- (void)setMergeableDataDirty:(BOOL)a3;
- (void)setPreviewGenerationOperationCancelled:(BOOL)a3;
- (void)undeleteChildAttachments;
- (void)updateAttachmentMarkedForDeletionStateAttachmentIsInUse:(BOOL)a3;
- (void)updateFileBasedAttributes;
- (void)writeMergeableData;
@end

@implementation ICAttachmentModel

- (CGSize)intrinsicContentSize
{
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  v13 = &unk_1C3E4C23B;
  long long v14 = *MEMORY[0x1E4F1DB30];
  v3 = [(ICAttachmentModel *)self attachment];
  v4 = [v3 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__ICAttachmentModel_intrinsicContentSize__block_invoke;
  v9[3] = &unk_1E64A4528;
  v9[4] = self;
  v9[5] = &v10;
  [v4 performBlockAndWait:v9];

  double v5 = v11[4];
  double v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  double v7 = v5;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

void __41__ICAttachmentModel_intrinsicContentSize__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) attachment];
  [v7 sizeWidth];
  uint64_t v3 = v2;
  v4 = [*(id *)(a1 + 32) attachment];
  [v4 sizeHeight];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v6;
}

- (ICAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);
  return (ICAttachment *)WeakRetained;
}

- (ICAttachmentModel)initWithAttachment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentModel;
  uint64_t v5 = [(ICAttachmentModel *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attachment, v4);
  }

  return v6;
}

+ (Class)modelClassForAttachmentType:(signed __int16)a3
{
  uint64_t v3 = objc_opt_class();
  return (Class)v3;
}

- (void).cxx_destruct
{
}

- (void)updateAttachmentMarkedForDeletionStateAttachmentIsInUse:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(ICAttachmentModel *)self attachment];
  uint64_t v6 = v5;
  if (a3)
  {
    if ([v5 needsInitialRelationshipSetup])
    {
      id v7 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_super v8 = [v6 identifier];
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "Setting needsInitialRelationshipSetup=NO on %@", buf, 0xCu);
      }
      [v6 setNeedsInitialRelationshipSetup:0];
    }
  }
  else if (([v5 needsInitialFetchFromCloud] & 1) == 0 {
         && ([v6 isBeingEditedLocallyOnDevice] & 1) == 0)
  }
  {
    int v9 = [v6 needsInitialRelationshipSetup] ^ 1;
    goto LABEL_9;
  }
  int v9 = 0;
LABEL_9:
  if (![v6 markedForDeletion] || (v9 & 1) != 0)
  {
    if (([v6 markedForDeletion] & 1) == 0 && ((v9 ^ 1) & 1) == 0)
    {
      uint64_t v12 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = [v6 shortLoggingDescription];
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "Marking attachment for deletion because it is not in use: %@", buf, 0xCu);
      }
      +[ICAttachment deleteAttachment:v6];
      long long v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v15 = [(ICAttachmentModel *)self attachment];
      v18 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [v14 postNotificationName:@"ICAttachmentDeletedNotification" object:0 userInfo:v16];
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [v6 shortLoggingDescription];
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_INFO, "Unmarking attachment for deletion because it is in use: %@", buf, 0xCu);
    }
    +[ICAttachment undeleteAttachment:v6];
  }
}

- (void)dealloc
{
  if (objc_opt_respondsToSelector()) {
    [(ICAttachmentModel *)self attachmentModelDealloc];
  }
  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentModel;
  [(ICAttachmentModel *)&v3 dealloc];
}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  id v4 = NSString;
  uint64_t v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_ATTACHMENTS_%lu" value:@"NOTE_LIST_ATTACHMENTS_%lu" table:0 allowSiri:1];
  uint64_t v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (BOOL)shouldShowInContentInfoText
{
  return 1;
}

- (BOOL)isIncludedInGenericAttachmentCount
{
  return 1;
}

- (NSUUID)currentReplicaID
{
  uint64_t v2 = [(ICAttachmentModel *)self attachment];
  objc_super v3 = [v2 currentReplicaID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
  }
  uint64_t v6 = v5;

  return (NSUUID *)v6;
}

- (BOOL)mergeWithMergeableData:(id)a3
{
  return [(ICAttachmentModel *)self mergeWithMergeableData:a3 mergeableFieldState:0];
}

- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(ICAttachmentModel *)self attachment];
  [v6 setMergeableData:v5];

  return 0;
}

- (void)writeMergeableData
{
}

- (void)addMergeableDataToCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v7 = a3;
  objc_super v8 = [(ICAttachmentModel *)self attachment];
  int v9 = [v8 isPasswordProtected];

  if (v9) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"!self.attachment.isPasswordProtected" functionName:"-[ICAttachmentModel addMergeableDataToCloudKitRecord:approach:mergeableFieldState:]" simulateCrash:1 showAlert:0 format:@"Locked notes should use encrypted values JSON instead"];
  }
  id v11 = [(ICAttachmentModel *)self attachment];
  uint64_t v10 = [v11 mergeableData];
  objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v10, @"MergeableData", a4);
}

- (void)mergeMergeableDataFromCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v13 = a5;
  id v7 = objc_msgSend(a3, "ic_encryptedInlineableDataAssetForKeyPrefix:", @"MergeableData");
  if (v7)
  {
    [(ICAttachmentModel *)self mergeWithMergeableData:v7 mergeableFieldState:v13];
    if ([(ICAttachmentModel *)self providesTextContentInNote])
    {
      [(ICAttachmentModel *)self regenerateTextContentInNote];
      objc_super v8 = [(ICAttachmentModel *)self attachment];
      int v9 = [v8 note];
      if ([v9 needsInitialFetchFromCloud])
      {
LABEL_6:

        goto LABEL_7;
      }
      uint64_t v10 = [(ICAttachmentModel *)self attachment];
      int v11 = [v10 isInNoteTitleOrSnippet];

      if (v11)
      {
        objc_super v8 = [(ICAttachmentModel *)self attachment];
        int v9 = [v8 note];
        [v9 regenerateTitle:1 snippet:1];
        goto LABEL_6;
      }
    }
LABEL_7:
    uint64_t v12 = [(ICAttachmentModel *)self attachment];
    [v12 saveMergeableDataIfNeeded];
  }
}

- (BOOL)hasPreviews
{
  return 0;
}

- (BOOL)previewsSupportMultipleAppearances
{
  return 0;
}

- (BOOL)preferLocalPreviewImages
{
  return 0;
}

- (BOOL)needsFullSizePreview
{
  return 0;
}

- (BOOL)requiresPostProcessing
{
  if ([(ICAttachmentModel *)self supportsOCR]) {
    return 1;
  }
  return [(ICAttachmentModel *)self supportsImageClassification];
}

- (BOOL)supportsOCR
{
  return 0;
}

- (BOOL)supportsImageClassification
{
  return 0;
}

- (NSString)previewImageTypeUTI
{
  return (NSString *)[(id)*MEMORY[0x1E4F44460] identifier];
}

- (NSString)hardLinkVersion
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__23;
  long long v14 = __Block_byref_object_dispose__23;
  id v15 = 0;
  objc_super v3 = [(ICAttachmentModel *)self attachment];
  id v4 = [v3 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__ICAttachmentModel_hardLinkVersion__block_invoke;
  v9[3] = &unk_1E64A4528;
  v9[4] = self;
  v9[5] = &v10;
  [v4 performBlockAndWait:v9];

  id v5 = NSString;
  [(id)v11[5] timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "stringWithFormat:", @"%ld", (uint64_t)v6);
  _Block_object_dispose(&v10, 8);

  return (NSString *)v7;
}

void __36__ICAttachmentModel_hardLinkVersion__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 modificationDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasThumbnailImage
{
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  if ([v3 markedForDeletion])
  {
    BOOL v4 = 0;
  }
  else if ([(ICAttachmentModel *)self hasPreviews])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(ICAttachmentModel *)self attachment];
    double v6 = [v5 media];
    id v7 = [v6 mediaURL];
    BOOL v4 = v7 != 0;
  }
  return v4;
}

- (BOOL)showThumbnailInNoteList
{
  return 0;
}

- (BOOL)canMarkup
{
  return 0;
}

- (NSURL)saveURL
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__23;
  uint64_t v12 = __Block_byref_object_dispose__23;
  id v13 = 0;
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  BOOL v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__ICAttachmentModel_saveURL__block_invoke;
  v7[3] = &unk_1E64A4528;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSURL *)v5;
}

void __28__ICAttachmentModel_saveURL__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v6 media];
  uint64_t v3 = [v2 mediaURL];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)canSaveURL
{
  uint64_t v2 = [(ICAttachmentModel *)self saveURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canSaveURLWithOtherAttachments
{
  return 1;
}

- (id)searchableTextContent
{
  BOOL v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = [(ICAttachmentModel *)self searchableTextContentForLocation];
  if (v4) {
    [v3 appendString:v4];
  }

  return v3;
}

- (id)searchableTextContentForLocation
{
  uint64_t v2 = [(ICAttachmentModel *)self attachment];
  BOOL v3 = [v2 location];

  if (v3 && [v3 placeUpdated])
  {
    uint64_t v4 = [v3 placemark];

    if (v4)
    {
      id v5 = [v3 searchStrings];
      uint64_t v4 = [v5 componentsJoinedByString:@" "];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)searchableTextContentInNote
{
  return 0;
}

- (BOOL)providesTextContentInNote
{
  return 0;
}

- (id)textContentInNote
{
  return 0;
}

- (BOOL)providesStandaloneTitleForNote
{
  return 0;
}

- (id)standaloneTitleForNote
{
  return 0;
}

- (id)additionalIndexableTextContentInNote
{
  return 0;
}

- (signed)sectionForSubAttachments
{
  return 0;
}

- (BOOL)hidesSubAttachmentsInAttachmentBrowser
{
  return 0;
}

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  return 1;
}

- (BOOL)shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)shouldCropImage
{
  return 0;
}

- (BOOL)hasDeepLink
{
  return 0;
}

- (BOOL)shouldUsePlaceholderBoundsIfNecessary
{
  return 0;
}

- (NSString)placeholderImageSystemName
{
  return 0;
}

- (double)placeholderWidth
{
  return 0.0;
}

- (double)placeholderHeight
{
  return 0.0;
}

- (void)deleteChildAttachments
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = [(ICAttachmentModel *)self attachment];
  uint64_t v4 = [v3 subAttachments];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        +[ICAttachment deleteAttachment:*(void *)(*((void *)&v19 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v9 = [(ICAttachmentModel *)self attachment];
  uint64_t v10 = [v9 inlineAttachments];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        +[ICBaseAttachment deleteAttachment:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)undeleteChildAttachments
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = [(ICAttachmentModel *)self attachment];
  uint64_t v4 = [v3 subAttachments];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        +[ICAttachment undeleteAttachment:*(void *)(*((void *)&v19 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v9 = [(ICAttachmentModel *)self attachment];
  uint64_t v10 = [v9 inlineAttachments];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        +[ICBaseAttachment undeleteAttachment:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)isReadyToPresent
{
  BOOL v3 = [(ICAttachmentModel *)self attachment];
  if ([v3 needsToBeRequested])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    uint64_t v5 = [(ICAttachmentModel *)self attachment];
    int v4 = [v5 isUnsupported] ^ 1;
  }
  return v4;
}

- (void)updateFileBasedAttributes
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(ICAttachmentModel *)self attachment];
  int v4 = [v3 media];
  int v5 = [v4 isValid];

  if (v5)
  {
    uint64_t v6 = [(ICAttachmentModel *)self attachment];
    uint64_t v7 = [v6 media];
    int v8 = [v7 isPasswordProtected];

    int v9 = [(ICAttachmentModel *)self attachment];
    uint64_t v10 = [v9 media];
    uint64_t v11 = v10;
    if (v8) {
      [v10 encryptedMediaURL];
    }
    else {
    uint64_t v12 = [v10 mediaURL];
    }

    id v38 = 0;
    uint64_t v13 = *MEMORY[0x1E4F1C5F8];
    [v12 getResourceValue:&v38 forKey:*MEMORY[0x1E4F1C5F8] error:0];
    id v14 = v38;
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = [v14 integerValue];
    }
    else
    {
      id v37 = 0;
      [v12 getResourceValue:&v37 forKey:*MEMORY[0x1E4F1C628] error:0];
      id v15 = v37;
      if ([v15 BOOLValue])
      {
        long long v17 = [MEMORY[0x1E4F28CB8] defaultManager];
        long long v18 = [MEMORY[0x1E4F1C978] arrayWithObject:v13];
        v30 = v17;
        v31 = v12;
        long long v19 = [v17 enumeratorAtURL:v12 includingPropertiesForKeys:v18 options:0 errorHandler:0];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v16 = 0;
          uint64_t v23 = *(void *)v34;
          do
          {
            uint64_t v24 = 0;
            uint64_t v25 = v15;
            do
            {
              if (*(void *)v34 != v23) {
                objc_enumerationMutation(v20);
              }
              v26 = *(void **)(*((void *)&v33 + 1) + 8 * v24);
              id v32 = 0;
              int v27 = [v26 getResourceValue:&v32 forKey:v13 error:0];
              id v15 = v32;

              if (v27) {
                v16 += [v15 integerValue];
              }
              ++v24;
              uint64_t v25 = v15;
            }
            while (v22 != v24);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v39 count:16];
          }
          while (v22);
        }
        else
        {
          uint64_t v16 = 0;
        }

        uint64_t v12 = v31;
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
    v28 = [(ICAttachmentModel *)self attachment];
    [v28 setFileSize:v16];

    v29 = [(ICAttachmentModel *)self attachment];
    [v29 updateChangeCountWithReason:@"Updated file-based attributes"];
  }
}

- (CGAffineTransform)previewImageOrientationTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (int64_t)previewImageOrientation
{
  return 0;
}

- (id)localizedFallbackTitle
{
  return 0;
}

- (id)localizedFallbackSubtitleIOS
{
  return 0;
}

- (id)localizedFallbackSubtitleMac
{
  return 0;
}

- (BOOL)usesChildAttachment:(id)a3
{
  return 1;
}

- (AVAsset)asset
{
  return 0;
}

- (void)assetWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(ICAttachmentModel *)self asset];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  return 0;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 0;
}

+ (void)deletePreviewItemHardLinkURLs
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSTemporaryDirectory();
  long long v19 = [v2 stringByAppendingPathComponent:@"HardLinkURLTemp"];

  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 removeItemAtPath:v19 error:0];

  long long v4 = +[ICNoteContext sharedContext];
  id v5 = [v4 workerManagedObjectContext];

  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__23;
  id v38 = __Block_byref_object_dispose__23;
  id v39 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __50__ICAttachmentModel_deletePreviewItemHardLinkURLs__block_invoke;
  v31[3] = &unk_1E64A4528;
  long long v33 = &v34;
  id v32 = v5;
  id v17 = v32;
  [v32 performBlockAndWait:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)v35[5];
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
        uint64_t v21 = 0;
        uint64_t v22 = &v21;
        uint64_t v23 = 0x3032000000;
        uint64_t v24 = __Block_byref_object_copy__23;
        uint64_t v25 = __Block_byref_object_dispose__23;
        id v26 = 0;
        uint64_t v10 = [v9 managedObjectContext];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __50__ICAttachmentModel_deletePreviewItemHardLinkURLs__block_invoke_2;
        v20[3] = &unk_1E64A4528;
        v20[4] = v9;
        v20[5] = &v21;
        [v10 performBlockAndWait:v20];

        uint64_t v11 = +[ICAccount accountUtilities];
        uint64_t v12 = [v11 temporaryDirectoryURLForAccountIdentifier:v22[5]];
        uint64_t v13 = [(id)v12 URLByAppendingPathComponent:@"HardLinkURLTemp" isDirectory:1];

        id v14 = [v13 path];
        LOBYTE(v12) = [v14 isEqualToString:v19];

        if ((v12 & 1) == 0)
        {
          id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v15 removeItemAtURL:v13 error:0];
        }
        _Block_object_dispose(&v21, 8);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v40 count:16];
    }
    while (v6);
  }

  uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotificationName:@"ICAttachmentModelDidDeleteHardLinksNotification" object:0];

  _Block_object_dispose(&v34, 8);
}

void __50__ICAttachmentModel_deletePreviewItemHardLinkURLs__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[ICAccount allAccountsInContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __50__ICAttachmentModel_deletePreviewItemHardLinkURLs__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)hardLinkFolderURL
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__23;
  id v26 = __Block_byref_object_dispose__23;
  id v27 = 0;
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  long long v4 = [v3 managedObjectContext];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __38__ICAttachmentModel_hardLinkFolderURL__block_invoke;
  v21[3] = &unk_1E64A4528;
  v21[4] = self;
  v21[5] = &v22;
  [v4 performBlockAndWait:v21];

  id v5 = +[ICAccount accountUtilities];
  uint64_t v6 = [v5 temporaryDirectoryURLForAccountIdentifier:v23[5]];

  uint64_t v7 = [v6 URLByAppendingPathComponent:@"HardLinkURLTemp" isDirectory:1];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__23;
  long long v19 = __Block_byref_object_dispose__23;
  id v20 = 0;
  uint64_t v8 = [(ICAttachmentModel *)self attachment];
  int v9 = [v8 managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__ICAttachmentModel_hardLinkFolderURL__block_invoke_2;
  v14[3] = &unk_1E64A4528;
  v14[4] = self;
  v14[5] = &v15;
  [v9 performBlockAndWait:v14];

  uint64_t v10 = [v7 URLByAppendingPathComponent:v16[5] isDirectory:1];

  uint64_t v11 = [(ICAttachmentModel *)self hardLinkVersion];
  uint64_t v12 = [v10 URLByAppendingPathComponent:v11 isDirectory:1];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __38__ICAttachmentModel_hardLinkFolderURL__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v7 note];
  uint64_t v3 = [v2 account];
  uint64_t v4 = [v3 identifier];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __38__ICAttachmentModel_hardLinkFolderURL__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)titleForSubAttachment:(id)a3
{
  return 0;
}

- (id)previewItemURL
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__23;
  uint64_t v12 = __Block_byref_object_dispose__23;
  id v13 = 0;
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  uint64_t v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ICAttachmentModel_previewItemURL__block_invoke;
  v7[3] = &unk_1E64A44A8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __35__ICAttachmentModel_previewItemURL__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) needsFullSizePreview])
  {
    uint64_t v2 = [*(id *)(a1 + 32) attachment];
    uint64_t v3 = [v2 media];
    char v4 = [v3 isPasswordProtected];

    if ((v4 & 1) == 0)
    {
      uint64_t v21 = [*(id *)(a1 + 32) attachment];
      [v21 sizeWidth];
      double v23 = v22;
      uint64_t v24 = [*(id *)(a1 + 32) attachment];
      [v24 sizeHeight];
      double v26 = v25;

      id v27 = [*(id *)(a1 + 32) attachment];
      uint64_t v12 = objc_msgSend(v27, "attachmentPreviewImageWithMinSize:scale:", v23, v26, 1.0);

      uint64_t v20 = [v12 orientedPreviewImageURL];
      goto LABEL_10;
    }
  }
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v6 = [v5 media];
  uint64_t v7 = [v6 mediaURL];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    int v9 = [*(id *)(a1 + 32) attachment];
    uint64_t v10 = [v9 media];
    char v11 = [v10 isPasswordProtected];

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [*(id *)(a1 + 32) attachment];
      id v13 = [v12 media];
      uint64_t v14 = [v13 prepareExportableMediaURL];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

LABEL_11:
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v17 = [*(id *)(a1 + 32) attachment];
  long long v18 = [v17 URL];

  long long v19 = [*(id *)(a1 + 32) attachment];
  uint64_t v12 = v19;
  if (v18)
  {
    uint64_t v20 = [v19 URL];
LABEL_10:
    uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v20;
    goto LABEL_11;
  }
  if (![v19 hasFallbackPDF]) {
    goto LABEL_12;
  }
  id v32 = [*(id *)(a1 + 32) attachment];
  char v33 = [v32 isPasswordProtected];

  if ((v33 & 1) == 0)
  {
    uint64_t v12 = [*(id *)(a1 + 32) attachment];
    uint64_t v20 = [v12 fallbackPDFURL];
    goto LABEL_10;
  }
LABEL_13:
  uint64_t v29 = [*(id *)(a1 + 32) generateHardLinkURLIfNecessaryForURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
  v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v29;
}

- (id)generateTemporaryURLWithExtension:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentModel *)self hardLinkFolderURL];
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [v5 URLByAppendingPathComponent:v7 isDirectory:0];

  int v9 = [v8 URLByAppendingPathExtension:v4];

  uint64_t v10 = [v9 pathExtension];
  LOBYTE(v7) = [v10 isEqualToString:v4];

  if ((v7 & 1) == 0)
  {
    char v11 = [v9 URLByDeletingPathExtension];
    uint64_t v12 = [v11 URLByAppendingPathExtension:v4];

    int v9 = (void *)v12;
  }

  return v9;
}

- (id)generateHardLinkURLIfNecessaryForURL:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentModel *)self attachment];
  uint64_t v6 = [v5 title];
  uint64_t v7 = [(ICAttachmentModel *)self generateHardLinkURLIfNecessaryForURL:v4 withFileName:v6];

  return v7;
}

- (id)generateHardLinkURLIfNecessaryForURL:(id)a3 withFileName:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFileURL] && objc_msgSend(v7, "length"))
  {
    uint64_t v8 = objc_msgSend(v7, "ic_sanitizedFilenameString");
    if (![v8 length]) {
      goto LABEL_5;
    }
    int v9 = [v6 lastPathComponent];
    uint64_t v10 = [(ICAttachmentModel *)self attachment];
    char v11 = [v10 title];
    char v12 = [v9 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      uint64_t v14 = [(ICAttachmentModel *)self hardLinkFolderURL];
      id v13 = [v14 URLByAppendingPathComponent:v8 isDirectory:0];

      uint64_t v15 = [v6 pathExtension];
      uint64_t v16 = [(ICAttachmentModel *)self correctedHardlinkURLFileExtensionForExtension:v15];

      uint64_t v17 = [v13 pathExtension];
      char v18 = [v17 isEqualToString:v16];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = [v13 URLByAppendingPathExtension:v16];

        id v13 = (void *)v19;
      }
      if (([v13 checkResourceIsReachableAndReturnError:0] & 1) == 0)
      {
        uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v21 = [v13 URLByDeletingLastPathComponent];
        [v20 removeItemAtURL:v21 error:0];

        double v22 = [v13 URLByDeletingLastPathComponent];
        double v23 = [v22 path];
        char v24 = [v20 fileExistsAtPath:v23];

        if ((v24 & 1) == 0)
        {
          double v25 = [v13 URLByDeletingLastPathComponent];
          [v20 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:0 error:0];
        }
        double v26 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v30 = 0;
        [v26 linkItemAtURL:v6 toURL:v13 error:&v30];
        id v27 = v30;

        if (v27)
        {
          uint64_t v28 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = v27;
            _os_log_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_DEFAULT, "Error creating hard link for previewItemURL: %@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
LABEL_5:
      id v13 = v6;
    }

    id v6 = v13;
  }

  return v6;
}

- (id)correctedHardlinkURLFileExtensionForExtension:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)previewItemTitle
{
  uint64_t v2 = [(ICAttachmentModel *)self attachment];
  id v3 = [v2 title];

  return v3;
}

- (BOOL)supportsQuickLook
{
  id v3 = [(ICAttachmentModel *)self attachment];
  id v4 = [v3 media];

  if (v4) {
    return 1;
  }
  id v6 = [(ICAttachmentModel *)self attachment];
  char v7 = [v6 hasFallbackPDF];

  return v7;
}

- (id)dataForQuickLook
{
  id v3 = [(ICAttachmentModel *)self attachment];
  id v4 = [v3 media];

  id v5 = [(ICAttachmentModel *)self attachment];
  id v6 = v5;
  if (v4)
  {
    char v7 = [v5 media];
    uint64_t v8 = [v7 decryptedData];

LABEL_5:
    goto LABEL_7;
  }
  int v9 = [v5 hasFallbackPDF];

  if (v9)
  {
    id v6 = [(ICAttachmentModel *)self attachment];
    uint64_t v8 = [v6 fallbackPDFData];
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:
  return v8;
}

- (id)providerFileTypes
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(ICAttachmentModel *)self attachment];
  if ([v3 isPasswordProtected]) {
    goto LABEL_6;
  }
  id v4 = [(ICAttachmentModel *)self attachment];
  id v5 = [v4 media];
  if (([v5 hasFile] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  id v6 = [(ICAttachmentModel *)self attachment];
  char v7 = [v6 typeUTI];

  if (v7)
  {
    uint64_t v8 = [(ICAttachmentModel *)self attachment];
    int v9 = [v8 typeUTI];
    v12[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:
  return v10;
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentModel *)self attachment];
  if (([v5 isPasswordProtected] & 1) == 0)
  {
    char v7 = [(ICAttachmentModel *)self attachment];
    uint64_t v8 = [v7 media];
    int v9 = [v8 isValid];

    if (v9)
    {
      id v5 = [(ICAttachmentModel *)self attachment];
      uint64_t v10 = [v5 typeUTI];
      if ([v4 isEqualToString:v10])
      {

        goto LABEL_6;
      }
      if (!v4)
      {
        id v6 = 0;
        goto LABEL_11;
      }
      uint64_t v11 = [v4 length];

      if (!v11)
      {
LABEL_6:
        id v5 = [(ICAttachmentModel *)self attachment];
        uint64_t v10 = [v5 media];
        id v6 = [v10 mediaURL];
LABEL_11:

        goto LABEL_12;
      }
    }
    id v6 = 0;
    goto LABEL_13;
  }
  id v6 = 0;
LABEL_12:

LABEL_13:
  return v6;
}

- (id)dataForTypeIdentifier:(id)a3
{
  id v3 = [(ICAttachmentModel *)self fileURLForTypeIdentifier:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)mergeableDataForCopying:(id *)a3
{
  [(ICAttachmentModel *)self persistPendingChanges];
  id v4 = [(ICAttachmentModel *)self attachment];
  id v5 = [v4 mergeableData];

  return v5;
}

- (id)mergeableDataForCopying
{
  return [(ICAttachmentModel *)self mergeableDataForCopying:0];
}

- (BOOL)previewGenerationOperationCancelled
{
  return self->_previewGenerationOperationCancelled;
}

- (void)setPreviewGenerationOperationCancelled:(BOOL)a3
{
  self->_previewGenerationOperationCancelled = a3;
}

- (BOOL)isMergeableDataDirty
{
  return self->_mergeableDataDirty;
}

- (void)setMergeableDataDirty:(BOOL)a3
{
  self->_mergeableDataDirty = a3;
}

- (BOOL)isGeneratingPreviews
{
  return self->_generatingPreviews;
}

- (void)setGeneratingPreviews:(BOOL)a3
{
  self->_generatingPreviews = a3;
}

- (void)setHasDeepLink:(BOOL)a3
{
  self->_hasDeepLink = a3;
}

@end