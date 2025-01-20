@interface PUProtoPasscodeState
- (BOOL)hasIsWristDetectionEnabled;
- (BOOL)hasPasscode;
- (BOOL)hasPolicy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocked;
- (BOOL)isUnlockOnly;
- (BOOL)isWristDetectionEnabled;
- (BOOL)readFrom:(id)a3;
- (PUProtoPasscodePolicy)policy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsWristDetectionEnabled:(BOOL)a3;
- (void)setHasPasscode:(BOOL)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setIsUnlockOnly:(BOOL)a3;
- (void)setIsWristDetectionEnabled:(BOOL)a3;
- (void)setPolicy:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PUProtoPasscodeState

- (void)setIsWristDetectionEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isWristDetectionEnabled = a3;
}

- (void)setHasIsWristDetectionEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsWristDetectionEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPolicy
{
  return self->_policy != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PUProtoPasscodeState;
  v3 = [(PUProtoPasscodeState *)&v7 description];
  v4 = [(PUProtoPasscodeState *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithBool:self->_hasPasscode];
  [v3 setObject:v4 forKey:@"hasPasscode"];

  v5 = +[NSNumber numberWithBool:self->_isLocked];
  [v3 setObject:v5 forKey:@"isLocked"];

  v6 = +[NSNumber numberWithBool:self->_isUnlockOnly];
  [v3 setObject:v6 forKey:@"isUnlockOnly"];

  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_isWristDetectionEnabled];
    [v3 setObject:v7 forKey:@"isWristDetectionEnabled"];
  }
  policy = self->_policy;
  if (policy)
  {
    v9 = [(PUProtoPasscodePolicy *)policy dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"policy"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PUProtoPasscodeStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  v4 = v5;
  if (self->_policy)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[16] = self->_hasPasscode;
  v4[17] = self->_isLocked;
  v4[18] = self->_isUnlockOnly;
  if (*(unsigned char *)&self->_has)
  {
    v4[19] = self->_isWristDetectionEnabled;
    v4[20] |= 1u;
  }
  if (self->_policy)
  {
    id v5 = v4;
    objc_msgSend(v4, "setPolicy:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  v5[16] = self->_hasPasscode;
  v5[17] = self->_isLocked;
  v5[18] = self->_isUnlockOnly;
  if (*(unsigned char *)&self->_has)
  {
    v5[19] = self->_isWristDetectionEnabled;
    v5[20] |= 1u;
  }
  id v7 = [(PUProtoPasscodePolicy *)self->_policy copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (self->_hasPasscode)
  {
    if (!*((unsigned char *)v4 + 16)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_18;
  }
  if (self->_isLocked)
  {
    if (!*((unsigned char *)v4 + 17)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 17))
  {
    goto LABEL_18;
  }
  if (self->_isUnlockOnly)
  {
    if (!*((unsigned char *)v4 + 18)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 18))
  {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0) {
      goto LABEL_24;
    }
LABEL_18:
    unsigned __int8 v5 = 0;
    goto LABEL_19;
  }
  if ((*((unsigned char *)v4 + 20) & 1) == 0) {
    goto LABEL_18;
  }
  if (!self->_isWristDetectionEnabled)
  {
    if (!*((unsigned char *)v4 + 19)) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }
  if (!*((unsigned char *)v4 + 19)) {
    goto LABEL_18;
  }
LABEL_24:
  policy = self->_policy;
  if ((unint64_t)policy | *((void *)v4 + 1)) {
    unsigned __int8 v5 = -[PUProtoPasscodePolicy isEqual:](policy, "isEqual:");
  }
  else {
    unsigned __int8 v5 = 1;
  }
LABEL_19:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isWristDetectionEnabled;
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL hasPasscode = self->_hasPasscode;
  BOOL isLocked = self->_isLocked;
  BOOL isUnlockOnly = self->_isUnlockOnly;
  return (2654435761 * isLocked) ^ (2654435761 * hasPasscode) ^ (2654435761 * isUnlockOnly) ^ v5 ^ [(PUProtoPasscodePolicy *)self->_policy hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  self->_BOOL hasPasscode = v4[16];
  self->_BOOL isLocked = v4[17];
  self->_BOOL isUnlockOnly = v4[18];
  if (v4[20])
  {
    self->_isWristDetectionEnabled = v4[19];
    *(unsigned char *)&self->_has |= 1u;
  }
  policy = self->_policy;
  uint64_t v7 = *((void *)v5 + 1);
  if (policy)
  {
    if (v7) {
      -[PUProtoPasscodePolicy mergeFrom:](policy, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PUProtoPasscodeState setPolicy:](self, "setPolicy:");
  }
  _objc_release_x1();
}

- (BOOL)hasPasscode
{
  return self->_hasPasscode;
}

- (void)setHasPasscode:(BOOL)a3
{
  self->_BOOL hasPasscode = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_BOOL isLocked = a3;
}

- (BOOL)isUnlockOnly
{
  return self->_isUnlockOnly;
}

- (void)setIsUnlockOnly:(BOOL)a3
{
  self->_BOOL isUnlockOnly = a3;
}

- (BOOL)isWristDetectionEnabled
{
  return self->_isWristDetectionEnabled;
}

- (PUProtoPasscodePolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end