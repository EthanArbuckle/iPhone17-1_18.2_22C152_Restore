@interface PVCinematicEffect
+ (BOOL)assetIsCinematicVideo:(id)a3;
+ (BOOL)currentSystemCanRenderAsset:(id)a3;
+ (BOOL)deviceSupportsRendering:(id)a3;
+ (BOOL)deviceSupportsTracking:(id)a3;
+ (BOOL)enoughMemoryForHDR;
+ (BOOL)hasAppleNeuralEngine;
+ (BOOL)hasMoreThan2GBOfMemory;
+ (BOOL)isCinematicSupported:(id)a3;
+ (id)cinematicMetadataFromAsset:(id)a3;
+ (int64_t)memorySize;
+ (unint64_t)renderingVersionFromAsset:(id)a3 error:(id *)a4;
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (BOOL)isReady;
- (BOOL)setAsset:(id)a3;
- (CGAffineTransform)postEffectTransform;
- (CGSize)outputSize;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PVCinematicEffect)init;
- (double)clipOffset;
- (double)clipStart;
- (unint64_t)quality;
- (void)setClipOffset:(double)a3;
- (void)setClipStart:(double)a3;
- (void)setPostEffectTransform:(CGAffineTransform *)a3;
- (void)setQuality:(unint64_t)a3;
- (void)setupGlobalMetadata;
- (void)updateDictionary:(id)a3 completion:(id)a4;
@end

@implementation PVCinematicEffect

- (PVCinematicEffect)init
{
  v8.receiver = self;
  v8.super_class = (Class)PVCinematicEffect;
  v2 = [(PVCinematicEffect *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_quality = 75;
    v2->_isCinematographyScriptReady = 0;
    v2->_isAssetOK = 0;
    ptGlobalRenderingMetadata = v2->_ptGlobalRenderingMetadata;
    v2->_ptGlobalRenderingMetadata = 0;

    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v3->_postEffectTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v3->_postEffectTransform.c = v6;
    *(_OWORD *)&v3->_postEffectTransform.tx = v5;
  }
  return v3;
}

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  long long v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"FFEffectProperty_DisplayName", @"Helium", @"FFEffectProperty_Category", @"effect.video.filter", @"FFEffectProperty_EffectType", 0);
  +[PVEffect registerEffectClass:objc_opt_class() forEffectID:v9 withProperties:v6];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"displayName", @"BuiltIn", @"contentGroup", 0);
  objc_super v8 = +[PVContentRegistry sharedInstance];
  [v8 registerContentClass:objc_opt_class() forID:v9 type:@"effect.video.filter" withProperties:v7];
}

+ (int64_t)memorySize
{
  if (+[PVCinematicEffect memorySize]::onceToken != -1) {
    dispatch_once(&+[PVCinematicEffect memorySize]::onceToken, &__block_literal_global_1);
  }
  return +[PVCinematicEffect memorySize]::mem;
}

uint64_t __31__PVCinematicEffect_memorySize__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  *(void *)v2 = 0x1800000006;
  size_t v1 = 8;
  return sysctl(v2, 2u, &+[PVCinematicEffect memorySize]::mem, &v1, 0, 0);
}

+ (BOOL)hasMoreThan2GBOfMemory
{
  return (unint64_t)+[PVCinematicEffect memorySize] > 0x9E800000;
}

+ (BOOL)enoughMemoryForHDR
{
  return +[PVCinematicEffect hasMoreThan2GBOfMemory];
}

+ (BOOL)hasAppleNeuralEngine
{
  if (+[PVCinematicEffect hasAppleNeuralEngine]::onceToken != -1) {
    dispatch_once(&+[PVCinematicEffect hasAppleNeuralEngine]::onceToken, &__block_literal_global_24);
  }
  return +[PVCinematicEffect hasAppleNeuralEngine]::hasANE;
}

