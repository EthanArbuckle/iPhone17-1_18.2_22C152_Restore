@interface UIVisualEffect(NewsFeed)
+ (id)ne_visualEffectsForDailyBriefing;
@end

@implementation UIVisualEffect(NewsFeed)

+ (id)ne_visualEffectsForDailyBriefing
{
  v16[3] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v5[0] = 0x3FE0A3D70A3D70A4;
  memset(&v5[1], 0, 32);
  v5[5] = 0x3FE0A3D70A3D70A4;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = 0x3FE0A3D70A3D70A4;
  long long v13 = xmmword_1C15271F0;
  int64x2_t v14 = vdupq_n_s64(0x3FB1EB851EB851ECuLL);
  uint64_t v15 = 0;
  v0 = [MEMORY[0x1E4FB1620] colorEffectMatrix:v5];
  v1 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:40.0];
  v16[0] = v1;
  v2 = [MEMORY[0x1E4FB1620] colorEffectSaturate:2.0];
  v16[1] = v2;
  v16[2] = v0;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];

  return v3;
}

@end