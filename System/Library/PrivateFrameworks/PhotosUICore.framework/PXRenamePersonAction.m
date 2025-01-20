@interface PXRenamePersonAction
- (NSString)name;
- (NSString)originalName;
- (NSString)originalUri;
- (PHPerson)person;
- (PXRenamePersonAction)initWithPerson:(id)a3 name:(id)a4;
- (id)actionIdentifier;
- (id)localizedActionName;
- (void)_performChangeForUndo:(BOOL)a3 completion:(id)a4;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXRenamePersonAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalUri, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (NSString)originalUri
{
  return self->_originalUri;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (NSString)name
{
  return self->_name;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)_performChangeForUndo:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(PXRenamePersonAction *)self person];
  if (v4)
  {
    v8 = [(PXRenamePersonAction *)self originalName];
    uint64_t v9 = [(PXRenamePersonAction *)self originalUri];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [(PXRenamePersonAction *)self originalUri];
      uint64_t v12 = [v11 length];

      if (v12)
      {
        v13 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
        v26[0] = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

        v15 = +[PXPeopleUtilities sharedContactStore];
        v16 = [(PXRenamePersonAction *)self originalUri];
        uint64_t v25 = 0;
        v17 = [v15 unifiedContactWithIdentifier:v16 keysToFetch:v14 error:&v25];

        v18 = [[PXPeopleNameSelection alloc] initWithContact:v17];
        goto LABEL_7;
      }
    }
  }
  else
  {
    v8 = [(PXRenamePersonAction *)self name];
  }
  v18 = [[PXPeopleNameSelection alloc] initWithName:v8];
LABEL_7:
  v19 = +[PXPeopleBootstrapContext contextWithPerson:v7 type:1];
  [v19 setNameSelection:v18];
  [v19 setWantsMergeCandidateSuggestions:0];
  [v19 setWantsPostNaming:0];
  if ([v7 type] == -1) {
    [v19 setWantsToBeAddedToPeopleAlbum:1];
  }
  v20 = NSString;
  v21 = [MEMORY[0x1E4F28F80] processInfo];
  v22 = [v21 processName];
  v23 = [@"/Library/Caches/com.apple.xbs/Sources/Photos_UICore/workspaces/photosshared/PhotosUICore/PhotosUICore/ActionsCore/PXRenamePersonAction.m" lastPathComponent];
  v24 = [v20 stringWithFormat:@"%@:%@:%s:%d", v22, v23, "-[PXRenamePersonAction _performChangeForUndo:completion:]", 95];
  [v19 setCallerInfo:v24];

  +[PXPeopleBootstrap performBootstrapWithSourcePerson:v7 context:v19 synchronous:0 completion:v6];
}

- (void)performUndo:(id)a3
{
}

- (void)performAction:(id)a3
{
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(@"PXRenamePersonAction", @"PhotosUICore");
}

- (id)actionIdentifier
{
  return @"RenamePerson";
}

- (PXRenamePersonAction)initWithPerson:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 photoLibrary];
  v20.receiver = self;
  v20.super_class = (Class)PXRenamePersonAction;
  v10 = [(PXPhotosAction *)&v20 initWithPhotoLibrary:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    v11 = [v7 name];
    uint64_t v12 = [v11 copy];
    originalName = v10->_originalName;
    v10->_originalName = (NSString *)v12;

    v14 = [v7 personUri];
    uint64_t v15 = [v14 copy];
    originalUri = v10->_originalUri;
    v10->_originalUri = (NSString *)v15;

    uint64_t v17 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v17;
  }
  return v10;
}

@end