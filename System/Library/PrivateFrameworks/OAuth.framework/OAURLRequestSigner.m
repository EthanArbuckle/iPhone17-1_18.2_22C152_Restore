@interface OAURLRequestSigner
- (Class)signer;
- (OAURLRequestSigner)initWithCredential:(id)a3;
- (id)applyApplicationID:(id)a3 toRequest:(id)a4 containsMultiPartData:(BOOL)a5;
- (id)oauthAuthorizationHeaderWithSignature:(id)a3 nonce:(id)a4 timestamp:(id)a5;
- (id)oauthNonce;
- (id)oauthParametersWithNonce:(id)a3 timeStamp:(id)a4;
- (id)signatureMethodString;
- (id)signedURLRequestWithRequest:(id)a3;
- (id)signedURLRequestWithRequest:(id)a3 applicationID:(id)a4 timestamp:(id)a5;
- (id)timestamp:(id)a3;
- (int)signatureMethod;
- (void)dealloc;
- (void)setSignatureMethod:(int)a3;
@end

@implementation OAURLRequestSigner

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OAURLRequestSigner;
  [(OAURLRequestSigner *)&v3 dealloc];
}

- (id)timestamp:(id)a3
{
  id v3 = a3;
  if (!a3) {
    id v3 = (id)[MEMORY[0x263EFF910] date];
  }
  v4 = NSString;
  [v3 timeIntervalSince1970];
  return (id)objc_msgSend(v4, "stringWithFormat:", @"%d", (int)v5);
}

- (OAURLRequestSigner)initWithCredential:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OAURLRequestSigner;
  v4 = [(OAURLRequestSigner *)&v6 init];
  if (v4)
  {
    v4->_credential = (OACredential *)a3;
    v4->_signatureMethod = 0;
  }
  return v4;
}

- (id)signatureMethodString
{
  if (![(OAURLRequestSigner *)self signatureMethod]) {
    return @"HMAC-SHA1";
  }
  if ([(OAURLRequestSigner *)self signatureMethod] == 1) {
    return @"RSA-SHA1";
  }
  if ([(OAURLRequestSigner *)self signatureMethod] == 2) {
    return @"PLAINTEXT";
  }
  return 0;
}

- (Class)signer
{
  if ([(OAURLRequestSigner *)self signatureMethod])
  {
    if ([(OAURLRequestSigner *)self signatureMethod] == 1
      || [(OAURLRequestSigner *)self signatureMethod] != 2)
    {
      return 0;
    }
    id v3 = &off_264266430;
  }
  else
  {
    id v3 = off_264266428;
  }
  double v5 = *v3;
  return (Class)MEMORY[0x270F9A6F8](v5);
}

- (id)oauthNonce
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFUUIDRef v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  CFRelease(v3);
  return v4;
}

- (id)oauthParametersWithNonce:(id)a3 timeStamp:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"%@=%@", OAConsumerKeyKey, -[OACredential consumerKey](self->_credential, "consumerKey")];
  uint64_t v8 = [NSString stringWithFormat:@"%@=%@", OASignatureMethodKey, -[OAURLRequestSigner signatureMethodString](self, "signatureMethodString")];
  uint64_t v9 = [NSString stringWithFormat:@"%@=%@", OATimestampKey, a4];
  uint64_t v10 = [NSString stringWithFormat:@"%@=%@", OANonceKey, a3];
  uint64_t v11 = [NSString stringWithFormat:@"%@=%@", OAVersionKey, oauth_version];
  v12 = [(OACredential *)self->_credential oauthToken];
  if (v12) {
    v12 = (NSString *)[NSString stringWithFormat:@"%@=%@", OAAuthTokenKey, -[OACredential oauthToken](self->_credential, "oauthToken")];
  }
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7, v8, v9, v10, v11, v12, 0);
}

- (id)oauthAuthorizationHeaderWithSignature:(id)a3 nonce:(id)a4 timestamp:(id)a5
{
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@=\"%@\"", OANonceKey, a4)];
  [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@=\"%@\", OASignatureMethodKey, -[OAURLRequestSigner signatureMethodString](self, "signatureMethodString""))];
  [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@=\"%@\"", OATimestampKey, a5)];
  [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@=\"%@\", OAConsumerKeyKey, -[OACredential consumerKey](self->_credential, "consumerKey""))];
  if ([(OACredential *)self->_credential oauthToken]) {
    [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@=\"%@\", OAAuthTokenKey, -[OACredential oauthToken](self->_credential, "oauthToken""))];
  }
  [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@=\"%@\"", OASignatureKey, a3)];
  [v9 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@=\"%@\"", OAVersionKey, oauth_version)];
  uint64_t v10 = [v9 componentsJoinedByString:@", "];
  uint64_t v11 = (void *)[NSString stringWithFormat:@"OAuth %@", v10];

  return v11;
}

