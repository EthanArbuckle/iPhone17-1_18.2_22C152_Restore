@interface NSUserDefaults(MFDefaults)
- (unint64_t)mf_blockRemoteContent;
@end

@implementation NSUserDefaults(MFDefaults)

- (unint64_t)mf_blockRemoteContent
{
  return ((unint64_t)[a1 integerForKey:*MEMORY[0x1E4F60138]] >> 1) & 1;
}

@end