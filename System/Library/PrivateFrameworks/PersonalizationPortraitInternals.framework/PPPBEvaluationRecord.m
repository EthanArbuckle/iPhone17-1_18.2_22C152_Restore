@interface PPPBEvaluationRecord
- (BOOL)hasContents;
- (BOOL)hasDeviceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)deviceId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContents:(id)a3;
- (void)setDeviceId:(int64_t)a3;
- (void)setHasDeviceId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBEvaluationRecord

- (void).cxx_destruct
{
}

- (int64_t)deviceId
{
  return self->_deviceId;
}

- (void)setContents:(id)a3
{
}

- (NSString)contents
{
  return self->_contents;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[PPPBEvaluationRecord setContents:](self, "setContents:");
    v4 = v5;
  }
  if (v4[3])
  {
    self->_deviceId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contents hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_deviceId;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  contents = self->_contents;
  if ((unint64_t)contents | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](contents, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_deviceId == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_contents copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_deviceId;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_contents)
  {
    id v5 = v4;
    objc_msgSend(v4, "setContents:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_deviceId;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contents)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBEvaluationRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  contents = self->_contents;
  if (contents) {
    [v3 setObject:contents forKey:@"contents"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithLongLong:self->_deviceId];
    [v4 setObject:v6 forKey:@"deviceId"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBEvaluationRecord;
  id v4 = [(PPPBEvaluationRecord *)&v8 description];
  id v5 = [(PPPBEvaluationRecord *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDeviceId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDeviceId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDeviceId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deviceId = a3;
}

- (BOOL)hasContents
{
  return self->_contents != 0;
}

@end