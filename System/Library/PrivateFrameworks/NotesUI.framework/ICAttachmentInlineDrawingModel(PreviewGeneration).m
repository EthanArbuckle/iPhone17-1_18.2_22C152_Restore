@interface ICAttachmentInlineDrawingModel(PreviewGeneration)
+ (id)generateImageForAttachment:()PreviewGeneration fromDrawing:fullResolution:appearanceInfo:;
+ (id)previewImageFromDrawing:()PreviewGeneration fullImage:scale:;
+ (uint64_t)drawingPreviewVersion;
+ (void)generatePreviewsForAttachment:()PreviewGeneration fromDrawing:;
- (BOOL)needToGeneratePreviews;
- (uint64_t)generatePreviewsDuringCloudActivity;
- (uint64_t)generatePreviewsInOperation:()PreviewGeneration;
@end

@implementation ICAttachmentInlineDrawingModel(PreviewGeneration)

- (uint64_t)generatePreviewsDuringCloudActivity
{
  return 0;
}

- (BOOL)needToGeneratePreviews
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v6 = [a1 attachment];
  v7 = [v6 previewImages];
  unint64_t v8 = [v7 count];
  if (v8 < 2)
  {
    int v10 = 0;
  }
  else
  {
    v2 = [a1 attachment];
    v3 = [v2 previewUpdateDate];
    if (v3)
    {
      v4 = [a1 attachment];
      if ([v4 hasFallbackImage])
      {

        BOOL v9 = 0;
        goto LABEL_12;
      }
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
    }
  }
  v11 = [a1 attachment];
  v12 = [v11 mergeableData];
  BOOL v9 = v12 != 0;

  if (!v10)
  {
    if (v8 < 2) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  if (v8 > 1)
  {
LABEL_12:
  }
LABEL_13:

  v13 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = NSStringFromSelector(a2);
    v18 = [a1 attachment];
    v19 = [v18 identifier];
    v20 = [a1 attachment];
    v21 = [v20 previewImages];
    *(_DWORD *)buf = 138413314;
    v24 = v16;
    __int16 v25 = 2112;
    v26 = v17;
    __int16 v27 = 2112;
    v28 = v19;
    __int16 v29 = 1024;
    BOOL v30 = v9;
    __int16 v31 = 2048;
    uint64_t v32 = [v21 count];
    _os_log_debug_impl(&dword_1B08EB000, v13, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewImages.count %lu", buf, 0x30u);
  }
  return v9;
}

+ (uint64_t)drawingPreviewVersion
{
  return (unsigned __int16)([MEMORY[0x1E4F83370] serializationVersion] + 1);
}

