@interface SPRPINCrypto
- (SPRPINCrypto)initWithAttestationData:(id)a3 casdCertificate:(id)a4 error:(id *)a5;
- (SPRPINCrypto)initWithPeerPublicKey:(__SecKey *)a3;
- (__SecKey)peerPublicKey;
- (id)encryptDigit:(unsigned __int8)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation SPRPINCrypto

- (SPRPINCrypto)initWithPeerPublicKey:(__SecKey *)a3
{
  self->_peerPublicKey = a3;
  return self;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend_pinCrypto(SPRLogger, a2, v2, v3, v4, v5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl(&dword_221247000, v7, OS_LOG_TYPE_INFO, "%@.dealloc()", buf, 0xCu);
  }

  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey)
  {
    CFRelease(peerPublicKey);
    self->_peerPublicKey = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)SPRPINCrypto;
  [(SPRPINCrypto *)&v9 dealloc];
}

- (__SecKey)peerPublicKey
{
  return self->_peerPublicKey;
}

- (SPRPINCrypto)initWithAttestationData:(id)a3 casdCertificate:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_22127D8B8();
  unint64_t v10 = v9;

  uint64_t v11 = sub_22127D8B8();
  unint64_t v13 = v12;

  return (SPRPINCrypto *)sub_22125E230(v8, v10, v11, v13);
}

- (id)encryptDigit:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v4 = self;
  uint64_t v5 = sub_22125ECC8();
  unint64_t v7 = v6;

  uint64_t v8 = (void *)sub_22127D898();
  sub_22125C910(v5, v7);
  return v8;
}

@end