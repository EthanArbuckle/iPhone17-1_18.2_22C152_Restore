@interface WFCoreDataShortcutBookmark
+ (id)fetchRequest;
- (id)descriptor;
@end

@implementation WFCoreDataShortcutBookmark

- (id)descriptor
{
  v3 = [WFShortcutBookmarksDescriptor alloc];
  v4 = [(WFCoreDataShortcutBookmark *)self identifier];
  v5 = [(WFCoreDataShortcutBookmark *)self path];
  v6 = [(WFCoreDataShortcutBookmark *)self bookmarkData];
  v7 = [(WFShortcutBookmarksDescriptor *)v3 initWithWorkflowID:v4 path:v5 bookmarkData:v6];

  return v7;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ShortcutBookmark"];
}

@end