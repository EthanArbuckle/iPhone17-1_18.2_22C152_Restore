@interface PARSession
@end

@implementation PARSession

uint64_t __48__PARSession_FCAddition__fc_sharedParsecSession__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F5CBD8] sharedSession];
  v1 = (void *)qword_1EB5D1770;
  qword_1EB5D1770 = v0;

  v2 = (void *)qword_1EB5D1770;
  return [v2 start];
}

@end