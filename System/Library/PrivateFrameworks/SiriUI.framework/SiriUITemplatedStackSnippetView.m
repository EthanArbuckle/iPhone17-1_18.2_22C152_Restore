@interface SiriUITemplatedStackSnippetView
- (NSArray)stackedSubviews;
- (SiriUITemplatedStackSnippetView)initWithFrame:(CGRect)a3;
- (SiriUITemplatedStackSnippetViewDataSource)dataSource;
- (SiriUITemplatedStackSnippetViewDelegate)delegate;
- (UIEdgeInsets)templatedContentMargins;
- (UIView)auxiliaryView;
- (double)desiredHeight;
- (void)_handleTapGesture:(id)a3;
- (void)_triggerLayoutAnimated:(BOOL)a3 completion:(id)a4;
- (void)addTemplateSubview:(id)a3;
- (void)adjustAuxiliaryViewHeight:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setAuxiliaryView:(id)a3 atIndex:(unint64_t)a4 initialHeight:(double)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)templateSubviewWantsToBeRemovedFromHierarchy:(id)a3;
@end

@implementation SiriUITemplatedStackSnippetView

- (SiriUITemplatedStackSnippetView)initWithFrame:(CGRect)a3
{
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double Height = CGRectGetHeight(a3);
  if (Height >= 44.0) {
    double v8 = Height;
  }
  else {
    double v8 = 44.0;
  }
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.CGFloat width = width;
  v43.size.height = v8;
  double v9 = CGRectGetWidth(v43);
  if (v9 >= 100.0) {
    double v10 = v9;
  }
  else {
    double v10 = 100.0;
  }
  v42.receiver = self;
  v42.super_class = (Class)SiriUITemplatedStackSnippetView;
  v11 = -[SiriUITemplatedStackSnippetView initWithFrame:](&v42, sel_initWithFrame_, x, y, v10, v8);
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263F1CB60]);
    double v13 = *MEMORY[0x263F001A8];
    double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x263F001A8], v14, v15, v16);
    sashOverlayView = v11->_sashOverlayView;
    v11->_sashOverlayView = (UIView *)v17;

    v19 = v11->_sashOverlayView;
    v20 = [MEMORY[0x263F1C550] whiteColor];
    [(UIView *)v19 setBackgroundColor:v20];

    [(UIView *)v11->_sashOverlayView setAlpha:0.4];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v13, v14, v15, v16);
    sashImageView = v11->_sashImageView;
    v11->_sashImageView = (UIImageView *)v21;

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v13, v14, v15, v16);
    sashTitleLabel = v11->_sashTitleLabel;
    v11->_sashTitleLabel = (UILabel *)v23;

    v25 = v11->_sashTitleLabel;
    v26 = objc_msgSend(MEMORY[0x263F1C550], "siriui_platterTextColor");
    [(UILabel *)v25 setTextColor:v26];

    v27 = v11->_sashTitleLabel;
    v28 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
    [(UILabel *)v27 setFont:v28];

    uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v13, v14, v15, v16);
    navigationTitleLabel = v11->_navigationTitleLabel;
    v11->_navigationTitleLabel = (UILabel *)v29;

    v31 = v11->_navigationTitleLabel;
    v32 = objc_msgSend(MEMORY[0x263F1C550], "siriui_platterTextColor");
    [(UILabel *)v31 setTextColor:v32];

    v33 = v11->_navigationTitleLabel;
    v34 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
    [(UILabel *)v33 setFont:v34];

    v35 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    templateSubviews = v11->_templateSubviews;
    v11->_templateSubviews = v35;

    v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    stackedSubviews = v11->_stackedSubviews;
    v11->_stackedSubviews = v37;

    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    keylines = v11->_keylines;
    v11->_keylines = v39;

    v11->_auxiliaryViewdouble Height = 0.0;
    [(SiriUITemplatedStackSnippetView *)v11 addSubview:v11->_sashOverlayView];
    [(SiriUITemplatedStackSnippetView *)v11 addSubview:v11->_sashImageView];
    [(SiriUITemplatedStackSnippetView *)v11 addSubview:v11->_sashTitleLabel];
    [(SiriUITemplatedStackSnippetView *)v11 addSubview:v11->_navigationTitleLabel];
  }
  return v11;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)SiriUITemplatedStackSnippetView;
  [(SiriUITemplatedStackSnippetView *)&v34 layoutSubviews];
  [(SiriUITemplatedStackSnippetView *)self bounds];
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  double width = v35.size.width;
  double height = v35.size.height;
  CGFloat v8 = CGRectGetWidth(v35);
  uint64_t v30 = 0;
  v31 = (double *)&v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  double v9 = [(UILabel *)self->_navigationTitleLabel text];

  if (v9)
  {
    v31[3] = 24.0;
    -[UILabel sizeThatFits:](self->_navigationTitleLabel, "sizeThatFits:", width, height);
    UIRectCenteredXInRect();
    -[UILabel setFrame:](self->_navigationTitleLabel, "setFrame:");
    [(UILabel *)self->_navigationTitleLabel _setLastLineBaselineFrameOriginY:v31[3]];
    v31[3] = v31[3] + 12.0;
    [(UILabel *)self->_sashTitleLabel setHidden:1];
    [(UIImageView *)self->_sashImageView setHidden:1];
    [(UILabel *)self->_navigationTitleLabel setHidden:0];
  }
  else
  {
    v31[3] = 8.0;
    -[UIImageView setFrame:](self->_sashImageView, "setFrame:", 8.0, 8.0, 20.0, 20.0);
    v31[3] = 23.0;
    [(UILabel *)self->_sashTitleLabel sizeToFit];
    [(UILabel *)self->_sashTitleLabel frame];
    double v11 = v10;
    double v13 = v12;
    v36.origin.CGFloat x = 8.0;
    v36.origin.CGFloat y = 8.0;
    v36.size.double width = 20.0;
    v36.size.double height = 20.0;
    -[UILabel setFrame:](self->_sashTitleLabel, "setFrame:", CGRectGetMaxX(v36) + 8.0, 0.0, v11, v13);
    [(UILabel *)self->_sashTitleLabel _setLastLineBaselineFrameOriginY:v31[3]];
    v31[3] = v31[3] + 13.0;
    [(UILabel *)self->_sashTitleLabel setHidden:0];
    [(UIImageView *)self->_sashImageView setHidden:0];
    [(UILabel *)self->_navigationTitleLabel setHidden:1];
  }
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.double width = width;
  v37.size.double height = height;
  -[UIView setFrame:](self->_sashOverlayView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v37), v31[3]);
  uint64_t v22 = 0;
  uint64_t v23 = (double *)&v22;
  uint64_t v24 = 0x4010000000;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  v25 = &unk_223245EAF;
  CGFloat v28 = v8;
  uint64_t v29 = 0x3FF0000000000000;
  if ([(NSMutableArray *)self->_keylines count])
  {
    double v14 = [(NSMutableArray *)self->_keylines firstObject];
    objc_msgSend(v14, "sizeThatFits:", v23[6], v23[7]);
    uint64_t v16 = v15;

    *((void *)v23 + 7) = v16;
  }
  objc_initWeak(&location, self);
  stackedSubviews = self->_stackedSubviews;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __49__SiriUITemplatedStackSnippetView_layoutSubviews__block_invoke;
  v19[3] = &unk_26469FB20;
  objc_copyWeak(v20, &location);
  v19[4] = self;
  v19[5] = &v30;
  v20[2] = *(id *)&v8;
  v20[1] = (id)a2;
  v19[6] = &v22;
  [(NSMutableArray *)stackedSubviews enumerateObjectsUsingBlock:v19];
  touchInterceptView = self->_touchInterceptView;
  [(UIView *)self->_auxiliaryView frame];
  -[UIView setFrame:](touchInterceptView, "setFrame:");
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v30, 8);
}

