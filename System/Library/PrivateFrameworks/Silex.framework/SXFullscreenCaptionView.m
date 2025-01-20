@interface SXFullscreenCaptionView
+ (id)_overridePropertiesWithComponentStyle:(id)a3 storage:(id)a4;
+ (void)_applyStyle:(id)a3 toStorage:(id)a4;
- (BOOL)expanded;
- (BOOL)forceFullExpandsionMode;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGPoint)positionForTextLayout:(id)a3;
- (CGRect)determineFrameInSuperview:(id)a3;
- (CGRect)frameWithSuperview:(id)a3 size:(CGSize)a4 forExpansionMode:(int)a5;
- (CGRect)temporaryLayoutRect;
- (CGSize)fullSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SXAutoSizedCanvasController)autoSizeCanvasController;
- (SXComponentActionHandler)actionHandler;
- (SXFullscreenCaption)caption;
- (SXFullscreenCaptionView)initWithTextSourceFactory:(id)a3 actionHandler:(id)a4;
- (SXFullscreenCaptionViewDelegate)delegate;
- (SXStandaloneTextInfo)captionInfo;
- (SXStandaloneTextLayout)captionLayout;
- (SXTextSource)textSource;
- (SXTextSourceFactory)textSourceFactory;
- (SXTextTangierDocumentRoot)documentRoot;
- (SXTextTangierStorage)textStorage;
- (UIEdgeInsets)fullInsets;
- (UIScrollView)scrollView;
- (UISwipeGestureRecognizer)swipeGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIVisualEffectView)backgroundView;
- (double)marginForTextLayout:(id)a3;
- (double)widthForTextLayout:(id)a3;
- (int)expansionMode;
- (unint64_t)viewIndex;
- (void)createBackgroundView;
- (void)createScrollView;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)handleSwipeGestureRecognizer:(id)a3;
- (void)handleTapGestureRecognizer:(id)a3;
- (void)initializeTangier;
- (void)layoutSubviews;
- (void)renderCaptionInTangier;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAutoSizeCanvasController:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCaptionInfo:(id)a3;
- (void)setCaptionLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentRoot:(id)a3;
- (void)setExpansionMode:(int)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setFullInsets:(UIEdgeInsets)a3;
- (void)setFullSize:(CGSize)a3;
- (void)setNeedsLayout;
- (void)setScrollView:(id)a3;
- (void)setSwipeGestureRecognizer:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTemporaryLayoutRect:(CGRect)a3;
- (void)setTextSource:(id)a3;
- (void)setTextStorage:(id)a3;
- (void)setupGestureRecognizers;
- (void)updateFrameAnimated:(BOOL)a3;
- (void)updateWithCaption:(id)a3 forViewIndex:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation SXFullscreenCaptionView

- (SXFullscreenCaptionView)initWithTextSourceFactory:(id)a3 actionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXFullscreenCaptionView;
  v9 = [(SXFullscreenCaptionView *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textSourceFactory, a3);
    objc_storeStrong((id *)&v10->_actionHandler, a4);
    [(SXFullscreenCaptionView *)v10 createBackgroundView];
    [(SXFullscreenCaptionView *)v10 createScrollView];
    [(SXFullscreenCaptionView *)v10 setupGestureRecognizers];
    [(SXFullscreenCaptionView *)v10 initializeTangier];
  }

  return v10;
}

- (void)dealloc
{
  [(SXStandaloneTextLayout *)self->_captionLayout setDelegate:0];
  [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController setDelegate:0];
  [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController teardown];
  v3.receiver = self;
  v3.super_class = (Class)SXFullscreenCaptionView;
  [(SXFullscreenCaptionView *)&v3 dealloc];
}

