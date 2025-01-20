@interface SiriVoiceTriggerContext
- (id)description;
@end

@implementation SiriVoiceTriggerContext

- (id)description
{
  v3 = NSString;
  v4 = [(SiriContext *)self contextOverride];
  v5 = [(SiriContinuityContext *)self speechRequestOptions];
  v6 = [(SiriContinuityContext *)self requestInfo];
  v7 = [(SiriContinuityContext *)self userActivity];
  v8 = [v3 stringWithFormat:@"<SiriVoiceTriggerContext contextOverride:%@, speechRequestOptions:%@, requestInfo:%@, userActivity:%@>", v4, v5, v6, v7];

  return v8;
}

@end