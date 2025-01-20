@interface AMCopyApplicationDisplayIdentifiers
@end

@implementation AMCopyApplicationDisplayIdentifiers

void ___AMCopyApplicationDisplayIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 applicationType];
  if ([v3 isEqualToString:*MEMORY[0x263F01848]])
  {

    v4 = v8;
  }
  else
  {
    v5 = [v8 applicationType];
    int v6 = [v5 isEqualToString:*MEMORY[0x263F01838]];

    v4 = v8;
    if (!v6) {
      goto LABEL_7;
    }
  }
  v7 = [v4 bundleIdentifier];
  if (v7) {
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v7);
  }

  v4 = v8;
LABEL_7:
}

@end