- (void)updateWithCaption:(id)a3 forViewIndex:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v17 = a3;
  objc_storeStrong((id *)&self->_caption, a3);
  self->_viewIndex = a4;
  if ([(SXFullscreenCaptionView *)self expansionMode] == 2)
  {
    v9 = [(SXFullscreenCaptionView *)self scrollView];
    [v9 setScrollEnabled:0];
  }
  self->_expansionMode = 1;
  [(SXFullscreenCaptionView *)self renderCaptionInTangier];
  [(SXFullscreenCaptionView *)self updateFrameAnimated:v5];
  [(SXFullscreenCaptionView *)self frame];
  double v11 = v10;
  objc_super v12 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
  [v12 lineHeight];
  double v14 = v13 * 4.5 + 15.5;

  if (v11 > v14) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2;
  }
  [(SXFullscreenCaptionView *)self setExpansionMode:v15 animated:0];
  v16 = -[SXFullscreenCaption text]((uint64_t)v17);
  if ([v16 length])
  {
    [(SXFullscreenCaptionView *)self setIsAccessibilityElement:1];
    [(SXFullscreenCaptionView *)self setAccessibilityLabel:v16];
  }
  else
  {
    [(SXFullscreenCaptionView *)self setIsAccessibilityElement:0];
  }
}

- (void)createBackgroundView
{
  id v6 = [MEMORY[0x263F1C480] effectWithStyle:2];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v6];
  [(SXFullscreenCaptionView *)self setBackgroundView:v3];

  v4 = [(SXFullscreenCaptionView *)self backgroundView];
  [v4 _setGroupName:@"captionBars"];

  BOOL v5 = [(SXFullscreenCaptionView *)self backgroundView];
  [(SXFullscreenCaptionView *)self addSubview:v5];
}

- (CGRect)determineFrameInSuperview:(id)a3
{
  id v4 = a3;
  [v4 safeAreaInsets];
  double v6 = v5;
  double v8 = v7;
  v9 = [MEMORY[0x263F1C920] mainScreen];
  [v9 _peripheryInsets];
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [v4 bounds];
  CGFloat v14 = CGRectGetWidth(v28) - v6 - v8;
  -[SXFullscreenCaptionView sizeThatFits:](self, "sizeThatFits:", v14, 1.79769313e308);
  self->_fullSize.width = v14;
  self->_fullSize.height = v15;
  self->_fullInsets.top = v11;
  self->_fullInsets.left = v6;
  self->_fullInsets.bottom = v13;
  self->_fullInsets.right = v8;
  -[SXFullscreenCaptionView frameWithSuperview:size:forExpansionMode:](self, "frameWithSuperview:size:forExpansionMode:", v4, [(SXFullscreenCaptionView *)self expansionMode], v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)frameWithSuperview:(id)a3 size:(CGSize)a4 forExpansionMode:(int)a5
{
  double height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  [(SXFullscreenCaptionView *)self fullInsets];
  double v11 = v10;
  double v13 = v12;
  [v9 bounds];
  double v14 = CGRectGetHeight(v35);
  double v15 = height + v13 + 16.0;
  if (a5 == 2)
  {
    double v21 = [(SXFullscreenCaptionView *)self superview];
    [v21 bounds];
    double v23 = v22 * 0.5;

    if (v23 >= v14 - v15) {
      double v16 = v23;
    }
    else {
      double v16 = v14 - v15;
    }
  }
  else
  {
    double v16 = v14;
    if (a5 == 1)
    {
      double v17 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
      [v17 lineHeight];
      double v19 = v18;

      double v20 = v19 * 4.5 + 15.5;
      if (v20 >= v15) {
        double v20 = v15;
      }
      double v16 = v14 - v20;
    }
  }
  uint64_t v24 = [(SXFullscreenCaptionView *)self caption];
  if (!v24) {
    goto LABEL_12;
  }
  double v25 = (void *)v24;
  double v26 = [(SXFullscreenCaptionView *)self caption];
  double v27 = -[SXFullscreenCaption text]((uint64_t)v26);
  uint64_t v28 = [v27 length];

  if (v28)
  {
    double v29 = v14 - v16;
    double v14 = v16;
  }
  else
  {
LABEL_12:
    double v29 = 0.0;
  }
  [v9 bounds];
  double v30 = v11 + CGRectGetMinX(v36);

  double v31 = v30;
  double v32 = v14;
  double v33 = width;
  double v34 = v29;
  result.size.double height = v34;
  result.size.CGFloat width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)SXFullscreenCaptionView;
  -[SXFullscreenCaptionView setFrame:](&v33, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SXFullscreenCaptionView *)self fullInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = -v4;
  [(SXFullscreenCaptionView *)self fullSize];
  double v12 = v9 + v5 + v11;
  [(SXFullscreenCaptionView *)self fullSize];
  double v14 = v7 + v13 + 16.0;
  double v15 = [(SXFullscreenCaptionView *)self backgroundView];
  objc_msgSend(v15, "setFrame:", v10, 0.0, v12, v14);

  double v16 = [(SXFullscreenCaptionView *)self scrollView];
  [(SXFullscreenCaptionView *)self fullInsets];
  double v18 = v17;
  [(SXFullscreenCaptionView *)self bounds];
  double Width = CGRectGetWidth(v34);
  [(SXFullscreenCaptionView *)self bounds];
  objc_msgSend(v16, "setFrame:", v18, 15.5, Width, CGRectGetHeight(v35) + -15.5);

  double v20 = [(SXFullscreenCaptionView *)self scrollView];
  [(SXFullscreenCaptionView *)self fullSize];
  objc_msgSend(v20, "setContentSize:");

  double v21 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
  double v22 = [v21 canvasView];
  [(SXFullscreenCaptionView *)self fullSize];
  double v24 = v23;
  [(SXFullscreenCaptionView *)self fullSize];
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v24, v25);

  [(SXFullscreenCaptionView *)self fullSize];
  double v27 = v26;
  double v29 = v28;
  double v30 = [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController cvc];
  double v31 = [v30 canvasLayer];
  objc_msgSend(v31, "setUnscaledSize:", v27, v29);

  double v32 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
  [v32 invalidateLayoutsAndFrames];
}

