@interface TCActivityClassifierTrainer
+ (id)graphsForOptions:(id)a3;
@end

@implementation TCActivityClassifierTrainer

+ (id)graphsForOptions:(id)a3
{
  id v3 = a3;
  v14[0] = 0;
  v14[1] = 0;
  v13 = v14;
  int v7 = [v3 batchSize];
  int v8 = [v3 numFeatures];
  int v9 = [v3 predictionWindow];
  int v10 = [v3 numClasses];
  int v11 = [v3 numPredictionsPerChunk];
  int v12 = [v3 randomSeed];
  std::string::basic_string[abi:ne180100]<0>(&__p, "target");
  std::vector<std::string>::vector(&v5, [v3 numFeatures]);
  [v3 predictionWindow];
  [v3 numClasses];
  [v3 randomSeed];
  turi::activity_classification::activity_classifier::init_model((uint64_t)&__p, (uint64_t)&v5);
}

@end