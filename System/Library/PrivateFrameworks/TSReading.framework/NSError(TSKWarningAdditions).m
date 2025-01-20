@interface NSError(TSKWarningAdditions)
+ (uint64_t)errorWithTSKWarning:()TSKWarningAdditions;
@end

@implementation NSError(TSKWarningAdditions)

+ (uint64_t)errorWithTSKWarning:()TSKWarningAdditions
{
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = [a3 kind];
  v6 = NSDictionary;
  uint64_t v7 = [a3 message];
  uint64_t v8 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x263F08320], 0);

  return [v4 errorWithDomain:@"com.apple.iWork.TSKWarningErrorDomain" code:v5 userInfo:v8];
}

@end