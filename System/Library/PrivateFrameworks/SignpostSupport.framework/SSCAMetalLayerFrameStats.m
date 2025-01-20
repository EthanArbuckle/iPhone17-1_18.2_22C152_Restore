@interface SSCAMetalLayerFrameStats
- (NSString)debugDescription;
- (SSCAMLDurationStats)cpuEndToEndWalltimeStats;
- (SSCAMLDurationStats)gpuDoneToCompletedWalltimeStats;
- (SSCAMLDurationStats)gpuEndToEndWalltimeStats;
- (SSCAMLDurationStats)onGPUWalltimeStats;
- (SSCAMLDurationStats)totalEndToEndWalltimeStats;
- (SSCAMetalLayerFrameStats)initWithSignpostAggregation:(id)a3 parentIntervalStats:(id)a4;
- (SSCAMetalLayerStats)parentIntervalStats;
- (double)commandBuffersPerSecond;
- (double)framesPerSecond;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (unint64_t)commandBufferCount;
- (unint64_t)frameCount;
@end

@implementation SSCAMetalLayerFrameStats

- (SSCAMetalLayerFrameStats)initWithSignpostAggregation:(id)a3 parentIntervalStats:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SSCAMetalLayerFrameStats;
  v8 = [(SSCAMetalLayerFrameStats *)&v24 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parentIntervalStats, v7);
    uint64_t v10 = _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_TotalEndToEndWalltime);
    totalEndToEndWalltimeStats = v9->_totalEndToEndWalltimeStats;
    v9->_totalEndToEndWalltimeStats = (SSCAMLDurationStats *)v10;

    uint64_t v12 = _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_CPUEndToEndWalltime);
    cpuEndToEndWalltimeStats = v9->_cpuEndToEndWalltimeStats;
    v9->_cpuEndToEndWalltimeStats = (SSCAMLDurationStats *)v12;

    uint64_t v14 = _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_GPUEndToEndWalltime);
    gpuEndToEndWalltimeStats = v9->_gpuEndToEndWalltimeStats;
    v9->_gpuEndToEndWalltimeStats = (SSCAMLDurationStats *)v14;

    uint64_t v16 = _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_TotalOnGPUWalltime);
    onGPUWalltimeStats = v9->_onGPUWalltimeStats;
    v9->_onGPUWalltimeStats = (SSCAMLDurationStats *)v16;

    uint64_t v18 = _durationStat(v6, kSSCAMLFPGroup_Frames, kSSCAMLFPType_GPUDoneToCompletion);
    gpuDoneToCompletedWalltimeStats = v9->_gpuDoneToCompletedWalltimeStats;
    v9->_gpuDoneToCompletedWalltimeStats = (SSCAMLDurationStats *)v18;

    v20 = [(SSCAMetalLayerFrameStats *)v9 totalEndToEndWalltimeStats];
    v9->_frameCount = [v20 durationCount];

    v21 = [v6 groupNameToGroupDict];
    v22 = [v21 objectForKeyedSubscript:kSSCAMLFPGroup_FrameCommandBuffers];
    v9->_commandBufferCount = [v22 count];
  }
  return v9;
}

