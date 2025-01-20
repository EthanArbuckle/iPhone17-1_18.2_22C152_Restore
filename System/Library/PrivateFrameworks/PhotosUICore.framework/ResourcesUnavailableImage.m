@interface ResourcesUnavailableImage
@end

@implementation ResourcesUnavailableImage

void ___ResourcesUnavailableImage_block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] grayColor];
  uint64_t v0 = _ImageWithSymbolName(@"0.circle", v2);
  v1 = (void *)_ResourcesUnavailableImage__image;
  _ResourcesUnavailableImage__image = v0;
}

@end