@interface MXFinalSpeechRecognitionResponse
- (BOOL)hasAudioAnalytics;
- (BOOL)hasHasResult;
- (BOOL)hasLangProfileRecreateCodes;
- (BOOL)hasLanguage;
- (BOOL)hasLatnnMitigatorResult;
- (BOOL)hasRecognitionResult;
- (BOOL)hasRequestLocale;
- (BOOL)hasResult;
- (BOOL)hasReturnCode;
- (BOOL)hasReturnStr;
- (BOOL)hasSessionId;
- (BOOL)hasSpeechId;
- (BOOL)hasWatermarkDetection;
- (BOOL)hasWatermarkPeakAverage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MXAudioAnalytics)audioAnalytics;
- (MXLatnnMitigatorResult)latnnMitigatorResult;
- (MXRecognitionResult)recognitionResult;
- (NSString)language;
- (NSString)requestLocale;
- (NSString)returnStr;
- (NSString)sessionId;
- (NSString)speechId;
- (double)watermarkPeakAverage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)langProfileRecreateCodesAsString:(int)a3;
- (id)watermarkDetectionAsString:(int)a3;
- (int)StringAsLangProfileRecreateCodes:(id)a3;
- (int)StringAsWatermarkDetection:(id)a3;
- (int)langProfileRecreateCodes;
- (int)returnCode;
- (int)watermarkDetection;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioAnalytics:(id)a3;
- (void)setHasHasResult:(BOOL)a3;
- (void)setHasLangProfileRecreateCodes:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasReturnCode:(BOOL)a3;
- (void)setHasWatermarkDetection:(BOOL)a3;
- (void)setHasWatermarkPeakAverage:(BOOL)a3;
- (void)setLangProfileRecreateCodes:(int)a3;
- (void)setLanguage:(id)a3;
- (void)setLatnnMitigatorResult:(id)a3;
- (void)setRecognitionResult:(id)a3;
- (void)setRequestLocale:(id)a3;
- (void)setReturnCode:(int)a3;
- (void)setReturnStr:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSpeechId:(id)a3;
- (void)setWatermarkDetection:(int)a3;
- (void)setWatermarkPeakAverage:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXFinalSpeechRecognitionResponse

- (BOOL)hasSpeechId
{
  return self->_speechId != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)setReturnCode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_returnCode = a3;
}

- (void)setHasReturnCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReturnCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasReturnStr
{
  return self->_returnStr != 0;
}

- (BOOL)hasRecognitionResult
{
  return self->_recognitionResult != 0;
}

- (int)langProfileRecreateCodes
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_langProfileRecreateCodes;
  }
  else {
    return 0;
  }
}

- (void)setLangProfileRecreateCodes:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_langProfileRecreateCodes = a3;
}

- (void)setHasLangProfileRecreateCodes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLangProfileRecreateCodes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)langProfileRecreateCodesAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265420A88[a3];
  }

  return v3;
}

- (int)StringAsLangProfileRecreateCodes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LANGUAGE_PROFILE_RECREATE_CODES_UNDEF"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LANGUAGE_PROFILE_OK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LANGUAGE_PROFILE_REFRESH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LANGUAGE_PROFILE_INCOMPATIBLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LANGUAGE_PROFILE_CORRUPT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAudioAnalytics
{
  return self->_audioAnalytics != 0;
}

- (int)watermarkDetection
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_watermarkDetection;
  }
  else {
    return 0;
  }
}

- (void)setWatermarkDetection:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_watermarkDetection = a3;
}

- (void)setHasWatermarkDetection:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWatermarkDetection
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)watermarkDetectionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265420AB0[a3];
  }

  return v3;
}

- (int)StringAsWatermarkDetection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WM_UNKNOWN_ENUM_VALUE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WM_NOT_CHECKED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WM_NOT_DETECTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WM_DETECTED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setWatermarkPeakAverage:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_watermarkPeakAverage = a3;
}

- (void)setHasWatermarkPeakAverage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWatermarkPeakAverage
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasLatnnMitigatorResult
{
  return self->_latnnMitigatorResult != 0;
}

- (BOOL)hasRequestLocale
{
  return self->_requestLocale != 0;
}

- (void)setHasResult:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_hasResult = a3;
}

