@interface ICAttachmentSystemPaperModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)canConvertToHTMLForSharing;
- (BOOL)hasDeepLink;
- (BOOL)isIncludedInGenericAttachmentCount;
- (BOOL)preferLocalPreviewImages;
- (BOOL)previewsSupportMultipleAppearances;
- (BOOL)shouldShowInContentInfoText;
- (BOOL)shouldSyncPreviewImageToCloud:(id)a3;
- (CGRect)paperContentBoundsHint;
- (id)account;
- (id)additionalIndexableTextContentInNote;
- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4;
- (id)correctedHardlinkURLFileExtensionForExtension:(id)a3;
- (id)searchableTextContentInNote;
- (void)addMergeableDataToCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5;
- (void)fixupMetadataAndMinimumSupportedNotesVersion;
- (void)setHasDeepLink:(BOOL)a3;
- (void)setPaperContentBoundsHint:(CGRect)a3;
- (void)updateAfterLoadWithInlineAttachmentIdentifierMap:(id)a3;
@end

@implementation ICAttachmentSystemPaperModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  return +[ICAttachmentInlineDrawingModel contentInfoTextWithAttachmentCount:a3];
}

- (CGRect)paperContentBoundsHint
{
  v6 = [(ICAttachmentModel *)self attachment];
  v7 = [v6 metadata];

  if (!v7) {
    goto LABEL_17;
  }
  v8 = [v7 objectForKeyedSubscript:@"paperContentBoundsOriginXKey"];
  v9 = [v7 objectForKeyedSubscript:@"paperContentBoundsOriginYKey"];
  v10 = [v7 objectForKeyedSubscript:@"paperContentBoundsWidthKey"];
  uint64_t v11 = [v7 objectForKeyedSubscript:@"paperContentBoundsHeightKey"];
  v12 = (void *)v11;
  BOOL v13 = !v8 || v9 == 0;
  BOOL v14 = v13 || v10 == 0;
  BOOL v15 = v14 || v11 == 0;
  BOOL v16 = !v15;
  if (!v15)
  {
    [v8 doubleValue];
    double v2 = v17;
    [v9 doubleValue];
    double v3 = v18;
    [v10 doubleValue];
    double v4 = v19;
    [v12 doubleValue];
    double v5 = v20;
  }

  if (!v16)
  {
LABEL_17:
    double v2 = *MEMORY[0x1E4F1DB20];
    double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v21 = v2;
  double v22 = v3;
  double v23 = v4;
  double v24 = v5;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)setPaperContentBoundsHint:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = [(ICAttachmentModel *)self attachment];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ICAttachmentSystemPaperModel_setPaperContentBoundsHint___block_invoke;
  v8[3] = &__block_descriptor_64_e29_v16__0__NSMutableDictionary_8l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  *(CGFloat *)&v8[6] = width;
  *(CGFloat *)&v8[7] = height;
  [v7 updateAttachmentMetadataWithBlock:v8];
}

void __58__ICAttachmentSystemPaperModel_setPaperContentBoundsHint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(a1 + 32));
  double v5 = *(double *)(a1 + 32);
  int IsFinite = TSDRectIsFinite();
  if (IsNull)
  {
    if (IsFinite)
    {
LABEL_9:
      [v3 removeObjectForKey:@"paperContentBoundsOriginXKey"];
      [v3 removeObjectForKey:@"paperContentBoundsOriginYKey"];
      [v3 removeObjectForKey:@"paperContentBoundsWidthKey"];
      [v3 removeObjectForKey:@"paperContentBoundsHeightKey"];
      goto LABEL_10;
    }
LABEL_6:
    uint64_t v11 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(a1 + 56);
      int v16 = 134218752;
      uint64_t v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = v15;
      _os_log_error_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_ERROR, "Ignoring invalid paper content bounds hint rect: x: %lf, y: %lf, width: %lf, height: %lf", (uint8_t *)&v16, 0x2Au);
    }

    goto LABEL_9;
  }
  if (!IsFinite) {
    goto LABEL_6;
  }
  v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:v5];
  [v3 setObject:v7 forKeyedSubscript:@"paperContentBoundsOriginXKey"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
  [v3 setObject:v8 forKeyedSubscript:@"paperContentBoundsOriginYKey"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 48)];
  [v3 setObject:v9 forKeyedSubscript:@"paperContentBoundsWidthKey"];

  v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 56)];
  [v3 setObject:v10 forKeyedSubscript:@"paperContentBoundsHeightKey"];

LABEL_10:
}

