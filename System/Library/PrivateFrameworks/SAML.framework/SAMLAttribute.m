@interface SAMLAttribute
+ (id)createElement:(id *)a3;
- (NSArray)values;
- (NSString)friendlyName;
- (NSString)name;
- (NSString)nameFormat;
- (void)addAttributeValue:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SAMLAttribute

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLAttribute alloc] initWithTagName:@"Attribute" error:a3];
  if (v3)
  {
    v4 = SAMLAssertionNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (NSString)name
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Name"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
}

- (NSString)nameFormat
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"NameFormat"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)friendlyName
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"FriendlyName"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSArray)values
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self getElementsByTagName:@"AttributeValue"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) textContent];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)addAttributeValue:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[XMLWrapperElement alloc] initWithTagName:@"AttributeValue" error:0];
  uint64_t v5 = objc_alloc_init(XMLWrapperNamespace);
  [(XMLWrapperNamespace *)v5 setPrefix:@"saml"];
  [(XMLWrapperNamespace *)v5 setHref:@"urn:oasis:names:tc:SAML:2.0:assertion"];
  [(XMLWrapperElement *)v6 setNamespace:v5];
  [(XMLWrapperElement *)v6 setTextContent:v4];

  [(XMLWrapperElement *)self addChildElement:v6];
}

@end