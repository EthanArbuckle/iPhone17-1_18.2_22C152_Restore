@interface TabSnapshotGenerator
+ (id)_snapshotRenderingQueue;
- (BOOL)contentShouldUnderlapTopBackdropForContentProvider:(id)a3;
- (CGRect)contentRectForContentProvider:(id)a3 withSnapshotSize:(CGSize)a4;
- (TabSnapshotGenerator)init;
- (TabSnapshotGeneratorDelegate)delegate;
- (id)_renderView:(id)a3 afterScreenUpdates:(BOOL)a4;
- (id)backgroundColorForContentProvider:(id)a3;
- (id)renderSnapshotWithSize:(CGSize)a3 backgroundColor:(id)a4 topBackdropHeight:(double)a5 options:(unint64_t)a6 drawing:(id)a7;
- (void)_beginNextItemIfIdle;
- (void)_didFinishItem:(id)a3 withImage:(id)a4;
- (void)_snapshotItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)snapshotWithRequest:(id)a3 contentProvider:(id)a4 completion:(id)a5;
@end

@implementation TabSnapshotGenerator

- (TabSnapshotGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)TabSnapshotGenerator;
  v2 = [(TabSnapshotGenerator *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

+ (id)_snapshotRenderingQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__TabSnapshotGenerator__snapshotRenderingQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_snapshotRenderingQueue_onceToken != -1) {
    dispatch_once(&_snapshotRenderingQueue_onceToken, block);
  }
  v2 = (void *)_snapshotRenderingQueue_queue;
  return v2;
}

void __47__TabSnapshotGenerator__snapshotRenderingQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
  attr = dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

  v1 = NSString;
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  id v4 = [v1 stringWithFormat:@"com.apple.mobilesafari.%@", v3];
  dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], attr);
  v6 = (void *)_snapshotRenderingQueue_queue;
  _snapshotRenderingQueue_queue = (uint64_t)v5;
}

- (void)snapshotWithRequest:(id)a3 contentProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  requestQueue = self->_requestQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__TabSnapshotGenerator_snapshotWithRequest_contentProvider_completion___block_invoke;
  v16[3] = &unk_1E6D7A140;
  id v11 = v8;
  id v17 = v11;
  v12 = (TabSnapshotQueueItem *)a5;
  v13 = [(NSMutableArray *)requestQueue safari_firstObjectPassingTest:v16];
  v14 = v13;
  if (v13)
  {
    [v13 setContentProvider:v9];
    [v14 appendCompletionHandler:v12];
  }
  else
  {
    v15 = [[TabSnapshotQueueItem alloc] initWithRequest:v11 contentProvider:v9 completionHandler:v12];

    [(NSMutableArray *)self->_requestQueue insertObject:v15 atIndex:0];
    v12 = v15;
  }

  [(TabSnapshotGenerator *)self _beginNextItemIfIdle];
}

uint64_t __71__TabSnapshotGenerator_snapshotWithRequest_contentProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 request];
  if ([v4 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v5 = [v3 snappshottingIsInProgress] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_beginNextItemIfIdle
{
  id v3 = [(NSMutableArray *)self->_requestQueue lastObject];
  id v4 = v3;
  if (v3 && ([v3 snappshottingIsInProgress] & 1) == 0)
  {
    uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXSignposts();
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1E102C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "GenerateTabSnapshot", (const char *)&unk_1E1266082, buf, 2u);
      }
    }

    [v4 setSnappshottingIsInProgress:1];
    id v8 = [v4 request];
    id v9 = [v4 contentProvider];
    if (([v8 options] & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      [(TabSnapshotGenerator *)self _snapshotItem:v4];
    }
    else
    {
      [v8 size];
      double v11 = v10;
      double v13 = v12;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __44__TabSnapshotGenerator__beginNextItemIfIdle__block_invoke;
      v14[3] = &unk_1E6D7A168;
      v14[4] = self;
      id v15 = v4;
      objc_msgSend(v9, "prepareForSnapshotOfSize:completion:", v14, v11, v13);
    }
  }
}

uint64_t __44__TabSnapshotGenerator__beginNextItemIfIdle__block_invoke(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2) {
    return [v3 _snapshotItem:v4];
  }
  else {
    return [v3 _didFinishItem:v4 withImage:0];
  }
}

