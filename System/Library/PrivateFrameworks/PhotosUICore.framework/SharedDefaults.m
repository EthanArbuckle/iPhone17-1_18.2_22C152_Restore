@interface SharedDefaults
@end

@implementation SharedDefaults

void ___SharedDefaults_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = (void *)_SharedDefaults__sharedDefaults;
  _SharedDefaults__sharedDefaults = v0;
}

@end