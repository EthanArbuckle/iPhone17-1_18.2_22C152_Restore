@interface POWSTrustProcess
- (BOOL)parseWSTrust13;
- (BOOL)parseWSTrust2005;
- (POWSTrustProcess)init;
- (id)createWSTrust13Request:(id)a3;
- (id)createWSTrust13Response:(id)a3;
- (id)createWSTrust2005Request:(id)a3;
- (id)createWSTrust2005Response:(id)a3;
- (id)createWSTrustFault:(id)a3;
- (id)parseMexResponse:(id)a3 namespaces:(id)a4 policyXPath:(id)a5 action:(id)a6;
- (id)parseWSTrustMexResponse:(id)a3 version:(unint64_t)a4;
- (id)parseWSTrustRequest:(id)a3 version:(unint64_t)a4;
- (id)parseWSTrustResponse:(id)a3 version:(unint64_t)a4;
- (void)setParseWSTrust13:(BOOL)a3;
- (void)setParseWSTrust2005:(BOOL)a3;
@end

@implementation POWSTrustProcess

- (POWSTrustProcess)init
{
  v3.receiver = self;
  v3.super_class = (Class)POWSTrustProcess;
  result = [(POWSTrustProcess *)&v3 init];
  if (result) {
    *(_WORD *)&result->_parseWSTrust13 = 257;
  }
  return result;
}

