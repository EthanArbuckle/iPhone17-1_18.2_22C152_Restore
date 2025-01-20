@interface GrayGhostDetectionShaders
- (GrayGhostDetectionShaders)initWithMetal:(id)a3;
@end

@implementation GrayGhostDetectionShaders

- (GrayGhostDetectionShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GrayGhostDetectionShaders;
  v6 = [(GrayGhostDetectionShaders *)&v11 init];
  if (v6
    && (objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"computeGrayGhostCount", 0),
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        computeGrayGhostCount = v6->_computeGrayGhostCount,
        v6->_computeGrayGhostCount = (MTLComputePipelineState *)v7,
        computeGrayGhostCount,
        !v6->_computeGrayGhostCount))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end