@interface MXBeginDictation
+ (Class)inlineLmeItemsType;
+ (Class)languagesType;
- (BOOL)censorSpeech;
- (BOOL)enablePartialResults;
- (BOOL)hasActivationToken;
- (BOOL)hasApplicationName;
- (BOOL)hasApplicationVersion;
- (BOOL)hasAudioMetadata;
- (BOOL)hasCensorSpeech;
- (BOOL)hasEnablePartialResults;
- (BOOL)hasFieldId;
- (BOOL)hasFieldLabel;
- (BOOL)hasInputOrigin;
- (BOOL)hasIsAutoPunctuationEnabled;
- (BOOL)hasKeyboardIdentifier;
- (BOOL)hasKeyboardReturnKey;
- (BOOL)hasKeyboardType;
- (BOOL)hasPostfixText;
- (BOOL)hasPrefixText;
- (BOOL)hasRegion;
- (BOOL)hasRequestId;
- (BOOL)hasSaveRequestAudio;
- (BOOL)hasSelectedText;
- (BOOL)hasSpeakerIndependentRecognition;
- (BOOL)isAutoPunctuationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)saveRequestAudio;
- (BOOL)speakerIndependentRecognition;
- (MXAudioMetadata)audioMetadata;
- (NSData)activationToken;
- (NSMutableArray)inlineLmeItems;
- (NSMutableArray)languages;
- (NSString)applicationName;
- (NSString)applicationVersion;
- (NSString)fieldId;
- (NSString)fieldLabel;
- (NSString)keyboardIdentifier;
- (NSString)postfixText;
- (NSString)prefixText;
- (NSString)region;
- (NSString)requestId;
- (NSString)selectedText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inlineLmeItemsAtIndex:(unint64_t)a3;
- (id)inputOriginAsString:(int)a3;
- (id)keyboardReturnKeyAsString:(int)a3;
- (id)keyboardTypeAsString:(int)a3;
- (id)languagesAtIndex:(unint64_t)a3;
- (int)StringAsInputOrigin:(id)a3;
- (int)StringAsKeyboardReturnKey:(id)a3;
- (int)StringAsKeyboardType:(id)a3;
- (int)inputOrigin;
- (int)keyboardReturnKey;
- (int)keyboardType;
- (unint64_t)hash;
- (unint64_t)inlineLmeItemsCount;
- (unint64_t)languagesCount;
- (void)addInlineLmeItems:(id)a3;
- (void)addLanguages:(id)a3;
- (void)clearInlineLmeItems;
- (void)clearLanguages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationToken:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setAudioMetadata:(id)a3;
- (void)setCensorSpeech:(BOOL)a3;
- (void)setEnablePartialResults:(BOOL)a3;
- (void)setFieldId:(id)a3;
- (void)setFieldLabel:(id)a3;
- (void)setHasCensorSpeech:(BOOL)a3;
- (void)setHasEnablePartialResults:(BOOL)a3;
- (void)setHasInputOrigin:(BOOL)a3;
- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3;
- (void)setHasKeyboardReturnKey:(BOOL)a3;
- (void)setHasKeyboardType:(BOOL)a3;
- (void)setHasSaveRequestAudio:(BOOL)a3;
- (void)setHasSpeakerIndependentRecognition:(BOOL)a3;
- (void)setInlineLmeItems:(id)a3;
- (void)setInputOrigin:(int)a3;
- (void)setIsAutoPunctuationEnabled:(BOOL)a3;
- (void)setKeyboardIdentifier:(id)a3;
- (void)setKeyboardReturnKey:(int)a3;
- (void)setKeyboardType:(int)a3;
- (void)setLanguages:(id)a3;
- (void)setPostfixText:(id)a3;
- (void)setPrefixText:(id)a3;
- (void)setRegion:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setSaveRequestAudio:(BOOL)a3;
- (void)setSelectedText:(id)a3;
- (void)setSpeakerIndependentRecognition:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXBeginDictation

