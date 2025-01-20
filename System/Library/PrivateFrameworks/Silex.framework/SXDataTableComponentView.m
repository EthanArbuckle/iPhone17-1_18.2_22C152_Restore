@interface SXDataTableComponentView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)userInteractable;
- (CALayer)leftShadow;
- (CALayer)rightShadow;
- (SXAdIgnorableViewFactory)adIgnorableViewFactory;
- (SXComponentActionHandler)componentActionHandler;
- (SXComponentController)componentController;
- (SXDataTableBlueprint)blueprint;
- (SXDataTableComponentController)dataTableComponentController;
- (SXDataTableComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 imageViewFactory:(id)a7 componentActionHandler:(id)a8 textComponentLayoutHosting:(id)a9 componentController:(id)a10 adIgnorableViewFactory:(id)a11 config:(id)a12;
- (SXDataTableDictionary)imageViews;
- (SXDataTableDictionary)textViews;
- (SXDataTableView)tableView;
- (SXFeatures)config;
- (SXImageViewFactory)imageViewFactory;
- (SXScrollView)scrollView;
- (SXTangierController)tangierController;
- (SXTextComponentLayoutHosting)textComponentLayoutHosting;
- (id)contentViewForBehavior:(id)a3;
- (id)dataTableView:(id)a3 viewForCellAtIndexPath:(id)a4 constraintToSize:(CGSize)a5;
- (id)descriptorForIndexPath:(id)a3;
- (void)addTextStorageForIndexPath:(id)a3 toCollectior:(id)a4;
- (void)dealloc;
- (void)presentComponentWithChanges:(id)a3;
- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4;
- (void)setBlueprint:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDataTableComponentController:(id)a3;
- (void)setImageViews:(id)a3;
- (void)setLeftShadow:(id)a3;
- (void)setRightShadow:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTangierController:(id)a3;
- (void)setTextViews:(id)a3;
- (void)setupShadowsIfNeeded;
- (void)updateShadowOpacity;
- (void)updateTangierController;
@end

@implementation SXDataTableComponentView

- (SXDataTableComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 imageViewFactory:(id)a7 componentActionHandler:(id)a8 textComponentLayoutHosting:(id)a9 componentController:(id)a10 adIgnorableViewFactory:(id)a11 config:(id)a12
{
  id v27 = a7;
  id v26 = a8;
  id v18 = a9;
  id v19 = a10;
  id v25 = a11;
  id v20 = a12;
  v28.receiver = self;
  v28.super_class = (Class)SXDataTableComponentView;
  v21 = [(SXComponentView *)&v28 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_imageViewFactory, a7);
    objc_storeStrong((id *)&v22->_componentActionHandler, a8);
    objc_storeWeak((id *)&v22->_textComponentLayoutHosting, v18);
    objc_storeWeak((id *)&v22->_componentController, v19);
    objc_storeStrong((id *)&v22->_adIgnorableViewFactory, a11);
    objc_storeStrong((id *)&v22->_config, a12);
  }

  return v22;
}

- (void)presentComponentWithChanges:(id)a3
{
  v52.receiver = self;
  v52.super_class = (Class)SXDataTableComponentView;
  [(SXComponentView *)&v52 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  v4 = [(SXDataTableComponentView *)self tableView];

  if (!v4)
  {
    v5 = [(SXDataTableComponentView *)self dataTableComponentController];
    uint64_t v6 = [v5 numberOfRows];
    v7 = [(SXDataTableComponentView *)self dataTableComponentController];
    v8 = +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", v6, [v7 numberOfColumns]);
    [(SXDataTableComponentView *)self setTextViews:v8];

    v9 = [(SXDataTableComponentView *)self dataTableComponentController];
    uint64_t v10 = [v9 numberOfRows];
    v11 = [(SXDataTableComponentView *)self dataTableComponentController];
    v12 = +[SXDataTableDictionary dataTableDictionaryWithRows:andColumns:](SXDataTableDictionary, "dataTableDictionaryWithRows:andColumns:", v10, [v11 numberOfColumns]);
    [(SXDataTableComponentView *)self setImageViews:v12];

    v13 = objc_alloc_init(SXScrollView);
    v14 = objc_alloc_init(SXTangierDragItemProvider);
    v15 = [SXTangierController alloc];
    v16 = [(SXComponentView *)self viewport];
    v17 = [(SXDataTableComponentView *)self componentActionHandler];
    id v18 = [(SXDataTableComponentView *)self componentController];
    id v19 = [(SXComponentView *)self DOMObjectProvider];
    id v20 = [(SXDataTableComponentView *)self adIgnorableViewFactory];
    v21 = [(SXDataTableComponentView *)self config];
    v22 = [(SXTangierController *)v15 initWithViewport:v16 scrollView:v13 componentActionHandler:v17 dragItemProvider:v14 componentController:v18 componentInteractionManager:0 DOMObjectProvider:v19 adIgnorableViewFactory:v20 config:v21];
    [(SXDataTableComponentView *)self setTangierController:v22];

    v23 = [(SXDataTableComponentView *)self tangierController];
    [v23 setDelegate:self];

    v24 = [(SXComponentView *)self presentationDelegate];
    id v25 = [v24 textSelectionManager];
    id v26 = [(SXDataTableComponentView *)self tangierController];
    [v25 addTextSelecting:v26];

    id v27 = [SXScrollView alloc];
    objc_super v28 = -[SXScrollView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(SXDataTableComponentView *)self setScrollView:v28];

    v29 = [(SXDataTableComponentView *)self scrollView];
    v30 = [(SXDataTableComponentView *)self tangierController];
    v31 = [v30 cvc];
    v32 = [v31 view];
    [v29 addSubview:v32];

    v33 = [(SXDataTableComponentView *)self scrollView];
    v34 = [(SXDataTableComponentView *)self tangierController];
    v35 = [v34 icc];
    [v33 setDelegate:v35];

    v36 = -[SXDataTableView initWithDataSource:]((id *)[SXDataTableView alloc], self);
    [(SXDataTableComponentView *)self setTableView:v36];

    v37 = [(SXDataTableComponentView *)self tangierController];
    v38 = [v37 cvc];
    v39 = [v38 view];
    v40 = [(SXDataTableComponentView *)self tableView];
    [v39 addSubview:v40];

    v41 = [(SXComponentView *)self contentView];
    v42 = [(SXDataTableComponentView *)self scrollView];
    [v41 addSubview:v42];
  }
  v43 = [(SXDataTableComponentView *)self tableView];
  v44 = [(SXDataTableComponentView *)self dataTableComponentController];
  -[SXDataTableView setDataSource:](v43, v44);

  v45 = [(SXDataTableComponentView *)self tableView];
  v46 = [(SXDataTableComponentView *)self blueprint];
  -[SXDataTableView setBlueprint:](v45, v46);

  v47 = [(SXDataTableComponentView *)self scrollView];
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v47, "setFrame:");

  v48 = [(SXDataTableComponentView *)self scrollView];
  v49 = [(SXDataTableComponentView *)self tableView];
  [v49 bounds];
  objc_msgSend(v48, "setContentSize:", v50, v51);

  [(SXDataTableComponentView *)self setupShadowsIfNeeded];
  [(SXDataTableComponentView *)self updateTangierController];
}

- (void)dealloc
{
  v3 = [(SXDataTableComponentView *)self tangierController];
  [v3 teardown];

  v4.receiver = self;
  v4.super_class = (Class)SXDataTableComponentView;
  [(SXComponentView *)&v4 dealloc];
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SXDataTableComponentView;
  [(SXComponentView *)&v10 receivedInfo:v7 fromLayoutingPhaseWithIdentifier:v8];
  if ([v8 isEqualToString:@"blueprint"])
  {
    v9 = &OBJC_IVAR___SXDataTableComponentView__blueprint;
LABEL_5:
    objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *v9), a3);
    goto LABEL_6;
  }
  if ([v8 isEqualToString:@"component_controller"])
  {
    v9 = &OBJC_IVAR___SXDataTableComponentView__dataTableComponentController;
    goto LABEL_5;
  }
