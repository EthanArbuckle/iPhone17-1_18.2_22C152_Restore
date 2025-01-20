@interface ICModernSearchIndexerDataSource(App)
- (id)mainThreadContext;
@end

@implementation ICModernSearchIndexerDataSource(App)

- (id)mainThreadContext
{
  v0 = [MEMORY[0x263F5ACA0] sharedContext];
  v1 = [v0 managedObjectContext];

  return v1;
}

@end