- (BOOL)hasAudioMetadata
{
  return self->_audioMetadata != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasFieldId
{
  return self->_fieldId != 0;
}

- (BOOL)hasFieldLabel
{
  return self->_fieldLabel != 0;
}

- (BOOL)hasApplicationName
{
  return self->_applicationName != 0;
}

- (BOOL)hasApplicationVersion
{
  return self->_applicationVersion != 0;
}

- (int)keyboardType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_keyboardType;
  }
  else {
    return 0;
  }
}

- (void)setKeyboardType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_keyboardType = a3;
}

- (void)setHasKeyboardType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKeyboardType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)keyboardTypeAsString:(int)a3
{
  if (a3 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265420B10[a3];
  }

  return v3;
}

- (int)StringAsKeyboardType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KeyboardTypeDefault"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ASCIICapable"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Alphabet"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NumbersAndPunctuation"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NumberPad"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DecimalPad"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"EmailAddress"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PhonePad"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"NamePhonePad"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Twitter"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WebSearch"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"Assistant"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ASCIICapableNumberPad"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"NonEmoji"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Messages"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)keyboardReturnKey
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_keyboardReturnKey;
  }
  else {
    return 0;
  }
}

- (void)setKeyboardReturnKey:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_keyboardReturnKey = a3;
}

- (void)setHasKeyboardReturnKey:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKeyboardReturnKey
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)keyboardReturnKeyAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265420B90[a3];
  }

  return v3;
}

- (int)StringAsKeyboardReturnKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KeyboardReturnKeyDefault"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Go"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Google"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Join"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Next"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Route"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Search"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Send"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Yahoo"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Done"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EmergencyCall"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Continue"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSelectedText
{
  return self->_selectedText != 0;
}

- (BOOL)hasPrefixText
{
  return self->_prefixText != 0;
}

- (BOOL)hasPostfixText
{
  return self->_postfixText != 0;
}

- (void)clearInlineLmeItems
{
}

- (void)addInlineLmeItems:(id)a3
{
  id v4 = a3;
  inlineLmeItems = self->_inlineLmeItems;
  id v8 = v4;
  if (!inlineLmeItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_inlineLmeItems;
    self->_inlineLmeItems = v6;

    id v4 = v8;
    inlineLmeItems = self->_inlineLmeItems;
  }
  [(NSMutableArray *)inlineLmeItems addObject:v4];
}

- (unint64_t)inlineLmeItemsCount
{
  return [(NSMutableArray *)self->_inlineLmeItems count];
}

- (id)inlineLmeItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_inlineLmeItems objectAtIndex:a3];
}

+ (Class)inlineLmeItemsType
{
  return (Class)objc_opt_class();
}

- (void)clearLanguages
{
}

- (void)addLanguages:(id)a3
{
  id v4 = a3;
  languages = self->_languages;
  id v8 = v4;
  if (!languages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_languages;
    self->_languages = v6;

    id v4 = v8;
    languages = self->_languages;
  }
  [(NSMutableArray *)languages addObject:v4];
}

- (unint64_t)languagesCount
{
  return [(NSMutableArray *)self->_languages count];
}

- (id)languagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_languages objectAtIndex:a3];
}

+ (Class)languagesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRegion
{
  return self->_region != 0;
}

- (BOOL)hasActivationToken
{
  return self->_activationToken != 0;
}

- (void)setCensorSpeech:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_censorSpeech = a3;
}

- (void)setHasCensorSpeech:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCensorSpeech
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSpeakerIndependentRecognition:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_speakerIndependentRecognition = a3;
}

- (void)setHasSpeakerIndependentRecognition:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSpeakerIndependentRecognition
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setSaveRequestAudio:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_saveRequestAudio = a3;
}

- (void)setHasSaveRequestAudio:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSaveRequestAudio
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasKeyboardIdentifier
{
  return self->_keyboardIdentifier != 0;
}

- (void)setEnablePartialResults:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_enablePartialResults = a3;
}

- (void)setHasEnablePartialResults:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEnablePartialResults
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)inputOrigin
{
  if (*(unsigned char *)&self->_has) {
    return self->_inputOrigin;
  }
  else {
    return 0;
  }
}

- (void)setInputOrigin:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_inputOrigin = a3;
}

