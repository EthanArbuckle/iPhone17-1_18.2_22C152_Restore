@interface ICAttachmentImageModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)canConvertToHTMLForSharing;
- (BOOL)canMarkup;
- (BOOL)canSaveURL;
- (BOOL)hasPreviews;
- (BOOL)hasThumbnailImage;
- (BOOL)needsFullSizePreview;
- (BOOL)shouldCropImage;
- (BOOL)shouldUsePlaceholderBoundsIfNecessary;
- (BOOL)supportsImageClassification;
- (BOOL)supportsOCR;
- (BOOL)supportsQuickLook;
- (CGAffineTransform)previewImageOrientationTransform;
- (CGSize)sizeByCroppingSize:(CGSize)a3;
- (double)placeholderHeight;
- (double)placeholderWidth;
- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4;
- (id)generateHardLinkURLIfNecessaryForURL:(id)a3;
- (id)placeholderImageSystemName;
- (id)previewImageTypeUTI;
- (id)previewItemTitle;
- (id)saveURL;
- (int64_t)previewImageOrientation;
- (void)addLocation;
- (void)updateAttachmentSize;
- (void)updateFileBasedAttributes;
@end

@implementation ICAttachmentImageModel

- (BOOL)needsFullSizePreview
{
  v3 = [(ICAttachmentModel *)self attachment];
  if ([v3 imageFilterType])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(ICAttachmentModel *)self attachment];
    v6 = [v5 markupModelData];
    if ([v6 length])
    {
      BOOL v4 = 1;
    }
    else
    {
      v7 = [(ICAttachmentModel *)self attachment];
      if ([v7 orientation]) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = [(ICAttachmentImageModel *)self shouldCropImage];
      }
    }
  }

  return v4;
}

- (BOOL)shouldCropImage
{
  v2 = [(ICAttachmentModel *)self attachment];
  [v2 croppingQuadBottomLeftX];
  if (fabs(v3) >= 0.00999999978
    || ([v2 croppingQuadBottomLeftY], fabs(v4) >= 0.00999999978)
    || ([v2 croppingQuadBottomRightX], fabs(v5 + -1.0) >= 0.00999999978)
    || ([v2 croppingQuadBottomRightY], fabs(v6) >= 0.00999999978)
    || ([v2 croppingQuadTopLeftX], fabs(v7) >= 0.00999999978)
    || ([v2 croppingQuadTopLeftY], fabs(v8 + -1.0) >= 0.00999999978)
    || ([v2 croppingQuadTopRightX], fabs(v9 + -1.0) >= 0.00999999978))
  {
    BOOL v11 = 1;
  }
  else
  {
    [v2 croppingQuadTopRightY];
    BOOL v11 = fabs(v10 + -1.0) >= 0.00999999978;
  }

  return v11;
}

- (id)placeholderImageSystemName
{
  return @"photo";
}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  double v4 = NSString;
  double v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_PHOTOS_%lu" value:@"NOTE_LIST_PHOTOS_%lu" table:0 allowSiri:1];
  double v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (id)previewImageTypeUTI
{
  double v3 = [(ICAttachmentModel *)self attachment];
  int v4 = [v3 isChildOfDocumentGallery];

  if (v4)
  {
    double v5 = [(id)*MEMORY[0x1E4F44410] identifier];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICAttachmentImageModel;
    double v5 = [(ICAttachmentModel *)&v7 previewImageTypeUTI];
  }
  return v5;
}

