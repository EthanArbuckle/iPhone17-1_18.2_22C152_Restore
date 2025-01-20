@interface PDARRBarcodeDecryptionProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (PDARRBarcodeDecryptionProvider)init;
- (PDARRBarcodeDecryptionProvider)initWithBarcodeCertificateManager:(id)a3;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRBarcodeDecryptionProvider

- (PDARRBarcodeDecryptionProvider)init
{
  return 0;
}

- (PDARRBarcodeDecryptionProvider)initWithBarcodeCertificateManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDARRBarcodeDecryptionProvider;
  v6 = [(PDARRBarcodeDecryptionProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_barcodeCertManager, a3);
  }

  return v7;
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  v7 = (void (**)(id, id, id, id))a5;
  id v8 = a4;
  objc_super v9 = [v8 pass];
  v10 = [v9 deviceAccountIdentifier];

  v11 = [v8 seSession];

  id v12 = objc_alloc_init((Class)NSMutableSet);
  v13 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager fetchCertificatesForDeviceAccountIdentifier:v10 withCertificateType:1];
  v35 = [v13 firstObject];
  if (v35 && PKBarcodeCreateAndValidateTrustWithCerts(v13, 0, 1))
  {
    v14 = PKAuxiliaryCapabilityKeyForCertificateType(1uLL);
    [v12 addObject:v14];

    id v15 = 0;
    id v16 = 0;
  }
  else
  {
    [(PDBarcodeCertificateManager *)self->_barcodeCertManager removeKeysAndCertificatesForDeviceAccountIdentifier:v10 withCertificateType:1 session:v11];
    barcodeCertManager = self->_barcodeCertManager;
    id v36 = 0;
    v18 = [(PDBarcodeCertificateManager *)barcodeCertManager createKeyAndSEAttestationForCertificateType:1 withDeviceAccountIdentifier:v10 session:v11 outError:&v36];
    id v19 = v36;
    id v16 = objc_alloc_init((Class)PKAuxiliaryCapabilityRequirementKeyMaterialContent);
    v38 = v18;
    v34 = self;
    v20 = v10;
    v21 = v13;
    id v22 = v12;
    v23 = v11;
    v24 = v7;
    v25 = +[NSArray arrayWithObjects:&v38 count:1];
    [v16 setAttestation:v25];

    id v26 = objc_alloc((Class)PKAuxiliaryCapabilityRequirementKeyMaterial);
    id v37 = v16;
    v27 = +[NSArray arrayWithObjects:&v37 count:1];
    id v15 = [v26 initWithKeyMaterialContents:v27];

    v7 = v24;
    v11 = v23;
    id v12 = v22;
    v13 = v21;
    v10 = v20;
    self = v34;

    if (v19) {
      goto LABEL_9;
    }
  }
  v28 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager fetchCertificatesForDeviceAccountIdentifier:v10 withCertificateType:3];
  v29 = [v28 firstObject];
  if (v29 && PKBarcodeCreateAndValidateTrustWithCerts(v28, 0, 3))
  {
    PKAuxiliaryCapabilityKeyForCertificateType(3uLL);
    v30 = v12;
    v31 = v11;
    v33 = v32 = v7;
    [v30 addObject:v33];

    v7 = v32;
    v11 = v31;
    id v12 = v30;
  }

  id v19 = 0;
LABEL_9:
  v7[2](v7, v15, v12, v19);
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
  id v28 = a3;
  v11 = (void (**)(id, id))a7;
  id v12 = a4;
  v13 = [a6 pass];
  v14 = [v13 paymentPass];

  id v15 = [v28 contents];
  if ([v15 count])
  {
    id v16 = [v28 contents];
    v17 = [v16 firstObject];
    v18 = [v17 certificateChain];
  }
  else
  {
    v18 = 0;
  }

  id v19 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager validateAndStoreCertificateChain:v18 withCertificateType:1 forPass:v14];
  v20 = [v12 contents];

  if ([v20 count])
  {
    v21 = [v28 contents];
    id v22 = [v21 firstObject];
    v23 = [v22 certificateChain];
  }
  else
  {
    v23 = 0;
  }

  uint64_t v24 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager validateAndStoreCertificateChain:v23 withCertificateType:3 forPass:v14];
  v25 = (void *)v24;
  if (v19) {
    id v26 = v19;
  }
  else {
    id v26 = (void *)v24;
  }
  id v27 = v26;
  v11[2](v11, v27);
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return a3 == 0;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
}

@end