@interface PXStoryConcreteAutoEditClip
+ (id)composedClipWithClips:(id)a3;
- ($61DF9F24A7329A1BB61181F7D05C320D)moduleInfo;
- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfo;
- ($7F31FC32F9D1B293069C8DA058A10F41)transitionInfo;
- ($BE932F7424ADCBB9629B4717D8D69A02)motionInfo;
- ($FF287EE8AFEAB54EC1BB010BF4A7F511)durationInfo;
- (NSArray)displayAssets;
- (NSDictionary)debugInfo;
- (PXStoryConcreteAutoEditClip)init;
- (PXStoryConcreteAutoEditClip)initWithDisplayAsset:(id)a3;
- (PXStoryConcreteAutoEditClip)initWithDisplayAssets:(id)a3;
- (double)durationMultiplier;
- (id)description;
- (int64_t)playbackStyle;
- (void)setAudioInfo:(id *)a3;
- (void)setDebugInfo:(id)a3;
- (void)setDurationInfo:(id *)a3;
- (void)setDurationMultiplier:(double)a3;
- (void)setModuleInfo:(id)a3;
- (void)setMotionInfo:(id *)a3;
- (void)setPlaybackStyle:(int64_t)a3;
- (void)setTransitionInfo:(id *)a3;
@end

@implementation PXStoryConcreteAutoEditClip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
}

- (void)setDebugInfo:(id)a3
{
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (void)setModuleInfo:(id)a3
{
  self->_moduleInfo = ($A022BD108C6CC09BC304A9CB5E73F3A4)a3;
}

- ($61DF9F24A7329A1BB61181F7D05C320D)moduleInfo
{
  uint64_t v2 = *(void *)&self->_moduleInfo.isStart;
  int64_t moduleType = self->_moduleInfo.moduleType;
  result.var1 = v2;
  result.var2 = BYTE1(v2);
  result.var0 = moduleType;
  return result;
}

- (void)setAudioInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  long long v5 = *(_OWORD *)&a3->var4;
  self->_audioInfo.fadeOut = a3->var6;
  *(_OWORD *)&self->_audioInfo.volume = v4;
  *(_OWORD *)&self->_audioInfo.LCutLength = v5;
  *(_OWORD *)&self->_audioInfo.mode = v3;
}

- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfo
{
  long long v3 = *(_OWORD *)&self[2].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[2].var4;
  retstr->var6 = self[2].var6;
  return self;
}

- (void)setTransitionInfo:(id *)a3
{
  $3913CBCB8C27C6162DFA06D9B9422DBB var2 = a3->var2;
  *(_OWORD *)&self->_transitionInfo.kind = *(_OWORD *)&a3->var0;
  self->_transitionInfo.settings = ($BBBBDEA97CC73616CCE2EBA454CAEC53)var2;
}

- ($7F31FC32F9D1B293069C8DA058A10F41)transitionInfo
{
  $3913CBCB8C27C6162DFA06D9B9422DBB v3 = *($3913CBCB8C27C6162DFA06D9B9422DBB *)&self[3].var0;
  *($3913CBCB8C27C6162DFA06D9B9422DBB *)&retstr->var0 = self[2].var2;
  retstr->$3913CBCB8C27C6162DFA06D9B9422DBB var2 = v3;
  return self;
}

- (void)setMotionInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_motionInfo.settings.pan.relativeMotion = a3->var1.var0.var1;
  *(_OWORD *)&self->_motionInfo.style = v3;
}

- ($BE932F7424ADCBB9629B4717D8D69A02)motionInfo
{
  *($A26D059FEF5EDA5B5A36800E99FED223 *)retstr = *($A26D059FEF5EDA5B5A36800E99FED223 *)((char *)self + 56);
  return self;
}

- (void)setDurationMultiplier:(double)a3
{
  self->_durationMultiplier = a3;
}

- (double)durationMultiplier
{
  return self->_durationMultiplier;
}

- (void)setDurationInfo:(id *)a3
{
  *(_OWORD *)&self->_durationInfo.minimumDuration.value = *(_OWORD *)&a3->var0.var0;
  long long v3 = *(_OWORD *)&a3->var0.var3;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  long long v5 = *(_OWORD *)&a3->var2.var0;
  self->_durationInfo.maximumDuration.epoch = a3->var2.var3;
  *(_OWORD *)&self->_durationInfo.maximumDuration.value = v5;
  *(_OWORD *)&self->_durationInfo.preferredDuration.timescale = v4;
  *(_OWORD *)&self->_durationInfo.minimumDuration.epoch = v3;
}

