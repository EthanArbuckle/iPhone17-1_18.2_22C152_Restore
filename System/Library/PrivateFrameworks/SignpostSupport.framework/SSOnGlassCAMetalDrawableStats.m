@interface SSOnGlassCAMetalDrawableStats
- (NSString)debugDescription;
- (SSOnGlassCAMetalDrawableStats)initWithOnGlassDrawableIntervals:(id)a3;
- (SignpostSupportValueStats)inFlightCPUEndToEndIntervalStats;
- (SignpostSupportValueStats)inFlightCommandBufferCountStats;
- (SignpostSupportValueStats)inFlightGPUEndToEndIntervalStats;
- (SignpostSupportValueStats)inFlightGPUResidencyStats;
- (SignpostSupportValueStats)inFlightOnGPUTimeStats;
- (SignpostSupportValueStats)inFlightTotalEndToEndIntervalStats;
- (SignpostSupportValueStats)inFlightWaitForGlassStats;
- (SignpostSupportValueStats)onGlassIntervalStats;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
@end

@implementation SSOnGlassCAMetalDrawableStats

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSOnGlassCAMetalDrawableStats *)self jsonDescription:3];
}

- (id)dictionaryRepresentation
{
  v22[8] = *MEMORY[0x1E4F143B8];
  v21[0] = kSSOnGlassCAMetalDrawableStatsKey_OnGlassStats;
  v20 = [(SSOnGlassCAMetalDrawableStats *)self onGlassIntervalStats];
  v19 = [v20 dictionaryRepresentation];
  v22[0] = v19;
  v21[1] = kSSOnGlassCAMetalDrawableStatsKey_InFlightTotalWalltimeStats;
  v18 = [(SSOnGlassCAMetalDrawableStats *)self inFlightTotalEndToEndIntervalStats];
  v17 = [v18 dictionaryRepresentation];
  v22[1] = v17;
  v21[2] = kSSOnGlassCAMetalDrawableStatsKey_InFlightCPUWalltimeStats;
  v16 = [(SSOnGlassCAMetalDrawableStats *)self inFlightCPUEndToEndIntervalStats];
  v15 = [v16 dictionaryRepresentation];
  v22[2] = v15;
  v21[3] = kSSOnGlassCAMetalDrawableStatsKey_InFlightGPUWalltimeStats;
  v3 = [(SSOnGlassCAMetalDrawableStats *)self inFlightGPUEndToEndIntervalStats];
  v4 = [v3 dictionaryRepresentation];
  v22[3] = v4;
  v21[4] = kSSOnGlassCAMetalDrawableStatsKey_InFlightOnGPUTimeStats;
  v5 = [(SSOnGlassCAMetalDrawableStats *)self inFlightOnGPUTimeStats];
  v6 = [v5 dictionaryRepresentation];
  v22[4] = v6;
  v21[5] = kSSOnGlassCAMetalDrawableStatsKey_InFlightWaitForGlassStats;
  v7 = [(SSOnGlassCAMetalDrawableStats *)self inFlightWaitForGlassStats];
  v8 = [v7 dictionaryRepresentation];
  v22[5] = v8;
  v21[6] = kSSOnGlassCAMetalDrawableStatsKey_InFlightGPUResidencyStats;
  v9 = [(SSOnGlassCAMetalDrawableStats *)self inFlightGPUResidencyStats];
  v10 = [v9 dictionaryRepresentation];
  v22[6] = v10;
  v21[7] = kSSOnGlassCAMetalDrawableStatsKey_InFlightCommandBufferCountStats;
  v11 = [(SSOnGlassCAMetalDrawableStats *)self inFlightCommandBufferCountStats];
  v12 = [v11 dictionaryRepresentation];
  v22[7] = v12;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:8];

  return v14;
}