- (void)setHasInputOrigin:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInputOrigin
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)inputOriginAsString:(int)a3
{
  if (a3 >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265420BF0[a3];
  }

  return v3;
}

- (int)StringAsInputOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UndefinedInputOrigin"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HomeButton"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RemoteButton"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RemoteAppButton"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AssistantSpeechButton"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AssistantTextInput"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PriorRequest"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"VoiceTrigger"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ServerGenerated"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MotionGesture"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RaiseToSpeak"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ClientGenerated"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TapToRefresh"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BackgroundRefresh"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"BluetoothVoiceTrigger"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"BluetoothDoubleTap"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TriggerlessFollowup"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"DialogButtonTap"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MagusFollowup"])
  {
    int v4 = 18;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsAutoPunctuationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isAutoPunctuationEnabled = a3;
}

- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsAutoPunctuationEnabled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXBeginDictation;
  int v4 = [(MXBeginDictation *)&v8 description];
  v5 = [(MXBeginDictation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  audioMetadata = self->_audioMetadata;
  if (audioMetadata)
  {
    v5 = [(MXAudioMetadata *)audioMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"audio_metadata"];
  }
  requestId = self->_requestId;
  if (requestId) {
    [v3 setObject:requestId forKey:@"request_id"];
  }
  fieldId = self->_fieldId;
  if (fieldId) {
    [v3 setObject:fieldId forKey:@"field_id"];
  }
  fieldLabel = self->_fieldLabel;
  if (fieldLabel) {
    [v3 setObject:fieldLabel forKey:@"field_label"];
  }
  applicationName = self->_applicationName;
  if (applicationName) {
    [v3 setObject:applicationName forKey:@"application_name"];
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion) {
    [v3 setObject:applicationVersion forKey:@"application_version"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t keyboardType = self->_keyboardType;
    if (keyboardType >= 0x10)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_keyboardType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_265420B10[keyboardType];
    }
    [v3 setObject:v13 forKey:@"keyboard_type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t keyboardReturnKey = self->_keyboardReturnKey;
    if (keyboardReturnKey >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_keyboardReturnKey);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_265420B90[keyboardReturnKey];
    }
    [v3 setObject:v15 forKey:@"keyboard_return_key"];
  }
  selectedText = self->_selectedText;
  if (selectedText) {
    [v3 setObject:selectedText forKey:@"selected_text"];
  }
  prefixText = self->_prefixText;
  if (prefixText) {
    [v3 setObject:prefixText forKey:@"prefix_text"];
  }
  postfixText = self->_postfixText;
  if (postfixText) {
    [v3 setObject:postfixText forKey:@"postfix_text"];
  }
  inlineLmeItems = self->_inlineLmeItems;
  if (inlineLmeItems) {
    [v3 setObject:inlineLmeItems forKey:@"inline_lme_items"];
  }
  languages = self->_languages;
  if (languages) {
    [v3 setObject:languages forKey:@"languages"];
  }
  region = self->_region;
  if (region) {
    [v3 setObject:region forKey:@"region"];
  }
  activationToken = self->_activationToken;
  if (activationToken) {
    [v3 setObject:activationToken forKey:@"activation_token"];
  }
  char v23 = (char)self->_has;
  if ((v23 & 8) != 0)
  {
    v29 = [NSNumber numberWithBool:self->_censorSpeech];
    [v3 setObject:v29 forKey:@"censor_speech"];

    char v23 = (char)self->_has;
    if ((v23 & 0x80) == 0)
    {
LABEL_39:
      if ((v23 & 0x40) == 0) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_39;
  }
  v30 = [NSNumber numberWithBool:self->_speakerIndependentRecognition];
  [v3 setObject:v30 forKey:@"speaker_independent_recognition"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_40:
    v24 = [NSNumber numberWithBool:self->_saveRequestAudio];
    [v3 setObject:v24 forKey:@"save_request_audio"];
  }
LABEL_41:
  keyboardIdentifier = self->_keyboardIdentifier;
  if (keyboardIdentifier) {
    [v3 setObject:keyboardIdentifier forKey:@"keyboard_identifier"];
  }
  char v26 = (char)self->_has;
  if ((v26 & 0x10) != 0)
  {
    v31 = [NSNumber numberWithBool:self->_enablePartialResults];
    [v3 setObject:v31 forKey:@"enable_partial_results"];

    char v26 = (char)self->_has;
    if ((v26 & 1) == 0)
    {
LABEL_45:
      if ((v26 & 0x20) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_45;
  }
  uint64_t inputOrigin = self->_inputOrigin;
  if (inputOrigin >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_inputOrigin);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = off_265420BF0[inputOrigin];
  }
  [v3 setObject:v33 forKey:@"input_origin"];

  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_47;
  }
LABEL_46:
  v27 = [NSNumber numberWithBool:self->_isAutoPunctuationEnabled];
  [v3 setObject:v27 forKey:@"is_auto_punctuation_enabled"];

LABEL_47:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXBeginDictationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_audioMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_requestId) {
    PBDataWriterWriteStringField();
  }
  if (self->_fieldId) {
    PBDataWriterWriteStringField();
  }
  if (self->_fieldLabel) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationVersion) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_selectedText) {
    PBDataWriterWriteStringField();
  }
  if (self->_prefixText) {
    PBDataWriterWriteStringField();
  }
  if (self->_postfixText) {
    PBDataWriterWriteStringField();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = self->_inlineLmeItems;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_languages;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  if (self->_region) {
    PBDataWriterWriteStringField();
  }
  if (self->_activationToken) {
    PBDataWriterWriteDataField();
  }
  char v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v16 = (char)self->_has;
    if ((v16 & 0x80) == 0)
    {
LABEL_43:
      if ((v16 & 0x40) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_44:
  }
    PBDataWriterWriteBOOLField();
LABEL_45:
  if (self->_keyboardIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v17 = (char)self->_has;
  if ((v17 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_49;
    }
LABEL_56:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  PBDataWriterWriteBOOLField();
  char v17 = (char)self->_has;
  if (v17) {
    goto LABEL_56;
  }
LABEL_49:
  if ((v17 & 0x20) != 0) {
LABEL_50:
  }
    PBDataWriterWriteBOOLField();
LABEL_51:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v17 = v4;
  if (self->_audioMetadata)
  {
    objc_msgSend(v4, "setAudioMetadata:");
    id v4 = v17;
  }
  if (self->_requestId)
  {
    objc_msgSend(v17, "setRequestId:");
    id v4 = v17;
  }
  if (self->_fieldId)
  {
    objc_msgSend(v17, "setFieldId:");
    id v4 = v17;
  }
  if (self->_fieldLabel)
  {
    objc_msgSend(v17, "setFieldLabel:");
    id v4 = v17;
  }
  if (self->_applicationName)
  {
    objc_msgSend(v17, "setApplicationName:");
    id v4 = v17;
  }
  if (self->_applicationVersion)
  {
    objc_msgSend(v17, "setApplicationVersion:");
    id v4 = v17;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_keyboardType;
    *((unsigned char *)v4 + 144) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_keyboardReturnKey;
    *((unsigned char *)v4 + 144) |= 2u;
  }
  if (self->_selectedText) {
    objc_msgSend(v17, "setSelectedText:");
  }
  if (self->_prefixText) {
    objc_msgSend(v17, "setPrefixText:");
  }
  if (self->_postfixText) {
    objc_msgSend(v17, "setPostfixText:");
  }
  if ([(MXBeginDictation *)self inlineLmeItemsCount])
  {
    [v17 clearInlineLmeItems];
    unint64_t v6 = [(MXBeginDictation *)self inlineLmeItemsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(MXBeginDictation *)self inlineLmeItemsAtIndex:i];
        [v17 addInlineLmeItems:v9];
      }
    }
  }
  if ([(MXBeginDictation *)self languagesCount])
  {
    [v17 clearLanguages];
    unint64_t v10 = [(MXBeginDictation *)self languagesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(MXBeginDictation *)self languagesAtIndex:j];
        [v17 addLanguages:v13];
      }
    }
  }
  if (self->_region) {
    objc_msgSend(v17, "setRegion:");
  }
  uint64_t v14 = v17;
  if (self->_activationToken)
  {
    objc_msgSend(v17, "setActivationToken:");
    uint64_t v14 = v17;
  }
  char v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    v14[136] = self->_censorSpeech;
    v14[144] |= 8u;
    char v15 = (char)self->_has;
    if ((v15 & 0x80) == 0)
    {
LABEL_37:
      if ((v15 & 0x40) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_37;
  }
  v14[140] = self->_speakerIndependentRecognition;
  v14[144] |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_38:
    v14[139] = self->_saveRequestAudio;
    v14[144] |= 0x40u;
  }
