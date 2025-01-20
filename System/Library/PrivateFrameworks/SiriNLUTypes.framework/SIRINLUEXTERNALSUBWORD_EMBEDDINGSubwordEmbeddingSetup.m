@interface SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup
- (BOOL)hasEmbeddingVersion;
- (BOOL)hasLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)embeddingVersion;
- (NSString)locale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEmbeddingVersion:(id)a3;
- (void)setLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_embeddingVersion, 0);
}

- (void)setEmbeddingVersion:(id)a3
{
}

- (NSString)embeddingVersion
{
  return self->_embeddingVersion;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup setLocale:](self, "setLocale:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup setEmbeddingVersion:](self, "setEmbeddingVersion:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_locale hash];
  return [(NSString *)self->_embeddingVersion hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((locale = self->_locale, !((unint64_t)locale | v4[2]))
     || -[NSString isEqual:](locale, "isEqual:")))
  {
    embeddingVersion = self->_embeddingVersion;
    if ((unint64_t)embeddingVersion | v4[1]) {
      char v7 = -[NSString isEqual:](embeddingVersion, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_locale copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_embeddingVersion copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_locale)
  {
    objc_msgSend(v4, "setLocale:");
    id v4 = v5;
  }
  if (self->_embeddingVersion)
  {
    objc_msgSend(v5, "setEmbeddingVersion:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_embeddingVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  embeddingVersion = self->_embeddingVersion;
  if (embeddingVersion) {
    [v4 setObject:embeddingVersion forKey:@"embedding_version"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup;
  id v4 = [(SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup *)&v8 description];
  id v5 = [(SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingSetup *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEmbeddingVersion
{
  return self->_embeddingVersion != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

@end