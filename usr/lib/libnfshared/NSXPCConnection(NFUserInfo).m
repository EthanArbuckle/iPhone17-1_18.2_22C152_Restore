@interface NSXPCConnection(NFUserInfo)
- (uint64_t)NF_fdPresentmentIntentSuppressionHolder;
- (uint64_t)NF_presentmentIntentSuppressionHolder;
- (void)NF_clearFDPresentmentIntentSuppressionHolder;
- (void)NF_clearPresentmentIntentSuppressionHolder;
- (void)NF_setFDPresentmentIntentSuppressionHolder;
- (void)NF_setPresentmentIntentSuppressionHolder;
@end

@implementation NSXPCConnection(NFUserInfo)

- (uint64_t)NF_presentmentIntentSuppressionHolder
{
  v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"PresentmentIntentSuppressionHolder"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (void)NF_setPresentmentIntentSuppressionHolder
{
  id v1 = [a1 userInfo];
  [v1 setObject:MEMORY[0x1E4F1CC38] forKey:@"PresentmentIntentSuppressionHolder"];
}

- (void)NF_clearPresentmentIntentSuppressionHolder
{
  id v1 = [a1 userInfo];
  [v1 removeObjectForKey:@"PresentmentIntentSuppressionHolder"];
}

- (uint64_t)NF_fdPresentmentIntentSuppressionHolder
{
  id v1 = [a1 userInfo];
  v2 = [v1 objectForKeyedSubscript:@"FDPresentmentIntentSuppressionHolder"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (void)NF_setFDPresentmentIntentSuppressionHolder
{
  id v1 = [a1 userInfo];
  [v1 setObject:MEMORY[0x1E4F1CC38] forKey:@"FDPresentmentIntentSuppressionHolder"];
}

- (void)NF_clearFDPresentmentIntentSuppressionHolder
{
  id v1 = [a1 userInfo];
  [v1 removeObjectForKey:@"FDPresentmentIntentSuppressionHolder"];
}

@end