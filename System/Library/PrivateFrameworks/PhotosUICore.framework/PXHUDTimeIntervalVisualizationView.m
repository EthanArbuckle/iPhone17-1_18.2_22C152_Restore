@interface PXHUDTimeIntervalVisualizationView
- (PXHUDTimeIntervalVisualizationView)initWithFrame:(CGRect)a3;
- (void)_cleanupTimer;
- (void)_setupTimer;
- (void)_updateTimer;
- (void)_updateTitleAndTimeLabel;
- (void)dealloc;
- (void)visualizationDidUpdate;
@end

@implementation PXHUDTimeIntervalVisualizationView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_titleAndTimeLabel, 0);
}

- (void)_updateTitleAndTimeLabel
{
  v3 = NSString;
  v4 = [(PXHUDAbstractVisualizationView *)self visualization];
  v5 = [v4 title];
  v6 = [(PXHUDAbstractVisualizationView *)self visualization];
  v7 = [v6 timeInterval];
  [v7 duration];
  v9 = [v3 stringWithFormat:@"%@: %.2f", v5, v8];
  [(UILabel *)self->_titleAndTimeLabel setText:v9];

  id v11 = [(PXHUDAbstractVisualizationView *)self visualization];
  v10 = [v11 color];
  [(UILabel *)self->_titleAndTimeLabel setTextColor:v10];
}

- (void)_cleanupTimer
{
  timer = self->_timer;
  if (timer)
  {
    [(NSTimer *)timer invalidate];
    v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void)_setupTimer
{
  if (!self->_timer)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E4F1CB00];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__PXHUDTimeIntervalVisualizationView__setupTimer__block_invoke;
    v6[3] = &unk_1E5DCD920;
    objc_copyWeak(&v7, &location);
    v4 = [v3 scheduledTimerWithTimeInterval:1 repeats:v6 block:0.1];
    timer = self->_timer;
    self->_timer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__PXHUDTimeIntervalVisualizationView__setupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerTick];
}

- (void)_updateTimer
{
  if (!self->_timer)
  {
LABEL_4:
    v6 = [(PXHUDAbstractVisualizationView *)self visualization];
    id v7 = [v6 timeInterval];
    uint64_t v8 = [v7 state];

    if (v8 == 1)
    {
      [(PXHUDTimeIntervalVisualizationView *)self _setupTimer];
    }
    return;
  }
  v3 = [(PXHUDAbstractVisualizationView *)self visualization];
  v4 = [v3 timeInterval];
  uint64_t v5 = [v4 state];

  if (v5 == 1)
  {
    if (self->_timer) {
      return;
    }
    goto LABEL_4;
  }
  [(PXHUDTimeIntervalVisualizationView *)self _cleanupTimer];
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXHUDTimeIntervalVisualizationView;
  [(PXHUDTimeIntervalVisualizationView *)&v4 dealloc];
}

- (void)visualizationDidUpdate
{
  [(PXHUDTimeIntervalVisualizationView *)self _updateTimer];
  [(PXHUDTimeIntervalVisualizationView *)self _updateTitleAndTimeLabel];
}

- (PXHUDTimeIntervalVisualizationView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXHUDTimeIntervalVisualizationView;
  v3 = -[PXHUDTimeIntervalVisualizationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleAndTimeLabel = v3->_titleAndTimeLabel;
    v3->_titleAndTimeLabel = v4;

    [(UILabel *)v3->_titleAndTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09D0]];
    [(UILabel *)v3->_titleAndTimeLabel setFont:v6];

    [(PXHUDTimeIntervalVisualizationView *)v3 addSubview:v3->_titleAndTimeLabel];
    PXHUDCenterViewInSuperview(v3->_titleAndTimeLabel);
  }
  return v3;
}

@end