@interface UNMutableNotificationContent(ArgonSupport)
- (void)argon_setArtworkUsed:()ArgonSupport;
@end

@implementation UNMutableNotificationContent(ArgonSupport)

- (void)argon_setArtworkUsed:()ArgonSupport
{
  v5 = [a1 userInfo];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v11 = v8;

  v9 = [NSNumber numberWithInteger:a3];
  [v11 setObject:v9 forKey:@"argon_artworkUsed"];

  v10 = (void *)[v11 copy];
  [a1 setUserInfo:v10];
}

@end