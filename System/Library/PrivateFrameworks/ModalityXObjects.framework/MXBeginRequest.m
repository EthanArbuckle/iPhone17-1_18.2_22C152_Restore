@interface MXBeginRequest
+ (Class)inlineLmeItemsType;
- (BOOL)enablePartialResults;
- (BOOL)hasAudioMetadata;
- (BOOL)hasEnablePartialResults;
- (BOOL)hasForegroundAppId;
- (BOOL)hasInputOrigin;
- (BOOL)hasIsAutoPunctuationEnabled;
- (BOOL)hasIsPromptedConfirmation;
- (BOOL)hasIsPromptedDictation;
- (BOOL)hasRequestId;
- (BOOL)isAutoPunctuationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPromptedConfirmation;
- (BOOL)isPromptedDictation;
- (BOOL)readFrom:(id)a3;
- (MXAudioMetadata)audioMetadata;
- (NSMutableArray)inlineLmeItems;
- (NSString)foregroundAppId;
- (NSString)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inlineLmeItemsAtIndex:(unint64_t)a3;
- (id)inputOriginAsString:(int)a3;
- (int)StringAsInputOrigin:(id)a3;
- (int)inputOrigin;
- (unint64_t)hash;
- (unint64_t)inlineLmeItemsCount;
- (void)addInlineLmeItems:(id)a3;
- (void)clearInlineLmeItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioMetadata:(id)a3;
- (void)setEnablePartialResults:(BOOL)a3;
- (void)setForegroundAppId:(id)a3;
- (void)setHasEnablePartialResults:(BOOL)a3;
- (void)setHasInputOrigin:(BOOL)a3;
- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3;
- (void)setHasIsPromptedConfirmation:(BOOL)a3;
- (void)setHasIsPromptedDictation:(BOOL)a3;
- (void)setInlineLmeItems:(id)a3;
- (void)setInputOrigin:(int)a3;
- (void)setIsAutoPunctuationEnabled:(BOOL)a3;
- (void)setIsPromptedConfirmation:(BOOL)a3;
- (void)setIsPromptedDictation:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXBeginRequest

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
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
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2654209D8[a3];
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

- (BOOL)hasAudioMetadata
{
  return self->_audioMetadata != 0;
}

- (void)setEnablePartialResults:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_enablePartialResults = a3;
}

- (void)setHasEnablePartialResults:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnablePartialResults
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsPromptedDictation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isPromptedDictation = a3;
}

- (void)setHasIsPromptedDictation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsPromptedDictation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsPromptedConfirmation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isPromptedConfirmation = a3;
}

- (void)setHasIsPromptedConfirmation:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPromptedConfirmation
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasForegroundAppId
{
  return self->_foregroundAppId != 0;
}

- (void)setIsAutoPunctuationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isAutoPunctuationEnabled = a3;
}

- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAutoPunctuationEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXBeginRequest;
  id v4 = [(MXBeginRequest *)&v8 description];
  v5 = [(MXBeginRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  requestId = self->_requestId;
  if (requestId) {
    [v3 setObject:requestId forKey:@"request_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t inputOrigin = self->_inputOrigin;
    if (inputOrigin >= 0x13)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_inputOrigin);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_2654209D8[inputOrigin];
    }
    [v4 setObject:v7 forKey:@"input_origin"];
  }
  audioMetadata = self->_audioMetadata;
  if (audioMetadata)
  {
    v9 = [(MXAudioMetadata *)audioMetadata dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"audio_metadata"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16 = [NSNumber numberWithBool:self->_enablePartialResults];
    [v4 setObject:v16 forKey:@"enable_partial_results"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_12:
      if ((has & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_12;
  }
  v17 = [NSNumber numberWithBool:self->_isPromptedDictation];
  [v4 setObject:v17 forKey:@"is_prompted_dictation"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_13:
    v11 = [NSNumber numberWithBool:self->_isPromptedConfirmation];
    [v4 setObject:v11 forKey:@"is_prompted_confirmation"];
  }
LABEL_14:
  foregroundAppId = self->_foregroundAppId;
  if (foregroundAppId) {
    [v4 setObject:foregroundAppId forKey:@"foreground_app_id"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v13 = [NSNumber numberWithBool:self->_isAutoPunctuationEnabled];
    [v4 setObject:v13 forKey:@"is_auto_punctuation_enabled"];
  }
  inlineLmeItems = self->_inlineLmeItems;
  if (inlineLmeItems) {
    [v4 setObject:inlineLmeItems forKey:@"inline_lme_items"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXBeginRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_requestId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_audioMetadata) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_foregroundAppId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_inlineLmeItems;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    id v4 = v10;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_inputOrigin;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  if (self->_audioMetadata)
  {
    objc_msgSend(v10, "setAudioMetadata:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_enablePartialResults;
    *((unsigned char *)v4 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v4 + 51) = self->_isPromptedDictation;
  *((unsigned char *)v4 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    *((unsigned char *)v4 + 50) = self->_isPromptedConfirmation;
    *((unsigned char *)v4 + 52) |= 8u;
  }
LABEL_11:
  if (self->_foregroundAppId)
  {
    objc_msgSend(v10, "setForegroundAppId:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 49) = self->_isAutoPunctuationEnabled;
    *((unsigned char *)v4 + 52) |= 4u;
  }
  if ([(MXBeginRequest *)self inlineLmeItemsCount])
  {
    [v10 clearInlineLmeItems];
    unint64_t v6 = [(MXBeginRequest *)self inlineLmeItemsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(MXBeginRequest *)self inlineLmeItemsAtIndex:i];
        [v10 addInlineLmeItems:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestId copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_inputOrigin;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  id v8 = [(MXAudioMetadata *)self->_audioMetadata copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 48) = self->_enablePartialResults;
    *(unsigned char *)(v5 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(unsigned char *)(v5 + 51) = self->_isPromptedDictation;
  *(unsigned char *)(v5 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(unsigned char *)(v5 + 50) = self->_isPromptedConfirmation;
    *(unsigned char *)(v5 + 52) |= 8u;
  }
LABEL_7:
  uint64_t v11 = [(NSString *)self->_foregroundAppId copyWithZone:a3];
  long long v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 49) = self->_isAutoPunctuationEnabled;
    *(unsigned char *)(v5 + 52) |= 4u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_inlineLmeItems;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [(id)v5 addInlineLmeItems:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](requestId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_inputOrigin != *((_DWORD *)v4 + 8)) {
      goto LABEL_43;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_43;
  }
  audioMetadata = self->_audioMetadata;
  if ((unint64_t)audioMetadata | *((void *)v4 + 1))
  {
    if (!-[MXAudioMetadata isEqual:](audioMetadata, "isEqual:")) {
      goto LABEL_43;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0) {
      goto LABEL_43;
    }
    if (self->_enablePartialResults)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_43;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0) {
      goto LABEL_43;
    }
    if (self->_isPromptedDictation)
    {
      if (!*((unsigned char *)v4 + 51)) {
        goto LABEL_43;
      }
    }
    else if (*((unsigned char *)v4 + 51))
    {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0) {
      goto LABEL_43;
    }
    if (self->_isPromptedConfirmation)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_43;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_43;
  }
  foregroundAppId = self->_foregroundAppId;
  if ((unint64_t)foregroundAppId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](foregroundAppId, "isEqual:")) {
      goto LABEL_43;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0) {
      goto LABEL_49;
    }
LABEL_43:
    char v9 = 0;
    goto LABEL_44;
  }
  if ((*((unsigned char *)v4 + 52) & 4) == 0) {
    goto LABEL_43;
  }
  if (!self->_isAutoPunctuationEnabled)
  {
    if (!*((unsigned char *)v4 + 49)) {
      goto LABEL_49;
    }
    goto LABEL_43;
  }
  if (!*((unsigned char *)v4 + 49)) {
    goto LABEL_43;
  }
LABEL_49:
  inlineLmeItems = self->_inlineLmeItems;
  if ((unint64_t)inlineLmeItems | *((void *)v4 + 3)) {
    char v9 = -[NSMutableArray isEqual:](inlineLmeItems, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_44:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_inputOrigin;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(MXAudioMetadata *)self->_audioMetadata hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v6 = 2654435761 * self->_enablePartialResults;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_isPromptedDictation;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_isPromptedConfirmation;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v8 = 0;
LABEL_11:
  NSUInteger v9 = [(NSString *)self->_foregroundAppId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_isAutoPunctuationEnabled;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSMutableArray *)self->_inlineLmeItems hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[MXBeginRequest setRequestId:](self, "setRequestId:");
  }
  if (*((unsigned char *)v4 + 52))
  {
    self->_uint64_t inputOrigin = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  audioMetadata = self->_audioMetadata;
  uint64_t v6 = *((void *)v4 + 1);
  if (audioMetadata)
  {
    if (v6) {
      -[MXAudioMetadata mergeFrom:](audioMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MXBeginRequest setAudioMetadata:](self, "setAudioMetadata:");
  }
  char v7 = *((unsigned char *)v4 + 52);
  if ((v7 & 2) != 0)
  {
    self->_enablePartialResults = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 52);
    if ((v7 & 0x10) == 0)
    {
LABEL_12:
      if ((v7 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) == 0)
  {
    goto LABEL_12;
  }
  self->_isPromptedDictation = *((unsigned char *)v4 + 51);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
LABEL_13:
    self->_isPromptedConfirmation = *((unsigned char *)v4 + 50);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_14:
  if (*((void *)v4 + 2)) {
    -[MXBeginRequest setForegroundAppId:](self, "setForegroundAppId:");
  }
  if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    self->_isAutoPunctuationEnabled = *((unsigned char *)v4 + 49);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 3);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[MXBeginRequest addInlineLmeItems:](self, "addInlineLmeItems:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (MXAudioMetadata)audioMetadata
{
  return self->_audioMetadata;
}

- (void)setAudioMetadata:(id)a3
{
}

- (BOOL)enablePartialResults
{
  return self->_enablePartialResults;
}

- (BOOL)isPromptedDictation
{
  return self->_isPromptedDictation;
}

- (BOOL)isPromptedConfirmation
{
  return self->_isPromptedConfirmation;
}

- (NSString)foregroundAppId
{
  return self->_foregroundAppId;
}

- (void)setForegroundAppId:(id)a3
{
}

- (BOOL)isAutoPunctuationEnabled
{
  return self->_isAutoPunctuationEnabled;
}

- (NSMutableArray)inlineLmeItems
{
  return self->_inlineLmeItems;
}

- (void)setInlineLmeItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_inlineLmeItems, 0);
  objc_storeStrong((id *)&self->_foregroundAppId, 0);

  objc_storeStrong((id *)&self->_audioMetadata, 0);
}

@end