@interface SAMLAdvice
+ (id)createElement:(id *)a3;
- (NSString)assertionIDRef;
- (NSString)assertionURIRef;
- (SAMLAssertion)assertion;
- (void)setAssertionIDRef:(id)a3;
- (void)setAssertionURIRef:(id)a3;
@end

@implementation SAMLAdvice

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLAdvice alloc] initWithTagName:@"Advice" error:a3];
  if (v3)
  {
    v4 = SAMLAssertionNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (SAMLAssertion)assertion
{
  return (SAMLAssertion *)[(XMLWrapperElement *)self firstElementByTagName:@"Assertion"];
}

- (NSString)assertionIDRef
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

- (void)setAssertionIDRef:(id)a3
{
  uint64_t v5 = 0;
  v4 = [[XMLWrapperElement alloc] initWithTagName:@"AssertionIDRef" error:&v5];
  [(XMLWrapperElement *)self addChildElement:v4];
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

- (void)setAssertionURIRef:(id)a3
{
  uint64_t v5 = 0;
  v4 = [[XMLWrapperElement alloc] initWithTagName:@"AssertionURIRef" error:&v5];
  [(XMLWrapperElement *)self addChildElement:v4];
}

@end