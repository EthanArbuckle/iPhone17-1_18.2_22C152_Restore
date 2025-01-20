@interface ICPDFAttachmentView
+ (id)renderingQueue;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)availableImageIsAcceptable;
- (BOOL)cancelDidScrollIntoVisibleRange;
- (BOOL)cancelRenderingIfPossible;
- (BOOL)isManaullyGeneratingImage;
- (BOOL)isRendering;
- (BOOL)needToStartRender;
- (CGPDFPage)page;
- (ICPDFAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6;
- (ICSelectorDelayer)startProgressSelectorDelayer;
- (NSOperation)renderOperation;
- (UIActivityIndicatorView)progressView;
- (UIImage)image;
- (id)accessibilityLabel;
- (id)pdfURL;
- (void)cleanupPDFDocument;
- (void)dealloc;
- (void)didChangeMedia;
- (void)didMoveToWindow;
- (void)didScrollIntoVisibleRange;
- (void)didScrollOutOfVisibleRange;
- (void)prepareForPrinting;
- (void)setAttachment:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsManaullyGeneratingImage:(BOOL)a3;
- (void)setProgressView:(id)a3;
- (void)setRenderOperation:(id)a3;
- (void)setRendering:(BOOL)a3;
- (void)setStartProgressSelectorDelayer:(id)a3;
- (void)setupBorderForLayer:(id)a3;
- (void)startImageRenderIfNeeded;
- (void)startProgress;
- (void)stopProgress;
- (void)updateLayerContentsWithFade:(BOOL)a3;
@end

@implementation ICPDFAttachmentView

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 localizedStringForKey:@"PDF attachment" value:&stru_26C10E100 table:0];

  v7 = [(ICAttachmentView *)self icaxAttachmentViewTypeDescription];
  v5 = __ICAccessibilityStringForVariables();

  return v5;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

+ (id)renderingQueue
{
  if (renderingQueue_onceToken != -1) {
    dispatch_once(&renderingQueue_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)renderingQueue_renderingQueue;

  return v2;
}

uint64_t __37__ICPDFAttachmentView_renderingQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  v1 = (void *)renderingQueue_renderingQueue;
  renderingQueue_renderingQueue = (uint64_t)v0;

  [(id)renderingQueue_renderingQueue setName:@"com.apple.notes.PDF-rendering-queue"];
  v2 = (void *)renderingQueue_renderingQueue;

  return [v2 setMaxConcurrentOperationCount:1];
}

- (ICPDFAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)ICPDFAttachmentView;
  return -[ICAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](&v7, sel_initWithFrame_textAttachment_textContainer_forManualRendering_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  [(ICPDFAttachmentView *)self cancelRenderingIfPossible];
  [(ICPDFAttachmentView *)self cleanupPDFDocument];
  v3.receiver = self;
  v3.super_class = (Class)ICPDFAttachmentView;
  [(ICAttachmentView *)&v3 dealloc];
}

- (void)cleanupPDFDocument
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  page = obj->_page;
  if (page)
  {
    CGPDFPageRelease(page);
    v2 = obj;
    obj->_page = 0;
  }
  pdf = v2->_pdf;
  if (pdf)
  {
    CGPDFDocumentRelease(pdf);
    v2 = obj;
    obj->_pdf = 0;
  }
  objc_sync_exit(v2);
}

- (void)prepareForPrinting
{
  v3.receiver = self;
  v3.super_class = (Class)ICPDFAttachmentView;
  [(ICAttachmentView *)&v3 prepareForPrinting];
  [(ICPDFAttachmentView *)self startImageRenderIfNeeded];
}

- (id)pdfURL
{
  v2 = [(ICPDFAttachmentView *)self attachment];
  objc_super v3 = [v2 media];
  v4 = [v3 mediaURL];

  return v4;
}

