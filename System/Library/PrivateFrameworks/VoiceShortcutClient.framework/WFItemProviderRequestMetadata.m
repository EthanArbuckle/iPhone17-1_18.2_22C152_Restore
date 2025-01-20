@interface WFItemProviderRequestMetadata
+ (BOOL)supportsSecureCoding;
- (WFItemProviderRequestMetadata)initWithCoder:(id)a3;
- (id)registeredTypeIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)fetchLinkMetadataWithCompletion:(id)a3;
@end

@implementation WFItemProviderRequestMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFItemProviderRequestMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  result = (WFItemProviderRequestMetadata *)[MEMORY[0x1E4F1CA00] raise:@"Subclass must override" format:@"Subclasses must override initWithCoder"];
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  [MEMORY[0x1E4F1CA00] raise:@"Subclass must override" format:@"Subclasses must override encodeWithCoder"];
  __break(1u);
}

- (void)fetchLinkMetadataWithCompletion:(id)a3
{
  id v3 = a3;
  [MEMORY[0x1E4F1CA00] raise:@"Subclass must override" format:@"Subclasses must override fetchLinkMetadataWithCompletion"];
  __break(1u);
}

- (id)registeredTypeIdentifiers
{
  id result = (id)[MEMORY[0x1E4F1CA00] raise:@"Subclass must override" format:@"Subclasses must override registeredTypeIdentifiers"];
  __break(1u);
  return result;
}

@end