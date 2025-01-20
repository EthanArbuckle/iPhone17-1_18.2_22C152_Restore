@interface MICandidateContainer
- (BOOL)isAppleApp;
- (BOOL)isEqual:(id)a3;
- (MICandidateContainer)initWithContainerURL:(id)a3 identifier:(id)a4 metadata:(id)a5;
- (NSDictionary)metadata;
- (NSString)identifier;
- (NSURL)rootURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)estimatedSize;
- (unint64_t)hash;
@end

@implementation MICandidateContainer

- (MICandidateContainer)initWithContainerURL:(id)a3 identifier:(id)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MICandidateContainer;
  v12 = [(MICandidateContainer *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rootURL, a3);
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    metadata = v13->_metadata;
    v13->_metadata = (NSDictionary *)v16;
  }
  return v13;
}

- (int64_t)estimatedSize
{
  v3 = [(MICandidateContainer *)self metadata];
  v4 = [v3 objectForKeyedSubscript:@"StaticDiskUsage"];

  int64_t v5 = [v4 longLongValue];
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F6F5B8] defaultManager];
    v7 = [(MICandidateContainer *)self rootURL];
    int64_t v5 = [v6 diskUsageForURL:v7];
  }
  return v5;
}

- (BOOL)isAppleApp
{
  v2 = [(MICandidateContainer *)self identifier];
  char v3 = [v2 hasPrefix:@"com.apple."];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(MICandidateContainer *)self rootURL];
  v6 = [(MICandidateContainer *)self identifier];
  v7 = [(MICandidateContainer *)self metadata];
  v8 = (void *)[v4 initWithContainerURL:v5 identifier:v6 metadata:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MICandidateContainer *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      v6 = [(MICandidateContainer *)self rootURL];
      v7 = [(MICandidateContainer *)v5 rootURL];
      int v8 = [v6 isEqual:v7];

      if (v8
        && ([(MICandidateContainer *)self identifier],
            id v9 = objc_claimAutoreleasedReturnValue(),
            [(MICandidateContainer *)v5 identifier],
            id v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v9 isEqual:v10],
            v10,
            v9,
            v11))
      {
        v12 = [(MICandidateContainer *)self metadata];
        v13 = [(MICandidateContainer *)v5 metadata];
        char v14 = [v12 isEqual:v13];
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  char v3 = [(MICandidateContainer *)self rootURL];
  uint64_t v4 = [v3 hash];

  int64_t v5 = [(MICandidateContainer *)self identifier];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(MICandidateContainer *)self metadata];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSURL)rootURL
{
  return self->_rootURL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

@end