LABEL_6:
}

- (id)dataTableView:(id)a3 viewForCellAtIndexPath:(id)a4 constraintToSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  objc_super v10 = [(SXDataTableComponentView *)self dataTableComponentController];
  v11 = [v10 cellObjects];
  v12 = objc_msgSend(v11, "objectForIndexPath:", var0, var1);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [(SXDataTableComponentView *)self dataTableComponentController];
    v14 = [v13 textLayouters];
    objc_msgSend(v14, "objectForIndexPath:", var0, var1);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    [v15 boundingSize];
    double v17 = v16;
    id v18 = [(SXDataTableComponentView *)self textViews];
    objc_msgSend(v18, "objectForIndexPath:", var0, var1);
    id v19 = (SXTextView *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      id v19 = -[SXTextView initWithFrame:]([SXTextView alloc], "initWithFrame:", 0.0, 0.0, width, v17);
      v41 = [(SXDataTableComponentView *)self textViews];
      objc_msgSend(v41, "setObject:forIndexPath:", v19, var0, var1);

      v42 = [(SXDataTableComponentView *)self tangierController];
      [v42 didStartPresentingTextView:v19];
    }
    -[SXTextView setFrame:](v19, "setFrame:", 0.0, 0.0, width, v17);
    [(SXTextView *)v19 setTextLayouter:v15];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v19 = 0;
      goto LABEL_18;
    }
    id v15 = v12;
    id v20 = -[SXDataTableComponentView descriptorForIndexPath:](self, "descriptorForIndexPath:", var0, var1);
    v21 = [v20 format];
    [v21 maximumWidth];
    if (v22)
    {
      v23 = [(SXComponentView *)self unitConverter];
      uint64_t v24 = [v21 maximumWidth];
      objc_msgSend(v23, "convertValueToPoints:", v24, v25);
      double v27 = v26;

      if (width >= v27) {
        double width = v27;
      }
    }
    [v21 maximumHeight];
    if (v28)
    {
      v29 = [(SXComponentView *)self unitConverter];
      uint64_t v30 = [v21 maximumHeight];
      objc_msgSend(v29, "convertValueToPoints:", v30, v31);
      double v33 = v32;

      if (height >= v33) {
        double height = v33;
      }
    }
    v34 = [(SXDataTableComponentView *)self imageViews];
    objc_msgSend(v34, "objectForIndexPath:", var0, var1);
    id v19 = (SXTextView *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v35 = [(SXDataTableComponentView *)self imageViewFactory];
      id v19 = [v35 imageViewForResource:v15];

      [(SXTextView *)v19 addInterestInImageQuality:0 forObject:self];
      v36 = [(SXDataTableComponentView *)self imageViews];
      objc_msgSend(v36, "setObject:forIndexPath:", v19, var0, var1);
    }
    objc_msgSend(v15, "sizeThatFits:", width, height);
    -[SXTextView setFrame:](v19, "setFrame:", 0.0, 0.0, v37, v38);
    [(SXTextView *)v19 bounds];
    -[SXTextView setPreferredImageSize:](v19, "setPreferredImageSize:", v39, v40);
  }
