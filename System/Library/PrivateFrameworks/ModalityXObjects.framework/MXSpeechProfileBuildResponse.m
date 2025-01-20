@interface MXSpeechProfileBuildResponse
- (BOOL)hasError;
- (BOOL)hasIncompleteProfile;
- (BOOL)hasLanguageProfile;
- (BOOL)hasPronunciationCache;
- (BOOL)hasRequestId;
- (BOOL)incompleteProfile;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MXProcessingError)error;
- (NSData)languageProfile;
- (NSData)pronunciationCache;
- (NSString)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setHasIncompleteProfile:(BOOL)a3;
- (void)setIncompleteProfile:(BOOL)a3;
- (void)setLanguageProfile:(id)a3;
- (void)setPronunciationCache:(id)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXSpeechProfileBuildResponse

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setIncompleteProfile:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_incompleteProfile = a3;
}

- (void)setHasIncompleteProfile:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIncompleteProfile
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLanguageProfile
{
  return self->_languageProfile != 0;
}

- (BOOL)hasPronunciationCache
{
  return self->_pronunciationCache != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXSpeechProfileBuildResponse;
  v4 = [(MXSpeechProfileBuildResponse *)&v8 description];
  v5 = [(MXSpeechProfileBuildResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  requestId = self->_requestId;
  if (requestId) {
    [v3 setObject:requestId forKey:@"request_id"];
  }
  error = self->_error;
  if (error)
  {
    v7 = [(MXProcessingError *)error dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"error"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_incompleteProfile];
    [v4 setObject:v8 forKey:@"incomplete_profile"];
  }
  languageProfile = self->_languageProfile;
  if (languageProfile) {
    [v4 setObject:languageProfile forKey:@"language_profile"];
  }
  pronunciationCache = self->_pronunciationCache;
  if (pronunciationCache) {
    [v4 setObject:pronunciationCache forKey:@"pronunciation_cache"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXSpeechProfileBuildResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_languageProfile)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_pronunciationCache)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    id v4 = v5;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[40] = self->_incompleteProfile;
    v4[44] |= 1u;
  }
  if (self->_languageProfile)
  {
    objc_msgSend(v5, "setLanguageProfile:");
    id v4 = v5;
  }
  if (self->_pronunciationCache)
  {
    objc_msgSend(v5, "setPronunciationCache:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestId copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(MXProcessingError *)self->_error copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_incompleteProfile;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v10 = [(NSData *)self->_languageProfile copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSData *)self->_pronunciationCache copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](requestId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1))
  {
    if (!-[MXProcessingError isEqual:](error, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 44))
    {
      if (self->_incompleteProfile)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_14;
      }
    }
LABEL_18:
    char v9 = 0;
    goto LABEL_19;
  }
  if (*((unsigned char *)v4 + 44)) {
    goto LABEL_18;
  }
LABEL_14:
  languageProfile = self->_languageProfile;
  if ((unint64_t)languageProfile | *((void *)v4 + 2)
    && !-[NSData isEqual:](languageProfile, "isEqual:"))
  {
    goto LABEL_18;
  }
  pronunciationCache = self->_pronunciationCache;
  if ((unint64_t)pronunciationCache | *((void *)v4 + 3)) {
    char v9 = -[NSData isEqual:](pronunciationCache, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestId hash];
  unint64_t v4 = [(MXProcessingError *)self->_error hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_incompleteProfile;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSData *)self->_languageProfile hash];
  return v6 ^ [(NSData *)self->_pronunciationCache hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (BOOL *)a3;
  v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[MXSpeechProfileBuildResponse setRequestId:](self, "setRequestId:");
    unint64_t v4 = v7;
  }
  error = self->_error;
  uint64_t v6 = *((void *)v4 + 1);
  if (error)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[MXProcessingError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[MXSpeechProfileBuildResponse setError:](self, "setError:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (v4[44])
  {
    self->_incompleteProfile = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[MXSpeechProfileBuildResponse setLanguageProfile:](self, "setLanguageProfile:");
    unint64_t v4 = v7;
  }
  if (*((void *)v4 + 3)) {
    -[MXSpeechProfileBuildResponse setPronunciationCache:](self, "setPronunciationCache:");
  }

  MEMORY[0x270F9A758]();
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (MXProcessingError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)incompleteProfile
{
  return self->_incompleteProfile;
}

- (NSData)languageProfile
{
  return self->_languageProfile;
}

- (void)setLanguageProfile:(id)a3
{
}

- (NSData)pronunciationCache
{
  return self->_pronunciationCache;
}

- (void)setPronunciationCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_pronunciationCache, 0);
  objc_storeStrong((id *)&self->_languageProfile, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end