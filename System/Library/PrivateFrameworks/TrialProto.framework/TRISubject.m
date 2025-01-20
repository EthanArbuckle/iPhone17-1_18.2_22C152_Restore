@interface TRISubject
- (BOOL)hasDeviceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRISubject

- (BOOL)readFrom:(id)a3
{
  return TRISubjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (BOOL)hasDeviceId
{
  return self->_deviceId != 0;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRISubject;
  v4 = [(TRISubject *)&v8 description];
  v5 = [(TRISubject *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  deviceId = self->_deviceId;
  if (deviceId) {
    [v3 setObject:deviceId forKey:@"device_id"];
  }
  return v4;
}

- (void)writeTo:(id)a3
{
  if (self->_deviceId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  deviceId = self->_deviceId;
  if (deviceId) {
    [a3 setDeviceId:deviceId];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    deviceId = self->_deviceId;
    if ((unint64_t)deviceId | v4[1]) {
      char v6 = -[NSString isEqual:](deviceId, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_deviceId hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[TRISubject setDeviceId:](self, "setDeviceId:");
  }
}

- (void)setDeviceId:(id)a3
{
}

@end