LABEL_18:

  return v19;
}

- (void)updateTangierController
{
  v3 = [(SXDataTableComponentView *)self tangierController];
  objc_super v4 = [(SXDataTableComponentView *)self tableView];
  [v4 bounds];
  double Width = CGRectGetWidth(v9);
  uint64_t v6 = [(SXDataTableComponentView *)self tableView];
  [v6 bounds];
  objc_msgSend(v3, "setUnscaledCanvasRect:", 0.0, 0.0, Width, CGRectGetHeight(v10));

  id v7 = [(SXDataTableComponentView *)self tangierController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__SXDataTableComponentView_updateTangierController__block_invoke;
  v8[3] = &unk_264652D18;
  v8[4] = self;
  [v7 updateInfosWithBlock:v8];
}

void __51__SXDataTableComponentView_updateTangierController__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = [*(id *)(a1 + 32) blueprint];
  uint64_t v4 = [v3 numberOfRows];

  v5 = [*(id *)(a1 + 32) tableView];
  uint64_t v6 = -[SXDataTableView blueprint]((uint64_t)v5);
  uint64_t v7 = [v6 numberOfColumns];

  id v8 = [*(id *)(a1 + 32) component];
  uint64_t v9 = [v8 dataOrientation];

  if (v9)
  {
    CGRect v10 = v15;
    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (v4)
        {
          for (uint64_t j = 0; j != v4; ++j)
          {
            objc_msgSend(*(id *)(a1 + 32), "addTextStorageForIndexPath:toCollectior:", j, i, v15);
            CGRect v10 = v15;
          }
        }
      }
    }
  }
  else
  {
    CGRect v10 = v15;
    if (v4)
    {
      for (uint64_t k = 0; k != v4; ++k)
      {
        if (v7)
        {
          for (uint64_t m = 0; m != v7; ++m)
          {
            objc_msgSend(*(id *)(a1 + 32), "addTextStorageForIndexPath:toCollectior:", k, m, v15);
            CGRect v10 = v15;
          }
        }
      }
    }
  }
}