- (void)setNeedsLayout
{
  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenCaptionView;
  [(SXFullscreenCaptionView *)&v4 setNeedsLayout];
  objc_super v3 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
  [v3 invalidateLayoutsAndFrames];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SXFullscreenCaptionView;
  [(SXFullscreenCaptionView *)&v5 layoutSubviews];
  objc_super v3 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
  objc_super v4 = [v3 icc];
  [v4 layoutIfNeeded];
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenCaptionView;
  [(SXFullscreenCaptionView *)&v4 didMoveToSuperview];
  objc_super v3 = [(SXFullscreenCaptionView *)self superview];

  if (v3) {
    [(SXFullscreenCaptionView *)self updateFrameAnimated:0];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
  [v6 invalidateLayoutsAndFrames];

  -[SXFullscreenCaptionView setTemporaryLayoutRect:](self, "setTemporaryLayoutRect:", 0.0, 0.0, width, height);
  double v7 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
  [v7 sizeThatFits];
  double v9 = v8;
  double v11 = v10;

  -[SXFullscreenCaptionView setTemporaryLayoutRect:](self, "setTemporaryLayoutRect:", *MEMORY[0x263F00190], *(double *)(MEMORY[0x263F00190] + 8), *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v12 = v11 + 16.0;
  double v13 = v9;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)updateFrameAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SXFullscreenCaptionView *)self superview];

  if (v5)
  {
    double v6 = [(SXFullscreenCaptionView *)self superview];
    [(SXFullscreenCaptionView *)self determineFrameInSuperview:v6];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    [(SXFullscreenCaptionView *)self frame];
    double MinY = CGRectGetMinY(v24);
    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.double width = v12;
    v25.size.double height = v14;
    double v16 = CGRectGetMinY(v25);
    [(SXFullscreenCaptionView *)self frame];
    double Height = CGRectGetHeight(v26);
    v27.origin.x = v8;
    v27.origin.y = v10;
    v27.size.double width = v12;
    v27.size.double height = v14;
    double v18 = CGRectGetHeight(v27);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __47__SXFullscreenCaptionView_updateFrameAnimated___block_invoke;
    v23[3] = &unk_264651D18;
    v23[4] = self;
    *(CGFloat *)&v23[5] = v8;
    *(CGFloat *)&v23[6] = v10;
    *(CGFloat *)&v23[7] = v12;
    *(CGFloat *)&v23[8] = v14;
    uint64_t v19 = MEMORY[0x223CA5030](v23);
    double v20 = (void *)v19;
    if (v3)
    {
      double v21 = MinY - v16;
      if (MinY - v16 < 0.0) {
        double v21 = -(MinY - v16);
      }
      double v22 = Height - v18;
      if (Height - v18 < 0.0) {
        double v22 = -(Height - v18);
      }
      [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v19 options:0 animations:(v21 + v22) * 0.00017 + 0.16 completion:0.0];
    }
    else
    {
      (*(void (**)(uint64_t))(v19 + 16))(v19);
    }
  }
}

