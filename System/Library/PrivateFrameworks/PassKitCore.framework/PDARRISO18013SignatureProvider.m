@interface PDARRISO18013SignatureProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (PDARRISO18013SignatureProvider)init;
- (PDARRISO18013SignatureProvider)initWithISO18013Manager:(id)a3;
- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRISO18013SignatureProvider

- (PDARRISO18013SignatureProvider)init
{
  return 0;
}

- (PDARRISO18013SignatureProvider)initWithISO18013Manager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDARRISO18013SignatureProvider;
  v6 = [(PDARRISO18013SignatureProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_isoManager, a3);
  }

  return v7;
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 pass];
  v12 = [v11 devicePrimaryPaymentApplication];
  v13 = [v12 subcredentials];
  v14 = [v13 anyObject];
  v15 = [v14 identifier];

  if (!v15)
  {
    v16 = [v9 previouslyGeneratedSignatureKeyOfType:12];
    v17 = [v16 contents];
    v18 = [v17 firstObject];
    v15 = [v18 keyReferenceIdentifier];

    if (!v15)
    {
      v22 = PDBasicError();
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v22);

      goto LABEL_9;
    }
  }
  uint64_t v19 = (uint64_t)[v11 cardType];
  if (!v19)
  {
    if ([v9 isPerformingInitialRegistration]) {
      uint64_t v19 = 4;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  isoManager = self->_isoManager;
  id v21 = [v8 numberOfKeys];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10014A568;
  v23[3] = &unk_10073A260;
  id v24 = v10;
  [(PDISO18013Manager *)isoManager generatePresentmentKeyForCardType:v19 numberOfKeys:v21 subCredentialId:v15 completion:v23];

LABEL_9:
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 pass];
  v11 = [v10 devicePrimaryPaymentApplication];
  v12 = [v11 subcredentials];
  v13 = [v12 anyObject];
  v14 = [v13 identifier];

  if (v14)
  {
    if (![v10 passActivationState])
    {
      isoManager = self->_isoManager;
      id v18 = [v8 numberOfKeys];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10014A9E0;
      v19[3] = &unk_10072E570;
      id v20 = v9;
      [(PDISO18013Manager *)isoManager needsPresentmentKeyRefreshForPass:v10 numberOfKeys:v18 subCredentialId:v14 completion:v19];

      goto LABEL_10;
    }
    v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Pass is not in active state, skipping key refresh";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
  }
  else
  {
    v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Pass does not have subcredential";
      goto LABEL_7;
    }
  }

  (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
LABEL_10:
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
    v11[2] = sub_10014ABC0;
    v11[3] = &unk_10073A288;
    id v12 = v10;
    [(PDARRISO18013SignatureProvider *)self isRegisteredForRequirement:v8 context:v9 completion:v11];
  }
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return 0;
}

- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4
{
  unsigned int v4 = objc_msgSend(a4, "isPerformingInitialRegistration", a3);
  id v5 = [PDAuxiliaryRegistrationRequirementReference alloc];
  if (v4)
  {
    v6 = [(PDAuxiliaryRegistrationRequirementReference *)v5 initWithSignatureType:12];
    v11[0] = v6;
    v7 = [[PDAuxiliaryRegistrationRequirementReference alloc] initWithSignatureType:11];
    v11[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v11 count:2];
  }
  else
  {
    v6 = [(PDAuxiliaryRegistrationRequirementReference *)v5 initWithDecryptionType:1];
    id v10 = v6;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }

  return v8;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
}

@end