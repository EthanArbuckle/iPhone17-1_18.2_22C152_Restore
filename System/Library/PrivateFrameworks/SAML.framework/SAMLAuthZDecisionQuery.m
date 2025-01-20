@interface SAMLAuthZDecisionQuery
- (NSString)channelId;
- (SAMLAuthZDecisionQuery)initWithData:(id)a3 schema:(id)a4 error:(id *)a5;
- (SAMLAuthZDecisionQuery)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5;
- (SAMLAuthZDecisionQueryElement)requestElement;
- (void)addAction:(id)a3;
- (void)setRequestElement:(id)a3;
- (void)setResource:(id)a3;
- (void)setSubjectFromResponse:(id)a3;
@end

@implementation SAMLAuthZDecisionQuery

- (SAMLAuthZDecisionQuery)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  v14.receiver = self;
  v14.super_class = (Class)SAMLAuthZDecisionQuery;
  v6 = -[XMLWrapperDoc initWithData:schema:error:](&v14, sel_initWithData_schema_error_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v8 = [(XMLWrapperDoc *)v6 documentElement];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [(XMLWrapperDoc *)v7 documentElement];
      requestElement = v7->_requestElement;
      v7->_requestElement = (SAMLAuthZDecisionQueryElement *)v10;
LABEL_6:

      return v7;
    }
    if (a5)
    {
      requestElement = [(XMLWrapperDoc *)v7 documentElement];
      v12 = (objc_class *)objc_opt_class();
      SAMLInvalidDocumentElementErrorForClass(v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  return v7;
}

- (SAMLAuthZDecisionQuery)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SAMLAuthZDecisionQuery;
  v5 = [(XMLWrapperDoc *)&v10 initWithElement:a3 schema:a4 error:a5];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(XMLWrapperDoc *)v5 documentElement];
    requestElement = v6->_requestElement;
    v6->_requestElement = (SAMLAuthZDecisionQueryElement *)v7;
  }
  return v6;
}

- (NSString)channelId
{
  v2 = [(SAMLAuthZDecisionQuery *)self requestElement];
  v3 = [v2 channelId];

  return (NSString *)v3;
}

- (void)setSubjectFromResponse:(id)a3
{
  id v9 = [a3 dataUsingEncoding:4];
  v4 = [SAMLResponse alloc];
  v5 = [(XMLWrapperDoc *)self schemaData];
  v6 = [(SAMLResponse *)v4 initWithData:v9 schema:v5 error:0];

  uint64_t v7 = [(SAMLResponse *)v6 subject];
  v8 = [(SAMLAuthZDecisionQuery *)self requestElement];
  [v8 setSubject:v7];
}

- (void)addAction:(id)a3
{
  id v4 = a3;
  id v5 = [(SAMLAuthZDecisionQuery *)self requestElement];
  [v5 addAction:v4];
}

- (void)setResource:(id)a3
{
  id v4 = a3;
  id v6 = [(SAMLAuthZDecisionQuery *)self requestElement];
  id v5 = [v4 absoluteString];

  [v6 setResource:v5];
}

- (SAMLAuthZDecisionQueryElement)requestElement
{
  return self->_requestElement;
}

- (void)setRequestElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end