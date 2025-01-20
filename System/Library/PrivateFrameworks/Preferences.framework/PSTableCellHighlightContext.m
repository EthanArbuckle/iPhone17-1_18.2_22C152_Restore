@interface PSTableCellHighlightContext
+ (PSTableCellHighlightContext)contextWithCell:(id)a3;
- (BOOL)animateUnhighlight;
- (BOOL)valid;
- (UITableViewCell)cell;
- (int64_t)originalSelectionStyle;
- (void)_killTimer;
- (void)_timerFired;
- (void)dealloc;
- (void)invalidate;
- (void)performHighlightForDuration:(double)a3 animateUnhighlight:(BOOL)a4;
- (void)setCell:(id)a3;
- (void)setOriginalSelectionStyle:(int64_t)a3;
@end

@implementation PSTableCellHighlightContext

+ (PSTableCellHighlightContext)contextWithCell:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setCell:v4];

  return (PSTableCellHighlightContext *)v5;
}

- (void)dealloc
{
  [(PSTableCellHighlightContext *)self _killTimer];
  v3.receiver = self;
  v3.super_class = (Class)PSTableCellHighlightContext;
  [(PSTableCellHighlightContext *)&v3 dealloc];
}

- (void)performHighlightForDuration:(double)a3 animateUnhighlight:(BOOL)a4
{
  [(PSTableCellHighlightContext *)self _killTimer];
  self->_animateUnhighlight = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  self->_originalSelectionStyle = [WeakRetained selectionStyle];

  self->_valid = 1;
  id v8 = objc_loadWeakRetained((id *)&self->_cell);
  [v8 setSelectionStyle:3];

  id v9 = objc_loadWeakRetained((id *)&self->_cell);
  [v9 setHighlighted:1 animated:0];

  v10 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__timerFired selector:0 userInfo:0 repeats:a3];
  timer = self->_timer;
  self->_timer = v10;
  MEMORY[0x1F41817F8](v10, timer);
}

- (void)_timerFired
{
  if (self->_valid)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__PSTableCellHighlightContext__timerFired__block_invoke;
    v11[3] = &unk_1E5C5D680;
    v11[4] = self;
    objc_super v3 = (void (**)(void))MEMORY[0x1AD0BE2A0](v11, a2);
    BOOL animateUnhighlight = self->_animateUnhighlight;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    v6 = WeakRetained;
    if (animateUnhighlight)
    {
      [WeakRetained setHighlighted:0 animated:1];

      id v7 = objc_loadWeakRetained((id *)&self->_cell);
      [v7 selectionFadeDuration];
      double v9 = v8;

      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_after(v10, MEMORY[0x1E4F14428], v3);
    }
    else
    {
      [WeakRetained setHighlighted:0 animated:0];

      v3[2](v3);
    }
  }
  [(PSTableCellHighlightContext *)self _killTimer];
}

void __42__PSTableCellHighlightContext__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 17))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    uint64_t v4 = [WeakRetained selectionStyle];

    if (v4 == 3)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 32);
      id v7 = objc_loadWeakRetained((id *)(v5 + 24));
      [v7 setSelectionStyle:v6];
    }
  }
}

- (void)invalidate
{
  self->_valid = 0;
}

- (void)_killTimer
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (UITableViewCell)cell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  return (UITableViewCell *)WeakRetained;
}

- (void)setCell:(id)a3
{
}

- (BOOL)animateUnhighlight
{
  return self->_animateUnhighlight;
}

- (int64_t)originalSelectionStyle
{
  return self->_originalSelectionStyle;
}

- (void)setOriginalSelectionStyle:(int64_t)a3
{
  self->_originalSelectionStyle = a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cell);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end