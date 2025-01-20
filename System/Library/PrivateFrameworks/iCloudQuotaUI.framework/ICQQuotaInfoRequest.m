@interface ICQQuotaInfoRequest
+ (Class)responseClass;
- (ICQQuotaInfoRequest)initWithAccount:(id)a3 accountStore:(id)a4 detailed:(BOOL)a5;
- (id)urlRequest;
@end

@implementation ICQQuotaInfoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (ICQQuotaInfoRequest)initWithAccount:(id)a3 accountStore:(id)a4 detailed:(BOOL)a5
{
  v8 = @"quotaInfoURL";
  if (a5) {
    v8 = @"storageInfoURL";
  }
  v9 = v8;
  id v10 = a4;
  id v11 = a3;
  v12 = [v11 propertiesForDataclass:@"com.apple.Dataclass.Quota"];
  v13 = [v12 objectForKey:v9];

  uint64_t v14 = *MEMORY[0x263F25B78];
  v15 = objc_msgSend(v11, "aa_personID");
  v16 = [v13 stringByReplacingOccurrencesOfString:v14 withString:v15];

  uint64_t v17 = *MEMORY[0x263F25B90];
  v18 = [MEMORY[0x263F25820] udid];
  v19 = [v16 stringByReplacingOccurrencesOfString:v17 withString:v18];

  v20 = [v19 stringByAddingPercentEscapesUsingEncoding:4];
  v23.receiver = self;
  v23.super_class = (Class)ICQQuotaInfoRequest;
  v21 = [(ICQUsageQuotaRequest *)&v23 initWithAccount:v11 accountStore:v10 URLString:v20];

  return v21;
}

- (id)urlRequest
{
  v4.receiver = self;
  v4.super_class = (Class)ICQQuotaInfoRequest;
  v2 = [(ICQUsageQuotaRequest *)&v4 urlRequest];
  [v2 setHTTPMethod:@"GET"];
  return v2;
}

@end