void __49__SiriUITemplatedStackSnippetView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([v14 conformsToProtocol:&unk_26D66F590])
    {
      [v14 desiredHeight];
      double v9 = v8;
      double v10 = v14;
    }
    else
    {
      double v10 = v14;
      if (*((id *)WeakRetained + 63) == v14)
      {
        double v9 = *((double *)WeakRetained + 59);
      }
      else
      {
        double v11 = [MEMORY[0x263F08690] currentHandler];
        [v11 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"SiriUITemplatedStackSnippetView.m", 162, @"Subview %@ must be a template view or be the auxiliary view.", v14 object file lineNumber description];

        double v10 = v14;
        double v9 = 0.0;
      }
    }
    objc_msgSend(v10, "setFrame:", 0.0, *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(double *)(a1 + 72), v9);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    double v12 = [*((id *)WeakRetained + 58) objectAtIndex:a3];
    objc_msgSend(v12, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));

    if ([*((id *)WeakRetained + 57) count] - 1 == a3)
    {
      double v13 = [*((id *)WeakRetained + 58) objectAtIndex:a3];
      [v13 removeFromSuperview];
    }
  }
  else
  {
    *a4 = 1;
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(SiriUITemplatedStackSnippetView *)self reloadData];
    v5 = obj;
  }
}

