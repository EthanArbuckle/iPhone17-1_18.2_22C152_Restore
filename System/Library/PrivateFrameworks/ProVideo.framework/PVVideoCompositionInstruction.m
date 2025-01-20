@interface PVVideoCompositionInstruction
- ($202A6A048D39AE170264FF71A65A9479)timeRange;
- (BOOL)containsTweening;
- (BOOL)enablePostProcessing;
- (BOOL)isFreezeFrame;
- (NSArray)requiredSourceSampleDataTrackIDs;
- (NSArray)requiredSourceTrackIDs;
- (NSString)description;
- (PVInstructionGraphNode)outputNode;
- (PVVideoCompositionInstruction)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)videoInstructionDescription;
- (int)passthroughTrackID;
- (void)loadInstructionGraphNodes:(HGRef<PVInstructionGraphContext>)a3;
- (void)setContainsTweening:(BOOL)a3;
- (void)setEnablePostProcessing:(BOOL)a3;
- (void)setIsFreezeFrame:(BOOL)a3;
- (void)setOutputNode:(id)a3;
- (void)setTimeRange:(id *)a3;
- (void)unloadInstructionGraphNodes;
@end

@implementation PVVideoCompositionInstruction

- (PVVideoCompositionInstruction)init
{
  v10.receiver = self;
  v10.super_class = (Class)PVVideoCompositionInstruction;
  v2 = [(PVVideoCompositionInstruction *)&v10 init];
  v3 = (PVVideoCompositionInstruction *)v2;
  if (v2)
  {
    long long v4 = *MEMORY[0x1E4F1FA30];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)(v2 + 40) = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
    *(_OWORD *)(v2 + 24) = v5;
    *(_OWORD *)(v2 + 8) = v4;
    *((_WORD *)v2 + 28) = 0;
    v6 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = 0;

    m_requiredSourceSampleDataTrackIDs = v3->m_requiredSourceSampleDataTrackIDs;
    v3->m_requiredSourceSampleDataTrackIDs = 0;

    v3->m_passthroughTrackID = 0;
    m_outputIGNode = v3->m_outputIGNode;
    v3->m_outputIGNode = 0;
  }
  return v3;
}

- (void)setOutputNode:(id)a3
{
  id v15 = a3;
  objc_storeStrong((id *)&self->m_outputIGNode, a3);
  m_requiredSourceTrackIDs = self->m_requiredSourceTrackIDs;
  self->m_requiredSourceTrackIDs = 0;

  m_requiredSourceSampleDataTrackIDs = self->m_requiredSourceSampleDataTrackIDs;
  self->m_requiredSourceSampleDataTrackIDs = 0;

  self->m_passthroughTrackID = 0;
  m_outputIGNode = self->m_outputIGNode;
  if (m_outputIGNode)
  {
    v8 = [(PVInstructionGraphNode *)m_outputIGNode requiredSourceTrackIDs];
    v9 = [v8 allObjects];
    objc_super v10 = self->m_requiredSourceTrackIDs;
    self->m_requiredSourceTrackIDs = v9;

    v11 = [(PVInstructionGraphNode *)self->m_outputIGNode requiredSourceSampleDataTrackIDs];
    v12 = [v11 allObjects];
    v13 = self->m_requiredSourceSampleDataTrackIDs;
    self->m_requiredSourceSampleDataTrackIDs = v12;

    if (+[PVEnvironment PV_ENABLE_CHECK_PASSTHRUS]
      && [(PVInstructionGraphNode *)self->m_outputIGNode isPassthru])
    {
      v14 = [(NSArray *)self->m_requiredSourceTrackIDs objectAtIndex:0];
      self->m_passthroughTrackID = [v14 intValue];
    }
  }
}

