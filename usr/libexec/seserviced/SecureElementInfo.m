@interface SecureElementInfo
+ (id)withSEID:(id)a3 casdCertificate:(id)a4 casdCertificateRSA:(id)a5 isProd:(BOOL)a6 isSkyOrLater:(BOOL)a7 secureElementType:(unint64_t)a8 csn:(unint64_t)a9 chipID:(unint64_t)a10;
- (BOOL)isProd;
- (BOOL)isSkyOrLater;
- (NSData)casdCertificate;
- (NSData)casdCertificateRSA;
- (NSData)seid;
- (unint64_t)chipId;
- (unint64_t)csn;
- (unint64_t)type;
@end

@implementation SecureElementInfo

+ (id)withSEID:(id)a3 casdCertificate:(id)a4 casdCertificateRSA:(id)a5 isProd:(BOOL)a6 isSkyOrLater:(BOOL)a7 secureElementType:(unint64_t)a8 csn:(unint64_t)a9 chipID:(unint64_t)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  uint64_t v18 = objc_opt_new();
  v19 = *(void **)(v18 + 16);
  *(void *)(v18 + 16) = v15;
  id v20 = v15;

  v21 = *(void **)(v18 + 24);
  *(void *)(v18 + 24) = v16;
  id v22 = v16;

  v23 = *(void **)(v18 + 32);
  *(void *)(v18 + 32) = v17;

  *(unsigned char *)(v18 + 8) = a6;
  *(unsigned char *)(v18 + 9) = a7;
  *(void *)(v18 + 40) = a8;
  *(void *)(v18 + 48) = a9;
  *(void *)(v18 + 56) = a10;

  return (id)v18;
}

- (NSData)seid
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)casdCertificate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)casdCertificateRSA
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isProd
{
  return self->_isProd;
}

- (BOOL)isSkyOrLater
{
  return self->_isSkyOrLater;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)csn
{
  return self->_csn;
}

- (unint64_t)chipId
{
  return self->_chipId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casdCertificateRSA, 0);
  objc_storeStrong((id *)&self->_casdCertificate, 0);

  objc_storeStrong((id *)&self->_seid, 0);
}

@end