- (CGPDFPage)page
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_page)
  {
    CFURLRef v3 = [(ICPDFAttachmentView *)v2 pdfURL];
    CFURLRef v4 = v3;
    if (v3)
    {
      v5 = CGPDFDocumentCreateWithURL(v3);
      v2->_pdf = v5;
      if (v5)
      {
        Page = CGPDFDocumentGetPage(v5, 1uLL);
        v2->_page = Page;
        if (Page) {
          CGPDFPageRetain(Page);
        }
      }
    }
  }
  objc_sync_exit(v2);

  return v2->_page;
}

- (void)setImage:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_image, a3);
  if (v8)
  {
    if (![(ICPDFAttachmentView *)self isManaullyGeneratingImage])
    {
      v5 = [(ICPDFAttachmentView *)self attachment];
      [v5 setCachedImage:v8];

      [(ICPDFAttachmentView *)self startImageRenderIfNeeded];
    }
    if (![(ICAttachmentView *)self forManualRendering])
    {
      v6 = [(ICPDFAttachmentView *)self progressView];
      [(ICPDFAttachmentView *)self updateLayerContentsWithFade:v6 != 0];

      goto LABEL_8;
    }
  }
  else
  {
    [(ICAttachmentView *)self forManualRendering];
  }
  [(ICPDFAttachmentView *)self updateLayerContentsWithFade:0];
LABEL_8:
  objc_super v7 = [(ICPDFAttachmentView *)self layer];
  [(ICPDFAttachmentView *)self setupBorderForLayer:v7];
}

- (void)setAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [(ICPDFAttachmentView *)self attachment];

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)ICPDFAttachmentView;
    [(ICPDFAttachmentView *)&v8 setAttachment:v4];
    v6 = [(ICPDFAttachmentView *)self attachment];
    objc_super v7 = [v6 cachedImage];
    [(ICPDFAttachmentView *)self setImage:v7];

    [(ICPDFAttachmentView *)self startImageRenderIfNeeded];
  }
}

- (void)didChangeMedia
{
  v5.receiver = self;
  v5.super_class = (Class)ICPDFAttachmentView;
  [(ICPDFAttachmentView *)&v5 didChangeMedia];
  image = self->_image;
  self->_image = 0;

  id v4 = [(ICPDFAttachmentView *)self attachment];
  [v4 setCachedImage:0];

  [(ICPDFAttachmentView *)self cleanupPDFDocument];
  [(ICPDFAttachmentView *)self startImageRenderIfNeeded];
}

- (void)didScrollOutOfVisibleRange
{
  if (![(ICAttachmentView *)self forManualRendering])
  {
    image = self->_image;
    self->_image = 0;

    [(ICPDFAttachmentView *)self updateLayerContentsWithFade:0];
    [(ICPDFAttachmentView *)self cancelRenderingIfPossible];
  }
}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  CFURLRef v3 = [(ICPDFAttachmentView *)self image];

  if (v3) {
    return 0;
  }

  return [(ICPDFAttachmentView *)self cancelRenderingIfPossible];
}

- (void)didScrollIntoVisibleRange
{
  CFURLRef v3 = [(ICPDFAttachmentView *)self attachment];
  id v4 = [v3 cachedImage];
  [(ICPDFAttachmentView *)self setImage:v4];

  [(ICPDFAttachmentView *)self startImageRenderIfNeeded];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)ICPDFAttachmentView;
  [(ICAttachmentView *)&v4 didMoveToWindow];
  [(ICPDFAttachmentView *)self startImageRenderIfNeeded];
  CFURLRef v3 = [(ICPDFAttachmentView *)self layer];
  [(ICPDFAttachmentView *)self setupBorderForLayer:v3];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICPDFAttachmentView;
  -[ICPDFAttachmentView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ICPDFAttachmentView *)self startImageRenderIfNeeded];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICPDFAttachmentView;
  -[ICPDFAttachmentView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(ICPDFAttachmentView *)self startImageRenderIfNeeded];
}

- (void)setHighlightColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICPDFAttachmentView;
  [(ICPDFAttachmentView *)&v5 setHighlightColor:a3];
  objc_super v4 = [(ICPDFAttachmentView *)self layer];
  [(ICPDFAttachmentView *)self setupBorderForLayer:v4];
}

