@interface MLULookupItem
- (BOOL)_resolveAttachments:(id)a3 currentAttachmentIndex:(unint64_t)a4;
- (BOOL)_resolveText:(id)a3 focusRange:(_NSRange)a4;
- (BOOL)_resolveURL:(id)a3 DDResult:(__DDResult *)a4 focusRange:(_NSRange)a5;
- (BOOL)resolve;
- (MLULookupItem)initWithAttachments:(id)a3 currentAttachment:(unint64_t)a4;
- (MLULookupItem)initWithURL:(id)a3 dataDetectorsResult:(__DDResult *)a4 text:(id)a5 range:(_NSRange)a6;
- (MLULookupItemContent)previewContent;
- (NSDictionary)documentProperties;
- (_NSRange)proposedRange;
- (id)viewControllerToPresent;
- (id)webUrlToPresent;
- (unint64_t)commitType;
- (void)commit;
- (void)commitWithTransitionForPreviewViewController:(id)a3 inViewController:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)setDocumentProperties:(id)a3;
- (void)setPreviewContent:(id)a3;
@end

@implementation MLULookupItem

- (void)dealloc
{
  ddResult = self->_ddResult;
  if (ddResult)
  {
    CFRelease(ddResult);
    self->_ddResult = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MLULookupItem;
  [(MLULookupItem *)&v4 dealloc];
}

- (MLULookupItem)initWithAttachments:(id)a3 currentAttachment:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLULookupItem;
  v7 = [(MLULookupItem *)&v11 init];
  if (v7)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || [v6 count] <= a4)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[MLULookupItem initWithAttachments:currentAttachment:](v6, a4);
      }
      attachments = v7->_attachments;
      v7->_attachments = 0;
      a4 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v8 = (NSArray *)v6;
      attachments = v7->_attachments;
      v7->_attachments = v8;
    }

    v7->_currentAttachmentIndex = a4;
  }

  return v7;
}

- (MLULookupItem)initWithURL:(id)a3 dataDetectorsResult:(__DDResult *)a4 text:(id)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v12 = a3;
  id v13 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MLULookupItem;
  v14 = [(MLULookupItem *)&v16 init];
  if (v14)
  {
    if (a4)
    {
      CFRetain(a4);
      v14->_ddResult = a4;
    }
    objc_storeStrong((id *)&v14->_url, a3);
    objc_storeStrong((id *)&v14->_text, a5);
    v14->_focusRange.NSUInteger location = location;
    v14->_focusRange.NSUInteger length = length;
    v14->_proposedRange.NSUInteger location = location;
    v14->_proposedRange.NSUInteger length = length;
  }

  return v14;
}

- (BOOL)_resolveAttachments:(id)a3 currentAttachmentIndex:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 objectAtIndexedSubscript:a4];
  v8 = (void *)MEMORY[0x263F16098];
  v9 = [v6 objectAtIndexedSubscript:a4];
  int v10 = [v8 canPreviewItem:v9];

  if (v10)
  {
    v23 = v7;
    objc_super v11 = (NSArray *)objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if ([MEMORY[0x263F16098] canPreviewItem:v17]) {
            [(NSArray *)v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }

    attachments = self->_attachments;
    self->_attachments = v11;
    v19 = v11;

    v7 = v23;
    unint64_t v20 = [(NSArray *)v19 indexOfObject:v23];
    self->_currentAttachmentIndex = v20;
    v21 = +[MLULookupItemContent contentWithAttachments:self->_attachments currentAttachmentIndex:v20];

    [(MLULookupItem *)self setPreviewContent:v21];
  }

  return v10;
}

- (BOOL)_resolveURL:(id)a3 DDResult:(__DDResult *)a4 focusRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  int v10 = [(MLULookupItem *)self documentProperties];
  objc_super v11 = +[MLULookupItemContent contentWithURL:v9 result:a4 documentProperties:v10];

  if (v11)
  {
    v13.NSUInteger length = [(NSString *)self->_text length];
    v13.NSUInteger location = 0;
    v14.NSUInteger location = location;
    v14.NSUInteger length = length;
    self->_proposedRange = NSIntersectionRange(v13, v14);
    [(MLULookupItem *)self setPreviewContent:v11];
  }

  return v11 != 0;
}