- (void)setAuxiliaryView:(id)a3 atIndex:(unint64_t)a4 initialHeight:(double)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  double v13 = (UIView *)a3;
  id v14 = a7;
  p_auxiliaryView = &self->_auxiliaryView;
  if (self->_auxiliaryView != v13)
  {
    p_stackedSubviews = &self->_stackedSubviews;
    -[NSMutableArray removeObject:](self->_stackedSubviews, "removeObject:");
    [(UIView *)*p_auxiliaryView removeFromSuperview];
    self->_auxiliaryViewdouble Height = a5;
    objc_storeStrong((id *)&self->_auxiliaryView, a3);
    if (*p_auxiliaryView)
    {
      if ([(NSMutableArray *)*p_stackedSubviews count] < a4)
      {
        uint64_t v17 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
          -[SiriUITemplatedStackSnippetView setAuxiliaryView:atIndex:initialHeight:animated:completion:]((id *)&self->_stackedSubviews, v17, a4);
        }
        a4 = [(NSMutableArray *)*p_stackedSubviews count];
      }
      [(NSMutableArray *)*p_stackedSubviews insertObject:*p_auxiliaryView atIndex:a4];
      double v18 = *MEMORY[0x263F001A8];
      double v19 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v20 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v21 = *(double *)(MEMORY[0x263F001A8] + 24);
      -[UIView setFrame:](*p_auxiliaryView, "setFrame:", *MEMORY[0x263F001A8], v19, v20, v21);
      [(SiriUITemplatedStackSnippetView *)self addSubview:*p_auxiliaryView];
      uint64_t v22 = +[SiriUIKeyline keylineWithKeylineType:2 platterStyling:1];
      [(NSMutableArray *)self->_keylines addObject:v22];
      [(SiriUITemplatedStackSnippetView *)self addSubview:v22];
      if (!self->_touchInterceptView)
      {
        uint64_t v23 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v18, v19, v20, v21);
        [(UIView *)v23 setUserInteractionEnabled:1];
        uint64_t v24 = [MEMORY[0x263F1C550] clearColor];
        [(UIView *)v23 setBackgroundColor:v24];

        v25 = [(UIView *)v23 layer];
        [v25 setAllowsHitTesting:1];

        uint64_t v26 = [(UIView *)v23 layer];
        [v26 setHitTestsAsOpaque:1];

        [(SiriUITemplatedStackSnippetView *)self addSubview:v23];
        touchInterceptView = self->_touchInterceptView;
        self->_touchInterceptView = v23;
      }
    }
    else
    {
      CGFloat v28 = self->_touchInterceptView;
      if (v28)
      {
        [(UIView *)v28 removeFromSuperview];
        uint64_t v29 = self->_touchInterceptView;
        self->_touchInterceptView = 0;
      }
    }
    [(SiriUITemplatedStackSnippetView *)self _triggerLayoutAnimated:v8 completion:v14];
  }
}

- (void)adjustAuxiliaryViewHeight:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v8 = (void (**)(id, uint64_t))a5;
  if (self->_auxiliaryViewHeight == a3)
  {
    if (v8) {
      v8[2](v8, 1);
    }
  }
  else
  {
    self->_auxiliaryViewdouble Height = a3;
    -[SiriUITemplatedStackSnippetView _triggerLayoutAnimated:completion:](self, "_triggerLayoutAnimated:completion:", v5);
  }
  MEMORY[0x270F9A828]();
}

- (double)desiredHeight
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_templateSubviews;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "desiredHeight", (void)v11);
        double v7 = v7 + v9;
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7 + self->_auxiliaryViewHeight + 36.0;
}

- (void)reloadData
{
  sashImageView = self->_sashImageView;
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v6 = [WeakRetained sashImageForTemplatedStackSnippetView:self];
  [(UIImageView *)sashImageView setImage:v6];

  sashTitleLabel = self->_sashTitleLabel;
  id v8 = objc_loadWeakRetained((id *)p_dataSource);
  double v9 = [v8 sashTitleForTemplatedStackSnippetView:self];
  double v10 = [v9 uppercaseString];
  [(UILabel *)sashTitleLabel setText:v10];

  navigationTitleLabel = self->_navigationTitleLabel;
  id v12 = objc_loadWeakRetained((id *)p_dataSource);
  long long v13 = [v12 navigationTitleForTemplatedStackSnippetView:self];
  [(UILabel *)navigationTitleLabel setText:v13];

  id v14 = objc_loadWeakRetained((id *)p_dataSource);
  int v15 = [v14 hasDefaultTapActionForTemplatedStackSnippetView:self];

  tapRecognizer = self->_tapRecognizer;
  if (!v15 || tapRecognizer)
  {
    if (tapRecognizer) {
      char v19 = v15;
    }
    else {
      char v19 = 1;
    }
    if ((v19 & 1) == 0)
    {
      -[SiriUITemplatedStackSnippetView removeGestureRecognizer:](self, "removeGestureRecognizer:");
      double v20 = self->_tapRecognizer;
      self->_tapRecognizer = 0;
    }
  }
  else
  {
    uint64_t v17 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__handleTapGesture_];
    double v18 = self->_tapRecognizer;
    self->_tapRecognizer = v17;

    [(SiriUITemplatedStackSnippetView *)self addGestureRecognizer:self->_tapRecognizer];
  }
  [(SiriUITemplatedStackSnippetView *)self setNeedsLayout];
}

