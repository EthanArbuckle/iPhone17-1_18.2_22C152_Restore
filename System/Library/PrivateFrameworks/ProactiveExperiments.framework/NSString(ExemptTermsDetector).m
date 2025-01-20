@interface NSString(ExemptTermsDetector)
- (id)removeApostrophes;
- (id)removeCharactersWithCharacterSet:()ExemptTermsDetector;
- (id)tokens;
@end

@implementation NSString(ExemptTermsDetector)

- (id)tokens
{
  v2 = objc_opt_new();
  uint64_t v3 = [a1 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__NSString_ExemptTermsDetector__tokens__block_invoke;
  v6[3] = &unk_1E65B1A00;
  id v4 = v2;
  id v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 3, v6);

  return v4;
}

- (id)removeApostrophes
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = (void *)[a1 copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [&unk_1F24E86F8 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      v6 = v1;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(&unk_1F24E86F8);
        }
        v1 = [v6 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v8 + 1) + 8 * v5) withString:&stru_1F24E3FB8];

        ++v5;
        v6 = v1;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_1F24E86F8 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  return v1;
}

- (id)removeCharactersWithCharacterSet:()ExemptTermsDetector
{
  v1 = objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
  uint64_t v2 = [v1 componentsJoinedByString:&stru_1F24E3FB8];

  return v2;
}

@end