- (id)applyApplicationID:(id)a3 toRequest:(id)a4 containsMultiPartData:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = (void *)[a4 mutableCopy];
  uint64_t v8 = (void *)[v7 HTTPMethod];
  if (([v8 isEqualToString:@"GET"] & 1) != 0
    || ([v8 isEqualToString:@"DELETE"] & 1) != 0
    || v5)
  {
    v13 = (void *)[v7 URL];
    v14 = (void *)[v13 absoluteString];
    uint64_t v15 = objc_msgSend((id)objc_msgSend(v13, "query"), "length");
    uint64_t v16 = [a3 stringByAddingPercentEscapesUsingEncoding:4];
    v17 = @"&";
    if (!v15) {
      v17 = @"?";
    }
    uint64_t v18 = [v14 stringByAppendingFormat:@"%@application_id=%@", v17, v16];
    objc_msgSend(v7, "setURL:", objc_msgSend(NSURL, "URLWithString:", v18));
  }
  else if (([v8 isEqualToString:@"POST"] & 1) != 0 {
         || ([v8 isEqualToString:@"PUT"] & 1) != 0
  }
         || ([v8 isEqualToString:@"PROPFIND"] & 1) != 0
         || ([v8 isEqualToString:@"REPORT"] & 1) != 0
         || ([v8 isEqualToString:@"OPTIONS"] & 1) != 0
         || [v8 isEqualToString:@"PROPPATCH"])
  {
    id v9 = (id)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend((id)objc_msgSend(v7, "HTTPBody"), "bytes"), objc_msgSend((id)objc_msgSend(v7, "HTTPBody"), "length"), 4);
    uint64_t v10 = [v9 length];
    uint64_t v11 = [a3 stringByAddingPercentEscapesUsingEncoding:4];
    v12 = @"&";
    if (!v10) {
      v12 = &stru_26C6B30D0;
    }
    [v7 setHTTPBody:objc_msgSend((id)objc_msgSend(v9, "stringByAppendingFormat:", @"%@application_id=%@", v12, v11), "dataUsingEncoding:", 4)];
  }
  return v7;
}

