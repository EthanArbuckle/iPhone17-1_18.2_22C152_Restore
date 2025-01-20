@interface PUPlayheadTileViewController
- (id)loadView;
@end

@implementation PUPlayheadTileViewController

- (id)loadView
{
  v2 = [PUPlayheadView alloc];
  v3 = -[PUPlayheadView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v3;
}

@end