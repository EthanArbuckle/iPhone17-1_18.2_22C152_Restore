@interface MXRecognitionCandidate
- (BOOL)hasAudioAnalytics;
- (BOOL)hasFingerprintDetection;
- (BOOL)hasLanguage;
- (BOOL)hasLatnnMitigatorResult;
- (BOOL)hasRecognitionResult;
- (BOOL)hasRequestLocale;
- (BOOL)hasResultId;
- (BOOL)hasReturnCode;
- (BOOL)hasReturnStr;
- (BOOL)hasSessionId;
- (BOOL)hasSnr;
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
- (NSString)resultId;
- (NSString)returnStr;
- (NSString)sessionId;
- (NSString)speechId;
- (double)snr;
- (double)watermarkPeakAverage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fingerprintDetectionAsString:(int)a3;
- (id)watermarkDetectionAsString:(int)a3;
- (int)StringAsFingerprintDetection:(id)a3;
- (int)StringAsWatermarkDetection:(id)a3;
- (int)fingerprintDetection;
- (int)returnCode;
- (int)watermarkDetection;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioAnalytics:(id)a3;
- (void)setFingerprintDetection:(int)a3;
- (void)setHasFingerprintDetection:(BOOL)a3;
- (void)setHasReturnCode:(BOOL)a3;
- (void)setHasSnr:(BOOL)a3;
- (void)setHasWatermarkDetection:(BOOL)a3;
- (void)setHasWatermarkPeakAverage:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLatnnMitigatorResult:(id)a3;
- (void)setRecognitionResult:(id)a3;
- (void)setRequestLocale:(id)a3;
- (void)setResultId:(id)a3;
- (void)setReturnCode:(int)a3;
- (void)setReturnStr:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSnr:(double)a3;
- (void)setSpeechId:(id)a3;
- (void)setWatermarkDetection:(int)a3;
- (void)setWatermarkPeakAverage:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXRecognitionCandidate

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
  *(unsigned char *)&self->_has |= 8u;
  self->_returnCode = a3;
}

- (void)setHasReturnCode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReturnCode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasReturnStr
{
  return self->_returnStr != 0;
}

- (BOOL)hasRecognitionResult
{
  return self->_recognitionResult != 0;
}

- (BOOL)hasResultId
{
  return self->_resultId != 0;
}

- (void)setSnr:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSnr
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)fingerprintDetection
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_fingerprintDetection;
  }
  else {
    return 0;
  }
}

- (void)setFingerprintDetection:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_fingerprintDetection = a3;
}

- (void)setHasFingerprintDetection:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFingerprintDetection
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)fingerprintDetectionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_265420AD0[a3];
  }

  return v3;
}

- (int)StringAsFingerprintDetection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FP_UNKNOWN_ENUM_VALUE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FP_NOT_CHECKED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FP_NOT_DETECTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FP_DETECTED"])
  {
    int v4 = 3;
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
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_watermarkDetection;
  }
  else {
    return 0;
  }
}

- (void)setWatermarkDetection:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_watermarkDetection = a3;
}

- (void)setHasWatermarkDetection:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWatermarkDetection
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
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
    char v3 = off_265420AF0[a3];
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
  *(unsigned char *)&self->_has |= 2u;
  self->_watermarkPeakAverage = a3;
}

