@interface TCHumanActionRecognitionTrainer
+ (id)graphsForSTGCNOptions:(id)a3;
@end

@implementation TCHumanActionRecognitionTrainer

+ (id)graphsForSTGCNOptions:(id)a3
{
  id v3 = a3;
  [v3 validate];
  std::string::basic_string[abi:ne180100]<0>(&__p, "targetProbabilities");
  [v3 numClasses];
  [v3 numKeypoints];
  [v3 numFrames];
  turi::proprietary::human_action_recognition::init_human_action_recognition();
}

@end