- (BOOL)availableImageIsAcceptable
{
  CFURLRef v3 = [(ICPDFAttachmentView *)self image];

  if (!v3) {
    return 0;
  }
  [(ICPDFAttachmentView *)self bounds];
  double v5 = v4;
  v6 = [(ICPDFAttachmentView *)self image];
  [v6 size];
  BOOL v8 = vabdd_f64(v7, v5) < 1.0;

  v9 = [(ICPDFAttachmentView *)self image];
  [v9 size];
  double v11 = vabdd_f64(v10, v5);

  return v11 < 1.0 && v8;
}

- (BOOL)needToStartRender
{
  if ([(ICPDFAttachmentView *)self isManaullyGeneratingImage])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    double v4 = [(ICPDFAttachmentView *)self superview];
    if (v4)
    {
      double v5 = [(ICPDFAttachmentView *)self window];
      if (v5)
      {
        v6 = [(ICPDFAttachmentView *)self renderOperation];
        if (v6) {
          LOBYTE(v3) = 0;
        }
        else {
          BOOL v3 = ![(ICPDFAttachmentView *)self availableImageIsAcceptable];
        }
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)startImageRenderIfNeeded
{
  BOOL v3 = [(ICPDFAttachmentView *)self needToStartRender];
  if (![(ICPDFAttachmentView *)self isManaullyGeneratingImage]
    && (v3 || [(ICAttachmentView *)self forManualRendering]))
  {
    double v5 = [[ICPDFAttachmentRenderOperation alloc] initWithView:self];
    if ([(ICAttachmentView *)self forManualRendering])
    {
      [(ICPDFAttachmentView *)self setIsManaullyGeneratingImage:1];
      double v4 = [(ICPDFAttachmentRenderOperation *)v5 generateImageForPrinting];
      [(ICPDFAttachmentView *)self setImage:v4];
      [(ICPDFAttachmentView *)self setIsManaullyGeneratingImage:0];
    }
    else
    {
      [(ICPDFAttachmentView *)self setRenderOperation:v5];
      [(ICPDFAttachmentView *)self setRendering:1];
      double v4 = [(id)objc_opt_class() renderingQueue];
      [v4 addOperation:v5];
    }
  }
}

- (void)updateLayerContentsWithFade:(BOOL)a3
{
  if (a3)
  {
    double v4 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v4 setFromValue:&unk_26C1391A0];
    [v4 setToValue:&unk_26C1391B0];
    [v4 setDuration:0.1];
    double v5 = [(ICPDFAttachmentView *)self layer];
    [v5 addAnimation:v4 forKey:@"opacity"];
  }
  v6 = [(UIImage *)self->_image CGImage];
  id v7 = [(ICPDFAttachmentView *)self layer];
  [v7 setContents:v6];
}

- (void)setupBorderForLayer:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(ICPDFAttachmentView *)self highlightColor];

  if (v5)
  {
    id v6 = [(ICPDFAttachmentView *)self highlightColor];
    objc_msgSend(v4, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    double v7 = *MEMORY[0x263F5B058];
  }
  else
  {
    BOOL v8 = [(ICPDFAttachmentView *)self image];

    if (!v8)
    {
      DeviceGray = CGColorSpaceCreateDeviceGray();
      long long v12 = xmmword_20C1797C0;
      double v11 = CGColorCreate(DeviceGray, (const CGFloat *)&v12);
      [v4 setBorderColor:v11];
      [(ICPDFAttachmentView *)self ic_hairlineWidth];
      objc_msgSend(v4, "setBorderWidth:");
      CGColorRelease(v11);
      CGColorSpaceRelease(DeviceGray);
      goto LABEL_6;
    }
    id v9 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    objc_msgSend(v4, "setBorderColor:", objc_msgSend(v9, "CGColor"));

    [(ICPDFAttachmentView *)self ic_hairlineWidth];
  }
  [v4 setBorderWidth:v7];
LABEL_6:
}

