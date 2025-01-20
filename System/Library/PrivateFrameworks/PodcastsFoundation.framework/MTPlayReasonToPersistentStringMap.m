@interface MTPlayReasonToPersistentStringMap
@end

@implementation MTPlayReasonToPersistentStringMap

void __MTPlayReasonToPersistentStringMap_inverted_block_invoke()
{
  v5[16] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F03D7F98;
  v4[1] = &unk_1F03D7FC8;
  v5[0] = @"none";
  v5[1] = @"restoration";
  v4[2] = &unk_1F03D7FE0;
  v4[3] = &unk_1F03D7FF8;
  v5[2] = @"handoff";
  v5[3] = @"user";
  v4[4] = &unk_1F03D8010;
  v4[5] = &unk_1F03D8028;
  v5[4] = @"car-play";
  v5[5] = @"magical-moments";
  v4[6] = &unk_1F03D8040;
  v4[7] = &unk_1F03D8058;
  v5[6] = @"store";
  v5[7] = @"media-remote";
  v4[8] = &unk_1F03D8070;
  v4[9] = &unk_1F03D8088;
  v5[8] = @"siri";
  v5[9] = @"quick-actions";
  v4[10] = &unk_1F03D80A0;
  v4[11] = &unk_1F03D80B8;
  v5[10] = @"top-shelf";
  v5[11] = @"shared-queue";
  v4[12] = &unk_1F03D80D0;
  v4[13] = &unk_1F03D80E8;
  v5[12] = @"rich-notifications";
  v5[13] = @"playthrough";
  v4[14] = &unk_1F03D8100;
  v4[15] = &unk_1F03D8118;
  v5[14] = @"widget";
  v5[15] = @"**Invalid(enum-count)**";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:16];
  v1 = (void *)MTPlayReasonToPersistentStringMap_inverted_map;
  MTPlayReasonToPersistentStringMap_inverted_map = v0;

  uint64_t v2 = objc_msgSend((id)MTPlayReasonToPersistentStringMap_inverted_map, "mt_invertedDictionary");
  v3 = (void *)MTPlayReasonToPersistentStringMap_inverted_invertedMap;
  MTPlayReasonToPersistentStringMap_inverted_invertedMap = v2;
}

@end