- (void)_triggerLayoutAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__SiriUITemplatedStackSnippetView__triggerLayoutAnimated_completion___block_invoke;
    v7[3] = &unk_26469EFA8;
    v7[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v7 usingSpringWithDamping:v6 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.5];
  }
  else
  {
    [(SiriUITemplatedStackSnippetView *)self setNeedsLayout];
    [(SiriUITemplatedStackSnippetView *)self layoutIfNeeded];
    if (v6) {
      v6[2](v6, 1);
    }
  }
}

uint64_t __69__SiriUITemplatedStackSnippetView__triggerLayoutAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)addTemplateSubview:(id)a3
{
  if (a3)
  {
    templateSubviews = self->_templateSubviews;
    id v5 = a3;
    [(NSMutableSet *)templateSubviews addObject:v5];
    [(NSMutableArray *)self->_stackedSubviews addObject:v5];
    [(SiriUITemplatedStackSnippetView *)self addSubview:v5];
    [v5 setTemplatedSuperview:self];

    id v6 = +[SiriUIKeyline keylineWithKeylineType:2 platterStyling:1];
    [(NSMutableArray *)self->_keylines addObject:v6];
    [(SiriUITemplatedStackSnippetView *)self addSubview:v6];
    [(SiriUITemplatedStackSnippetView *)self setNeedsLayout];
  }
}

- (void)templateSubviewWantsToBeRemovedFromHierarchy:(id)a3
{
  stackedSubviews = self->_stackedSubviews;
  id v5 = a3;
  uint64_t v6 = [(NSMutableArray *)stackedSubviews indexOfObject:v5];
  [(NSMutableSet *)self->_templateSubviews removeObject:v5];
  [(NSMutableArray *)self->_stackedSubviews removeObject:v5];
  [v5 removeFromSuperview];
  [v5 setTemplatedSuperview:0];

  id v7 = [(NSMutableArray *)self->_keylines objectAtIndex:v6];
  [(NSMutableArray *)self->_keylines removeObject:v7];
  [v7 removeFromSuperview];
  [(SiriUITemplatedStackSnippetView *)self setNeedsLayout];
}

- (UIEdgeInsets)templatedContentMargins
{
  double v2 = 0.0;
  double v3 = 16.0;
  double v4 = 0.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_handleTapGesture:(id)a3
{
  id v4 = [(SiriUITemplatedStackSnippetView *)self delegate];
  [v4 viewWantsDefaultTapAction:self];
}

- (NSArray)stackedSubviews
{
  return &self->_stackedSubviews->super;
}

- (SiriUITemplatedStackSnippetViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SiriUITemplatedStackSnippetViewDataSource *)WeakRetained;
}

- (SiriUITemplatedStackSnippetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUITemplatedStackSnippetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)auxiliaryView
{
  return self->_auxiliaryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_keylines, 0);
  objc_storeStrong((id *)&self->_stackedSubviews, 0);
  objc_storeStrong((id *)&self->_templateSubviews, 0);
  objc_storeStrong((id *)&self->_touchInterceptView, 0);
  objc_storeStrong((id *)&self->_navigationTitleLabel, 0);
  objc_storeStrong((id *)&self->_sashTitleLabel, 0);
  objc_storeStrong((id *)&self->_sashImageView, 0);
  objc_storeStrong((id *)&self->_sashOverlayView, 0);
}

- (void)setAuxiliaryView:(uint64_t)a3 atIndex:initialHeight:animated:completion:.cold.1(id *a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = *a1;
  uint64_t v6 = a2;
  uint64_t v7 = [v5 count];
  uint64_t v8 = [*a1 count];
  int v9 = 136315906;
  double v10 = "-[SiriUITemplatedStackSnippetView setAuxiliaryView:atIndex:initialHeight:animated:completion:]";
  __int16 v11 = 2048;
  uint64_t v12 = a3;
  __int16 v13 = 2048;
  uint64_t v14 = v7;
  __int16 v15 = 2048;
  uint64_t v16 = v8;
  _os_log_error_impl(&dword_2231EF000, v6, OS_LOG_TYPE_ERROR, "%s Requested index %lu is out bounds of our %lu subviews, changing index to %lu", (uint8_t *)&v9, 0x2Au);
}

@end