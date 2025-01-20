@interface _UIProgressView
- (CGSize)intrinsicContentSize;
- (NSProgress)trackedProgress;
- (_UIProgressView)init;
- (_UIProgressView)initWithFrame:(CGRect)a3;
- (void)_updateProgressValue;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setTrackedProgress:(id)a3;
@end

@implementation _UIProgressView

- (_UIProgressView)init
{
  return -[_UIProgressView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 65.0, 65.0);
}

- (void)dealloc
{
  trackedProgress = self->_trackedProgress;
  if (trackedProgress) {
    [(NSProgress *)trackedProgress removeObserver:self forKeyPath:@"fractionCompleted"];
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIProgressView;
  [(UIView *)&v4 dealloc];
}

- (_UIProgressView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIProgressView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, 65.0, 65.0);
  if (v3)
  {
    objc_super v4 = [_UICircleProgressView alloc];
    [(UIView *)v3 frame];
    uint64_t v5 = -[_UICircleProgressView initWithFrame:](v4, "initWithFrame:");
    progressView = v3->_progressView;
    v3->_progressView = (_UICircleProgressView *)v5;

    [(_UICircleProgressView *)v3->_progressView setShowProgressTray:1];
    [(_UICircleProgressView *)v3->_progressView setProgressLineWidth:3.0];
    [(UIView *)v3 addSubview:v3->_progressView];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 65.0;
  double v3 = 65.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTrackedProgress:(id)a3
{
  objc_super v4 = (NSProgress *)a3;
  trackedProgress = self->_trackedProgress;
  if (trackedProgress)
  {
    [(NSProgress *)trackedProgress removeObserver:self forKeyPath:@"fractionCompleted"];
    v6 = self->_trackedProgress;
  }
  else
  {
    v6 = 0;
  }
  self->_trackedProgress = v4;
  v7 = v4;

  [(NSProgress *)self->_trackedProgress addObserver:self forKeyPath:@"fractionCompleted" options:1 context:0];
  [(_UIProgressView *)self _updateProgressValue];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66___UIProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_updateProgressValue
{
  [(NSProgress *)self->_trackedProgress fractionCompleted];
  progressView = self->_progressView;
  -[_UICircleProgressView setProgress:animated:completion:](progressView, "setProgress:animated:completion:", 1, 0);
}

- (NSProgress)trackedProgress
{
  return self->_trackedProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedProgress, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end