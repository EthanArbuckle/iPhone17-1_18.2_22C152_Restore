@interface AVAsset(IC_UI)
- (id)ic_previewImage;
@end

@implementation AVAsset(IC_UI)

- (id)ic_previewImage
{
  v2 = [a1 commonMetadata];
  v3 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v2 withKey:*MEMORY[0x1E4F15C98] keySpace:*MEMORY[0x1E4F15DE0]];
  if (![v3 count])
  {
    uint64_t v4 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v2 withKey:*MEMORY[0x1E4F15E50] keySpace:*MEMORY[0x1E4F15E00]];

    v3 = (void *)v4;
  }
  if (![v3 count])
  {
    v6 = 0;
    goto LABEL_8;
  }
  v5 = [v3 objectAtIndexedSubscript:0];
  v6 = [v5 dataValue];

  if (!v6
    || ([MEMORY[0x1E4FB1818] imageWithData:v6],
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_8:
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F16368]) initWithAsset:a1];
    [v8 setAppliesPreferredTrackTransform:1];
    CMTime v16 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    memset(timescale, 0, sizeof(timescale));
    uint64_t v15 = 0;
    [a1 duration];
    uint64_t v12 = 0;
    CMTime time1 = v16;
    uint64_t v9 = [v8 copyCGImageAtTime:&time1 actualTime:0 error:&v12];
    if (v9)
    {
      v10 = (const void *)v9;
      v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v9];
      CFRelease(v10);
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

@end