uint64_t __41__PVCinematicEffect_hasAppleNeuralEngine__block_invoke()
{
  int v6 = 0;
  size_t v5 = 4;
  uint64_t result = sysctlbyname("hw.cpufamily", &v6, &v5, 0, 0);
  char v1 = 0;
  if (v6 <= 747742333)
  {
    BOOL v2 = v6 == -1829029944;
    int v3 = -400654602;
  }
  else
  {
    BOOL v2 = v6 == 747742334 || v6 == 933271106;
    int v3 = 1741614739;
  }
  if (!v2 && v6 != v3) {
    char v1 = 1;
  }
  +[PVCinematicEffect hasAppleNeuralEngine]::hasANE = v1;
  return result;
}

+ (BOOL)deviceSupportsRendering:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __45__PVCinematicEffect_deviceSupportsRendering___block_invoke;
  block[3] = &unk_1E61689B0;
  id v9 = v3;
  uint64_t v4 = +[PVCinematicEffect deviceSupportsRendering:]::onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&+[PVCinematicEffect deviceSupportsRendering:]::onceToken, block);
  }
  char v6 = +[PVCinematicEffect deviceSupportsRendering:]::supported;

  return v6;
}

void __45__PVCinematicEffect_deviceSupportsRendering___block_invoke(uint64_t a1)
{
  char v1 = *(void **)(a1 + 32);
  if (v1) {
    id v2 = v1;
  }
  else {
    id v2 = MTLCreateSystemDefaultDevice();
  }
  id v4 = v2;
  int v3 = [MEMORY[0x1E4F92238] isMetalDeviceSupported:v2];
  if (v3) {
    LOBYTE(v3) = +[PVCinematicEffect enoughMemoryForHDR];
  }
  +[PVCinematicEffect deviceSupportsRendering:]::supported = v3;
}

+ (BOOL)deviceSupportsTracking:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __44__PVCinematicEffect_deviceSupportsTracking___block_invoke;
  block[3] = &unk_1E61689B0;
  id v9 = v3;
  uint64_t v4 = +[PVCinematicEffect deviceSupportsTracking:]::onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&+[PVCinematicEffect deviceSupportsTracking:]::onceToken, block);
  }
  char v6 = +[PVCinematicEffect deviceSupportsTracking:]::supported;

  return v6;
}

uint64_t __44__PVCinematicEffect_deviceSupportsTracking___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t result = [MEMORY[0x1E4F92268] isSupported];
    +[PVCinematicEffect deviceSupportsTracking:]::supported = result;
    if (!result) {
      goto LABEL_8;
    }
  }
  else
  {
    +[PVCinematicEffect deviceSupportsTracking:]::supported = +[PVCinematicEffect hasAppleNeuralEngine];
    if ((+[PVCinematicEffect deviceSupportsTracking:]::supported & 1) == 0)
    {
      uint64_t result = 0;
      goto LABEL_8;
    }
  }
  uint64_t result = +[PVCinematicEffect deviceSupportsRendering:*(void *)(a1 + 32)];
  if (result) {
    uint64_t result = [MEMORY[0x1E4F16608] eligibleForHDRPlayback];
  }
LABEL_8:
  +[PVCinematicEffect deviceSupportsTracking:]::supported = result;
  return result;
}

+ (BOOL)isCinematicSupported:(id)a3
{
  return +[PVCinematicEffect deviceSupportsTracking:a3];
}

+ (BOOL)currentSystemCanRenderAsset:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  uint64_t v5 = [a1 renderingVersionFromAsset:v4 error:&v9];
  id v6 = v9;
  if (objc_opt_respondsToSelector()) {
    char v7 = [MEMORY[0x1E4F92238] isRenderVersionSupported:v5];
  }
  else {
    char v7 = v5 == 1;
  }

  return v7;
}