- (id)signedURLRequestWithRequest:(id)a3 applicationID:(id)a4 timestamp:(id)a5
{
  id v7 = a3;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = (void *)[a3 valueForHTTPHeaderField:@"Content-Type"];
  uint64_t v10 = v9;
  if (!v9)
  {
    BOOL v11 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v11 = [v9 rangeOfString:@"multipart" options:1] != 0x7FFFFFFFFFFFFFFFLL;
  if (a4) {
LABEL_3:
  }
    id v7 = [(OAURLRequestSigner *)self applyApplicationID:a4 toRequest:v7 containsMultiPartData:v11];
LABEL_4:
  id v12 = [(OAURLRequestSigner *)self oauthNonce];
  id v13 = [(OAURLRequestSigner *)self timestamp:a5];
  id v14 = [(OAURLRequestSigner *)self oauthParametersWithNonce:v12 timeStamp:v13];
  uint64_t v15 = (void *)[v7 URL];
  if ([v15 user] || objc_msgSend(v15, "password"))
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v15 resolvingAgainstBaseURL:0];
    v17 = v16;
    if (v16)
    {
      [v16 setUser:0];
      [v17 setPassword:0];
    }
    uint64_t v15 = (void *)[v17 URL];
  }
  uint64_t v18 = (void *)[v7 mutableCopy];
  v19 = (void *)[v7 HTTPMethod];
  if (([v19 isEqualToString:@"GET"] & 1) != 0
    || [v19 isEqualToString:@"DELETE"] | v11)
  {
    v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "arrayByAddingObjectsFromArray:", objc_msgSend((id)objc_msgSend(v15, "query"), "componentsSeparatedByString:", @"&")), "sortedArrayUsingSelector:", sel_compare_), "componentsJoinedByString:", @"&");
    v21 = (void *)[v15 absoluteString];
    if ([v15 query])
    {
      uint64_t v22 = objc_msgSend((id)objc_msgSend(v15, "absoluteString"), "rangeOfString:", objc_msgSend(v15, "query"));
      if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
        v21 = objc_msgSend((id)objc_msgSend(v15, "absoluteString"), "substringToIndex:", v22 - 1);
      }
    }
    v23 = (__CFString *)[v7 HTTPMethod];
    uint64_t v24 = [NSString stringWithFormat:@"&%@&%@", objc_msgSend(v21, "oauth_urlEncodedString"), objc_msgSend(v20, "oauth_urlEncodedString")];
    goto LABEL_59;
  }
  if (([v19 isEqualToString:@"POST"] & 1) == 0
    && ([v19 isEqualToString:@"PUT"] & 1) == 0
    && ([v19 isEqualToString:@"PROPFIND"] & 1) == 0
    && ([v19 isEqualToString:@"REPORT"] & 1) == 0
    && ([v19 isEqualToString:@"OPTIONS"] & 1) == 0
    && ![v19 isEqualToString:@"PROPPATCH"])
  {
    v40 = 0;
    if (!v18) {
      return v18;
    }
    goto LABEL_61;
  }
  unint64_t v25 = 0x263F08000uLL;
  if (v10 && ([v10 isEqualToString:@"application/x-www-form-urlencoded"] & 1) != 0
    || !objc_msgSend((id)objc_msgSend(v7, "allHTTPHeaderFields"), "count"))
  {
    v26 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend((id)objc_msgSend(v7, "HTTPBody"), "bytes"), objc_msgSend((id)objc_msgSend(v7, "HTTPBody"), "length"), 4);
    if (v26)
    {
      v27 = v26;
      unint64_t v25 = 0x263F08000;
      if ([v26 length])
      {
        uint64_t v28 = [v27 componentsSeparatedByString:@"&"];

        if (v28) {
          id v14 = (id)[v14 arrayByAddingObjectsFromArray:v28];
        }
      }
      else
      {
      }
    }
    else
    {
      unint64_t v25 = 0x263F08000;
    }
  }
  v29 = (void *)[v15 query];
  if ([v29 length])
  {
    v30 = (void *)[v29 componentsSeparatedByString:@"&"];
    id v14 = (id)[MEMORY[0x263EFF980] arrayWithArray:v14];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      id v42 = v13;
      id v43 = v12;
      uint64_t v33 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v45 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          if (([v14 containsObject:v35] & 1) == 0) {
            [v14 addObject:v35];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v32);
      id v13 = v42;
      id v12 = v43;
      unint64_t v25 = 0x263F08000uLL;
    }
  }
  v36 = objc_msgSend((id)objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_), "componentsJoinedByString:", @"&");
  v37 = (void *)[v15 absoluteString];
  if ([v15 query])
  {
    uint64_t v38 = objc_msgSend((id)objc_msgSend(v15, "absoluteString"), "rangeOfString:", objc_msgSend(v15, "query"));
    if (v38 != 0x7FFFFFFFFFFFFFFFLL) {
      v37 = objc_msgSend((id)objc_msgSend(v15, "absoluteString"), "substringToIndex:", v38 - 1);
    }
  }
  if ([v19 isEqualToString:@"POST"])
  {
    v23 = @"POST&";
LABEL_58:
    uint64_t v24 = [*(id *)(v25 + 2880) stringWithFormat:@"%@&%@", objc_msgSend(v37, "oauth_urlEncodedString"), objc_msgSend(v36, "oauth_urlEncodedString")];
LABEL_59:
    uint64_t v39 = [(__CFString *)v23 stringByAppendingString:v24];
    goto LABEL_60;
  }
  if ([v19 isEqualToString:@"PUT"])
  {
    v23 = @"PUT&";
    goto LABEL_58;
  }
  if ([v19 isEqualToString:@"PROPFIND"])
  {
    v23 = @"PROPFIND&";
    goto LABEL_58;
  }
  if ([v19 isEqualToString:@"REPORT"])
  {
    v23 = @"REPORT&";
    goto LABEL_58;
  }
  if ([v19 isEqualToString:@"OPTIONS"])
  {
    v23 = @"OPTIONS&";
    goto LABEL_58;
  }
  if ([v19 isEqualToString:@"PROPPATCH"])
  {
    v23 = @"PROPPATCH&";
    goto LABEL_58;
  }
  uint64_t v39 = 0;
LABEL_60:
  v40 = (void *)[(objc_class *)[(OAURLRequestSigner *)self signer] signatureForText:v39 withKey:[(OACredential *)self->_credential signingKey]];
  if (v18) {
LABEL_61:
  }
    objc_msgSend(v18, "setValue:forHTTPHeaderField:", -[OAURLRequestSigner oauthAuthorizationHeaderWithSignature:nonce:timestamp:](self, "oauthAuthorizationHeaderWithSignature:nonce:timestamp:", objc_msgSend(v40, "oauth_urlEncodedString"), v12, v13), @"Authorization");
  return v18;
}

- (id)signedURLRequestWithRequest:(id)a3
{
  return [(OAURLRequestSigner *)self signedURLRequestWithRequest:a3 applicationID:0 timestamp:0];
}

- (int)signatureMethod
{
  return self->_signatureMethod;
}

- (void)setSignatureMethod:(int)a3
{
  self->_signatureMethod = a3;
}

@end