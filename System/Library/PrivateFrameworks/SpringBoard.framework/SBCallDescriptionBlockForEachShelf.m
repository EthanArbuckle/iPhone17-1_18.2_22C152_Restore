@interface SBCallDescriptionBlockForEachShelf
@end

@implementation SBCallDescriptionBlockForEachShelf

void ___SBCallDescriptionBlockForEachShelf_block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v4 = *(void **)(a1 + 32);
  v5 = NSString;
  v6 = [v8 succinctDescription];
  v7 = [v5 stringWithFormat:@"%@ --> %@", v6, v3];
  [v4 addObject:v7];
}

@end