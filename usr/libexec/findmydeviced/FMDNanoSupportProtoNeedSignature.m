@interface FMDNanoSupportProtoNeedSignature
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)dsid;
- (NSString)productType;
- (NSString)serialNumber;
- (NSString)udid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDsid:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUdid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FMDNanoSupportProtoNeedSignature

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)FMDNanoSupportProtoNeedSignature;
  v3 = [(FMDNanoSupportProtoNeedSignature *)&v7 description];
  v4 = [(FMDNanoSupportProtoNeedSignature *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  dsid = self->_dsid;
  if (dsid) {
    [v3 setObject:dsid forKey:@"dsid"];
  }
  udid = self->_udid;
  if (udid) {
    [v4 setObject:udid forKey:@"udid"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v4 setObject:serialNumber forKey:@"serial_number"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"product_type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoNeedSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_dsid) {
    sub_100244634();
  }
  PBDataWriterWriteStringField();
  if (!self->_udid) {
    sub_100244660();
  }
  PBDataWriterWriteStringField();
  if (!self->_serialNumber) {
    sub_10024468C();
  }
  PBDataWriterWriteStringField();
  if (!self->_productType) {
    sub_1002446B8();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  dsid = self->_dsid;
  id v5 = a3;
  [v5 setDsid:dsid];
  [v5 setUdid:self->_udid];
  [v5 setSerialNumber:self->_serialNumber];
  [v5 setProductType:self->_productType];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_dsid copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_udid copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_serialNumber copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(NSString *)self->_productType copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((dsid = self->_dsid, !((unint64_t)dsid | v4[1])) || -[NSString isEqual:](dsid, "isEqual:"))
    && ((udid = self->_udid, !((unint64_t)udid | v4[4])) || -[NSString isEqual:](udid, "isEqual:"))
    && ((serialNumber = self->_serialNumber, !((unint64_t)serialNumber | v4[3]))
     || -[NSString isEqual:](serialNumber, "isEqual:")))
  {
    productType = self->_productType;
    if ((unint64_t)productType | v4[2]) {
      unsigned __int8 v9 = -[NSString isEqual:](productType, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_dsid hash];
  unint64_t v4 = [(NSString *)self->_udid hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_serialNumber hash];
  return v4 ^ v5 ^ [(NSString *)self->_productType hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[1]) {
    -[FMDNanoSupportProtoNeedSignature setDsid:](self, "setDsid:");
  }
  if (v4[4]) {
    -[FMDNanoSupportProtoNeedSignature setUdid:](self, "setUdid:");
  }
  if (v4[3]) {
    -[FMDNanoSupportProtoNeedSignature setSerialNumber:](self, "setSerialNumber:");
  }
  if (v4[2]) {
    -[FMDNanoSupportProtoNeedSignature setProductType:](self, "setProductType:");
  }
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_udid, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end