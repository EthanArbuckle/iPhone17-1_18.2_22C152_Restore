@interface LTUIVisualTranslationView
+ (CGRect)clipRect:(CGRect)a3 contentRect:(CGRect)a4;
+ (id)describeRect:(CGRect)a3;
+ (void)constrainToSuperview:(id)a3;
+ (void)isTranslatable:(id)a3 completion:(id)a4;
- (LTUIVisualTranslationView)initWithCoder:(id)a3;
- (LTUIVisualTranslationView)initWithFrame:(CGRect)a3;
- (UIView)_presentationAnchorView;
- (_TtC13TranslationUI27VisualTranslationViewBridge)translationView;
- (id)completion;
- (void)didMoveToSuperview;
- (void)dismiss;
- (void)drawRect:(CGRect)a3;
- (void)registerForDismissEvent:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setTranslationView:(id)a3;
- (void)setZoomScale:(double)a3;
- (void)set_presentationAnchorView:(id)a3;
- (void)translate:(id)a3;
- (void)translate:(id)a3 completion:(id)a4;
- (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6;
- (void)updatePresentationAnchorRectForContentRect:(CGRect)a3;
@end

@implementation LTUIVisualTranslationView

- (void)updatePresentationAnchorRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (CGRectIsEmpty(a3))
  {
    v8 = _LTOSLogVisualTranslation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[LTUIVisualTranslationView updatePresentationAnchorRectForContentRect:]();
    }
  }
  else
  {
    v9 = [(LTUIVisualTranslationView *)self _presentationAnchorView];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v18 = [(LTUIVisualTranslationView *)self _presentationAnchorView];
    double v57 = v13;
    double v58 = v11;
    double v55 = v17;
    double v56 = v15;
    objc_msgSend(v18, "convertRect:toView:", self, v11, v13, v15, v17);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    double v53 = v22;
    double v54 = v20;
    double v51 = v26;
    double v52 = v24;
    objc_msgSend((id)objc_opt_class(), "clipRect:contentRect:", v20, v22, v24, v26, x, y, width, height);
    double v49 = v28;
    double v50 = v27;
    double v47 = v30;
    double v48 = v29;
    objc_msgSend((id)objc_opt_class(), "swiftUIRectFrom:contentRect:", v27, v28, v29, v30, x, y, width, height);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    v39 = _LTOSLogVisualTranslation();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v41 = v39;
      v42 = objc_msgSend((id)objc_opt_class(), "describeRect:", v58, v57, v56, v55);
      v43 = objc_msgSend((id)objc_opt_class(), "describeRect:", v54, v53, v52, v51);
      v44 = objc_msgSend((id)objc_opt_class(), "describeRect:", v50, v49, v48, v47);
      v45 = objc_msgSend((id)objc_opt_class(), "describeRect:", v32, v34, v36, v38);
      v46 = objc_msgSend((id)objc_opt_class(), "describeRect:", x, y, width, height);
      *(_DWORD *)buf = 138544386;
      v60 = v42;
      __int16 v61 = 2114;
      v62 = v43;
      __int16 v63 = 2114;
      v64 = v44;
      __int16 v65 = 2114;
      v66 = v45;
      __int16 v67 = 2114;
      v68 = v46;
      _os_log_debug_impl(&dword_1DB0DC000, v41, OS_LOG_TYPE_DEBUG, "Anchor rect %{public}@ converted to %{public}@; clipped to %{public}@; Swift UI rect %{public}@ in content rect %{public}@",
        buf,
        0x34u);
    }
    v40 = [(LTUIVisualTranslationView *)self translationView];
    objc_msgSend(v40, "setPresentationAnchorWithRect:contentRect:", v32, v34, v36, v38, x, y, width, height);
  }
}

