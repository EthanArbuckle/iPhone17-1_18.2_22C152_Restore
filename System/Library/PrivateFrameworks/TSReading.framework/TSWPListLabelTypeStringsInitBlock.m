@interface TSWPListLabelTypeStringsInitBlock
@end

@implementation TSWPListLabelTypeStringsInitBlock

uint64_t s_TSWPListLabelTypeStringsInitBlock_block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v1[0] = &unk_26D73A1A0;
  v1[1] = &unk_26D73A1B8;
  v2[0] = &unk_26D7394B0;
  v2[1] = &unk_26D7394C8;
  v1[2] = &unk_26D73A1D0;
  v1[3] = &unk_26D73A1E8;
  v2[2] = &unk_26D7394E0;
  v2[3] = &unk_26D7394F8;
  return [NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:4];
}

@end