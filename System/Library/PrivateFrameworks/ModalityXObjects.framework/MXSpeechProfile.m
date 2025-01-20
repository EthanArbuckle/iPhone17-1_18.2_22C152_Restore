@interface MXSpeechProfile
- (BOOL)hasLanguageProfile;
- (BOOL)hasMoreDataFollows;
- (BOOL)isEqual:(id)a3;
- (BOOL)moreDataFollows;
- (BOOL)readFrom:(id)a3;
- (NSData)languageProfile;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMoreDataFollows:(BOOL)a3;
- (void)setLanguageProfile:(id)a3;
- (void)setMoreDataFollows:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXSpeechProfile

- (void)setMoreDataFollows:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_moreDataFollows = a3;
}

- (void)setHasMoreDataFollows:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMoreDataFollows
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLanguageProfile
{
  return self->_languageProfile != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXSpeechProfile;
  v4 = [(MXSpeechProfile *)&v8 description];
  v5 = [(MXSpeechProfile *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_moreDataFollows];
    [v3 setObject:v4 forKey:@"more_data_follows"];
  }
  languageProfile = self->_languageProfile;
  if (languageProfile) {
    [v3 setObject:languageProfile forKey:@"language_profile"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXSpeechProfileReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_moreDataFollows;
    v4[20] |= 1u;
  }
  if (self->_languageProfile)
  {
    id v5 = v4;
    objc_msgSend(v4, "setLanguageProfile:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_moreDataFollows;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_languageProfile copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_moreDataFollows)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  languageProfile = self->_languageProfile;
  if ((unint64_t)languageProfile | *((void *)v4 + 1)) {
    char v5 = -[NSData isEqual:](languageProfile, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_moreDataFollows;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_languageProfile hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[20])
  {
    self->_moreDataFollows = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    char v5 = v4;
    -[MXSpeechProfile setLanguageProfile:](self, "setLanguageProfile:");
    id v4 = v5;
  }
}

- (BOOL)moreDataFollows
{
  return self->_moreDataFollows;
}

- (NSData)languageProfile
{
  return self->_languageProfile;
}

- (void)setLanguageProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end