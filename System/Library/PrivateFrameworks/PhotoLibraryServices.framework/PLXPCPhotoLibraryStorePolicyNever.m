@interface PLXPCPhotoLibraryStorePolicyNever
- (BOOL)shouldUseXPCStoreForDatabasePath:(id)a3 auditToken:(id *)a4;
@end

@implementation PLXPCPhotoLibraryStorePolicyNever

- (BOOL)shouldUseXPCStoreForDatabasePath:(id)a3 auditToken:(id *)a4
{
  return 0;
}

@end