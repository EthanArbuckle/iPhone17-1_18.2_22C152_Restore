@interface NSTextAttachmentLayoutContext
@end

@implementation NSTextAttachmentLayoutContext

uint64_t __91___NSTextAttachmentLayoutContext_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) objectForKey:a2];
  uint64_t result = [v3 textAttachmentViewProvider];
  if (result)
  {
    uint64_t result = [v3 textLayoutFragment];
    if (result)
    {
      v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
      return v5();
    }
  }
  return result;
}

@end