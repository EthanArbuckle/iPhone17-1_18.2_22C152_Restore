@interface SRRReferenceResolutionClient
- (SRRReferenceResolutionClient)init;
- (SRRReferenceResolutionClientInternal)underlyingObject;
- (void)collectSalientEntityStringsWithCompletion:(id)a3;
- (void)collectSalientStringsWithCompletion:(id)a3;
@end

@implementation SRRReferenceResolutionClient

- (void).cxx_destruct
{
}

- (SRRReferenceResolutionClientInternal)underlyingObject
{
  return (SRRReferenceResolutionClientInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)collectSalientStringsWithCompletion:(id)a3
{
}

- (void)collectSalientEntityStringsWithCompletion:(id)a3
{
}

- (SRRReferenceResolutionClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRRReferenceResolutionClient;
  v2 = [(SRRReferenceResolutionClient *)&v6 init];
  uint64_t v3 = objc_opt_new();
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = (SRRReferenceResolutionClientInternal *)v3;

  return v2;
}

@end