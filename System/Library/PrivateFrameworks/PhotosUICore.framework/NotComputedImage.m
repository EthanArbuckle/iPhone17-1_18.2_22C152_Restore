@interface NotComputedImage
@end

@implementation NotComputedImage

void ___NotComputedImage_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] grayColor];
  uint64_t v0 = _ImageWithSymbolName(@"3.circle", v2);
  v1 = (void *)_NotComputedImage__image;
  _NotComputedImage__image = v0;
}

@end