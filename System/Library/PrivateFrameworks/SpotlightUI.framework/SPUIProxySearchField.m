@interface SPUIProxySearchField
+ (id)sharedInstance;
- (SPUIProxySearchField)init;
@end

@implementation SPUIProxySearchField

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_field;
  return v2;
}

uint64_t __38__SPUIProxySearchField_sharedInstance__block_invoke()
{
  sharedInstance_field = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (SPUIProxySearchField)init
{
  v5.receiver = self;
  v5.super_class = (Class)SPUIProxySearchField;
  v2 = [(SPUIProxySearchField *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SPUIProxySearchField *)v2 setAutocapitalizationType:0];
    [(SPUIProxySearchField *)v3 setAutocorrectionType:1];
    [(SPUIProxySearchField *)v3 setReturnKeyType:6];
    [(SPUIProxySearchField *)v3 setAcceptsDictationSearchResults:1];
  }
  return v3;
}

@end