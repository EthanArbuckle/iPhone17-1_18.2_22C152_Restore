@interface RTVisitHyperParameterBatchMode
- (RTVisitHyperParameterBatchMode)init;
@end

@implementation RTVisitHyperParameterBatchMode

- (RTVisitHyperParameterBatchMode)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTVisitHyperParameterBatchMode;
  v2 = [(RTVisitHyperParameterBatchMode *)&v6 init];
  v3 = v2;
  if (v2)
  {
    uuid = v2->super._uuid;
    v2->super._version = 0;
    v2->super._uuid = (NSString *)@"b3418fd9-c85d-4955-a6dc-cf1bc41d3b34";

    v3->super._maxBurstNoiseLength = 5;
    *(_OWORD *)&v3->super._maxHorizontalAccuracy = xmmword_1DA0FEEF0;
    *(_OWORD *)&v3->super._minNoiseToLeftFlankDistance = xmmword_1DA0FEF00;
    *(_OWORD *)&v3->super._smootherKernelWidth = xmmword_1DA0FEF10;
    v3->super._maxDistanceBetweenAdjacentPoints = 500;
    v3->super._minSpeedToFilter = 10.0;
    *(_OWORD *)&v3->super._movingWindowSizeForSpeed = xmmword_1DA0FEF20;
    *(_OWORD *)&v3->super._decoderEntryCost = xmmword_1DA0FEF30;
    v3->super._featureDimension = 3;
    *(_OWORD *)&v3->super._featureDistanceMax = xmmword_1DA0FEF40;
    *(_OWORD *)&v3->super._featureDwellnessLogMax = xmmword_1DA0FEF50;
    v3->super._featurePaddingValue = 0;
    *(_OWORD *)&v3->super._featureRadiusMax = xmmword_1DA0FEF60;
    v3->super._maxSequenceLength = 60;
    *(int64x2_t *)&v3->super._minEntryProbability = vdupq_n_s64(0x3F747AE147AE147BuLL);
    v3->super._minInferenceInterval = 300;
    v3->super._minNoVisitProbability = 0.005;
    *(_OWORD *)&v3->super._minSequenceLength = xmmword_1DA0FEF70;
    *(_OWORD *)&v3->super._numOfSlide = xmmword_1DA0FEF80;
    v3->super._numOfTimeStepForDwellness = 5;
    *(_OWORD *)&v3->super._numOfTimeStepForRadius = xmmword_1DA0FEF90;
    *(_OWORD *)&v3->super._onDeviceInferenceBatchSize = xmmword_1DA0FEFA0;
    *(int64x2_t *)&v3->super._referenceSize = vdupq_n_s64(4uLL);
    *(_OWORD *)&v3->super._timeStepInterval = xmmword_1DA0FEFB0;
    *(_OWORD *)&v3->super._windowInterval = xmmword_1DA0FEFC0;
    *(_OWORD *)&v3->super._binSize = xmmword_1DA0FEFD0;
  }
  return v3;
}

@end