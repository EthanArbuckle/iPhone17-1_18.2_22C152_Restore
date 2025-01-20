@interface SAMLAttributeQuery
- (NSString)channelId;
- (SAMLAttributeQuery)initWithData:(id)a3 schema:(id)a4 error:(id *)a5;
- (SAMLAttributeQuery)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5;
- (SAMLAttributeQueryElement)requestElement;
- (void)addAttribute:(id)a3;
- (void)addAttribute:(id)a3 values:(id)a4;
- (void)setRequestElement:(id)a3;
- (void)setSubjectFromResponse:(id)a3;
@end

@implementation SAMLAttributeQuery

- (SAMLAttributeQuery)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SAMLAttributeQuery;
  v10 = [(XMLWrapperDoc *)&v20 initWithData:a3 schema:v9 error:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_6;
  }
  v12 = [(XMLWrapperDoc *)v10 documentElement];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v14 = [(XMLWrapperDoc *)v11 documentElement];
    requestElement = v11->_requestElement;
    v11->_requestElement = (SAMLAttributeQueryElement *)v14;

    objc_storeStrong((id *)&v11->_schemaData, a4);
LABEL_6:
    v18 = v11;
    goto LABEL_7;
  }
  if (!a5) {
    goto LABEL_6;
  }
  v16 = [(XMLWrapperDoc *)v11 documentElement];
  v17 = (objc_class *)objc_opt_class();
  SAMLInvalidDocumentElementErrorForClass(v17);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  v18 = 0;
LABEL_7:

  return v18;
}

- (SAMLAttributeQuery)initWithElement:(id)a3 schema:(id)a4 error:(id *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SAMLAttributeQuery;
  v5 = [(XMLWrapperDoc *)&v10 initWithElement:a3 schema:a4 error:a5];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(XMLWrapperDoc *)v5 documentElement];
    requestElement = v6->_requestElement;
    v6->_requestElement = (SAMLAttributeQueryElement *)v7;
  }
  return v6;
}

- (NSString)channelId
{
  v2 = [(SAMLAttributeQuery *)self requestElement];
  v3 = [v2 channelId];

  return (NSString *)v3;
}

- (void)setSubjectFromResponse:(id)a3
{
  id v7 = [a3 dataUsingEncoding:4];
  v4 = [[SAMLResponse alloc] initWithData:v7 schema:self->_schemaData error:0];
  v5 = [(SAMLResponse *)v4 subject];
  v6 = [(SAMLAttributeQuery *)self requestElement];
  [v6 setSubject:v5];
}

- (void)addAttribute:(id)a3
{
}

- (void)addAttribute:(id)a3 values:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[SAMLAttribute createElement:0];
  [v8 setName:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addAttributeValue:", *(void *)(*((void *)&v15 + 1) + 8 * v13++), (void)v15);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  uint64_t v14 = [(SAMLAttributeQuery *)self requestElement];
  [v14 addAttribute:v8];
}

- (SAMLAttributeQueryElement)requestElement
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