LABEL_39:
  if (self->_keyboardIdentifier)
  {
    objc_msgSend(v17, "setKeyboardIdentifier:");
    uint64_t v14 = v17;
  }
  char v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    v14[137] = self->_enablePartialResults;
    v14[144] |= 0x10u;
    char v16 = (char)self->_has;
    if ((v16 & 1) == 0)
    {
LABEL_43:
      if ((v16 & 0x20) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_43;
  }
  *((_DWORD *)v14 + 16) = self->_inputOrigin;
  v14[144] |= 1u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_44:
    v14[138] = self->_isAutoPunctuationEnabled;
    v14[144] |= 0x20u;
  }
LABEL_45:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MXAudioMetadata *)self->_audioMetadata copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_requestId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v8;

  uint64_t v10 = [(NSString *)self->_fieldId copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_fieldLabel copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_applicationName copyWithZone:a3];
  char v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  uint64_t v16 = [(NSString *)self->_applicationVersion copyWithZone:a3];
  id v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_keyboardType;
    *(unsigned char *)(v5 + 144) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_keyboardReturnKey;
    *(unsigned char *)(v5 + 144) |= 2u;
  }
  uint64_t v19 = [(NSString *)self->_selectedText copyWithZone:a3];
  long long v20 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v19;

  uint64_t v21 = [(NSString *)self->_prefixText copyWithZone:a3];
  long long v22 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v21;

  uint64_t v23 = [(NSString *)self->_postfixText copyWithZone:a3];
  long long v24 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v23;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v25 = self->_inlineLmeItems;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addInlineLmeItems:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v27);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v31 = self->_languages;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * j), "copyWithZone:", a3, (void)v46);
        [(id)v5 addLanguages:v36];
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v33);
  }

  uint64_t v37 = [(NSString *)self->_region copyWithZone:a3];
  v38 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v37;

  uint64_t v39 = [(NSData *)self->_activationToken copyWithZone:a3];
  v40 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v39;

  char v41 = (char)self->_has;
  if ((v41 & 8) != 0)
  {
    *(unsigned char *)(v5 + 136) = self->_censorSpeech;
    *(unsigned char *)(v5 + 144) |= 8u;
    char v41 = (char)self->_has;
    if ((v41 & 0x80) == 0)
    {
LABEL_21:
      if ((v41 & 0x40) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_21;
  }
  *(unsigned char *)(v5 + 140) = self->_speakerIndependentRecognition;
  *(unsigned char *)(v5 + 144) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_22:
    *(unsigned char *)(v5 + 139) = self->_saveRequestAudio;
    *(unsigned char *)(v5 + 144) |= 0x40u;
  }
LABEL_23:
  uint64_t v42 = -[NSString copyWithZone:](self->_keyboardIdentifier, "copyWithZone:", a3, (void)v46);
  v43 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v42;

  char v44 = (char)self->_has;
  if ((v44 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_25;
    }
LABEL_32:
    *(_DWORD *)(v5 + 64) = self->_inputOrigin;
    *(unsigned char *)(v5 + 144) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v5;
    }
    goto LABEL_26;
  }
  *(unsigned char *)(v5 + 137) = self->_enablePartialResults;
  *(unsigned char *)(v5 + 144) |= 0x10u;
  char v44 = (char)self->_has;
  if (v44) {
    goto LABEL_32;
  }
