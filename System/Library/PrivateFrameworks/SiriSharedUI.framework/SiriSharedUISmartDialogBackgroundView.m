@interface SiriSharedUISmartDialogBackgroundView
- (void)setContinuousCornerRadius:(double)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation SiriSharedUISmartDialogBackgroundView

- (void)setContinuousCornerRadius:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  -[SiriSharedUISmartDialogBackgroundView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  v5 = [(SiriSharedUISmartDialogBackgroundView *)self contentView];
  [v5 _setContinuousCornerRadius:a3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = [(SiriSharedUISmartDialogBackgroundView *)self contentView];
  v7 = [v6 subviews];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) _setContinuousCornerRadius:a3];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setFrame:(CGRect)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)SiriSharedUISmartDialogBackgroundView;
  -[SiriSharedUISmartDialogBackgroundView setFrame:](&v15, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(SiriSharedUISmartDialogBackgroundView *)self contentView];
  v5 = [v4 subviews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        [(SiriSharedUISmartDialogBackgroundView *)self bounds];
        objc_msgSend(v10, "setFrame:");
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

@end