uint64_t __47__SXFullscreenCaptionView_updateFrameAnimated___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGRect v4 = CGRectIntegral(*(CGRect *)(a1 + 40));
  return objc_msgSend(v1, "setFrame:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

- (void)createScrollView
{
  BOOL v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F1C940]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  objc_super v5 = [(SXFullscreenCaptionView *)self scrollView];
  [v5 setScrollsToTop:0];

  double v6 = [(SXFullscreenCaptionView *)self scrollView];
  [v6 setDelegate:self];

  double v7 = [(SXFullscreenCaptionView *)self scrollView];
  [v7 setAlwaysBounceVertical:1];

  CGFloat v8 = [(SXFullscreenCaptionView *)self scrollView];
  [v8 setDelegate:self];

  id v11 = [(SXFullscreenCaptionView *)self backgroundView];
  double v9 = [v11 contentView];
  CGFloat v10 = [(SXFullscreenCaptionView *)self scrollView];
  [v9 addSubview:v10];
}

- (void)initializeTangier
{
  BOOL v3 = objc_alloc_init(SXTextTangierDocumentRoot);
  documentRoot = self->_documentRoot;
  self->_documentRoot = v3;

  CGRect v25 = objc_alloc_init(SXTangierDragItemProvider);
  objc_super v5 = [SXAutoSizedCanvasController alloc];
  double v6 = self->_documentRoot;
  double v7 = [(SXFullscreenCaptionView *)self actionHandler];
  CGFloat v8 = [(SXAutoSizedCanvasController *)v5 initWithDocumentRoot:v6 actionHandler:v7 dragItemProvider:v25];
  autoSizeCanvasController = self->_autoSizeCanvasController;
  self->_autoSizeCanvasController = v8;

  [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController setDelegate:self];
  CGFloat v10 = [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController canvasView];
  [v10 setClipsToBounds:0];

  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v15 = [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController canvasView];
  objc_msgSend(v15, "setFrame:", v11, v12, v13, v14);

  double v16 = [MEMORY[0x263F1C550] clearColor];
  double v17 = [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController canvasView];
  [v17 setBackgroundColor:v16];

  double v18 = [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController canvasView];
  [v18 setOpaque:0];

  double v19 = *MEMORY[0x263F001B0];
  double v20 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v21 = [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController cvc];
  double v22 = [v21 canvasLayer];
  objc_msgSend(v22, "setUnscaledSize:", v19, v20);

  double v23 = [(SXFullscreenCaptionView *)self scrollView];
  CGRect v24 = [(SXAutoSizedCanvasController *)self->_autoSizeCanvasController canvasView];
  [v23 addSubview:v24];
}

