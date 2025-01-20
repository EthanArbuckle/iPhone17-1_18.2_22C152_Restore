@interface SAMLAuthNRequest
- (NSString)issuer;
- (SAMLAuthNRequest)initWithData:(id)a3 schema:(id)a4 error:(id *)a5;
- (SAMLAuthNRequest)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5;
- (SAMLAuthNRequestElement)requestElement;
- (void)setForceAuthN:(BOOL)a3;
- (void)setIsPassive:(BOOL)a3;
- (void)setIssuer:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setRequestElement:(id)a3;
- (void)setSubjectFromResponse:(id)a3;
@end

@implementation SAMLAuthNRequest

- (SAMLAuthNRequest)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SAMLAuthNRequest;
  v9 = [(XMLWrapperDoc *)&v19 initWithData:a3 schema:v8 error:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [(XMLWrapperDoc *)v9 documentElement];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v13 = [(XMLWrapperDoc *)v10 documentElement];
      requestElement = v10->_requestElement;
      v10->_requestElement = (SAMLAuthNRequestElement *)v13;

      v15 = (NSData *)v8;
      schemaData = v10->_schemaData;
      v10->_schemaData = v15;
LABEL_6:

      goto LABEL_7;
    }
    if (a5)
    {
      schemaData = [(XMLWrapperDoc *)v10 documentElement];
      v17 = (objc_class *)objc_opt_class();
      SAMLInvalidDocumentElementErrorForClass(v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v10;
}

- (SAMLAuthNRequest)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SAMLAuthNRequest;
  v5 = [(XMLWrapperDoc *)&v10 initWithElement:a3 schema:a4 error:a5];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(XMLWrapperDoc *)v5 documentElement];
    requestElement = v6->_requestElement;
    v6->_requestElement = (SAMLAuthNRequestElement *)v7;
  }
  return v6;
}

- (NSString)issuer
{
  v2 = [(SAMLAuthNRequest *)self requestElement];
  v3 = [v2 issuer];

  return (NSString *)v3;
}

- (void)setIssuer:(id)a3
{
  id v4 = a3;
  id v5 = [(SAMLAuthNRequest *)self requestElement];
  [v5 setIssuer:v4];
}

- (void)setSubjectFromResponse:(id)a3
{
  id v7 = [a3 dataUsingEncoding:4];
  id v4 = [[SAMLResponse alloc] initWithData:v7 schema:self->_schemaData error:0];
  id v5 = [(SAMLResponse *)v4 subject];
  v6 = [(SAMLAuthNRequest *)self requestElement];
  [v6 setSubject:v5];
}

- (void)setIsPassive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SAMLAuthNRequest *)self requestElement];
  [v4 setIsPassive:v3];
}

- (void)setForceAuthN:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SAMLAuthNRequest *)self requestElement];
  [v4 setForceAuthN:v3];
}

- (void)setProviderName:(id)a3
{
  id v4 = a3;
  id v5 = [(SAMLAuthNRequest *)self requestElement];
  [v5 setProviderName:v4];
}

- (SAMLAuthNRequestElement)requestElement
{
  return self->_requestElement;
}

- (void)setRequestElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestElement, 0);
  objc_storeStrong((id *)&self->_schemaData, 0);
}

@end