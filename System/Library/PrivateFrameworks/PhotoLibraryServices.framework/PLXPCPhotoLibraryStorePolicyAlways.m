@interface PLXPCPhotoLibraryStorePolicyAlways
- (BOOL)shouldUseXPCStoreForDatabasePath:(id)a3 auditToken:(id *)a4;
@end

@implementation PLXPCPhotoLibraryStorePolicyAlways

- (BOOL)shouldUseXPCStoreForDatabasePath:(id)a3 auditToken:(id *)a4
{
  return 1;
}

@end