- ($FF287EE8AFEAB54EC1BB010BF4A7F511)durationInfo
{
  long long v3 = *(_OWORD *)&self[2].var1.var3;
  long long v4 = *(_OWORD *)&self[3].var0.var0;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var2.var1;
  *(_OWORD *)&retstr->var2.var0 = v4;
  retstr->var2.var3 = self[3].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  return self;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (NSArray)displayAssets
{
  return self->_displayAssets;
}

- (id)description
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v4 = self->_displayAssets;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v35 + 1) + 8 * i) uuid];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v6);
  }

  v10 = NSString;
  uint64_t v11 = objc_opt_class();
  [(PXStoryConcreteAutoEditClip *)self playbackStyle];
  v12 = PFDisplayAssetPlaybackStyleDescription();
  [(PXStoryConcreteAutoEditClip *)self durationInfo];
  CMTime time = v33;
  Float64 Seconds = CMTimeGetSeconds(&time);
  [(PXStoryConcreteAutoEditClip *)self durationInfo];
  CMTime v32 = v31;
  Float64 v14 = CMTimeGetSeconds(&v32);
  [(PXStoryConcreteAutoEditClip *)self durationInfo];
  CMTime v30 = v29;
  Float64 v15 = CMTimeGetSeconds(&v30);
  [(PXStoryConcreteAutoEditClip *)self durationMultiplier];
  uint64_t v17 = v16;
  [(PXStoryConcreteAutoEditClip *)self motionInfo];
  v18 = PXStoryAutoEditClipMotionInfoDescription(&v28);
  [(PXStoryConcreteAutoEditClip *)self transitionInfo];
  v19 = PXStoryAutoEditClipTransitionInfoDescription((uint64_t)v27);
  [(PXStoryConcreteAutoEditClip *)self audioInfo];
  v20 = PXStoryClipAudioInfoDescription((uint64_t)v26);
  unint64_t v21 = [(PXStoryConcreteAutoEditClip *)self moduleInfo];
  v23 = PXStoryAutoEditClipModuleInfoDescription(v21, v22);
  v24 = [v10 stringWithFormat:@"<%@:%p assetUUIDs=%@, playbackStyle=%@, minDuration=%.2fs, idealDuration=%.2fs, maxDuration=%.2fs, multiplier=%.2f, motion=%@, transition=%@, audio=%@, module=%@>", v11, self, v3, v12, *(void *)&Seconds, *(void *)&v14, *(void *)&v15, v17, v18, v19, v20, v23];

  return v24;
}

- (PXStoryConcreteAutoEditClip)initWithDisplayAssets:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXStoryConcreteAutoEditClip.m", 34, @"Invalid parameter not satisfying: %@", @"displayAssets.count != 0" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteAutoEditClip;
  uint64_t v6 = [(PXStoryConcreteAutoEditClip *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    uint64_t v9 = MEMORY[0x1E4F8D280];
    long long v10 = *MEMORY[0x1E4F8D280];
    *(_OWORD *)(v6 + 184) = *(_OWORD *)(MEMORY[0x1E4F8D280] + 16);
    long long v11 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v6 + 200) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v6 + 216) = v11;
    *((void *)v6 + 29) = *(void *)(v9 + 64);
    *(_OWORD *)(v6 + 168) = v10;
    *((void *)v6 + 2) = 0;
    *((void *)v6 + 3) = 0x3FF0000000000000;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    *((_OWORD *)v6 + 9) = 0u;
    *((void *)v6 + 20) = 0;
    *((void *)v6 + 5) = 0;
    *((void *)v6 + 6) = 0;
  }

  return (PXStoryConcreteAutoEditClip *)v6;
}

- (PXStoryConcreteAutoEditClip)initWithDisplayAsset:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  long long v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  uint64_t v7 = -[PXStoryConcreteAutoEditClip initWithDisplayAssets:](self, "initWithDisplayAssets:", v6, v9, v10);
  return v7;
}

- (PXStoryConcreteAutoEditClip)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteAutoEditClip.m", 26, @"%s is not available as initializer", "-[PXStoryConcreteAutoEditClip init]");

  abort();
}

+ (id)composedClipWithClips:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v40 + 1) + 8 * i) displayAssets];
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v7);
  }

  long long v11 = [[PXStoryConcreteAutoEditClip alloc] initWithDisplayAssets:v4];
  v12 = [v5 firstObject];
  -[PXStoryConcreteAutoEditClip setPlaybackStyle:](v11, "setPlaybackStyle:", [v12 playbackStyle]);
  if (v12)
  {
    [v12 durationInfo];
    long long v32 = v37;
    long long v33 = v38;
    uint64_t v34 = v39;
    long long v30 = v35;
    long long v31 = v36;
    [(PXStoryConcreteAutoEditClip *)v11 setDurationInfo:&v30];
    [v12 motionInfo];
    long long v26 = v28;
    uint64_t v27 = v29;
    [(PXStoryConcreteAutoEditClip *)v11 setMotionInfo:&v26];
    [v12 transitionInfo];
    long long v22 = v24;
    long long v23 = v25;
    [(PXStoryConcreteAutoEditClip *)v11 setTransitionInfo:&v22];
    [v12 audioInfo];
  }
  else
  {
    uint64_t v39 = 0;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v34 = 0;
    [(PXStoryConcreteAutoEditClip *)v11 setDurationInfo:&v30];
    long long v28 = 0uLL;
    uint64_t v29 = 0;
    uint64_t v27 = 0;
    long long v26 = 0uLL;
    [(PXStoryConcreteAutoEditClip *)v11 setMotionInfo:&v26];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    [(PXStoryConcreteAutoEditClip *)v11 setTransitionInfo:&v22];
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
  }
  v16[0] = v18;
  v16[1] = v19;
  v16[2] = v20;
  uint64_t v17 = v21;
  [(PXStoryConcreteAutoEditClip *)v11 setAudioInfo:v16];
  uint64_t v13 = [v12 moduleInfo];
  -[PXStoryConcreteAutoEditClip setModuleInfo:](v11, "setModuleInfo:", v13, v14);

  return v11;
}

@end