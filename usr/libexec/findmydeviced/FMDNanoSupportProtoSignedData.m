@interface FMDNanoSupportProtoSignedData
- (BOOL)errorOccurred;
- (BOOL)hasImei;
- (BOOL)hasMeid;
- (BOOL)hasProductType;
- (BOOL)hasSerialNumber;
- (BOOL)hasSignedData;
- (BOOL)hasTimeStampMillis;
- (BOOL)hasUdid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)signedData;
- (NSString)imei;
- (NSString)meid;
- (NSString)productType;
- (NSString)serialNumber;
- (NSString)timeStampMillis;
- (NSString)udid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorOccurred:(BOOL)a3;
- (void)setImei:(id)a3;
- (void)setMeid:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSignedData:(id)a3;
- (void)setTimeStampMillis:(id)a3;
- (void)setUdid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FMDNanoSupportProtoSignedData

- (BOOL)hasSignedData
{
  return self->_signedData != 0;
}

- (BOOL)hasUdid
{
  return self->_udid != 0;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasTimeStampMillis
{
  return self->_timeStampMillis != 0;
}

- (BOOL)hasImei
{
  return self->_imei != 0;
}

- (BOOL)hasMeid
{
  return self->_meid != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)FMDNanoSupportProtoSignedData;
  v3 = [(FMDNanoSupportProtoSignedData *)&v7 description];
  v4 = [(FMDNanoSupportProtoSignedData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithBool:self->_errorOccurred];
  [v3 setObject:v4 forKey:@"error_occurred"];

  signedData = self->_signedData;
  if (signedData) {
    [v3 setObject:signedData forKey:@"signed_data"];
  }
  udid = self->_udid;
  if (udid) {
    [v3 setObject:udid forKey:@"udid"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v3 setObject:serialNumber forKey:@"serial_number"];
  }
  productType = self->_productType;
  if (productType) {
    [v3 setObject:productType forKey:@"product_type"];
  }
  timeStampMillis = self->_timeStampMillis;
  if (timeStampMillis) {
    [v3 setObject:timeStampMillis forKey:@"time_stamp_millis"];
  }
  imei = self->_imei;
  if (imei) {
    [v3 setObject:imei forKey:@"imei"];
  }
  meid = self->_meid;
  if (meid) {
    [v3 setObject:meid forKey:@"meid"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoSignedDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteBOOLField();
  if (self->_signedData) {
    PBDataWriterWriteDataField();
  }
  if (self->_udid) {
    PBDataWriterWriteStringField();
  }
  v4 = v5;
  if (self->_serialNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_timeStampMillis)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_imei)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_meid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[64] = self->_errorOccurred;
  id v5 = v4;
  if (self->_signedData)
  {
    [v4 setSignedData:];
    v4 = v5;
  }
  if (self->_udid)
  {
    [v5 setUdid:];
    v4 = v5;
  }
  if (self->_serialNumber)
  {
    [v5 setSerialNumber:];
    v4 = v5;
  }
  if (self->_productType)
  {
    [v5 setProductType:];
    v4 = v5;
  }
  if (self->_timeStampMillis)
  {
    [v5 setTimeStampMillis:];
    v4 = v5;
  }
  if (self->_imei)
  {
    [v5 setImei:];
    v4 = v5;
  }
  if (self->_meid)
  {
    [v5 setMeid:];
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v5[64] = self->_errorOccurred;
  id v6 = [(NSData *)self->_signedData copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v6;

  id v8 = [(NSString *)self->_udid copyWithZone:a3];
  v9 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v8;

  id v10 = [(NSString *)self->_serialNumber copyWithZone:a3];
  v11 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v10;

  id v12 = [(NSString *)self->_productType copyWithZone:a3];
  v13 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v12;

  id v14 = [(NSString *)self->_timeStampMillis copyWithZone:a3];
  v15 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v14;

  id v16 = [(NSString *)self->_imei copyWithZone:a3];
  v17 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v16;

  id v18 = [(NSString *)self->_meid copyWithZone:a3];
  v19 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (self->_errorOccurred)
  {
    if (!*((unsigned char *)v4 + 64)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_20:
    unsigned __int8 v12 = 0;
    goto LABEL_21;
  }
  signedData = self->_signedData;
  if ((unint64_t)signedData | *((void *)v4 + 5) && !-[NSData isEqual:](signedData, "isEqual:")) {
    goto LABEL_20;
  }
  udid = self->_udid;
  if ((unint64_t)udid | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](udid, "isEqual:")) {
      goto LABEL_20;
    }
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:")) {
      goto LABEL_20;
    }
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_20;
    }
  }
  timeStampMillis = self->_timeStampMillis;
  if ((unint64_t)timeStampMillis | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](timeStampMillis, "isEqual:")) {
      goto LABEL_20;
    }
  }
  imei = self->_imei;
  if ((unint64_t)imei | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](imei, "isEqual:")) {
      goto LABEL_20;
    }
  }
  meid = self->_meid;
  if ((unint64_t)meid | *((void *)v4 + 2)) {
    unsigned __int8 v12 = -[NSString isEqual:](meid, "isEqual:");
  }
  else {
    unsigned __int8 v12 = 1;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_errorOccurred;
  unint64_t v4 = (unint64_t)[(NSData *)self->_signedData hash];
  unint64_t v5 = v4 ^ [(NSString *)self->_udid hash];
  unint64_t v6 = v5 ^ [(NSString *)self->_serialNumber hash];
  unint64_t v7 = v6 ^ [(NSString *)self->_productType hash] ^ v3;
  NSUInteger v8 = [(NSString *)self->_timeStampMillis hash];
  unint64_t v9 = v8 ^ [(NSString *)self->_imei hash];
  return v7 ^ v9 ^ [(NSString *)self->_meid hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_errorOccurred = v4[64];
  unint64_t v5 = v4;
  if (*((void *)v4 + 5)) {
    -[FMDNanoSupportProtoSignedData setSignedData:](self, "setSignedData:");
  }
  if (v5[7]) {
    -[FMDNanoSupportProtoSignedData setUdid:](self, "setUdid:");
  }
  if (v5[4]) {
    -[FMDNanoSupportProtoSignedData setSerialNumber:](self, "setSerialNumber:");
  }
  if (v5[3]) {
    -[FMDNanoSupportProtoSignedData setProductType:](self, "setProductType:");
  }
  if (v5[6]) {
    -[FMDNanoSupportProtoSignedData setTimeStampMillis:](self, "setTimeStampMillis:");
  }
  if (v5[1]) {
    -[FMDNanoSupportProtoSignedData setImei:](self, "setImei:");
  }
  if (v5[2]) {
    -[FMDNanoSupportProtoSignedData setMeid:](self, "setMeid:");
  }
}

- (BOOL)errorOccurred
{
  return self->_errorOccurred;
}

- (void)setErrorOccurred:(BOOL)a3
{
  self->_errorOccurred = a3;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
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

- (NSString)timeStampMillis
{
  return self->_timeStampMillis;
}

- (void)setTimeStampMillis:(id)a3
{
}

- (NSString)imei
{
  return self->_imei;
}

- (void)setImei:(id)a3
{
}

- (NSString)meid
{
  return self->_meid;
}

- (void)setMeid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_udid, 0);
  objc_storeStrong((id *)&self->_timeStampMillis, 0);
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_meid, 0);

  objc_storeStrong((id *)&self->_imei, 0);
}

@end