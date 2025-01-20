@interface SAIntentGroupSiriKitMetrics
+ (id)siriKitMetrics;
- (NSNumber)taskStepStartTime;
- (NSString)intentTypeName;
- (NSString)interactionId;
- (NSString)metricsStateOrigin;
- (NSString)resultCandidateId;
- (NSString)taskId;
- (NSString)turnId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntentTypeName:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setMetricsStateOrigin:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setTaskId:(id)a3;
- (void)setTaskStepStartTime:(id)a3;
- (void)setTurnId:(id)a3;
@end

@implementation SAIntentGroupSiriKitMetrics

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SiriKitMetrics";
}

+ (id)siriKitMetrics
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)intentTypeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"intentTypeName"];
}

- (void)setIntentTypeName:(id)a3
{
}

- (NSString)interactionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionId"];
}

- (void)setInteractionId:(id)a3
{
}

- (NSString)metricsStateOrigin
{
  return (NSString *)[(AceObject *)self propertyForKey:@"metricsStateOrigin"];
}

- (void)setMetricsStateOrigin:(id)a3
{
}

- (NSString)resultCandidateId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultCandidateId"];
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)taskId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"taskId"];
}

- (void)setTaskId:(id)a3
{
}

- (NSNumber)taskStepStartTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"taskStepStartTime"];
}

- (void)setTaskStepStartTime:(id)a3
{
}

- (NSString)turnId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"turnId"];
}

- (void)setTurnId:(id)a3
{
}

@end