- (void)setHasWatermarkPeakAverage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWatermarkPeakAverage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXRecognitionCandidate;
  int v4 = [(MXRecognitionCandidate *)&v8 description];
  v5 = [(MXRecognitionCandidate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  NSString *returnStr;
  MXRecognitionResult *recognitionResult;
  void *v10;
  NSString *resultId;
  char has;
  void *v13;
  uint64_t fingerprintDetection;
  __CFString *v15;
  MXAudioAnalytics *audioAnalytics;
  void *v17;
  char v18;
  uint64_t watermarkDetection;
  __CFString *v20;
  void *v21;
  NSString *language;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  void *v24;
  NSString *requestLocale;
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
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
  resultId = self->_resultId;
  if (resultId) {
    [v4 setObject:resultId forKey:@"result_id"];
  }
  has = (char)self->_has;
  if (has)
  {
    v13 = [NSNumber numberWithDouble:self->_snr];
    [v4 setObject:v13 forKey:@"snr"];

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    fingerprintDetection = self->_fingerprintDetection;
    if (fingerprintDetection >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fingerprintDetection);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_265420AD0[fingerprintDetection];
    }
    [v4 setObject:v15 forKey:@"fingerprint_detection"];
  }
  audioAnalytics = self->_audioAnalytics;
  if (audioAnalytics)
  {
    v17 = [(MXAudioAnalytics *)audioAnalytics dictionaryRepresentation];
    [v4 setObject:v17 forKey:@"audio_analytics"];
  }
  v18 = (char)self->_has;
  if ((v18 & 0x10) != 0)
  {
    watermarkDetection = self->_watermarkDetection;
    if (watermarkDetection >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_watermarkDetection);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_265420AF0[watermarkDetection];
    }
    [v4 setObject:v20 forKey:@"watermark_detection"];

    v18 = (char)self->_has;
  }
  if ((v18 & 2) != 0)
  {
    v21 = [NSNumber numberWithDouble:self->_watermarkPeakAverage];
    [v4 setObject:v21 forKey:@"watermark_peak_average"];
  }
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  latnnMitigatorResult = self->_latnnMitigatorResult;
  if (latnnMitigatorResult)
  {
    v24 = [(MXLatnnMitigatorResult *)latnnMitigatorResult dictionaryRepresentation];
    [v4 setObject:v24 forKey:@"latnn_mitigator_result"];
  }
  requestLocale = self->_requestLocale;
  if (requestLocale) {
    [v4 setObject:requestLocale forKey:@"request_locale"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXRecognitionCandidateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_speechId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_returnStr)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_recognitionResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_resultId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_audioAnalytics)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_latnnMitigatorResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_requestLocale)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_speechId)
  {
    objc_msgSend(v4, "setSpeechId:");
    id v4 = v7;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v7, "setSessionId:");
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_returnCode;
    *((unsigned char *)v4 + 116) |= 8u;
  }
  if (self->_returnStr)
  {
    objc_msgSend(v7, "setReturnStr:");
    id v4 = v7;
  }
  if (self->_recognitionResult)
  {
    objc_msgSend(v7, "setRecognitionResult:");
    id v4 = v7;
  }
  if (self->_resultId)
  {
    objc_msgSend(v7, "setResultId:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_snr;
    *((unsigned char *)v4 + 116) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_fingerprintDetection;
    *((unsigned char *)v4 + 116) |= 4u;
  }
  if (self->_audioAnalytics)
  {
    objc_msgSend(v7, "setAudioAnalytics:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 28) = self->_watermarkDetection;
    *((unsigned char *)v4 + 116) |= 0x10u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_watermarkPeakAverage;
    *((unsigned char *)v4 + 116) |= 2u;
  }
  if (self->_language)
  {
    objc_msgSend(v7, "setLanguage:");
    id v4 = v7;
  }
  if (self->_latnnMitigatorResult)
  {
    objc_msgSend(v7, "setLatnnMitigatorResult:");
    id v4 = v7;
  }
  if (self->_requestLocale)
  {
    objc_msgSend(v7, "setRequestLocale:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_speechId copyWithZone:a3];
  id v7 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v6;

  uint64_t v8 = [(NSString *)self->_sessionId copyWithZone:a3];
  v9 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v8;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_returnCode;
    *(unsigned char *)(v5 + 116) |= 8u;
  }
  uint64_t v10 = [(NSString *)self->_returnStr copyWithZone:a3];
  v11 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v10;

  id v12 = [(MXRecognitionResult *)self->_recognitionResult copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSString *)self->_resultId copyWithZone:a3];
  v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_snr;
    *(unsigned char *)(v5 + 116) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_fingerprintDetection;
    *(unsigned char *)(v5 + 116) |= 4u;
  }
  id v17 = [(MXAudioAnalytics *)self->_audioAnalytics copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  char v19 = (char)self->_has;
  if ((v19 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_watermarkDetection;
    *(unsigned char *)(v5 + 116) |= 0x10u;
    char v19 = (char)self->_has;
  }
  if ((v19 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_watermarkPeakAverage;
    *(unsigned char *)(v5 + 116) |= 2u;
  }
  uint64_t v20 = [(NSString *)self->_language copyWithZone:a3];
  v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  id v22 = [(MXLatnnMitigatorResult *)self->_latnnMitigatorResult copyWithZone:a3];
  v23 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v22;

  uint64_t v24 = [(NSString *)self->_requestLocale copyWithZone:a3];
  v25 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  NSString *returnStr;
  MXRecognitionResult *recognitionResult;
  NSString *resultId;
  char has;
  MXAudioAnalytics *audioAnalytics;
  NSString *language;
  MXLatnnMitigatorResult *latnnMitigatorResult;
  NSString *requestLocale;
  char v15;

  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  speechId = self->_speechId;
  if ((unint64_t)speechId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](speechId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 8) == 0 || self->_returnCode != *((_DWORD *)v4 + 20)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 8) != 0)
  {
    goto LABEL_46;
  }
  returnStr = self->_returnStr;
  if ((unint64_t)returnStr | *((void *)v4 + 11) && !-[NSString isEqual:](returnStr, "isEqual:")) {
    goto LABEL_46;
  }
  recognitionResult = self->_recognitionResult;
  if ((unint64_t)recognitionResult | *((void *)v4 + 7))
  {
    if (!-[MXRecognitionResult isEqual:](recognitionResult, "isEqual:")) {
      goto LABEL_46;
    }
  }
  resultId = self->_resultId;
  if ((unint64_t)resultId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](resultId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 116) & 1) == 0 || self->_snr != *((double *)v4 + 1)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 116))
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 4) == 0 || self->_fingerprintDetection != *((_DWORD *)v4 + 8)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    goto LABEL_46;
  }
  audioAnalytics = self->_audioAnalytics;
  if ((unint64_t)audioAnalytics | *((void *)v4 + 3))
  {
    if (!-[MXAudioAnalytics isEqual:](audioAnalytics, "isEqual:"))
    {
LABEL_46:
      v15 = 0;
      goto LABEL_47;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 0x10) == 0 || self->_watermarkDetection != *((_DWORD *)v4 + 28)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 2) == 0 || self->_watermarkPeakAverage != *((double *)v4 + 2)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 2) != 0)
  {
    goto LABEL_46;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 5) && !-[NSString isEqual:](language, "isEqual:")) {
    goto LABEL_46;
  }
  latnnMitigatorResult = self->_latnnMitigatorResult;
  if ((unint64_t)latnnMitigatorResult | *((void *)v4 + 6))
  {
    if (!-[MXLatnnMitigatorResult isEqual:](latnnMitigatorResult, "isEqual:")) {
      goto LABEL_46;
    }
  }
  requestLocale = self->_requestLocale;
  if ((unint64_t)requestLocale | *((void *)v4 + 8)) {
    v15 = -[NSString isEqual:](requestLocale, "isEqual:");
  }
  else {
    v15 = 1;
  }
