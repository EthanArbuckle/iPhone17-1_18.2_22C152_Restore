@interface AWDVisualVoicemailTranscriptionStats
- (BOOL)hasConfidencelevel;
- (BOOL)hasLanguage;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasResult;
- (BOOL)hasSubsid;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)result;
- (NSString)language;
- (NSString)mcc;
- (NSString)mnc;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)confidencelevel;
- (unsigned)subsid;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidencelevel:(unsigned int)a3;
- (void)setHasConfidencelevel:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasSubsid:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setMcc:(id)a3;
- (void)setMnc:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setSubsid:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDVisualVoicemailTranscriptionStats

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResult:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResult
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSubsid:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subsid = a3;
}

- (void)setHasSubsid:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsid
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasMcc
{
  return self->_mcc != 0;
}

- (BOOL)hasMnc
{
  return self->_mnc != 0;
}

- (void)setConfidencelevel:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_confidencelevel = a3;
}

- (void)setHasConfidencelevel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidencelevel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDVisualVoicemailTranscriptionStats;
  char v3 = [(AWDVisualVoicemailTranscriptionStats *)&v7 description];
  v4 = [(AWDVisualVoicemailTranscriptionStats *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v11 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v12 = +[NSNumber numberWithBool:self->_result];
  [v3 setObject:v12 forKey:@"result"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithUnsignedInt:self->_subsid];
    [v3 setObject:v5 forKey:@"subsid"];
  }
LABEL_5:
  mcc = self->_mcc;
  if (mcc) {
    [v3 setObject:mcc forKey:@"mcc"];
  }
  mnc = self->_mnc;
  if (mnc) {
    [v3 setObject:mnc forKey:@"mnc"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_confidencelevel];
    [v3 setObject:v8 forKey:@"confidencelevel"];
  }
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100014D78((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_mcc)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_mnc)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 52) = self->_result;
  *((unsigned char *)v4 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 12) = self->_subsid;
    *((unsigned char *)v4 + 56) |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_mcc)
  {
    objc_msgSend(v4, "setMcc:");
    id v4 = v6;
  }
  if (self->_mnc)
  {
    objc_msgSend(v6, "setMnc:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_confidencelevel;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  if (self->_language)
  {
    objc_msgSend(v6, "setLanguage:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 52) = self->_result;
  *((unsigned char *)v5 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 12) = self->_subsid;
    *((unsigned char *)v5 + 56) |= 4u;
  }
LABEL_5:
  id v8 = [(NSString *)self->_mcc copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  id v10 = [(NSString *)self->_mnc copyWithZone:a3];
  v11 = (void *)v6[5];
  v6[5] = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_confidencelevel;
    *((unsigned char *)v6 + 56) |= 2u;
  }
  id v12 = [(NSString *)self->_language copyWithZone:a3];
  v13 = (void *)v6[3];
  v6[3] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) != 0)
    {
      if (self->_result)
      {
        if (!*((unsigned char *)v4 + 52)) {
          goto LABEL_31;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_15;
      }
    }
LABEL_31:
    unsigned __int8 v8 = 0;
    goto LABEL_32;
  }
  if ((*((unsigned char *)v4 + 56) & 8) != 0) {
    goto LABEL_31;
  }
LABEL_15:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_subsid != *((_DWORD *)v4 + 12)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_31;
  }
  mcc = self->_mcc;
  if ((unint64_t)mcc | *((void *)v4 + 4) && !-[NSString isEqual:](mcc, "isEqual:")) {
    goto LABEL_31;
  }
  mnc = self->_mnc;
  if ((unint64_t)mnc | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](mnc, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_confidencelevel != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_31;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[NSString isEqual:](language, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_32:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v3 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_result;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_subsid;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_mcc hash];
  NSUInteger v7 = [(NSString *)self->_mnc hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_confidencelevel;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_language hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_result = *((unsigned char *)v4 + 52);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_4:
    self->_subsid = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[AWDVisualVoicemailTranscriptionStats setMcc:](self, "setMcc:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[AWDVisualVoicemailTranscriptionStats setMnc:](self, "setMnc:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    self->_confidencelevel = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[AWDVisualVoicemailTranscriptionStats setLanguage:](self, "setLanguage:");
    id v4 = v6;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)result
{
  return self->_result;
}

- (unsigned)subsid
{
  return self->_subsid;
}

- (NSString)mcc
{
  return self->_mcc;
}

- (void)setMcc:(id)a3
{
}

- (NSString)mnc
{
  return self->_mnc;
}

- (void)setMnc:(id)a3
{
}

- (unsigned)confidencelevel
{
  return self->_confidencelevel;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end