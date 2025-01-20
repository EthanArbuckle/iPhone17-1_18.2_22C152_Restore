@interface NSFileManager
@end

@implementation NSFileManager

uint64_t __60__NSFileManager_VoiceServices__cleanDirectory_withLRULimit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x263EFF5E8];
  id v5 = a3;
  [a2 getResourceValue:&v10 forKey:v4 error:0];
  uint64_t v9 = 0;
  id v6 = v10;
  [v5 getResourceValue:&v9 forKey:v4 error:0];

  uint64_t v7 = [v6 compare:v9];
  return v7;
}

@end