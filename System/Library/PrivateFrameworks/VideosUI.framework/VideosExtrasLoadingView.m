@interface VideosExtrasLoadingView
- (VideosExtrasLoadingView)initWithDocument:(id)a3 options:(id)a4 delegate:(id)a5;
- (void)_show;
- (void)cancelCountdownToVisibility;
- (void)documentDidUpdate:(id)a3;
- (void)startCountdownToVisibilityWithInterval:(double)a3;
@end

@implementation VideosExtrasLoadingView

- (VideosExtrasLoadingView)initWithDocument:(id)a3 options:(id)a4 delegate:(id)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v28.receiver = self;
    v28.super_class = (Class)VideosExtrasLoadingView;
    v12 = -[VideosExtrasLoadingView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    p_isa = (id *)&v12->super.super.super.isa;
    if (v12)
    {
      [(VideosExtrasLoadingView *)v12 setOpaque:0];
      v14 = [MEMORY[0x1E4FB1618] clearColor];
      [p_isa setBackgroundColor:v14];

      [p_isa setAutoresizingMask:18];
      [p_isa setTranslatesAutoresizingMaskIntoConstraints:1];
      [p_isa setHidden:1];
      objc_storeWeak(p_isa + 54, v11);
      objc_storeStrong(p_isa + 51, a3);
      [p_isa[51] setDelegate:p_isa];
      uint64_t v15 = [v10 copy];
      id v16 = p_isa[52];
      p_isa[52] = (id)v15;

      v17 = [v9 templateElement];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        objc_storeStrong(p_isa + 51, a3);
        objc_storeStrong(p_isa + 52, a4);
        [v9 setDelegate:p_isa];
        v19 = [v9 templateElement];
        v20 = [v19 activityElement];
        if (v20)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = [[VideosExtrasActivityIndicator alloc] initWithElement:v20];
            id v22 = p_isa[53];
            p_isa[53] = v21;

            [p_isa[53] setTranslatesAutoresizingMaskIntoConstraints:0];
            [p_isa[53] setAlpha:0.0];
            [p_isa addSubview:p_isa[53]];
          }
        }
      }
      v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:p_isa[53] attribute:9 relatedBy:0 toItem:p_isa attribute:9 multiplier:1.0 constant:0.0];
      v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:p_isa[53] attribute:10 relatedBy:0 toItem:p_isa attribute:10 multiplier:1.0 constant:0.0];
      v29[0] = v23;
      v29[1] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      [p_isa addConstraints:v25];
    }
    self = p_isa;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)startCountdownToVisibilityWithInterval:(double)a3
{
}

- (void)cancelCountdownToVisibility
{
  v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__show object:0];
}

- (void)_show
{
  [(VideosExtrasLoadingView *)self setHidden:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__VideosExtrasLoadingView__show__block_invoke;
  v3[3] = &unk_1E6DF3D58;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.150000006];
}

void __32__VideosExtrasLoadingView__show__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.75];
  [v2 setBackgroundColor:v3];
}

- (void)documentDidUpdate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained loadingView:self documentDidUpdate:v5 options:self->_options];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end