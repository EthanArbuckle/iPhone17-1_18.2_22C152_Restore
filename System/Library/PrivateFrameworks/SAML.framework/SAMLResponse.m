@interface SAMLResponse
- (BOOL)assertionMeetsConditions:(id *)a3;
- (BOOL)hasValidAuthentication;
- (BOOL)isValid:(id *)a3;
- (NSDictionary)attributes;
- (NSString)selectedProvider;
- (SAMLResponse)initWithData:(id)a3 schema:(id)a4 error:(id *)a5;
- (SAMLResponseElement)responseElement;
- (id)assertions;
- (id)attributeValuesForName:(id)a3;
- (id)authenticationSessionId;
- (id)authenticationTTL;
- (id)authorizationStatusForResource:(id)a3;
- (id)primaryStatusCode;
- (id)statusCodes;
- (id)subject;
- (id)userName;
- (int64_t)expectedAction;
- (void)setAuthenticationTTL:(id)a3;
- (void)setResponseElement:(id)a3;
@end

@implementation SAMLResponse

- (SAMLResponse)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  v14.receiver = self;
  v14.super_class = (Class)SAMLResponse;
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
      responseElement = v7->_responseElement;
      v7->_responseElement = (SAMLResponseElement *)v10;
LABEL_6:

      return v7;
    }
    if (a5)
    {
      responseElement = [(XMLWrapperDoc *)v7 documentElement];
      v12 = (objc_class *)objc_opt_class();
      SAMLInvalidDocumentElementErrorForClass(v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  return v7;
}

- (id)assertions
{
  v2 = [(SAMLResponse *)self responseElement];
  v3 = [v2 assertions];

  return v3;
}

- (NSDictionary)attributes
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(SAMLResponse *)self responseElement];
  v5 = [v4 assertions];
  v6 = [v5 firstObject];
  v7 = [v6 samlAttributes];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_super v14 = objc_msgSend(v13, "values", (void)v17);
        v15 = [v13 name];
        [v3 setObject:v14 forKey:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return (NSDictionary *)v3;
}

- (id)attributeValuesForName:(id)a3
{
  id v4 = a3;
  v5 = [(SAMLResponse *)self attributes];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSString)selectedProvider
{
  v2 = [(XMLWrapperDoc *)self documentElement];
  v3 = [v2 issuer];

  return (NSString *)v3;
}

- (id)subject
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(SAMLResponse *)self responseElement];
  v3 = [v2 assertions];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) subject];
        if (v8)
        {
          uint64_t v9 = (void *)v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (id)userName
{
  v2 = [(SAMLResponse *)self attributeValuesForName:@"username"];
  v3 = [v2 firstObject];

  return v3;
}

- (BOOL)hasValidAuthentication
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(SAMLResponse *)self assertions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = 0;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      uint64_t v6 = 0;
      v7 = v4;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        id v13 = v7;
        int v9 = [v8 isValid:&v13];
        id v4 = v13;

        if (v9)
        {
          uint64_t v10 = [v8 authentication];
          char v11 = [v10 isValid];

          if (v11)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        ++v6;
        v7 = v4;
      }
      while (v3 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v3) {
        continue;
      }
      break;
    }
LABEL_12:
  }
  return v3;
}

- (id)authenticationTTL
{
  v2 = [(SAMLResponse *)self responseElement];
  uint64_t v3 = [v2 authnStatement];

  if (v3)
  {
    id v4 = [v3 sessionNotOnOrAfter];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setAuthenticationTTL:(id)a3
{
  id v7 = a3;
  id v4 = [(SAMLResponse *)self responseElement];
  uint64_t v5 = [v4 authnStatement];

  if (v5)
  {
    uint64_t v6 = SAMLStringFromDate(v7);
    [v5 setAttributeWithName:@"SessionNotOnOrAfter" value:v6];
  }
}

- (id)authenticationSessionId
{
  v2 = [(SAMLResponse *)self responseElement];
  uint64_t v3 = [v2 authnStatement];

  if (v3)
  {
    id v4 = [v3 sessionIndex];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)assertionMeetsConditions:(id *)a3
{
  id v4 = [(SAMLResponse *)self responseElement];
  LOBYTE(a3) = [v4 assertionMeetsConditions:a3];

  return (char)a3;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SAMLResponse *)self responseElement];
  uint64_t v6 = [v5 signature];
  if (!v6)
  {

LABEL_6:
    long long v12 = [(SAMLResponse *)self responseElement];
    char v13 = [v12 isMemberOfClass:objc_opt_class()];

    if (v13) {
      return 1;
    }
    long long v14 = [MEMORY[0x263EFF980] array];
    long long v15 = [(SAMLResponse *)self assertions];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v18 = 0;
      uint64_t v19 = *(void *)v28;
      do
      {
        uint64_t v20 = 0;
        v21 = v18;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * v20);
          id v26 = v21;
          int v23 = [v22 isValid:&v26];
          id v18 = v26;

          if (v23) {
            [v14 addObject:v22];
          }
          ++v20;
          v21 = v18;
        }
        while (v17 != v20);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v17);
    }
    else
    {
      id v18 = 0;
    }
    if ([v15 count] && !objc_msgSend(v14, "count"))
    {
      if (a3 && v18)
      {
        id v25 = v18;
      }
      else
      {
        if (!a3)
        {
          BOOL v11 = 0;
          goto LABEL_22;
        }
        SAMLParserErrorForErrorCode(400);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v11 = 0;
      *a3 = v25;
    }
    else
    {
      BOOL v11 = 1;
    }
LABEL_22:

    return v11;
  }
  id v7 = (void *)v6;
  uint64_t v8 = [(SAMLResponse *)self responseElement];
  int v9 = [v8 signature];
  char v10 = [v9 isValid];

  if (v10) {
    goto LABEL_6;
  }
  if (!a3) {
    return 0;
  }
  SAMLParserErrorForErrorCode(500);
  BOOL v11 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (id)statusCodes
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(SAMLResponse *)self responseElement];
  uint64_t v5 = [v4 status];

  uint64_t v6 = [v5 statusCode];

  if (v6)
  {
    uint64_t v7 = [v5 statusCode];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      do
      {
        int v9 = [v8 value];
        [v3 addObject:v9];

        uint64_t v10 = [v8 statusCode];

        uint64_t v8 = (void *)v10;
      }
      while (v10);
    }
  }

  return v3;
}

- (id)primaryStatusCode
{
  v2 = [(SAMLResponse *)self statusCodes];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (int64_t)expectedAction
{
  uint64_t v3 = [(SAMLResponse *)self statusCodes];
  if ([v3 count])
  {
    id v4 = [(SAMLResponse *)self primaryStatusCode];
    if ([v4 isEqualToString:@"urn:oasis:names:tc:SAML:2.0:status:Success"])
    {
      int64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"urn:oasis:names:tc:SAML:2.0:status:Responder"])
    {
      if ((unint64_t)[v3 count] < 2)
      {
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v6 = [v3 objectAtIndex:1];
      }
      if ([v6 isEqual:@"urn:oasis:names:tc:SAML:2.0:status:NoPassive"])
      {
        int64_t v5 = 2;
      }
      else if ([v6 isEqual:@"urn:apple:status:MSORequestsUI"])
      {
        int64_t v5 = 2;
      }
      else
      {
        int64_t v5 = 0;
      }
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)authorizationStatusForResource:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [a3 absoluteString];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v5 = [(SAMLResponse *)self assertions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) authorizationForResource:v4];
        if (v10)
        {
          BOOL v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (SAMLResponseElement)responseElement
{
  return self->_responseElement;
}

- (void)setResponseElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end