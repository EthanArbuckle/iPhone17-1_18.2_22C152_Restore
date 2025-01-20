@interface NSBundle(PCXBundleAdditions)
- (uint64_t)pcxImageForResource:()PCXBundleAdditions;
- (uint64_t)pcxPathForImageResource:()PCXBundleAdditions;
@end

@implementation NSBundle(PCXBundleAdditions)

- (uint64_t)pcxImageForResource:()PCXBundleAdditions
{
  return [MEMORY[0x1E4F42A80] imageNamed:a3 inBundle:a1 compatibleWithTraitCollection:0];
}

- (uint64_t)pcxPathForImageResource:()PCXBundleAdditions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [&unk_1F11EC778 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(&unk_1F11EC778);
      }
      uint64_t result = [a1 pathForResource:a3 ofType:*(void *)(*((void *)&v9 + 1) + 8 * v8)];
      if (result) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t result = [&unk_1F11EC778 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v6 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

@end