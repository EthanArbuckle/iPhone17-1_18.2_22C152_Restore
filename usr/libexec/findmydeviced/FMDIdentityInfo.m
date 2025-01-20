@interface FMDIdentityInfo
- (FMDIdentityInfo)initWithDictionary:(id)a3;
- (FMDIdentityInfo)initWithVersion:(int64_t)a3;
- (FMDIdentityInfo)initWithVersion:(int64_t)a3 timeoutIntervalInSec:(int64_t)a4;
- (FMDIdentityInfo)initWithVersion:(int64_t)a3 timeoutIntervalInSec:(int64_t)a4 commandID:(id)a5;
- (FMDIdentityInfo)initWithVersion:(int64_t)a3 timeoutIntervalInSec:(int64_t)a4 commandID:(id)a5 identityURL:(id)a6;
- (NSDictionary)dictionaryValue;
- (NSString)commandID;
- (NSString)identityURL;
- (int64_t)timeoutIntervalInSec;
- (int64_t)version;
@end

@implementation FMDIdentityInfo

- (FMDIdentityInfo)initWithVersion:(int64_t)a3
{
  return [(FMDIdentityInfo *)self initWithVersion:a3 timeoutIntervalInSec:60];
}

- (FMDIdentityInfo)initWithVersion:(int64_t)a3 timeoutIntervalInSec:(int64_t)a4
{
  return [(FMDIdentityInfo *)self initWithVersion:a3 timeoutIntervalInSec:a4 commandID:0];
}

- (FMDIdentityInfo)initWithVersion:(int64_t)a3 timeoutIntervalInSec:(int64_t)a4 commandID:(id)a5
{
  return [(FMDIdentityInfo *)self initWithVersion:a3 timeoutIntervalInSec:a4 commandID:a5 identityURL:0];
}

- (FMDIdentityInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"version"];
  id v6 = [v5 integerValue];
  v7 = [v4 objectForKeyedSubscript:@"timeout"];
  id v8 = [v7 integerValue];
  v9 = [v4 objectForKeyedSubscript:@"commandID"];
  v10 = [v4 objectForKeyedSubscript:@"identityURL"];

  v11 = [(FMDIdentityInfo *)self initWithVersion:v6 timeoutIntervalInSec:v8 commandID:v9 identityURL:v10];
  return v11;
}

- (FMDIdentityInfo)initWithVersion:(int64_t)a3 timeoutIntervalInSec:(int64_t)a4 commandID:(id)a5 identityURL:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMDIdentityInfo;
  v13 = [(FMDIdentityInfo *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_version = a3;
    v13->_timeoutIntervalInSec = a4;
    objc_storeStrong((id *)&v13->_commandID, a5);
    objc_storeStrong((id *)&v14->_identityURL, a6);
  }

  return v14;
}

- (NSDictionary)dictionaryValue
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithInteger:[(FMDIdentityInfo *)self version]];
  [v3 setObject:v4 forKeyedSubscript:@"version"];

  v5 = +[NSNumber numberWithInteger:[(FMDIdentityInfo *)self timeoutIntervalInSec]];
  [v3 setObject:v5 forKeyedSubscript:@"timeout"];

  id v6 = [(FMDIdentityInfo *)self commandID];

  if (v6)
  {
    v7 = [(FMDIdentityInfo *)self commandID];
    [v3 setObject:v7 forKeyedSubscript:@"commandID"];
  }
  id v8 = [(FMDIdentityInfo *)self identityURL];

  if (v8)
  {
    v9 = [(FMDIdentityInfo *)self identityURL];
    [v3 setObject:v9 forKeyedSubscript:@"identityURL"];
  }
  id v10 = [v3 copy];

  return (NSDictionary *)v10;
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)timeoutIntervalInSec
{
  return self->_timeoutIntervalInSec;
}

- (NSString)commandID
{
  return self->_commandID;
}

- (NSString)identityURL
{
  return self->_identityURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityURL, 0);

  objc_storeStrong((id *)&self->_commandID, 0);
}

@end