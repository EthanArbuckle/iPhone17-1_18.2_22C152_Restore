@interface UCArchiver
- (NSString)leaf;
- (NSURL)baseURL;
- (NSUUID)uuid;
- (UCArchiver)initWithURL:(id)a3 typeUUID:(id)a4;
- (void)archiveURLWithCompletion:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setLeaf:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWriter:(void *)a3;
- (void)writer;
@end

@implementation UCArchiver

- (UCArchiver)initWithURL:(id)a3 typeUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UCArchiver;
  v8 = [(UCArchiver *)&v13 init];
  if (v8)
  {
    v9 = [v6 lastPathComponent];
    [(UCArchiver *)v8 setLeaf:v9];

    v10 = [v6 URLByDeletingLastPathComponent];
    [(UCArchiver *)v8 setBaseURL:v10];

    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
    [(UCArchiver *)v8 setUuid:v11];
  }
  return v8;
}

- (void)archiveURLWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100064DF8;
  v7[3] = &unk_1000C5328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)leaf
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLeaf:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
}

- (void)writer
{
  return self->_writer;
}

- (void)setWriter:(void *)a3
{
  self->_writer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_leaf, 0);

  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end