+ (BOOL)assetIsCinematicVideo:(id)a3
{
  id v3 = [a1 cinematicMetadataFromAsset:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)cinematicMetadataFromAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(a3, "metadata", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        char v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_super v8 = [v7 identifier];
        char v9 = [v8 isEqual:@"mdta/com.apple.quicktime.cinematic-video"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (unint64_t)renderingVersionFromAsset:(id)a3 error:(id *)a4
{
  uint64_t v5 = [a1 cinematicMetadataFromAsset:a3];
  id v6 = v5;
  if (v5)
  {
    char v7 = (void *)MEMORY[0x1E4F92220];
    objc_super v8 = [v5 value];
    char v9 = [v7 deserializeMetadataWithType:2 fromGlobalMetadata:v8 error:a4];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (objc_opt_respondsToSelector())
        {
          unint64_t v10 = [v9 renderingVersion];
LABEL_11:

          goto LABEL_12;
        }
        v11 = @"Global rendering metadata does not respond to renderingVersion selector.";
      }
      else
      {
        v11 = @"Unexpected global rendering metadata class.";
      }
    }
    else
    {
      v11 = @"Deserialize failed.";
    }
    PVLogError(v11, @"ProVideo.Cinematic", a4);
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  PVLogError(@"Can't find global cinematic metadata in asset.", @"ProVideo.Cinematic", a4);
  unint64_t v10 = 0;
LABEL_12:

  return v10;
}

- (CGSize)outputSize
{
  float64x2_t v2 = vabsq_f64(vaddq_f64(vmulq_n_f64(*(float64x2_t *)&self->_postEffectTransform.a, self->_videoTrackSize.width), vmulq_n_f64(*(float64x2_t *)&self->_postEffectTransform.c, self->_videoTrackSize.height)));
  double v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (void)setupGlobalMetadata
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v3 = [(AVAsset *)self->_avasset metadata];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        char v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_super v8 = [v7 identifier];
        int v9 = [v8 isEqualToString:@"mdta/com.apple.quicktime.cinematic-video"];

        if (v9)
        {
          unint64_t v10 = (void *)MEMORY[0x1E4F92220];
          v11 = [v7 value];
          id v15 = 0;
          long long v12 = [v10 deserializeMetadataWithType:2 fromGlobalMetadata:v11 error:&v15];
          id v13 = v15;

          if (v12)
          {
            ptGlobalRenderingMetadata = self->_ptGlobalRenderingMetadata;
            self->_ptGlobalRenderingMetadata = v12;

            goto LABEL_13;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (BOOL)setAsset:(id)a3
{
  uint64_t v5 = (AVAsset *)a3;
  if (self->_avasset != v5)
  {
    objc_storeStrong((id *)&self->_avasset, a3);
    self->_isCinematographyScriptReady = 0;
    self->_isAssetOK = 0;
    avasset = self->_avasset;
    if (avasset)
    {
      uint64_t v7 = *MEMORY[0x1E4F15C18];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = *(void *)"";
      v9[2] = __30__PVCinematicEffect_setAsset___block_invoke;
      v9[3] = &unk_1E6168A00;
      v9[4] = self;
      unint64_t v10 = v5;
      [(AVAsset *)avasset loadTracksWithMediaType:v7 completionHandler:v9];
    }
  }

  return 1;
}

void __30__PVCinematicEffect_setAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6 && [v5 count])
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:0];
    objc_super v8 = v7;
    if (v7)
    {
      [v7 naturalSize];
      v11 = (double *)(*(void *)(a1 + 32) + 184);
      double *v11 = fabs(v9);
      v11[1] = fabs(v10);
    }
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = *(void *)"";
    v16[2] = __30__PVCinematicEffect_setAsset___block_invoke_2;
    v16[3] = &unk_1E61689D8;
    id v13 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    long long v14 = v12;
    long long v17 = v14;
    [v13 loadValuesAsynchronouslyForKeys:&unk_1F11EC610 completionHandler:v16];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v15 = *(void *)(a1 + 32);
    if (*(void *)(v15 + 176)) {
      *(unsigned char *)(v15 + 168) = 1;
    }
  }
}

intptr_t __30__PVCinematicEffect_setAsset___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setupGlobalMetadata];
  float64x2_t v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

