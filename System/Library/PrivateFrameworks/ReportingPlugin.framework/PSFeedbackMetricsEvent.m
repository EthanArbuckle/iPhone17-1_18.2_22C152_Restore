@interface PSFeedbackMetricsEvent
- (PSFeedbackMetricsEvent)initWithId:(id)a3 type:(int64_t)a4 engagedSuggestionId:(id)a5 airdropOptionPresent:(BOOL)a6 visiblePeopleSuggestionCount:(unsigned __int8)a7 visibleAppSuggestionCount:(unsigned __int8)a8 trialExperimentId:(id)a9 trialTreatmentId:(id)a10 trialDeploymentId:(id)a11 peopleSuggestionTimeoutOccurred:(BOOL)a12;
- (_PSFeedbackMetricsEventInternal)underlyingObject;
@end

@implementation PSFeedbackMetricsEvent

- (PSFeedbackMetricsEvent)initWithId:(id)a3 type:(int64_t)a4 engagedSuggestionId:(id)a5 airdropOptionPresent:(BOOL)a6 visiblePeopleSuggestionCount:(unsigned __int8)a7 visibleAppSuggestionCount:(unsigned __int8)a8 trialExperimentId:(id)a9 trialTreatmentId:(id)a10 trialDeploymentId:(id)a11 peopleSuggestionTimeoutOccurred:(BOOL)a12
{
  HIDWORD(v27) = a8;
  uint64_t v12 = a7;
  BOOL v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)PSFeedbackMetricsEvent;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a5;
  id v21 = a3;
  v22 = [(PSFeedbackMetricsEvent *)&v28 init];
  v23 = [_PSFeedbackMetricsEventInternal alloc];
  LOBYTE(v27) = a12;
  uint64_t v24 = -[_PSFeedbackMetricsEventInternal initWithId:type:engagedSuggestionId:airdropOptionPresent:visiblePeopleSuggestionCount:visibleAppSuggestionCount:trialExperimentId:trialTreatmentId:trialDeploymentId:peopleSuggestionsTimeoutOccurred:](v23, "initWithId:type:engagedSuggestionId:airdropOptionPresent:visiblePeopleSuggestionCount:visibleAppSuggestionCount:trialExperimentId:trialTreatmentId:trialDeploymentId:peopleSuggestionsTimeoutOccurred:", v21, a4, v20, v13, v12, HIDWORD(v27), v19, v18, v17, v27, v28.receiver, v28.super_class);

  underlyingObject = v22->_underlyingObject;
  v22->_underlyingObject = (_PSFeedbackMetricsEventInternal *)v24;

  return v22;
}

- (_PSFeedbackMetricsEventInternal)underlyingObject
{
  return (_PSFeedbackMetricsEventInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end