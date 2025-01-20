@interface NSMutableDictionary(PCCExtension)
- (void)_accumulateKey:()PCCExtension value:;
@end

@implementation NSMutableDictionary(PCCExtension)

- (void)_accumulateKey:()PCCExtension value:
{
  id v6 = a3;
  v7 = [a1 objectForKeyedSubscript:v6];
  v8 = NSNumber;
  id v11 = v7;
  if (v7) {
    uint64_t v9 = (int)[v7 intValue];
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = [v8 numberWithLong:v9 + a4];
  [a1 setObject:v10 forKeyedSubscript:v6];
}

@end