LABEL_25:
  if ((v44 & 0x20) != 0)
  {
LABEL_26:
    *(unsigned char *)(v5 + 138) = self->_isAutoPunctuationEnabled;
    *(unsigned char *)(v5 + 144) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  audioMetadata = self->_audioMetadata;
  if ((unint64_t)audioMetadata | *((void *)v4 + 4))
  {
    if (!-[MXAudioMetadata isEqual:](audioMetadata, "isEqual:")) {
      goto LABEL_81;
    }
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](requestId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  fieldId = self->_fieldId;
  if ((unint64_t)fieldId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](fieldId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  fieldLabel = self->_fieldLabel;
  if ((unint64_t)fieldLabel | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](fieldLabel, "isEqual:")) {
      goto LABEL_81;
    }
  }
  applicationName = self->_applicationName;
  if ((unint64_t)applicationName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](applicationName, "isEqual:")) {
      goto LABEL_81;
    }
  }
  applicationVersion = self->_applicationVersion;
  if ((unint64_t)applicationVersion | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](applicationVersion, "isEqual:")) {
      goto LABEL_81;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 4) == 0 || self->_keyboardType != *((_DWORD *)v4 + 21)) {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 2) == 0 || self->_keyboardReturnKey != *((_DWORD *)v4 + 20)) {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 2) != 0)
  {
    goto LABEL_81;
  }
  selectedText = self->_selectedText;
  if ((unint64_t)selectedText | *((void *)v4 + 16)
    && !-[NSString isEqual:](selectedText, "isEqual:"))
  {
    goto LABEL_81;
  }
  prefixText = self->_prefixText;
  if ((unint64_t)prefixText | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](prefixText, "isEqual:")) {
      goto LABEL_81;
    }
  }
  postfixText = self->_postfixText;
  if ((unint64_t)postfixText | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](postfixText, "isEqual:")) {
      goto LABEL_81;
    }
  }
  inlineLmeItems = self->_inlineLmeItems;
  if ((unint64_t)inlineLmeItems | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](inlineLmeItems, "isEqual:")) {
      goto LABEL_81;
    }
  }
  languages = self->_languages;
  if ((unint64_t)languages | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](languages, "isEqual:")) {
      goto LABEL_81;
    }
  }
  region = self->_region;
  if ((unint64_t)region | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](region, "isEqual:")) {
      goto LABEL_81;
    }
  }
  activationToken = self->_activationToken;
  if ((unint64_t)activationToken | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](activationToken, "isEqual:")) {
      goto LABEL_81;
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 8) == 0) {
      goto LABEL_81;
    }
    if (self->_censorSpeech)
    {
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 136))
    {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 0x80) == 0) {
      goto LABEL_81;
    }
    if (self->_speakerIndependentRecognition)
    {
      if (!*((unsigned char *)v4 + 140)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 140))
    {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 0x40) == 0) {
      goto LABEL_81;
    }
    if (self->_saveRequestAudio)
    {
      if (!*((unsigned char *)v4 + 139)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 139))
    {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 0x40) != 0)
  {
    goto LABEL_81;
  }
  keyboardIdentifier = self->_keyboardIdentifier;
  if ((unint64_t)keyboardIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](keyboardIdentifier, "isEqual:")) {
      goto LABEL_81;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 0x10) == 0) {
      goto LABEL_81;
    }
    if (self->_enablePartialResults)
    {
      if (!*((unsigned char *)v4 + 137)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 137))
    {
      goto LABEL_81;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 144) & 1) == 0 || self->_inputOrigin != *((_DWORD *)v4 + 16)) {
      goto LABEL_81;
    }
  }
  else if (*((unsigned char *)v4 + 144))
  {
    goto LABEL_81;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 0x20) != 0)
    {
      if (self->_isAutoPunctuationEnabled)
      {
        if (!*((unsigned char *)v4 + 138)) {
          goto LABEL_81;
        }
      }
      else if (*((unsigned char *)v4 + 138))
      {
        goto LABEL_81;
      }
      BOOL v20 = 1;
      goto LABEL_82;
    }