- (id)previewItemTitle
{
  double v3 = [(ICAttachmentModel *)self attachment];
  int v4 = [v3 isChildOfDocumentGallery];

  if (v4)
  {
    double v5 = [(ICAttachmentModel *)self attachment];
    double v6 = [v5 parentAttachment];
    objc_super v7 = [v6 attachmentModel];
    double v8 = [(ICAttachmentModel *)self attachment];
    double v9 = [v7 titleForSubAttachment:v8];

    if (v9) {
      goto LABEL_6;
    }
    uint64_t v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Scan" value:@"Scan" table:0 allowSiri:1];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ICAttachmentImageModel;
    uint64_t v10 = [(ICAttachmentModel *)&v12 previewItemTitle];
  }
  double v9 = (void *)v10;
LABEL_6:
  return v9;
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)hasThumbnailImage
{
  v9.receiver = self;
  v9.super_class = (Class)ICAttachmentImageModel;
  if (![(ICAttachmentModel *)&v9 hasThumbnailImage]) {
    return 0;
  }
  double v3 = [(ICAttachmentModel *)self attachment];
  [v3 sizeWidth];
  if (v4 >= 50.0)
  {
    double v6 = [(ICAttachmentModel *)self attachment];
    [v6 sizeHeight];
    BOOL v5 = v7 >= 50.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canMarkup
{
  return 1;
}

- (id)saveURL
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  BOOL v11 = __Block_byref_object_copy__53;
  objc_super v12 = __Block_byref_object_dispose__53;
  id v13 = 0;
  double v3 = [(ICAttachmentModel *)self attachment];
  double v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__ICAttachmentImageModel_saveURL__block_invoke;
  v7[3] = &unk_1E64A44A8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__ICAttachmentImageModel_saveURL__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attachment];
  int v3 = [v2 isChildOfDocumentGallery];

  if (v3)
  {
    double v4 = [*(id *)(a1 + 32) attachment];
    [v4 sizeWidth];
    double v6 = v5;
    double v7 = [*(id *)(a1 + 32) attachment];
    [v7 sizeHeight];
    double v9 = v8;

    uint64_t v10 = [*(id *)(a1 + 32) attachment];
    objc_msgSend(v10, "attachmentPreviewImageWithMinSize:scale:", v6, v9, 1.0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = [v17 orientedPreviewImageURL];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    v18.receiver = *(id *)(a1 + 32);
    v18.super_class = (Class)ICAttachmentImageModel;
    uint64_t v14 = objc_msgSendSuper2(&v18, sel_saveURL);
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (BOOL)canSaveURL
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v3 = [(ICAttachmentModel *)self attachment];
  double v4 = [v3 managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__ICAttachmentImageModel_canSaveURL__block_invoke;
  v6[3] = &unk_1E64A44A8;
  v6[4] = self;
  v6[5] = &v7;
  [v4 performBlockAndWait:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __36__ICAttachmentImageModel_canSaveURL__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attachment];
  int v3 = [v2 isChildOfDocumentGallery];

  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v4.receiver = *(id *)(a1 + 32);
    v4.super_class = (Class)ICAttachmentImageModel;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSendSuper2(&v4, sel_canSaveURL);
  }
}

- (id)generateHardLinkURLIfNecessaryForURL:(id)a3
{
  id v4 = a3;
  double v5 = [(ICAttachmentModel *)self attachment];
  char v6 = [v5 isChildOfDocumentGallery];

  if (v6)
  {
    uint64_t v7 = [(ICAttachmentImageModel *)self previewItemTitle];
    if (v7)
    {
      v10.receiver = self;
      v10.super_class = (Class)ICAttachmentImageModel;
      double v8 = [(ICAttachmentModel *)&v10 generateHardLinkURLIfNecessaryForURL:v4 withFileName:v7];
    }
    else
    {
      double v8 = 0;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICAttachmentImageModel;
    double v8 = [(ICAttachmentModel *)&v11 generateHardLinkURLIfNecessaryForURL:v4];
  }

  return v8;
}

- (BOOL)supportsOCR
{
  v2 = [(ICAttachmentModel *)self attachment];
  char v3 = [v2 isPasswordProtected] ^ 1;

  return v3;
}

- (BOOL)supportsImageClassification
{
  char v3 = [(ICAttachmentModel *)self attachment];
  if ([v3 isPasswordProtected])
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [(ICAttachmentModel *)self attachment];
    BOOL v4 = [v5 attachmentType] == 3;
  }
  return v4;
}

- (void)updateFileBasedAttributes
{
  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentImageModel;
  [(ICAttachmentModel *)&v3 updateFileBasedAttributes];
  [(ICAttachmentImageModel *)self updateAttachmentSize];
}

- (void)addLocation
{
  objc_super v3 = [(ICAttachmentModel *)self attachment];
  BOOL v4 = [v3 media];
  int v5 = [v4 isValid];

  if (v5)
  {
    char v6 = [(ICAttachmentModel *)self attachment];
    uint64_t v7 = [v6 media];
    CFURLRef v8 = [v7 mediaURL];
    uint64_t v9 = CGImageSourceCreateWithURL(v8, 0);

    if (v9)
    {
      CFDictionaryRef v23 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
      objc_super v10 = [(__CFDictionary *)v23 objectForKey:*MEMORY[0x1E4F2FA18]];
      objc_super v11 = v10;
      if (v10)
      {
        uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FA40]];
        id v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2FA50]];
        uint64_t v14 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2FA48]];
        uint64_t v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2FA58]];
        v16 = (void *)v15;
        if (v12 && v13 && v14 && v15)
        {
          [v12 doubleValue];
          double v18 = v17;
          [v13 doubleValue];
          double v20 = v19;
          if (!objc_msgSend(v14, "compare:options:range:", @"S", 1, 0, 1)) {
            double v18 = -v18;
          }
          if (!objc_msgSend(v16, "compare:options:range:", @"W", 1, 0, 1)) {
            double v20 = -v20;
          }
          v21 = [(ICAttachmentModel *)self attachment];
          id v22 = (id)[v21 addLocationWithLatitude:v18 longitude:v20];
        }
      }
      CFRelease(v9);
    }
  }
}

