@interface NSFileHandle(FTABWrite)
- (uint64_t)writeBytes:()FTABWrite length:;
@end

@implementation NSFileHandle(FTABWrite)

- (uint64_t)writeBytes:()FTABWrite length:
{
  v2 = [MEMORY[0x263EFF8F8] dataWithBytes:length:];
  uint64_t v3 = [a1 uarpWriteData:v2 error:0];

  return v3;
}

@end