- (void)_didFinishItem:(id)a3 withImage:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)WBS_LOG_CHANNEL_PREFIXSignposts();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, v6);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      double v11 = @"YES";
      if (!v7) {
        double v11 = @"NO";
      }
      double v12 = v11;
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "GenerateTabSnapshot", "success=%@", buf, 0xCu);
    }
  }

  [(NSMutableArray *)self->_requestQueue removeObject:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v13 = objc_msgSend(v6, "completionHandlers", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v17++) + 16))();
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  [(TabSnapshotGenerator *)self _beginNextItemIfIdle];
}

- (void)_snapshotItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 request];
  id v6 = [v4 contentProvider];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v6 snapshotContentImage], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = (void *)v7;
    os_signpost_id_t v9 = 0;
    char v10 = 1;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      os_signpost_id_t v9 = [v6 snapshotContentView];
    }
    else
    {
      os_signpost_id_t v9 = 0;
    }
    id v8 = 0;
    char v10 = 0;
    if (!v9)
    {
      [(TabSnapshotGenerator *)self _didFinishItem:v4 withImage:0];
      goto LABEL_25;
    }
  }
  [v5 size];
  double v12 = v11;
  double v14 = v13;
  [v5 topBackdropHeight];
  double v16 = v15;
  uint64_t v17 = [v5 options];
  v45 = [(TabSnapshotGenerator *)self backgroundColorForContentProvider:v6];
  -[TabSnapshotGenerator contentRectForContentProvider:withSnapshotSize:](self, "contentRectForContentProvider:withSnapshotSize:", v6, v12, v14);
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v43 = v24;
  BOOL v42 = [(TabSnapshotGenerator *)self contentShouldUnderlapTopBackdropForContentProvider:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained topBarsHeightForSnapshotGenerator:self];
  uint64_t v27 = v26;
  id v44 = WeakRetained;
  [WeakRetained contentSizeForSnapshotGenerator:self];
  if (v28 == 0.0) {
    double v29 = 1.0;
  }
  else {
    double v29 = v12 / v28;
  }
  v30 = [v9 traitCollection];
  v31 = v30;
  if (v30)
  {
    v46 = (void *)[v30 copy];
  }
  else
  {
    v32 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
    v46 = (void *)[v32 copy];
  }
  if (v17) {
    char v33 = 1;
  }
  else {
    char v33 = v10;
  }
  if ((v33 & 1) != 0
    || ([(TabSnapshotGenerator *)self _renderView:v9 afterScreenUpdates:(v17 & 0x20) != 0], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __38__TabSnapshotGenerator__snapshotItem___block_invoke;
    v57[3] = &unk_1E6D7A190;
    BOOL v66 = v42;
    uint64_t v60 = v27;
    double v61 = v29;
    id v34 = v8;
    id v58 = v34;
    uint64_t v62 = v19;
    uint64_t v63 = v21;
    uint64_t v64 = v23;
    uint64_t v65 = v43;
    char v67 = v17 & 1;
    id v59 = v9;
    char v68 = (v17 & 0x20) >> 5;
    v35 = (void *)MEMORY[0x1E4E42950](v57);
    if (v17)
    {
      v36 = -[TabSnapshotGenerator renderSnapshotWithSize:backgroundColor:topBackdropHeight:options:drawing:](self, "renderSnapshotWithSize:backgroundColor:topBackdropHeight:options:drawing:", v45, v17, v35, v12, v14, v16);
      v37 = self;
      v38 = v45;
      [(TabSnapshotGenerator *)v37 _didFinishItem:v4 withImage:v36];
    }
    else
    {
      v39 = [(id)objc_opt_class() _snapshotRenderingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__TabSnapshotGenerator__snapshotItem___block_invoke_2;
      block[3] = &unk_1E6D7A1B8;
      id v48 = v46;
      v49 = self;
      double v53 = v12;
      double v54 = v14;
      v38 = v45;
      id v50 = v45;
      double v55 = v16;
      uint64_t v56 = v17;
      id v52 = v35;
      id v51 = v4;
      dispatch_async(v39, block);

      v36 = v48;
    }
    v40 = v44;
  }
  else
  {
    v41 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    v40 = v44;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[TabSnapshotGenerator _snapshotItem:](v41);
    }
    [(TabSnapshotGenerator *)self _didFinishItem:v4 withImage:0];
    v38 = v45;
  }

LABEL_25:
}

