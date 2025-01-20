@interface ICAttachmentGalleryModel(UI)
- (id)activityItems;
- (id)blockingGeneratePDFURL;
- (id)fileURLForTypeIdentifier:()UI;
- (id)previewItemURL;
- (id)providerFileTypes;
- (id)quicklookPreviewItems;
- (uint64_t)genericBrickThumbnailCreator;
- (uint64_t)genericListThumbnailCreator;
- (void)drawPreviewInRect:()UI;
@end

@implementation ICAttachmentGalleryModel(UI)

- (uint64_t)genericListThumbnailCreator
{
  return 0;
}

- (uint64_t)genericBrickThumbnailCreator
{
  return 0;
}

- (id)quicklookPreviewItems
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__81;
  v9 = __Block_byref_object_dispose__81;
  id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "subAttachmentCount"));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__ICAttachmentGalleryModel_UI__quicklookPreviewItems__block_invoke;
  v4[3] = &unk_1E5FDBC00;
  v4[4] = &v5;
  [a1 enumerateSubAttachmentsWithBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)activityItems
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [ICAttachmentGalleryActivityItemSource alloc];
  v3 = [a1 attachment];
  v4 = [(ICAttachmentActivityItemSource *)v2 initWithAttachment:v3];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)previewItemURL
{
  v1 = [a1 attachment];
  id v2 = +[ICDocCamPDFGenerator pdfURLForAttachment:v1];

  return v2;
}

- (id)providerFileTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [(id)*MEMORY[0x1E4F44450] identifier];
  v3[0] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v1;
}

- (id)fileURLForTypeIdentifier:()UI
{
  id v4 = a3;
  if (v4
    && ([MEMORY[0x1E4F442D8] typeWithIdentifier:v4],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 conformsToType:*MEMORY[0x1E4F44450]],
        v5,
        v6))
  {
    uint64_t v7 = [a1 attachment];
    v8 = +[ICDocCamPDFGenerator pdfURLForAttachment:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)drawPreviewInRect:()UI
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v10 = [a1 attachment];
  int v11 = [v10 preferredViewSize];

  if (v11 == 1)
  {
    v32.receiver = a1;
    v32.super_class = (Class)&off_1F0A4D270;
    objc_msgSendSuper2(&v32, sel_drawPreviewInRect_, a2, a3, a4, a5);
  }
  else
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v35.origin.CGFloat x = a2;
    v35.origin.CGFloat y = a3;
    v35.size.double width = a4;
    v35.size.double height = a5;
    CGContextClipToRect(CurrentContext, v35);
    v36.origin.CGFloat x = a2;
    v36.origin.CGFloat y = a3;
    v36.size.double width = a4;
    v36.size.double height = a5;
    v13 = CGPathCreateWithRoundedRect(v36, 16.0, 16.0, 0);
    id v14 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v14 CGColor]);

    CGContextAddPath(CurrentContext, v13);
    CGContextFillPath(CurrentContext);
    CGPathRelease(v13);
    v37.origin.CGFloat x = a2;
    v37.origin.CGFloat y = a3;
    v37.size.double width = a4;
    v37.size.double height = a5;
    CGRect v38 = CGRectInset(v37, 12.0, 12.0);
    CGFloat y = v38.origin.y;
    CGFloat x = v38.origin.x;
    double width = v38.size.width;
    double height = v38.size.height;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForStyle:withFontWeight:", *MEMORY[0x1E4FB28F0], *MEMORY[0x1E4FB09B8]);
    v18 = objc_msgSend(v17, "ic_fontWithSingleLineA");

    uint64_t v19 = *MEMORY[0x1E4FB0700];
    v33[0] = *MEMORY[0x1E4FB06F8];
    v33[1] = v19;
    v34[0] = v18;
    v34[1] = v16;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    v21 = [a1 attachment];
    v22 = [v21 title];

    objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 0, v20, 0, width, height);
    CGFloat v23 = v39.origin.x;
    CGFloat v24 = v39.origin.y;
    CGFloat v25 = v39.size.width;
    double v26 = v39.size.height;
    CGRect v40 = CGRectOffset(v39, x, y);
    objc_msgSend(v22, "drawInRect:withAttributes:", v20, v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0x4028000000000000;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__ICAttachmentGalleryModel_UI__drawPreviewInRect___block_invoke;
    v30[3] = &unk_1E5FDE608;
    *(double *)&v30[5] = height - v26 + -12.0;
    *(CGFloat *)&v30[6] = a2;
    *(CGFloat *)&v30[7] = a3;
    *(CGFloat *)&v30[8] = a4;
    v30[4] = v31;
    *(CGFloat *)&v30[9] = a5;
    *(CGFloat *)&v30[10] = v23;
    *(CGFloat *)&v30[11] = v24;
    *(CGFloat *)&v30[12] = v25;
    *(double *)&v30[13] = v26;
    [a1 enumerateSubAttachmentsWithBlock:v30];
    CGContextRestoreGState(CurrentContext);
    _Block_object_dispose(v31, 8);
  }
}

- (id)blockingGeneratePDFURL
{
  v1 = [a1 attachment];
  id v2 = +[ICDocCamPDFGenerator blockingGeneratePDFURLForAttachment:v1 withProgress:0 error:0];

  return v2;
}

@end