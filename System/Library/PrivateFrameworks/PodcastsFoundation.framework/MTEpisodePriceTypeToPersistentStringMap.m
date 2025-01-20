@interface MTEpisodePriceTypeToPersistentStringMap
@end

@implementation MTEpisodePriceTypeToPersistentStringMap

void __MTEpisodePriceTypeToPersistentStringMap_inverted_block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F03D7FB0;
  v4[1] = &unk_1F03D8160;
  v5[0] = @"NONE";
  v5[1] = @"PLUS";
  v4[2] = &unk_1F03D8178;
  v4[3] = &unk_1F03D8148;
  v5[2] = @"PRMO";
  v5[3] = @"PSUB";
  v4[4] = &unk_1F03D8130;
  v4[5] = &unk_1F03D8190;
  v5[4] = @"STDQ";
  v5[5] = @"**Invalid(enum-count)**";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:6];
  v1 = (void *)MTEpisodePriceTypeToPersistentStringMap_inverted_map;
  MTEpisodePriceTypeToPersistentStringMap_inverted_map = v0;

  uint64_t v2 = objc_msgSend((id)MTEpisodePriceTypeToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v3 = (void *)MTEpisodePriceTypeToPersistentStringMap_inverted_invertedMap;
  MTEpisodePriceTypeToPersistentStringMap_inverted_invertedMap = v2;
}

@end