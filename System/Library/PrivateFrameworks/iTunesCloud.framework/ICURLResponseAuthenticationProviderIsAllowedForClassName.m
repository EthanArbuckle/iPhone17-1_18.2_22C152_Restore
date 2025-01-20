@interface ICURLResponseAuthenticationProviderIsAllowedForClassName
@end

@implementation ICURLResponseAuthenticationProviderIsAllowedForClassName

void ___ICURLResponseAuthenticationProviderIsAllowedForClassName_block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  v6[0] = v1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v5 = (void *)_ICURLResponseAuthenticationProviderIsAllowedForClassName_sAllowableAuthenticationProviderClassNames;
  _ICURLResponseAuthenticationProviderIsAllowedForClassName_sAllowableAuthenticationProviderClassNames = v4;
}

@end