- (void)addTextStorageForIndexPath:(id)a3 toCollectior:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v17 = a4;
  uint64_t v7 = [(SXDataTableComponentView *)self textViews];
  id v8 = objc_msgSend(v7, "objectForIndexPath:", var0, var1);

  uint64_t v9 = [(SXDataTableComponentView *)self dataTableComponentController];
  CGRect v10 = [v9 textLayouters];
  v11 = objc_msgSend(v10, "objectForIndexPath:", var0, var1);

  if (v8 && v11)
  {
    v12 = [v11 wpStorage];
    v13 = [v11 wpLayout];
    v14 = [(SXComponentView *)self component];
    id v15 = [v14 identifier];
    double v16 = [NSString stringWithFormat:@"{row: %lu, column: %lu}", var0, var1];
    [v17 addTextStorage:v12 withLayout:v13 forNamedFlow:v15 directLayerHostView:v8 selectable:1 componentIdentifier:v16];
  }
}

- (BOOL)userInteractable
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 view];
  [v6 locationInView:v7];
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(SXDataTableComponentView *)self tableView];
  uint64_t v13 = [(SXDataTableView *)(uint64_t)v12 indexPathForPoint:v11];
  uint64_t v15 = v14;

  if (v15 == -1 && v13 == -1) {
    return 0;
  }
  id v17 = [(SXDataTableComponentView *)self dataTableComponentController];
  char v18 = objc_msgSend(v17, "indexPathIsHeader:", v13, v15);

  return v18;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)setupShadowsIfNeeded
{
  v3 = [(SXDataTableComponentView *)self leftShadow];
  if (v3)
  {
  }
  else
  {
    uint64_t v4 = [(SXDataTableComponentView *)self rightShadow];

    if (!v4) {
      goto LABEL_5;
    }
  }
  v5 = [(SXDataTableComponentView *)self leftShadow];
  [v5 removeFromSuperlayer];

  id v6 = [(SXDataTableComponentView *)self rightShadow];
  [v6 removeFromSuperlayer];

LABEL_5:
  uint64_t v7 = [(SXDataTableComponentView *)self scrollView];
  [v7 contentSize];
  double v9 = v8;
  double v10 = [(SXDataTableComponentView *)self scrollView];
  [v10 bounds];
  double Width = CGRectGetWidth(v61);

  if (v9 > Width)
  {
    v12 = [MEMORY[0x263F157E8] layer];
    [(SXDataTableComponentView *)self setLeftShadow:v12];

    uint64_t v13 = [(SXDataTableComponentView *)self leftShadow];
    id v14 = [MEMORY[0x263F1C550] blackColor];
    objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

    uint64_t v15 = [(SXDataTableComponentView *)self leftShadow];
    double v16 = [(SXDataTableComponentView *)self scrollView];
    [v16 frame];
    CGFloat v17 = CGRectGetMinX(v62) + -4.0;
    char v18 = [(SXDataTableComponentView *)self scrollView];
    [v18 bounds];
    objc_msgSend(v15, "setFrame:", v17, 0.0, 0.0, CGRectGetHeight(v63));

    id v19 = [(SXDataTableComponentView *)self leftShadow];
    id v20 = (void *)MEMORY[0x263F1C478];
    v21 = [(SXDataTableComponentView *)self scrollView];
    [v21 bounds];
    objc_msgSend(v20, "bezierPathWithRect:", 1.0, -4.0, 1.0, CGRectGetHeight(v64) + 8.0);
    id v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShadowPath:", objc_msgSend(v22, "CGPath"));

    v23 = [(SXDataTableComponentView *)self leftShadow];
    id v24 = [MEMORY[0x263F1C550] blackColor];
    objc_msgSend(v23, "setShadowColor:", objc_msgSend(v24, "CGColor"));

    uint64_t v25 = [(SXDataTableComponentView *)self leftShadow];
    [v25 setShadowRadius:3.0];

    double v26 = [(SXDataTableComponentView *)self leftShadow];
    LODWORD(v27) = 1.0;
    [v26 setShadowOpacity:v27];

    uint64_t v28 = [(SXDataTableComponentView *)self leftShadow];
    objc_msgSend(v28, "setShadowOffset:", 0.0, 0.0);

    id v59 = [MEMORY[0x263F157E8] layer];
    id v29 = [MEMORY[0x263F1C550] whiteColor];
    objc_msgSend(v59, "setBackgroundColor:", objc_msgSend(v29, "CGColor"));

    uint64_t v30 = [(SXDataTableComponentView *)self scrollView];
    [v30 bounds];
    objc_msgSend(v59, "setFrame:", 4.0, -8.0, 16.0, CGRectGetHeight(v65) + 16.0);

    uint64_t v31 = [(SXDataTableComponentView *)self leftShadow];
    [v31 setMask:v59];

    double v32 = [MEMORY[0x263F157E8] layer];
    [(SXDataTableComponentView *)self setRightShadow:v32];

    double v33 = [(SXDataTableComponentView *)self rightShadow];
    id v34 = [MEMORY[0x263F1C550] blackColor];
    objc_msgSend(v33, "setBackgroundColor:", objc_msgSend(v34, "CGColor"));

    v35 = [(SXDataTableComponentView *)self rightShadow];
    v36 = [(SXDataTableComponentView *)self scrollView];
    [v36 bounds];
    CGFloat v37 = CGRectGetWidth(v66) + 4.0;
    double v38 = [(SXDataTableComponentView *)self scrollView];
    [v38 bounds];
    objc_msgSend(v35, "setFrame:", v37, 0.0, 0.0, CGRectGetHeight(v67));

    double v39 = [(SXDataTableComponentView *)self rightShadow];
    double v40 = (void *)MEMORY[0x263F1C478];
    v41 = [(SXDataTableComponentView *)self scrollView];
    [v41 bounds];
    objc_msgSend(v40, "bezierPathWithRect:", -1.0, -4.0, 1.0, CGRectGetHeight(v68) + 8.0);
    id v42 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setShadowPath:", objc_msgSend(v42, "CGPath"));

    v43 = [(SXDataTableComponentView *)self rightShadow];
    id v44 = [MEMORY[0x263F1C550] blackColor];
    objc_msgSend(v43, "setShadowColor:", objc_msgSend(v44, "CGColor"));

    v45 = [(SXDataTableComponentView *)self rightShadow];
    [v45 setShadowRadius:3.0];

    v46 = [(SXDataTableComponentView *)self rightShadow];
    LODWORD(v47) = 1.0;
    [v46 setShadowOpacity:v47];

    v48 = [(SXDataTableComponentView *)self rightShadow];
    objc_msgSend(v48, "setShadowOffset:", 0.0, 0.0);

    v49 = [MEMORY[0x263F157E8] layer];
    id v50 = [MEMORY[0x263F1C550] whiteColor];
    objc_msgSend(v49, "setBackgroundColor:", objc_msgSend(v50, "CGColor"));

    double v51 = [(SXDataTableComponentView *)self scrollView];
    [v51 bounds];
    objc_msgSend(v49, "setFrame:", -20.0, -8.0, 16.0, CGRectGetHeight(v69) + 16.0);

    objc_super v52 = [(SXDataTableComponentView *)self rightShadow];
    [v52 setMask:v49];

    [(SXDataTableComponentView *)self updateShadowOpacity];
    v53 = [(SXComponentView *)self contentView];
    v54 = [v53 layer];
    v55 = [(SXDataTableComponentView *)self leftShadow];
    [v54 addSublayer:v55];

    v56 = [(SXComponentView *)self contentView];
    v57 = [v56 layer];
    v58 = [(SXDataTableComponentView *)self rightShadow];
    [v57 addSublayer:v58];
  }
}

