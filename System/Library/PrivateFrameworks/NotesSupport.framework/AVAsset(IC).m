@interface AVAsset(IC)
- (CGImageSourceRef)newPreviewImageSource;
- (__CFData)previewImageDataWithUTType:()IC;
@end

@implementation AVAsset(IC)

- (__CFData)previewImageDataWithUTType:()IC
{
  v4 = a3;
  v5 = [a1 commonMetadata];
  v6 = [MEMORY[0x263EFA748] metadataItemsFromArray:v5 withKey:*MEMORY[0x263EF9D90] keySpace:*MEMORY[0x263EF9E78]];
  if (![v6 count])
  {
    uint64_t v7 = [MEMORY[0x263EFA748] metadataItemsFromArray:v5 withKey:*MEMORY[0x263EF9F70] keySpace:*MEMORY[0x263EF9E90]];

    v6 = (void *)v7;
  }
  if (![v6 count]
    || ([v6 objectAtIndexedSubscript:0],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 dataValue],
        v9 = (__CFData *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263EFA4B0]) initWithAsset:a1];
    [v10 setAppliesPreferredTrackTransform:1];
    CMTime v19 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    memset(timescale, 0, sizeof(timescale));
    uint64_t v18 = 0;
    [a1 duration];
    uint64_t v15 = 0;
    CMTime time1 = v19;
    v11 = (CGImage *)[v10 copyCGImageAtTime:&time1 actualTime:0 error:&v15];
    v12 = [MEMORY[0x263EFF990] data];
    v13 = CGImageDestinationCreateWithData(v12, v4, 1uLL, 0);
    CGImageDestinationAddImage(v13, v11, 0);
    v9 = 0;
    if (CGImageDestinationFinalize(v13)) {
      v9 = v12;
    }
    CFRelease(v13);
    CGImageRelease(v11);
  }
  return v9;
}

- (CGImageSourceRef)newPreviewImageSource
{
  v2 = [(id)*MEMORY[0x263F1DC08] identifier];
  CFDataRef v3 = [a1 previewImageDataWithUTType:v2];

  if (v3) {
    CGImageSourceRef v4 = CGImageSourceCreateWithData(v3, 0);
  }
  else {
    CGImageSourceRef v4 = 0;
  }

  return v4;
}

@end