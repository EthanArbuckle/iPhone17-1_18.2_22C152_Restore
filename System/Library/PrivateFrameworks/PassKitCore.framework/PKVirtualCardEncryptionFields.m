@interface PKVirtualCardEncryptionFields
- (PKVirtualCardEncryptionFields)init;
- (PKVirtualCardEncryptionFields)initWithCertificates:(id)a3;
- (id)dictionaryRepresentation;
- (void)prepareCertificateWithQueue:(id)a3 completion:(id)a4;
- (void)prepareOneTimeCertificateWithQueue:(id)a3 completion:(id)a4;
@end

@implementation PKVirtualCardEncryptionFields

- (PKVirtualCardEncryptionFields)initWithCertificates:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKVirtualCardEncryptionFields;
  v5 = [(PKVirtualCardEncryptionFields *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v6;

    objc_storeStrong((id *)&v5->_encryptionVersion, @"EV_ECC_v1");
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (PKVirtualCardEncryptionFields)init
{
  return [(PKVirtualCardEncryptionFields *)self initWithCertificates:0];
}

- (void)prepareCertificateWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Getting persistent BAA certificate for web request", buf, 2u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PKVirtualCardEncryptionFields_prepareCertificateWithQueue_completion___block_invoke;
  v10[3] = &unk_1E56E8BD8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  PKPersistentBAACertificateAndKey(0, v6, v10);
}

void __72__PKVirtualCardEncryptionFields_prepareCertificateWithQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (void)prepareOneTimeCertificateWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Getting one time BAA certificate for web request", buf, 2u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__PKVirtualCardEncryptionFields_prepareOneTimeCertificateWithQueue_completion___block_invoke;
  v10[3] = &unk_1E56E8BD8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  PKGenerateOneTimeBAACertificate(0, v6, v10);
}

void __79__PKVirtualCardEncryptionFields_prepareOneTimeCertificateWithQueue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  id v8 = a4;
  uint64_t v9 = [v13 count];
  if (!v8 && a3 && v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
    uint64_t v10 = *(void *)(a1 + 40);
    if (!v10) {
      goto LABEL_9;
    }
    id v11 = *(void (**)(void))(v10 + 16);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (!v12) {
      goto LABEL_9;
    }
    id v11 = *(void (**)(void))(v12 + 16);
  }
  v11();
LABEL_9:
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock(&self->_lock);
  if ([(NSArray *)self->_certificates count])
  {
    uint64_t v4 = [(NSArray *)self->_certificates pk_arrayByApplyingBlock:&__block_literal_global_393];
    [v3 setObject:v4 forKeyedSubscript:@"certificates"];
  }
  os_unfair_lock_unlock(&self->_lock);
  encryptionVersion = self->_encryptionVersion;
  if (encryptionVersion) {
    [v3 setObject:encryptionVersion forKeyedSubscript:@"encryptionVersion"];
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

uint64_t __57__PKVirtualCardEncryptionFields_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 base64EncodedStringWithOptions:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end