+ (CGRect)clipRect:(CGRect)a3 contentRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v33.origin.double x = v11;
  v33.origin.double y = v10;
  v33.size.double width = v9;
  v33.size.double height = v8;
  if (!CGRectContainsRect(a4, v33))
  {
    if (v11 < x) {
      double v12 = x;
    }
    else {
      double v12 = v11;
    }
    if (v12 > width) {
      double v11 = width;
    }
    else {
      double v11 = v12;
    }
    if (v10 < y) {
      double v13 = y;
    }
    else {
      double v13 = v10;
    }
    if (v13 > height) {
      double v10 = height;
    }
    else {
      double v10 = v13;
    }
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    double MaxX = CGRectGetMaxX(v27);
    v28.origin.double x = v11;
    v28.origin.double y = v10;
    v28.size.double width = v9;
    v28.size.double height = v8;
    double v14 = MaxX - CGRectGetMaxX(v28);
    double v15 = height;
    if (v14 >= 0.0) {
      double v14 = -0.0;
    }
    double v9 = v9 + v14;
    double v16 = x;
    double v17 = y;
    double v18 = width;
    double MaxY = CGRectGetMaxY(*(CGRect *)(&v15 - 3));
    v29.origin.double x = v11;
    v29.origin.double y = v10;
    v29.size.double width = v9;
    v29.size.double height = v8;
    double v20 = MaxY - CGRectGetMaxY(v29);
    if (v20 >= 0.0) {
      double v20 = -0.0;
    }
    double v8 = v8 + v20;
    if (v9 == 0.0)
    {
      v30.origin.double x = v11;
      v30.origin.double y = v10;
      v30.size.double width = v9;
      v30.size.double height = v8;
      if (CGRectGetMaxX(v30) == width)
      {
        double v9 = v9 + 1.0;
        double v11 = v11 + -1.0;
      }
    }
    if (v8 == 0.0)
    {
      v31.origin.double x = v11;
      v31.origin.double y = v10;
      v31.size.double width = v9;
      v31.size.double height = v8;
      if (CGRectGetMaxY(v31) == height)
      {
        double v10 = v10 + -1.0;
        double v8 = v8 + 1.0;
      }
    }
  }
  double v21 = v11;
  double v22 = v10;
  double v23 = v9;
  double v24 = v8;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

+ (id)describeRect:(CGRect)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"(x:%f y:%f; w:%f h:%f)",
               *(void *)&a3.origin.x,
               *(void *)&a3.origin.y,
               *(void *)&a3.size.width,
               *(void *)&a3.size.height);
}

- (LTUIVisualTranslationView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)LTUIVisualTranslationView;
  v3 = -[LTUIVisualTranslationView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(LTUIVisualTranslationView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = objc_opt_new();
    [(LTUIVisualTranslationView *)v4 setTranslationView:v5];

    objc_initWeak(&location, v4);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v13, &location);
    v6 = [(LTUIVisualTranslationView *)v4 translationView];
    [v6 setDismissHandler:&v12];

    [(LTUIVisualTranslationView *)v4 setCompletion:0];
    v7 = [(LTUIVisualTranslationView *)v4 translationView];
    double v8 = [v7 view];

    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v9 = [MEMORY[0x1E4FB1618] clearColor];
    [v8 setBackgroundColor:v9];

    [(LTUIVisualTranslationView *)v4 addSubview:v8];
    +[LTUIVisualTranslationView constrainToSuperview:v8];
    double v10 = v4;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __43__LTUIVisualTranslationView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismiss];
}

- (LTUIVisualTranslationView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LTUIVisualTranslationView;
  v3 = -[LTUIVisualTranslationView initWithFrame:](&v7, sel_initWithFrame_, a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

+ (void)isTranslatable:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = +[LTUIVisualTranslationService compactObservations:a3];
  objc_super v7 = _LTOSLogVisualTranslation();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[LTUIVisualTranslationView isTranslatable:completion:]();
  }
  +[VisualTranslationService isTranslatable:v6 completion:v5];
}

- (void)translate:(id)a3
{
  id v5 = +[LTUIVisualTranslationService compactObservations:a3];
  v4 = [(LTUIVisualTranslationView *)self translationView];
  [v4 translate:v5 sourceLocale:0 targetLocale:0 completion:0];
}

- (void)translate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = +[LTUIVisualTranslationService compactObservations:a3];
  objc_super v7 = [(LTUIVisualTranslationView *)self translationView];
  [v7 translate:v8 sourceLocale:0 targetLocale:0 completion:v6];
}

