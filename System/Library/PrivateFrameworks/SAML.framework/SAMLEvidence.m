@interface SAMLEvidence
+ (id)createElement:(id *)a3;
- (NSString)assertionIdRef;
- (NSString)assertionURIRef;
- (SAMLAssertion)assertion;
@end

@implementation SAMLEvidence

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLEvidence alloc] initWithTagName:@"Element" error:a3];
  if (v3)
  {
    v4 = SAMLAssertionNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (NSString)assertionIdRef
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"AssertionIDRef"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 textContent];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)assertionURIRef
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"AssertionURIRef"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 textContent];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (SAMLAssertion)assertion
{
  return (SAMLAssertion *)[(XMLWrapperElement *)self firstElementByTagName:@"Assertion"];
}

@end