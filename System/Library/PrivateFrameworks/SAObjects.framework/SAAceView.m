@interface SAAceView
+ (id)aceView;
- (BOOL)canBeRefreshed;
- (BOOL)canUseServerTTS;
- (BOOL)disableDeviceRacing;
- (BOOL)isTransient;
- (BOOL)preserveResultSpaceIfPossible;
- (NSDictionary)speakableContextInfo;
- (NSNumber)deferredRendering;
- (NSNumber)delayDismissalMs;
- (NSNumber)listenAfterSpeaking;
- (NSString)correspondingSessionID;
- (NSString)itemType;
- (NSString)redactedSpeakableText;
- (NSString)speakableText;
- (NSString)viewId;
- (SAAceSerializable)context;
- (SADialog)dialog;
- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior;
- (SAVoice)preferredSpeakableTextVoice;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCanBeRefreshed:(BOOL)a3;
- (void)setCanUseServerTTS:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setCorrespondingSessionID:(id)a3;
- (void)setDeferredRendering:(id)a3;
- (void)setDelayDismissalMs:(id)a3;
- (void)setDialog:(id)a3;
- (void)setDisableDeviceRacing:(BOOL)a3;
- (void)setIsTransient:(BOOL)a3;
- (void)setItemType:(id)a3;
- (void)setListenAfterSpeaking:(id)a3;
- (void)setListenAfterSpeakingBehavior:(id)a3;
- (void)setPreferredSpeakableTextVoice:(id)a3;
- (void)setPreserveResultSpaceIfPossible:(BOOL)a3;
- (void)setRedactedSpeakableText:(id)a3;
- (void)setSpeakableContextInfo:(id)a3;
- (void)setSpeakableText:(id)a3;
- (void)setViewId:(id)a3;
@end

@implementation SAAceView

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AceView";
}

+ (id)aceView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)canBeRefreshed
{
  return AceObjectBoolForProperty(self, @"canBeRefreshed");
}

- (void)setCanBeRefreshed:(BOOL)a3
{
}

- (BOOL)canUseServerTTS
{
  return AceObjectBoolForProperty(self, @"canUseServerTTS");
}

- (void)setCanUseServerTTS:(BOOL)a3
{
}

- (SAAceSerializable)context
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, @"context");
}

- (void)setContext:(id)a3
{
}

- (NSNumber)deferredRendering
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"deferredRendering"];
}

- (void)setDeferredRendering:(id)a3
{
}

- (NSNumber)delayDismissalMs
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"delayDismissalMs"];
}

- (void)setDelayDismissalMs:(id)a3
{
}

- (SADialog)dialog
{
  return (SADialog *)AceObjectAceObjectForProperty(self, @"dialog");
}

- (void)setDialog:(id)a3
{
}

- (BOOL)disableDeviceRacing
{
  return AceObjectBoolForProperty(self, @"disableDeviceRacing");
}

- (void)setDisableDeviceRacing:(BOOL)a3
{
}

- (BOOL)isTransient
{
  return AceObjectBoolForProperty(self, @"isTransient");
}

- (void)setIsTransient:(BOOL)a3
{
}

- (NSString)itemType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"itemType"];
}

- (void)setItemType:(id)a3
{
}

- (NSString)correspondingSessionID
{
  return (NSString *)[(AceObject *)self propertyForKey:@"correspondingSessionID"];
}

- (void)setCorrespondingSessionID:(id)a3
{
}

- (NSNumber)listenAfterSpeaking
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"listenAfterSpeaking"];
}

- (void)setListenAfterSpeaking:(id)a3
{
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  return (SAUIListenAfterSpeakingBehavior *)AceObjectAceObjectForProperty(self, @"listenAfterSpeakingBehavior");
}

- (void)setListenAfterSpeakingBehavior:(id)a3
{
}

- (SAVoice)preferredSpeakableTextVoice
{
  return (SAVoice *)AceObjectAceObjectForProperty(self, @"preferredSpeakableTextVoice");
}

- (void)setPreferredSpeakableTextVoice:(id)a3
{
}

- (BOOL)preserveResultSpaceIfPossible
{
  return AceObjectBoolForProperty(self, @"preserveResultSpaceIfPossible");
}

- (void)setPreserveResultSpaceIfPossible:(BOOL)a3
{
}

- (NSString)redactedSpeakableText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"redactedSpeakableText"];
}

- (void)setRedactedSpeakableText:(id)a3
{
}

- (NSDictionary)speakableContextInfo
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"speakableContextInfo"];
}

- (void)setSpeakableContextInfo:(id)a3
{
}

- (NSString)speakableText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableText"];
}

- (void)setSpeakableText:(id)a3
{
}

- (NSString)viewId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"viewId"];
}

- (void)setViewId:(id)a3
{
}

@end