- (BOOL)_resolveText:(id)a3 focusRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if ([(NSString *)self->_text length])
  {
    uint64_t v8 = DDScannerCreate();
    if (v8)
    {
      id v9 = (const void *)v8;
      DDScannerScanString();
      CFArrayRef v10 = (const __CFArray *)DDScannerCopyResultsWithOptions();
      if (v10)
      {
        CFArrayRef v11 = v10;
        CFIndex Count = CFArrayGetCount(v10);
        NSUInteger v24 = length;
        if (Count < 1)
        {
          BOOL v14 = 0;
        }
        else
        {
          CFIndex v13 = Count;
          BOOL v14 = 0;
          unint64_t v15 = location + length;
          uint64_t v16 = 1;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v11, v16 - 1);
            unint64_t Range = DDResultGetRange();
            if (Range + v19 >= location && Range < v15) {
              BOOL v14 = -[MLULookupItem _resolveURL:DDResult:focusRange:](self, "_resolveURL:DDResult:focusRange:", 0, ValueAtIndex, Range, v19);
            }
            if (v16 >= v13) {
              break;
            }
            ++v16;
          }
          while (!v14);
        }
        CFRelease(v11);
        CFRelease(v9);
        NSUInteger length = v24;
        if (v14)
        {
          BOOL v21 = 1;
          goto LABEL_21;
        }
      }
      else
      {
        CFRelease(v9);
      }
    }
    v22 = +[MLULookupItemContent contentWithText:range:](MLULookupItemContent, "contentWithText:range:", v7, location, length);
    BOOL v21 = v22 != 0;
    if (v22) {
      [(MLULookupItem *)self setPreviewContent:v22];
    }
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_21:

  return v21;
}

- (BOOL)resolve
{
  if (self->_resolved) {
    return 0;
  }
  self->_resolved = 1;
  if (self->_attachments
    && self->_currentAttachmentIndex != 0x7FFFFFFFFFFFFFFFLL
    && -[MLULookupItem _resolveAttachments:currentAttachmentIndex:](self, "_resolveAttachments:currentAttachmentIndex:"))
  {
    return 1;
  }
  if (*(_OWORD *)&self->_url != 0)
  {
    if (!-[MLULookupItem _resolveURL:DDResult:focusRange:](self, "_resolveURL:DDResult:focusRange:"))
    {
      if (self->_ddResult && !self->_text)
      {
        DDResultGetMatchedString();
        objc_super v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        text = self->_text;
        self->_text = v4;

        NSUInteger v6 = [(NSString *)self->_text length];
        self->_focusRange.NSUInteger location = 0;
        self->_focusRange.NSUInteger length = v6;
      }
      goto LABEL_7;
    }
    return 1;
  }
LABEL_7:
  if (!self->_text) {
    return 0;
  }

  return -[MLULookupItem _resolveText:focusRange:](self, "_resolveText:focusRange:");
}

- (id)webUrlToPresent
{
  return self->_url;
}

- (_NSRange)proposedRange
{
  NSUInteger length = self->_proposedRange.length;
  NSUInteger location = self->_proposedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)viewControllerToPresent
{
  v2 = [(MLULookupItem *)self previewContent];
  v3 = [v2 previewViewController];

  return v3;
}

- (void)commit
{
  id v5 = [(MLULookupItem *)self previewContent];
  v3 = [(MLULookupItem *)self viewControllerToPresent];
  objc_super v4 = [v3 presentingViewController];
  [v5 commitPreviewInController:v4];
}

- (unint64_t)commitType
{
  v2 = [(MLULookupItem *)self previewContent];
  unint64_t v3 = [v2 commitType];

  return v3;
}

