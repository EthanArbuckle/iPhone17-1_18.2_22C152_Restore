@interface NSUserDefaults
@end

@implementation NSUserDefaults

uint64_t __59__NSUserDefaults_PBFUtilities__pbf_unprotectedUserDefaults__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PosterBoard.unprotectedUserDefaults"];
  v1 = (void *)pbf_unprotectedUserDefaults_unprotectedUserDefaults;
  pbf_unprotectedUserDefaults_unprotectedUserDefaults = v0;

  uint64_t v2 = *MEMORY[0x1E4F1D3F0];
  uint64_t v3 = *MEMORY[0x1E4F1D3E0];
  return MEMORY[0x1F40D8FC8](@"com.apple.PosterBoard.unprotectedUserDefaults", v2, v3, 0, 4);
}

@end