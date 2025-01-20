@interface KTOptInStateRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchCloudKit;
- (BOOL)sync;
- (KTOptInStateRequest)initWithApplication:(id)a3;
- (KTOptInStateRequest)initWithCoder:(id)a3;
- (NSString)application;
- (NSString)uri;
- (void)encodeWithCoder:(id)a3;
- (void)setApplication:(id)a3;
- (void)setFetchCloudKit:(BOOL)a3;
- (void)setSync:(BOOL)a3;
- (void)setUri:(id)a3;
@end

@implementation KTOptInStateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTOptInStateRequest)initWithApplication:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTOptInStateRequest;
  v5 = [(KTOptInStateRequest *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(KTOptInStateRequest *)v5 setApplication:v4];
    v7 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(KTOptInStateRequest *)self application];
  [v7 encodeObject:v4 forKey:@"application"];

  objc_msgSend(v7, "encodeBool:forKey:", -[KTOptInStateRequest fetchCloudKit](self, "fetchCloudKit"), @"fetchCloudKit");
  objc_msgSend(v7, "encodeBool:forKey:", -[KTOptInStateRequest sync](self, "sync"), @"synchronous");
  v5 = [(KTOptInStateRequest *)self uri];

  if (v5)
  {
    v6 = [(KTOptInStateRequest *)self uri];
    [v7 encodeObject:v6 forKey:@"uri"];
  }
}

- (KTOptInStateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uri"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"application"];
  if (v6
    && (v10.receiver = self,
        v10.super_class = (Class)KTOptInStateRequest,
        id v7 = [(KTOptInStateRequest *)&v10 init],
        (self = v7) != 0))
  {
    [(KTOptInStateRequest *)v7 setApplication:v6];
    [(KTOptInStateRequest *)self setUri:v5];
    -[KTOptInStateRequest setFetchCloudKit:](self, "setFetchCloudKit:", [v4 decodeBoolForKey:@"fetchCloudKit"]);
    -[KTOptInStateRequest setSync:](self, "setSync:", [v4 decodeBoolForKey:@"synchronous"]);
    self = self;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)fetchCloudKit
{
  return self->_fetchCloudKit;
}

- (void)setFetchCloudKit:(BOOL)a3
{
  self->_fetchCloudKit = a3;
}

- (BOOL)sync
{
  return self->_sync;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUri:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uri, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end