@interface SAMLBaseElement
+ (id)createElement:(id *)a3;
- (SAMLBaseElement)initWithNode:(_xmlNode *)a3 doc:(_xmlDoc *)a4 query:(id)a5 error:(id *)a6;
@end

@implementation SAMLBaseElement

+ (id)createElement:(id *)a3
{
  if (a3)
  {
    SAMLParserErrorForErrorCode(201);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (SAMLBaseElement)initWithNode:(_xmlNode *)a3 doc:(_xmlDoc *)a4 query:(id)a5 error:(id *)a6
{
  v9.receiver = self;
  v9.super_class = (Class)SAMLBaseElement;
  v6 = [(XMLWrapperElement *)&v9 initWithNode:a3 doc:a4 query:a5 error:a6];
  v7 = v6;
  if (v6) {
    [(SAMLBaseElement *)v6 setElementProperties];
  }
  return v7;
}

@end