- (void)setHasHasResult:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHasResult
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXFinalSpeechRecognitionResponse;
  int v4 = [(MXFinalSpeechRecognitionResponse *)&v8 description];
  v5 = [(MXFinalSpeechRecognitionResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  NSString *returnStr;
  MXRecognitionResult *recognitionResult;
  void *v10;
  uint64_t langProfileRecreateCodes;
  __CFString *v12;
  MXAudioAnalytics *audioAnalytics;
  void *v14;
  char has;
  uint64_t watermarkDetection;
  __CFString *v17;
  void *v18;
  NSString *language;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  void *v21;
  NSString *requestLocale;
  void *v23;
  uint64_t vars8;

  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  speechId = self->_speechId;
  if (speechId) {
    [v3 setObject:speechId forKey:@"speech_id"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v4 setObject:sessionId forKey:@"session_id"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_returnCode];
    [v4 setObject:v7 forKey:@"return_code"];
  }
  returnStr = self->_returnStr;
  if (returnStr) {
    [v4 setObject:returnStr forKey:@"return_str"];
  }
  recognitionResult = self->_recognitionResult;
  if (recognitionResult)
  {
    v10 = [(MXRecognitionResult *)recognitionResult dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"recognition_result"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    langProfileRecreateCodes = self->_langProfileRecreateCodes;
    if (langProfileRecreateCodes >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_langProfileRecreateCodes);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_265420A88[langProfileRecreateCodes];
    }
    [v4 setObject:v12 forKey:@"lang_profile_recreate_codes"];
  }
  audioAnalytics = self->_audioAnalytics;
  if (audioAnalytics)
  {
    v14 = [(MXAudioAnalytics *)audioAnalytics dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"audio_analytics"];
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    watermarkDetection = self->_watermarkDetection;
    if (watermarkDetection >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_watermarkDetection);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_265420AB0[watermarkDetection];
    }
    [v4 setObject:v17 forKey:@"watermark_detection"];

    has = (char)self->_has;
  }
  if (has)
  {
    v18 = [NSNumber numberWithDouble:self->_watermarkPeakAverage];
    [v4 setObject:v18 forKey:@"watermark_peak_average"];
  }
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  latnnMitigatorResult = self->_latnnMitigatorResult;
  if (latnnMitigatorResult)
  {
    v21 = [(MXLatnnMitigatorResult *)latnnMitigatorResult dictionaryRepresentation];
    [v4 setObject:v21 forKey:@"latnn_mitigator_result"];
  }
  requestLocale = self->_requestLocale;
  if (requestLocale) {
    [v4 setObject:requestLocale forKey:@"request_locale"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v23 = [NSNumber numberWithBool:self->_hasResult];
    [v4 setObject:v23 forKey:@"has_result"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXFinalSpeechRecognitionResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_speechId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_returnStr)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_recognitionResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_audioAnalytics)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_latnnMitigatorResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_requestLocale)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_speechId)
  {
    objc_msgSend(v4, "setSpeechId:");
    id v4 = v6;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v6, "setSessionId:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_returnCode;
    *((unsigned char *)v4 + 104) |= 4u;
  }
  if (self->_returnStr)
  {
    objc_msgSend(v6, "setReturnStr:");
    id v4 = v6;
  }
  if (self->_recognitionResult)
  {
    objc_msgSend(v6, "setRecognitionResult:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_langProfileRecreateCodes;
    *((unsigned char *)v4 + 104) |= 2u;
  }
  if (self->_audioAnalytics)
  {
    objc_msgSend(v6, "setAudioAnalytics:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_watermarkDetection;
    *((unsigned char *)v4 + 104) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_watermarkPeakAverage;
    *((unsigned char *)v4 + 104) |= 1u;
  }
  if (self->_language)
  {
    objc_msgSend(v6, "setLanguage:");
    id v4 = v6;
  }
  if (self->_latnnMitigatorResult)
  {
    objc_msgSend(v6, "setLatnnMitigatorResult:");
    id v4 = v6;
  }
  if (self->_requestLocale)
  {
    objc_msgSend(v6, "setRequestLocale:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 100) = self->_hasResult;
    *((unsigned char *)v4 + 104) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_speechId copyWithZone:a3];
  v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  uint64_t v8 = [(NSString *)self->_sessionId copyWithZone:a3];
  v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_returnCode;
    *(unsigned char *)(v5 + 104) |= 4u;
  }
  uint64_t v10 = [(NSString *)self->_returnStr copyWithZone:a3];
  v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  id v12 = [(MXRecognitionResult *)self->_recognitionResult copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_langProfileRecreateCodes;
    *(unsigned char *)(v5 + 104) |= 2u;
  }
  id v14 = [(MXAudioAnalytics *)self->_audioAnalytics copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_watermarkDetection;
    *(unsigned char *)(v5 + 104) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_watermarkPeakAverage;
    *(unsigned char *)(v5 + 104) |= 1u;
  }
  uint64_t v17 = [(NSString *)self->_language copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  id v19 = [(MXLatnnMitigatorResult *)self->_latnnMitigatorResult copyWithZone:a3];
  v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  uint64_t v21 = [(NSString *)self->_requestLocale copyWithZone:a3];
  v22 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v21;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 100) = self->_hasResult;
    *(unsigned char *)(v5 + 104) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  NSString *returnStr;
  MXRecognitionResult *recognitionResult;
  char has;
  MXAudioAnalytics *audioAnalytics;
  NSString *language;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  NSString *requestLocale;
  BOOL v14;

  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  speechId = self->_speechId;
  if ((unint64_t)speechId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](speechId, "isEqual:")) {
      goto LABEL_41;
    }
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:")) {
      goto LABEL_41;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 4) == 0 || self->_returnCode != *((_DWORD *)v4 + 16)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
    goto LABEL_41;
  }
  returnStr = self->_returnStr;
  if ((unint64_t)returnStr | *((void *)v4 + 9) && !-[NSString isEqual:](returnStr, "isEqual:")) {
    goto LABEL_41;
  }
  recognitionResult = self->_recognitionResult;
  if ((unint64_t)recognitionResult | *((void *)v4 + 6))
  {
    if (!-[MXRecognitionResult isEqual:](recognitionResult, "isEqual:")) {
      goto LABEL_41;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 2) == 0 || self->_langProfileRecreateCodes != *((_DWORD *)v4 + 6)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
    goto LABEL_41;
  }
  audioAnalytics = self->_audioAnalytics;
  if ((unint64_t)audioAnalytics | *((void *)v4 + 2))
  {
    if (!-[MXAudioAnalytics isEqual:](audioAnalytics, "isEqual:")) {
      goto LABEL_41;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 8) == 0 || self->_watermarkDetection != *((_DWORD *)v4 + 24)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 8) != 0)
  {
    goto LABEL_41;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_watermarkPeakAverage != *((double *)v4 + 1)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 104))
  {
    goto LABEL_41;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 4) && !-[NSString isEqual:](language, "isEqual:")) {
    goto LABEL_41;
  }
  latnnMitigatorResult = self->_latnnMitigatorResult;
  if ((unint64_t)latnnMitigatorResult | *((void *)v4 + 5))
  {
    if (!-[MXLatnnMitigatorResult isEqual:](latnnMitigatorResult, "isEqual:")) {
      goto LABEL_41;
    }
  }
  requestLocale = self->_requestLocale;
  if ((unint64_t)requestLocale | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](requestLocale, "isEqual:")) {
      goto LABEL_41;
    }
  }
  id v14 = (*((unsigned char *)v4 + 104) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 0x10) != 0)
    {
      if (self->_hasResult)
      {
        if (!*((unsigned char *)v4 + 100)) {
          goto LABEL_41;
        }
      }
      else if (*((unsigned char *)v4 + 100))
      {
        goto LABEL_41;
      }
      id v14 = 1;
      goto LABEL_42;
    }
