@interface PDAuxiliaryCapabilityRequirementContext
- (BOOL)hasKeyMaterialToRegister;
- (BOOL)isPerformingInitialRegistration;
- (NFSecureElementManagerSession)seSession;
- (NSMapTable)deviceOwnedKeyMaterials;
- (NSMapTable)serverOwnedKeyMaterials;
- (NSMutableArray)requirementsSuccessfullyRegistered;
- (NSMutableSet)validCertificateIdentifiers;
- (NSString)primarySEID;
- (PDAuxiliaryCapabilityRequirementContext)init;
- (PDAuxiliaryCapabilityRequirementContext)initWithPass:(id)a3 primarySEID:(id)a4;
- (PKSecureElement)secureElement;
- (PKSecureElementPass)pass;
- (id)description;
- (id)previouslyGeneratedDecryptionKeyOfType:(unint64_t)a3;
- (id)previouslyGeneratedSignatureKeyOfType:(unint64_t)a3;
- (unint64_t)source;
- (void)setDeviceOwnedKeyMaterials:(id)a3;
- (void)setRequirementsSuccessfullyRegistered:(id)a3;
- (void)setSeSession:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setServerOwnedKeyMaterials:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setValidCertificateIdentifiers:(id)a3;
@end

@implementation PDAuxiliaryCapabilityRequirementContext

- (PDAuxiliaryCapabilityRequirementContext)init
{
  return 0;
}

- (PDAuxiliaryCapabilityRequirementContext)initWithPass:(id)a3 primarySEID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PDAuxiliaryCapabilityRequirementContext;
  v9 = [(PDAuxiliaryCapabilityRequirementContext *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    objc_storeStrong((id *)&v10->_primarySEID, a4);
    v11 = (NSMapTable *)+[NSMapTable pk_createStrongPointerPersonalityToStrongObjects];
    deviceOwnedKeyMaterials = v10->_deviceOwnedKeyMaterials;
    v10->_deviceOwnedKeyMaterials = v11;

    v13 = (NSMapTable *)+[NSMapTable pk_createStrongPointerPersonalityToStrongObjects];
    serverOwnedKeyMaterials = v10->_serverOwnedKeyMaterials;
    v10->_serverOwnedKeyMaterials = v13;

    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    validCertificateIdentifiers = v10->_validCertificateIdentifiers;
    v10->_validCertificateIdentifiers = v15;

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    requirementsSuccessfullyRegistered = v10->_requirementsSuccessfullyRegistered;
    v10->_requirementsSuccessfullyRegistered = v17;
  }
  return v10;
}

- (id)previouslyGeneratedSignatureKeyOfType:(unint64_t)a3
{
  v5 = [(NSMapTable *)self->_deviceOwnedKeyMaterials keyEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    id v7 = (void *)v6;
    while ([v7 role] != (id)2 || objc_msgSend(v7, "type") != (id)a3)
    {
      uint64_t v8 = [v5 nextObject];

      id v7 = (void *)v8;
      if (!v8) {
        goto LABEL_6;
      }
    }
    v9 = [(NSMapTable *)self->_deviceOwnedKeyMaterials objectForKey:v7];
  }
  else
  {
LABEL_6:
    v9 = 0;
  }

  return v9;
}

- (id)previouslyGeneratedDecryptionKeyOfType:(unint64_t)a3
{
  v5 = [(NSMapTable *)self->_deviceOwnedKeyMaterials keyEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    id v7 = (void *)v6;
    while ([v7 role] != (id)1 || objc_msgSend(v7, "type") != (id)a3)
    {
      uint64_t v8 = [v5 nextObject];

      id v7 = (void *)v8;
      if (!v8) {
        goto LABEL_6;
      }
    }
    v9 = [(NSMapTable *)self->_deviceOwnedKeyMaterials objectForKey:v7];
  }
  else
  {
LABEL_6:
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasKeyMaterialToRegister
{
  return [(NSMapTable *)self->_deviceOwnedKeyMaterials count]
      || [(NSMutableSet *)self->_validCertificateIdentifiers count] != 0;
}

- (BOOL)isPerformingInitialRegistration
{
  return self->_pass == 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p; ", v4, self];

  [v5 appendFormat:@"pass: '%@'; ", self->_pass];
  [v5 appendFormat:@"primarySEID: '%@'; ", self->_primarySEID];
  [v5 appendFormat:@"secureElement: '%@'; ", self->_secureElement];
  [v5 appendFormat:@"seSession: '%@'; ", self->_seSession];
  [v5 appendFormat:@"deviceOwnedKeyMaterials: '%@'; ", self->_deviceOwnedKeyMaterials];
  [v5 appendFormat:@"serverOwnedKeyMaterials: '%@'; ", self->_serverOwnedKeyMaterials];
  [v5 appendFormat:@"validCertificateIdentifiers: '%@'; ", self->_validCertificateIdentifiers];
  [v5 appendFormat:@">"];
  uint64_t v6 = +[NSString stringWithString:v5];

  return v6;
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (NSString)primarySEID
{
  return self->_primarySEID;
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (NFSecureElementManagerSession)seSession
{
  return self->_seSession;
}

- (void)setSeSession:(id)a3
{
}

- (NSMapTable)deviceOwnedKeyMaterials
{
  return self->_deviceOwnedKeyMaterials;
}

- (void)setDeviceOwnedKeyMaterials:(id)a3
{
}

- (NSMapTable)serverOwnedKeyMaterials
{
  return self->_serverOwnedKeyMaterials;
}

- (void)setServerOwnedKeyMaterials:(id)a3
{
}

- (NSMutableSet)validCertificateIdentifiers
{
  return self->_validCertificateIdentifiers;
}

- (void)setValidCertificateIdentifiers:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (NSMutableArray)requirementsSuccessfullyRegistered
{
  return self->_requirementsSuccessfullyRegistered;
}

- (void)setRequirementsSuccessfullyRegistered:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementsSuccessfullyRegistered, 0);
  objc_storeStrong((id *)&self->_validCertificateIdentifiers, 0);
  objc_storeStrong((id *)&self->_serverOwnedKeyMaterials, 0);
  objc_storeStrong((id *)&self->_deviceOwnedKeyMaterials, 0);
  objc_storeStrong((id *)&self->_seSession, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_primarySEID, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end