- (void)renderCaptionInTangier
{
  v55[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(SXFullscreenCaptionView *)self captionLayout];

  if (v3)
  {
    CGRect v4 = [(SXFullscreenCaptionView *)self captionLayout];
    [v4 setDelegate:0];

    objc_super v5 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
    double v6 = [v5 icc];
    double v7 = [v6 layoutController];
    CGFloat v8 = [(SXFullscreenCaptionView *)self captionLayout];
    [v7 unregisterLayout:v8];
  }
  double v9 = [(SXFullscreenCaptionView *)self caption];
  CGFloat v10 = -[SXFullscreenCaption text]((uint64_t)v9);

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F7C798]);
    double v12 = [(TSPObject *)self->_documentRoot context];
    double v13 = [(SXFullscreenCaptionView *)self caption];
    double v14 = -[SXFullscreenCaption text]((uint64_t)v13);
    double v15 = [(SXTextTangierDocumentRoot *)self->_documentRoot stylesheet];
    v54 = (void *)[v11 initWithContext:v12 string:v14 stylesheet:v15 kind:3];

    double v16 = objc_opt_class();
    double v17 = [(SXFullscreenCaptionView *)self caption];
    double v18 = [(SXFullscreenCaptionView *)self textSource];
    double v19 = [v17 componentTextStyleForTextSource:v18 inheritingFromDefaultStyles:1];
    [v16 _applyStyle:v19 toStorage:v54];

    double v20 = [(SXFullscreenCaptionView *)self textSourceFactory];
    double v21 = [(SXFullscreenCaptionView *)self caption];
    double v22 = -[SXFullscreenCaption text]((uint64_t)v21);
    double v23 = [(SXFullscreenCaptionView *)self caption];
    CGRect v24 = [v20 createTextSourceWithString:v22 dataSource:v23];
    [(SXFullscreenCaptionView *)self setTextSource:v24];

    CGRect v25 = [SXTextTangierStorage alloc];
    CGRect v26 = [(SXFullscreenCaptionView *)self documentRoot];
    CGRect v27 = [v26 context];
    double v28 = [(SXFullscreenCaptionView *)self documentRoot];
    double v29 = [v28 stylesheet];
    double v30 = [(SXFullscreenCaptionView *)self textSource];
    double v31 = [v30 string];
    double v32 = [(SXFullscreenCaptionView *)self textSource];
    objc_super v33 = [v32 locale];
    CGRect v34 = [(SXTextTangierStorage *)v25 initWithContext:v27 stylesheet:v29 storageKind:3 string:v31 locale:v33];
    [(SXFullscreenCaptionView *)self setTextStorage:v34];

    CGRect v35 = [(SXFullscreenCaptionView *)self textSource];
    CGRect v36 = [(SXFullscreenCaptionView *)self textStorage];
    [v35 applyStylingOnTextTangierStorage:v36];

    v37 = [(SXFullscreenCaptionView *)self textSource];
    v38 = [(SXFullscreenCaptionView *)self textStorage];
    [v37 applyAdditionsOnTextTangierStorage:v38];

    v39 = [SXStandaloneTextInfo alloc];
    v40 = [(SXFullscreenCaptionView *)self textStorage];
    v41 = [(SXStandaloneTextInfo *)v39 initWithStorage:v40];
    [(SXFullscreenCaptionView *)self setCaptionInfo:v41];

    v42 = [SXStandaloneTextLayout alloc];
    v43 = [(SXFullscreenCaptionView *)self captionInfo];
    v44 = [(TSDContainerLayout *)v42 initWithInfo:v43];
    [(SXFullscreenCaptionView *)self setCaptionLayout:v44];

    v45 = [(SXFullscreenCaptionView *)self captionLayout];
    [v45 setDelegate:self];

    v46 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
    v47 = [v46 icc];
    v48 = [v47 layoutController];
    v49 = [(SXFullscreenCaptionView *)self captionLayout];
    [v48 preregisterLayout:v49];

    v50 = [(SXFullscreenCaptionView *)self captionInfo];
    v55[0] = v50;
    v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:1];
    v52 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
    v53 = [v52 icc];
    [v53 setInfosToDisplay:v51];
  }
}

