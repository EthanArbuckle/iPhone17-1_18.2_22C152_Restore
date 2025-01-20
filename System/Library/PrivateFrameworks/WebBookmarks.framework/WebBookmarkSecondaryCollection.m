@interface WebBookmarkSecondaryCollection
+ (id)_syncLockFileName;
- (BOOL)_primaryCollection;
- (id)initSecondarySafariBookmarkCollectionWithName:(id)a3;
@end

@implementation WebBookmarkSecondaryCollection

+ (id)_syncLockFileName
{
  return @"com.apple.SecondaryBookmarks.lock";
}

- (id)initSecondarySafariBookmarkCollectionWithName:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() safariDirectoryPath];
  v6 = [NSString stringWithFormat:@"%@.db", v4];

  v7 = [v5 stringByAppendingPathComponent:v6];
  v8 = [v7 stringByResolvingSymlinksInPath];

  v9 = [[WBCollectionConfiguration alloc] initWithCollectionType:0 databasePath:v8 readonly:0];
  v12.receiver = self;
  v12.super_class = (Class)WebBookmarkSecondaryCollection;
  v10 = [(WebBookmarkCollection *)&v12 initWithConfiguration:v9];

  return v10;
}

- (BOOL)_primaryCollection
{
  return 0;
}

@end