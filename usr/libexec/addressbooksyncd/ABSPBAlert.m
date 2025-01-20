@interface ABSPBAlert
- (BOOL)hasIgnoreMute;
- (BOOL)hasSound;
- (BOOL)hasVibration;
- (BOOL)ignoreMute;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sound;
- (NSString)vibration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIgnoreMute:(BOOL)a3;
- (void)setIgnoreMute:(BOOL)a3;
- (void)setSound:(id)a3;
- (void)setVibration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBAlert

- (BOOL)hasSound
{
  return self->_sound != 0;
}

- (BOOL)hasVibration
{
  return self->_vibration != 0;
}

- (void)setIgnoreMute:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ignoreMute = a3;
}

- (void)setHasIgnoreMute:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIgnoreMute
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBAlert;
  v3 = [(ABSPBAlert *)&v7 description];
  v4 = [(ABSPBAlert *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  sound = self->_sound;
  if (sound) {
    [v3 setObject:sound forKey:@"sound"];
  }
  vibration = self->_vibration;
  if (vibration) {
    [v4 setObject:vibration forKey:@"vibration"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_ignoreMute];
    [v4 setObject:v7 forKey:@"ignoreMute"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBAlertReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sound)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_vibration)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sound)
  {
    [v4 setSound:];
    id v4 = v5;
  }
  if (self->_vibration)
  {
    [v5 setVibration:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_ignoreMute;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_sound copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_vibration copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 24) = self->_ignoreMute;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  sound = self->_sound;
  if ((unint64_t)sound | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](sound, "isEqual:")) {
      goto LABEL_8;
    }
  }
  vibration = self->_vibration;
  if ((unint64_t)vibration | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](vibration, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_ignoreMute)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sound hash];
  NSUInteger v4 = [(NSString *)self->_vibration hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_ignoreMute;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[ABSPBAlert setSound:](self, "setSound:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[ABSPBAlert setVibration:](self, "setVibration:");
    NSUInteger v4 = v5;
  }
  if (v4[28])
  {
    self->_ignoreMute = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (NSString)vibration
{
  return self->_vibration;
}

- (void)setVibration:(id)a3
{
}

- (BOOL)ignoreMute
{
  return self->_ignoreMute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibration, 0);

  objc_storeStrong((id *)&self->_sound, 0);
}

@end