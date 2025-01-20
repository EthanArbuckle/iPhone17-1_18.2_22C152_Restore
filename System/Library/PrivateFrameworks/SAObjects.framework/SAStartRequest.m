@interface SAStartRequest
+ (id)startRequest;
- (BOOL)clearContext;
- (BOOL)eyesFree;
- (BOOL)handsFree;
- (BOOL)requiresResponse;
- (BOOL)talkOnly;
- (BOOL)textToSpeechIsMuted;
- (NSNumber)isCarryDevice;
- (NSNumber)isWatchFaceRequest;
- (NSNumber)motionConfidence;
- (NSString)applicationName;
- (NSString)hardwareBuild;
- (NSString)inputOrigin;
- (NSString)motionActivity;
- (NSString)origin;
- (NSString)responseMode;
- (NSString)turnId;
- (NSString)utterance;
- (SASStartSpeech)sourceSpeechRequest;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setApplicationName:(id)a3;
- (void)setClearContext:(BOOL)a3;
- (void)setEyesFree:(BOOL)a3;
- (void)setHandsFree:(BOOL)a3;
- (void)setHardwareBuild:(id)a3;
- (void)setInputOrigin:(id)a3;
- (void)setIsCarryDevice:(id)a3;
- (void)setIsWatchFaceRequest:(id)a3;
- (void)setMotionActivity:(id)a3;
- (void)setMotionConfidence:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setResponseMode:(id)a3;
- (void)setSourceSpeechRequest:(id)a3;
- (void)setTalkOnly:(BOOL)a3;
- (void)setTextToSpeechIsMuted:(BOOL)a3;
- (void)setTurnId:(id)a3;
- (void)setUtterance:(id)a3;
@end

@implementation SAStartRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StartRequest";
}

+ (id)startRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)origin
{
  return (NSString *)[(AceObject *)self propertyForKey:@"origin"];
}

- (void)setOrigin:(id)a3
{
}

- (NSString)applicationName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"applicationName"];
}

- (void)setApplicationName:(id)a3
{
}

- (BOOL)clearContext
{
  return AceObjectBoolForProperty(self, @"clearContext");
}

- (void)setClearContext:(BOOL)a3
{
}

- (BOOL)eyesFree
{
  return AceObjectBoolForProperty(self, @"eyesFree");
}

- (void)setEyesFree:(BOOL)a3
{
}

- (BOOL)handsFree
{
  return AceObjectBoolForProperty(self, @"handsFree");
}

- (void)setHandsFree:(BOOL)a3
{
}

- (NSString)hardwareBuild
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hardwareBuild"];
}

- (void)setHardwareBuild:(id)a3
{
}

- (NSString)inputOrigin
{
  return (NSString *)[(AceObject *)self propertyForKey:@"inputOrigin"];
}

- (void)setInputOrigin:(id)a3
{
}

- (NSNumber)isCarryDevice
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isCarryDevice"];
}

- (void)setIsCarryDevice:(id)a3
{
}

- (NSNumber)isWatchFaceRequest
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isWatchFaceRequest"];
}

- (void)setIsWatchFaceRequest:(id)a3
{
}

- (NSString)motionActivity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"motionActivity"];
}

- (void)setMotionActivity:(id)a3
{
}

- (NSNumber)motionConfidence
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"motionConfidence"];
}

- (void)setMotionConfidence:(id)a3
{
}

- (NSString)responseMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"responseMode"];
}

- (void)setResponseMode:(id)a3
{
}

- (SASStartSpeech)sourceSpeechRequest
{
  return (SASStartSpeech *)AceObjectAceObjectForProperty(self, @"sourceSpeechRequest");
}

- (void)setSourceSpeechRequest:(id)a3
{
}

- (BOOL)talkOnly
{
  return AceObjectBoolForProperty(self, @"talkOnly");
}

- (void)setTalkOnly:(BOOL)a3
{
}

- (BOOL)textToSpeechIsMuted
{
  return AceObjectBoolForProperty(self, @"textToSpeechIsMuted");
}

- (void)setTextToSpeechIsMuted:(BOOL)a3
{
}

- (NSString)turnId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"turnId"];
}

- (void)setTurnId:(id)a3
{
}

- (NSString)utterance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utterance"];
}

- (void)setUtterance:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end