- (void)updateShadowOpacity
{
  v3 = [(SXDataTableComponentView *)self scrollView];
  [v3 contentOffset];
  double v5 = v4;
  double v6 = 0.0;
  if (v4 <= 0.0) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }

  double v8 = [(SXDataTableComponentView *)self scrollView];
  [v8 contentOffset];
  double v10 = v9;
  CGFloat v11 = [(SXDataTableComponentView *)self scrollView];
  [v11 bounds];
  double v12 = v10 + CGRectGetWidth(v29);
  uint64_t v13 = [(SXDataTableComponentView *)self scrollView];
  [v13 contentSize];
  double v15 = v14;
  if (v12 < v14) {
    double v6 = 1.0;
  }

  double v16 = [(SXDataTableComponentView *)self leftShadow];
  [v16 opacity];
  double v18 = v17;

  if (v7 != v18)
  {
    id v19 = [(SXDataTableComponentView *)self leftShadow];
    id v20 = v19;
    double v21 = 0.0;
    if (v5 > 0.0) {
      *(float *)&double v21 = 1.0;
    }
    [v19 setOpacity:v21];
  }
  id v22 = [(SXDataTableComponentView *)self rightShadow];
  [v22 opacity];
  double v24 = v23;

  if (v6 != v24)
  {
    uint64_t v25 = [(SXDataTableComponentView *)self rightShadow];
    id v27 = v25;
    double v26 = 0.0;
    if (v12 < v15) {
      *(float *)&double v26 = 1.0;
    }
    [v25 setOpacity:v26];
  }
}