- (id)createWSTrust13Request:(id)a3
{
  v34[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 endpointURN];
  v32 = v4;
  [v4 setAddress:v5];

  v31 = objc_opt_new();
  [v31 setEndpointReference:v4];
  v6 = objc_opt_new();
  [v6 setKeyType:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/Bearer"];
  [v6 setRequestType:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/Issue"];
  [v6 setAppliesTo:v31];
  v7 = objc_opt_new();
  [v7 setStringValue:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue"];
  [v7 setMustUnderstand:@"1"];
  v30 = objc_opt_new();
  v8 = [v3 nonce];
  [v30 setStringValue:v8];

  v9 = objc_opt_new();
  [v9 setAddress:@"http://www.w3.org/2005/08/addressing/anonymous"];
  v10 = objc_opt_new();
  [v10 setMustUnderstand:@"1"];
  v11 = [v3 to];
  [v10 setStringValue:v11];

  v12 = objc_opt_new();
  v13 = NSString;
  v14 = [MEMORY[0x263F08C38] UUID];
  v15 = [v14 UUIDString];
  v16 = [v13 stringWithFormat:@"uuid-%@", v15];
  [v12 setId:v16];

  v17 = [v3 userName];
  [v12 setUsername:v17];

  CFAllocatorRef v18 = (const __CFAllocator *)SecCFAllocatorZeroize();
  id v19 = [v3 password];
  v20 = (const UInt8 *)[v19 mutableBytes];
  v21 = [v3 password];

  v22 = (__CFString *)CFStringCreateWithBytes(v18, v20, [v21 length], 0x8000100u, 0);
  [v12 setPassword:v22];

  v23 = objc_opt_new();
  [v23 setMustUnderstand:@"1"];
  [v23 setUsernameToken:v12];
  v24 = objc_opt_new();
  v34[0] = v7;
  v34[1] = v30;
  v34[2] = v9;
  v34[3] = v10;
  v34[4] = v23;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:5];
  [v24 setHeader:v25];

  v33 = v6;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  [v24 setBody:v26];

  v27 = objc_opt_new();
  [v27 setEnvelope:v24];
  v28 = [v27 XMLDataWithOptions:1];

  return v28;
}

- (id)createWSTrust2005Request:(id)a3
{
  v34[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 endpointURN];
  v32 = v4;
  [v4 setAddress:v5];

  v31 = objc_opt_new();
  [v31 setEndpointReference:v4];
  v6 = objc_opt_new();
  [v6 setKeyType:@"http://schemas.xmlsoap.org/ws/2005/05/identity/NoProofKey"];
  [v6 setRequestType:@"http://schemas.xmlsoap.org/ws/2005/02/trust/Issue"];
  [v6 setAppliesTo:v31];
  v7 = objc_opt_new();
  [v7 setStringValue:@"http://schemas.xmlsoap.org/ws/2005/02/trust/RST/Issue"];
  [v7 setMustUnderstand:@"1"];
  v30 = objc_opt_new();
  v8 = [v3 nonce];
  [v30 setStringValue:v8];

  v9 = objc_opt_new();
  [v9 setAddress:@"http://www.w3.org/2005/08/addressing/anonymous"];
  v10 = objc_opt_new();
  [v10 setMustUnderstand:@"1"];
  v11 = [v3 to];
  [v10 setStringValue:v11];

  v12 = objc_opt_new();
  v13 = NSString;
  v14 = [MEMORY[0x263F08C38] UUID];
  v15 = [v14 UUIDString];
  v16 = [v13 stringWithFormat:@"uuid-%@", v15];
  [v12 setId:v16];

  v17 = [v3 userName];
  [v12 setUsername:v17];

  CFAllocatorRef v18 = (const __CFAllocator *)SecCFAllocatorZeroize();
  id v19 = [v3 password];
  v20 = (const UInt8 *)[v19 mutableBytes];
  v21 = [v3 password];

  v22 = (__CFString *)CFStringCreateWithBytes(v18, v20, [v21 length], 0x8000100u, 0);
  [v12 setPassword:v22];

  v23 = objc_opt_new();
  [v23 setMustUnderstand:@"1"];
  [v23 setUsernameToken:v12];
  v24 = objc_opt_new();
  v34[0] = v7;
  v34[1] = v30;
  v34[2] = v9;
  v34[3] = v10;
  v34[4] = v23;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:5];
  [v24 setHeader:v25];

  v33 = v6;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  [v24 setBody:v26];

  v27 = objc_opt_new();
  [v27 setEnvelope:v24];
  v28 = [v27 XMLDataWithOptions:1];

  return v28;
}

- (id)parseWSTrustRequest:(id)a3 version:(unint64_t)a4
{
  if (a4)
  {
    id v5 = a3;
    v6 = objc_alloc_init(POWSTrustRequest);
    v7 = +[POXMLHelper loadXMLDocument:v5];

    if (v7)
    {
      v8 = [[POXMLXPathContext alloc] initWithXMLContext:v7];
      [(POXMLXPathContext *)v8 registerNamespaces:@"s=http://www.w3.org/2003/05/soap-envelope a=http://www.w3.org/2005/08/addressing u=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd o=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd  wsu=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd wsp=http://schemas.xmlsoap.org/ws/2004/09/policy saml=urn:oasis:names:tc:SAML:1.0:assertion"];
      v9 = @"http://schemas.xmlsoap.org/ws/2005/02/trust";
      if (a4 == 1) {
        v9 = @"http://docs.oasis-open.org/ws-sx/ws-trust/200512";
      }
      v10 = [NSString stringWithFormat:@"%@=%@", @"trust", v9];
      [(POXMLXPathContext *)v8 registerNamespaces:v10];

      v38 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Header/a:Action"];
      v11 = [v38 nodes];
      v12 = [v11 firstObject];
      v13 = [v12 content];
      [(POWSTrustRequest *)v6 setAction:v13];

      v37 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Header/a:To"];
      v14 = [v37 nodes];
      v15 = [v14 firstObject];
      v16 = [v15 content];
      [(POWSTrustRequest *)v6 setTo:v16];

      v17 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Header/a:MessageID"];
      CFAllocatorRef v18 = [v17 nodes];
      id v19 = [v18 firstObject];
      v20 = [v19 content];
      [(POWSTrustRequest *)v6 setNonce:v20];

      v21 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Body/trust:RequestSecurityToken/wsp:AppliesTo/a:EndpointReference/a:Address"];
      v22 = [v21 nodes];
      v23 = [v22 firstObject];
      v24 = [v23 content];
      [(POWSTrustRequest *)v6 setEndpointURN:v24];

      v25 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Header/o:Security/o:UsernameToken/o:Username"];
      v26 = [v25 nodes];
      v27 = [v26 firstObject];
      v28 = [v27 content];
      [(POWSTrustRequest *)v6 setUserName:v28];

      v29 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Header/o:Security/o:UsernameToken/o:Password"];
      v30 = [v29 nodes];
      v31 = [v30 firstObject];
      v32 = [v31 content];

      v33 = [v32 dataUsingEncoding:4];
      v34 = (void *)[v33 mutableCopy];
      [(POWSTrustRequest *)v6 setPassword:v34];

      v35 = v6;
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    v35 = 0;
  }
  return v35;
}

- (id)createWSTrust13Response:(id)a3
{
  v59[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v6 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"UTC"];
  v56 = v5;
  [v5 setTimeZone:v6];

  v7 = objc_opt_new();
  [v7 setStringValue:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/RSTRC/IssueFinal"];
  v55 = v7;
  [v7 setMustUnderstand:@"1"];
  v8 = objc_opt_new();
  v9 = [v3 nonce];
  v54 = v8;
  [v8 setStringValue:v9];

  v10 = objc_opt_new();
  [v10 setId:@"_0"];
  v11 = [v3 created];
  [v10 setCreated:v11];

  v12 = [v3 expires];
  [v10 setExpires:v12];

  v13 = objc_opt_new();
  [v13 setMustUnderstand:@"1"];
  v52 = v13;
  v53 = v10;
  [v13 setTimestamp:v10];
  v14 = objc_opt_new();
  v15 = [v3 created];
  [v14 setCreated:v15];

  v16 = [v3 tokenExpires];
  [v14 setExpires:v16];

  v17 = objc_opt_new();
  CFAllocatorRef v18 = [v3 endpointURN];
  [v17 setAddress:v18];

  id v19 = objc_opt_new();
  v51 = v17;
  [v19 setEndpointReference:v17];
  v20 = objc_opt_new();
  v21 = [v3 assertion];
  [v20 setStringValue:v21];

  v22 = objc_opt_new();
  v23 = [v3 keyIdentifier];
  [v22 setStringValue:v23];

  [v22 setValueType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID"];
  v24 = objc_opt_new();
  v50 = v22;
  [v24 setKeyIdentifier:v22];
  v25 = [v3 tokenType];
  LODWORD(v22) = [v25 isEqualToString:@"urn:oasis:names:tc:SAML:1.0:assertion"];

  if (v22) {
    [v24 setTokenType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"];
  }
  v26 = [v3 tokenType];
  int v27 = [v26 isEqualToString:@"urn:oasis:names:tc:SAML:2.0:assertion"];

  if (v27) {
    [v24 setTokenType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"];
  }
  v28 = objc_opt_new();
  [v28 setSecurityTokenReference:v24];
  v29 = objc_opt_new();
  v30 = [v3 keyIdentifier];
  [v29 setStringValue:v30];

  [v29 setValueType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID"];
  v31 = objc_opt_new();
  v49 = v29;
  [v31 setKeyIdentifier:v29];
  v32 = [v3 tokenType];
  LODWORD(v29) = [v32 isEqualToString:@"urn:oasis:names:tc:SAML:1.0:assertion"];

  if (v29) {
    [v31 setTokenType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"];
  }
  v33 = [v3 tokenType];
  int v34 = [v33 isEqualToString:@"urn:oasis:names:tc:SAML:2.0:assertion"];

  if (v34) {
    [v31 setTokenType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"];
  }
  v35 = objc_opt_new();
  [v35 setSecurityTokenReference:v31];
  v48 = v31;
  v36 = objc_opt_new();
  [v36 setLifetime:v14];
  [v36 setAppliesTo:v19];
  [v36 setRequestedSecurityToken:v20];
  v47 = v28;
  [v36 setRequestedAttachedReference:v28];
  [v36 setRequestedUnattachedReference:v35];
  v37 = [v3 tokenType];
  [v36 setTokenType:v37];

  [v36 setKeyType:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/Bearer"];
  [v36 setRequestType:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/Issue"];
  v46 = v19;
  v38 = objc_opt_new();
  v59[0] = v36;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
  [v38 setRequestSecurityTokenResponse:v39];

  v40 = objc_opt_new();
  v58[0] = v55;
  v58[1] = v54;
  v58[2] = v52;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:3];
  [v40 setHeader:v41];

  v57 = v38;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
  [v40 setBody:v42];

  v43 = objc_opt_new();
  [v43 setEnvelope:v40];
  v44 = [v43 XMLDataWithOptions:1];

  return v44;
}

- (id)createWSTrust2005Response:(id)a3
{
  v61[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v6 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"UTC"];
  v58 = v5;
  [v5 setTimeZone:v6];

  v7 = objc_opt_new();
  [v7 setStringValue:@"http://schemas.xmlsoap.org/ws/2005/02/trust/RSTR/Issue"];
  v57 = v7;
  [v7 setMustUnderstand:@"1"];
  v8 = objc_opt_new();
  v9 = [v3 nonce];
  v56 = v8;
  [v8 setStringValue:v9];

  v10 = objc_opt_new();
  [v10 setId:@"_0"];
  v11 = [v3 created];
  [v10 setCreated:v11];

  v12 = [v3 expires];
  [v10 setExpires:v12];

  v13 = objc_opt_new();
  [v13 setMustUnderstand:@"1"];
  v54 = v13;
  v55 = v10;
  [v13 setTimestamp:v10];
  v14 = objc_opt_new();
  v15 = [v3 created];
  [v14 setCreated:v15];

  v16 = [v3 tokenExpires];
  [v14 setExpires:v16];

  v17 = objc_opt_new();
  CFAllocatorRef v18 = [v3 endpointURN];
  [v17 setAddress:v18];

  id v19 = objc_opt_new();
  v53 = v17;
  [v19 setEndpointReference:v17];
  v20 = objc_opt_new();
  v21 = [v3 assertion];
  v59 = v20;
  [v20 setStringValue:v21];

  v22 = objc_opt_new();
  v23 = [v3 keyIdentifier];
  [v22 setStringValue:v23];

  [v22 setValueType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID"];
  v24 = objc_opt_new();
  v52 = v22;
  [v24 setKeyIdentifier:v22];
  v25 = [v3 tokenType];
  if ([v25 isEqualToString:@"urn:oasis:names:tc:SAML:1.0:assertion"])
  {
  }
  else
  {
    v26 = [v3 tokenType];
    int v27 = [v26 isEqualToString:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"];

    if (!v27) {
      goto LABEL_5;
    }
  }
  [v24 setTokenType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"];
LABEL_5:
  v28 = [v3 tokenType];
  if ([v28 isEqualToString:@"urn:oasis:names:tc:SAML:2.0:assertion"])
  {
  }
  else
  {
    v29 = [v3 tokenType];
    int v30 = [v29 isEqualToString:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"];

    if (!v30) {
      goto LABEL_9;
    }
  }
  [v24 setTokenType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"];
LABEL_9:
  v31 = objc_opt_new();
  [v31 setSecurityTokenReference:v24];
  v32 = objc_opt_new();
  v33 = [v3 keyIdentifier];
  [v32 setStringValue:v33];

  [v32 setValueType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID"];
  int v34 = objc_opt_new();
  v50 = v32;
  [v34 setKeyIdentifier:v32];
  v35 = [v3 tokenType];
  if ([v35 isEqualToString:@"urn:oasis:names:tc:SAML:1.0:assertion"])
  {
  }
  else
  {
    v36 = [v3 tokenType];
    int v37 = [v36 isEqualToString:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"];

    if (!v37) {
      goto LABEL_13;
    }
  }
  [v34 setTokenType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"];
LABEL_13:
  v38 = [v3 tokenType];
  v51 = v24;
  if ([v38 isEqualToString:@"urn:oasis:names:tc:SAML:2.0:assertion"])
  {
  }
  else
  {
    v39 = [v3 tokenType];
    int v40 = [v39 isEqualToString:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"];

    if (!v40) {
      goto LABEL_17;
    }
  }
  [v34 setTokenType:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"];
LABEL_17:
  v41 = objc_opt_new();
  [v41 setSecurityTokenReference:v34];
  v42 = objc_opt_new();
  [v42 setLifetime:v14];
  [v42 setAppliesTo:v19];
  [v42 setRequestedSecurityToken:v59];
  [v42 setRequestedAttachedReference:v31];
  [v42 setRequestedUnattachedReference:v41];
  v43 = [v3 tokenType];
  [v42 setTokenType:v43];

  [v42 setKeyType:@"http://schemas.xmlsoap.org/ws/2005/05/identity/NoProofKey"];
  [v42 setRequestType:@"http://schemas.xmlsoap.org/ws/2005/02/trust/Issue"];
  v44 = objc_opt_new();
  v61[0] = v57;
  v61[1] = v56;
  v61[2] = v54;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:3];
  [v44 setHeader:v45];

  v60 = v42;
  v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
  [v44 setBody:v46];

  v47 = objc_opt_new();
  [v47 setEnvelope:v44];
  v48 = [v47 XMLDataWithOptions:1];

  return v48;
}

- (id)createWSTrustFault:(id)a3
{
  v45[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v6 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"UTC"];
  v43 = v5;
  [v5 setTimeZone:v6];

  v7 = objc_opt_new();
  [v7 setStringValue:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/RSTRC/IssueFinal"];
  [v7 setMustUnderstand:@"1"];
  v8 = objc_opt_new();
  v9 = [v3 nonce];
  [v8 setStringValue:v9];

  v10 = [v3 created];
  if (v10)
  {

LABEL_4:
    v12 = objc_opt_new();
    [v12 setId:@"_0"];
    v13 = [v3 created];
    [v12 setCreated:v13];

    v14 = [v3 expires];
    [v12 setExpires:v14];

    v15 = objc_opt_new();
    [v15 setMustUnderstand:@"1"];
    [v15 setTimestamp:v12];

    goto LABEL_5;
  }
  v11 = [v3 expires];

  if (v11) {
    goto LABEL_4;
  }
  v15 = 0;
LABEL_5:
  v16 = objc_opt_new();
  v17 = [v3 created];
  [v16 setCreated:v17];

  CFAllocatorRef v18 = [v3 tokenExpires];
  v41 = v16;
  [v16 setExpires:v18];

  id v19 = objc_opt_new();
  v20 = [v3 endpointURN];
  [v19 setAddress:v20];

  v39 = objc_opt_new();
  int v40 = v19;
  [v39 setEndpointReference:v19];
  v21 = objc_opt_new();
  v22 = [v3 faultSubCodeValue];
  [v21 setValue:v22];

  v23 = objc_opt_new();
  v24 = [v3 faultCodeValue];
  [v23 setValue:v24];

  v38 = v21;
  [v23 setSubcode:v21];
  v25 = objc_opt_new();
  v26 = [v3 faultReason];
  [v25 setStringValue:v26];

  int v27 = objc_opt_new();
  [v27 setText:v25];
  v28 = objc_opt_new();
  [v28 setCode:v23];
  [v28 setReason:v27];
  v29 = objc_opt_new();
  v42 = v8;
  v45[0] = v7;
  v45[1] = v8;
  int v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
  [v29 setHeader:v30];

  v31 = v15;
  if (v15)
  {
    v32 = [v29 Header];
    v33 = [v32 arrayByAddingObject:v15];
    [v29 setHeader:v33];
  }
  v44 = v28;
  int v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  [v29 setBody:v34];

  v35 = objc_opt_new();
  [v35 setEnvelope:v29];
  v36 = [v35 XMLDataWithOptions:1];

  return v36;
}

- (id)parseWSTrustResponse:(id)a3 version:(unint64_t)a4
{
  if (!a4)
  {
    v6 = 0;
    goto LABEL_22;
  }
  id v5 = a3;
  v6 = objc_alloc_init(POWSTrustResponse);
  uint64_t v7 = +[POXMLHelper loadXMLDocument:v5];

  v64 = (void *)v7;
  v8 = [[POXMLXPathContext alloc] initWithXMLContext:v7];
  [(POXMLXPathContext *)v8 registerNamespaces:@"s=http://www.w3.org/2003/05/soap-envelope a=http://www.w3.org/2005/08/addressing u=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd o=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd  wsu=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd saml=urn:oasis:names:tc:SAML:1.0:assertion saml2=urn:oasis:names:tc:SAML:2.0:assertion"];
  v9 = @"http://schemas.xmlsoap.org/ws/2005/02/trust";
  if (a4 == 1) {
    v9 = @"http://docs.oasis-open.org/ws-sx/ws-trust/200512";
  }
  v10 = [NSString stringWithFormat:@"%@=%@", @"trust", v9];
  [(POXMLXPathContext *)v8 registerNamespaces:v10];

  v63 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Header/a:RelatesTo"];
  v11 = [v63 nodes];
  v12 = [v11 firstObject];
  v13 = [v12 content];
  [(POWSTrustResponse *)v6 setNonce:v13];

  id v14 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v14 setFormatOptions:3955];
  id v15 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v15 setFormatOptions:1907];
  v62 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Header/o:Security/u:Timestamp/u:Created"];
  v16 = [v62 nodes];
  v17 = [v16 firstObject];
  uint64_t v18 = [v17 content];

  id v19 = [v14 dateFromString:v18];
  if (v19)
  {
    [(POWSTrustResponse *)v6 setCreated:v19];
  }
  else
  {
    v20 = [v15 dateFromString:v18];
    [(POWSTrustResponse *)v6 setCreated:v20];
  }
  v60 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Header/o:Security/u:Timestamp/u:Expires"];
  v21 = [v60 nodes];
  v22 = [v21 firstObject];
  uint64_t v23 = [v22 content];

  v24 = [v14 dateFromString:v23];
  if (v24)
  {
    [(POWSTrustResponse *)v6 setExpires:v24];
  }
  else
  {
    v25 = [v15 dateFromString:v23];
    [(POWSTrustResponse *)v6 setExpires:v25];
  }
  v26 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Body/s:Fault"];
  -[POWSTrustResponse setFault:](v6, "setFault:", (int)[v26 nodeCount] > 0);
  v61 = (void *)v18;
  v59 = (void *)v23;
  if (![(POWSTrustResponse *)v6 isFault])
  {
    if (a4 == 1)
    {
      v41 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Body/trust:RequestSecurityTokenResponseCollection/trust:RequestSecurityTokenResponse/trust:TokenType"];
      v45 = [v41 nodes];
      v46 = [v45 firstObject];
      v47 = [v46 content];

      v48 = @"//s:Envelope/s:Body/trust:RequestSecurityTokenResponseCollection/trust:RequestSecurityTokenResponse/trust:RequestedSecurityToken/saml2:Assertion";
      if (([v47 isEqualToString:@"urn:oasis:names:tc:SAML:2.0:assertion"] & 1) == 0)
      {
        int v49 = [v47 isEqualToString:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"];
        v50 = @"//s:Envelope/s:Body/trust:RequestSecurityTokenResponseCollection/trust:RequestSecurityTokenResponse/trust:RequestedSecurityToken/saml:Assertion";
        goto LABEL_18;
      }
    }
    else
    {
      v41 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Body/trust:RequestSecurityTokenResponse/trust:TokenType"];
      v51 = [v41 nodes];
      v52 = [v51 firstObject];
      v47 = [v52 content];

      v48 = @"//s:Envelope/s:Body/trust:RequestSecurityTokenResponse/trust:RequestedSecurityToken/saml2:Assertion";
      if (([v47 isEqualToString:@"urn:oasis:names:tc:SAML:2.0:assertion"] & 1) == 0)
      {
        int v49 = [v47 isEqualToString:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"];
        v50 = @"//s:Envelope/s:Body/trust:RequestSecurityTokenResponse/trust:RequestedSecurityToken/saml:Assertion";
LABEL_18:
        if (!v49) {
          v48 = v50;
        }
      }
    }
    v42 = [(POXMLXPathContext *)v8 evaluateXPath:v48];

    v53 = [v42 nodes];
    v54 = [v53 firstObject];
    v55 = [v54 rawXMLString];
    [(POWSTrustResponse *)v6 setAssertion:v55];

    int v34 = [v41 nodes];
    v44 = [v34 firstObject];
    v56 = [v44 content];
    [(POWSTrustResponse *)v6 setTokenType:v56];

    v43 = v64;
    goto LABEL_21;
  }
  v58 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Body/s:Fault/s:Reason/s:Text"];
  int v27 = [v58 nodes];
  v28 = [v27 firstObject];
  v29 = [v28 content];
  [(POWSTrustResponse *)v6 setFaultReason:v29];

  int v30 = [(POXMLXPathContext *)v8 evaluateXPath:@"//s:Envelope/s:Body/s:Fault/s:Code/s:Value"];
  v31 = [v30 nodes];
  v32 = [v31 firstObject];
  v33 = [v32 content];
  [(POWSTrustResponse *)v6 setFaultCodeValue:v33];

  int v34 = [(POXMLXPathContext *)v8 evaluateXPath:@"/s:Envelope/s:Body/s:Fault/s:Code/s:Subcode/s:Value"];
  v35 = [v34 nodes];
  v36 = [v35 firstObject];
  [v36 content];
  id v37 = v14;
  v38 = v26;
  int v40 = v39 = v15;
  [(POWSTrustResponse *)v6 setFaultSubCodeValue:v40];

  id v15 = v39;
  v26 = v38;
  id v14 = v37;
  v41 = v30;
  v42 = v58;

  v43 = v64;
  v44 = [v64 nameSpacePrefixForHref:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"];
  [(POWSTrustResponse *)v6 setSecurityExtensionPrefix:v44];
LABEL_21:

LABEL_22:
  return v6;
}

- (id)parseWSTrustMexResponse:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@ %@=%@", @"wsdl=http://schemas.xmlsoap.org/wsdl/ wsp=http://schemas.xmlsoap.org/ws/2004/09/policy soap12=http://schemas.xmlsoap.org/wsdl/soap12/ wsa10=http://www.w3.org/2005/08/addressing", @"sp", @"http://schemas.xmlsoap.org/ws/2005/07/securitypolicy"];
    id v8 = [(POWSTrustProcess *)self parseMexResponse:v6 namespaces:v7 policyXPath:@"sp:SignedSupportingTokens/wsp:Policy/sp:UsernameToken/wsp:Policy/sp:WssUsernameToken10" action:@"http://schemas.xmlsoap.org/ws/2005/02/trust/RST/Issue"];
    if (-[POWSTrustProcess parseWSTrust2005](self, "parseWSTrust2005") && v8 && [v8 version] == 2)
    {
      v9 = PO_LOG_POWSTrustProcess();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v10 = "WSTrust 2005 found";
        v11 = buf;
        goto LABEL_13;
      }
LABEL_14:

      id v8 = v8;
      v12 = v8;
LABEL_16:

      goto LABEL_18;
    }
LABEL_15:

    v12 = 0;
    goto LABEL_16;
  }
  if (a4 == 1)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@ %@=%@", @"wsdl=http://schemas.xmlsoap.org/wsdl/ wsp=http://schemas.xmlsoap.org/ws/2004/09/policy soap12=http://schemas.xmlsoap.org/wsdl/soap12/ wsa10=http://www.w3.org/2005/08/addressing", @"sp", @"http://docs.oasis-open.org/ws-sx/ws-securitypolicy/200702"];
    id v8 = [(POWSTrustProcess *)self parseMexResponse:v6 namespaces:v7 policyXPath:@"sp:SignedEncryptedSupportingTokens/wsp:Policy/sp:UsernameToken/wsp:Policy/sp:WssUsernameToken10" action:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue"];
    if (-[POWSTrustProcess parseWSTrust13](self, "parseWSTrust13") && v8 && [v8 version] == 1)
    {
      v9 = PO_LOG_POWSTrustProcess();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = 0;
        v10 = "WSTrust 1.3 found";
        v11 = (uint8_t *)&v15;
LABEL_13:
        _os_log_impl(&dword_259DFE000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (id)parseMexResponse:(id)a3 namespaces:(id)a4 policyXPath:(id)a5 action:(id)a6
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v96 = a5;
  id v93 = a6;
  v11 = objc_alloc_init(POWSTrustMexResponse);
  v78 = v9;
  v12 = +[POXMLHelper loadXMLDocument:v9];
  if (!v12)
  {
    id v74 = __67__POWSTrustProcess_parseMexResponse_namespaces_policyXPath_action___block_invoke();
    v72 = 0;
    goto LABEL_86;
  }
  v79 = v11;
  v81 = v12;
  v13 = [[POXMLXPathContext alloc] initWithXMLContext:v12];
  id v76 = v10;
  [(POXMLXPathContext *)v13 registerNamespaces:v10];
  v88 = v13;
  id v14 = [(POXMLXPathContext *)v13 evaluateXPath:@"//wsdl:definitions/wsp:Policy/wsp:ExactlyOne/wsp:All"];
  id v92 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v77 = v14;
  __int16 v15 = [v14 nodes];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v109 objects:v118 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v110 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        v21 = [v20 parent];
        v22 = [v21 parent];
        uint64_t v23 = [v22 valueForProperty:@"Id"];

        v24 = [v20 evaluateXPath:v96];
        if ((int)[v24 nodeCount] >= 1) {
          [v92 addObject:v23];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v109 objects:v118 count:16];
    }
    while (v17);
  }

  if (![v92 count])
  {
    v73 = PO_LOG_POWSTrustProcess();
    id v10 = v76;
    v11 = v79;
    v12 = v81;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259DFE000, v73, OS_LOG_TYPE_INFO, "no WSTrust policies found", buf, 2u);
    }
    v72 = 0;
    goto LABEL_85;
  }
  v12 = v81;
  if ((unint64_t)[v92 count] >= 2)
  {
    v25 = PO_LOG_POWSTrustProcess();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259DFE000, v25, OS_LOG_TYPE_INFO, "more than one wstrust policy found", buf, 2u);
    }
  }
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obuint64_t j = v92;
  uint64_t v85 = [obj countByEnumeratingWithState:&v105 objects:v117 count:16];
  if (!v85) {
    goto LABEL_79;
  }
  uint64_t v84 = *(void *)v106;
  while (2)
  {
    for (uint64_t j = 0; j != v85; ++j)
    {
      if (*(void *)v106 != v84) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void *)(*((void *)&v105 + 1) + 8 * j);
      v28 = PO_LOG_POWSTrustProcess();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v116 = v27;
        _os_log_impl(&dword_259DFE000, v28, OS_LOG_TYPE_INFO, "checking %{public}@", buf, 0xCu);
      }

      v29 = [NSString stringWithFormat:@"//wsdl:definitions/wsdl:binding/wsp:PolicyReference[@URI=\"#%@\"]", v27];
      int v30 = [(POXMLXPathContext *)v88 evaluateXPath:v29];
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      v89 = v30;
      v31 = [v30 nodes];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v101 objects:v114 count:16];
      if (!v32)
      {

        v44 = 0;
        int v49 = 0;
LABEL_57:
        int v34 = PO_LOG_POWSTrustProcess();
        int v63 = 1;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_259DFE000, v34, OS_LOG_TYPE_INFO, "no binding for found", buf, 2u);
        }
        v82 = 0;
        goto LABEL_75;
      }
      uint64_t v33 = v32;
      id v94 = v31;
      uint64_t v91 = v27;
      v86 = v29;
      uint64_t v87 = j;
      int v34 = 0;
      uint64_t v35 = *(void *)v102;
      do
      {
        uint64_t v36 = 0;
        id v37 = v34;
        do
        {
          if (*(void *)v102 != v35) {
            objc_enumerationMutation(v94);
          }
          v38 = *(void **)(*((void *)&v101 + 1) + 8 * v36);
          id v39 = [v38 parent];
          int v34 = [v39 valueForProperty:@"name"];

          int v40 = [v38 parent];
          v41 = [v40 evaluateXPath:@"soap12:binding"];

          if ((int)[v41 nodeCount] < 1)
          {
            v44 = 0;
          }
          else
          {
            v42 = [v41 nodes];
            v43 = [v42 firstObject];
            v44 = [v43 valueForProperty:@"transport"];
          }
          v45 = [v38 parent];
          v46 = [v45 evaluateXPath:@"wsdl:operation/soap12:operation"];

          if ((int)[v46 nodeCount] < 1)
          {
            int v49 = 0;
          }
          else
          {
            v47 = [v46 nodes];
            v48 = [v47 firstObject];
            int v49 = [v48 valueForProperty:@"soapAction"];
          }
          if ([v44 isEqualToString:@"http://schemas.xmlsoap.org/soap/http"])
          {
            if ([v49 isEqualToString:v93])
            {

              goto LABEL_43;
            }
          }
          else
          {
            v50 = PO_LOG_POWSTrustProcess();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v116 = v91;
              _os_log_impl(&dword_259DFE000, v50, OS_LOG_TYPE_INFO, "transport for %{public}@ not http, skipping", buf, 0xCu);
            }
          }
          ++v36;
          id v37 = v34;
        }
        while (v33 != v36);
        uint64_t v33 = [v94 countByEnumeratingWithState:&v101 objects:v114 count:16];
      }
      while (v33);
      int v49 = 0;
      v44 = 0;
LABEL_43:

      if (!v34)
      {
        v12 = v81;
        v29 = v86;
        uint64_t j = v87;
        goto LABEL_57;
      }
      v51 = [(POXMLXPathContext *)v88 evaluateXPath:@"//wsdl:definitions/wsdl:service/wsdl:port"];
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      v83 = v51;
      id v90 = [v51 nodes];
      uint64_t v52 = [v90 countByEnumeratingWithState:&v97 objects:v113 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        v54 = 0;
        id v95 = *(id *)v98;
        while (2)
        {
          for (uint64_t k = 0; k != v53; ++k)
          {
            if (*(id *)v98 != v95) {
              objc_enumerationMutation(v90);
            }
            v56 = *(void **)(*((void *)&v97 + 1) + 8 * k);
            v57 = [v56 valueForProperty:@"binding"];
            v58 = [NSString stringWithFormat:@":%@", v34];
            int v59 = [v57 hasSuffix:v58];

            if (v59)
            {
              v60 = [v56 valueForProperty:@"name"];

              v61 = [v56 evaluateXPath:@"wsa10:EndpointReference/wsa10:Address"];
              if ((int)[v61 nodeCount] > 0)
              {
                v64 = [v61 nodes];
                v65 = [v64 firstObject];
                uint64_t v66 = [v65 content];

                v62 = (void *)v66;
                goto LABEL_62;
              }

              v54 = v60;
            }
          }
          uint64_t v53 = [v90 countByEnumeratingWithState:&v97 objects:v113 count:16];
          if (v53) {
            continue;
          }
          break;
        }
        v62 = 0;
        v60 = v54;
      }
      else
      {
        v60 = 0;
        v62 = 0;
      }
LABEL_62:

      v67 = [v62 lowercaseString];
      char v68 = [v67 hasPrefix:@"https://"];

      v12 = v81;
      if (v68)
      {
        int v63 = 0;
        uint64_t j = v87;
        v69 = v83;
        if (v62 && v49)
        {
          [(POWSTrustMexResponse *)v79 setEndpointURLString:v62];
          [(POWSTrustMexResponse *)v79 setPolicyName:v91];
          [(POWSTrustMexResponse *)v79 setBindingName:v34];
          [(POWSTrustMexResponse *)v79 setPortName:v60];
          [(POWSTrustMexResponse *)v79 setTransport:v44];
          if ([v49 isEqualToString:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue"])
          {
            uint64_t v70 = 1;
          }
          else if ([v49 isEqualToString:@"http://schemas.xmlsoap.org/ws/2005/02/trust/RST/Issue"])
          {
            uint64_t v70 = 2;
          }
          else
          {
            uint64_t v70 = 0;
          }
          [(POWSTrustMexResponse *)v79 setVersion:v70];
          v82 = v79;
          int v63 = 1;
        }
      }
      else
      {
        v71 = PO_LOG_POWSTrustProcess();
        uint64_t j = v87;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v116 = v91;
          _os_log_impl(&dword_259DFE000, v71, OS_LOG_TYPE_INFO, "url for %{public}@ not https, skipping", buf, 0xCu);
        }

        int v63 = 5;
        v69 = v83;
      }

      v29 = v86;
LABEL_75:

      if (v63 != 5 && v63)
      {
        id v10 = v76;
        v11 = v79;
        v73 = obj;
        v72 = v82;
        goto LABEL_85;
      }
    }
    uint64_t v85 = [obj countByEnumeratingWithState:&v105 objects:v117 count:16];
    if (v85) {
      continue;
    }
    break;
  }
LABEL_79:
  v72 = 0;
  id v10 = v76;
  v11 = v79;
  v73 = obj;
LABEL_85:

LABEL_86:
  return v72;
}

id __67__POWSTrustProcess_parseMexResponse_namespaces_policyXPath_action___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to load mex response as XML."];
  v1 = PO_LOG_POWSTrustProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v0, v1);
  }

  return v0;
}

- (BOOL)parseWSTrust13
{
  return self->_parseWSTrust13;
}

- (void)setParseWSTrust13:(BOOL)a3
{
  self->_parseWSTrust13 = a3;
}

- (BOOL)parseWSTrust2005
{
  return self->_parseWSTrust2005;
}

- (void)setParseWSTrust2005:(BOOL)a3
{
  self->_parseWSTrust2005 = a3;
}

@end