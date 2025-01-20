@interface GainMapShaders
- (GainMapShaders)initWithMetal:(id)a3;
@end

@implementation GainMapShaders

- (GainMapShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_17;
  }
  v28.receiver = self;
  v28.super_class = (Class)GainMapShaders;
  self = [(GainMapShaders *)&v28 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_14;
  }
  v5 = [v4 computePipelineStateFor:@"GainMap" constants:0];
  gainMapFilter = self->_gainMapFilter;
  self->_gainMapFilter = v5;

  if (!self->_gainMapFilter) {
    goto LABEL_17;
  }
  v7 = [v4 computePipelineStateFor:@"GainMapDownsampled" constants:0];
  gainMapDownsampledFilter = self->_gainMapDownsampledFilter;
  self->_gainMapDownsampledFilter = v7;

  if (!self->_gainMapDownsampledFilter) {
    goto LABEL_17;
  }
  v9 = [v4 computePipelineStateFor:@"MPPGainMap420" constants:0];
  MPPGainMap420 = self->_MPPGainMap420;
  self->_MPPGainMap420 = v9;

  if (!self->_MPPGainMap420) {
    goto LABEL_17;
  }
  v11 = [v4 computePipelineStateFor:@"MPPGainMapRGB" constants:0];
  MPPGainMapRGB = self->_MPPGainMapRGB;
  self->_MPPGainMapRGB = v11;

  if (!self->_MPPGainMapRGB) {
    goto LABEL_17;
  }
  v13 = [v4 computePipelineStateFor:@"MPPHistogram" constants:0];
  MPPHistogram = self->_MPPHistogram;
  self->_MPPHistogram = v13;

  if (!self->_MPPHistogram) {
    goto LABEL_17;
  }
  v15 = [v4 computePipelineStateFor:@"MPPHistExtract" constants:0];
  MPPHistExtract = self->_MPPHistExtract;
  self->_MPPHistExtract = v15;

  if (!self->_MPPHistExtract) {
    goto LABEL_17;
  }
  v17 = [v4 computePipelineStateFor:@"MPPGainMapAdjust" constants:0];
  MPPGainMapAdjust = self->_MPPGainMapAdjust;
  self->_MPPGainMapAdjust = v17;

  if (!self->_MPPGainMapAdjust) {
    goto LABEL_17;
  }
  v19 = [v4 computePipelineStateFor:@"MPPGainMapAdjustFlexRange" constants:0];
  MPPGainMapAdjustFlexRange = self->_MPPGainMapAdjustFlexRange;
  self->_MPPGainMapAdjustFlexRange = v19;

  if (!self->_MPPGainMapAdjustFlexRange) {
    goto LABEL_17;
  }
  v21 = [v4 computePipelineStateFor:@"MPPLogGainMapMinMax" constants:0];
  MPPLogGainMapMinMax = self->_MPPLogGainMapMinMax;
  self->_MPPLogGainMapMinMax = v21;

  if (!self->_MPPLogGainMapMinMax) {
    goto LABEL_17;
  }
  v23 = [v4 computePipelineStateFor:@"MPPFlexRangeCompressTo10BitInt" constants:0];
  MPPFlexRangeCompressTo10BitInt = self->_MPPFlexRangeCompressTo10BitInt;
  self->_MPPFlexRangeCompressTo10BitInt = v23;

  if (!self->_MPPFlexRangeCompressTo10BitInt
    || ([v4 computePipelineStateFor:@"MPPFlexRangeCompressTo8BitInt" constants:0],
        v25 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        MPPFlexRangeCompressTo8BitInt = self->_MPPFlexRangeCompressTo8BitInt,
        self->_MPPFlexRangeCompressTo8BitInt = v25,
        MPPFlexRangeCompressTo8BitInt,
        !self->_MPPFlexRangeCompressTo8BitInt))
  {
LABEL_17:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_14:

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MPPFlexRangeCompressTo8BitInt, 0);
  objc_storeStrong((id *)&self->_MPPFlexRangeCompressTo10BitInt, 0);
  objc_storeStrong((id *)&self->_MPPLogGainMapMinMax, 0);
  objc_storeStrong((id *)&self->_MPPGainMapAdjustFlexRange, 0);
  objc_storeStrong((id *)&self->_MPPGainMapAdjust, 0);
  objc_storeStrong((id *)&self->_MPPHistExtract, 0);
  objc_storeStrong((id *)&self->_MPPHistogram, 0);
  objc_storeStrong((id *)&self->_MPPGainMapRGB, 0);
  objc_storeStrong((id *)&self->_MPPGainMap420, 0);
  objc_storeStrong((id *)&self->_gainMapDownsampledFilter, 0);

  objc_storeStrong((id *)&self->_gainMapFilter, 0);
}

@end