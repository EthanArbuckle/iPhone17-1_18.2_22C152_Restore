@interface SAPathInfo
+ (BOOL)supportsSecureCoding;
+ (id)pathInfoWithURL:(id)a3;
+ (id)pathInfoWithURL:(id)a3 bundleID:(id)a4;
+ (id)pathInfoWithURL:(id)a3 bundleID:(id)a4 exclusive:(BOOL)a5;
+ (id)pathInfoWithURL:(id)a3 exclusive:(BOOL)a4;
- (BOOL)exclusive;
- (NSString)bundleID;
- (NSURL)url;
- (SAPathInfo)initWithCoder:(id)a3;
- (SAPathInfo)initWithURL:(id)a3;
- (SAPathInfo)initWithURL:(id)a3 exclusive:(BOOL)a4;
- (SAPathInfo)initWithURL:(id)a3 exclusive:(BOOL)a4 bundleID:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setExclusive:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation SAPathInfo

- (SAPathInfo)initWithURL:(id)a3 exclusive:(BOOL)a4 bundleID:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SAPathInfo;
  v11 = [(SAPathInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    v12->_exclusive = a4;
    objc_storeStrong((id *)&v12->_bundleID, a5);
  }

  return v12;
}

- (SAPathInfo)initWithURL:(id)a3
{
  return [(SAPathInfo *)self initWithURL:a3 exclusive:1 bundleID:0];
}

- (SAPathInfo)initWithURL:(id)a3 exclusive:(BOOL)a4
{
  return [(SAPathInfo *)self initWithURL:a3 exclusive:a4 bundleID:0];
}

+ (id)pathInfoWithURL:(id)a3 exclusive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithURL:v6 exclusive:v4 bundleID:0];

  return v7;
}

+ (id)pathInfoWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4 exclusive:1 bundleID:0];

  return v5;
}

+ (id)pathInfoWithURL:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithURL:v7 exclusive:1 bundleID:v6];

  return v8;
}

+ (id)pathInfoWithURL:(id)a3 bundleID:(id)a4 exclusive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithURL:v9 exclusive:v5 bundleID:v8];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeBool:self->_exclusive forKey:@"exclusive"];
  [v5 encodeObject:self->_bundleID forKey:@"bundle"];
}

- (SAPathInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SAPathInfo;
  id v5 = [(SAPathInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v5->_exclusive = [v4 decodeBoolForKey:@"exclusive"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUrl:(id)a3
{
}

- (BOOL)exclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end