- (void)commitWithTransitionForPreviewViewController:(id)a3 inViewController:(id)a4 completion:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v42 = a5;
  [(MLULookupItem *)self commit];
  CFArrayRef v10 = [v9 view];
  CFArrayRef v11 = [v10 window];

  id v12 = objc_alloc(MEMORY[0x263F1CB60]);
  [v11 bounds];
  CFIndex v13 = objc_msgSend(v12, "initWithFrame:");
  BOOL v14 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.0];
  [v13 setBackgroundColor:v14];

  [v13 setUserInteractionEnabled:0];
  [v11 addSubview:v13];
  unint64_t v15 = [MLUBlurryView alloc];
  [v11 bounds];
  uint64_t v16 = -[MLUBlurryView initWithFrame:](v15, "initWithFrame:");
  [(MLUBlurryView *)v16 setUserInteractionEnabled:0];
  [v11 addSubview:v16];
  uint64_t v17 = [v8 view];
  v43 = v9;
  v44 = v8;
  v41 = v13;
  if (v17)
  {
    do
    {
      v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      char v20 = [v19 containsString:@"_UIPreviewPresentationContainerView"];

      if (v20) {
        break;
      }
      uint64_t v21 = [v17 superview];

      uint64_t v17 = (void *)v21;
    }
    while (v21);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  v22 = [v17 superview];
  v23 = [v22 superview];
  NSUInteger v24 = [v23 subviews];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    v40 = v11;
    uint64_t v27 = *(void *)v55;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v55 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        int v32 = [v31 containsString:@"UIImageView"];

        if (v32)
        {
          id v33 = v29;
          goto LABEL_14;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v26) {
        continue;
      }
      break;
    }
    id v33 = 0;
LABEL_14:
    CFArrayRef v11 = v40;
  }
  else
  {
    id v33 = 0;
  }

  v34 = [v17 snapshotViewAfterScreenUpdates:0];
  [(MLUBlurryView *)v16 addSubview:v34];
  [v17 setHidden:1];
  [v33 setHidden:1];
  v35 = (void *)MEMORY[0x263F1CB60];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke;
  v50[3] = &unk_2648977B0;
  v51 = v16;
  id v52 = v34;
  id v53 = v41;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_7;
  v45[3] = &unk_2648977D8;
  id v46 = v52;
  v47 = v51;
  id v48 = v53;
  id v49 = v42;
  id v36 = v52;
  v37 = v51;
  id v38 = v53;
  id v39 = v42;
  [v35 animateKeyframesWithDuration:0 delay:v50 options:v45 animations:0.4 completion:0.0];
}

void __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x263F1CB60];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_2;
  v15[3] = &unk_264897788;
  id v16 = a1[4];
  [v2 addKeyframeWithRelativeStartTime:v15 relativeDuration:0.0 animations:0.1];
  unint64_t v3 = (void *)MEMORY[0x263F1CB60];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_3;
  v13[3] = &unk_264897788;
  id v14 = a1[4];
  [v3 addKeyframeWithRelativeStartTime:v13 relativeDuration:0.1 animations:1.0];
  objc_super v4 = (void *)MEMORY[0x263F1CB60];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_4;
  v11[3] = &unk_264897788;
  id v12 = a1[4];
  [v4 addKeyframeWithRelativeStartTime:v11 relativeDuration:0.0 animations:0.8];
  id v5 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_5;
  v9[3] = &unk_264897788;
  id v10 = a1[5];
  [v5 addKeyframeWithRelativeStartTime:v9 relativeDuration:0.3 animations:0.7];
  NSUInteger v6 = (void *)MEMORY[0x263F1CB60];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_6;
  v7[3] = &unk_264897788;
  id v8 = a1[6];
  [v6 addKeyframeWithRelativeStartTime:v7 relativeDuration:0.0 animations:0.2];
}

void __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) layer];
  CATransform3DMakeScale(&v2, 1.10000002, 1.10000002, 1.0);
  [v1 setTransform:&v2];
}

void __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) layer];
  CATransform3DMakeScale(&v2, 1.5, 1.5, 1.0);
  [v1 setTransform:&v2];
}

uint64_t __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBlurRadius:50.0];
}

uint64_t __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.200000003];
}

uint64_t __90__MLULookupItem_commitWithTransitionForPreviewViewController_inViewController_completion___block_invoke_7(uint64_t a1)
{
  usleep(0x7A120u);
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    unint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (NSDictionary)documentProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDocumentProperties:(id)a3
{
}

- (MLULookupItemContent)previewContent
{
  return self->_previewContent;
}

- (void)setPreviewContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewContent, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithAttachments:(void *)a1 currentAttachment:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218240;
  uint64_t v3 = a2;
  __int16 v4 = 2048;
  uint64_t v5 = [a1 count];
  _os_log_error_impl(&dword_22B4D6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Inconsistent attachment index in -[MLULookupItem initWithAttachments:currentAttachment:] index %ld is not in the array range (array size = %ld)", (uint8_t *)&v2, 0x16u);
}

@end