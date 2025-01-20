@interface NSError
- (BOOL)isFromRequest;
- (NSDate)messageSent;
- (NSDictionary)persistentUserInfo;
- (unsigned)messageID;
@end

@implementation NSError

- (unsigned)messageID
{
  v2 = [(NSError *)self userInfo];
  v3 = [v2 objectForKey:@"NMSContext"];

  LOWORD(v2) = (unsigned __int16)[v3 messageID];
  return (unsigned __int16)v2;
}

- (NSDate)messageSent
{
  v2 = [(NSError *)self userInfo];
  v3 = [v2 objectForKey:@"NMSContext"];

  v4 = [v3 date];

  return (NSDate *)v4;
}

- (NSDictionary)persistentUserInfo
{
  v2 = [(NSError *)self userInfo];
  v3 = [v2 objectForKey:@"NMSContext"];

  v4 = [v3 userInfo];

  return (NSDictionary *)v4;
}

- (BOOL)isFromRequest
{
  v2 = [(NSError *)self userInfo];
  v3 = [v2 objectForKey:@"NMSContext"];

  LOBYTE(v2) = [v3 isFromRequest];
  return (char)v2;
}

@end