void *__38__TabSnapshotGenerator__snapshotItem___block_invoke(uint64_t a1, CGContextRef c)
{
  if (*(unsigned char *)(a1 + 96)) {
    CGContextTranslateCTM(c, 0.0, -(*(double *)(a1 + 48) * *(double *)(a1 + 56)));
  }
  result = *(void **)(a1 + 32);
  if (result)
  {
    double v4 = *(double *)(a1 + 64);
    double v5 = *(double *)(a1 + 72);
    double v6 = *(double *)(a1 + 80);
    double v7 = *(double *)(a1 + 88);
    return objc_msgSend(result, "drawInRect:", v4, v5, v6, v7);
  }
  else if (*(unsigned char *)(a1 + 97))
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 98);
    double v10 = *(double *)(a1 + 64);
    double v11 = *(double *)(a1 + 72);
    double v12 = *(double *)(a1 + 80);
    double v13 = *(double *)(a1 + 88);
    return objc_msgSend(v8, "drawViewHierarchyInRect:afterScreenUpdates:", v9, v10, v11, v12, v13);
  }
  return result;
}

void __38__TabSnapshotGenerator__snapshotItem___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:*(void *)(a1 + 32)];
  id v3 = objc_msgSend(*(id *)(a1 + 40), "renderSnapshotWithSize:backgroundColor:topBackdropHeight:options:drawing:", *(void *)(a1 + 48), *(void *)(a1 + 96), *(void *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__TabSnapshotGenerator__snapshotItem___block_invoke_3;
  block[3] = &unk_1E6D78980;
  void block[4] = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __38__TabSnapshotGenerator__snapshotItem___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishItem:*(void *)(a1 + 40) withImage:*(void *)(a1 + 48)];
}

- (id)backgroundColorForContentProvider:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 snapshotBackgroundColor], (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  }

  return v4;
}

- (CGRect)contentRectForContentProvider:(id)a3 withSnapshotSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  double v7 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v6, "snapshotContentRectInBounds:", 0.0, 0.0, width, height);
    double v9 = v8;
    double v7 = v10;
    double width = v11;
    double height = v12;
  }
  else
  {
    double v9 = 0.0;
  }

  double v13 = v9;
  double v14 = v7;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)contentShouldUnderlapTopBackdropForContentProvider:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 snapshotContentShouldUnderlapTopBackdrop];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)renderSnapshotWithSize:(CGSize)a3 backgroundColor:(id)a4 topBackdropHeight:(double)a5 options:(unint64_t)a6 drawing:(id)a7
{
  id v9 = a4;
  id v10 = a7;
  uint64_t v11 = _SFOnePixel();
  double v14 = *MEMORY[0x1E4FB2848];
  double v13 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v16 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if ((a6 & 2) != 0) {
    double v17 = v12;
  }
  else {
    double v17 = *MEMORY[0x1E4FB2848];
  }
  if ((a6 & 4) != 0) {
    double v18 = v12;
  }
  else {
    double v18 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  if ((a6 & 8) != 0) {
    double v19 = v12;
  }
  else {
    double v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  }
  if ((a6 & 0x10) != 0) {
    double v20 = v12;
  }
  else {
    double v20 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  uint64_t v21 = (void *)MEMORY[0x1E4E426E0](v11);
  uint64_t v22 = [MEMORY[0x1E4FB17E0] defaultFormat];
  [v22 setPreferredRange:2];
  if (v9)
  {
    [v9 alphaComponent];
    BOOL v24 = v18 == v13;
    if (v17 != v14) {
      BOOL v24 = 0;
    }
    if (v20 != v15) {
      BOOL v24 = 0;
    }
    if (v19 != v16) {
      BOOL v24 = 0;
    }
    BOOL v25 = v23 >= 1.0 && v24;
  }
  else
  {
    BOOL v25 = 0;
  }
  [v22 setOpaque:v25];
  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v22, a3.width + v18 + v20, a3.height + v17 + v19);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __97__TabSnapshotGenerator_renderSnapshotWithSize_backgroundColor_topBackdropHeight_options_drawing___block_invoke;
  v33[3] = &unk_1E6D7A1E0;
  double v36 = v17;
  double v37 = v18;
  double v38 = v19;
  double v39 = v20;
  CGSize v40 = a3;
  id v27 = v9;
  id v34 = v27;
  id v28 = v10;
  id v35 = v28;
  double v41 = a5;
  unint64_t v42 = a6;
  double v29 = [v26 imageWithActions:v33];

  return v29;
}

void __97__TabSnapshotGenerator_renderSnapshotWithSize_backgroundColor_topBackdropHeight_options_drawing___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = (CGContext *)[v13 CGContext];
  CGContextTranslateCTM(v3, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 48));
  v15.size.double width = *(CGFloat *)(a1 + 80);
  v15.size.double height = *(CGFloat *)(a1 + 88);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  CGContextClipToRect(v3, v15);
  char v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 set];
    CGRect ClipBoundingBox = CGContextGetClipBoundingBox(v3);
    UIRectFill(ClipBoundingBox);
  }
  if (*(void *)(a1 + 40))
  {
    CGContextSaveGState(v3);
    CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 96));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    CGContextRestoreGState(v3);
  }
  if (*(double *)(a1 + 96) > 0.0 && (*(unsigned char *)(a1 + 104) & 0x40) == 0)
  {
    double v5 = [v13 currentImage];
    [v5 scale];
    double v7 = v6;
    id v8 = v5;
    id v9 = (CGImage *)[v8 CGImage];
    v17.origin.x = v7 * *(double *)(a1 + 56);
    v17.origin.y = v7 * *(double *)(a1 + 48);
    v17.size.double width = v7 * *(double *)(a1 + 80);
    v17.size.double height = v7 * *(double *)(a1 + 96);
    id v10 = CGImageCreateWithImageInRect(v9, v17);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", v10, objc_msgSend(v8, "imageOrientation"), v7);
    double v12 = [v11 _applyBackdropViewStyle:2020 includeTints:0 includeBlur:1];
    objc_msgSend(v12, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0);
    CGImageRelease(v10);
  }
}

