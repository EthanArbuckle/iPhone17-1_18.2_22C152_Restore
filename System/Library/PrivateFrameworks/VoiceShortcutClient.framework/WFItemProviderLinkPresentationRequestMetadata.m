@interface WFItemProviderLinkPresentationRequestMetadata
+ (BOOL)supportsSecureCoding;
- (LPLinkMetadata)linkPresentationMetadata;
- (WFItemProviderLinkPresentationRequestMetadata)initWithCoder:(id)a3;
- (WFItemProviderLinkPresentationRequestMetadata)initWithLinkPresentationMetadata:(id)a3;
- (id)registeredTypeIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)fetchLinkMetadataWithCompletion:(id)a3;
@end

@implementation WFItemProviderLinkPresentationRequestMetadata

- (void).cxx_destruct
{
}

- (LPLinkMetadata)linkPresentationMetadata
{
  return self->_linkPresentationMetadata;
}

- (WFItemProviderLinkPresentationRequestMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  getLPLinkMetadataClass();
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkPresentationMetadata"];

  if (v5)
  {
    self = [(WFItemProviderLinkPresentationRequestMetadata *)self initWithLinkPresentationMetadata:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFItemProviderLinkPresentationRequestMetadata *)self linkPresentationMetadata];
  [v4 encodeObject:v5 forKey:@"linkPresentationMetadata"];
}

- (id)registeredTypeIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F30130];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (WFItemProviderLinkPresentationRequestMetadata)initWithLinkPresentationMetadata:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFItemProviderRequestMetadata.m", 152, @"Invalid parameter not satisfying: %@", @"linkPresentationMetadata" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFItemProviderLinkPresentationRequestMetadata;
  v7 = [(WFItemProviderLinkPresentationRequestMetadata *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_linkPresentationMetadata, a3);
    v9 = v8;
  }

  return v8;
}

- (void)fetchLinkMetadataWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(WFItemProviderLinkPresentationRequestMetadata *)self linkPresentationMetadata];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end