@interface TPSDaemonCLIHandler
+ (BOOL)run;
@end

@implementation TPSDaemonCLIHandler

+ (BOOL)run
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 stringForKey:@"listKVS"];
  id v4 = [v3 length];
  BOOL v5 = v4 != 0;
  if (v4)
  {
    v6 = +[TPSCloudController sharedInstance];
    v7 = [v6 _listDisplayContentIDs];
    NSLog(@"%@", v7);
  }
  v8 = [v2 stringForKey:@"clearKVS"];

  if ([v8 length])
  {
    v9 = +[TPSCloudController sharedInstance];
    [v9 _clearDisplayedContentIDs];

    BOOL v5 = 1;
  }

  return v5;
}

@end