@interface SoftLinkImageIO
@end

@implementation SoftLinkImageIO

uint64_t (*__SoftLinkImageIO_block_invoke())(void)
{
  v0 = (void *)SUUIImageIOFramework();
  if (!v0) {
    __SoftLinkImageIO_block_invoke_cold_1();
  }
  v1 = v0;
  weak_kCGImagePropertyEncoder = *(void *)SUUIWeakLinkedSymbolForString("kCGImagePropertyEncoder", v0);
  if (!weak_kCGImagePropertyEncoder) {
    __SoftLinkImageIO_block_invoke_cold_2();
  }
  weak_kCGImagePropertyASTCBlockSize = *(void *)SUUIWeakLinkedSymbolForString("kCGImagePropertyASTCBlockSize", v1);
  if (!weak_kCGImagePropertyASTCBlockSize) {
    __SoftLinkImageIO_block_invoke_cold_3();
  }
  weak_kCGImagePropertyASTCEncoder = *(void *)SUUIWeakLinkedSymbolForString("kCGImagePropertyASTCEncoder", v1);
  if (!weak_kCGImagePropertyASTCEncoder) {
    __SoftLinkImageIO_block_invoke_cold_4();
  }
  weak_CGImageDestinationCreateWithData = (uint64_t (*)(void, void, void, void))SUUIWeakLinkedSymbolForString("CGImageDestinationCreateWithData", v1);
  if (!weak_CGImageDestinationCreateWithData) {
    __SoftLinkImageIO_block_invoke_cold_5();
  }
  weak_CGImageDestinationAddImage = (uint64_t (*)(void, void, void))SUUIWeakLinkedSymbolForString("CGImageDestinationAddImage", v1);
  if (!weak_CGImageDestinationAddImage) {
    __SoftLinkImageIO_block_invoke_cold_6();
  }
  result = (uint64_t (*)(void))SUUIWeakLinkedSymbolForString("CGImageDestinationFinalize", v1);
  weak_CGImageDestinationFinalize = result;
  if (!result) {
    __SoftLinkImageIO_block_invoke_cold_7();
  }
  return result;
}

@end