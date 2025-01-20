@interface PTAssetReaderCustomCompositor
- (BOOL)canConformColorOfSourceFrames;
- (BOOL)supportsHDRSourceFrames;
- (NSDictionary)requiredPixelBufferAttributesForRenderContext;
- (NSDictionary)sourcePixelBufferAttributes;
- (void)startVideoCompositionRequest:(id)a3;
@end

@implementation PTAssetReaderCustomCompositor

- (BOOL)canConformColorOfSourceFrames
{
  return 1;
}

- (BOOL)supportsHDRSourceFrames
{
  return 1;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F24D20];
  v5[0] = *MEMORY[0x1E4F24D70];
  v5[1] = v2;
  v6[0] = &unk_1F26C10D8;
  v6[1] = MEMORY[0x1E4F1CC08];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return (NSDictionary *)v3;
}

- (NSDictionary)requiredPixelBufferAttributesForRenderContext
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F24D20];
  v5[0] = *MEMORY[0x1E4F24D70];
  v5[1] = v2;
  v6[0] = &unk_1F26C10F0;
  v6[1] = MEMORY[0x1E4F1CC08];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return (NSDictionary *)v3;
}

- (void)startVideoCompositionRequest:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1D25E42A0]();
  v5 = [v3 videoCompositionInstruction];
  uint64_t v6 = objc_msgSend(v3, "sourceFrameByTrackID:", objc_msgSend(v5, "videTrackID"));
  uint64_t v7 = objc_msgSend(v3, "sourceFrameByTrackID:", objc_msgSend(v5, "auxvTrackID"));
  if (v6)
  {
    uint64_t v8 = v7;
    v9 = [PTAssetReaderComposedFrame alloc];
    if (v3) {
      [v3 compositionTime];
    }
    else {
      memset(v13, 0, sizeof(v13));
    }
    v11 = [(PTAssetReaderComposedFrame *)v9 initWithTime:v13 colorBuffer:v6 auxBuffer:v8];
    v12 = [v5 assetReader];
    [v12 pushComposedFrame:v11];

    [v3 finishWithComposedVideoFrame:v6];
  }
  else
  {
    v10 = AssetReaderError(@"Did not receive videoBuffer from async request");
    [v3 finishWithError:v10];
  }
}

@end