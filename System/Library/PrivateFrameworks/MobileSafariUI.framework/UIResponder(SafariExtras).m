@interface UIResponder(SafariExtras)
- (id)safari_responderChainDescription;
@end

@implementation UIResponder(SafariExtras)

- (id)safari_responderChainDescription
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v3 = [a1 firstResponder];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = 1;
    do
    {
      uint64_t v6 = v5 + 1;
      [v2 appendFormat:@"%lu: %@\n", v5, v4];
      uint64_t v7 = [v4 nextResponder];

      v4 = (void *)v7;
      uint64_t v5 = v6;
    }
    while (v7);
  }
  return v2;
}

@end