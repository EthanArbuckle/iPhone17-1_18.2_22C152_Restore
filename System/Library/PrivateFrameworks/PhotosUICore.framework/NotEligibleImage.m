@interface NotEligibleImage
@end

@implementation NotEligibleImage

void ___NotEligibleImage_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] redColor];
  uint64_t v0 = _ImageWithSymbolName(@"5.circle", v2);
  v1 = (void *)_NotEligibleImage__image;
  _NotEligibleImage__image = v0;
}

@end