- (id)videoInstructionDescription
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&self->m_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->m_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->m_timeRange.duration.timescale;
  CFDictionaryRef v4 = CMTimeRangeCopyAsDictionary(&range, 0);
  v19[0] = v4;
  v18[0] = @"timeRange";
  v18[1] = @"enablePostPorcessing";
  v16 = [NSNumber numberWithBool:self->m_enablePostProcessing];
  v19[1] = v16;
  v18[2] = @"containsTweening";
  uint64_t v20 = [NSNumber numberWithBool:self->m_containsTweening];
  v18[3] = @"isFreezeFrame";
  id v15 = (void *)v20;
  uint64_t v21 = [NSNumber numberWithBool:self->_isFreezeFrame];
  v18[4] = @"passthroughTrackID";
  v14 = (void *)v21;
  uint64_t v22 = [NSNumber numberWithInt:self->m_passthroughTrackID];
  v18[5] = @"requiredSourceTrackIDs";
  v13 = (void *)v22;
  long long v5 = [(PVVideoCompositionInstruction *)self requiredSourceTrackIDs];
  if (v5) {
    [(PVVideoCompositionInstruction *)self requiredSourceTrackIDs];
  }
  else {
  v6 = [MEMORY[0x1E4F1C978] array];
  }
  v23 = v6;
  v18[6] = @"requiredSourceSampleDataTrackIDs";
  v7 = [(PVVideoCompositionInstruction *)self requiredSourceSampleDataTrackIDs];
  if (v7) {
    [(PVVideoCompositionInstruction *)self requiredSourceSampleDataTrackIDs];
  }
  else {
  v8 = [MEMORY[0x1E4F1C978] array];
  }
  v24 = v8;
  v18[7] = @"instructionGraph";
  m_outputIGNode = self->m_outputIGNode;
  if (m_outputIGNode) {
    [(PVInstructionGraphNode *)m_outputIGNode instructionGraphNodeDescription];
  }
  else {
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  v25 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:8];

  CFRelease(v4);

  return v11;
}

- (NSString)description
{
  v2 = NSString;
  long long v3 = [(PVVideoCompositionInstruction *)self videoInstructionDescription];
  CFDictionaryRef v4 = [v2 stringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

- (void)loadInstructionGraphNodes:(HGRef<PVInstructionGraphContext>)a3
{
  m_outputIGNode = self->m_outputIGNode;
  if (m_outputIGNode)
  {
    uint64_t v4 = *(void *)a3.m_Obj;
    uint64_t v5 = v4;
    if (v4) {
      (*(void (**)(uint64_t, SEL))(*(void *)v4 + 16))(v4, a2);
    }
    [(PVInstructionGraphNode *)m_outputIGNode loadIGNode:&v5];
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
    }
  }
}

- (void)unloadInstructionGraphNodes
{
  m_outputIGNode = self->m_outputIGNode;
  if (m_outputIGNode) {
    [(PVInstructionGraphNode *)m_outputIGNode unloadIGNode];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[PVVideoCompositionInstruction allocWithZone:a3] init];
  [(PVVideoCompositionInstruction *)self timeRange];
  v7[0] = v7[3];
  v7[1] = v7[4];
  v7[2] = v7[5];
  [(PVVideoCompositionInstruction *)v4 setTimeRange:v7];
  [(PVVideoCompositionInstruction *)v4 setEnablePostProcessing:[(PVVideoCompositionInstruction *)self enablePostProcessing]];
  [(PVVideoCompositionInstruction *)v4 setContainsTweening:[(PVVideoCompositionInstruction *)self containsTweening]];
  uint64_t v5 = [(PVVideoCompositionInstruction *)self outputNode];
  [(PVVideoCompositionInstruction *)v4 setOutputNode:v5];

  return v4;
}

- ($202A6A048D39AE170264FF71A65A9479)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->m_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->m_timeRange.start.epoch = v4;
  *(_OWORD *)&self->m_timeRange.start.value = v3;
}

- (BOOL)enablePostProcessing
{
  return self->m_enablePostProcessing;
}

- (void)setEnablePostProcessing:(BOOL)a3
{
  self->m_enablePostProcessing = a3;
}

- (BOOL)containsTweening
{
  return self->m_containsTweening;
}

- (void)setContainsTweening:(BOOL)a3
{
  self->m_containsTweening = a3;
}

- (NSArray)requiredSourceTrackIDs
{
  return self->m_requiredSourceTrackIDs;
}

- (NSArray)requiredSourceSampleDataTrackIDs
{
  return self->m_requiredSourceSampleDataTrackIDs;
}

- (int)passthroughTrackID
{
  return self->m_passthroughTrackID;
}

- (PVInstructionGraphNode)outputNode
{
  return self->m_outputIGNode;
}

- (BOOL)isFreezeFrame
{
  return self->_isFreezeFrame;
}

- (void)setIsFreezeFrame:(BOOL)a3
{
  self->_isFreezeFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_outputIGNode, 0);
  objc_storeStrong((id *)&self->m_requiredSourceSampleDataTrackIDs, 0);

  objc_storeStrong((id *)&self->m_requiredSourceTrackIDs, 0);
}

@end