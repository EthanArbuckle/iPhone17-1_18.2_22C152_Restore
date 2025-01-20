@interface NFRemoteAdminCardIngestionRequest
+ (BOOL)supportsSecureCoding;
+ (id)cardIngestionRequestWithServerIdentifier:(id)a3 sessionToken:(id)a4 readerModeMetadata:(id)a5 maxDetectionTimeout:(unint64_t)a6;
- (NFRemoteAdminCardIngestionRequest)initWithCoder:(id)a3;
- (NSDictionary)cardServiceInfo;
- (NSString)serverIdentifier;
- (NSString)sessionToken;
- (NSString)uri;
- (unint64_t)maxDetectionTimeout;
- (void)encodeWithCoder:(id)a3;
- (void)setCardServiceInfo:(id)a3;
- (void)setMaxDetectionTimeout:(unint64_t)a3;
- (void)setServerIdentifier:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setUri:(id)a3;
@end

@implementation NFRemoteAdminCardIngestionRequest

- (NFRemoteAdminCardIngestionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFRemoteAdminCardIngestionRequest;
  v5 = [(NFRemoteAdminCardIngestionRequest *)&v20 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverIdentifier"];
    serverIdentifier = v5->_serverIdentifier;
    v5->_serverIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uri"];
    uri = v5->_uri;
    v5->_uri = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionToken"];
    sessionToken = v5->_sessionToken;
    v5->_sessionToken = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v10 forKey:@"cardServiceInfo"];
    cardServiceInfo = v5->_cardServiceInfo;
    v5->_cardServiceInfo = (NSDictionary *)v17;

    v5->_maxDetectionTimeout = [v4 decodeIntegerForKey:@"maxDetectionTimeout"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  serverIdentifier = self->_serverIdentifier;
  id v5 = a3;
  [v5 encodeObject:serverIdentifier forKey:@"serverIdentifier"];
  [v5 encodeObject:self->_uri forKey:@"uri"];
  [v5 encodeObject:self->_sessionToken forKey:@"sessionToken"];
  [v5 encodeObject:self->_cardServiceInfo forKey:@"cardServiceInfo"];
  [v5 encodeInteger:self->_maxDetectionTimeout forKey:@"maxDetectionTimeout"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)cardIngestionRequestWithServerIdentifier:(id)a3 sessionToken:(id)a4 readerModeMetadata:(id)a5 maxDetectionTimeout:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc_init(NFRemoteAdminCardIngestionRequest);
  [(NFRemoteAdminCardIngestionRequest *)v12 setServerIdentifier:v11];

  [(NFRemoteAdminCardIngestionRequest *)v12 setSessionToken:v10];
  [(NFRemoteAdminCardIngestionRequest *)v12 setMaxDetectionTimeout:a6];
  uint64_t v13 = objc_msgSend(v9, "NF_stringForKey:", @"redirectURI");
  v14 = [MEMORY[0x1E4F1CB10] URLWithString:v13];

  if (v14)
  {
    [(NFRemoteAdminCardIngestionRequest *)v12 setUri:v13];
    if (v9)
    {
LABEL_3:
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v9];
      [v15 removeObjectForKey:@"redirectURI"];
      goto LABEL_6;
    }
  }
  else
  {
    v16 = objc_opt_new();
    [(NFRemoteAdminCardIngestionRequest *)v12 setUri:v16];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = objc_opt_new();
LABEL_6:
  [(NFRemoteAdminCardIngestionRequest *)v12 setCardServiceInfo:v15];

  return v12;
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (void)setServerIdentifier:(id)a3
{
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSDictionary)cardServiceInfo
{
  return self->_cardServiceInfo;
}

- (void)setCardServiceInfo:(id)a3
{
}

- (unint64_t)maxDetectionTimeout
{
  return self->_maxDetectionTimeout;
}

- (void)setMaxDetectionTimeout:(unint64_t)a3
{
  self->_maxDetectionTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardServiceInfo, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
}

@end