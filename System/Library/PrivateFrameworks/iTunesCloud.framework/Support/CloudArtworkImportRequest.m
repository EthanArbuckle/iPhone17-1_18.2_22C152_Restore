@interface CloudArtworkImportRequest
- (BOOL)allowsCellularData;
- (CloudArtworkImportRequest)init;
- (CloudArtworkImportRequest)initWithClientIdentity:(id)a3;
- (NSString)token;
- (OS_tcc_identity)clientIdentity;
- (id)completionHandler;
- (int64_t)artworkType;
- (unint64_t)cloudID;
- (unsigned)mediaType;
- (void)setAllowsCellularData:(BOOL)a3;
- (void)setArtworkType:(int64_t)a3;
- (void)setClientIdentity:(id)a3;
- (void)setCloudID:(unint64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setMediaType:(unsigned int)a3;
- (void)setToken:(id)a3;
@end

@implementation CloudArtworkImportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

- (void)setClientIdentity:(id)a3
{
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setAllowsCellularData:(BOOL)a3
{
  self->_allowsCellularData = a3;
}

- (BOOL)allowsCellularData
{
  return self->_allowsCellularData;
}

- (void)setArtworkType:(int64_t)a3
{
  self->_artworkType = a3;
}

- (int64_t)artworkType
{
  return self->_artworkType;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setToken:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setCloudID:(unint64_t)a3
{
  self->_cloudID = a3;
}

- (unint64_t)cloudID
{
  return self->_cloudID;
}

- (CloudArtworkImportRequest)initWithClientIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CloudArtworkImportRequest;
  v6 = [(CloudArtworkImportRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientIdentity, a3);
    v7->_allowsCellularData = 1;
  }

  return v7;
}

- (CloudArtworkImportRequest)init
{
  v3 = MSVTCCIdentityForCurrentProcess();
  v4 = [(CloudArtworkImportRequest *)self initWithClientIdentity:v3];

  return v4;
}

@end