- (id)_renderView:(id)a3 afterScreenUpdates:(BOOL)a4
{
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    if (a4)
    {
      double v7 = [v5 nextResponder];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v6 nextResponder];
      }
      else
      {
        id v8 = 0;
      }

      id v10 = [v8 parentViewController];
      uint64_t v11 = [v6 superview];
      double v12 = [v11 subviews];
      uint64_t v13 = [v12 indexOfObject:v6];

      if (v10
        && ([v6 window], double v14 = objc_claimAutoreleasedReturnValue(), v14, !v14))
      {
        [v8 willMoveToParentViewController:0];
        [v6 removeFromSuperview];
        [v8 removeFromParentViewController];
        int v15 = 1;
      }
      else
      {
        int v15 = 0;
      }
      double v16 = objc_msgSend(MEMORY[0x1E4FB17E0], "defaultFormat", v13);
      [v16 setPreferredRange:2];
      if ([v6 isOpaque])
      {
        CGRect v17 = [v6 backgroundColor];
        [v17 alphaComponent];
        [v16 setOpaque:v18 == 1.0];
      }
      else
      {
        [v16 setOpaque:0];
      }
      id v19 = objc_alloc(MEMORY[0x1E4FB17D8]);
      [v6 bounds];
      double v20 = objc_msgSend(v19, "initWithBounds:format:", v16);
      uint64_t v32 = 0;
      char v33 = &v32;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __55__TabSnapshotGenerator__renderView_afterScreenUpdates___block_invoke;
      v28[3] = &unk_1E6D7A208;
      v30 = &v32;
      id v21 = v6;
      id v29 = v21;
      BOOL v31 = a4;
      uint64_t v22 = [v20 imageWithActions:v28];
      if (v15)
      {
        [v10 addChildViewController:v8];
        double v23 = [v11 subviews];
        unint64_t v24 = [v23 count];

        if (v27 <= v24) {
          objc_msgSend(v11, "insertSubview:atIndex:", v21);
        }
        else {
          [v11 addSubview:v21];
        }
        [v8 didMoveToParentViewController:v10];
      }
      if (*((unsigned char *)v33 + 24)) {
        BOOL v25 = v22;
      }
      else {
        BOOL v25 = 0;
      }
      id v9 = v25;

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      objc_msgSend(v5, "_sf_snapshotImageFromIOSurface");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __55__TabSnapshotGenerator__renderView_afterScreenUpdates___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 bounds];
  uint64_t result = objc_msgSend(v2, "drawViewHierarchyInRect:afterScreenUpdates:", *(unsigned __int8 *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (TabSnapshotGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabSnapshotGeneratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

- (void)_snapshotItem:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Could not render snapshot content view", v1, 2u);
}

@end