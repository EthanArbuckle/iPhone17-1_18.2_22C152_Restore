@interface NSPPrivacyProxyBAAValidation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)baaSignature;
- (NSData)intermediateCertificate;
- (NSData)leafCertificate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaaSignature:(id)a3;
- (void)setIntermediateCertificate:(id)a3;
- (void)setLeafCertificate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyBAAValidation

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyBAAValidation;
  v4 = [(NSPPrivacyProxyBAAValidation *)&v8 description];
  v5 = [(NSPPrivacyProxyBAAValidation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  baaSignature = self->_baaSignature;
  if (baaSignature) {
    [v3 setObject:baaSignature forKey:@"baaSignature"];
  }
  leafCertificate = self->_leafCertificate;
  if (leafCertificate) {
    [v4 setObject:leafCertificate forKey:@"leafCertificate"];
  }
  intermediateCertificate = self->_intermediateCertificate;
  if (intermediateCertificate) {
    [v4 setObject:intermediateCertificate forKey:@"intermediateCertificate"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyBAAValidationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_baaSignature) {
    __assert_rtn("-[NSPPrivacyProxyBAAValidation writeTo:]", "NSPPrivacyProxyBAAValidation.m", 111, "nil != self->_baaSignature");
  }
  PBDataWriterWriteDataField();
  if (!self->_leafCertificate) {
    __assert_rtn("-[NSPPrivacyProxyBAAValidation writeTo:]", "NSPPrivacyProxyBAAValidation.m", 116, "nil != self->_leafCertificate");
  }
  PBDataWriterWriteDataField();
  if (!self->_intermediateCertificate) {
    __assert_rtn("-[NSPPrivacyProxyBAAValidation writeTo:]", "NSPPrivacyProxyBAAValidation.m", 121, "nil != self->_intermediateCertificate");
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  baaSignature = self->_baaSignature;
  id v5 = a3;
  [v5 setBaaSignature:baaSignature];
  [v5 setLeafCertificate:self->_leafCertificate];
  [v5 setIntermediateCertificate:self->_intermediateCertificate];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_baaSignature copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_leafCertificate copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_intermediateCertificate copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((baaSignature = self->_baaSignature, !((unint64_t)baaSignature | v4[1]))
     || -[NSData isEqual:](baaSignature, "isEqual:"))
    && ((leafCertificate = self->_leafCertificate, !((unint64_t)leafCertificate | v4[3]))
     || -[NSData isEqual:](leafCertificate, "isEqual:")))
  {
    intermediateCertificate = self->_intermediateCertificate;
    if ((unint64_t)intermediateCertificate | v4[2]) {
      char v8 = -[NSData isEqual:](intermediateCertificate, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_baaSignature hash];
  uint64_t v4 = [(NSData *)self->_leafCertificate hash] ^ v3;
  return v4 ^ [(NSData *)self->_intermediateCertificate hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[1]) {
    -[NSPPrivacyProxyBAAValidation setBaaSignature:](self, "setBaaSignature:");
  }
  if (v4[3]) {
    -[NSPPrivacyProxyBAAValidation setLeafCertificate:](self, "setLeafCertificate:");
  }
  if (v4[2]) {
    -[NSPPrivacyProxyBAAValidation setIntermediateCertificate:](self, "setIntermediateCertificate:");
  }
}

- (NSData)baaSignature
{
  return self->_baaSignature;
}

- (void)setBaaSignature:(id)a3
{
}

- (NSData)leafCertificate
{
  return self->_leafCertificate;
}

- (void)setLeafCertificate:(id)a3
{
}

- (NSData)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (void)setIntermediateCertificate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_baaSignature, 0);
}

@end