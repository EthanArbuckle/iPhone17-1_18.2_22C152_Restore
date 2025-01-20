@interface SSUserDefaults
@end

@implementation SSUserDefaults

uint64_t ___SSUserDefaults_block_invoke()
{
  _SSUserDefaults_result = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ScreenshotServices"];
  return MEMORY[0x270F9A758]();
}

@end