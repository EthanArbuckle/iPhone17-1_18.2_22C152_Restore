@interface VUILibraryMenuDataSourceFactory
+ (id)_validCategoriesForHomeSharing;
+ (id)_validCategoriesForPlatform;
+ (id)libraryMenuDataSourceForFamilyMember:(id)a3;
+ (id)libraryMenuDataSourceForMediaLibrary:(id)a3;
@end

@implementation VUILibraryMenuDataSourceFactory

+ (id)libraryMenuDataSourceForMediaLibrary:(id)a3
{
  id v3 = a3;
  if ([v3 type]) {
    +[VUILibraryMenuDataSourceFactory _validCategoriesForHomeSharing];
  }
  else {
  v4 = +[VUILibraryMenuDataSourceFactory _validCategoriesForPlatform];
  }
  v5 = [[VUIMPMenuDataSource alloc] initWithValidCategories:v4];
  [(VUIMPMenuDataSource *)v5 setMediaLibrary:v3];

  return v5;
}

+ (id)libraryMenuDataSourceForFamilyMember:(id)a3
{
  id v3 = [a3 memberIdentifier];
  v4 = [v3 stringValue];

  if (v4)
  {
    v5 = +[VUILibraryMenuDataSourceFactory _validCategoriesForPlatform];
    v6 = (void *)[v5 mutableCopy];

    [v6 removeObject:&unk_1F3F3CFC8];
    v7 = [VUIFamilySharingMenuDataSource alloc];
    v8 = (void *)[v6 copy];
    v9 = [(VUIFamilySharingMenuDataSource *)v7 initWithValidCategories:v8];

    [(VUIFamilySharingMenuDataSource *)v9 setOwnerIdentifier:v4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_validCategoriesForPlatform
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1F3F3CFE0, &unk_1F3F3CFF8, &unk_1F3F3D010, &unk_1F3F3D028, &unk_1F3F3D040, &unk_1F3F3D058, 0);
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1F3F3CFE0, &unk_1F3F3CFF8, &unk_1F3F3D010, &unk_1F3F3D028, &unk_1F3F3D040, &unk_1F3F3D070, &unk_1F3F3D088, &unk_1F3F3CFC8, &unk_1F3F3D058, 0);
  }
  else
  {
    v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7) {
      goto LABEL_6;
    }
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1F3F3CFF8, &unk_1F3F3D010, &unk_1F3F3D070, &unk_1F3F3D088, &unk_1F3F3CFC8, &unk_1F3F3D058, 0, v11, v12, v13);
  }
  v8 = (void *)v5;

  v2 = v8;
LABEL_6:
  [v2 addObject:&unk_1F3F3D0A0];
  v9 = (void *)[v2 copy];

  return v9;
}

+ (id)_validCategoriesForHomeSharing
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3F3CFF8, &unk_1F3F3D010, &unk_1F3F3D070, &unk_1F3F3D058, 0);
}

@end