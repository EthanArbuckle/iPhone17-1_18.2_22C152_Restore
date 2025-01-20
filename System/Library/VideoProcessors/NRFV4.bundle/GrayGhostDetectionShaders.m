@interface GrayGhostDetectionShaders
- (GrayGhostDetectionShaders)initWithMetal:(id)a3;
@end

@implementation GrayGhostDetectionShaders

- (GrayGhostDetectionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GrayGhostDetectionShaders;
  v5 = [(GrayGhostDetectionShaders *)&v12 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"computeGrayGhostCount" constants:0];
  computeGrayGhostCount = v5->_computeGrayGhostCount;
  v5->_computeGrayGhostCount = (MTLComputePipelineState *)v6;

  if (!v5->_computeGrayGhostCount) {
    goto LABEL_6;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"computeGrayGhostCountRGB" constants:0];
  computeGrayGhostCountRGB = v5->_computeGrayGhostCountRGB;
  v5->_computeGrayGhostCountRGB = (MTLComputePipelineState *)v8;

  if (v5->_computeGrayGhostCountRGB)
  {
LABEL_4:
    v10 = v5;
  }
  else
  {
LABEL_6:
    FigDebugAssert3();
    FigSignalErrorAt();
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeGrayGhostCountRGB, 0);

  objc_storeStrong((id *)&self->_computeGrayGhostCount, 0);
}

@end