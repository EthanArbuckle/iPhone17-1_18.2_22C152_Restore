@interface PUProtoRequestCompleted
- (BOOL)hasErrorData;
- (BOOL)hasPasscodeState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)errorData;
- (PUProtoPasscodeState)passcodeState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)messageID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setMessageID:(unsigned int)a3;
- (void)setPasscodeState:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PUProtoRequestCompleted

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasPasscodeState
{
  return self->_passcodeState != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PUProtoRequestCompleted;
  v3 = [(PUProtoRequestCompleted *)&v7 description];
  v4 = [(PUProtoRequestCompleted *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithUnsignedInt:self->_messageID];
  [v3 setObject:v4 forKey:@"messageID"];

  v5 = +[NSNumber numberWithBool:self->_success];
  [v3 setObject:v5 forKey:@"success"];

  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  passcodeState = self->_passcodeState;
  if (passcodeState)
  {
    v8 = [(PUProtoPasscodeState *)passcodeState dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"passcodeState"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PUProtoRequestCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
  if (self->_passcodeState) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[4] = self->_messageID;
  *((unsigned char *)v4 + 32) = self->_success;
  v5 = v4;
  if (self->_errorData)
  {
    objc_msgSend(v4, "setErrorData:");
    id v4 = v5;
  }
  if (self->_passcodeState)
  {
    objc_msgSend(v5, "setPasscodeState:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[4] = self->_messageID;
  *((unsigned char *)v5 + 32) = self->_success;
  id v6 = [(NSData *)self->_errorData copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  id v8 = [(PUProtoPasscodeState *)self->_passcodeState copyWithZone:a3];
  v9 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_messageID != *((_DWORD *)v4 + 4)) {
    goto LABEL_11;
  }
  if (self->_success)
  {
    if (!*((unsigned char *)v4 + 32)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1) && !-[NSData isEqual:](errorData, "isEqual:")) {
    goto LABEL_11;
  }
  passcodeState = self->_passcodeState;
  if ((unint64_t)passcodeState | *((void *)v4 + 3)) {
    unsigned __int8 v7 = -[PUProtoPasscodeState isEqual:](passcodeState, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = (2654435761 * self->_success) ^ (2654435761 * self->_messageID);
  unint64_t v4 = (unint64_t)[(NSData *)self->_errorData hash];
  return v3 ^ v4 ^ [(PUProtoPasscodeState *)self->_passcodeState hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_messageID = *((_DWORD *)v4 + 4);
  self->_success = *((unsigned char *)v4 + 32);
  id v7 = v4;
  if (*((void *)v4 + 1))
  {
    -[PUProtoRequestCompleted setErrorData:](self, "setErrorData:");
    id v4 = v7;
  }
  passcodeState = self->_passcodeState;
  uint64_t v6 = *((void *)v4 + 3);
  if (passcodeState)
  {
    if (v6) {
      -[PUProtoPasscodeState mergeFrom:](passcodeState, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PUProtoRequestCompleted setPasscodeState:](self, "setPasscodeState:");
  }
  _objc_release_x1();
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned int)a3
{
  self->_messageID = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (PUProtoPasscodeState)passcodeState
{
  return self->_passcodeState;
}

- (void)setPasscodeState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeState, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end