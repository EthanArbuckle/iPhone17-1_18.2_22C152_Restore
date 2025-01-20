@interface MTEpisodeContextSortTypeToPersistentStringMap
@end

@implementation MTEpisodeContextSortTypeToPersistentStringMap

void __MTEpisodeContextSortTypeToPersistentStringMap_inverted_block_invoke()
{
  v5[10] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F03D7FB0;
  v4[1] = &unk_1F03D8130;
  v5[0] = @"default";
  v5[1] = @"pub-date";
  v4[2] = &unk_1F03D8148;
  v4[3] = &unk_1F03D8160;
  v5[2] = @"pub-date-ascending";
  v5[3] = @"title";
  v4[4] = &unk_1F03D8178;
  v4[5] = &unk_1F03D8190;
  v5[4] = @"bookmarked-date";
  v5[5] = @"bookmarked-date-ascending";
  v4[6] = &unk_1F03D81A8;
  v4[7] = &unk_1F03D81C0;
  v5[6] = @"group-by-shows";
  v5[7] = @"downloaded-date-ascending";
  v4[8] = &unk_1F03D81D8;
  v4[9] = &unk_1F03D81F0;
  v5[8] = @"downloaded-date";
  v5[9] = @"**Invalid(enum-count)**";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:10];
  v1 = (void *)MTEpisodeContextSortTypeToPersistentStringMap_inverted_map;
  MTEpisodeContextSortTypeToPersistentStringMap_inverted_map = v0;

  uint64_t v2 = objc_msgSend((id)MTEpisodeContextSortTypeToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v3 = (void *)MTEpisodeContextSortTypeToPersistentStringMap_inverted_invertedMap;
  MTEpisodeContextSortTypeToPersistentStringMap_inverted_invertedMap = v2;
}

@end