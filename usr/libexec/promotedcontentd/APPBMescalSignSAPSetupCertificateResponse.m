@interface APPBMescalSignSAPSetupCertificateResponse
+ (id)options;
- (BOOL)hasCertificate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)certificate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCertificate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBMescalSignSAPSetupCertificateResponse

+ (id)options
{
  if (qword_1002899B0 != -1) {
    dispatch_once(&qword_1002899B0, &stru_1002357D8);
  }
  v2 = (void *)qword_1002899A8;

  return v2;
}

- (BOOL)hasCertificate
{
  return self->_certificate != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBMescalSignSAPSetupCertificateResponse;
  v3 = [(APPBMescalSignSAPSetupCertificateResponse *)&v7 description];
  v4 = [(APPBMescalSignSAPSetupCertificateResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  certificate = self->_certificate;
  if (certificate) {
    [v3 setObject:certificate forKey:@"certificate"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBMescalSignSAPSetupCertificateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_certificate) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  certificate = self->_certificate;
  if (certificate) {
    _[a3 setCertificate:certificate];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_certificate copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    certificate = self->_certificate;
    if ((unint64_t)certificate | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](certificate, "isEqual:");
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
  return (unint64_t)[(NSData *)self->_certificate hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[APPBMescalSignSAPSetupCertificateResponse setCertificate:](self, "setCertificate:");
  }
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end