- (BOOL)cancelRenderingIfPossible
{
  BOOL v3 = [(id)objc_opt_class() renderingQueue];
  [v3 setSuspended:1];

  id v4 = [(ICPDFAttachmentView *)self renderOperation];
  if ([v4 isExecuting] & 1) != 0 || (objc_msgSend(v4, "isFinished"))
  {
    BOOL v5 = 0;
  }
  else
  {
    [v4 cancel];
    [(ICPDFAttachmentView *)self setRenderOperation:0];
    BOOL v5 = 1;
  }
  id v6 = [(id)objc_opt_class() renderingQueue];
  [v6 setSuspended:0];

  [(ICPDFAttachmentView *)self setRendering:!v5];
  return v5;
}

- (void)setRendering:(BOOL)a3
{
  if (self->_rendering || !a3)
  {
    if (self->_rendering && !a3)
    {
      self->_rendering = a3;
      BOOL v5 = [(ICPDFAttachmentView *)self startProgressSelectorDelayer];
      [v5 cancelPreviousFireRequests];

      [(ICPDFAttachmentView *)self stopProgress];
    }
  }
  else
  {
    self->_rendering = a3;
    id v6 = [(ICPDFAttachmentView *)self startProgressSelectorDelayer];

    if (!v6)
    {
      double v7 = (void *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:self selector:sel_startProgress delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:0.3];
      [(ICPDFAttachmentView *)self setStartProgressSelectorDelayer:v7];
    }
    id v8 = [(ICPDFAttachmentView *)self startProgressSelectorDelayer];
    [v8 requestFire];
  }
}

- (void)startProgress
{
  v16[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICPDFAttachmentView *)self progressView];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [(ICPDFAttachmentView *)self setProgressView:v4];

    BOOL v5 = [(ICPDFAttachmentView *)self progressView];
    [v5 startAnimating];

    id v6 = [(ICPDFAttachmentView *)self progressView];
    [v6 setHidden:0];

    double v7 = [(ICPDFAttachmentView *)self progressView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v8 = [(ICPDFAttachmentView *)self progressView];
    [(ICPDFAttachmentView *)self addSubview:v8];

    id v9 = (void *)MEMORY[0x263F08938];
    double v10 = [(ICPDFAttachmentView *)self progressView];
    double v11 = [v9 constraintWithItem:self attribute:9 relatedBy:0 toItem:v10 attribute:9 multiplier:1.0 constant:0.0];
    v16[0] = v11;
    long long v12 = (void *)MEMORY[0x263F08938];
    uint64_t v13 = [(ICPDFAttachmentView *)self progressView];
    v14 = [v12 constraintWithItem:self attribute:10 relatedBy:0 toItem:v13 attribute:10 multiplier:1.0 constant:0.0];
    v16[1] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

    [MEMORY[0x263F08938] activateConstraints:v15];
  }
}

- (void)stopProgress
{
  BOOL v3 = [(ICPDFAttachmentView *)self progressView];

  if (v3)
  {
    id v4 = [(ICPDFAttachmentView *)self progressView];
    [v4 removeFromSuperview];

    [(ICPDFAttachmentView *)self setProgressView:0];
  }
}

- (NSOperation)renderOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderOperation);

  return (NSOperation *)WeakRetained;
}

- (void)setRenderOperation:(id)a3
{
}

- (UIActivityIndicatorView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (ICSelectorDelayer)startProgressSelectorDelayer
{
  return (ICSelectorDelayer *)objc_getProperty(self, a2, 560, 1);
}

- (void)setStartProgressSelectorDelayer:(id)a3
{
}

- (BOOL)isManaullyGeneratingImage
{
  return self->_isManaullyGeneratingImage;
}

- (void)setIsManaullyGeneratingImage:(BOOL)a3
{
  self->_isManaullyGeneratingImage = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isRendering
{
  return self->_rendering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_startProgressSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_destroyWeak((id *)&self->_renderOperation);
}

@end