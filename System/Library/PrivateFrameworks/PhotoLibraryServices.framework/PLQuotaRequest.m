@interface PLQuotaRequest
- (PLQuotaRequest)initWithURLString:(id)a3 authToken:(id)a4 personID:(id)a5;
- (id)urlRequest;
@end

@implementation PLQuotaRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
}

- (id)urlRequest
{
  v18.receiver = self;
  v18.super_class = (Class)PLQuotaRequest;
  v3 = [(AARequest *)&v18 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  v17 = [NSString stringWithFormat:@"%@:%@", self->_personID, self->_authToken];
  v5 = [v17 dataUsingEncoding:4];
  v6 = [v5 base64EncodedStringWithOptions:0];

  v7 = [NSString stringWithFormat:@"Basic %@", v6];
  [v4 setValue:v7 forHTTPHeaderField:@"Authorization"];
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v9 infoDictionary];

  v11 = [v8 objectForKey:@"ProductVersion"];
  v12 = [v10 objectForKey:@"CFBundleName"];
  v13 = [v10 objectForKey:@"CFBundleVersion"];
  v14 = [NSString stringWithFormat:@"%@/%@ iOS/%@", v12, v13, v11];
  [v4 setValue:v14 forHTTPHeaderField:@"User-agent"];
  v15 = [MEMORY[0x1E4F4BFA0] udid];
  [v4 setValue:v15 forHTTPHeaderField:@"X-Client-UDID"];

  return v4;
}

- (PLQuotaRequest)initWithURLString:(id)a3 authToken:(id)a4 personID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLQuotaRequest;
  v10 = [(AARequest *)&v16 initWithURLString:a3];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    authToken = v10->_authToken;
    v10->_authToken = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    personID = v10->_personID;
    v10->_personID = (NSString *)v13;
  }
  return v10;
}

@end