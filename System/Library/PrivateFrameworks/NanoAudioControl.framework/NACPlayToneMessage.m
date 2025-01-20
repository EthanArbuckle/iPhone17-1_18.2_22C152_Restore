@interface NACPlayToneMessage
- (BOOL)forPreview;
- (BOOL)hasAlertType;
- (BOOL)hasForPreview;
- (BOOL)hasShouldRepeat;
- (BOOL)hasToneIdentifier;
- (BOOL)hasTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldRepeat;
- (NSString)alertType;
- (NSString)toneIdentifier;
- (NSString)topic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlertType:(id)a3;
- (void)setForPreview:(BOOL)a3;
- (void)setHasForPreview:(BOOL)a3;
- (void)setHasShouldRepeat:(BOOL)a3;
- (void)setShouldRepeat:(BOOL)a3;
- (void)setToneIdentifier:(id)a3;
- (void)setTopic:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NACPlayToneMessage

- (BOOL)hasAlertType
{
  return self->_alertType != 0;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

- (BOOL)hasToneIdentifier
{
  return self->_toneIdentifier != 0;
}

- (void)setShouldRepeat:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldRepeat = a3;
}

- (void)setHasShouldRepeat:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldRepeat
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setForPreview:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_forPreview = a3;
}

- (void)setHasForPreview:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasForPreview
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NACPlayToneMessage;
  v4 = [(NACPlayToneMessage *)&v8 description];
  v5 = [(NACPlayToneMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  alertType = self->_alertType;
  if (alertType) {
    [v3 setObject:alertType forKey:@"alertType"];
  }
  topic = self->_topic;
  if (topic) {
    [v4 setObject:topic forKey:@"topic"];
  }
  toneIdentifier = self->_toneIdentifier;
  if (toneIdentifier) {
    [v4 setObject:toneIdentifier forKey:@"toneIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_shouldRepeat];
    [v4 setObject:v9 forKey:@"shouldRepeat"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v10 = [NSNumber numberWithBool:self->_forPreview];
    [v4 setObject:v10 forKey:@"forPreview"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NACPlayToneMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_alertType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_topic)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_toneIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_alertType)
  {
    objc_msgSend(v4, "setAlertType:");
    id v4 = v6;
  }
  if (self->_topic)
  {
    objc_msgSend(v6, "setTopic:");
    id v4 = v6;
  }
  if (self->_toneIdentifier)
  {
    objc_msgSend(v6, "setToneIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[33] = self->_shouldRepeat;
    v4[36] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[32] = self->_forPreview;
    v4[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_alertType copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_topic copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_toneIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 33) = self->_shouldRepeat;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v5 + 32) = self->_forPreview;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  alertType = self->_alertType;
  if ((unint64_t)alertType | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](alertType, "isEqual:")) {
      goto LABEL_18;
    }
  }
  topic = self->_topic;
  if ((unint64_t)topic | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](topic, "isEqual:")) {
      goto LABEL_18;
    }
  }
  toneIdentifier = self->_toneIdentifier;
  if ((unint64_t)toneIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](toneIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_18;
    }
    if (self->_shouldRepeat)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_forPreview)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_18;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_18;
      }
      BOOL v8 = 1;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v8 = 0;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_alertType hash];
  NSUInteger v4 = [(NSString *)self->_topic hash];
  NSUInteger v5 = [(NSString *)self->_toneIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_shouldRepeat;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_forPreview;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[NACPlayToneMessage setAlertType:](self, "setAlertType:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[NACPlayToneMessage setTopic:](self, "setTopic:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[NACPlayToneMessage setToneIdentifier:](self, "setToneIdentifier:");
    NSUInteger v4 = v6;
  }
  BOOL v5 = v4[36];
  if ((v5 & 2) != 0)
  {
    self->_shouldRepeat = v4[33];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[36];
  }
  if (v5)
  {
    self->_forPreview = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (void)setToneIdentifier:(id)a3
{
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (BOOL)forPreview
{
  return self->_forPreview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);

  objc_storeStrong((id *)&self->_alertType, 0);
}

@end