LABEL_81:
    BOOL v20 = 0;
    goto LABEL_82;
  }
  BOOL v20 = (*((unsigned char *)v4 + 144) & 0x20) == 0;
LABEL_82:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v33 = [(MXAudioMetadata *)self->_audioMetadata hash];
  NSUInteger v3 = [(NSString *)self->_requestId hash];
  NSUInteger v4 = [(NSString *)self->_fieldId hash];
  NSUInteger v5 = [(NSString *)self->_fieldLabel hash];
  NSUInteger v6 = [(NSString *)self->_applicationName hash];
  NSUInteger v7 = [(NSString *)self->_applicationVersion hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_keyboardType;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v31 = v8;
  NSUInteger v32 = v7;
  NSUInteger v26 = v6;
  NSUInteger v27 = v3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    NSUInteger v9 = [(NSString *)self->_selectedText hash];
  }
  else {
    NSUInteger v9 = [(NSString *)self->_selectedText hash];
  }
  NSUInteger v10 = v9;
  NSUInteger v11 = [(NSString *)self->_prefixText hash];
  NSUInteger v12 = [(NSString *)self->_postfixText hash];
  uint64_t v30 = [(NSMutableArray *)self->_inlineLmeItems hash];
  uint64_t v29 = [(NSMutableArray *)self->_languages hash];
  NSUInteger v28 = [(NSString *)self->_region hash];
  uint64_t v13 = [(NSData *)self->_activationToken hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v14 = 2654435761 * self->_censorSpeech;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
LABEL_9:
      uint64_t v15 = 2654435761 * self->_speakerIndependentRecognition;
      goto LABEL_12;
    }
  }
  uint64_t v15 = 0;
