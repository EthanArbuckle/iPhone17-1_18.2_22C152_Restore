@interface WiFiUsageSessionCAConfig
- (BOOL)canSubmit;
- (NSDate)ca_lastSubmission;
- (WiFiUsageSessionCAConfig)initWithSampling:(unint64_t)a3 minInterval:(double)a4;
- (double)ca_minTimeIntervalBetweenSubmissions;
- (id)description;
- (unint64_t)ca_sampling;
- (void)countSubmission;
@end

@implementation WiFiUsageSessionCAConfig

- (WiFiUsageSessionCAConfig)initWithSampling:(unint64_t)a3 minInterval:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageSessionCAConfig;
  v6 = [(WiFiUsageSessionCAConfig *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_ca_sampling = a3;
    v6->_ca_minTimeIntervalBetweenSubmissions = a4;
    ca_lastSubmission = v6->_ca_lastSubmission;
    v6->_ca_lastSubmission = 0;
  }
  return v7;
}

- (void)countSubmission
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  ca_lastSubmission = self->_ca_lastSubmission;
  self->_ca_lastSubmission = v3;

  MEMORY[0x1F41817F8](v3, ca_lastSubmission, v4);
}

- (BOOL)canSubmit
{
  if (self->_ca_lastSubmission)
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
    [v3 timeIntervalSinceDate:self->_ca_lastSubmission];
    double v5 = v4;
    double ca_minTimeIntervalBetweenSubmissions = self->_ca_minTimeIntervalBetweenSubmissions;

    if (v5 < ca_minTimeIntervalBetweenSubmissions) {
      return 0;
    }
  }
  unint64_t ca_sampling = self->_ca_sampling;

  return +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:ca_sampling];
}

- (id)description
{
  v3 = NSString;
  double v4 = +[WiFiUsagePrivacyFilter describeSampleRate:self->_ca_sampling];
  double v5 = +[WiFiUsagePrivacyFilter getHumanSecondsFromTimeInterval:self->_ca_minTimeIntervalBetweenSubmissions];
  v6 = [v3 stringWithFormat:@"samplingRate:%@, minTimeInterval:%@ lastSubmission:%@", v4, v5, self->_ca_lastSubmission];

  return v6;
}

- (unint64_t)ca_sampling
{
  return self->_ca_sampling;
}

- (double)ca_minTimeIntervalBetweenSubmissions
{
  return self->_ca_minTimeIntervalBetweenSubmissions;
}

- (NSDate)ca_lastSubmission
{
  return self->_ca_lastSubmission;
}

- (void).cxx_destruct
{
}

@end