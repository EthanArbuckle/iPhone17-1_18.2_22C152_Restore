@interface MKHTTPProxyAuthorization
- (MKHTTPProxyAuthorization)initWithHeaderValue:(id)a3;
- (NSString)identifier;
- (NSString)signature;
- (void)setIdentifier:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation MKHTTPProxyAuthorization

- (MKHTTPProxyAuthorization)initWithHeaderValue:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKHTTPProxyAuthorization;
  v5 = [(MKHTTPProxyAuthorization *)&v16 init];
  if (v5)
  {
    if (![v4 hasPrefix:@"Bearer "])
    {
LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
    v6 = [v4 substringWithRange:objc_msgSend(@"Bearer ", "length"), objc_msgSend(v4, "length") - objc_msgSend(@"Bearer ", "length")];
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v6 options:0];
    id v15 = 0;
    v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v15];
    id v9 = v15;
    if (v9)
    {
      v10 = +[MKLog log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(MKHTTPContentPayload *)(uint64_t)v5 initWithHeaderValue:v10];
      }
LABEL_11:

      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = +[MKLog log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MKHTTPContentPayload initWithHeaderValue:]((uint64_t)v5, v10);
      }
      goto LABEL_11;
    }
    v11 = [v8 objectForKeyedSubscript:@"identifier"];
    [(MKHTTPProxyAuthorization *)v5 setIdentifier:v11];

    v12 = [v8 objectForKeyedSubscript:@"signature"];
    [(MKHTTPProxyAuthorization *)v5 setSignature:v12];
  }
  v13 = v5;
LABEL_13:

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end