+ (id)_overridePropertiesWithComponentStyle:(id)a3 storage:(id)a4
{
  CGRect v4 = objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", a3, a4, 15.0, *MEMORY[0x263F1D338]);
  id v5 = objc_alloc(MEMORY[0x263F7C710]);
  double v6 = [v4 fontName];
  [v4 pointSize];
  uint64_t v8 = v7;
  double v9 = [MEMORY[0x263F7C808] whiteColor];
  CGFloat v10 = [MEMORY[0x263F7C808] clearColor];
  id v11 = [MEMORY[0x263F7C808] clearColor];
  double v12 = objc_msgSend(v5, "initWithPropertiesAndValues:", 16, v6, 17, v8, 18, v9, 37, v10, 98, v11, 35, 0xBF978D4FDF3B645ALL, 0);

  return v12;
}

+ (void)_applyStyle:(id)a3 toStorage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 stylesheet];
  id v14 = [v8 styleWithIdentifier:@"paragraph-style-default"];

  double v9 = [a1 _overridePropertiesWithComponentStyle:v7 storage:v6];

  CGFloat v10 = [v6 stylesheet];
  id v11 = [v10 variationOfStyle:v14 propertyMap:v9];

  uint64_t v12 = [v6 range];
  objc_msgSend(v6, "setParagraphStyle:forCharRange:undoTransaction:", v11, v12, v13, 0);
}

- (double)marginForTextLayout:(id)a3
{
  return 10.0;
}

- (double)widthForTextLayout:(id)a3
{
  [(SXFullscreenCaptionView *)self temporaryLayoutRect];
  if (CGRectIsInfinite(v6)) {
    [(SXFullscreenCaptionView *)self frame];
  }
  else {
    [(SXFullscreenCaptionView *)self temporaryLayoutRect];
  }
  return v4;
}

- (CGPoint)positionForTextLayout:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setExpansionMode:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = *(void **)&a3;
  self->_expansionMode = a3;
  [(SXFullscreenCaptionView *)self updateFrameAnimated:a4];
  if (v5 == 2)
  {
    id v5 = [(SXFullscreenCaptionView *)self scrollView];
    [v5 contentSize];
    double v10 = v9;
    [(SXFullscreenCaptionView *)self frame];
    BOOL v8 = v10 > v11;
    uint64_t v7 = 1;
  }
  else
  {
    if (v5 == 1)
    {
      id v5 = [(SXFullscreenCaptionView *)self scrollView];
      objc_msgSend(v5, "setContentOffset:animated:", v4, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    }
    uint64_t v7 = 0;
    BOOL v8 = 0;
  }
  uint64_t v12 = [(SXFullscreenCaptionView *)self scrollView];
  [v12 setScrollEnabled:v8];

  if (v7) {
  id v15 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
  }
  uint64_t v13 = [v15 cvc];
  id v14 = [v13 view];
  [v14 setUserInteractionEnabled:v7];
}

- (BOOL)expanded
{
  return [(SXFullscreenCaptionView *)self expansionMode] != 0;
}

- (void)setupGestureRecognizers
{
  double v3 = (UISwipeGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA00]) initWithTarget:self action:sel_handleSwipeGestureRecognizer_];
  swipeGestureRecognizer = self->_swipeGestureRecognizer;
  self->_swipeGestureRecognizer = v3;

  id v5 = [(SXFullscreenCaptionView *)self swipeGestureRecognizer];
  [v5 setDelegate:self];

  CGRect v6 = [(SXFullscreenCaptionView *)self swipeGestureRecognizer];
  [v6 setDirection:4];

  uint64_t v7 = [(SXFullscreenCaptionView *)self swipeGestureRecognizer];
  [(SXFullscreenCaptionView *)self addGestureRecognizer:v7];

  BOOL v8 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_handleTapGestureRecognizer_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v8;

  double v10 = [(SXFullscreenCaptionView *)self tapGestureRecognizer];
  [v10 setDelegate:self];

  id v11 = [(SXFullscreenCaptionView *)self tapGestureRecognizer];
  [(SXFullscreenCaptionView *)self addGestureRecognizer:v11];
}

