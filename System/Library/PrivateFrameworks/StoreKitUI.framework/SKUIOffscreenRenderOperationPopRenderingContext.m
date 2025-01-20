@interface SKUIOffscreenRenderOperationPopRenderingContext
@end

@implementation SKUIOffscreenRenderOperationPopRenderingContext

unint64_t ___SKUIOffscreenRenderOperationPopRenderingContext_block_invoke(uint64_t a1)
{
  unint64_t result = [(id)sRendererStackArray count];
  if (result >= 2)
  {
    uint64_t v3 = [(id)sRendererStackArray objectAtIndex:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = [(id)sRendererStackArray objectAtIndex:1];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v9 = (void *)sRendererStackArray;
    return objc_msgSend(v9, "removeObjectsInRange:", 0, 2);
  }
  return result;
}

@end