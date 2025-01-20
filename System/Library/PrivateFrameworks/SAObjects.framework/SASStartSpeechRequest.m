@interface SASStartSpeechRequest
+ (id)startSpeechRequest;
- (BOOL)autoPunctuationEnabled;
- (BOOL)eyesFree;
- (BOOL)handsFree;
- (BOOL)requiresResponse;
- (BOOL)talkOnly;
- (BOOL)textToSpeechIsMuted;
- (BOOL)wasLaunchedForRequest;
- (NSArray)bargeInModes;
- (NSArray)voiceTriggerPhrases;
- (NSNumber)durationSincePreviousTTSFinish;
- (NSNumber)durationSincePreviousTTSStart;
- (NSString)clientModelVersion;
- (NSString)responseMode;
- (SASetRequestOrigin)setRequestOrigin;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAutoPunctuationEnabled:(BOOL)a3;
- (void)setBargeInModes:(id)a3;
- (void)setClientModelVersion:(id)a3;
- (void)setDurationSincePreviousTTSFinish:(id)a3;
- (void)setDurationSincePreviousTTSStart:(id)a3;
- (void)setEyesFree:(BOOL)a3;
- (void)setHandsFree:(BOOL)a3;
- (void)setResponseMode:(id)a3;
- (void)setSetRequestOrigin:(id)a3;
- (void)setTalkOnly:(BOOL)a3;
- (void)setTextToSpeechIsMuted:(BOOL)a3;
- (void)setVoiceTriggerPhrases:(id)a3;
- (void)setWasLaunchedForRequest:(BOOL)a3;
@end

@implementation SASStartSpeechRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"StartSpeechRequest";
}

+ (id)startSpeechRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)autoPunctuationEnabled
{
  return AceObjectBoolForProperty(self, @"autoPunctuationEnabled");
}

- (void)setAutoPunctuationEnabled:(BOOL)a3
{
}

- (NSArray)bargeInModes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"bargeInModes"];
}

- (void)setBargeInModes:(id)a3
{
}

- (NSString)clientModelVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"clientModelVersion"];
}

- (void)setClientModelVersion:(id)a3
{
}

- (NSNumber)durationSincePreviousTTSFinish
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"durationSincePreviousTTSFinish"];
}

- (void)setDurationSincePreviousTTSFinish:(id)a3
{
}

- (NSNumber)durationSincePreviousTTSStart
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"durationSincePreviousTTSStart"];
}

- (void)setDurationSincePreviousTTSStart:(id)a3
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

- (NSString)responseMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"responseMode"];
}

- (void)setResponseMode:(id)a3
{
}

- (SASetRequestOrigin)setRequestOrigin
{
  return (SASetRequestOrigin *)AceObjectAceObjectForProperty(self, @"setRequestOrigin");
}

- (void)setSetRequestOrigin:(id)a3
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

- (NSArray)voiceTriggerPhrases
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"voiceTriggerPhrases"];
}

- (void)setVoiceTriggerPhrases:(id)a3
{
}

- (BOOL)wasLaunchedForRequest
{
  return AceObjectBoolForProperty(self, @"wasLaunchedForRequest");
}

- (void)setWasLaunchedForRequest:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end