@interface SAMLParserController
+ (id)sharedInstance;
+ (void)initialize;
- (NSData)schemaData;
- (SAMLParserController)init;
- (id)dataFromString:(id)a3 error:(id *)a4;
- (id)newAttributeQuery:(id)a3 error:(id *)a4;
- (id)newAuthNRequest:(id)a3 error:(id *)a4;
- (id)newAuthZQuery:(id)a3 channelId:(id)a4 error:(id *)a5;
- (id)newLogoutRequest:(id *)a3;
- (id)parseCachedResponse:(id)a3 error:(id *)a4;
- (id)parseResponse:(id)a3 error:(id *)a4;
- (id)schema;
- (void)setSchemaData:(id)a3;
@end

@implementation SAMLParserController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SAMLParserController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_parser;
  return v2;
}

uint64_t __38__SAMLParserController_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_parser = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Assertion"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Advice"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Attribute"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"AttributeQuery"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"AuthnStatement"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"AuthnRequest"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"AuthzDecisiontStatement"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"AuthzDecisionQuery"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Conditions"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"DSAKeyValue"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Element"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"IDPEntry"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"KeyInfo"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"RetrievalMethod"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"LogoutRequest"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"LogoutResponse"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"NameId"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"NameIdPolicy"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"PGPData"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Response"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"RequestedAuthnContext"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"RSAKeyValue"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Scoping"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Signature"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"KeyValue"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Reference"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"SignedInfo"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Status"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"StatusCode"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"Subject"];
    +[XMLWrapperElementFactory registerClass:objc_opt_class() forElementName:@"SubjectConfirmation"];
    uint64_t v2 = objc_opt_class();
    +[XMLWrapperElementFactory registerClass:v2 forElementName:@"X509Data"];
  }
}

- (SAMLParserController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SAMLParserController;
  uint64_t v2 = [(SAMLParserController *)&v8 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263F086E0], "saml_frameworkBundle");
    v4 = [v3 URLForResource:@"saml-schema-protocol-2.0" withExtension:@"xsd"];

    uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
    schemaData = v2->_schemaData;
    v2->_schemaData = (NSData *)v5;
  }
  return v2;
}

- (id)schema
{
  return self->_schemaData;
}

- (id)newAttributeQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[SAMLAttributeQueryElement createElement:a4];
  [v7 setChannelId:v6];

  objc_super v8 = [SAMLAttributeQuery alloc];
  v9 = [(SAMLParserController *)self schemaData];
  v10 = [(SAMLAttributeQuery *)v8 initWithElement:v7 schema:v9 error:a4];

  return v10;
}

- (id)newAuthNRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[SAMLAuthNRequestElement createElement:a4];
  [v7 setIssuer:v6];

  objc_super v8 = [SAMLAuthNRequest alloc];
  v9 = [(SAMLParserController *)self schemaData];
  v10 = [(SAMLAuthNRequest *)v8 initWithElement:v7 schema:v9 error:a4];

  return v10;
}

- (id)newAuthZQuery:(id)a3 channelId:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[SAMLAuthZDecisionQueryElement createElement:a5];
  [v10 setChannelId:v8];

  v11 = [SAMLAuthZDecisionQuery alloc];
  v12 = [(SAMLParserController *)self schemaData];
  v13 = [(SAMLAuthZDecisionQuery *)v11 initWithElement:v10 schema:v12 error:a5];

  [(SAMLAuthZDecisionQuery *)v13 setResource:v9];
  return v13;
}

- (id)newLogoutRequest:(id *)a3
{
  uint64_t v5 = +[SAMLLogoutRequestElement createElement:](SAMLLogoutRequestElement, "createElement:");
  id v6 = [SAMLLogoutRequest alloc];
  v7 = [(SAMLParserController *)self schemaData];
  id v8 = [(SAMLLogoutRequest *)v6 initWithElement:v5 schema:v7 error:a3];

  return v8;
}

- (id)parseResponse:(id)a3 error:(id *)a4
{
  id v6 = -[SAMLParserController dataFromString:error:](self, "dataFromString:error:", a3);
  v7 = [[SAMLResponse alloc] initWithData:v6 schema:self->_schemaData error:a4];
  if ([(SAMLResponse *)v7 assertionMeetsConditions:a4]
    && [(SAMLResponse *)v7 isValid:a4])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)parseCachedResponse:(id)a3 error:(id *)a4
{
  id v6 = -[SAMLParserController dataFromString:error:](self, "dataFromString:error:", a3);
  v7 = [[SAMLResponse alloc] initWithData:v6 schema:self->_schemaData error:a4];
  if ([(SAMLResponse *)v7 isValid:a4]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)dataFromString:(id)a3 error:(id *)a4
{
  uint64_t v5 = [a3 dataUsingEncoding:4];
  id v6 = (void *)v5;
  if (a4 && !v5)
  {
    SAMLParserErrorForErrorCode(100);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSData)schemaData
{
  return self->_schemaData;
}

- (void)setSchemaData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end