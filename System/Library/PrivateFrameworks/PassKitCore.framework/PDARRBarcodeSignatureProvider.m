@interface PDARRBarcodeSignatureProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (PDARRBarcodeSignatureProvider)init;
- (PDARRBarcodeSignatureProvider)initWithBarcodeCertificateManager:(id)a3;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRBarcodeSignatureProvider

- (PDARRBarcodeSignatureProvider)init
{
  return 0;
}

- (PDARRBarcodeSignatureProvider)initWithBarcodeCertificateManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDARRBarcodeSignatureProvider;
  v6 = [(PDARRBarcodeSignatureProvider *)&v9 init];
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
  v13 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager fetchCertificatesForDeviceAccountIdentifier:v10 withCertificateType:0];
  v14 = [v13 firstObject];
  if (v14 && PKBarcodeCreateAndValidateTrustWithCerts(v13, 0, 0))
  {
    v15 = PKAuxiliaryCapabilityKeyForCertificateType(0);
    [v12 addObject:v15];

    id v16 = 0;
  }
  else
  {
    [(PDBarcodeCertificateManager *)self->_barcodeCertManager removeKeysAndCertificatesForDeviceAccountIdentifier:v10 withCertificateType:0 session:v11];
    barcodeCertManager = self->_barcodeCertManager;
    id v31 = 0;
    [(PDBarcodeCertificateManager *)barcodeCertManager createKeyAndSEAttestationForCertificateType:0 withDeviceAccountIdentifier:v10 session:v11 outError:&v31];
    v29 = v7;
    v18 = v30 = v11;
    id v19 = v31;
    id v20 = objc_alloc_init((Class)PKAuxiliaryCapabilityRequirementKeyMaterialContent);
    v33 = v18;
    id v21 = v12;
    v22 = +[NSArray arrayWithObjects:&v33 count:1];
    [v20 setAttestation:v22];

    id v23 = objc_alloc((Class)PKAuxiliaryCapabilityRequirementKeyMaterial);
    id v32 = v20;
    v24 = +[NSArray arrayWithObjects:&v32 count:1];
    id v16 = [v23 initWithKeyMaterialContents:v24];

    id v12 = v21;
    v7 = v29;
    v11 = v30;
    if (v19)
    {
      v25 = v13;
      v26 = v14;
      goto LABEL_10;
    }
  }
  v25 = -[PDBarcodeCertificateManager fetchCertificatesForDeviceAccountIdentifier:withCertificateType:](self->_barcodeCertManager, "fetchCertificatesForDeviceAccountIdentifier:withCertificateType:", v10, 2, v29, v30);

  v26 = [v25 firstObject];

  if (v26 && PKBarcodeCreateAndValidateTrustWithCerts(v25, 0, 2))
  {
    PKAuxiliaryCapabilityKeyForCertificateType(2uLL);
    v28 = v27 = v12;
    [v27 addObject:v28];

    id v12 = v27;
  }
  id v19 = 0;
LABEL_10:
  v7[2](v7, v16, v12, v19);
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
  id v28 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id))a7;
  v13 = [a6 pass];
  v14 = [v13 paymentPass];

  v15 = [v28 contents];
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

  id v19 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager validateAndStoreCertificateChain:v18 withCertificateType:0 forPass:v14];
  id v20 = [v11 contents];
  if ([v20 count])
  {
    id v21 = [v11 contents];
    v22 = [v21 firstObject];
    id v23 = [v22 certificateChain];
  }
  else
  {
    id v23 = 0;
  }

  uint64_t v24 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager validateAndStoreCertificateChain:v23 withCertificateType:2 forPass:v14];
  v25 = (void *)v24;
  if (v19) {
    v26 = v19;
  }
  else {
    v26 = (void *)v24;
  }
  id v27 = v26;
  v12[2](v12, v27);
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