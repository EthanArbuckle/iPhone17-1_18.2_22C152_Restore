@interface SiriUISnippetExtensionCardSection
+ (BOOL)supportsSecureCoding;
- (SiriUISnippetExtensionCardSection)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SiriUISnippetExtensionCardSection

- (SiriUISnippetExtensionCardSection)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUISnippetExtensionCardSection;
  return [(SiriUILegacyCardSection *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

@end