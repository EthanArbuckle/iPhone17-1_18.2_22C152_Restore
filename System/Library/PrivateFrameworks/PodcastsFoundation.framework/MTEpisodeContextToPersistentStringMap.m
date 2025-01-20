@interface MTEpisodeContextToPersistentStringMap
@end

@implementation MTEpisodeContextToPersistentStringMap

void __MTEpisodeContextToPersistentStringMap_inverted_block_invoke()
{
  v5[12] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F03D7FB0;
  v4[1] = &unk_1F03D8130;
  v5[0] = @"default";
  v5[1] = @"store";
  v4[2] = &unk_1F03D8148;
  v4[3] = &unk_1F03D8160;
  v5[2] = @"library-episodes";
  v5[3] = @"downloaded-episodes";
  v4[4] = &unk_1F03D8178;
  v4[5] = &unk_1F03D8190;
  v5[4] = @"show-feed";
  v5[5] = @"show-user-episodes";
  v4[6] = &unk_1F03D81A8;
  v4[7] = &unk_1F03D81C0;
  v5[6] = @"listen-now";
  v5[7] = @"listen-now-latest-episodes";
  v4[8] = &unk_1F03D81D8;
  v4[9] = &unk_1F03D81F0;
  v5[8] = @"bookmarks";
  v5[9] = @"show-downloaded-episodes";
  v4[10] = &unk_1F03D8208;
  v4[11] = &unk_1F03D8220;
  v5[10] = @"recently-played";
  v5[11] = @"**Invalid(enum-count)**";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:12];
  v1 = (void *)MTEpisodeContextToPersistentStringMap_inverted_map;
  MTEpisodeContextToPersistentStringMap_inverted_map = v0;

  uint64_t v2 = objc_msgSend((id)MTEpisodeContextToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v3 = (void *)MTEpisodeContextToPersistentStringMap_inverted_invertedMap;
  MTEpisodeContextToPersistentStringMap_inverted_invertedMap = v2;
}

@end