- (void)handleTapGestureRecognizer:(id)a3
{
  int v4 = [(SXFullscreenCaptionView *)self expansionMode];
  if (![(SXFullscreenCaptionView *)self forceFullExpandsionMode])
  {
    if (v4 == 1) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [(SXFullscreenCaptionView *)self setExpansionMode:v5 animated:1];
  }
}

- (void)handleSwipeGestureRecognizer:(id)a3
{
  if (![(SXFullscreenCaptionView *)self forceFullExpandsionMode])
  {
    [(SXFullscreenCaptionView *)self setExpansionMode:2 animated:1];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SXFullscreenCaptionView *)self tapGestureRecognizer];

  if (v5 == v4
    && ([(SXFullscreenCaptionView *)self delegate],
        CGRect v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) != 0))
  {
    BOOL v8 = [(SXFullscreenCaptionView *)self delegate];
    double v9 = [(SXFullscreenCaptionView *)self tapGestureRecognizer];
    char v10 = [v8 captionView:self tapGestureRecognizerShouldBegin:v9];
  }
  else
  {
    char v10 = 1;
  }
  id v11 = [(SXFullscreenCaptionView *)self swipeGestureRecognizer];

  if (v11 == v4) {
    char v10 = [(SXFullscreenCaptionView *)self expansionMode] == 1;
  }

  return v10;
}

- (BOOL)forceFullExpandsionMode
{
  [(SXFullscreenCaptionView *)self frame];
  double v4 = v3;
  id v5 = [(SXFullscreenCaptionView *)self autoSizeCanvasController];
  [v5 lineHeight];
  BOOL v7 = v4 <= v6 * 4.5 + 15.5;

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  [a3 contentOffset];
  if (v4 < -40.0)
  {
    [(SXFullscreenCaptionView *)self setExpansionMode:1 animated:1];
  }
}

- (SXFullscreenCaptionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXFullscreenCaptionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXFullscreenCaption)caption
{
  return self->_caption;
}

- (unint64_t)viewIndex
{
  return self->_viewIndex;
}

- (int)expansionMode
{
  return self->_expansionMode;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (SXAutoSizedCanvasController)autoSizeCanvasController
{
  return self->_autoSizeCanvasController;
}

- (void)setAutoSizeCanvasController:(id)a3
{
}

- (SXTextTangierDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
}

- (SXStandaloneTextInfo)captionInfo
{
  return self->_captionInfo;
}

- (void)setCaptionInfo:(id)a3
{
}

- (SXStandaloneTextLayout)captionLayout
{
  return self->_captionLayout;
}

- (void)setCaptionLayout:(id)a3
{
}

- (CGRect)temporaryLayoutRect
{
  double x = self->_temporaryLayoutRect.origin.x;
  double y = self->_temporaryLayoutRect.origin.y;
  double width = self->_temporaryLayoutRect.size.width;
  double height = self->_temporaryLayoutRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTemporaryLayoutRect:(CGRect)a3
{
  self->_temporaryLayoutRect = a3;
}

- (CGSize)fullSize
{
  double width = self->_fullSize.width;
  double height = self->_fullSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFullSize:(CGSize)a3
{
  self->_fullSize = a3;
}

- (UIEdgeInsets)fullInsets
{
  double top = self->_fullInsets.top;
  double left = self->_fullInsets.left;
  double bottom = self->_fullInsets.bottom;
  double right = self->_fullInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFullInsets:(UIEdgeInsets)a3
{
  self->_fullInsets = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UISwipeGestureRecognizer)swipeGestureRecognizer
{
  return self->_swipeGestureRecognizer;
}

- (void)setSwipeGestureRecognizer:(id)a3
{
}

- (SXTextSource)textSource
{
  return self->_textSource;
}

- (void)setTextSource:(id)a3
{
}

- (SXTextTangierStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textSource, 0);
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_captionLayout, 0);
  objc_storeStrong((id *)&self->_captionInfo, 0);
  objc_storeStrong((id *)&self->_documentRoot, 0);
  objc_storeStrong((id *)&self->_autoSizeCanvasController, 0);
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end