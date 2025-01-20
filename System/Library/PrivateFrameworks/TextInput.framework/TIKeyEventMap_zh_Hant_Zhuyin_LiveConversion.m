@interface TIKeyEventMap_zh_Hant_Zhuyin_LiveConversion
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)shouldInsertZhuyinCharacterAfter:(id)a3;
- (int64_t)candidateNumberKey:(int)a3;
@end

@implementation TIKeyEventMap_zh_Hant_Zhuyin_LiveConversion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__TIKeyEventMap_zh_Hant_Zhuyin_LiveConversion_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___onceToken_210 != -1) {
    dispatch_once(&sharedInstance___onceToken_210, block);
  }
  v2 = (void *)sharedInstance___keyEventMap_209;

  return v2;
}

- (int64_t)candidateNumberKey:(int)a3
{
  __int16 v3 = a3;
  if (candidateNumberKey____onceToken != -1) {
    dispatch_once(&candidateNumberKey____onceToken, &__block_literal_global_212);
  }
  __int16 v7 = v3;
  v4 = [NSString stringWithCharacters:&v7 length:1];
  int64_t v5 = [(id)candidateNumberKey____numberKeys indexOfObject:v4];

  return v5;
}

- (BOOL)shouldInsertZhuyinCharacterAfter:(id)a3
{
  return [a3 _containsBopomofoOnly];
}

@end