- (id)dictionaryRepresentation
{
  v22[9] = *MEMORY[0x1E4F143B8];
  v21[0] = kSSCAMLFrameStatsKey_FrameCount;
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerFrameStats frameCount](self, "frameCount"));
  v22[0] = v20;
  v21[1] = kSSCAMLFrameStatsKey_FramesPerSecond;
  v3 = NSNumber;
  [(SSCAMetalLayerFrameStats *)self framesPerSecond];
  v19 = objc_msgSend(v3, "numberWithDouble:");
  v22[1] = v19;
  v21[2] = kSSCAMLFrameStatsKey_TotalEndToEndWalltimeStats;
  uint64_t v18 = [(SSCAMetalLayerFrameStats *)self totalEndToEndWalltimeStats];
  v17 = [v18 dictionaryRepresentation];
  v22[2] = v17;
  v21[3] = kSSCAMLFrameStatsKey_CPUEndToEndWalltimeStats;
  uint64_t v16 = [(SSCAMetalLayerFrameStats *)self cpuEndToEndWalltimeStats];
  v4 = [v16 dictionaryRepresentation];
  v22[3] = v4;
  v21[4] = kSSCAMLFrameStatsKey_GPUEndToEndWalltimeStats;
  v5 = [(SSCAMetalLayerFrameStats *)self gpuEndToEndWalltimeStats];
  id v6 = [v5 dictionaryRepresentation];
  v22[4] = v6;
  v21[5] = kSSCAMLFrameStatsKey_OnGPUWalltimeStats;
  id v7 = [(SSCAMetalLayerFrameStats *)self onGPUWalltimeStats];
  v8 = [v7 dictionaryRepresentation];
  v22[5] = v8;
  v21[6] = kSSCAMLFrameStatsKey_GPUDoneToCompletedWalltimeStats;
  v9 = [(SSCAMetalLayerFrameStats *)self gpuDoneToCompletedWalltimeStats];
  uint64_t v10 = [v9 dictionaryRepresentation];
  v22[6] = v10;
  v21[7] = kSSCAMLFrameStatsKey_CommandBufferCount;
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SSCAMetalLayerFrameStats commandBufferCount](self, "commandBufferCount"));
  v22[7] = v11;
  v21[8] = kSSCAMLFrameStatsKey_CommandBuffersPerSecond;
  uint64_t v12 = NSNumber;
  [(SSCAMetalLayerFrameStats *)self commandBuffersPerSecond];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v22[8] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:9];

  return v14;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSCAMetalLayerFrameStats *)self jsonDescription:3];
}

- (double)framesPerSecond
{
  v3 = [(SSCAMetalLayerFrameStats *)self parentIntervalStats];
  [v3 activeSeconds];
  double v5 = v4;

  double result = 0.0;
  if (v5 != 0.0) {
    return (double)[(SSCAMetalLayerFrameStats *)self frameCount] / v5;
  }
  return result;
}

- (double)commandBuffersPerSecond
{
  v3 = [(SSCAMetalLayerFrameStats *)self parentIntervalStats];
  [v3 activeSeconds];
  double v5 = v4;

  double result = 0.0;
  if (v5 != 0.0) {
    return (double)[(SSCAMetalLayerFrameStats *)self commandBufferCount] / v5;
  }
  return result;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (SSCAMLDurationStats)totalEndToEndWalltimeStats
{
  return self->_totalEndToEndWalltimeStats;
}

- (SSCAMLDurationStats)cpuEndToEndWalltimeStats
{
  return self->_cpuEndToEndWalltimeStats;
}

- (SSCAMLDurationStats)gpuEndToEndWalltimeStats
{
  return self->_gpuEndToEndWalltimeStats;
}

- (SSCAMLDurationStats)onGPUWalltimeStats
{
  return self->_onGPUWalltimeStats;
}

- (SSCAMLDurationStats)gpuDoneToCompletedWalltimeStats
{
  return self->_gpuDoneToCompletedWalltimeStats;
}

- (unint64_t)commandBufferCount
{
  return self->_commandBufferCount;
}

- (SSCAMetalLayerStats)parentIntervalStats
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentIntervalStats);

  return (SSCAMetalLayerStats *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentIntervalStats);
  objc_storeStrong((id *)&self->_gpuDoneToCompletedWalltimeStats, 0);
  objc_storeStrong((id *)&self->_onGPUWalltimeStats, 0);
  objc_storeStrong((id *)&self->_gpuEndToEndWalltimeStats, 0);
  objc_storeStrong((id *)&self->_cpuEndToEndWalltimeStats, 0);

  objc_storeStrong((id *)&self->_totalEndToEndWalltimeStats, 0);
}

@end