LABEL_47:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v27 = [(NSString *)self->_speechId hash];
  NSUInteger v25 = [(NSString *)self->_sessionId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_returnCode;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_returnStr hash];
  unint64_t v5 = [(MXRecognitionResult *)self->_recognitionResult hash];
  NSUInteger v6 = [(NSString *)self->_resultId hash];
  char has = (char)self->_has;
  if (has)
  {
    double snr = self->_snr;
    double v10 = -snr;
    if (snr >= 0.0) {
      double v10 = self->_snr;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v13 = 2654435761 * self->_fingerprintDetection;
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = [(MXAudioAnalytics *)self->_audioAnalytics hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v15 = 2654435761 * self->_watermarkDetection;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_17;
    }
LABEL_22:
    unint64_t v20 = 0;
    goto LABEL_25;
  }
  uint64_t v15 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_22;
  }
LABEL_17:
  double watermarkPeakAverage = self->_watermarkPeakAverage;
  double v17 = -watermarkPeakAverage;
  if (watermarkPeakAverage >= 0.0) {
    double v17 = self->_watermarkPeakAverage;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  unint64_t v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0) {
      v20 += (unint64_t)v19;
    }
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
LABEL_25:
  NSUInteger v21 = v26 ^ v27 ^ v3 ^ v4 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ v20;
  NSUInteger v22 = [(NSString *)self->_language hash];
  unint64_t v23 = v22 ^ [(MXLatnnMitigatorResult *)self->_latnnMitigatorResult hash];
  return v21 ^ v23 ^ [(NSString *)self->_requestLocale hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (*((void *)v4 + 13))
  {
    -[MXRecognitionCandidate setSpeechId:](self, "setSpeechId:");
    id v4 = v13;
  }
  if (*((void *)v4 + 12))
  {
    -[MXRecognitionCandidate setSessionId:](self, "setSessionId:");
    id v4 = v13;
  }
  if ((*((unsigned char *)v4 + 116) & 8) != 0)
  {
    self->_returnCode = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 11))
  {
    -[MXRecognitionCandidate setReturnStr:](self, "setReturnStr:");
    id v4 = v13;
  }
  recognitionResult = self->_recognitionResult;
  uint64_t v6 = *((void *)v4 + 7);
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
    -[MXRecognitionCandidate setRecognitionResult:](self, "setRecognitionResult:");
  }
  id v4 = v13;
