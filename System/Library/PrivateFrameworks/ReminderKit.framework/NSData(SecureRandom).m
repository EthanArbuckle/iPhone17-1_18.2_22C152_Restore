@interface NSData(SecureRandom)
+ (id)rem_dataWithRandomBytesWithLength:()SecureRandom;
@end

@implementation NSData(SecureRandom)

+ (id)rem_dataWithRandomBytesWithLength:()SecureRandom
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a3];
  v5 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v6 = v4;
  uint64_t v7 = SecRandomCopyBytes(v5, a3, (void *)[v6 mutableBytes]);
  if (v7) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"NSData+Random: SecRandomCopyBytes error: %d", v7);
  }
  v8 = (void *)[v6 copy];

  return v8;
}

@end