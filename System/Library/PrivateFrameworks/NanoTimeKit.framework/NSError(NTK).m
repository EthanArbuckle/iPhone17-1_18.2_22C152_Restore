@interface NSError(NTK)
+ (uint64_t)ntk_errorWithCode:()NTK;
@end

@implementation NSError(NTK)

+ (uint64_t)ntk_errorWithCode:()NTK
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit" code:a3 userInfo:0];
}

@end