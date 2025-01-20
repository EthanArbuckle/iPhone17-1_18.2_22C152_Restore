@interface WFLinkMusicRecognitionRecognizeMusicAction
- (id)sessionKitToastDurationsPerRunSourceDefinition;
@end

@implementation WFLinkMusicRecognitionRecognizeMusicAction

- (id)sessionKitToastDurationsPerRunSourceDefinition
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB4F68];
  v5[0] = *MEMORY[0x1E4FB4F08];
  v5[1] = v2;
  v6[0] = &unk_1F2316728;
  v6[1] = &unk_1F2316728;
  v5[2] = *MEMORY[0x1E4FB4F60];
  v6[2] = &unk_1F2316740;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  return v3;
}

@end