- (void)setHasDeepLink:(BOOL)a3
{
  double v4 = [(ICAttachmentModel *)self attachment];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ICAttachmentSystemPaperModel_setHasDeepLink___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  BOOL v6 = a3;
  [v4 updateAttachmentMetadataWithBlock:v5];
}

uint64_t __47__ICAttachmentSystemPaperModel_setHasDeepLink___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"hasDeepLinkKey"];
  }
  else {
    return [a2 removeObjectForKey:@"hasDeepLinkKey"];
  }
}

- (BOOL)hasDeepLink
{
  double v2 = [(ICAttachmentModel *)self attachment];
  id v3 = [v2 metadata];

  double v4 = [v3 objectForKeyedSubscript:@"hasDeepLinkKey"];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (void)addMergeableDataToCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5
{
  if (a4 == 1 && a5)
  {
    id v7 = a5;
    id v10 = [(ICAttachmentModel *)self attachment];
    v8 = [v10 identifier];
    v9 = [v8 dataUsingEncoding:4];
    [v7 setObject:v9 forKey:@"TokenContentIdentifierEncrypted"];
  }
}

- (void)updateAfterLoadWithInlineAttachmentIdentifierMap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICAttachmentModel *)self attachment];
  BOOL v6 = [v5 shortLoggingDescription];

  id v7 = [_TtC11NotesShared21ICSystemPaperDocument alloc];
  v8 = [(ICAttachmentModel *)self attachment];
  v9 = [(ICSystemPaperDocument *)v7 initWithPaperAttachment:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke;
  v11[3] = &unk_1E64A5750;
  id v12 = v6;
  id v10 = v6;
  [(ICSystemPaperDocument *)v9 updateGraphDestinationsUsingInlineAttachmentIdentifierMap:v4 completion:v11];
}

void __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "SystemPaper");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_cold_2(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_cold_1(a1, v5);
  }
}

- (void)fixupMetadataAndMinimumSupportedNotesVersion
{
  v1 = [a1 attachment];
  double v2 = objc_msgSend(v1, "ic_loggingDescription");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "minimumSupportedNotesVersion is (%lld), but attachment is missing compatibility metadata; setting paperHasEnhancedCa"
    "nvas now. Attachment: %@",
    v5,
    v6,
    v7,
    v8,
    v9);
}

- (BOOL)shouldShowInContentInfoText
{
  return 1;
}

- (BOOL)isIncludedInGenericAttachmentCount
{
  return 0;
}

- (BOOL)previewsSupportMultipleAppearances
{
  return 1;
}

- (BOOL)preferLocalPreviewImages
{
  return 0;
}

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  return 1;
}

- (id)additionalIndexableTextContentInNote
{
  double v2 = [(ICAttachmentModel *)self attachment];
  uint64_t v3 = [v2 additionalIndexableText];

  return v3;
}

- (id)searchableTextContentInNote
{
  double v2 = [(ICAttachmentModel *)self attachment];
  uint64_t v3 = [v2 summary];

  if (v3) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  *a3 = @"img";
  uint64_t v4 = [(ICAttachmentModel *)self attachment];
  uint64_t v5 = [v4 fallbackImageData];

  if (v5)
  {
    uint64_t v6 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v7 = +[ICAttachment fallbackImageUTI];
    uint64_t v8 = +[ICAttachment mimeTypeFromUTI:v7];

    objc_msgSend(NSString, "stringWithFormat:", @"style=\"max-width: 100%%; max-height: 100%%;\" src=\"data:%@;base64,%@\"",
      v8,
    uint8_t v9 = v6);
  }
  else
  {
    uint8_t v9 = 0;
  }

  return v9;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 1;
}

- (id)account
{
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  uint64_t v4 = [v3 managedObjectContext];

  uint64_t v8 = 0;
  uint8_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__24;
  id v12 = __Block_byref_object_dispose__24;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__ICAttachmentSystemPaperModel_account__block_invoke;
  v7[3] = &unk_1E64A4528;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__ICAttachmentSystemPaperModel_account__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) attachment];
  double v2 = [v6 note];
  uint64_t v3 = [v2 account];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)correctedHardlinkURLFileExtensionForExtension:(id)a3
{
  return @"png";
}

void __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Updated graph destinations after load {attachment: %@}", (uint8_t *)&v3, 0xCu);
}

void __81__ICAttachmentSystemPaperModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Error updating graph destinations after load {attachment: %@, error: %@}", (uint8_t *)&v4, 0x16u);
}

@end