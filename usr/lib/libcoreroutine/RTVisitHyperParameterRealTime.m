@interface RTVisitHyperParameterRealTime
- (RTVisitHyperParameterRealTime)init;
@end

@implementation RTVisitHyperParameterRealTime

- (RTVisitHyperParameterRealTime)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTVisitHyperParameterRealTime;
  v2 = [(RTVisitHyperParameterRealTime *)&v6 init];
  v3 = v2;
  if (v2)
  {
    uuid = v2->super._uuid;
    v2->super._version = 0;
    v2->super._uuid = (NSString *)@"a21bbfb6-0419-4389-8d87-a01d27873461";

    v3->super._maxBurstNoiseLength = 2;
    *(_OWORD *)&v3->super._maxHorizontalAccuracy = xmmword_1DA0FF900;
    *(_OWORD *)&v3->super._minNoiseToLeftFlankDistance = xmmword_1DA0FF910;
    *(_OWORD *)&v3->super._smootherKernelWidth = xmmword_1DA0FF920;
    v3->super._maxDistanceBetweenAdjacentPoints = 500;
    v3->super._minSpeedToFilter = 10.0;
    *(_OWORD *)&v3->super._movingWindowSizeForSpeed = xmmword_1DA0FEF20;
    *(_OWORD *)&v3->super._decoderEntryCost = xmmword_1DA0FEF30;
    v3->super._featureDimension = 3;
    *(_OWORD *)&v3->super._featureDistanceMax = xmmword_1DA0FEF40;
    *(_OWORD *)&v3->super._featureDwellnessLogMax = xmmword_1DA0FEF50;
    v3->super._featurePaddingValue = 1;
    *(_OWORD *)&v3->super._featureRadiusMax = xmmword_1DA0FEF60;
    v3->super._maxSequenceLength = 60;
    *(_OWORD *)&v3->super._minEntryProbability = xmmword_1DA0FF930;
    v3->super._minInferenceInterval = 300;
    v3->super._minNoVisitProbability = 0.5;
    *(_OWORD *)&v3->super._minSequenceLength = xmmword_1DA0FEF70;
    *(_OWORD *)&v3->super._numOfSlide = xmmword_1DA0FEF80;
    v3->super._numOfTimeStepForDwellness = 5;
    *(_OWORD *)&v3->super._numOfTimeStepForRadius = xmmword_1DA0FEF90;
    *(_OWORD *)&v3->super._onDeviceInferenceBatchSize = xmmword_1DA0FEFA0;
    *(int64x2_t *)&v3->super._referenceSize = vdupq_n_s64(0xCuLL);
    *(_OWORD *)&v3->super._timeStepInterval = xmmword_1DA0FEFB0;
    *(_OWORD *)&v3->super._windowInterval = xmmword_1DA0FF940;
    *(int64x2_t *)&v3->super._binSize = vdupq_n_s64(0xAuLL);
  }
  return v3;
}

@end