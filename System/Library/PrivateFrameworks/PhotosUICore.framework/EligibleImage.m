@interface EligibleImage
@end

@implementation EligibleImage

void ___EligibleImage_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] systemTealColor];
  uint64_t v0 = _ImageWithSymbolName(@"6.circle", v2);
  v1 = (void *)_EligibleImage__image;
  _EligibleImage__image = v0;
}

@end