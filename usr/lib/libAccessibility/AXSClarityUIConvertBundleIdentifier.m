@interface AXSClarityUIConvertBundleIdentifier
@end

@implementation AXSClarityUIConvertBundleIdentifier

void ___AXSClarityUIConvertBundleIdentifier_block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v0 = (void *)_AXSClarityUIConvertBundleIdentifier_ClarityToStandardBundleIdentifiers;
  _AXSClarityUIConvertBundleIdentifier_ClarityToStandardBundleIdentifiers = (uint64_t)&unk_1EDFC0560;

  v1 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [&unk_1EDFC0560 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(&unk_1EDFC0560);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v7 = [&unk_1EDFC0560 objectForKeyedSubscript:v6];
        [v1 setObject:v6 forKeyedSubscript:v7];
      }
      uint64_t v3 = [&unk_1EDFC0560 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  uint64_t v8 = [v1 copy];
  v9 = (void *)_AXSClarityUIConvertBundleIdentifier_StandardToClarityBundleIdentifiers;
  _AXSClarityUIConvertBundleIdentifier_StandardToClarityBundleIdentifiers = v8;
}

@end