@interface MXStreamingSpeechProfileAddData
- (BOOL)hasExistingLanguageProfile;
- (BOOL)hasExistingPronunciationCache;
- (BOOL)hasRequestId;
- (BOOL)hasSourceData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MXSpeechProfileSourceData)sourceData;
- (NSData)existingLanguageProfile;
- (NSData)existingPronunciationCache;
- (NSString)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExistingLanguageProfile:(id)a3;
- (void)setExistingPronunciationCache:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setSourceData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXStreamingSpeechProfileAddData

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasSourceData
{
  return self->_sourceData != 0;
}

- (BOOL)hasExistingLanguageProfile
{
  return self->_existingLanguageProfile != 0;
}

- (BOOL)hasExistingPronunciationCache
{
  return self->_existingPronunciationCache != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXStreamingSpeechProfileAddData;
  v4 = [(MXStreamingSpeechProfileAddData *)&v8 description];
  v5 = [(MXStreamingSpeechProfileAddData *)self dictionaryRepresentation];
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
  sourceData = self->_sourceData;
  if (sourceData)
  {
    v7 = [(MXSpeechProfileSourceData *)sourceData dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"source_data"];
  }
  existingLanguageProfile = self->_existingLanguageProfile;
  if (existingLanguageProfile) {
    [v4 setObject:existingLanguageProfile forKey:@"existing_language_profile"];
  }
  existingPronunciationCache = self->_existingPronunciationCache;
  if (existingPronunciationCache) {
    [v4 setObject:existingPronunciationCache forKey:@"existing_pronunciation_cache"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXStreamingSpeechProfileAddDataReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sourceData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_existingLanguageProfile)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_existingPronunciationCache)
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
  if (self->_sourceData)
  {
    objc_msgSend(v5, "setSourceData:");
    id v4 = v5;
  }
  if (self->_existingLanguageProfile)
  {
    objc_msgSend(v5, "setExistingLanguageProfile:");
    id v4 = v5;
  }
  if (self->_existingPronunciationCache)
  {
    objc_msgSend(v5, "setExistingPronunciationCache:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(MXSpeechProfileSourceData *)self->_sourceData copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSData *)self->_existingLanguageProfile copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSData *)self->_existingPronunciationCache copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[3]))
     || -[NSString isEqual:](requestId, "isEqual:"))
    && ((sourceData = self->_sourceData, !((unint64_t)sourceData | v4[4]))
     || -[MXSpeechProfileSourceData isEqual:](sourceData, "isEqual:"))
    && ((existingLanguageProfile = self->_existingLanguageProfile, !((unint64_t)existingLanguageProfile | v4[1]))
     || -[NSData isEqual:](existingLanguageProfile, "isEqual:")))
  {
    existingPronunciationCache = self->_existingPronunciationCache;
    if ((unint64_t)existingPronunciationCache | v4[2]) {
      char v9 = -[NSData isEqual:](existingPronunciationCache, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestId hash];
  unint64_t v4 = [(MXSpeechProfileSourceData *)self->_sourceData hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_existingLanguageProfile hash];
  return v4 ^ v5 ^ [(NSData *)self->_existingPronunciationCache hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[MXStreamingSpeechProfileAddData setRequestId:](self, "setRequestId:");
    unint64_t v4 = v7;
  }
  sourceData = self->_sourceData;
  uint64_t v6 = v4[4];
  if (sourceData)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[MXSpeechProfileSourceData mergeFrom:](sourceData, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[MXStreamingSpeechProfileAddData setSourceData:](self, "setSourceData:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (v4[1])
  {
    -[MXStreamingSpeechProfileAddData setExistingLanguageProfile:](self, "setExistingLanguageProfile:");
    unint64_t v4 = v7;
  }
  if (v4[2]) {
    -[MXStreamingSpeechProfileAddData setExistingPronunciationCache:](self, "setExistingPronunciationCache:");
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

- (MXSpeechProfileSourceData)sourceData
{
  return self->_sourceData;
}

- (void)setSourceData:(id)a3
{
}

- (NSData)existingLanguageProfile
{
  return self->_existingLanguageProfile;
}

- (void)setExistingLanguageProfile:(id)a3
{
}

- (NSData)existingPronunciationCache
{
  return self->_existingPronunciationCache;
}

- (void)setExistingPronunciationCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceData, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_existingPronunciationCache, 0);

  objc_storeStrong((id *)&self->_existingLanguageProfile, 0);
}

@end