@interface FMFIDSSupportProtoDeviceInformation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)udid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setUdid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FMFIDSSupportProtoDeviceInformation

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)FMFIDSSupportProtoDeviceInformation;
  v3 = [(FMFIDSSupportProtoDeviceInformation *)&v7 description];
  v4 = [(FMFIDSSupportProtoDeviceInformation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  udid = self->_udid;
  if (udid) {
    [v3 setObject:udid forKey:@"udid"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FMFIDSSupportProtoDeviceInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_udid) {
    sub_100038F44();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_udid copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    udid = self->_udid;
    if ((unint64_t)udid | v4[1]) {
      unsigned __int8 v6 = -[NSString isEqual:](udid, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_udid hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[FMFIDSSupportProtoDeviceInformation setUdid:](self, "setUdid:");
  }
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end