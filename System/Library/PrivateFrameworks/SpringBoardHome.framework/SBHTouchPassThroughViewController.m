@interface SBHTouchPassThroughViewController
- (void)loadView;
@end

@implementation SBHTouchPassThroughViewController

- (void)loadView
{
  v3 = [SBHTouchPassThroughView alloc];
  v4 = -[SBHTouchPassThroughView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBHTouchPassThroughView *)v4 setOpaque:0];
  [(SBHTouchPassThroughViewController *)self setView:v4];
}

@end