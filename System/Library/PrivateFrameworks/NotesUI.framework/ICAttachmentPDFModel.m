@interface ICAttachmentPDFModel
@end

@implementation ICAttachmentPDFModel

uint64_t __55__ICAttachmentPDFModel_UI__genericListThumbnailCreator__block_invoke()
{
  return [MEMORY[0x1E4FB1818] imageNamed:@"attachmentbrick_list_loading_file"];
}

uint64_t __56__ICAttachmentPDFModel_UI__genericBrickThumbnailCreator__block_invoke()
{
  return [MEMORY[0x1E4FB1818] imageNamed:@"attachmentbrick_note_loading_file"];
}

void __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ([*(id *)(a1 + 32) needToGeneratePreviews])
  {
    id v10 = [*(id *)(a1 + 32) attachment];
    v6 = [v10 media];
    uint64_t v7 = [v6 mediaURL];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_10(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  uint64_t v3 = [*(id *)(a1 + 32) attachment];
  [v3 setSizeWidth:v2];

  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) attachment];
  [v5 setSizeHeight:v4];
}

uint64_t __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (CGContext *)[a2 CGContext];
  double v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 set];

  CGContextFillRect(v3, *(CGRect *)(a1 + 32));
  CGContextGetCTM(&v7, v3);
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextTranslateCTM(v3, 0.0, -*(double *)(a1 + 72));
  memset(&v7, 0, sizeof(v7));
  CGPDFPageGetDrawingTransform(&v7, *(CGPDFPageRef *)(a1 + 80), kCGPDFCropBox, *(CGRect *)(a1 + 32), 0, 1);
  CGAffineTransform v6 = v7;
  CGContextConcatCTM(v3, &v6);
  return CGContextDrawPDFPageWithAnnotations();
}

void __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) scale];
  id v4 = (id)objc_msgSend(v2, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v3, 1, 0, 0);

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  CGAffineTransform v6 = [*(id *)(a1 + 32) attachment];
  [v6 setPreviewUpdateDate:v5];

  id v7 = [*(id *)(a1 + 32) attachment];
  [v7 updateChangeCountWithReason:@"Generated previews for PDF"];
}

@end