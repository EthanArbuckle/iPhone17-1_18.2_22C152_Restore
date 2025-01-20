@interface ICAttachmentInlineDrawingModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)canConvertToHTMLForSharing;
- (BOOL)hasPreviews;
- (BOOL)isIncludedInGenericAttachmentCount;
- (BOOL)preferLocalPreviewImages;
- (BOOL)previewsSupportMultipleAppearances;
- (BOOL)providesStandaloneTitleForNote;
- (BOOL)shouldShowInContentInfoText;
- (BOOL)shouldSyncPreviewImageToCloud:(id)a3;
- (BOOL)showThumbnailInNoteList;
- (PKDrawing)handwritingRecognitionDrawing;
- (id)additionalIndexableTextContentInNote;
- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4;
- (id)correctedHardlinkURLFileExtensionForExtension:(id)a3;
- (id)newDrawingFromMergeableData;
- (id)searchableTextContentInNote;
- (id)standaloneTitleForNote;
- (void)newDrawingFromMergeableData;
- (void)setHandwritingRecognitionDrawing:(id)a3;
@end

@implementation ICAttachmentInlineDrawingModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Handwritten note" value:@"Handwritten note" table:0 allowSiri:1];
}

- (BOOL)shouldShowInContentInfoText
{
  return 1;
}

- (BOOL)isIncludedInGenericAttachmentCount
{
  return 0;
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)previewsSupportMultipleAppearances
{
  return 1;
}

- (BOOL)preferLocalPreviewImages
{
  return 1;
}

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  return 1;
}

- (BOOL)showThumbnailInNoteList
{
  if (![(ICAttachmentModel *)self hasThumbnailImage]) {
    return 0;
  }
  v3 = [(ICAttachmentModel *)self attachment];
  v4 = [v3 previewImages];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)providesStandaloneTitleForNote
{
  return 1;
}

- (id)standaloneTitleForNote
{
  v3 = [(ICAttachmentModel *)self attachment];
  v4 = [v3 userTitle];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v6 = [(ICAttachmentModel *)self attachment];
    id v5 = [v6 title];
  }
  if (![v5 length])
  {
    uint64_t v7 = +[ICNote defaultTitleForEmptyNote];

    id v5 = (id)v7;
  }

  return v5;
}

- (id)additionalIndexableTextContentInNote
{
  v2 = [(ICAttachmentModel *)self attachment];
  v3 = [v2 additionalIndexableText];

  return v3;
}

- (id)searchableTextContentInNote
{
  v2 = [(ICAttachmentModel *)self attachment];
  v3 = [v2 summary];

  if (v3) {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  *a3 = @"img";
  v4 = [(ICAttachmentModel *)self attachment];
  id v5 = [v4 fallbackImageData];

  if (v5)
  {
    v6 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v7 = +[ICAttachment fallbackImageUTI];
    v8 = +[ICAttachment mimeTypeFromUTI:v7];

    objc_msgSend(NSString, "stringWithFormat:", @"style=\"max-width: 100%%; max-height: 100%%;\" src=\"data:%@;base64,%@\"",
      v8,
    v9 = v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 1;
}

- (id)correctedHardlinkURLFileExtensionForExtension:(id)a3
{
  return @"png";
}

- (PKDrawing)handwritingRecognitionDrawing
{
  return (PKDrawing *)objc_getAssociatedObject(self, (const void *)ICHandwritingRecognitionDrawingKey);
}

- (void)setHandwritingRecognitionDrawing:(id)a3
{
}

- (id)newDrawingFromMergeableData
{
  v2 = [(ICAttachmentModel *)self attachment];
  v3 = [v2 mergeableData];

  if ([v3 length])
  {
    id v8 = 0;
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F38DF8]) initWithData:v3 error:&v8];
    id v5 = v8;
    if (v5)
    {
      v6 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(ICAttachmentInlineDrawingModel *)(uint64_t)v5 newDrawingFromMergeableData];
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)newDrawingFromMergeableData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "newDrawingFromMergeableData error creating currentDrawing %@", (uint8_t *)&v2, 0xCu);
}

@end