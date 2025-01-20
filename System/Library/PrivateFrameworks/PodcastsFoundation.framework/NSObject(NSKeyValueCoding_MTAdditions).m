@interface NSObject(NSKeyValueCoding_MTAdditions)
- (id)mt_dictionaryWithValuesForKeyPaths:()NSKeyValueCoding_MTAdditions;
@end

@implementation NSObject(NSKeyValueCoding_MTAdditions)

- (id)mt_dictionaryWithValuesForKeyPaths:()NSKeyValueCoding_MTAdditions
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__NSObject_NSKeyValueCoding_MTAdditions__mt_dictionaryWithValuesForKeyPaths___block_invoke;
  v7[3] = &unk_1E5E61668;
  v7[4] = a1;
  id v3 = a3;
  v4 = objc_msgSend(v3, "mt_compactMap:", v7);
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3];

  return v5;
}

@end