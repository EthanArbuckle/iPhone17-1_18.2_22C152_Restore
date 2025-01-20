@interface CSDMessagingCallCapabilitiesState
- (BOOL)faceTimeAudioAvailable;
- (BOOL)faceTimeVideoAvailable;
- (BOOL)hasFaceTimeAudioAvailable;
- (BOOL)hasFaceTimeVideoAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingCallCapabilitiesState)initWithCallCapabilitiesState:(id)a3;
- (TUCallCapabilitiesState)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFaceTimeAudioAvailable:(BOOL)a3;
- (void)setFaceTimeVideoAvailable:(BOOL)a3;
- (void)setHasFaceTimeAudioAvailable:(BOOL)a3;
- (void)setHasFaceTimeVideoAvailable:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallCapabilitiesState

- (CSDMessagingCallCapabilitiesState)initWithCallCapabilitiesState:(id)a3
{
  id v4 = a3;
  v5 = [(CSDMessagingCallCapabilitiesState *)self init];
  if (v5)
  {
    -[CSDMessagingCallCapabilitiesState setFaceTimeAudioAvailable:](v5, "setFaceTimeAudioAvailable:", [v4 isFaceTimeAudioAvailable]);
    -[CSDMessagingCallCapabilitiesState setFaceTimeVideoAvailable:](v5, "setFaceTimeVideoAvailable:", [v4 isFaceTimeVideoAvailable]);
  }

  return v5;
}

- (TUCallCapabilitiesState)state
{
  id v3 = objc_alloc_init((Class)TUCallCapabilitiesState);
  objc_msgSend(v3, "setFaceTimeAudioAvailable:", -[CSDMessagingCallCapabilitiesState faceTimeAudioAvailable](self, "faceTimeAudioAvailable"));
  objc_msgSend(v3, "setFaceTimeVideoAvailable:", -[CSDMessagingCallCapabilitiesState faceTimeVideoAvailable](self, "faceTimeVideoAvailable"));

  return (TUCallCapabilitiesState *)v3;
}

- (void)setFaceTimeAudioAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_faceTimeAudioAvailable = a3;
}

- (void)setHasFaceTimeAudioAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFaceTimeAudioAvailable
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFaceTimeVideoAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_faceTimeVideoAvailable = a3;
}

- (void)setHasFaceTimeVideoAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFaceTimeVideoAvailable
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingCallCapabilitiesState;
  char v3 = [(CSDMessagingCallCapabilitiesState *)&v7 description];
  id v4 = [(CSDMessagingCallCapabilitiesState *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithBool:self->_faceTimeAudioAvailable];
    [v3 setObject:v5 forKey:@"faceTimeAudioAvailable"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithBool:self->_faceTimeVideoAvailable];
    [v3 setObject:v6 forKey:@"faceTimeVideoAvailable"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013EAD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[8] = self->_faceTimeAudioAvailable;
    v4[12] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[9] = self->_faceTimeVideoAvailable;
    v4[12] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)result + 8) = self->_faceTimeAudioAvailable;
    *((unsigned char *)result + 12) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 9) = self->_faceTimeVideoAvailable;
    *((unsigned char *)result + 12) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_12;
    }
    if (self->_faceTimeAudioAvailable)
    {
      if (!v4[8]) {
        goto LABEL_12;
      }
    }
    else if (v4[8])
    {
      goto LABEL_12;
    }
  }
  else if (v4[12])
  {
    goto LABEL_12;
  }
  BOOL v5 = (v4[12] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_faceTimeVideoAvailable)
      {
        if (!v4[9]) {
          goto LABEL_12;
        }
      }
      else if (v4[9])
      {
        goto LABEL_12;
      }
      BOOL v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_faceTimeAudioAvailable;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_faceTimeVideoAvailable;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if (v5)
  {
    self->_faceTimeAudioAvailable = v4[8];
    *(unsigned char *)&self->_has |= 1u;
    BOOL v5 = v4[12];
  }
  if ((v5 & 2) != 0)
  {
    self->_faceTimeVideoAvailable = v4[9];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (BOOL)faceTimeAudioAvailable
{
  return self->_faceTimeAudioAvailable;
}

- (BOOL)faceTimeVideoAvailable
{
  return self->_faceTimeVideoAvailable;
}

@end