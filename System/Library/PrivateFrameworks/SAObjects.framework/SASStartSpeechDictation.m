@interface SASStartSpeechDictation
+ (id)startSpeechDictation;
- (BOOL)autoPunctuation;
- (BOOL)censorSpeech;
- (BOOL)requiresResponse;
- (BOOL)saveRequestAudio;
- (BOOL)speakerIndependentRecognition;
- (NSArray)inlineItemList;
- (NSArray)languages;
- (NSData)activationToken;
- (NSString)applicationName;
- (NSString)applicationVersion;
- (NSString)fieldId;
- (NSString)fieldLabel;
- (NSString)interactionId;
- (NSString)keyboardIdentifier;
- (NSString)keyboardReturnKey;
- (NSString)keyboardType;
- (NSString)language;
- (NSString)postfixText;
- (NSString)prefixText;
- (NSString)region;
- (NSString)selectedText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivationToken:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setAutoPunctuation:(BOOL)a3;
- (void)setCensorSpeech:(BOOL)a3;
- (void)setFieldId:(id)a3;
- (void)setFieldLabel:(id)a3;
- (void)setInlineItemList:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setKeyboardIdentifier:(id)a3;
- (void)setKeyboardReturnKey:(id)a3;
- (void)setKeyboardType:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLanguages:(id)a3;
- (void)setPostfixText:(id)a3;
- (void)setPrefixText:(id)a3;
- (void)setRegion:(id)a3;
- (void)setSaveRequestAudio:(BOOL)a3;
- (void)setSelectedText:(id)a3;
- (void)setSpeakerIndependentRecognition:(BOOL)a3;
@end

@implementation SASStartSpeechDictation

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"StartSpeechDictation";
}

+ (id)startSpeechDictation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)activationToken
{
  return (NSData *)[(AceObject *)self propertyForKey:@"activationToken"];
}

- (void)setActivationToken:(id)a3
{
}

- (NSString)applicationName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"applicationName"];
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"applicationVersion"];
}

- (void)setApplicationVersion:(id)a3
{
}

- (BOOL)autoPunctuation
{
  return AceObjectBoolForProperty(self, @"autoPunctuation");
}

- (void)setAutoPunctuation:(BOOL)a3
{
}

- (BOOL)censorSpeech
{
  return AceObjectBoolForProperty(self, @"censorSpeech");
}

- (void)setCensorSpeech:(BOOL)a3
{
}

- (NSString)fieldId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fieldId"];
}

- (void)setFieldId:(id)a3
{
}

- (NSString)fieldLabel
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fieldLabel"];
}

- (void)setFieldLabel:(id)a3
{
}

- (NSArray)inlineItemList
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"inlineItemList"];
}

- (void)setInlineItemList:(id)a3
{
}

- (NSString)interactionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionId"];
}

- (void)setInteractionId:(id)a3
{
}

- (NSString)keyboardIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"keyboardIdentifier"];
}

- (void)setKeyboardIdentifier:(id)a3
{
}

- (NSString)keyboardReturnKey
{
  return (NSString *)[(AceObject *)self propertyForKey:@"keyboardReturnKey"];
}

- (void)setKeyboardReturnKey:(id)a3
{
}

- (NSString)keyboardType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"keyboardType"];
}

- (void)setKeyboardType:(id)a3
{
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (NSArray)languages
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"languages"];
}

- (void)setLanguages:(id)a3
{
}

- (NSString)postfixText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"postfixText"];
}

- (void)setPostfixText:(id)a3
{
}

- (NSString)prefixText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"prefixText"];
}

- (void)setPrefixText:(id)a3
{
}

- (NSString)region
{
  return (NSString *)[(AceObject *)self propertyForKey:@"region"];
}

- (void)setRegion:(id)a3
{
}

- (BOOL)saveRequestAudio
{
  return AceObjectBoolForProperty(self, @"saveRequestAudio");
}

- (void)setSaveRequestAudio:(BOOL)a3
{
}

- (NSString)selectedText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectedText"];
}

- (void)setSelectedText:(id)a3
{
}

- (BOOL)speakerIndependentRecognition
{
  return AceObjectBoolForProperty(self, @"speakerIndependentRecognition");
}

- (void)setSpeakerIndependentRecognition:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end