- (void)updateAttachmentSize
{
  objc_super v3 = [(ICAttachmentModel *)self attachment];
  int v4 = [v3 isPasswordProtected];

  int v5 = [(ICAttachmentModel *)self attachment];
  char v6 = [v5 media];
  uint64_t v7 = v6;
  if (v4)
  {
    int v8 = [v6 isAuthenticated];

    if (!v8) {
      return;
    }
    uint64_t v9 = [(ICAttachmentModel *)self attachment];
    objc_super v10 = [v9 media];
    CFDataRef v11 = [v10 decryptedData];

    if (v11) {
      uint64_t v12 = CGImageSourceCreateWithData(v11, 0);
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    id v13 = [v6 mediaURL];

    if (!v13) {
      return;
    }
    CFDataRef v11 = [(ICAttachmentModel *)self attachment];
    uint64_t v14 = [(__CFData *)v11 media];
    CFURLRef v15 = [v14 mediaURL];
    uint64_t v12 = CGImageSourceCreateWithURL(v15, 0);
  }
  if (v12)
  {
    CFDictionaryRef v16 = CGImageSourceCopyPropertiesAtIndex(v12, 0, 0);
    CFDictionaryRef v49 = v16;
    if (!v16)
    {
LABEL_41:
      CFRelease(v12);

      return;
    }
    double v17 = [(__CFDictionary *)v16 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
    double v18 = [(__CFDictionary *)v49 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
    double v19 = [(__CFDictionary *)v49 objectForKeyedSubscript:*MEMORY[0x1E4F2F6B0]];
    double v20 = [(__CFDictionary *)v49 objectForKeyedSubscript:*MEMORY[0x1E4F2F6A8]];
    if (!v17 || !v18)
    {
LABEL_40:

      goto LABEL_41;
    }
    [v17 doubleValue];
    double v22 = v21;
    [v18 doubleValue];
    double v24 = v23;
    if (v19)
    {
      [v19 doubleValue];
      if (v25 > 72.0)
      {
        [v19 doubleValue];
        if (v26 < 300.0)
        {
          [v19 doubleValue];
          double v22 = round(v22 * 72.0 / v27);
        }
      }
    }
    if (v20)
    {
      [v20 doubleValue];
      if (v28 > 72.0)
      {
        [v20 doubleValue];
        if (v29 < 300.0)
        {
          [v20 doubleValue];
          double v24 = round(v24 * 72.0 / v30);
        }
      }
    }
    if ([(ICAttachmentImageModel *)self shouldCropImage])
    {
      -[ICAttachmentImageModel sizeByCroppingSize:](self, "sizeByCroppingSize:", v22, v24);
      double v22 = v31;
      double v24 = v32;
    }
    v33 = [(__CFDictionary *)v49 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
    v34 = v33;
    if (v33)
    {
      uint64_t v35 = [v33 integerValue];
      if (v35 <= 4) {
        double v36 = v24;
      }
      else {
        double v36 = v22;
      }
      if (v35 > 4) {
        double v22 = v24;
      }
      double v24 = v36;
    }
    v37 = [(ICAttachmentModel *)self attachment];
    unsigned int v38 = [v37 orientation];

    if (v38 <= 7 && ((1 << v38) & 0xCC) != 0)
    {
      double v39 = v22;
    }
    else
    {
      double v39 = v24;
      double v24 = v22;
    }
    v40 = [(ICAttachmentModel *)self attachment];
    [v40 sizeWidth];
    double v42 = v41;

    if (v42 != v24)
    {
      v43 = [(ICAttachmentModel *)self attachment];
      [v43 setSizeWidth:v24];
    }
    v44 = [(ICAttachmentModel *)self attachment];
    [v44 sizeHeight];
    double v46 = v45;

    if (v46 == v39)
    {
      if (v42 == v24)
      {
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      v47 = [(ICAttachmentModel *)self attachment];
      [v47 setSizeHeight:v39];
    }
    v48 = [(ICAttachmentModel *)self attachment];
    [v48 updateChangeCountWithReason:@"Updated attachment size"];

    goto LABEL_39;
  }
}

- (CGSize)sizeByCroppingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  char v6 = [(ICAttachmentModel *)self attachment];
  [v6 croppingQuadBottomLeftX];
  double v8 = width * v7;

  uint64_t v9 = [(ICAttachmentModel *)self attachment];
  [v9 croppingQuadBottomLeftY];
  double v11 = height * v10;

  uint64_t v12 = [(ICAttachmentModel *)self attachment];
  [v12 croppingQuadBottomRightX];
  double v14 = width * v13;

  CFURLRef v15 = [(ICAttachmentModel *)self attachment];
  [v15 croppingQuadBottomRightY];
  double v17 = height * v16;

  double v18 = [(ICAttachmentModel *)self attachment];
  [v18 croppingQuadTopLeftX];
  double v20 = width * v19;

  double v21 = [(ICAttachmentModel *)self attachment];
  [v21 croppingQuadTopLeftY];
  double v23 = height * v22;

  double v24 = [(ICAttachmentModel *)self attachment];
  [v24 croppingQuadTopRightX];
  double v26 = width * v25;

  double v27 = [(ICAttachmentModel *)self attachment];
  [v27 croppingQuadTopRightY];
  double v29 = height * v28;

  double v30 = sqrt((v23 - v29) * (v23 - v29) + (v20 - v26) * (v20 - v26));
  double v31 = sqrt((v17 - v11) * (v17 - v11) + (v14 - v8) * (v14 - v8));
  double v32 = sqrt((v23 - v11) * (v23 - v11) + (v20 - v8) * (v20 - v8));
  double v33 = sqrt((v17 - v29) * (v17 - v29) + (v14 - v26) * (v14 - v26));
  float v34 = v30 / v31;
  float v35 = v32 / v33;
  if (v34 <= 1.0) {
    float v34 = 1.0 / v34;
  }
  if (v35 <= 1.0) {
    float v35 = 1.0 / v35;
  }
  if (v35 >= v34) {
    float v36 = v35;
  }
  else {
    float v36 = v34;
  }
  if (v36 > 2.0)
  {
    double v37 = 2.0 / v36;
    float v35 = v37 * v35;
    float v34 = v37 * v34;
  }
  if (v32 < v33) {
    double v32 = v33;
  }
  if (v30 < v31) {
    double v30 = v31;
  }
  double v38 = ceil(v30 * v35) + -2.0;
  double v39 = ceil(v32 * v34) + -2.0;
  result.double height = v39;
  result.double width = v38;
  return result;
}

- (BOOL)supportsQuickLook
{
  return 1;
}

- (CGAffineTransform)previewImageOrientationTransform
{
  memset(&v14, 0, sizeof(v14));
  int v5 = [(ICAttachmentModel *)self attachment];
  uint64_t v6 = (int)[v5 orientation];
  double v7 = [(ICAttachmentModel *)self attachment];
  [v7 sizeWidth];
  double v9 = v8;
  double v10 = [(ICAttachmentModel *)self attachment];
  [v10 sizeHeight];
  ICTransformFromImageOrientation(v6, (uint64_t)&v14, v9, v11);

  CGAffineTransform v13 = v14;
  return CGAffineTransformInvert(retstr, &v13);
}

- (int64_t)previewImageOrientation
{
  v2 = [(ICAttachmentModel *)self attachment];
  int64_t v3 = (int)[v2 orientation];

  return v3;
}

- (BOOL)shouldUsePlaceholderBoundsIfNecessary
{
  int64_t v3 = [(ICAttachmentModel *)self attachment];
  if ([v3 fileSize])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    int v5 = [(ICAttachmentModel *)self attachment];
    uint64_t v6 = [v5 typeUTI];
    int v4 = [v6 isEqual:@"public.image"] ^ 1;
  }
  return v4;
}

- (double)placeholderWidth
{
  return 540.0;
}

- (double)placeholderHeight
{
  return 460.0;
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  *a3 = @"img";
  int v5 = [(ICAttachmentModel *)self attachment];
  uint64_t v6 = [v5 media];
  double v7 = [v6 data];

  double v8 = [v7 base64EncodedStringWithOptions:0];
  double v9 = [(ICAttachmentModel *)self attachment];
  double v10 = [v9 typeUTI];
  double v11 = +[ICAttachment mimeTypeFromUTI:v10];

  objc_msgSend(NSString, "stringWithFormat:", @"style=\"max-width: 100%%; max-height: 100%%;\" src=\"data:%@;base64,%@\"",
    v11,
  uint64_t v12 = v8);

  return v12;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 1;
}

@end