- (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = _LTOSLogVisualTranslation();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v15 = v14;
    int v18 = 134218498;
    uint64_t v19 = [v10 count];
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v12;
    _os_log_impl(&dword_1DB0DC000, v15, OS_LOG_TYPE_DEFAULT, "Requested translation of %lu observations from %{public}@ to %{public}@", (uint8_t *)&v18, 0x20u);
  }
  double v16 = +[LTUIVisualTranslationService compactObservations:v10];
  double v17 = [(LTUIVisualTranslationView *)self translationView];
  [v17 translate:v16 sourceLocale:v11 targetLocale:v12 completion:v13];
}

- (void)dismiss
{
  v3 = _LTOSLogVisualTranslation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl(&dword_1DB0DC000, v3, OS_LOG_TYPE_INFO, "Dismissing LTUIVisualTranslationView", v7, 2u);
  }
  [(LTUIVisualTranslationView *)self removeFromSuperview];
  v4 = [(LTUIVisualTranslationView *)self translationView];
  [v4 dismissErrorUI];

  id v5 = [(LTUIVisualTranslationView *)self completion];

  if (v5)
  {
    id v6 = [(LTUIVisualTranslationView *)self completion];
    v6[2](v6, 0);
  }
}

- (void)registerForDismissEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(LTUIVisualTranslationView *)self completion];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__LTUIVisualTranslationView_registerForDismissEvent___block_invoke;
  v8[3] = &unk_1E6BEAF78;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(LTUIVisualTranslationView *)self setCompletion:v8];
}

uint64_t __53__LTUIVisualTranslationView_registerForDismissEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setZoomScale:(double)a3
{
  id v4 = [(LTUIVisualTranslationView *)self translationView];
  [v4 setZoomScale:a3];
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = _LTOSLogVisualTranslation();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LTUIVisualTranslationView drawRect:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)LTUIVisualTranslationView;
  -[LTUIVisualTranslationView drawRect:](&v9, sel_drawRect_, x, y, width, height);
  -[LTUIVisualTranslationView updatePresentationAnchorRectForContentRect:](self, "updatePresentationAnchorRectForContentRect:", x, y, width, height);
}

- (void)didMoveToSuperview
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB0DC000, v0, v1, "LTUIVisualTranslationView didMoveToSuperview", v2, v3, v4, v5, v6);
}

+ (void)constrainToSuperview:(id)a3
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 superview];

    if (v5)
    {
      uint8_t v6 = [v4 superview];
      objc_super v15 = (void *)MEMORY[0x1E4F28DC8];
      __int16 v20 = [v4 topAnchor];
      uint64_t v19 = [v6 topAnchor];
      int v18 = [v20 constraintEqualToAnchor:v19];
      v21[0] = v18;
      double v17 = [v4 bottomAnchor];
      double v16 = [v6 bottomAnchor];
      id v7 = [v17 constraintEqualToAnchor:v16];
      v21[1] = v7;
      id v8 = [v4 leadingAnchor];
      objc_super v9 = [v6 leadingAnchor];
      id v10 = [v8 constraintEqualToAnchor:v9];
      v21[2] = v10;
      id v11 = [v4 trailingAnchor];
      id v12 = [v6 trailingAnchor];
      id v13 = [v11 constraintEqualToAnchor:v12];
      v21[3] = v13;
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
      [v15 activateConstraints:v14];
    }
  }
}

- (_TtC13TranslationUI27VisualTranslationViewBridge)translationView
{
  return self->_translationView;
}

- (void)setTranslationView:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (UIView)_presentationAnchorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__presentationAnchorView);
  return (UIView *)WeakRetained;
}

- (void)set_presentationAnchorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__presentationAnchorView);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_translationView, 0);
}

- (void)updatePresentationAnchorRectForContentRect:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB0DC000, v0, v1, "LTUIVisualTranslationView is aborting anchor update since the frame is empty", v2, v3, v4, v5, v6);
}

+ (void)isTranslatable:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB0DC000, v0, v1, "Calling +[LTUIVisualTranslationView isTranslatable:completion:]", v2, v3, v4, v5, v6);
}

- (void)drawRect:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB0DC000, v0, v1, "LTUIVisualTranslationView drawRect", v2, v3, v4, v5, v6);
}

@end