@interface PXStoryTVWatchNextCellSpec
- (double)memorySubtitleLeading;
- (double)memorySubtitleTracking;
- (double)memoryTitleLeading;
- (double)memoryTitleTracking;
- (id)memorySubtitleFont;
- (id)memoryTitleFont;
@end

@implementation PXStoryTVWatchNextCellSpec

- (double)memorySubtitleTracking
{
  return 2.0;
}

- (double)memorySubtitleLeading
{
  return 0.0;
}

- (id)memorySubtitleFont
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4FB0950];
  v10[0] = *MEMORY[0x1E4FB0A10];
  v2 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24720]];
  v11[0] = v2;
  v10[1] = *MEMORY[0x1E4FB09F0];
  v3 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
  v10[2] = *MEMORY[0x1E4FB0998];
  uint64_t v4 = *MEMORY[0x1E4FB0928];
  v11[1] = v3;
  v11[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v13[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB08E8]) initWithFontAttributes:v6];
  v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:17.0];

  return v8;
}

- (double)memoryTitleTracking
{
  return 1.37;
}

- (double)memoryTitleLeading
{
  return 32.0;
}

- (id)memoryTitleFont
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4FB0950];
  v10[0] = *MEMORY[0x1E4FB0A10];
  v2 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24700]];
  v11[0] = v2;
  v10[1] = *MEMORY[0x1E4FB09F0];
  v3 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09B8]];
  v10[2] = *MEMORY[0x1E4FB0998];
  uint64_t v4 = *MEMORY[0x1E4FB0928];
  v11[1] = v3;
  v11[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v13[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB08E8]) initWithFontAttributes:v6];
  v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:34.0];

  return v8;
}

@end