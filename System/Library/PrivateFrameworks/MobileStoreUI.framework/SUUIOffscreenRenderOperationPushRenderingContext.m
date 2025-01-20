@interface SUUIOffscreenRenderOperationPushRenderingContext
@end

@implementation SUUIOffscreenRenderOperationPushRenderingContext

unint64_t ___SUUIOffscreenRenderOperationPushRenderingContext_block_invoke(uint64_t a1)
{
  v2 = (void *)sRendererStackArray;
  if (!sRendererStackArray)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    v4 = (void *)sRendererStackArray;
    sRendererStackArray = v3;

    v2 = (void *)sRendererStackArray;
  }
  unint64_t result = [v2 count];
  if (result <= 5)
  {
    [(id)sRendererStackArray addObject:*(void *)(a1 + 32)];
    v6 = (void *)sRendererStackArray;
    uint64_t v7 = *(void *)(a1 + 40);
    return [v6 addObject:v7];
  }
  return result;
}

@end