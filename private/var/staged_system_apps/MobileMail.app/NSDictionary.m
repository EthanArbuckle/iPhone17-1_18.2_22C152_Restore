@interface NSDictionary
- (BOOL)mf_isAMSTest;
- (NSString)mf_mailboxName;
- (NSString)mf_testName;
- (int)mf_iterations;
- (int)mf_maxScrollLength;
- (int)mf_messageCount;
- (int)mf_pages;
- (int)mf_scrollOffset;
- (int64_t)mf_testInterfaceOrientation;
@end

@implementation NSDictionary

- (NSString)mf_testName
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"testName"];
}

- (BOOL)mf_isAMSTest
{
  v2 = [(NSDictionary *)self mf_testName];
  unsigned __int8 v3 = [v2 containsString:@"AMS"];

  return v3;
}

- (NSString)mf_mailboxName
{
  return (NSString *)[(NSDictionary *)self objectForKeyedSubscript:@"mailboxName"];
}

- (int)mf_iterations
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"iterations"];
  int v3 = [v2 intValue];

  return v3;
}

- (int)mf_pages
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"pages"];
  int v3 = [v2 intValue];

  return v3;
}

- (int)mf_maxScrollLength
{
  int v3 = [(NSDictionary *)self objectForKeyedSubscript:@"maxScrollLength"];

  if (!v3) {
    return 10000;
  }
  v4 = [(NSDictionary *)self objectForKeyedSubscript:@"maxScrollLength"];
  int v5 = [v4 intValue];

  return v5;
}

- (int)mf_scrollOffset
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"offset"];
  int v3 = [v2 intValue];

  return v3;
}

- (int64_t)mf_testInterfaceOrientation
{
  v2 = [(NSDictionary *)self mf_testName];
  if (objc_msgSend(v2, "mf_containsSubstring:", @"Landscape")) {
    int64_t v3 = 3;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (int)mf_messageCount
{
  int64_t v3 = [(NSDictionary *)self objectForKeyedSubscript:@"messageCount"];

  if (v3)
  {
    v4 = [(NSDictionary *)self objectForKeyedSubscript:@"messageCount"];
    LODWORD(v3) = [v4 intValue];
  }
  return (int)v3;
}

@end