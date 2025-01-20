@interface PDARRISO18013DecryptionProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (PDARRISO18013DecryptionProvider)init;
- (PDARRISO18013DecryptionProvider)initWithISO18013Manager:(id)a3;
- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRISO18013DecryptionProvider

- (PDARRISO18013DecryptionProvider)init
{
  return 0;
}

- (PDARRISO18013DecryptionProvider)initWithISO18013Manager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDARRISO18013DecryptionProvider;
  v6 = [(PDARRISO18013DecryptionProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_isoManager, a3);
  }

  return v7;
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = sub_100323430(a3, v8);
  v11 = [v8 pass];
  if ([v8 isPerformingInitialRegistration])
  {
    if (v10 == 3)
    {
      v12 = [v8 previouslyGeneratedSignatureKeyOfType:1];
      v13 = [v12 contents];
      v14 = [v13 firstObject];
      uint64_t v15 = [v14 publicKeyIdentifier];
    }
    else
    {
      if (v10 != 4)
      {
        v21 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v28 = v10;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unexpected payment type: %lu", buf, 0xCu);
        }

        uint64_t v22 = +[NSError errorWithDomain:PKPaymentErrorDomain code:0 userInfo:0];
        goto LABEL_14;
      }
      v12 = [v8 previouslyGeneratedSignatureKeyOfType:12];
      v13 = [v12 contents];
      v14 = [v13 firstObject];
      uint64_t v15 = [v14 keyReferenceIdentifier];
    }
    v19 = (void *)v15;

    if (v19) {
      goto LABEL_9;
    }
LABEL_13:
    uint64_t v22 = PDBasicError();
LABEL_14:
    v23 = (void *)v22;
    (*((void (**)(id, void, void, uint64_t))v9 + 2))(v9, 0, 0, v22);

    goto LABEL_15;
  }
  v16 = [v11 devicePrimaryPaymentApplication];
  v17 = [v16 subcredentials];
  v18 = [v17 anyObject];
  v19 = [v18 identifier];

  if (!v19) {
    goto LABEL_13;
  }
LABEL_9:
  isoManager = self->_isoManager;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1003234CC;
  v24[3] = &unk_1007497E0;
  id v25 = v9;
  uint64_t v26 = v10;
  [(PDISO18013Manager *)isoManager generateISOEncryptionKeyForCardType:v10 subCredentialId:v19 completion:v24];

LABEL_15:
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isPerformingInitialRegistration])
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003239A8;
    v11[3] = &unk_10073A288;
    id v12 = v10;
    [(PDARRISO18013DecryptionProvider *)self isRegisteredForRequirement:v8 context:v9 completion:v11];
  }
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return 0;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 isPerformingInitialRegistration]) {
    goto LABEL_5;
  }
  uint64_t v7 = sub_100323430(v5, v6);
  if (v7 == 3)
  {
    id v8 = [[PDAuxiliaryRegistrationRequirementReference alloc] initWithSignatureType:1];
    id v12 = v8;
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
    goto LABEL_7;
  }
  if (v7 != 4)
  {
LABEL_5:
    id v10 = 0;
    goto LABEL_8;
  }
  id v8 = [[PDAuxiliaryRegistrationRequirementReference alloc] initWithSignatureType:12];
  v13[0] = v8;
  id v9 = [[PDAuxiliaryRegistrationRequirementReference alloc] initWithSignatureType:11];
  v13[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v13 count:2];

LABEL_7:
LABEL_8:

  return v10;
}

- (void).cxx_destruct
{
}

@end