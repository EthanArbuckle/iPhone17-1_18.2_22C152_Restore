@interface TSWPCapitalizationStringsInitBlock
@end

@implementation TSWPCapitalizationStringsInitBlock

uint64_t s_TSWPCapitalizationStringsInitBlock_block_invoke_3()
{
  v2[4] = *MEMORY[0x263EF8340];
  v1[0] = &unk_26D73A1A0;
  v1[1] = &unk_26D73A1B8;
  v2[0] = &unk_26D739B10;
  v2[1] = &unk_26D739B28;
  v1[2] = &unk_26D73A1D0;
  v1[3] = &unk_26D73A1E8;
  v2[2] = &unk_26D739B40;
  v2[3] = &unk_26D739B58;
  return [NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:4];
}

@end