- (BOOL)isReady
{
  return self->_isAssetOK && self->_isCinematographyScriptReady;
}

- (void)updateDictionary:(id)a3 completion:(id)a4
{
  uint64_t v7 = (NSDictionary *)a3;
  objc_super v8 = (void (**)(id, uint64_t, void))a4;
  if (self->_currentCinemtography == v7 && self->_isCinematographyScriptReady)
  {
LABEL_8:
    if (v8) {
      v8[2](v8, 1, 0);
    }
    goto LABEL_10;
  }
  if (!self->_script || !self->_isCinematographyScriptReady)
  {
    self->_isCinematographyScriptReady = 0;
    double v9 = (PTCinematographyScript *)objc_alloc_init(MEMORY[0x1E4F92200]);
    script = self->_script;
    self->_script = v9;

    v11 = self->_script;
    avasset = self->_avasset;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = *(void *)"";
    v14[2] = __49__PVCinematicEffect_updateDictionary_completion___block_invoke;
    v14[3] = &unk_1E6168A28;
    v14[4] = self;
    uint64_t v15 = v7;
    long long v16 = v8;
    id v13 = (id)[(PTCinematographyScript *)v11 loadWithAsset:avasset changesDictionary:v15 completion:v14];

    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    [(PTCinematographyScript *)self->_script reloadWithChangesDictionary:v7];
    objc_storeStrong((id *)&self->_currentCinemtography, a3);
    goto LABEL_8;
  }
LABEL_10:
}

void __49__PVCinematicEffect_updateDictionary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 169) = 1;
  }
  else
  {
    NSLog(&cfstr_Ptcinematograp.isa, v5);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v81 = v6;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if (!self->_isAssetOK || ([(id)objc_opt_class() deviceSupportsRendering:0] & 1) == 0)
  {
    v40 = (HGNode *)HGObject::operator new(0x1A0uLL);
    v41 = HGNode::HGNode(v40);
    void *v81 = v40;
    return (HGRef<HGNode>)v41;
  }
  v83 = self;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v102);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v101);
  double v9 = v102;
  void *v81 = v102;
  double v10 = v83;
  if (v9) {
    (*(void (**)(HGNode *))(*(void *)v9 + 16))(v9);
  }
  v75 = v9;
  v11 = (HGRenderCinema *)HGObject::operator new(0x1C0uLL);
  HGRenderCinema::HGRenderCinema(v11, 0);
  (*(void (**)(HGRenderCinema *, void, HGNode *))(*(void *)v11 + 120))(v11, 0, v102);
  (*(void (**)(HGRenderCinema *, uint64_t, HGNode *))(*(void *)v11 + 120))(v11, 1, v101);
  v82 = v11;
  ptGlobalRenderingMetadata = v83->_ptGlobalRenderingMetadata;
  if (ptGlobalRenderingMetadata) {
    HGRenderCinema::SetGlobalRenderingMetadata(v11, ptGlobalRenderingMetadata, v12);
  }
  v78 = PVInputHGNodeMap<unsigned int>::GetTimedMetadata((uint64_t)a4, 0);
  uint64_t v14 = PVInputHGNodeMap<unsigned int>::GetTimedMetadata((uint64_t)a4, 1u);
  uint64_t v15 = v78;
  v76 = (void *)v14;
  if (!v78) {
    uint64_t v15 = (void *)v14;
  }
  id v16 = v15;
  v77 = v16;
  if (!v16)
  {
    unsigned __int32 v21 = 1.0;
    goto LABEL_38;
  }
  long long v17 = [v16 items];
  v74 = v17;
  if (!v17)
  {
    unsigned __int32 v21 = 1.0;
    goto LABEL_37;
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v18 = v17;
  uint64_t v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v97, v105, 16, v74);
  if (!v19)
  {
    unsigned __int32 v21 = 1.0;
    goto LABEL_36;
  }
  uint64_t v20 = *(void *)v98;
  uint64_t v84 = *MEMORY[0x1E4F1F020];
  unsigned __int32 v21 = 1.0;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v98 != v20) {
        objc_enumerationMutation(v18);
      }
      v23 = *(void **)(*((void *)&v97 + 1) + 8 * v22);
      v24 = [v23 identifier];
      int v25 = [v24 isEqualToString:@"mdta/com.apple.quicktime.disparity-float"];

      if (v25)
      {
        v26 = [v23 value];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_27;
        }
        v28 = [v23 value];
        [v28 floatValue];
        unsigned __int32 v21 = v29;
        goto LABEL_26;
      }
      v28 = [v23 identifier];
      if (![v28 isEqualToString:@"mdta/com.apple.quicktime.cinematic-video.rendering"])goto LABEL_26; {
      v30 = [v23 dataType];
      }
      if (([v30 isEqualToString:v84] & 1) == 0)
      {

LABEL_26:
        goto LABEL_27;
      }
      v31 = [v23 value];
      objc_opt_class();
      char v32 = objc_opt_isKindOfClass();

      if (v32)
      {
        v33 = v83->_ptGlobalRenderingMetadata;
        if (v33)
        {
          uint64_t v34 = [(PTGlobalRenderingMetadata *)v33 majorVersion];
          uint64_t v35 = [(PTGlobalRenderingMetadata *)v83->_ptGlobalRenderingMetadata minorVersion];
          v36 = (void *)MEMORY[0x1E4F92280];
          v37 = [v23 value];
          v28 = [v36 objectFromData:v37 withMajorVersion:v34 minorVersion:v35];

          if (v28) {
            HGRenderCinema::SetTimedRenderingMetadata((uint64_t)v82, v28, v38);
          }
          else {
            NSLog(&cfstr_ErrorWPttimedr.isa);
          }
          goto LABEL_26;
        }
      }
