@interface NRAlbertPairingReportWrapper
+ (BOOL)supportsSecureCoding;
- (NRAlbertPairingReportWrapper)initWithAlbertPairingReportData:(id)a3;
- (NRAlbertPairingReportWrapper)initWithCoder:(id)a3;
- (NSData)pairingInfoXML;
- (NSData)phoneCertificate;
- (NSData)phoneSignature;
- (NSDictionary)xmlDictionary;
- (__SecCertificate)_sharedPhoneCertificate;
- (__SecIdentity)_copyPhoneIdentity;
- (id)_phoneCertificateData;
- (id)_signatureWithIdentity:(__SecIdentity *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPairingInfoXML:(id)a3;
- (void)setPhoneCertificate:(id)a3;
- (void)setPhoneSignature:(id)a3;
- (void)setXmlDictionary:(id)a3;
@end

@implementation NRAlbertPairingReportWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRAlbertPairingReportWrapper)initWithAlbertPairingReportData:(id)a3
{
  id v4 = a3;
  v5 = [(NRAlbertPairingReportWrapper *)self init];
  if (!v5) {
    goto LABEL_8;
  }
  v6 = [v4 xmlDictionary];
  uint64_t v7 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:100 options:0 error:0];
  pairingInfoXML = v5->_pairingInfoXML;
  v5->_pairingInfoXML = (NSData *)v7;

  if (!v5->_pairingInfoXML)
  {
    v21 = nr_daemon_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (!v22)
    {
LABEL_18:
      v17 = 0;
      goto LABEL_19;
    }
    v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000F85A0();
    }
LABEL_17:

    goto LABEL_18;
  }
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.NanoRegistry.AlbertPairingReportData", v9);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v10;

  uint64_t v12 = [(NRAlbertPairingReportWrapper *)v5 _phoneCertificateData];
  phoneCertificate = v5->_phoneCertificate;
  v5->_phoneCertificate = (NSData *)v12;

  v14 = [(NRAlbertPairingReportWrapper *)v5 _copyPhoneIdentity];
  uint64_t v15 = [(NRAlbertPairingReportWrapper *)v5 _signatureWithIdentity:v14];
  phoneSignature = v5->_phoneSignature;
  v5->_phoneSignature = (NSData *)v15;

  if (v14) {
    CFRelease(v14);
  }
  if (!v5->_phoneCertificate || !v5->_phoneSignature)
  {
    v18 = nr_daemon_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      v20 = nr_daemon_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000F85D4();
      }
    }
    goto LABEL_17;
  }

LABEL_8:
  v17 = v5;
LABEL_19:

  return v17;
}

- (NRAlbertPairingReportWrapper)initWithCoder:(id)a3
{
  return 0;
}

- (NSDictionary)xmlDictionary
{
  v3 = objc_opt_new();
  id v4 = v3;
  pairingInfoXML = self->_pairingInfoXML;
  if (pairingInfoXML) {
    [v3 setObject:pairingInfoXML forKeyedSubscript:@"PairingInfoXML"];
  }
  phoneCertificate = self->_phoneCertificate;
  if (phoneCertificate) {
    [v4 setObject:phoneCertificate forKeyedSubscript:@"CompanionDeviceCertificate"];
  }
  phoneSignature = self->_phoneSignature;
  if (phoneSignature) {
    [v4 setObject:phoneSignature forKeyedSubscript:@"CompanionDeviceSignature"];
  }

  return (NSDictionary *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  pairingInfoXML = self->_pairingInfoXML;
  id v5 = a3;
  [v5 encodeObject:pairingInfoXML forKey:@"PairingInfoXML"];
  [v5 encodeObject:self->_phoneCertificate forKey:@"CompanionDeviceCertificate"];
  [v5 encodeObject:self->_phoneSignature forKey:@"CompanionDeviceSignature"];
}

- (__SecIdentity)_copyPhoneIdentity
{
  v2 = (__SecIdentity *)+[APSConnection copyIdentity];
  if (!v2)
  {
    v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000F8658();
      }
    }
  }
  return v2;
}

- (__SecCertificate)_sharedPhoneCertificate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FD28;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  return (__SecCertificate *)qword_1001A1130;
}

- (id)_phoneCertificateData
{
  v2 = [(NRAlbertPairingReportWrapper *)self _sharedPhoneCertificate];
  if (v2)
  {
    CFDataRef v3 = SecCertificateCopyData(v2);
    if (v3) {
      goto LABEL_11;
    }
    BOOL v4 = nr_daemon_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000F86F4();
      }
LABEL_9:
    }
  }
  else
  {
    uint64_t v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      v6 = nr_daemon_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000F86C0();
      }
      goto LABEL_9;
    }
  }
  CFDataRef v3 = 0;
LABEL_11:

  return v3;
}

- (id)_signatureWithIdentity:(__SecIdentity *)a3
{
  if (!a3 || (pairingInfoXML = self->_pairingInfoXML) == 0)
  {
    id v10 = 0;
    goto LABEL_15;
  }
  BOOL v5 = pairingInfoXML;
  CFDataRef v6 = [(NSData *)v5 NRSHA256];
  SecKeyRef privateKeyRef = 0;
  if (SecIdentityCopyPrivateKey(a3, &privateKeyRef))
  {
    uint64_t v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000F87C4();
      }
LABEL_7:
    }
  }
  else
  {
    size_t BlockSize = SecKeyGetBlockSize(privateKeyRef);
    if (!BlockSize)
    {
      v17 = nr_daemon_log();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (!v18) {
        goto LABEL_8;
      }
      v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000F8728();
      }
      goto LABEL_7;
    }
    v14 = malloc_type_malloc(BlockSize, 0x89EB98C8uLL);
    if (v14)
    {
      uint64_t v15 = v14;
      CFErrorRef v24 = 0;
      CFDataRef v16 = SecKeyCreateSignature(privateKeyRef, kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA256, v6, &v24);
      CFDataRef v11 = v16;
      if (v24 || !v16)
      {
        v21 = nr_daemon_log();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

        if (v22)
        {
          v23 = nr_daemon_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1000F8790();
          }
        }
        id v10 = 0;
      }
      else
      {
        id v10 = [(__CFData *)v16 copy];
      }
      free(v15);
      goto LABEL_9;
    }
    BOOL v19 = nr_daemon_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (v20)
    {
      v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000F875C();
      }
      goto LABEL_7;
    }
  }
LABEL_8:
  id v10 = 0;
  CFDataRef v11 = 0;
LABEL_9:
  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }
  if (v11) {
    CFRelease(v11);
  }

LABEL_15:

  return v10;
}

- (NSData)pairingInfoXML
{
  return self->_pairingInfoXML;
}

- (void)setPairingInfoXML:(id)a3
{
}

- (NSData)phoneCertificate
{
  return self->_phoneCertificate;
}

- (void)setPhoneCertificate:(id)a3
{
}

- (NSData)phoneSignature
{
  return self->_phoneSignature;
}

- (void)setPhoneSignature:(id)a3
{
}

- (void)setXmlDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmlDictionary, 0);
  objc_storeStrong((id *)&self->_phoneSignature, 0);
  objc_storeStrong((id *)&self->_phoneCertificate, 0);
  objc_storeStrong((id *)&self->_pairingInfoXML, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end