LABEL_41:
    id v14 = 0;
  }
LABEL_42:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v20 = [(NSString *)self->_speechId hash];
  NSUInteger v19 = [(NSString *)self->_sessionId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v18 = 2654435761 * self->_returnCode;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_returnStr hash];
  unint64_t v3 = [(MXRecognitionResult *)self->_recognitionResult hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_langProfileRecreateCodes;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(MXAudioAnalytics *)self->_audioAnalytics hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_watermarkDetection;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
LABEL_14:
    unint64_t v11 = 0;
    goto LABEL_17;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  double watermarkPeakAverage = self->_watermarkPeakAverage;
  double v8 = -watermarkPeakAverage;
  if (watermarkPeakAverage >= 0.0) {
    double v8 = self->_watermarkPeakAverage;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_17:
  NSUInteger v12 = [(NSString *)self->_language hash];
  unint64_t v13 = [(MXLatnnMitigatorResult *)self->_latnnMitigatorResult hash];
  NSUInteger v14 = [(NSString *)self->_requestLocale hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v15 = 2654435761 * self->_hasResult;
  }
  else {
    uint64_t v15 = 0;
  }
  return v19 ^ v20 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (*((void *)v4 + 11))
  {
    -[MXFinalSpeechRecognitionResponse setSpeechId:](self, "setSpeechId:");
    id v4 = v12;
  }
  if (*((void *)v4 + 10))
  {
    -[MXFinalSpeechRecognitionResponse setSessionId:](self, "setSessionId:");
    id v4 = v12;
  }
  if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
    self->_returnCode = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 9))
  {
    -[MXFinalSpeechRecognitionResponse setReturnStr:](self, "setReturnStr:");
    id v4 = v12;
  }
  recognitionResult = self->_recognitionResult;
  uint64_t v6 = *((void *)v4 + 6);
  if (recognitionResult)
  {
    if (!v6) {
      goto LABEL_15;
    }
    -[MXRecognitionResult mergeFrom:](recognitionResult, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    -[MXFinalSpeechRecognitionResponse setRecognitionResult:](self, "setRecognitionResult:");
  }
  id v4 = v12;
LABEL_15:
  if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
    self->_langProfileRecreateCodes = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  audioAnalytics = self->_audioAnalytics;
  uint64_t v8 = *((void *)v4 + 2);
  if (audioAnalytics)
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[MXAudioAnalytics mergeFrom:](audioAnalytics, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_23;
    }
    -[MXFinalSpeechRecognitionResponse setAudioAnalytics:](self, "setAudioAnalytics:");
  }
  id v4 = v12;