- (SSOnGlassCAMetalDrawableStats)initWithOnGlassDrawableIntervals:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_25;
  }
  v34.receiver = self;
  v34.super_class = (Class)SSOnGlassCAMetalDrawableStats;
  self = [(SSOnGlassCAMetalDrawableStats *)&v34 init];
  if (!self) {
    goto LABEL_26;
  }
  _valuesForOnGlassIntervals(v4, &__block_literal_global_25);
  v5 = (SSOnGlassCAMetalDrawableStats *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v6 = _valuesForOnGlassIntervals(v4, &__block_literal_global_938);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = _valuesForOnGlassIntervals(v4, &__block_literal_global_940);
      if (v8)
      {
        v9 = _valuesForOnGlassIntervals(v4, &__block_literal_global_942);
        if (v9)
        {
          v10 = _valuesForOnGlassIntervals(v4, &__block_literal_global_944);
          if (v10)
          {
            v11 = _valuesForOnGlassIntervals(v4, &__block_literal_global_946);
            if (v11)
            {
              v12 = _valuesForOnGlassIntervals(v4, &__block_literal_global_948);
              if (v12)
              {
                uint64_t v13 = _valuesForOnGlassIntervals(v4, &__block_literal_global_950);
                if (v13)
                {
                  v33 = (void *)v13;
                  id v14 = [[SignpostSupportValueStats alloc] initWithValues:v5 unitsLabel:@"seconds" supportsDynamicPercentiles:0];
                  onGlassIntervalStats = self->_onGlassIntervalStats;
                  self->_onGlassIntervalStats = v14;

                  v16 = [[SignpostSupportValueStats alloc] initWithValues:v7 unitsLabel:@"seconds" supportsDynamicPercentiles:0];
                  inFlightTotalEndToEndIntervalStats = self->_inFlightTotalEndToEndIntervalStats;
                  self->_inFlightTotalEndToEndIntervalStats = v16;

                  v18 = [[SignpostSupportValueStats alloc] initWithValues:v8 unitsLabel:@"seconds" supportsDynamicPercentiles:0];
                  inFlightCPUEndToEndIntervalStats = self->_inFlightCPUEndToEndIntervalStats;
                  self->_inFlightCPUEndToEndIntervalStats = v18;

                  v20 = [[SignpostSupportValueStats alloc] initWithValues:v9 unitsLabel:@"seconds" supportsDynamicPercentiles:0];
                  inFlightGPUEndToEndIntervalStats = self->_inFlightGPUEndToEndIntervalStats;
                  self->_inFlightGPUEndToEndIntervalStats = v20;

                  v22 = [[SignpostSupportValueStats alloc] initWithValues:v10 unitsLabel:@"seconds" supportsDynamicPercentiles:0];
                  inFlightOnGPUTimeStats = self->_inFlightOnGPUTimeStats;
                  self->_inFlightOnGPUTimeStats = v22;

                  v24 = [[SignpostSupportValueStats alloc] initWithValues:v11 unitsLabel:@"seconds" supportsDynamicPercentiles:0];
                  inFlightWaitForGlassStats = self->_inFlightWaitForGlassStats;
                  self->_inFlightWaitForGlassStats = v24;

                  v26 = [[SignpostSupportValueStats alloc] initWithValues:v12 unitsLabel:@"dimensionless ratio" supportsDynamicPercentiles:0];
                  inFlightGPUResidencyStats = self->_inFlightGPUResidencyStats;
                  self->_inFlightGPUResidencyStats = v26;

                  v28 = [[SignpostSupportValueStats alloc] initWithValues:v33 unitsLabel:@"command buffer count" supportsDynamicPercentiles:0];
                  inFlightCommandBufferCountStats = self->_inFlightCommandBufferCountStats;
                  self->_inFlightCommandBufferCountStats = v28;

                  v30 = v33;
                  int v31 = 0;
                }
                else
                {
                  v30 = 0;
                  int v31 = 1;
                }
              }
              else
              {
                int v31 = 1;
              }
            }
            else
            {
              int v31 = 1;
            }
          }
          else
          {
            int v31 = 1;
          }
        }
        else
        {
          int v31 = 1;
        }
      }
      else
      {
        int v31 = 1;
      }

      if (v31) {
        goto LABEL_25;
      }
LABEL_26:
      self = self;
      v5 = self;
      goto LABEL_27;
    }

LABEL_25:
    v5 = 0;
  }
LABEL_27:

  return v5;
}

uint64_t __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 durationSeconds];

  return objc_msgSend(v2, "numberWithFloat:");
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 inFlightDrawableInterval];
  [v3 durationSeconds];
  id v4 = objc_msgSend(v2, "numberWithFloat:");

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 inFlightDrawableInterval];
  [v3 cpuEndToEndWalltime];
  id v4 = objc_msgSend(v2, "numberWithDouble:");

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 inFlightDrawableInterval];
  [v3 gpuEndToEndWalltime];
  id v4 = objc_msgSend(v2, "numberWithDouble:");

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 inFlightDrawableInterval];
  [v3 onGPUTime];
  id v4 = objc_msgSend(v2, "numberWithDouble:");

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 inFlightDrawableInterval];
  [v3 waitForGlassWalltime];
  id v4 = objc_msgSend(v2, "numberWithDouble:");

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 inFlightDrawableInterval];
  [v3 gpuResidencyRatio];
  id v4 = objc_msgSend(v2, "numberWithDouble:");

  return v4;
}

id __66__SSOnGlassCAMetalDrawableStats_initWithOnGlassDrawableIntervals___block_invoke_8(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = [a2 inFlightDrawableInterval];
  id v4 = objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "commandBufferCount"));

  return v4;
}

- (SignpostSupportValueStats)onGlassIntervalStats
{
  return self->_onGlassIntervalStats;
}

- (SignpostSupportValueStats)inFlightTotalEndToEndIntervalStats
{
  return self->_inFlightTotalEndToEndIntervalStats;
}

- (SignpostSupportValueStats)inFlightCPUEndToEndIntervalStats
{
  return self->_inFlightCPUEndToEndIntervalStats;
}

- (SignpostSupportValueStats)inFlightGPUEndToEndIntervalStats
{
  return self->_inFlightGPUEndToEndIntervalStats;
}

- (SignpostSupportValueStats)inFlightWaitForGlassStats
{
  return self->_inFlightWaitForGlassStats;
}

- (SignpostSupportValueStats)inFlightOnGPUTimeStats
{
  return self->_inFlightOnGPUTimeStats;
}

- (SignpostSupportValueStats)inFlightCommandBufferCountStats
{
  return self->_inFlightCommandBufferCountStats;
}

- (SignpostSupportValueStats)inFlightGPUResidencyStats
{
  return self->_inFlightGPUResidencyStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightGPUResidencyStats, 0);
  objc_storeStrong((id *)&self->_inFlightCommandBufferCountStats, 0);
  objc_storeStrong((id *)&self->_inFlightOnGPUTimeStats, 0);
  objc_storeStrong((id *)&self->_inFlightWaitForGlassStats, 0);
  objc_storeStrong((id *)&self->_inFlightGPUEndToEndIntervalStats, 0);
  objc_storeStrong((id *)&self->_inFlightCPUEndToEndIntervalStats, 0);
  objc_storeStrong((id *)&self->_inFlightTotalEndToEndIntervalStats, 0);

  objc_storeStrong((id *)&self->_onGlassIntervalStats, 0);
}

@end