LABEL_12:
  NSUInteger v25 = v10;
  uint64_t v16 = v13;
  NSUInteger v17 = v5;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v18 = 2654435761 * self->_saveRequestAudio;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_keyboardIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v20 = 2654435761 * self->_enablePartialResults;
  }
  else {
    uint64_t v20 = 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v21 = 2654435761 * self->_inputOrigin;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_20;
    }
LABEL_22:
    uint64_t v22 = 0;
    return v27 ^ v33 ^ v4 ^ v17 ^ v26 ^ v32 ^ v31 ^ v24 ^ v25 ^ v11 ^ v12 ^ v30 ^ v29 ^ v28 ^ v16 ^ v14 ^ v15 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
  uint64_t v21 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v22 = 2654435761 * self->_isAutoPunctuationEnabled;
  return v27 ^ v33 ^ v4 ^ v17 ^ v26 ^ v32 ^ v31 ^ v24 ^ v25 ^ v11 ^ v12 ^ v30 ^ v29 ^ v28 ^ v16 ^ v14 ^ v15 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  audioMetadata = self->_audioMetadata;
  uint64_t v6 = *((void *)v4 + 4);
  if (audioMetadata)
  {
    if (v6) {
      -[MXAudioMetadata mergeFrom:](audioMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MXBeginDictation setAudioMetadata:](self, "setAudioMetadata:");
  }
  if (*((void *)v4 + 15)) {
    -[MXBeginDictation setRequestId:](self, "setRequestId:");
  }
  if (*((void *)v4 + 5)) {
    -[MXBeginDictation setFieldId:](self, "setFieldId:");
  }
  if (*((void *)v4 + 6)) {
    -[MXBeginDictation setFieldLabel:](self, "setFieldLabel:");
  }
  if (*((void *)v4 + 2)) {
    -[MXBeginDictation setApplicationName:](self, "setApplicationName:");
  }
  if (*((void *)v4 + 3)) {
    -[MXBeginDictation setApplicationVersion:](self, "setApplicationVersion:");
  }
  char v7 = *((unsigned char *)v4 + 144);
  if ((v7 & 4) != 0)
  {
    self->_uint64_t keyboardType = *((_DWORD *)v4 + 21);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 144);
  }
  if ((v7 & 2) != 0)
  {
    self->_uint64_t keyboardReturnKey = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 16)) {
    -[MXBeginDictation setSelectedText:](self, "setSelectedText:");
  }
  if (*((void *)v4 + 13)) {
    -[MXBeginDictation setPrefixText:](self, "setPrefixText:");
  }
  if (*((void *)v4 + 12)) {
    -[MXBeginDictation setPostfixText:](self, "setPostfixText:");
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = *((id *)v4 + 7);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        [(MXBeginDictation *)self addInlineLmeItems:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = *((id *)v4 + 11);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        -[MXBeginDictation addLanguages:](self, "addLanguages:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  if (*((void *)v4 + 14)) {
    -[MXBeginDictation setRegion:](self, "setRegion:");
  }
  if (*((void *)v4 + 1)) {
    -[MXBeginDictation setActivationToken:](self, "setActivationToken:");
  }
  char v18 = *((unsigned char *)v4 + 144);
  if ((v18 & 8) != 0)
  {
    self->_censorSpeech = *((unsigned char *)v4 + 136);
    *(unsigned char *)&self->_has |= 8u;
    char v18 = *((unsigned char *)v4 + 144);
    if ((v18 & 0x80) == 0)
    {
LABEL_46:
      if ((v18 & 0x40) == 0) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 0x80) == 0)
  {
    goto LABEL_46;
  }
  self->_speakerIndependentRecognition = *((unsigned char *)v4 + 140);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)v4 + 144) & 0x40) != 0)
  {
LABEL_47:
    self->_saveRequestAudio = *((unsigned char *)v4 + 139);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_48:
  if (*((void *)v4 + 9)) {
    -[MXBeginDictation setKeyboardIdentifier:](self, "setKeyboardIdentifier:");
  }
  char v19 = *((unsigned char *)v4 + 144);
  if ((v19 & 0x10) == 0)
  {
    if ((*((unsigned char *)v4 + 144) & 1) == 0) {
      goto LABEL_52;
    }
LABEL_59:
    self->_uint64_t inputOrigin = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
    if ((*((unsigned char *)v4 + 144) & 0x20) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  self->_enablePartialResults = *((unsigned char *)v4 + 137);
  *(unsigned char *)&self->_has |= 0x10u;
  char v19 = *((unsigned char *)v4 + 144);
  if (v19) {
    goto LABEL_59;
  }
LABEL_52:
  if ((v19 & 0x20) != 0)
  {
LABEL_53:
    self->_isAutoPunctuationEnabled = *((unsigned char *)v4 + 138);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_54:
}

- (MXAudioMetadata)audioMetadata
{
  return self->_audioMetadata;
}

- (void)setAudioMetadata:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)fieldId
{
  return self->_fieldId;
}

- (void)setFieldId:(id)a3
{
}

- (NSString)fieldLabel
{
  return self->_fieldLabel;
}

- (void)setFieldLabel:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(id)a3
{
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
}

- (NSString)prefixText
{
  return self->_prefixText;
}

- (void)setPrefixText:(id)a3
{
}

- (NSString)postfixText
{
  return self->_postfixText;
}

- (void)setPostfixText:(id)a3
{
}

- (NSMutableArray)inlineLmeItems
{
  return self->_inlineLmeItems;
}

- (void)setInlineLmeItems:(id)a3
{
}

- (NSMutableArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSData)activationToken
{
  return self->_activationToken;
}

- (void)setActivationToken:(id)a3
{
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (BOOL)speakerIndependentRecognition
{
  return self->_speakerIndependentRecognition;
}

- (BOOL)saveRequestAudio
{
  return self->_saveRequestAudio;
}

- (NSString)keyboardIdentifier
{
  return self->_keyboardIdentifier;
}

- (void)setKeyboardIdentifier:(id)a3
{
}

- (BOOL)enablePartialResults
{
  return self->_enablePartialResults;
}

- (BOOL)isAutoPunctuationEnabled
{
  return self->_isAutoPunctuationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_keyboardIdentifier, 0);
  objc_storeStrong((id *)&self->_inlineLmeItems, 0);
  objc_storeStrong((id *)&self->_fieldLabel, 0);
  objc_storeStrong((id *)&self->_fieldId, 0);
  objc_storeStrong((id *)&self->_audioMetadata, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);

  objc_storeStrong((id *)&self->_activationToken, 0);
}

@end