LABEL_15:
  if (*((void *)v4 + 9))
  {
    -[MXRecognitionCandidate setResultId:](self, "setResultId:");
    id v4 = v13;
  }
  char v7 = *((unsigned char *)v4 + 116);
  if (v7)
  {
    self->_double snr = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 116);
  }
  if ((v7 & 4) != 0)
  {
    self->_fingerprintDetection = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
  audioAnalytics = self->_audioAnalytics;
  uint64_t v9 = *((void *)v4 + 3);
  if (audioAnalytics)
  {
    if (!v9) {
      goto LABEL_27;
    }
    -[MXAudioAnalytics mergeFrom:](audioAnalytics, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_27;
    }
    -[MXRecognitionCandidate setAudioAnalytics:](self, "setAudioAnalytics:");
  }
  id v4 = v13;
LABEL_27:
  char v10 = *((unsigned char *)v4 + 116);
  if ((v10 & 0x10) != 0)
  {
    self->_watermarkDetection = *((_DWORD *)v4 + 28);
    *(unsigned char *)&self->_has |= 0x10u;
    char v10 = *((unsigned char *)v4 + 116);
  }
  if ((v10 & 2) != 0)
  {
    self->_double watermarkPeakAverage = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 5))
  {
    -[MXRecognitionCandidate setLanguage:](self, "setLanguage:");
    id v4 = v13;
  }
  latnnMitigatorResult = self->_latnnMitigatorResult;
  uint64_t v12 = *((void *)v4 + 6);
  if (latnnMitigatorResult)
  {
    if (!v12) {
      goto LABEL_39;
    }
    -[MXLatnnMitigatorResult mergeFrom:](latnnMitigatorResult, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_39;
    }
    -[MXRecognitionCandidate setLatnnMitigatorResult:](self, "setLatnnMitigatorResult:");
  }
  id v4 = v13;
LABEL_39:
  if (*((void *)v4 + 8)) {
    -[MXRecognitionCandidate setRequestLocale:](self, "setRequestLocale:");
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

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
}

- (double)snr
{
  return self->_snr;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_returnStr, 0);
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_requestLocale, 0);
  objc_storeStrong((id *)&self->_recognitionResult, 0);
  objc_storeStrong((id *)&self->_latnnMitigatorResult, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_audioAnalytics, 0);
}

@end