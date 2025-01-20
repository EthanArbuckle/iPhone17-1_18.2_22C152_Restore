@interface SSEnvironmentElementMetadataUpdate
+ (BOOL)supportsBSXPCSecureCoding;
- (BSSettings)bsSettings;
- (NSString)environmentElementIdentifier;
- (NSString)loggableDescription;
- (SSEnvironmentElementMetadataUpdate)initWithBSXPCCoder:(id)a3;
- (SSHarvestedApplicationMetadata)metadata;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setEnvironmentElementIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation SSEnvironmentElementMetadataUpdate

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSEnvironmentElementMetadataUpdate *)self environmentElementIdentifier];
  [v4 encodeObject:v5 forKey:@"SSEnvironmentElementMetadataUpdateEnvironmentElementIdentifierKey"];

  id v6 = [(SSEnvironmentElementMetadataUpdate *)self metadata];
  [v4 encodeObject:v6 forKey:@"SSEnvironmentElementMetadataUpdateMetadataKey"];
}

- (SSEnvironmentElementMetadataUpdate)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSEnvironmentElementMetadataUpdate *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentElementMetadataUpdateEnvironmentElementIdentifierKey"];
  environmentElementIdentifier = v5->_environmentElementIdentifier;
  v5->_environmentElementIdentifier = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentElementMetadataUpdateMetadataKey"];

  metadata = v5->_metadata;
  v5->_metadata = (SSHarvestedApplicationMetadata *)v8;

  return v5;
}

- (BSSettings)bsSettings
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:self forSetting:5];
  return (BSSettings *)v3;
}

- (NSString)loggableDescription
{
  id v3 = [MEMORY[0x263F089D8] string];
  id v4 = NSString;
  v5 = [(SSEnvironmentElementMetadataUpdate *)self environmentElementIdentifier];
  uint64_t v6 = [v5 shorterLoggableString];
  v7 = [v4 stringWithFormat:@"element: %@ ", v6];
  [v3 appendString:v7];

  [v3 appendString:@"metadata: <"];
  uint64_t v8 = [(SSEnvironmentElementMetadataUpdate *)self metadata];

  if (v8)
  {
    v9 = [(SSEnvironmentElementMetadataUpdate *)self metadata];
    v10 = [v9 loggableDescription];
    [v3 appendString:v10];
  }
  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (NSString)environmentElementIdentifier
{
  return self->_environmentElementIdentifier;
}

- (void)setEnvironmentElementIdentifier:(id)a3
{
}

- (SSHarvestedApplicationMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_environmentElementIdentifier, 0);
}

@end