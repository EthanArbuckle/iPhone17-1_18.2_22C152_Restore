@interface ABSFavoritesSyncManager
- (void)deleteReality;
- (void)deleteShadow;
@end

@implementation ABSFavoritesSyncManager

- (void)deleteReality
{
  [(ABSFavoritesSyncManager *)self deleteShadow];
  id v2 = +[NSFileManager defaultManager];
  [v2 removeItemAtPath:off_100069978 error:0];
}

- (void)deleteShadow
{
  id v3 = +[ABSyncInterface sharedInstance];
  id v2 = [v3 serverState];
  [v2 deleteKey:@"com.apple.absd.favorites.sha"];
}

@end