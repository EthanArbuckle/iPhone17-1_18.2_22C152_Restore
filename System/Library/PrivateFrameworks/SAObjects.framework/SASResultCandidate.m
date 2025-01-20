@interface SASResultCandidate
+ (id)resultCandidate;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSNumber)latticeRnnMitigatorCalibrationOffset;
- (NSNumber)latticeRnnMitigatorCalibrationScale;
- (NSNumber)latticeRnnMitigatorIsProcessed;
- (NSNumber)processedAudioDuration;
- (NSNumber)speechProfileUsed;
- (NSString)latticeRnnMitigatorModelId;
- (NSString)resultId;
- (NSString)speechRecognitionTask;
- (SASRecognition)filteredRecognition;
- (SASRecognition)recognition;
- (double)latticeRnnMitigatorScore;
- (double)latticeRnnMitigatorThreshold;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFilteredRecognition:(id)a3;
- (void)setLatticeRnnMitigatorCalibrationOffset:(id)a3;
- (void)setLatticeRnnMitigatorCalibrationScale:(id)a3;
- (void)setLatticeRnnMitigatorIsProcessed:(id)a3;
- (void)setLatticeRnnMitigatorModelId:(id)a3;
- (void)setLatticeRnnMitigatorScore:(double)a3;
- (void)setLatticeRnnMitigatorThreshold:(double)a3;
- (void)setProcessedAudioDuration:(id)a3;
- (void)setRecognition:(id)a3;
- (void)setResultId:(id)a3;
- (void)setSpeechProfileUsed:(id)a3;
- (void)setSpeechRecognitionTask:(id)a3;
@end

@implementation SASResultCandidate

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"ResultCandidate";
}

+ (id)resultCandidate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASRecognition)filteredRecognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"filteredRecognition");
}

- (void)setFilteredRecognition:(id)a3
{
}

- (NSNumber)latticeRnnMitigatorCalibrationOffset
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"latticeRnnMitigatorCalibrationOffset"];
}

- (void)setLatticeRnnMitigatorCalibrationOffset:(id)a3
{
}

- (NSNumber)latticeRnnMitigatorCalibrationScale
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"latticeRnnMitigatorCalibrationScale"];
}

- (void)setLatticeRnnMitigatorCalibrationScale:(id)a3
{
}

- (NSNumber)latticeRnnMitigatorIsProcessed
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"latticeRnnMitigatorIsProcessed"];
}

- (void)setLatticeRnnMitigatorIsProcessed:(id)a3
{
}

- (NSString)latticeRnnMitigatorModelId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"latticeRnnMitigatorModelId"];
}

- (void)setLatticeRnnMitigatorModelId:(id)a3
{
}

- (double)latticeRnnMitigatorScore
{
  return AceObjectDoubleForProperty(self, @"latticeRnnMitigatorScore");
}

- (void)setLatticeRnnMitigatorScore:(double)a3
{
}

- (double)latticeRnnMitigatorThreshold
{
  return AceObjectDoubleForProperty(self, @"latticeRnnMitigatorThreshold");
}

- (void)setLatticeRnnMitigatorThreshold:(double)a3
{
}

- (NSNumber)processedAudioDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"processedAudioDuration"];
}

- (void)setProcessedAudioDuration:(id)a3
{
}

- (SASRecognition)recognition
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, @"recognition");
}

- (void)setRecognition:(id)a3
{
}

- (NSString)resultId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultId"];
}

- (void)setResultId:(id)a3
{
}

- (NSNumber)speechProfileUsed
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"speechProfileUsed"];
}

- (void)setSpeechProfileUsed:(id)a3
{
}

- (NSString)speechRecognitionTask
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speechRecognitionTask"];
}

- (void)setSpeechRecognitionTask:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end