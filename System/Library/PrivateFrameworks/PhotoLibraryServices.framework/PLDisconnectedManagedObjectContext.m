@interface PLDisconnectedManagedObjectContext
+ (BOOL)canMergeRemoteChanges;
+ (BOOL)shouldHavePhotoLibrary;
- (BOOL)isDatabaseCreationContext;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PLDisconnectedManagedObjectContext

- (void)setPhotoLibrary:(id)a3
{
  if (a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLManagedObjectContext.m" lineNumber:1764 description:@"PLDisconnectedManagedObjectContext can't be associated with a photoLibrary"];
  }
}

- (BOOL)isDatabaseCreationContext
{
  return 1;
}

+ (BOOL)shouldHavePhotoLibrary
{
  return 0;
}

+ (BOOL)canMergeRemoteChanges
{
  return 0;
}

@end