- (id)contentViewForBehavior:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 windowed]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v5 = [(SXComponentView *)self fillView];
  }
  else
  {
    double v5 = self;
  }
  double v6 = v5;

  return v6;
}

- (id)descriptorForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  double v6 = [(SXComponentView *)self component];
  if ([v6 dataOrientation]) {
    unint64_t var1 = var0;
  }

  double v7 = [(SXComponentView *)self component];
  double v8 = [v7 data];
  double v9 = [v8 descriptors];
  double v10 = [v9 objectAtIndex:var1];

  return v10;
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXComponentActionHandler)componentActionHandler
{
  return self->_componentActionHandler;
}

- (SXTextComponentLayoutHosting)textComponentLayoutHosting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textComponentLayoutHosting);
  return (SXTextComponentLayoutHosting *)WeakRetained;
}

- (SXComponentController)componentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentController);
  return (SXComponentController *)WeakRetained;
}

- (SXAdIgnorableViewFactory)adIgnorableViewFactory
{
  return self->_adIgnorableViewFactory;
}

- (SXDataTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (SXDataTableComponentController)dataTableComponentController
{
  return self->_dataTableComponentController;
}

- (void)setDataTableComponentController:(id)a3
{
}

- (SXDataTableBlueprint)blueprint
{
  return self->_blueprint;
}

- (void)setBlueprint:(id)a3
{
}

- (SXDataTableDictionary)textViews
{
  return self->_textViews;
}

- (void)setTextViews:(id)a3
{
}

- (SXDataTableDictionary)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
}

- (SXScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (SXTangierController)tangierController
{
  return self->_tangierController;
}

- (void)setTangierController:(id)a3
{
}

- (CALayer)rightShadow
{
  return self->_rightShadow;
}

- (void)setRightShadow:(id)a3
{
}

- (CALayer)leftShadow
{
  return self->_leftShadow;
}

- (void)setLeftShadow:(id)a3
{
}

- (SXFeatures)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_leftShadow, 0);
  objc_storeStrong((id *)&self->_rightShadow, 0);
  objc_storeStrong((id *)&self->_tangierController, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_textViews, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_storeStrong((id *)&self->_dataTableComponentController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_adIgnorableViewFactory, 0);
  objc_destroyWeak((id *)&self->_componentController);
  objc_destroyWeak((id *)&self->_textComponentLayoutHosting);
  objc_storeStrong((id *)&self->_componentActionHandler, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end