@interface SBFTouchPassThroughViewController
- (void)configureTouchPassThroughView:(id)a3;
- (void)loadView;
@end

@implementation SBFTouchPassThroughViewController

- (void)loadView
{
  v3 = [SBFTouchPassThroughView alloc];
  v4 = -[SBFTouchPassThroughView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBFTouchPassThroughViewController *)self configureTouchPassThroughView:v4];
  [(SBFTouchPassThroughViewController *)self setView:v4];
}

- (void)configureTouchPassThroughView:(id)a3
{
}

@end