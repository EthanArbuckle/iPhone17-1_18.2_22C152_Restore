@interface WBSPrivacyReportMetrics
- (NSString)mostSeenKnownTrackerDomain;
- (WBSPrivacyReportMetrics)initWithDictionaryRepresentation:(id)a3;
- (double)ratioOfTrackedFirstPartiesToAllVisited;
- (id)dictionaryRepresentation;
- (unint64_t)mostSeenKnownTrackerFirstParties;
- (unint64_t)numberOfTrackers;
- (void)setMostSeenKnownTrackerDomain:(id)a3;
- (void)setMostSeenKnownTrackerFirstParties:(unint64_t)a3;
- (void)setNumberOfTrackers:(unint64_t)a3;
- (void)setRatioOfTrackedFirstPartiesToAllVisited:(double)a3;
@end

@implementation WBSPrivacyReportMetrics

- (WBSPrivacyReportMetrics)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(WBSPrivacyReportMetrics *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "safari_numberForKey:", @"numberOfTrackers");
    v5->_numberOfTrackers = [v6 integerValue];

    v7 = objc_msgSend(v4, "safari_numberForKey:", @"ratioOfTrackedFirstPartiesToAllVisited");
    [v7 doubleValue];
    v5->_ratioOfTrackedFirstPartiesToAllVisited = v8;

    uint64_t v9 = objc_msgSend(v4, "safari_stringForKey:", @"mostSeenKnownTrackerDomain");
    mostSeenKnownTrackerDomain = v5->_mostSeenKnownTrackerDomain;
    v5->_mostSeenKnownTrackerDomain = (NSString *)v9;

    v11 = objc_msgSend(v4, "safari_numberForKey:", @"numberOfFirstParties");
    v5->_mostSeenKnownTrackerFirstParties = [v11 integerValue];

    v12 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"numberOfTrackers";
  v3 = [NSNumber numberWithUnsignedInteger:self->_numberOfTrackers];
  v12[0] = v3;
  v11[1] = @"ratioOfTrackedFirstPartiesToAllVisited";
  uint64_t v4 = [NSNumber numberWithDouble:self->_ratioOfTrackedFirstPartiesToAllVisited];
  v5 = (void *)v4;
  mostSeenKnownTrackerDomain = &stru_1F031A860;
  unint64_t mostSeenKnownTrackerFirstParties = self->_mostSeenKnownTrackerFirstParties;
  if (self->_mostSeenKnownTrackerDomain) {
    mostSeenKnownTrackerDomain = (__CFString *)self->_mostSeenKnownTrackerDomain;
  }
  v12[1] = v4;
  v12[2] = mostSeenKnownTrackerDomain;
  v11[2] = @"mostSeenKnownTrackerDomain";
  v11[3] = @"numberOfFirstParties";
  double v8 = [NSNumber numberWithUnsignedInteger:mostSeenKnownTrackerFirstParties];
  v12[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (unint64_t)numberOfTrackers
{
  return self->_numberOfTrackers;
}

- (void)setNumberOfTrackers:(unint64_t)a3
{
  self->_numberOfTrackers = a3;
}

- (double)ratioOfTrackedFirstPartiesToAllVisited
{
  return self->_ratioOfTrackedFirstPartiesToAllVisited;
}

- (void)setRatioOfTrackedFirstPartiesToAllVisited:(double)a3
{
  self->_ratioOfTrackedFirstPartiesToAllVisited = a3;
}

- (NSString)mostSeenKnownTrackerDomain
{
  return self->_mostSeenKnownTrackerDomain;
}

- (void)setMostSeenKnownTrackerDomain:(id)a3
{
}

- (unint64_t)mostSeenKnownTrackerFirstParties
{
  return self->_mostSeenKnownTrackerFirstParties;
}

- (void)setMostSeenKnownTrackerFirstParties:(unint64_t)a3
{
  self->_unint64_t mostSeenKnownTrackerFirstParties = a3;
}

- (void).cxx_destruct
{
}

@end