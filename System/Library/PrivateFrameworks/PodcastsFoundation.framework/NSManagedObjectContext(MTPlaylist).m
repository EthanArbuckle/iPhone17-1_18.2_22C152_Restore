@interface NSManagedObjectContext(MTPlaylist)
- (uint64_t)playlistForUuid:()MTPlaylist;
- (void)deletePlaylist:()MTPlaylist;
@end

@implementation NSManagedObjectContext(MTPlaylist)

- (uint64_t)playlistForUuid:()MTPlaylist
{
  return [a1 objectForUuid:a3 entityName:@"MTPlaylist"];
}

- (void)deletePlaylist:()MTPlaylist
{
  id v4 = a3;
  v5 = [v4 settings];
  v6 = (void *)[v5 copy];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__NSManagedObjectContext_MTPlaylist__deletePlaylist___block_invoke;
  v9[3] = &unk_1E5E61368;
  v9[4] = a1;
  [v6 enumerateObjectsUsingBlock:v9];
  v7 = [v4 defaultSettings];

  if (v7)
  {
    v8 = [v4 defaultSettings];
    [a1 deleteObject:v8];
  }
  [a1 deleteObject:v4];
}

@end