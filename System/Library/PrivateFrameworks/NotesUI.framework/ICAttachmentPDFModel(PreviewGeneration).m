@interface ICAttachmentPDFModel(PreviewGeneration)
- (uint64_t)generatePreviewsInOperation:()PreviewGeneration;
@end

@implementation ICAttachmentPDFModel(PreviewGeneration)

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__15;
  v67 = __Block_byref_object_dispose__15;
  id v68 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__15;
  v61 = __Block_byref_object_dispose__15;
  id v62 = 0;
  v46 = a1;
  v5 = [a1 attachment];
  v6 = [v5 managedObjectContext];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v56[3] = &unk_1E5FD9248;
  v56[5] = &v63;
  v56[4] = v46;
  v56[6] = &v57;
  [v6 performBlockAndWait:v56];

  CFURLRef v7 = (const __CFURL *)v58[5];
  if (!v7)
  {
    v36 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = NSStringFromSelector(a2);
      uint64_t v41 = v64[5];
      *(_DWORD *)buf = 138412802;
      id v71 = v39;
      __int16 v72 = 2112;
      v73 = v40;
      __int16 v74 = 2112;
      uint64_t v75 = v41;
      _os_log_debug_impl(&dword_1B08EB000, v36, OS_LOG_TYPE_DEBUG, "%@ %@ %@ early return", buf, 0x20u);
    }
    goto LABEL_26;
  }
  v8 = CGPDFDocumentCreateWithURL(v7);
  if (!v8)
  {
LABEL_26:
    uint64_t v35 = 0;
    goto LABEL_27;
  }
  document = v8;
  Page = CGPDFDocumentGetPage(v8, 1uLL);
  v10 = Page;
  if (!Page
    || (BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox), CGFloat width = BoxRect.size.width, BoxRect.size.width <= 0.0)
    || (CGFloat height = BoxRect.size.height, BoxRect.size.height <= 0.0))
  {
    CGPDFDocumentRelease(document);
    goto LABEL_26;
  }
  CGFloat x = BoxRect.origin.x;
  CGFloat y = BoxRect.origin.y;
  v45 = v10;
  if (BoxRect.size.width < BoxRect.size.height) {
    double v15 = BoxRect.size.width / BoxRect.size.height;
  }
  else {
    double v15 = 1.0;
  }
  if (BoxRect.size.width < BoxRect.size.height) {
    double v16 = 1.0;
  }
  else {
    double v16 = BoxRect.size.height / BoxRect.size.width;
  }
  v17 = objc_msgSend(v46, "attachment", BoxRect.size.height / BoxRect.size.width);
  v18 = [v17 managedObjectContext];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_10;
  v55[3] = &unk_1E5FDA200;
  v55[4] = v46;
  *(CGFloat *)&v55[5] = x;
  *(CGFloat *)&v55[6] = y;
  *(CGFloat *)&v55[7] = width;
  *(CGFloat *)&v55[8] = height;
  [v18 performBlockAndWait:v55];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v19 = +[ICPreviewDeviceContext sharedContext];
  id obj = [v19 deviceInfoScalable:0];

  uint64_t v20 = [obj countByEnumeratingWithState:&v51 objects:v69 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        [v23 imageSize];
        double v25 = v24;
        [v23 imageSize];
        double v27 = v26;
        v28 = [MEMORY[0x1E4FB17E0] defaultFormat];
        [v23 scale];
        objc_msgSend(v28, "setScale:");
        double v29 = v15 * v25;
        double v30 = v16 * v27;
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v28, v29, v30);
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
        v50[3] = &__block_descriptor_88_e40_v16__0__UIGraphicsImageRendererContext_8l;
        v50[4] = 0;
        v50[5] = 0;
        *(double *)&v50[6] = v29;
        *(double *)&v50[7] = v30;
        *(double *)&v50[8] = v29;
        *(double *)&v50[9] = v30;
        v50[10] = v45;
        v32 = [v31 imageWithActions:v50];
        if (v32)
        {
          v33 = [v46 attachment];
          v34 = [v33 managedObjectContext];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3;
          v47[3] = &unk_1E5FD8FE8;
          v47[4] = v46;
          id v48 = v32;
          v49 = v23;
          [v34 performBlockAndWait:v47];
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v51 objects:v69 count:16];
    }
    while (v20);
  }

  CGPDFDocumentRelease(document);
  uint64_t v35 = 1;
LABEL_27:
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v35;
}

@end