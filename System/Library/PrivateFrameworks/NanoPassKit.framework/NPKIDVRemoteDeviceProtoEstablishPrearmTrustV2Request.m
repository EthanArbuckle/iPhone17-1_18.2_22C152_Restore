@interface NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request
- (BOOL)hasTrustData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)trustData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTrustData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request

- (BOOL)hasTrustData
{
  return self->_trustData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request;
  v4 = [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  trustData = self->_trustData;
  if (trustData) {
    [v3 setObject:trustData forKey:@"trustData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2RequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_trustData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  trustData = self->_trustData;
  if (trustData) {
    [a3 setTrustData:trustData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_trustData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    trustData = self->_trustData;
    if ((unint64_t)trustData | v4[1]) {
      char v6 = -[NSData isEqual:](trustData, "isEqual:");
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
  return [(NSData *)self->_trustData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request setTrustData:](self, "setTrustData:");
  }
}

- (NSData)trustData
{
  return self->_trustData;
}

- (void)setTrustData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end