@interface WFCompactStopButton
- (NSProgress)progress;
- (WFCompactStopButton)initWithFrame:(CGRect)a3;
- (WFWorkflowProgressView)progressView;
- (void)dealloc;
- (void)handleTouchUpInside;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setHighlighted:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)transitionToCompleted:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation WFCompactStopButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (WFWorkflowProgressView)progressView
{
  return self->_progressView;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)transitionToCompleted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(WFCompactStopButton *)self progressView];
  [v6 transitionToState:v5 animated:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)progressContext == a6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__WFCompactStopButton_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2649CBF20;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFCompactStopButton;
    -[WFCompactStopButton observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __70__WFCompactStopButton_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) progress];
  [v5 fractionCompleted];
  double v3 = v2;
  BOOL v4 = [*(id *)(a1 + 32) progressView];
  [v4 setFractionCompleted:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFCompactStopButton;
  -[WFCompactStopButton setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__WFCompactStopButton_setHighlighted___block_invoke;
  v5[3] = &unk_2649CBA30;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x263F82E00] animateWithDuration:v5 animations:0.200000003];
}

void __38__WFCompactStopButton_setHighlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.466666669;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) progressView];
  [v2 setAlpha:v1];
}

- (void)handleTouchUpInside
{
  id v2 = [(WFCompactStopButton *)self progress];
  [v2 cancel];
}

- (void)setProgress:(id)a3
{
  BOOL v4 = (NSProgress *)a3;
  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"fractionCompleted" context:progressContext];
  progress = self->_progress;
  self->_progress = v4;
  BOOL v6 = v4;

  [(NSProgress *)v6 addObserver:self forKeyPath:@"fractionCompleted" options:0 context:progressContext];
}

- (void)dealloc
{
  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"fractionCompleted" context:progressContext];
  v3.receiver = self;
  v3.super_class = (Class)WFCompactStopButton;
  [(WFCompactStopButton *)&v3 dealloc];
}

- (WFCompactStopButton)initWithFrame:(CGRect)a3
{
  v26[4] = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)WFCompactStopButton;
  objc_super v3 = -[WFCompactStopButton initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F87B88]);
    [v4 setStopSize:12.0];
    [v4 setProgressStrokeWidth:3.0];
    [v4 setUserInteractionEnabled:0];
    id v5 = [MEMORY[0x263F825C8] labelColor];
    BOOL v6 = [v5 colorWithAlphaComponent:0.800000012];
    [v4 setTintColor:v6];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFCompactStopButton *)v3 addSubview:v4];
    [(WFCompactStopButton *)v3 sendSubviewToBack:v4];
    progressView = v3->_progressView;
    v3->_progressView = (WFWorkflowProgressView *)v4;
    id v8 = v4;

    v19 = (void *)MEMORY[0x263F08938];
    v24 = [v8 topAnchor];
    v23 = [(WFCompactStopButton *)v3 topAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    v21 = [v8 leadingAnchor];
    v20 = [(WFCompactStopButton *)v3 leadingAnchor];
    v9 = [v21 constraintEqualToAnchor:v20];
    v26[1] = v9;
    v10 = [v8 trailingAnchor];
    v11 = [(WFCompactStopButton *)v3 trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v26[2] = v12;
    v13 = [v8 bottomAnchor];
    v14 = [(WFCompactStopButton *)v3 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v26[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
    [v19 activateConstraints:v16];

    [(WFCompactStopButton *)v3 addTarget:v3 action:sel_handleTouchUpInside forControlEvents:64];
    v17 = v3;
  }

  return v3;
}

@end