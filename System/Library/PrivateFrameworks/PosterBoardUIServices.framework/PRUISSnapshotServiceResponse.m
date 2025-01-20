@interface PRUISSnapshotServiceResponse
+ (BOOL)supportsSecureCoding;
+ (id)errorResponseForRequest:(id)a3 error:(id)a4;
+ (id)snapshotResponseForRequest:(id)a3 snapshotBundle:(id)a4;
- (BSInvalidatable)sandboxExtensionToken;
- (NSError)error;
- (PRUISSnapshotServiceRequest)request;
- (PRUISSnapshotServiceResponse)initWithCoder:(id)a3;
- (PUIPosterSnapshotBundle)snapshotBundle;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRUISSnapshotServiceResponse

+ (id)snapshotResponseForRequest:(id)a3 snapshotBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  id v9 = v5;

  v10 = [v9 posterSnapshotRequest];
  v11 = [v10 settings];
  v12 = objc_msgSend(v11, "pui_posterContents");
  v13 = [v12 role];

  v14 = (void *)MEMORY[0x263F5F438];
  v15 = [v6 bundleURL];

  uint64_t v16 = [v14 temporaryPathForURL:v15 role:v13];
  v17 = (void *)v7[1];
  v7[1] = v16;

  return v7;
}

+ (id)errorResponseForRequest:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  id v9 = v5;

  v10 = (void *)v7[3];
  v7[3] = v6;

  return v7;
}

- (void)dealloc
{
  [(PFPosterPath *)self->_snapshotBundlePath invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRUISSnapshotServiceResponse;
  [(PRUISSnapshotServiceResponse *)&v3 dealloc];
}

- (PUIPosterSnapshotBundle)snapshotBundle
{
  if (self->_snapshotBundlePath)
  {
    id v3 = objc_alloc(MEMORY[0x263F5F5A8]);
    v4 = [(PFPosterPath *)self->_snapshotBundlePath contentsURL];
    id v5 = (void *)[v3 initWithURL:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (PUIPosterSnapshotBundle *)v5;
}

- (BSInvalidatable)sandboxExtensionToken
{
  return self->_snapshotBundlePath;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRUISSnapshotServiceResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRUISSnapshotServiceResponse;
  id v5 = [(PRUISSnapshotServiceResponse *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_request"];
    request = v5->_request;
    v5->_request = (PRUISSnapshotServiceRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_snapshotBundlePath"];
    snapshotBundlePath = v5->_snapshotBundlePath;
    v5->_snapshotBundlePath = (PFPosterPath *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  request = self->_request;
  id v5 = a3;
  [v5 encodeObject:request forKey:@"_request"];
  [v5 encodeObject:self->_error forKey:@"_error"];
  id v6 = [(PFPosterPath *)self->_snapshotBundlePath extendContentsReadAccessToAuditToken:0 error:0];
  [v5 encodeObject:v6 forKey:@"_snapshotBundlePath"];
}

- (PRUISSnapshotServiceRequest)request
{
  return self->_request;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_snapshotBundlePath, 0);
}

@end