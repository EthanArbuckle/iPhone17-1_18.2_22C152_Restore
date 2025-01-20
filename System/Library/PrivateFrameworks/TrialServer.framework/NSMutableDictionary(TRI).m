@interface NSMutableDictionary(TRI)
- (uint64_t)triKeys:()TRI values:;
@end

@implementation NSMutableDictionary(TRI)

- (uint64_t)triKeys:()TRI values:
{
  return [MEMORY[0x1E4F1C9E8] triKeys:a3 values:a4 fromDictionary:a1];
}

@end