@interface ApplicationHandle
- (ApplicationHandle)initWithDownloadHandle:(id)a3 bundleIdentifier:(id)a4;
- (ApplicationHandle)initWithTransactionIdentifier:(int64_t)a3 downloadIdentifier:(int64_t)a4;
- (ApplicationHandle)initWithTransactionIdentifier:(int64_t)a3 downloadIdentifier:(int64_t)a4 bundleIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleID;
- (id)description;
- (unint64_t)hash;
@end

@implementation ApplicationHandle

- (ApplicationHandle)initWithTransactionIdentifier:(int64_t)a3 downloadIdentifier:(int64_t)a4
{
  return [(ApplicationHandle *)self initWithTransactionIdentifier:a3 downloadIdentifier:a4 bundleIdentifier:0];
}

- (ApplicationHandle)initWithDownloadHandle:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 transactionID];
  id v9 = [v7 downloadID];

  v10 = [(ApplicationHandle *)self initWithTransactionIdentifier:v8 downloadIdentifier:v9 bundleIdentifier:v6];
  return v10;
}

- (ApplicationHandle)initWithTransactionIdentifier:(int64_t)a3 downloadIdentifier:(int64_t)a4 bundleIdentifier:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ApplicationHandle;
  id v9 = [(DownloadHandle *)&v13 initWithTransactionIdentifier:a3 downloadIdentifier:a4];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    bundleID = v9->_bundleID;
    v9->_bundleID = v10;
  }
  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:@"(AH: T:%lld / D:%lld / B:%@)", [(DownloadHandle *)self transactionID], [(DownloadHandle *)self downloadID], self->_bundleID];
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)ApplicationHandle;
  unint64_t v3 = [(DownloadHandle *)&v5 hash];
  return [(NSString *)self->_bundleID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ApplicationHandle;
  if ([(DownloadHandle *)&v9 isEqual:v4])
  {
    bundleID = self->_bundleID;
    id v6 = [v4 bundleID];
    unsigned __int8 v7 = [(NSString *)bundleID isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
}

@end