LABEL_27:
      ++v22;
    }
    while (v19 != v22);
    uint64_t v39 = [v18 countByEnumeratingWithState:&v97 objects:v105 count:16];
    uint64_t v19 = v39;
  }
  while (v39);
LABEL_36:

LABEL_37:
  double v10 = v83;
LABEL_38:
  if (v10->_isCinematographyScriptReady)
  {
    CMTimeValue var0 = a3->var0;
    int32_t var1 = a3->var1;
    uint64_t v103 = *(void *)&a3->var2;
    int var3_high = HIDWORD(a3->var3);
    memset(&v96, 0, sizeof(v96));
    CMTimeMakeWithSeconds(&v96, v10->_clipOffset, var1);
    memset(&v95, 0, sizeof(v95));
    CMTimeMakeWithSeconds(&v95, v10->_clipStart, var1);
    *(void *)&lhs.flags = v103;
    lhs.timescale = var1;
    HIDWORD(lhs.epoch) = var3_high;
    CMTime rhs = v96;
    lhs.value = var0;
    CMTimeSubtract(&v93, &lhs, &rhs);
    CMTime v90 = v95;
    CMTimeAdd(&v94, &v93, &v90);
    uint64_t v103 = *(void *)&v94.flags;
    int var3_high = HIDWORD(v94.epoch);
    script = v10->_script;
    CMTime v89 = v94;
    v45 = [(PTCinematographyScript *)script frameNearestTime:&v89];
    v46 = v45;
    if (v45)
    {
      [v45 aperture];
      unsigned __int32 v48 = v47;
      [v46 focusDistance];
      unsigned __int32 v21 = v49;
    }
    else
    {
      unsigned __int32 v48 = 1068708659;
    }

    double v10 = v83;
  }
  else
  {
    unsigned __int32 v48 = 1068708659;
  }
  [(NSLock *)v10->super.super._inspectablePropertiesLock lock];
  v50 = [(NSMutableDictionary *)v10->super.super._inspectableProperties objectForKeyedSubscript:@"CinematicAperture"];
  [(NSLock *)v10->super.super._inspectablePropertiesLock unlock];
  if (v50)
  {
    [v50 floatValue];
    unsigned __int32 v48 = v51;
  }
  id v52 = (id)*MEMORY[0x1E4F24BE0];
  v53 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
  if (([v53 isRec709GammaColorSpace] & 1) == 0)
  {
    if ([v53 isRec2020LinearColorSpace])
    {
      id v54 = (id)*MEMORY[0x1E4F1EF08];

      id v52 = v54;
      double v10 = v83;
    }
    else
    {
      NSLog(&cfstr_UnexpectedWork.isa);
    }
  }
  HGRenderCinema::SetSingleChannelDepthConversion((uint64_t)v82);
  unint64_t quality = v10->_quality;
  if (quality) {
    uint64_t v57 = quality;
  }
  else {
    uint64_t v57 = 75;
  }
  HGRenderCinema::SetRenderQuality(v82, (const char *)v57, v55);
  v58.n128_u32[0] = v48;
  HGRenderCinema::SetFXParameter((uint64_t)v82, 0, v59, v58, v60, v61, v62);
  v63.n128_u32[0] = v21;
  HGRenderCinema::SetFXParameter((uint64_t)v82, (const char *)1, v64, v63, v65, v66, v67);
  HGRenderCinema::SetDisplayMode(v82, 0, v68);
  id v69 = v52;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v69 UTF8String]);
  v70 = (HGXForm *)v82;
  HGRenderCinema::SetTransferFunction((uint64_t)v82, (uint64_t)__p, v71);
  if (v88 < 0) {
    operator delete(__p[0]);
  }
  if (v75 == (HGNode *)v82)
  {
    (*(void (**)(HGNode *))(*(void *)v75 + 24))(v75);
    v70 = (HGXForm *)v75;
  }
  else
  {
    if (v75) {
      (*(void (**)(HGNode *))(*(void *)v75 + 24))(v75);
    }
    void *v81 = v82;
  }
  v86 = v70;
  (*(void (**)(HGXForm *))(*(void *)v70 + 16))(v70);
  long long v72 = *(_OWORD *)&v83->_postEffectTransform.c;
  v85[0] = *(_OWORD *)&v83->_postEffectTransform.a;
  v85[1] = v72;
  v85[2] = *(_OWORD *)&v83->_postEffectTransform.tx;
  HGXFormForCGAffineTransform(&v86, v85, 1, (HGXForm **)&v96);
  v73 = *(void (**)(HGXForm *))(*(void *)v70 + 24);
  if (v70 == (HGXForm *)v96.value)
  {
    v73(v70);
  }
  else
  {
    v73(v70);
    void *v81 = v96.value;
    v96.value = 0;
  }
  if (v86) {
    (*(void (**)(HGXForm *))(*(void *)v86 + 24))(v86);
  }

  if (v101) {
    (*(void (**)(HGNode *))(*(void *)v101 + 24))(v101);
  }
  v41 = v102;
  if (v102) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v102 + 24))(v102);
  }
  return (HGRef<HGNode>)v41;
}

- (unint64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(unint64_t)a3
{
  self->_unint64_t quality = a3;
}

- (double)clipOffset
{
  return self->_clipOffset;
}

- (void)setClipOffset:(double)a3
{
  self->_clipOffset = a3;
}

- (double)clipStart
{
  return self->_clipStart;
}

- (void)setClipStart:(double)a3
{
  self->_clipStart = a3;
}

- (CGAffineTransform)postEffectTransform
{
  long long v3 = *(_OWORD *)&self[5].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].c;
  return self;
}

- (void)setPostEffectTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_postEffectTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_postEffectTransform.c = v4;
  *(_OWORD *)&self->_postEffectTransform.tx = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ptGlobalRenderingMetadata, 0);
  objc_storeStrong((id *)&self->_currentCinemtography, 0);
  objc_storeStrong((id *)&self->_script, 0);

  objc_storeStrong((id *)&self->_avasset, 0);
}

@end