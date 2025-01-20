@interface PBUIBundle
@end

@implementation PBUIBundle

void ___PBUIBundle_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 bundleForClass:v3];
  v2 = (void *)_PBUIBundle___paperBoardUIBundle;
  _PBUIBundle___paperBoardUIBundle = v1;
}

@end