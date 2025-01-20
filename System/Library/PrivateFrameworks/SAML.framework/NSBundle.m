@interface NSBundle
@end

@implementation NSBundle

uint64_t __47__NSBundle_SAMLAdditions__saml_frameworkBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.VideoSubscriberAccount.SAMLFramework"];
  uint64_t v1 = saml_frameworkBundle_bundle;
  saml_frameworkBundle_bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end