+ (id)previewImageFromDrawing:()PreviewGeneration fullImage:scale:
{
  id v6 = a4;
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v15 = safeCanvasBoundsForDrawing(v6);
  double v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;

  v61.origin.CGFloat x = v8;
  v61.origin.CGFloat y = v10;
  v61.size.double width = v12;
  v61.size.double height = v14;
  v74.origin.CGFloat x = v15;
  v74.origin.CGFloat y = v17;
  double r2 = v19;
  v74.size.double width = v19;
  v74.size.double height = v21;
  CGRect v62 = CGRectIntersection(v61, v74);
  CGRect v63 = CGRectOffset(v62, -v15, -v17);
  CGFloat y = v63.origin.y;
  double width = v63.size.width;
  if (v63.size.width == *MEMORY[0x1E4F1DB30] && v63.size.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    CGFloat y = 0.0;
    double height = 100.0;
    double width = 100.0;
    CGFloat x = 0.0;
  }
  else
  {
    double height = v63.size.height;
    if (v63.size.width < 50.0 || v63.size.height < 50.0)
    {
      if ((50.0 - v63.size.width) * -0.5 <= 0.0) {
        double v27 = (50.0 - v63.size.width) * -0.5;
      }
      else {
        double v27 = 0.0;
      }
      if ((50.0 - v63.size.height) * -0.5 <= 0.0) {
        double v28 = (50.0 - v63.size.height) * -0.5;
      }
      else {
        double v28 = 0.0;
      }
      CGRect v64 = CGRectInset(v63, v27, v28);
      v75.origin.CGFloat x = v15;
      v75.origin.CGFloat y = v17;
      v75.size.double width = r2;
      v75.size.double height = v21;
      CGRect v65 = CGRectIntersection(v64, v75);
      CGFloat x = v65.origin.x;
      CGFloat y = v65.origin.y;
      double width = v65.size.width;
      double height = v65.size.height;
    }
    else
    {
      CGFloat x = v63.origin.x;
    }
  }
  BOOL v30 = (CGContext *)TSUCreateRGBABitmapContext();
  if (v30)
  {
    __int16 v31 = v30;
    CGContextTranslateCTM(v30, 30.72, 30.72);
    double v32 = 322.56;
    double v33 = 322.56 / height;
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.double width = width;
    v66.size.double height = height;
    double rect_24 = v21 - CGRectGetMaxY(v66);
    CGFloat rect = x;
    if (width <= height * 4.0)
    {
      double v40 = 322.56 / width;
      if (height <= width * 4.0)
      {
        if (width <= height)
        {
          double v35 = width * v33;
          double rect_8 = (322.56 - width * v33) * 0.5;
          double rect_16 = 0.0;
        }
        else
        {
          double v35 = 322.56;
          double v32 = height * v40;
          double rect_8 = 0.0;
          double rect_16 = (322.56 - height * v40) * 0.5;
        }
        double v37 = x;
        double v38 = height;
        double v34 = width;
        double v36 = rect_24;
      }
      else
      {
        double v38 = width + 30.72 / v40;
        v68.origin.CGFloat x = x;
        v68.origin.CGFloat y = rect_24;
        v68.size.double width = width;
        v68.size.double height = height;
        double v36 = CGRectGetMaxY(v68) - v38;
        double rect_8 = 0.0;
        double v32 = 353.28;
        double v35 = 322.56;
        double rect_16 = -30.72;
        double v37 = x;
        double v34 = width;
      }
    }
    else
    {
      double v34 = height + 30.72 / v33;
      double rect_16 = 0.0;
      double v35 = 353.28;
      if (objc_msgSend(MEMORY[0x1E4FB0850], "ic_isRTL"))
      {
        v67.origin.CGFloat x = rect;
        double v36 = rect_24;
        v67.origin.CGFloat y = rect_24;
        v67.size.double width = width;
        v67.size.double height = height;
        double v37 = CGRectGetMaxX(v67) - v34;
        double rect_8 = -30.72;
        double v38 = height;
      }
      else
      {
        double v37 = rect;
        double v38 = height;
        double v36 = rect_24;
        double rect_8 = 0.0;
      }
    }
    size_t v41 = CGImageGetWidth(a5);
    CGAffineTransformMakeScale(&v59, (double)v41 / (r2 * a1) * a1, (double)v41 / (r2 * a1) * a1);
    v69.origin.CGFloat x = v37;
    v69.origin.CGFloat y = v36;
    v69.size.double width = v34;
    v69.size.double height = v38;
    CGRect v70 = CGRectApplyAffineTransform(v69, &v59);
    double v42 = v70.origin.x;
    double v43 = v70.origin.y;
    double v44 = v70.size.width;
    if (v70.size.width / v70.size.height != v35 / v32
      && vabdd_f64(v70.size.width / v70.size.height, v35 / v32) >= fabs(v35 / v32 * 0.000000999999997))
    {
      v45 = (void *)MEMORY[0x1E4F836F8];
      v46 = NSStringFromCGRect(v70);
      v71.origin.CGFloat x = rect_8;
      v71.origin.CGFloat y = rect_16;
      v71.size.double width = v35;
      v71.size.double height = v32;
      v47 = NSStringFromCGRect(v71);
      v72.origin.CGFloat x = rect;
      v72.origin.CGFloat y = rect_24;
      v72.size.double width = width;
      v72.size.double height = height;
      v48 = NSStringFromCGRect(v72);
      [v45 handleFailedAssertWithCondition:"TSUEqualFloats(scaledReadRect.size.width / scaledReadRect.size.height, drawRect.size.width / drawRect.size.height)", "+[ICAttachmentInlineDrawingModel(PreviewGeneration) previewImageFromDrawing:fullImage:scale:]", 1, 0, @"The aspect ratio of the rect for reading %@ should be the same as the aspect ratio for drawing %@, with strokebounds %@", v46, v47, v48 functionName simulateCrash showAlert format];
    }
    CGFloat v49 = v35 / v44 * (double)CGImageGetWidth(a5);
    v73.size.double height = v35 / v44 * (double)CGImageGetHeight(a5);
    v73.origin.CGFloat x = rect_8 - v42 * (v35 / v44);
    v73.origin.CGFloat y = rect_16 - v43 * (v35 / v44);
    v73.size.double width = v49;
    CGContextDrawImage(v31, v73, a5);
    CGImageRef Image = CGBitmapContextCreateImage(v31);
    if (Image)
    {
      CGImageRef v51 = Image;
      v39 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithCGImage:", Image);
      CFRelease(v51);
    }
    else
    {
      v39 = 0;
    }
    CGContextRelease(v31);
  }
  else
  {
    v39 = 0;
  }
  return v39;
}

+ (id)generateImageForAttachment:()PreviewGeneration fromDrawing:fullResolution:appearanceInfo:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  __int16 v25 = __Block_byref_object_copy__80;
  v26 = __Block_byref_object_dispose__80;
  id v27 = 0;
  CGFloat v12 = [v9 managedObjectContext];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __122__ICAttachmentInlineDrawingModel_PreviewGeneration__generateImageForAttachment_fromDrawing_fullResolution_appearanceInfo___block_invoke;
  v17[3] = &unk_1E5FDE5B8;
  id v13 = v10;
  id v18 = v13;
  char v21 = a5;
  id v14 = v11;
  id v19 = v14;
  double v20 = &v22;
  [v12 performBlockAndWait:v17];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

+ (void)generatePreviewsForAttachment:()PreviewGeneration fromDrawing:
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [v6 managedObjectContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke;
  v11[3] = &unk_1E5FD9C08;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = a1;
  id v9 = v6;
  id v10 = v7;
  [v8 performBlockAndWait:v11];
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__80;
  id v15 = __Block_byref_object_dispose__80;
  id v16 = 0;
  v5 = [a1 attachment];
  id v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v10[3] = &unk_1E5FD91F8;
  v10[4] = a1;
  v10[5] = &v11;
  [v6 performBlockAndWait:v10];

  id v7 = objc_opt_class();
  CGFloat v8 = [a1 attachment];
  [v7 generatePreviewsForAttachment:v8 fromDrawing:v12[5]];

  _Block_object_dispose(&v11, 8);
  return 1;
}

@end