LABEL_23:
  char v9 = *((unsigned char *)v4 + 104);
  if ((v9 & 8) != 0)
  {
    self->_watermarkDetection = *((_DWORD *)v4 + 24);
    *(unsigned char *)&self->_has |= 8u;
    char v9 = *((unsigned char *)v4 + 104);
  }
  if (v9)
  {
    self->_double watermarkPeakAverage = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[MXFinalSpeechRecognitionResponse setLanguage:](self, "setLanguage:");
    id v4 = v12;
  }
  latnnMitigatorResult = self->_latnnMitigatorResult;
  uint64_t v11 = *((void *)v4 + 5);
  if (latnnMitigatorResult)
  {
    if (!v11) {
      goto LABEL_35;
    }
    -[MXLatnnMitigatorResult mergeFrom:](latnnMitigatorResult, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_35;
    }
    -[MXFinalSpeechRecognitionResponse setLatnnMitigatorResult:](self, "setLatnnMitigatorResult:");
  }
  id v4 = v12;
LABEL_35:
  if (*((void *)v4 + 7))
  {
    -[MXFinalSpeechRecognitionResponse setRequestLocale:](self, "setRequestLocale:");
    id v4 = v12;
  }
  if ((*((unsigned char *)v4 + 104) & 0x10) != 0)
  {
    self->_hasResult = *((unsigned char *)v4 + 100);
    *(unsigned char *)&self->_has |= 0x10u;
  }

  MEMORY[0x270F9A758]();
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (int)returnCode
{
  return self->_returnCode;
}

- (NSString)returnStr
{
  return self->_returnStr;
}

- (void)setReturnStr:(id)a3
{
  objc_storeStrong((id *)&self->_returnStr, a3);
}

- (MXRecognitionResult)recognitionResult
{
  return self->_recognitionResult;
}

- (void)setRecognitionResult:(id)a3
{
}

- (MXAudioAnalytics)audioAnalytics
{
  return self->_audioAnalytics;
}

- (void)setAudioAnalytics:(id)a3
{
}

- (double)watermarkPeakAverage
{
  return self->_watermarkPeakAverage;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (MXLatnnMitigatorResult)latnnMitigatorResult
{
  return self->_latnnMitigatorResult;
}

- (void)setLatnnMitigatorResult:(id)a3
{
}

- (NSString)requestLocale
{
  return self->_requestLocale;
}

- (void)setRequestLocale:(id)a3
{
}

- (BOOL)hasResult
{
  return self->_hasResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_returnStr, 0);
  objc_storeStrong((id *)&self->_requestLocale, 0);
  objc_storeStrong((id *)&self->_recognitionResult, 0);
  objc_storeStrong((id *)&self->_latnnMitigatorResult, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_audioAnalytics, 0);
}

@end