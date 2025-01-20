@interface NSURLRequest
@end

@implementation NSURLRequest

uint64_t __42__NSURLRequest_print__psso_DisplayRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingFormat:@"%@: %@\n", a2, a3];
  return MEMORY[0x270F9A758]();
}

@end