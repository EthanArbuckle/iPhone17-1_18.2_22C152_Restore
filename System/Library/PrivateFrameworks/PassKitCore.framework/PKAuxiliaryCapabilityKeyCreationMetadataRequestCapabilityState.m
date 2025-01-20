@interface PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState
- (NSString)currentVersion;
- (NSString)targetVersion;
- (PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState)init;
- (PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState)initWithCapability:(id)a3 currentVersion:(id)a4 targetVersion:(id)a5;
- (PKPassAuxiliaryRegistrationRequirement)capability;
- (id)dictionaryRepresentation;
@end

@implementation PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState

- (PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState)init
{
  return 0;
}

- (PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState)initWithCapability:(id)a3 currentVersion:(id)a4 targetVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState;
  v12 = [(PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_capability, a3);
    objc_storeStrong((id *)&v13->_currentVersion, a4);
    objc_storeStrong((id *)&v13->_targetVersion, a5);
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PKPassAuxiliaryRegistrationRequirement *)self->_capability identifier];
  [v3 setObject:v4 forKeyedSubscript:@"capabilityIdentifier"];

  [v3 setObject:self->_currentVersion forKeyedSubscript:@"currentVersion"];
  [v3 setObject:self->_targetVersion forKeyedSubscript:@"targetVersion"];
  v5 = (void *)[v3 copy];

  return v5;
}

- (PKPassAuxiliaryRegistrationRequirement)capability
{
  return self->_capability;
}

- (NSString)currentVersion
{
  return self->_currentVersion;
}

- (NSString)targetVersion
{
  return self->_targetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetVersion, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
  objc_storeStrong((id *)&self->_capability, 0);
}

@end